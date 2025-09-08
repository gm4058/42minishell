/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   print.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dsagong <dsagong@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/09/04 17:49:06 by dsagong           #+#    #+#             */
/*   Updated: 2025/09/08 15:03:48 by dsagong          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PRINT_H
# define PRINT_H
# include "types.h"
# include <stdio.h>

void	print_tokens(t_token *tokens, char *step);
void	print_herdocs(t_hd *hd_lst);

#endif
