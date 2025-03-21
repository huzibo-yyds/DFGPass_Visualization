from graphviz import Source

# Source.from_file('HLS_output/dot/icrc1/HLS_STGraph.dot').view()
# Source.from_file('HLS_output/dot/icrc1/HLS_STGraph.dot').render("output_graph", format="png", cleanup=True)

import os

def convert_dot_to_png(directory):
  """
  递归遍历目录，将所有 .dot 文件转换为同名的 .png 文件
  :param directory: 目标目录路径
  """
  for root, dirs, files in os.walk(directory):
    for file in files:
      if file.endswith(".dot"):
        dot_path = os.path.join(root, file)  # 获取 .dot 文件的完整路径
        png_path = os.path.splitext(dot_path)[0] + ".png"  # 生成对应的 .png 文件路径

        print(f"Converting {dot_path} to {png_path}...")

        # 使用 graphviz 渲染 .dot 文件为 .png
        try:
          with open(dot_path, "r", encoding="utf-8") as f:
            dot_content = f.read()
          graph = Source(dot_content)
          graph.render(filename=os.path.splitext(png_path)[0], format="png", cleanup=True)
        except Exception as e:
          print(f"Failed to convert {dot_path}: {e}")

# 示例调用
target_directory = "./"  # 替换为你的目标目录路径
convert_dot_to_png(target_directory)
