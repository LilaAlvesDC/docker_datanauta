import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

# Cargar datos
df = pd.read_csv("data\data_cleaned_2021.csv")

# Visualizar datos
st.title("Mi dashboard de Streamlit")
st.write(df)

# Generar gráfico
st.subheader("Gráfico")
fig, ax = plt.subplots()
ax.plot(df["Fecha"], df["Valor"])
st.pyplot(fig)
