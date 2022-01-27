/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   animation.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rsenelle <rsenelle@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/12/14 17:52:46 by rsenelle          #+#    #+#             */
/*   Updated: 2021/12/15 16:19:45 by rsenelle         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/so_long_bonus.h"

int	animation_player(t_slg *slg)
{
	if (slg->count_img > 2000 && slg->ani == 0)
	{
		slg->player = slg->player1;
		slg->count_img = 0;
		slg->ani = 1;
		map_render_init(slg);
	}
	if (slg->count_img > 2000 && slg->ani == 1)
	{
		slg->player = slg->player2;
		slg->count_img = 0;
		slg->ani = 0;
		map_render_init(slg);
	}
	slg->count_img++;
	return (1);
}
