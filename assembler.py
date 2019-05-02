import sys

dic_instrucoes = {
    'nop':           [0x01, []], 'iadd':          [0x02, []], 'isub':          [0x05, []], 'iand':          [0x08, []],
    'ior':           [0x0b, []], 'dup':           [0x0e, []], 'pop':           [0x10, []], 'swap':          [0x13, []],
   
    'bipush':        [0x19, ['byte']],            'iload':         [0x1c, ['varNum']],     'istore':        [0x22, ['new_varNum']],
    'wide':          [0x28, []],                  'ldc_w':         [0x32, ['index']],      'iinc':          [0x36, ['varNum', 'const']],
    'goto':          [0x3c, ['offset']],          'iflt':          [0x43, ['offset']],     'ifeq':          [0x47, ['offset']],
    'if_icmpeq':     [0x4b, ['offset']],          'invokevirtual': [0x55, ['disp']],       'ireturn':       [0x6b, []]
}

dic_labels = {}
dic_variaveis = {}
lista_bytes = []
tel
a_erro = ""


contador_linha = 0
contador_byte = 0

proxima_variavel = 0

def add_erro(tipo_erro, linha_erro):
    global contador_linha

    return ("Há um erro na linha " + str(linha_erro) + ":" + tipo_erro)

def checar_comentario(string):
    try:
        return string.startswith("//")
    except TypeError:
        raise TypeError

def checar_label(string):
    global contador_linha, dic_variaveis, dic_instrucoes

    if string in dic_variaveis.keys():
        add_erro("Label com mesmo número de uma variável", contador_linha)
        return False
    else:
        return string not in dic_instrucoes.keys() and string.replace("_", "").isalnum()

def add_label(label):
    global contador_byte, dic_labels

    dic_labels[label] = contador_byte + 1






def main():
    global contador_linha

    try:
        arq_asm = open(sys.argv[1], 'r')
    except IndexError:
        print("Não há arquivo para abrir")
        raise IndexError
    except IOError:
        print("Não é possível abrir o arquivo")
        raise IOError

    for linha in arq_asm:
        linha_lista = linha.split()

        try:
            if checar_label(linha_lista[0]):
                add_label(linha_lista[0])
                del linha_lista[0]
        except IndexError:
            pass

        if linha_lista != [] and not checar_comentario(linha_lista[0])
            instrucao = linha_lista[0]

            
    



