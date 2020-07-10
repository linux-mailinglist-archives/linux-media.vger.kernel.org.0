Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D174C21B2FB
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 12:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgGJKK7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 06:10:59 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:40097 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727046AbgGJKK4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 06:10:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id tpzWjrq9CGLmCtpzaj5VDx; Fri, 10 Jul 2020 12:10:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594375854; bh=ZhpEwiw3I4VVLC0B0NIMkWX5kI44jFvoGcVeHILDDCw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ouaaTKdqWuHnrkgDEIdJ5Y09MWyZ7kfACnMLu3sqSzT5ae6NrcD68jm7r5Z62QFk1
         U4mGvaf9j62Y0GhHBJ0//kL6BIUx25Lwv8tv5bk1naIklbNgkIt1fqQOVOzb7FKn6l
         qkQd9Djks/17K3HEjR+1Rsf60xDtSy22paPa8tWc5jkAeFQ+NEzI6DV9t3Fl2Pl/YQ
         b+F/3RjJtWmHr4+BAJg89q1XQldiVJdEAWbtXUrD+NAc9P+l19DTpOWsBL1uJgEVJm
         gEHqIKyH1rqMW+2JYas7KMe/czz2LAYtxDKTKnRbaMJaMZAhyivCPbN2UMqSbR5ynN
         wRFUidmeRbGoQ==
Subject: Re: [PATCH] media: videobuf2: Print videobuf2 buffer state by name
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20200709174336.79112-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <161b6b37-1380-833c-1d74-efed75450f5f@xs4all.nl>
Date:   Fri, 10 Jul 2020 12:10:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709174336.79112-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNh3lMxH1XmGnAWZhPkSnc2T1g7L/W/LHJ9eSOW4RV4pgHklkVNNk303u//E5PYyKKDiqja6FjClLTf2mFS6+7UsT/tXbkAkRQCCtB/6O8J5nvMJDCLh
 3ISnuWjFXRjY/+GwsBuJ6tEcIJVTVkAN8NSaJgY4NFqja8C93zmL69EAJ1QpyfNT8AkS+egAmNfhveQFr8AyknuPvTpQ/psvugSh8SvloGpg4AX0Yn9+/5+4
 5b2GOYwPLzqcwcKNStG0jBhk26AJNABc76QcYFiyqIUdLQuVzCOfLHwmzBtPvdXC
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/07/2020 19:43, Ezequiel Garcia wrote:
> For debugging purposes, seeing the state integer
> representation is really inconvenient.
> 
> Improve this and be developer-friendly by printing
> the state name instead.
> 
> Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 32 ++++++++++++++-----
>  1 file changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index abaf28e057eb..8480772d58c6 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -191,6 +191,20 @@ module_param(debug, int, 0644);
>  static void __vb2_queue_cancel(struct vb2_queue *q);
>  static void __enqueue_in_driver(struct vb2_buffer *vb);
>  
> +static const char * const vb2_state_names[] = {
> +	[VB2_BUF_STATE_DEQUEUED] = "dequeued",
> +	[VB2_BUF_STATE_IN_REQUEST] = "in request",
> +	[VB2_BUF_STATE_PREPARING] = "preparing",
> +	[VB2_BUF_STATE_QUEUED] = "queued",
> +	[VB2_BUF_STATE_ACTIVE] = "active",
> +	[VB2_BUF_STATE_DONE] = "done",
> +	[VB2_BUF_STATE_ERROR] = "error",
> +};
> +
> +#define vb2_state_name(s) \
> +	(((unsigned int)(s)) < ARRAY_SIZE(vb2_state_names) ? \
> +	 vb2_state_names[s] : "unknown")

Can you turn this into a function?

That avoids this checkpatch warning:

CHECK: Macro argument reuse 's' - possible side-effects?
#37: FILE: drivers/media/common/videobuf2/videobuf2-core.c:204:
+#define vb2_state_name(s) \
+       (((unsigned int)(s)) < ARRAY_SIZE(vb2_state_names) ? \
+        vb2_state_names[s] : "unknown")

And I think a function is cleaner as well.

This looks good otherwise.

Regards,

	Hans

> +
>  /*
>   * __vb2_buf_mem_alloc() - allocate video memory for the given buffer
>   */
> @@ -1015,8 +1029,8 @@ void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state)
>  	 */
>  	vb->cnt_buf_done++;
>  #endif
> -	dprintk(q, 4, "done processing on buffer %d, state: %d\n",
> -			vb->index, state);
> +	dprintk(q, 4, "done processing on buffer %d, state: %s\n",
> +		vb->index, vb2_state_name(state));
>  
>  	if (state != VB2_BUF_STATE_QUEUED)
>  		__vb2_buf_mem_finish(vb);
> @@ -1490,8 +1504,8 @@ int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
>  
>  	vb = q->bufs[index];
>  	if (vb->state != VB2_BUF_STATE_DEQUEUED) {
> -		dprintk(q, 1, "invalid buffer state %d\n",
> -			vb->state);
> +		dprintk(q, 1, "invalid buffer state %s\n",
> +			vb2_state_name(vb->state));
>  		return -EINVAL;
>  	}
>  	if (vb->prepared) {
> @@ -1670,7 +1684,8 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>  		dprintk(q, 1, "buffer still being prepared\n");
>  		return -EINVAL;
>  	default:
> -		dprintk(q, 1, "invalid buffer state %d\n", vb->state);
> +		dprintk(q, 1, "invalid buffer state %s\n",
> +			vb2_state_name(vb->state));
>  		return -EINVAL;
>  	}
>  
> @@ -1884,7 +1899,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
>  		dprintk(q, 3, "returning done buffer with errors\n");
>  		break;
>  	default:
> -		dprintk(q, 1, "invalid buffer state\n");
> +		dprintk(q, 1, "invalid buffer state %s\n",
> +			vb2_state_name(vb->state));
>  		return -EINVAL;
>  	}
>  
> @@ -1915,8 +1931,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
>  		media_request_put(vb->request);
>  	vb->request = NULL;
>  
> -	dprintk(q, 2, "dqbuf of buffer %d, with state %d\n",
> -			vb->index, vb->state);
> +	dprintk(q, 2, "dqbuf of buffer %d, state: %s\n",
> +		vb->index, vb2_state_name(vb->state));
>  
>  	return 0;
>  
> 

