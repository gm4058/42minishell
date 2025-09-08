/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   print_herdoc.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dsagong <dsagong@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/09/08 15:02:56 by dsagong           #+#    #+#             */
/*   Updated: 2025/09/08 15:03:26 by dsagong          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "print.h"

void    print_herdocs(t_hd *hd_lst)
{
	char	buf[1024];
	ssize_t	n;

	if (hd_lst)
	{
		printf("***********HEREDOC LIST**********\n");
		while (hd_lst)
		{
			printf("[heredoc fd: %d]\n", hd_lst->fd);
			while ((n = read(hd_lst->fd, buf, sizeof(buf) - 1)) > 0)
			{
				buf[n] = '\0';
				printf("%s", buf);
			}
			printf("\n----------------------------\n");
			hd_lst = hd_lst->next;
		}
	}
}
