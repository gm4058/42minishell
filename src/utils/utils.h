/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dsagong <dsagong@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/08/21 09:51:37 by dsagong           #+#    #+#             */
/*   Updated: 2025/09/08 11:32:18 by dsagong          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef UTILS_H
# define UTILS_H
# include "types.h"

int		is_space(char c);
int		is_operator(char c);
int		is_quote(char c);
int		is_redir_type(t_token_type type);
int		is_valid_expand(t_exp *exp_data, char *value);

char	*charjoin_and_free(char *s, char c);

#endif
