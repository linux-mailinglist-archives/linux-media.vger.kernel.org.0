Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 708528FF1E
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 11:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfHPJgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 05:36:00 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37662 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbfHPJgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 05:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=xZAp+NmK/kmRDpT68oWZFHWaiJ2ni7hQ9imVo9tcS3s=; b=SUPexplAuupwSh5PwDezDKayc
        Xqyww/qlVlFauud1GpoxxieQkqznaqrnPODhiKWHBymBzy9KgoFVPtiZNFppCSn1wxV5nxFjcdv2K
        030akKppmhPCmuKgHLhS4xJh6Uej813+j3jAH3C2/91+YRh7fmCrHoayWdPfwAsc8RYXgleKtGmGT
        2MqKqXZxrPtAgeFwaeEFTfOMnXDhXlenakw8VA3ANEonub5sts15gTxgJWuGzYkoWixFFbrFgjNbf
        YIaotcJOkfpzP5xAnA+uTkaG5lK87wtoLQeoHQqzmlVJkLj46M+pxfjAc2RXFwVCHdwenp4cglJFB
        swyY1lFAA==;
Received: from [191.249.103.100] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hyYeK-0003U6-7y; Fri, 16 Aug 2019 09:35:57 +0000
Date:   Fri, 16 Aug 2019 06:35:52 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] videobuf2-core: avoid buffer operations while in
 stop_streaming
Message-ID: <20190816063552.06a33a9b@coco.lan>
In-Reply-To: <475fff8b-9a11-0511-2226-a1767016746e@xs4all.nl>
References: <475fff8b-9a11-0511-2226-a1767016746e@xs4all.nl>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 15 Aug 2019 14:28:02 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> The stop_streaming callback is called with the queue lock held.
> 
> But some drivers (vivid being one of them) need to stop a kernel thread
> in stop_streaming, and if that kernel thread takes the same queue lock,
> then stop_streaming may have to unlock the queue lock, stop the thread,
> and lock it again.

I suspect that this is the real issue here: stop_streaming should keep
the lock held until it finishes.

Why don't you just stop the thread just before calling VB2?

IMO, the best fix is to really fix vivid for it to do the right thing,
instead of adding another hack at the VB2 core just due to it.

Regards,
Mauro

> 
> However, if you do that, then you must ensure that no other operations
> can take place that can change the list of buffers queued to the driver,
> specifically: QBUF, STREAMON/OFF, REQBUFS, CREATE_BUFS.
> 
> __vb2_wait_for_done_vb() also checks for this and won't try to wait for
> new buffers if in_stop_streaming is true.
> 
> This issue caused this syzbot report:
> 
> https://syzkaller.appspot.com/bug?extid=736c3aae4af7b50d9683
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: syzbot+736c3aae4af7b50d9683@syzkaller.appspotmail.com
> ---
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 4489744fbbd9..7c70bb9f6cb8 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -677,6 +677,11 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  		return -EBUSY;
>  	}
> 
> +	if (q->in_stop_streaming) {
> +		dprintk(1, "reqbufs while the stream is being stopped\n");
> +		return -EBUSY;
> +	}
> +
>  	if (q->waiting_in_dqbuf && *count) {
>  		dprintk(1, "another dup()ped fd is waiting for a buffer\n");
>  		return -EBUSY;
> @@ -811,6 +816,11 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
>  	int ret;
> 
> +	if (q->in_stop_streaming) {
> +		dprintk(1, "create_bufs while the stream is being stopped\n");
> +		return -EBUSY;
> +	}
> +
>  	if (q->num_buffers == VB2_MAX_FRAME) {
>  		dprintk(1, "maximum number of buffers already allocated\n");
>  		return -ENOBUFS;
> @@ -1514,6 +1524,11 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>  	struct vb2_buffer *vb;
>  	int ret;
> 
> +	if (q->in_stop_streaming) {
> +		dprintk(1, "qbuf while the stream is being stopped\n");
> +		return -EBUSY;
> +	}
> +
>  	if (q->error) {
>  		dprintk(1, "fatal error occurred on queue\n");
>  		return -EIO;
> @@ -1675,6 +1690,11 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
>  			return -EBUSY;
>  		}
> 
> +		if (q->in_stop_streaming) {
> +			dprintk(1, "the stream is being stopped, will not wait for buffers\n");
> +			return -EINVAL;
> +		}
> +
>  		if (!q->streaming) {
>  			dprintk(1, "streaming off, will not wait for buffers\n");
>  			return -EINVAL;
> @@ -1716,7 +1736,7 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
>  		dprintk(3, "will sleep waiting for buffers\n");
>  		ret = wait_event_interruptible(q->done_wq,
>  				!list_empty(&q->done_list) || !q->streaming ||
> -				q->error);
> +				q->in_stop_streaming || q->error);
> 
>  		/*
>  		 * We need to reevaluate both conditions again after reacquiring
> @@ -1866,12 +1886,18 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
>  {
>  	unsigned int i;
> 
> +	if (WARN_ON(q->in_stop_streaming))
> +		return;
> +
>  	/*
>  	 * Tell driver to stop all transactions and release all queued
>  	 * buffers.
>  	 */
> -	if (q->start_streaming_called)
> +	if (q->start_streaming_called) {
> +		q->in_stop_streaming = 1;
>  		call_void_qop(q, stop_streaming, q);
> +		q->in_stop_streaming = 0;
> +	}
> 
>  	/*
>  	 * If you see this warning, then the driver isn't cleaning up properly
> @@ -1975,6 +2001,11 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
>  		return -EINVAL;
>  	}
> 
> +	if (q->in_stop_streaming) {
> +		dprintk(1, "streamon while the stream is being stopped\n");
> +		return -EBUSY;
> +	}
> +
>  	if (q->streaming) {
>  		dprintk(3, "already streaming\n");
>  		return 0;
> @@ -2026,6 +2057,11 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type)
>  		return -EINVAL;
>  	}
> 
> +	if (q->in_stop_streaming) {
> +		dprintk(1, "streamoff while the stream is being stopped\n");
> +		return -EBUSY;
> +	}
> +
>  	/*
>  	 * Cancel will pause streaming and remove all buffers from the driver
>  	 * and videobuf, effectively returning control over them to userspace.
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 640aabe69450..c4b7edd25e13 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -535,6 +535,9 @@ struct vb2_buf_ops {
>   * @streaming:	current streaming state
>   * @start_streaming_called: @start_streaming was called successfully and we
>   *		started streaming.
> + * @in_stop_streaming: set when calling @stop_streaming. While 1, no new buffers
> + * 		can be queued or created, and neither is it possible to start or
> + * 		stop streaming.
>   * @error:	a fatal error occurred on the queue
>   * @waiting_for_buffers: used in poll() to check if vb2 is still waiting for
>   *		buffers. Only set for capture queues if qbuf has not yet been
> @@ -595,6 +598,7 @@ struct vb2_queue {
> 
>  	unsigned int			streaming:1;
>  	unsigned int			start_streaming_called:1;
> +	unsigned int			in_stop_streaming:1;
>  	unsigned int			error:1;
>  	unsigned int			waiting_for_buffers:1;
>  	unsigned int			waiting_in_dqbuf:1;



Thanks,
Mauro
