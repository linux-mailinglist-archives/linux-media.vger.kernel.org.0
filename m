Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D01252EE7
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 14:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729958AbgHZMqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 08:46:07 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60631 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729785AbgHZMqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 08:46:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AuoVkjHO7uuXOAuoWkDhum; Wed, 26 Aug 2020 14:46:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598445964; bh=zSxsTcETUhxd94TCm5XIL128nAPmxXf4mD7jE/FpxTc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hxSkJCfTXSJ5xPBs/g4LRm2q0HKy/djw11pZriAJgXaQEJ0kBoOtziScw3PWh0b82
         1N1vgBmxqrN7Z9va53pGGudA7JOkxRglqCj7aV8TB2Ve6qgOHqrbwrM/K9FdTJV+Es
         yYaLYyp7kBwRWxJHgEisjXr3X4/209vyvP2wGEAzFgujOMQU8Vgap0beOujHlpF4NR
         ax7Ya4zYKLVMA2Q0ulGK+u+qLlnqKO+Ii24i7c6WVZt4gyNpOnERvWgsksISnrj4um
         CqCcJtB2rYRuewOYrlDFS78zDz1PDeOBO23K0PWVgYCDj1CFbEseLe86/C4nxuYKT8
         rDVYYrBYaeOiQ==
Subject: Re: [PATCH 2/2] media: v4l2-mem2mem: simplify poll logic a bit
To:     Alexandre Courbot <gnurou@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200825145556.637323-1-gnurou@gmail.com>
 <20200825145556.637323-3-gnurou@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c95ef569-1ae2-73a0-7c3c-ddd15c6dddb4@xs4all.nl>
Date:   Wed, 26 Aug 2020 14:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825145556.637323-3-gnurou@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOfZoS8Q/qeXk6cydAMOyfZ63zLLbylTR8YCYFXm11Onhe31JfZwvfZjggFSx/lIUt1EyOPv6gkv8/QQfug2QuNyMEc312gzspkgnD5GKXJpztsczur6
 Bq41AjEi4cxOrFD1Tqg9bJxuFmPKNZVuz+f0DX7stAAO5221SMqQ0OSqEa04SYD+D+A+q+CKLFUMoOvro5iFIvvz61h/w8SZzEmDhGoYKbpy8x5YuVW6vYry
 iYw1wXCOI2SqeVi1qgcXmdCEzQRwJsqB2S90EU5IukZBcjtrCE6JI9KqI5/Q1KNh0YPjeKBqJzm+bcXzMzq6aQzufe2PV7t4/N3y/zLR0KSiL+37zX7ve0Xz
 b3jo0QoecxJxtCjwlhGEtjGpXIL8xPBV/xGMnn4W2FMgD0X+9amlaUDIhUU3kwNbEsEc2i0T
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/08/2020 16:55, Alexandre Courbot wrote:
> Factorize redundant checks into a single code block, remove the early
> return, and declare variables in their innermost block. Hopefully this
> makes this code a little bit easier to follow.
> 
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 35 +++++++++++---------------
>  1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index 0d0192119af20..aeac9707123d0 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -841,7 +841,6 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
>  				       struct poll_table_struct *wait)
>  {
>  	struct vb2_queue *src_q, *dst_q;
> -	struct vb2_buffer *src_vb = NULL, *dst_vb = NULL;
>  	__poll_t rc = 0;
>  	unsigned long flags;
>  
> @@ -863,33 +862,29 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
>  		return EPOLLERR;
>  
>  	spin_lock_irqsave(&src_q->done_lock, flags);
> -	if (!list_empty(&src_q->done_list))
> -		src_vb = list_first_entry(&src_q->done_list, struct vb2_buffer,
> -						done_entry);
> -	if (src_vb && (src_vb->state == VB2_BUF_STATE_DONE
> -			|| src_vb->state == VB2_BUF_STATE_ERROR))
> -		rc |= EPOLLOUT | EPOLLWRNORM;
> +	if (!list_empty(&src_q->done_list)) {
> +		struct vb2_buffer *src_vb = list_first_entry(
> +			&src_q->done_list, struct vb2_buffer, done_entry);
> +		if (src_vb->state == VB2_BUF_STATE_DONE ||
> +		    src_vb->state == VB2_BUF_STATE_ERROR)

This test is unnecessary: only buffers in state DONE or ERROR can be on the done_list.

> +			rc |= EPOLLOUT | EPOLLWRNORM;
> +	}
>  	spin_unlock_irqrestore(&src_q->done_lock, flags);
>  
>  	spin_lock_irqsave(&dst_q->done_lock, flags);
> -	if (list_empty(&dst_q->done_list)) {
> +	if (!list_empty(&dst_q->done_list)) {
> +		struct vb2_buffer *dst_vb = list_first_entry(
> +			&dst_q->done_list, struct vb2_buffer, done_entry);
> +		if (dst_vb->state == VB2_BUF_STATE_DONE ||
> +		    dst_vb->state == VB2_BUF_STATE_ERROR)

Ditto.

Regards,

	Hans

> +			rc |= EPOLLIN | EPOLLRDNORM;
> +	} else if (dst_q->last_buffer_dequeued) {
>  		/*
>  		 * If the last buffer was dequeued from the capture queue,
>  		 * return immediately. DQBUF will return -EPIPE.
>  		 */
> -		if (dst_q->last_buffer_dequeued) {
> -			spin_unlock_irqrestore(&dst_q->done_lock, flags);
> -			rc |= EPOLLIN | EPOLLRDNORM;
> -			return rc;
> -		}
> -	}
> -
> -	if (!list_empty(&dst_q->done_list))
> -		dst_vb = list_first_entry(&dst_q->done_list, struct vb2_buffer,
> -						done_entry);
> -	if (dst_vb && (dst_vb->state == VB2_BUF_STATE_DONE
> -			|| dst_vb->state == VB2_BUF_STATE_ERROR))
>  		rc |= EPOLLIN | EPOLLRDNORM;
> +	}
>  	spin_unlock_irqrestore(&dst_q->done_lock, flags);
>  
>  	return rc;
> 

