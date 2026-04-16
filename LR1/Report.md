# Отчёт по лабораторной работе №1
## Дисциплина: «Проектирование телекоммуникационных систем на программируемых логических интегральных схемах»
## Название: «Сдвиговый регистр и LFSR»

**Выполнил:**  
Студент группы ИКТ-43
Гайдуков А. М. 

---

## 1. Ход лабораторной работы

Результат работы кода на ПЛИС, с помощью тригера был найден начальный момент для сравнения, когда только один бит равен "1". 
![](LSFR1.png)  

Второе состояние, после начального 
![](LSFR2.png)  

Третье состояние 
![](LSFR3.png)  

# Код
С помощью кода был получен полином по варианту: [26, 22, 21, 16, 12, 11, 10, 8, 5, 4, 3, 1]
```python
import pylfsr as pyl

var = 4 
poly = list(list(pyl.get_fpolyList(m=26)) + list(pyl.get_fpolyList(m=27)) + list(pyl.get_fpolyList(m=28)) + list(pyl.get_fpolyList(m=29)))[var]
print("Полином:", poly)
```

Блок верхнего уровня, который объеденяет LFSR, VIO и IL:

```verilog
module top(
    input wire clk_in
);
    wire rst;
    wire en;
    wire out_o;
    wire [25:0] registr_state;

    lfsr u_lfsr (
        .clk(clk_in),
        .rst(rst),
        .en(en),
        .out_o(out_o),
        .registr(registr_state)
    );

    vio_0 u_vio (
        .clk(clk_in),
        .probe_out0(rst), 
        .probe_out1(en)   
    );

    ila_0 u_ila (
        .clk(clk_in),
        .probe0(rst),           
        .probe1(en),            
        .probe2(out_o),         
        .probe3(registr_state)  
    );

endmodule
```

Блок LFSR, который реализует лвсю логику работы:

```verilog
module lfsr (
    input  wire        clk,
    input  wire        rst,
    input  wire        en,
    output wire        out_o,
    output wire [25:0] registr 
);
    reg [25:0] shift_reg;
    wire fb = shift_reg[25] ^ shift_reg[21] ^ shift_reg[20] ^ 
              shift_reg[15] ^ shift_reg[11] ^ shift_reg[10] ^ 
              shift_reg[9]  ^ shift_reg[7]  ^ shift_reg[4]  ^ 
              shift_reg[3]  ^ shift_reg[2]  ^ shift_reg[0];

    assign out_o = shift_reg[25];
    assign registr = shift_reg;

    always @(posedge clk) begin
        if (rst) 
            shift_reg <= 26'd1; 
        else if (en) 
            shift_reg <= {shift_reg[24:0], fb}; 
    end
endmodule
```


Верификация проводилась путем сравнения данных, полученных с ПЛИС, с эталонной  моделью на python.

```python
import numpy as np
from pylfsr import LFSR

def verify_lfsr():
    poly = [26, 22, 21, 16, 12, 11, 10, 8, 5, 4, 3, 1]
    L = LFSR(fpoly = poly, initstate = [1] + [0]*25, conf = 'fibonacci')

    try:
        verilog_data = np.loadtxt('96.txt', dtype=int)
        gold_data = L.runKCycle(len(verilog_data))

        if np.array_equal(verilog_data, gold_data):
            print("Последовательности совпадают")
        else:
            diff = np.where(verilog_data != gold_data)[0][0]
            print(f"Ошибка в бите {diff}: Verilog {verilog_data[diff]}, Python {gold_data[diff]}")
            
    except Exception as e:
        print(f"Ошибка: {e}")

if __name__ == "__main__":
    verify_lfsr()
```

[Файл с 96 выходными битами, полученный на ПЛИС](LR2/96.txt)

![](python.png) 

Идеализированная модель и полученные значения после симуляции на ПЛИС полностью совпадают




