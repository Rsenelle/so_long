NAME	=	so_long
NAME_B	=	so_long_bonus

SRCS_F	=	parsing.c\
			solong.c \
			get_next_line.c \
			get_next_line_utils.c\
			reading_map.c\
			gaming.c\
			main.c
SRCS_D	=	src/

SRCS_F_B	=	parsing_bonus.c\
			map_render_bonus.c\
			get_next_line_bonus.c\
			get_next_line_utils_bonus.c\
			reading_map_bonus.c\
			gaming_bonus.c\
			animation.c\
			mlx_writes.c\
			init_struct.c\
			main_bonus.c
SRCS_D_B	=	src_bonus/

INCLUDE	=	-I ./include -I./minilibx

OPENGL	=	-framework OpenGL -framework AppKit

OBJS	=	$(SRCS:.c=.o)

OBJS_B	=	$(SRCS_B:.c=.o)

CC  	=	gcc

CFLAGS	=	-Wall -Wextra -Werror -MMD -g
SRCS	=	$(addprefix $(SRCS_D),$(SRCS_F))
SRCS_B	=	$(addprefix $(SRCS_D_B),$(SRCS_F_B))

MLX		=	./minilibx/libmlx.a
LIBFT	=	./libft/libft.a

$(NAME)	:	$(OBJS) 
			$(MAKE) -C $(dir $(LIBFT))
			$(MAKE) -C $(dir $(MLX))
			cp $(MLX) .
			$(CC) $(CFLAGS) $(LIBFT) $(MLX) $(OBJS) $(OPENGL) -o $(NAME)

all		:	$(NAME)

%.o		:	%.c
			$(CC) $(CFLAGS) -c $< -o $@

clean	:	
			$(MAKE) clean -C $(dir $(LIBFT))
			$(MAKE) clean -C $(dir $(MLX))
			rm -rf $(OBJS) $(OBJS:.o=.d) $(OBJS_B) $(OBJS_B:.o=.d) 

fclean	:	clean
			$(MAKE) fclean -C $(dir $(LIBFT))
			rm -rf $(NAME) $(NAME_B) libmlx.a

bonus	:	$(OBJS_B)
			$(MAKE) -C $(dir $(LIBFT))
			$(MAKE) -C $(dir $(MLX))
			cp $(MLX) .
			$(CC) $(CFLAGS) $(LIBFT) $(MLX) $(OBJS_B) $(OPENGL) -o $(NAME_B)
			

re		:	fclean all

.PHONY	:	all clean fclean re bonus

-include	$(OBJS:.o=.d)