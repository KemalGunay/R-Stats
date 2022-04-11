{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "d9e167ef",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:21.901434Z",
     "iopub.status.busy": "2022-04-11T05:28:21.898357Z",
     "iopub.status.idle": "2022-04-11T05:28:23.580930Z",
     "shell.execute_reply": "2022-04-11T05:28:23.579254Z"
    },
    "papermill": {
     "duration": 1.733705,
     "end_time": "2022-04-11T05:28:23.581097",
     "exception": false,
     "start_time": "2022-04-11T05:28:21.847392",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.5     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.5     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.7\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.0.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "\n",
      "Attaching package: ‘rstatix’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:stats’:\n",
      "\n",
      "    filter\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Libraries\n",
    "library(tidyverse) # veri işleme ve görselleştirme için\n",
    "library(ggpubr) # kolayca yayına hazır grafikler oluşturma\n",
    "library(rstatix) # kolay istatistiksel analizler için pipeline R işlevleri sağlar"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "62dd65bd",
   "metadata": {
    "papermill": {
     "duration": 0.043748,
     "end_time": "2022-04-11T05:28:23.670693",
     "exception": false,
     "start_time": "2022-04-11T05:28:23.626945",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Veri Oluşturma"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "1c3f06a2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:23.791720Z",
     "iopub.status.busy": "2022-04-11T05:28:23.761646Z",
     "iopub.status.idle": "2022-04-11T05:28:23.835527Z",
     "shell.execute_reply": "2022-04-11T05:28:23.833811Z"
    },
    "papermill": {
     "duration": 0.12145,
     "end_time": "2022-04-11T05:28:23.835690",
     "exception": false,
     "start_time": "2022-04-11T05:28:23.714240",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 30 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>gruplar</th><th scope=col>dil_puanlari</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>birinci_grup</td><td>73</td></tr>\n",
       "\t<tr><td>birinci_grup</td><td>79</td></tr>\n",
       "\t<tr><td>birinci_grup</td><td>78</td></tr>\n",
       "\t<tr><td>birinci_grup</td><td>84</td></tr>\n",
       "\t<tr><td>birinci_grup</td><td>64</td></tr>\n",
       "\t<tr><td>birinci_grup</td><td>94</td></tr>\n",
       "\t<tr><td>birinci_grup</td><td>67</td></tr>\n",
       "\t<tr><td>birinci_grup</td><td>85</td></tr>\n",
       "\t<tr><td>birinci_grup</td><td>69</td></tr>\n",
       "\t<tr><td>birinci_grup</td><td>95</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>67</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>73</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>85</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>84</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>83</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>66</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>80</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>74</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>60</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>68</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>99</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>84</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>94</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>66</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>95</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>87</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>97</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>84</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>63</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>90</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 30 × 2\n",
       "\\begin{tabular}{ll}\n",
       " gruplar & dil\\_puanlari\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t birinci\\_grup & 73\\\\\n",
       "\t birinci\\_grup & 79\\\\\n",
       "\t birinci\\_grup & 78\\\\\n",
       "\t birinci\\_grup & 84\\\\\n",
       "\t birinci\\_grup & 64\\\\\n",
       "\t birinci\\_grup & 94\\\\\n",
       "\t birinci\\_grup & 67\\\\\n",
       "\t birinci\\_grup & 85\\\\\n",
       "\t birinci\\_grup & 69\\\\\n",
       "\t birinci\\_grup & 95\\\\\n",
       "\t ikinci\\_grup  & 67\\\\\n",
       "\t ikinci\\_grup  & 73\\\\\n",
       "\t ikinci\\_grup  & 85\\\\\n",
       "\t ikinci\\_grup  & 84\\\\\n",
       "\t ikinci\\_grup  & 83\\\\\n",
       "\t ikinci\\_grup  & 66\\\\\n",
       "\t ikinci\\_grup  & 80\\\\\n",
       "\t ikinci\\_grup  & 74\\\\\n",
       "\t ikinci\\_grup  & 60\\\\\n",
       "\t ikinci\\_grup  & 68\\\\\n",
       "\t ucuncu\\_grup  & 99\\\\\n",
       "\t ucuncu\\_grup  & 84\\\\\n",
       "\t ucuncu\\_grup  & 94\\\\\n",
       "\t ucuncu\\_grup  & 66\\\\\n",
       "\t ucuncu\\_grup  & 95\\\\\n",
       "\t ucuncu\\_grup  & 87\\\\\n",
       "\t ucuncu\\_grup  & 97\\\\\n",
       "\t ucuncu\\_grup  & 84\\\\\n",
       "\t ucuncu\\_grup  & 63\\\\\n",
       "\t ucuncu\\_grup  & 90\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 30 × 2\n",
       "\n",
       "| gruplar &lt;chr&gt; | dil_puanlari &lt;int&gt; |\n",
       "|---|---|\n",
       "| birinci_grup | 73 |\n",
       "| birinci_grup | 79 |\n",
       "| birinci_grup | 78 |\n",
       "| birinci_grup | 84 |\n",
       "| birinci_grup | 64 |\n",
       "| birinci_grup | 94 |\n",
       "| birinci_grup | 67 |\n",
       "| birinci_grup | 85 |\n",
       "| birinci_grup | 69 |\n",
       "| birinci_grup | 95 |\n",
       "| ikinci_grup  | 67 |\n",
       "| ikinci_grup  | 73 |\n",
       "| ikinci_grup  | 85 |\n",
       "| ikinci_grup  | 84 |\n",
       "| ikinci_grup  | 83 |\n",
       "| ikinci_grup  | 66 |\n",
       "| ikinci_grup  | 80 |\n",
       "| ikinci_grup  | 74 |\n",
       "| ikinci_grup  | 60 |\n",
       "| ikinci_grup  | 68 |\n",
       "| ucuncu_grup  | 99 |\n",
       "| ucuncu_grup  | 84 |\n",
       "| ucuncu_grup  | 94 |\n",
       "| ucuncu_grup  | 66 |\n",
       "| ucuncu_grup  | 95 |\n",
       "| ucuncu_grup  | 87 |\n",
       "| ucuncu_grup  | 97 |\n",
       "| ucuncu_grup  | 84 |\n",
       "| ucuncu_grup  | 63 |\n",
       "| ucuncu_grup  | 90 |\n",
       "\n"
      ],
      "text/plain": [
       "   gruplar      dil_puanlari\n",
       "1  birinci_grup 73          \n",
       "2  birinci_grup 79          \n",
       "3  birinci_grup 78          \n",
       "4  birinci_grup 84          \n",
       "5  birinci_grup 64          \n",
       "6  birinci_grup 94          \n",
       "7  birinci_grup 67          \n",
       "8  birinci_grup 85          \n",
       "9  birinci_grup 69          \n",
       "10 birinci_grup 95          \n",
       "11 ikinci_grup  67          \n",
       "12 ikinci_grup  73          \n",
       "13 ikinci_grup  85          \n",
       "14 ikinci_grup  84          \n",
       "15 ikinci_grup  83          \n",
       "16 ikinci_grup  66          \n",
       "17 ikinci_grup  80          \n",
       "18 ikinci_grup  74          \n",
       "19 ikinci_grup  60          \n",
       "20 ikinci_grup  68          \n",
       "21 ucuncu_grup  99          \n",
       "22 ucuncu_grup  84          \n",
       "23 ucuncu_grup  94          \n",
       "24 ucuncu_grup  66          \n",
       "25 ucuncu_grup  95          \n",
       "26 ucuncu_grup  87          \n",
       "27 ucuncu_grup  97          \n",
       "28 ucuncu_grup  84          \n",
       "29 ucuncu_grup  63          \n",
       "30 ucuncu_grup  90          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Veri Oluşturma\n",
    "set.seed(111) # Aynı sonuçları elde etmek istiyorsanız, aynı set seed değerini yazmalısınız.\n",
    "dil_puanlari <- sample(x = 60:100, size = 30, replace = TRUE) # 60 ile 100 puan arası dağılım olsun\n",
    "\n",
    "gruplar <- c(rep(\"birinci_grup\", 10),\n",
    "         rep(\"ikinci_grup\", 10),\n",
    "         rep(\"ucuncu_grup\", 10))\n",
    "\n",
    "basit_data = data.frame(gruplar, dil_puanlari) # serileri dataframe yapalım\n",
    "basit_data"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "14a5b5de",
   "metadata": {
    "papermill": {
     "duration": 0.04634,
     "end_time": "2022-04-11T05:28:23.928532",
     "exception": false,
     "start_time": "2022-04-11T05:28:23.882192",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Betimsel İstatistikler"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "0955abdb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:24.026324Z",
     "iopub.status.busy": "2022-04-11T05:28:24.024942Z",
     "iopub.status.idle": "2022-04-11T05:28:24.205959Z",
     "shell.execute_reply": "2022-04-11T05:28:24.204343Z"
    },
    "papermill": {
     "duration": 0.231259,
     "end_time": "2022-04-11T05:28:24.206123",
     "exception": false,
     "start_time": "2022-04-11T05:28:23.974864",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>gruplar</th><th scope=col>variable</th><th scope=col>n</th><th scope=col>mean</th><th scope=col>sd</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>birinci_grup</td><td>dil_puanlari</td><td>10</td><td>78.8</td><td>10.789</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>dil_puanlari</td><td>10</td><td>74.0</td><td> 8.718</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>dil_puanlari</td><td>10</td><td>85.9</td><td>12.423</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " gruplar & variable & n & mean & sd\\\\\n",
       " <chr> & <chr> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t birinci\\_grup & dil\\_puanlari & 10 & 78.8 & 10.789\\\\\n",
       "\t ikinci\\_grup  & dil\\_puanlari & 10 & 74.0 &  8.718\\\\\n",
       "\t ucuncu\\_grup  & dil\\_puanlari & 10 & 85.9 & 12.423\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 5\n",
       "\n",
       "| gruplar &lt;chr&gt; | variable &lt;chr&gt; | n &lt;dbl&gt; | mean &lt;dbl&gt; | sd &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| birinci_grup | dil_puanlari | 10 | 78.8 | 10.789 |\n",
       "| ikinci_grup  | dil_puanlari | 10 | 74.0 |  8.718 |\n",
       "| ucuncu_grup  | dil_puanlari | 10 | 85.9 | 12.423 |\n",
       "\n"
      ],
      "text/plain": [
       "  gruplar      variable     n  mean sd    \n",
       "1 birinci_grup dil_puanlari 10 78.8 10.789\n",
       "2 ikinci_grup  dil_puanlari 10 74.0  8.718\n",
       "3 ucuncu_grup  dil_puanlari 10 85.9 12.423"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "basit_data %>%\n",
    "  group_by(gruplar) %>%\n",
    "  get_summary_stats(dil_puanlari, type = \"mean_sd\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "074e6f6e",
   "metadata": {
    "papermill": {
     "duration": 0.047246,
     "end_time": "2022-04-11T05:28:24.301348",
     "exception": false,
     "start_time": "2022-04-11T05:28:24.254102",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Görselleştirme"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "de713c69",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:24.401295Z",
     "iopub.status.busy": "2022-04-11T05:28:24.399818Z",
     "iopub.status.idle": "2022-04-11T05:28:24.918643Z",
     "shell.execute_reply": "2022-04-11T05:28:24.917989Z"
    },
    "papermill": {
     "duration": 0.570215,
     "end_time": "2022-04-11T05:28:24.918772",
     "exception": false,
     "start_time": "2022-04-11T05:28:24.348557",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\neHjRo6uToWCda8gvTVsYQhjWqbD1RwUAyBwZ9Bq7EMJVI0889rgRK5JrP0aieuUrP5u1uKjb\nmfuW5IUQzvlKt5qq+Ve9tbhug2TVgivfXVrY6ZiBJXlpmBgAIGNkVtjtkfzv/ffdftJ1z9V+\nmUquuPaUr31cnRx+2yf3Hx449qJEInH9iVet/vTjYZ++atgHlTX7XPKLtAwMAJA5MutS7FfH\n37nXQ4MeOu+L/f581L69Smf886Epby7Z7dSbf3toj9oNSnqdfedZN5940+W9B80ceUj/RTMe\nn3DfM2W7nlZxTp/0Tg4AkHaZdcYut3jAv2b950enHlr1xrO33/nQwtK9f3bLP178wzfX3Wb4\n+GkPjj2/x8Lnx11+xb3PzB0++oqXX7y1LCfxefsEAGgjMuuMXQghv+Nuv/jDIxu9sJp91Plj\njzp/bGtNBACwZcisM3YAAGw2YQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlh\nBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABCJnHQPAAAZp6Kionfv3ume\nghZXU1OT7hGambADgPqWL1++fPnydE8BjeZSLABAJIQdAEAkXIoFgPqKi4u7dOmS7ilocbNn\nz06lUumeojkJOwCob+jQoRMnTkz3FLS43Nzc6urqdE/RnFyKBQCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nRE66BwCIQUVFxeuvv77TTjsNHTo03bMAbZczdgDNYNKkSWPGjJk0aVK6BwHaNGEHABAJYQcA\nEAmvscs4r7322jHHHDNv3rx0D9Lali9fHkJ4+OGHy8vL0z1LqyosLBw3btxxxx2X7kEA2OIJ\n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\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkWiDsEjlXX3118+8W\nAICNauCzYj/44INN31f37t1DCCFkX3DBBU0YCQCAzdFA2PXo0WPT95VKpZo2DAAAm6+BsBs1\nalTrzAEAQBM1EHa33HJL68wBAEATeVcsAEAkGjhjt2TJkhBCUWn7nMQnyxvRvn37ZpsLAIBG\naiDsOnToEEK4b8HKYR0La5c3wpsnAADSqIGwO/HEE0MIPfJyQghf//rXW2MiAAA2SwNhd+ed\nd9YtT5o0qYWHAQBg8zUQdrNmzdr0ffXu3btpwwAAsPkaCLsddthh0/flNXYAAGnUQNidd955\n63751qO///PMxbnFPb560P69e3RcPu/t/0158n/vL9/p6B/8cOjOLTknAAANaCDsrrnmmrrl\nj6b8X4/fLNn7m+Meum5017xPb4CXqrzzkq+dcvmv3r7gvZabEgCABjXiBsXXnjQ2t3zYv276\n7tqqCyEk8k+67NFTu+T/+pSrmn86AAA2WSPC7rcfLG+/0xl5iQ3s5OS+ZSs+nNh8UwEA0GiN\nCLvSnMSK957a4EP/nLUsK7dTM40EAMDmaETYjdmt49L3rvzOH1+ut/6VO8+77J0lHXf7frMO\nBgBA4zTw5ol1nXTfuB9vf8oNX//Cc3d948QjvtyzS/Hyj955+q933/bQ89l53a69d3jLTQkA\nQIMaEXZF3Ye//EzNSSPP/ftDtz3/0G1167v0G3Lt724f3r2oBcYDAGBTNSLsQgid9jr5sekn\nvfb8E8++MHPh0tVFHbr0HfDF/ffwgRMAAOnXuLALIYSQ2HnvA3fe+8DmnwUAgCZoxJsnAADI\nZMIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEjnpHtYCtj8AACAASURB\n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\nAUAb1a9fv5qamg0+1L9//1YehmYh7ACgjRo1alR+fn69q7GJRGLw4MG77LJLuqaiKYQdALRR\nPXv2vO+++8rKykIIWVlZtZdlBw0adMcdd6R7NDaT250AQNt1xBFHvPnmm7fffvvLL7/coUOH\nQYMGfe1rX/u8F96R+YQdALRpHTp0GD16dLqnoHm4FAsAEAlhBwAQCWEHABAJYQcAEAlhBwAQ\nCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcA\nEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEH\nABAJYQcAEAlhBwAQiZx0DwCfGDp06E477dS3b990DwIAWyphR6YYMWJEukcAgC2bS7EAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYA0Ka98MILp5122oABAw466KAf//jHS5YsSfdEbL6cdA8AAKTNlVde+cMf/jCEkEqlEonE\n448/ftNNNz322GO77757ukdjczhjBwBt1NSpU3/wgx+kUqlkMln7zxDCokWLTj755NpltjjC\nDgDaqNtvvz2EkEql1l2ZTCZfffXVadOmpWkomkTYAUAbNXv27KysDZfArFmzWnkYmoWwA4A2\nqrS0tN7pujrt27dv5WFoFsIOANqoQw45ZP3X0iUSicLCwkGDBqVlJJpI2AFAG3XSSSfts88+\n667JyspKpVKXX355aWlpuqaiKYQdALRROTk5jz322Pe+973c3NzaNVtvvfVdd9117rnnpncw\nNpv72AFA21VaWvrrX//6iiuueOONN0pKSrbddtt0T0STCDsAaOvy8vL69u2b7iloBi7FAgBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEIhPDbv5/7xl1zH7dO5UWddrmi4NP\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# qplot görselleştirme\n",
    "ggboxplot(basit_data, x = \"gruplar\", y = \"dil_puanlari\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4ee74d16",
   "metadata": {
    "papermill": {
     "duration": 0.049598,
     "end_time": "2022-04-11T05:28:25.017314",
     "exception": false,
     "start_time": "2022-04-11T05:28:24.967716",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Varsayımlar\n",
    "## Aykırı Değerler"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "c25aa7b3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:25.122351Z",
     "iopub.status.busy": "2022-04-11T05:28:25.120880Z",
     "iopub.status.idle": "2022-04-11T05:28:25.200084Z",
     "shell.execute_reply": "2022-04-11T05:28:25.198726Z"
    },
    "papermill": {
     "duration": 0.132239,
     "end_time": "2022-04-11T05:28:25.200235",
     "exception": false,
     "start_time": "2022-04-11T05:28:25.067996",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>gruplar</th><th scope=col>dil_puanlari</th><th scope=col>is.outlier</th><th scope=col>is.extreme</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;lgl&gt;</th><th scope=col>&lt;lgl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>ucuncu_grup</td><td>66</td><td>TRUE</td><td>FALSE</td></tr>\n",
       "\t<tr><td>ucuncu_grup</td><td>63</td><td>TRUE</td><td>FALSE</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 4\n",
       "\\begin{tabular}{llll}\n",
       " gruplar & dil\\_puanlari & is.outlier & is.extreme\\\\\n",
       " <chr> & <int> & <lgl> & <lgl>\\\\\n",
       "\\hline\n",
       "\t ucuncu\\_grup & 66 & TRUE & FALSE\\\\\n",
       "\t ucuncu\\_grup & 63 & TRUE & FALSE\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 4\n",
       "\n",
       "| gruplar &lt;chr&gt; | dil_puanlari &lt;int&gt; | is.outlier &lt;lgl&gt; | is.extreme &lt;lgl&gt; |\n",
       "|---|---|---|---|\n",
       "| ucuncu_grup | 66 | TRUE | FALSE |\n",
       "| ucuncu_grup | 63 | TRUE | FALSE |\n",
       "\n"
      ],
      "text/plain": [
       "  gruplar     dil_puanlari is.outlier is.extreme\n",
       "1 ucuncu_grup 66           TRUE       FALSE     \n",
       "2 ucuncu_grup 63           TRUE       FALSE     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Aykırı değerler, rstatix paketi içindeki define_outliers() fonksiyonuyla kutu çizim yöntemleri kullanılarak kolayca tanımlanabilir.\n",
    "basit_data %>% \n",
    "  group_by(gruplar) %>%\n",
    "  identify_outliers(dil_puanlari)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "60f7e395",
   "metadata": {
    "papermill": {
     "duration": 0.050691,
     "end_time": "2022-04-11T05:28:25.301537",
     "exception": false,
     "start_time": "2022-04-11T05:28:25.250846",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Aykırı değer bulunmamaktadır."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c34bed14",
   "metadata": {
    "papermill": {
     "duration": 0.05052,
     "end_time": "2022-04-11T05:28:25.403329",
     "exception": false,
     "start_time": "2022-04-11T05:28:25.352809",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Normallik Varsayımı\n",
    "Normallik varsayımı, aşağıdaki iki yaklaşımdan biri kullanılarak kontrol edilebilir:\n",
    "\n",
    "1. Tüm gruplar için normalliği kontrol etmek için ANOVA model artıklarının birlikte analiz edilmesini içerir. Bu yaklaşım daha kolaydır ve çok sayıda grubunuz olduğunda veya grup başına birkaç veri noktası (gözlem) olduğunda çok kullanışlıdır.\n",
    "\n",
    "2. Her grup için ayrı ayrı normalliği kontrol edin. Bu yaklaşım, yalnızca birkaç grubunuz ve grup başına çok sayıda veri noktanız (gözlem) olduğunda kullanılabilir.\n",
    "\n",
    "Hem seçenek 1 hem de seçenek 2'yi yapalım.\n",
    "\n",
    "Model artıklarını analiz ederek normallik varsayımını kontrol edin. QQ grafiği ve Shapiro-Wilk normallik testi kullanılmıştır. QQ grafiği, belirli bir veri ile normal dağılım arasındaki korelasyonu çizer."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "8c773de8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:25.510877Z",
     "iopub.status.busy": "2022-04-11T05:28:25.509323Z",
     "iopub.status.idle": "2022-04-11T05:28:25.765855Z",
     "shell.execute_reply": "2022-04-11T05:28:25.765265Z"
    },
    "papermill": {
     "duration": 0.311198,
     "end_time": "2022-04-11T05:28:25.765984",
     "exception": false,
     "start_time": "2022-04-11T05:28:25.454786",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n/Pz58+efeOKJskPJZLPZfD4fF9UBAGSh2KE/ug/qFEX50Y9+dO2116bzoE4IkZOT43K5uP0r\nAEAiih36rPugrri4eOHChccff7zsUJIVFxeXlJTITgEASHcUO/RB1KDurLPOuuqqq9L8ejJV\nVT0eT1ZWluwgAABQ7HDEPvroo8rKyq+++koIUVxcfOONN44ePVp2KMlYKgEASCoUO/QuEAj8\n7ne/e+aZZ8LhMIO6Lna73efz6fV8EwEAkgWvSejFP/7xj5tvvnnXrl2CQV037D8MAEhCFDsc\nUiAQuOuuu5599lkGdd0pilJSUlJUVCQ7CAAA0Sh26NmHH364ePFirqiLotPpPB5PZmam7CAA\nAPSAYodoLH09FJPJ5Pf7zWaz7CAAAPSMYof/wKDuUBwOh9fr1el0soMAAHBIFDt8g0HdYbBU\nAgCQEih2EIJB3aEpilJWVlZQUCA7CAAAvaPYpTsGdYeh1+u9Xm9GRobsIAAAHBGKXVrrPqgr\nKSlZuHAhg7ouZrPZ5/OxVAIAkEIodmmqubl5+fLlq1evZlDXI5ZKAABSEcUuHb333nu//vWv\nd+/eLRjU9aSgoKCsrIylEgCAlEOxSy/Nzc133XXXmjVruJlEjxRFcblcubm5soMAANAfquwA\nQggR6ti7fMElowe7M61GW1b+qIln3//KtqhT1q5cMGGkJ8NkLigf9tNr79rVHpKTNZW99957\n5557buQWYSUlJffcc8/8+fNpdV30en1FRQWtDgCQuuRP7EKdtT8/evAjn+7LcI068yenBHZ+\n+uJrz8x6a807Kz96aOaIyDl/unzMOfdssJUcc/q54+s/fXvVbVf95ZUPtn/0sEPHm2VHhEFd\nrywWi9/vNxqNsoMAANB/8ovdpmVnPPLpPucZSz9ZM9euU4QQNf988tjxF6yaPem6/945zKo/\n8MXyn9z7T4f3ws3/frDYqAohHrt0xAUrHp169/VvXjVcdvwU8O677958880DuaLutddee/vt\nt6urq0tLSydPnjx+/Pj4JJUmKyvL4/GoalIMsAEA6DclHA7LTXBtueP2rwN/3x8Y5/huWLLu\n8uHj7/l02l93rTmxeO05vlP+VHX1xtrbRn7zHlmwbUdBhq8lc2pg77M9Puerr746ZcoUIUR1\ndXVRUVFc81dVVe3bty+uX6LfBj6oa2tru+aaa959911VVSNPEgqFJk2atGTJEs2sGC0oKCgv\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Build the linear model\n",
    "model  <- lm(dil_puanlari ~ gruplar, data = basit_data)\n",
    "# Create a QQ plot of residuals\n",
    "ggqqplot(residuals(model))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "cf596f7f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:25.877526Z",
     "iopub.status.busy": "2022-04-11T05:28:25.875730Z",
     "iopub.status.idle": "2022-04-11T05:28:25.903507Z",
     "shell.execute_reply": "2022-04-11T05:28:25.901966Z"
    },
    "papermill": {
     "duration": 0.084382,
     "end_time": "2022-04-11T05:28:25.903649",
     "exception": false,
     "start_time": "2022-04-11T05:28:25.819267",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>variable</th><th scope=col>statistic</th><th scope=col>p.value</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>residuals(model)</td><td>0.966617</td><td>0.4512206</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 3\n",
       "\\begin{tabular}{lll}\n",
       " variable & statistic & p.value\\\\\n",
       " <chr> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t residuals(model) & 0.966617 & 0.4512206\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 3\n",
       "\n",
       "| variable &lt;chr&gt; | statistic &lt;dbl&gt; | p.value &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| residuals(model) | 0.966617 | 0.4512206 |\n",
       "\n"
      ],
      "text/plain": [
       "  variable         statistic p.value  \n",
       "1 residuals(model) 0.966617  0.4512206"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Shapiro-Wilk normallik testi\n",
    "shapiro_test(residuals(model))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4e04e0a8",
   "metadata": {
    "papermill": {
     "duration": 0.055444,
     "end_time": "2022-04-11T05:28:26.013504",
     "exception": false,
     "start_time": "2022-04-11T05:28:25.958060",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "QQ grafiğinde, tüm noktalar yaklaşık olarak referans çizgisi boyunca düştüğü için normallik varsayabiliriz. Bu sonuç Shapiro-Wilk testi tarafından desteklenmektedir. p değeri anlamlı değildir (p = 0.45), dolayısıyla normalliği varsayabiliriz."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fd0974aa",
   "metadata": {
    "papermill": {
     "duration": 0.054195,
     "end_time": "2022-04-11T05:28:26.122210",
     "exception": false,
     "start_time": "2022-04-11T05:28:26.068015",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Gruplara göre normallik varsayımını kontrol ediyoruz. Her grup seviyesi için Shapiro-Wilk testinin hesaplanması. Veriler normal dağılıyorsa, p değeri 0,05'ten büyük olmalıdır."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "785d1875",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:26.238090Z",
     "iopub.status.busy": "2022-04-11T05:28:26.236685Z",
     "iopub.status.idle": "2022-04-11T05:28:26.391190Z",
     "shell.execute_reply": "2022-04-11T05:28:26.389620Z"
    },
    "papermill": {
     "duration": 0.214234,
     "end_time": "2022-04-11T05:28:26.391325",
     "exception": false,
     "start_time": "2022-04-11T05:28:26.177091",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>gruplar</th><th scope=col>variable</th><th scope=col>statistic</th><th scope=col>p</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>birinci_grup</td><td>dil_puanlari</td><td>0.9464264</td><td>0.62645539</td></tr>\n",
       "\t<tr><td>ikinci_grup </td><td>dil_puanlari</td><td>0.9289730</td><td>0.43786646</td></tr>\n",
       "\t<tr><td>ucuncu_grup </td><td>dil_puanlari</td><td>0.8598477</td><td>0.07599371</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 4\n",
       "\\begin{tabular}{llll}\n",
       " gruplar & variable & statistic & p\\\\\n",
       " <chr> & <chr> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t birinci\\_grup & dil\\_puanlari & 0.9464264 & 0.62645539\\\\\n",
       "\t ikinci\\_grup  & dil\\_puanlari & 0.9289730 & 0.43786646\\\\\n",
       "\t ucuncu\\_grup  & dil\\_puanlari & 0.8598477 & 0.07599371\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 4\n",
       "\n",
       "| gruplar &lt;chr&gt; | variable &lt;chr&gt; | statistic &lt;dbl&gt; | p &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| birinci_grup | dil_puanlari | 0.9464264 | 0.62645539 |\n",
       "| ikinci_grup  | dil_puanlari | 0.9289730 | 0.43786646 |\n",
       "| ucuncu_grup  | dil_puanlari | 0.8598477 | 0.07599371 |\n",
       "\n"
      ],
      "text/plain": [
       "  gruplar      variable     statistic p         \n",
       "1 birinci_grup dil_puanlari 0.9464264 0.62645539\n",
       "2 ikinci_grup  dil_puanlari 0.9289730 0.43786646\n",
       "3 ucuncu_grup  dil_puanlari 0.8598477 0.07599371"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "basit_data %>%\n",
    "  group_by(gruplar) %>%\n",
    "  shapiro_test(dil_puanlari)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d1d67c78",
   "metadata": {
    "papermill": {
     "duration": 0.05644,
     "end_time": "2022-04-11T05:28:26.505316",
     "exception": false,
     "start_time": "2022-04-11T05:28:26.448876",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Shapiro-Wilk'in normallik testi ile değerlendirildiği üzere, her grup için normal olarak dağılmıştır (p > 0.05).\n",
    "\n",
    "\n",
    "Örnek boyutunuz 50'den büyükse, normal QQ grafiğinin tercih edildiğini unutmayın çünkü daha büyük örnek boyutlarında Shapiro-Wilk testi normallikten küçük bir sapmaya bile çok duyarlı hale gelir.\n",
    "\n",
    "QQ grafiği, belirli bir veri ile normal dağılım arasındaki korelasyonu çizer. Her grup seviyesi için QQ grafikleri oluşturun:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "ed9768b5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:26.623694Z",
     "iopub.status.busy": "2022-04-11T05:28:26.622142Z",
     "iopub.status.idle": "2022-04-11T05:28:27.103150Z",
     "shell.execute_reply": "2022-04-11T05:28:27.102517Z"
    },
    "papermill": {
     "duration": 0.541805,
     "end_time": "2022-04-11T05:28:27.103291",
     "exception": false,
     "start_time": "2022-04-11T05:28:26.561486",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nGEg6kRHe3t6OjvVXWCFea0Zh12nut1Oe9Ti9IsTdu/2IJX8CwNgPh3cPdBuw5ISi3eCjMU+1\nViZXd1sAuJFfVfsIXZ2ToTcIbTXsHzf+mEGJHBc/9t97mdBGO1/tUJF76PfS6taKYRkqKyt1\nOh3pFKbav38/24SdOnWqFTZhpVJp+/btcQ4zWXl5ecSP2ktJSRk4cOCBAwfS09P1en1iYuLq\n1asnTJhQW27qdLpt27YBwAsvvNC7d2+iYdF/CgsLJ02alJmZKRKJVqxY8cQTT5BOZISrqyue\nvm15mlHYCYSK9T8l7oie7C/KPvdLDgBs3bHnzwKnYbNW3/h7r7dEaPQnmKjHtkhnMbX85fcP\nXbxdqq/KuPtH2JBnM/SGtyK3AQBDl3+XX2nr/Ia98IHbOc90dQGAQ7lcX+xsTgaD4e7duwaD\ngXQQk6Snp2/cuBEAunbtOnjwYNJxzM3d3b1Dhw4cX2Ft8aqqqriwczwuLq6kpKR2qxP7D3/+\n+ef+/fuhzjl7crl84cKFJIOiOiorK2fNmqXT6diBgs8//zzpREbY29ur1WrSKVDra966bIFQ\nPirso1FhH+Wn38vKL7VxcNaqla2+i0bRbtyNc8LHeo4f8MzR2geHfXTm88mPA4ChKqWKZhR2\nHet9l0OwAwDcKf/vjl1JScmAAQNq/2iFB6Tcu3evsrKSdAqT1DZhbW1tra0JK5FItFqtvb09\n6SAIdDod8QuhkpKS33///eExKxRF/fDDDyNGjPjiiy+uXr0KALNmzXJ3dyeREdVXU1Mzb948\n9tCw6dOn9+3bl3QiI2xtbf39/a3qndZ6tHDDnbNK46xq3ST/qS79a9LE0LxqQ6eX+z7fybfo\n3o0jR04dDJvS67kzY7q40NW5AEAJ62/sF8vFAFBe9F9hV11d/cMPP9T+0dqmaWdkZBDvKJnu\nyy+/rG3C+vj4kI5jPk5OThqNRihstRveqMUyMjJKS0tJp4C8vLwGh+fRNJ2VlZWenv7JJ58A\nwNNPP/3OO++YPR1qAMMw0dHRFy5cAICRI0eOGDGCdCIjhEJhQEAAvu1YKiOFXVpamuk/q7Um\nVi/t8fKhq3mhB68tG9CJfaTo1rFnur476YXnX8+/rhQ5AQBtqH/IT3VpNQDY2P/3/4iiKD8/\nv9o/KhSKnJycVknIfcXFxRkZGaRTmCo9Pf2jjz4CgM6dO1tPE1YoFKrValz2zhHl5eUceck4\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggqqplot(basit_data, \"dil_puanlari\", facet.by = \"gruplar\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "189a8033",
   "metadata": {
    "papermill": {
     "duration": 0.060388,
     "end_time": "2022-04-11T05:28:27.224280",
     "exception": false,
     "start_time": "2022-04-11T05:28:27.163892",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Tüm noktalar, her hücre için yaklaşık olarak referans çizgisi boyunca yer almaktadır. Böylece verilerin normal dağıldığını varsayabiliriz.\n",
    "\n",
    "**Not:** Verilerin normalliği konusunda şüpheniz varsa tek yönlü ANOVA testinin parametrik olmayan alternatifi olan Kruskal-Wallis testini kullanabilirsiniz."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b129f764",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T14:27:13.597558Z",
     "iopub.status.busy": "2022-04-10T14:27:13.595908Z",
     "iopub.status.idle": "2022-04-10T14:27:13.608483Z"
    },
    "papermill": {
     "duration": 0.059272,
     "end_time": "2022-04-11T05:28:27.342288",
     "exception": false,
     "start_time": "2022-04-11T05:28:27.283016",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Varyans Homejenliği\n",
    "1. Artıklar-uyum grafiği, varyansların homojenliğini kontrol etmek için kullanılabilir."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "c1e94b4e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:27.465596Z",
     "iopub.status.busy": "2022-04-11T05:28:27.464048Z",
     "iopub.status.idle": "2022-04-11T05:28:27.555039Z",
     "shell.execute_reply": "2022-04-11T05:28:27.553876Z"
    },
    "papermill": {
     "duration": 0.154445,
     "end_time": "2022-04-11T05:28:27.555233",
     "exception": false,
     "start_time": "2022-04-11T05:28:27.400788",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nySeffDJ69GhRyOS32A3wc92UEvxz9C+1PHWWjCh3Q7Bvm6+v7+4ihNynhOs3qp4pt1fZOuvl\ntd0qDNjmU7vbJ3Pe69KqjkH9932Ecsb5Y7sXfPD2ykPXX1py/tvhlQvq9w4cOHDNmjUzZsyY\nPHnyM7x8/Pjx8+fPDw8Pz7oeNqfjx483atRo/PjxH330UUEkLbxkU6b84CQqOSPHco5xqylT\nNpkfjJuyzliSTaYcg39/oekhG3nU+EM3nnv99PTH3O7LDiStVtLd/79ASZdjWauRHtz1UNJp\nVH+NP2r9/Izn2ObDtv+3lbVaySn7hbpnezpnSkpK165d9+/f7+zsXLt2bWdn57Nnz969ezcw\nMHDnzp21atUqqIfB33+KKA+DB2AzP/74Y6Etdvn9B3p7rNG34dxanjohRNL1BWkW6wuTs2qK\nNLCO7+aD39gs4V/K9/9q+S9t3li6rW+7rWqdR1D54IBink5OWospI/He7auXr8SlmyVJajEs\nNKzgWt0/N3jw4EWLFr355puHDh3y9vbOHo+Pj3/zzTe1Wu2gQYMcGM8+ctYLYXBolCeRM0yy\n+X7ts6abxF/LGeLBPcOsxozsCigbjbL1ftWwphlF9nKqUYgHyylp2Zu3phrvL1pla5rxwags\nGx8sW6xWY8b9dSwWa3qGnGmWM83CbLamm+6vYzbLGaaCe9NPT6VS6Z2zFiW1SvprWS05O91f\n1qhVzg/uwq3VqnTaDW1eia7S6PfrUbfv3dVmSiPrtXnOp1gxF1fx8YYo44pH/SrJSad2d1W7\nu2qKeatcK6jdDSo3g9rNoHJ3U7sZVO6ualeDys3Aw+ABQOS/2DlJ0oP/SIkrK3+QJGlM9fsd\nxWKWhfzIy8EKlGrIkgPt++4IXb1p9+GfLkSevHzufiZJ5RQYXLV1i7a9h4x6uV5Ju4TJr0qV\nKs2aNeudd96pWbPm6NGjGzZsKElSeHj4okWLoqOj582bV6lSJUdnxF8kJ53kdL+OFImHWsqZ\nOXY65tgbas3I2UpN2XfZkNMzsu9qKxv/2klpNaZnPwM0Hw1VWFPvL8uybE19cDKD1Zo9LiyW\nzL83VCGEtxAvqF1FCVeR1dhcDCo3gzrQ735Xc3NVuxlUbga1u5vKzZDV4aRCfC4LABQ2+S12\n/fwMn0ZMuZ7R5jlN6tQVl12K923ophNCWE23Jv0c4+TZwZYh/6Zk/c6z63eeLYRsNiYkJKca\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "plot(model, 1)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e2159a28",
   "metadata": {
    "papermill": {
     "duration": 0.061794,
     "end_time": "2022-04-11T05:28:27.679138",
     "exception": false,
     "start_time": "2022-04-11T05:28:27.617344",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Yukarıdaki grafikte, artıklar ve uygun değerler (her grubun ortalaması) arasında belirgin bir ilişki yoktur ki bu iyidir. Dolayısıyla varyansların homojenliğini varsayabiliriz.\n",
    "\n",
    "Varyansların homojenliğini kontrol etmek için Levene testini kullanmak da mümkündür:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "a0547913",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:27.808019Z",
     "iopub.status.busy": "2022-04-11T05:28:27.806269Z",
     "iopub.status.idle": "2022-04-11T05:28:27.844501Z",
     "shell.execute_reply": "2022-04-11T05:28:27.842935Z"
    },
    "papermill": {
     "duration": 0.104095,
     "end_time": "2022-04-11T05:28:27.844642",
     "exception": false,
     "start_time": "2022-04-11T05:28:27.740547",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in leveneTest.default(y = y, group = group, ...):\n",
      "“group coerced to factor.”\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>df1</th><th scope=col>df2</th><th scope=col>statistic</th><th scope=col>p</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2</td><td>27</td><td>0.2369278</td><td>0.7906715</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 4\n",
       "\\begin{tabular}{llll}\n",
       " df1 & df2 & statistic & p\\\\\n",
       " <int> & <int> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 2 & 27 & 0.2369278 & 0.7906715\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 4\n",
       "\n",
       "| df1 &lt;int&gt; | df2 &lt;int&gt; | statistic &lt;dbl&gt; | p &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| 2 | 27 | 0.2369278 | 0.7906715 |\n",
       "\n"
      ],
      "text/plain": [
       "  df1 df2 statistic p        \n",
       "1 2   27  0.2369278 0.7906715"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Levene Testi\n",
    "basit_data %>% levene_test(dil_puanlari ~ gruplar)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cbb785c6",
   "metadata": {
    "papermill": {
     "duration": 0.064278,
     "end_time": "2022-04-11T05:28:27.973905",
     "exception": false,
     "start_time": "2022-04-11T05:28:27.909627",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Yukarıdaki çıktıdan, p-değerinin > 0.05 olduğunu görebiliriz, bu da anlamlı değildir. Bu, gruplar arasındaki varyanslar arasında anlamlı bir fark olmadığı anlamına gelir. Bu nedenle,  grup varyans homojenliği de sağlanmaktadır.\n",
    "\n",
    "Varyans homojenliği varsayımının karşılanmadığı bir durumda, welch_anova_test()[rstatix paketi] fonksiyonunu kullanarak Welch tek yönlü ANOVA testini kullanabilirsiniz. Bu test eşit varyans varsayımını gerektirmez."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "66214c6e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-11T05:28:28.119627Z",
     "iopub.status.busy": "2022-04-11T05:28:28.117755Z",
     "iopub.status.idle": "2022-04-11T05:28:28.242031Z",
     "shell.execute_reply": "2022-04-11T05:28:28.239377Z"
    },
    "papermill": {
     "duration": 0.201762,
     "end_time": "2022-04-11T05:28:28.242206",
     "exception": false,
     "start_time": "2022-04-11T05:28:28.040444",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Coefficient covariances computed by hccm()\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A anova_test: 1 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Effect</th><th scope=col>DFn</th><th scope=col>DFd</th><th scope=col>F</th><th scope=col>p</th><th scope=col>p&lt;.05</th><th scope=col>ges</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>gruplar</td><td>2</td><td>27</td><td>3.101</td><td>0.061</td><td></td><td>0.187</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A anova\\_test: 1 × 7\n",
       "\\begin{tabular}{r|lllllll}\n",
       "  & Effect & DFn & DFd & F & p & p<.05 & ges\\\\\n",
       "  & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & gruplar & 2 & 27 & 3.101 & 0.061 &  & 0.187\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A anova_test: 1 × 7\n",
       "\n",
       "| <!--/--> | Effect &lt;chr&gt; | DFn &lt;dbl&gt; | DFd &lt;dbl&gt; | F &lt;dbl&gt; | p &lt;dbl&gt; | p&lt;.05 &lt;chr&gt; | ges &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 1 | gruplar | 2 | 27 | 3.101 | 0.061 | <!----> | 0.187 |\n",
       "\n"
      ],
      "text/plain": [
       "  Effect  DFn DFd F     p     p<.05 ges  \n",
       "1 gruplar 2   27  3.101 0.061       0.187"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "res.aov <- basit_data %>% anova_test(dil_puanlari ~ gruplar)\n",
    "res.aov\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a442fbb8",
   "metadata": {
    "papermill": {
     "duration": 0.07053,
     "end_time": "2022-04-11T05:28:28.391186",
     "exception": false,
     "start_time": "2022-04-11T05:28:28.320656",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "p değeri p > 0.05'den büyük olduğu için gruplar arası anlamlı bir farklılık olmadığı görülmektedir.\n",
    "\n",
    "Yukarıdaki tabloda, ges sütunu genelleştirilmiş eta kareyi yani etki büyüklüğüne karşılık gelmektedir. Sonuç değişkenindeki (dil puani) tahmin edici (grubu) açısından açıklanabilen değişkenliğin oranını ölçer. 0,18 (%18)'lik bir etki büyüklüğü, ağırlıktaki değişimin %18'nin dil puanı için açıklanabileceği anlamına gelir."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "22d12c78",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-04-10T14:40:01.353688Z",
     "iopub.status.busy": "2022-04-10T14:40:01.352043Z",
     "iopub.status.idle": "2022-04-10T14:40:01.365684Z"
    },
    "papermill": {
     "duration": 0.068082,
     "end_time": "2022-04-11T05:28:28.541152",
     "exception": false,
     "start_time": "2022-04-11T05:28:28.473070",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Kaynakça\n",
    "* https://statsandr.com/blog/anova-in-r/\n",
    "* https://www.datanovia.com/en/lessons/anova-in-r/\n",
    "* İstatistikten Nefret Edenler İçin İstatistik - Neil Salkind"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 10.0262,
   "end_time": "2022-04-11T05:28:28.717585",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-04-11T05:28:18.691385",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
