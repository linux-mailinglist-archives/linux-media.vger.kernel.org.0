Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A03750323
	for <lists+linux-media@lfdr.de>; Wed, 12 Jul 2023 11:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbjGLJdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jul 2023 05:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjGLJdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jul 2023 05:33:07 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2928519B
        for <linux-media@vger.kernel.org>; Wed, 12 Jul 2023 02:33:06 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a3a8d21208so5825393b6e.0
        for <linux-media@vger.kernel.org>; Wed, 12 Jul 2023 02:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689154385; x=1691746385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MOnAPplK45yWExk2j21a6cA7IoRMgLzv1Jxz88tXIc0=;
        b=PcLNhca/6z077HXDo5LWfQMGC69hh/ZPxvakjG/WZkazez+JDO95Tvh5iwP17nlfwa
         Opg9Wjx0Yo8sCUbQWLw2GWOOuO5nCQ8oXDQYuo8s/IoaiUvpiFvbMH1uKvJiK9K7dOiU
         ACtnsCO7XmxmwRywLo1J2lWn2A5kyltkIxtx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689154385; x=1691746385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOnAPplK45yWExk2j21a6cA7IoRMgLzv1Jxz88tXIc0=;
        b=kTnaoLOFPKNEKmylq/4g3dp4cvBHDSLa3ZGj/SSa4/SOWSN1bRFC05s99sAgaYwZFF
         Cd2beUDbjp8WqOz09M0uGz1tNdFNQ6PGpZOyrFbLZEnDXS1zoV/eGxthrYMAYbFu9yWK
         tYfz84zt5U8HpcM5RnA3mHbN7hN7B5bf4QQ5A261XAWwI5lWy9JImGCpo8JqkrHS5NO9
         IcyY6z7Q4BnGqcjeCcOUX+d5Sd5gjedofp8RlEIVe4JV+NeCGtFQTjCqa2I3IEZAv4/C
         Vh4SmM+GsitHnXzYS6qExhNY7Wm8RCVSj9GB/mdk6WNUPDfpe5tfDzMtNhClyW7/0RTW
         8dBg==
X-Gm-Message-State: ABy/qLaxjmTULpJFivmqiol8bYIqIf5UZXeaKoqH17Rb4C/Pp0fURx/x
        TP47zhkapmCYyd9/Wv/cF6w+0g==
X-Google-Smtp-Source: APBJJlF6V7vhR37O4nybU5mnYo+ONRyJGo8I/XK0Y1AFtY9pNmwHcucGtQGS0lOiuv+enjk6eOPhVQ==
X-Received: by 2002:a05:6358:5283:b0:131:127d:4b59 with SMTP id g3-20020a056358528300b00131127d4b59mr20556361rwa.23.1689154385354;
        Wed, 12 Jul 2023 02:33:05 -0700 (PDT)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id o17-20020a639211000000b00553ad4ae5e5sm3029979pgd.22.2023.07.12.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 02:33:04 -0700 (PDT)
Date:   Wed, 12 Jul 2023 09:33:01 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Hsia-Jun Li <randy.li@synaptics.com>
Cc:     linux-media@vger.kernel.org, ayaka@soulik.info,
        hans.verkuil@cisco.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, hiroh@chromium.org,
        hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        nicolas@ndufresne.ca
Subject: Re: [PATCH 2/2] media: v4l2-mem2mem: add a list for buf used by hw
Message-ID: <20230712093301.nkj2vok2x7esdhb3@chromium.org>
References: <20230704040044.681850-1-randy.li@synaptics.com>
 <20230704040044.681850-3-randy.li@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704040044.681850-3-randy.li@synaptics.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 04, 2023 at 12:00:38PM +0800, Hsia-Jun Li wrote:
> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> 
> Many drivers have to create its own buf_struct for a
> vb2_queue to track such a state. Also driver has to
> iterate over rdy_queue every times to find out a buffer
> which is not sent to hardware(or firmware), this new
> list just offers the driver a place to store the buffer
> that hardware(firmware) has acknowledged.
> 
> One important advance about this list, it doesn't like
> rdy_queue which both bottom half of the user calling
> could operate it, while the v4l2 worker would as well.
> The v4l2 core could only operate this queue when its
> v4l2_context is not running, the driver would only
> access this new hw_queue in its own worker.

Could you describe in what case such a list would be useful for a
mem2mem driver?

> 
> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 25 +++++++++++++++++--------
>  include/media/v4l2-mem2mem.h           | 10 +++++++++-
>  2 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index c771aba42015..b4151147d5bd 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -321,15 +321,21 @@ static void __v4l2_m2m_try_queue(struct v4l2_m2m_dev *m2m_dev,
>  		goto job_unlock;
>  	}
>  
> -	src = v4l2_m2m_next_src_buf(m2m_ctx);
> -	dst = v4l2_m2m_next_dst_buf(m2m_ctx);
> -	if (!src && !m2m_ctx->out_q_ctx.buffered) {
> -		dprintk("No input buffers available\n");
> -		goto job_unlock;
> +	if (list_empty(&m2m_ctx->out_q_ctx.hw_queue)) {
> +		src = v4l2_m2m_next_src_buf(m2m_ctx);
> +
> +		if (!src && !m2m_ctx->out_q_ctx.buffered) {
> +			dprintk("No input buffers available\n");
> +			goto job_unlock;
> +		}
>  	}
> -	if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
> -		dprintk("No output buffers available\n");
> -		goto job_unlock;
> +
> +	if (list_empty(&m2m_ctx->cap_q_ctx.hw_queue)) {
> +		dst = v4l2_m2m_next_dst_buf(m2m_ctx);
> +		if (!dst && !m2m_ctx->cap_q_ctx.buffered) {
> +			dprintk("No output buffers available\n");
> +			goto job_unlock;
> +		}
>  	}

src and dst would be referenced unitialized below if neither of the
above ifs hits...

Best regards,
Tomasz

>  
>  	m2m_ctx->new_frame = true;
> @@ -896,6 +902,7 @@ int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  	INIT_LIST_HEAD(&q_ctx->rdy_queue);
>  	q_ctx->num_rdy = 0;
>  	spin_unlock_irqrestore(&q_ctx->rdy_spinlock, flags);
> +	INIT_LIST_HEAD(&q_ctx->hw_queue);
>  
>  	if (m2m_dev->curr_ctx == m2m_ctx) {
>  		m2m_dev->curr_ctx = NULL;
> @@ -1234,6 +1241,8 @@ struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct v4l2_m2m_dev *m2m_dev,
>  
>  	INIT_LIST_HEAD(&out_q_ctx->rdy_queue);
>  	INIT_LIST_HEAD(&cap_q_ctx->rdy_queue);
> +	INIT_LIST_HEAD(&out_q_ctx->hw_queue);
> +	INIT_LIST_HEAD(&cap_q_ctx->hw_queue);
>  	spin_lock_init(&out_q_ctx->rdy_spinlock);
>  	spin_lock_init(&cap_q_ctx->rdy_spinlock);
>  
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index d6c8eb2b5201..2342656e582d 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -53,9 +53,16 @@ struct v4l2_m2m_dev;
>   *	processed
>   *
>   * @q:		pointer to struct &vb2_queue
> - * @rdy_queue:	List of V4L2 mem-to-mem queues
> + * @rdy_queue:	List of V4L2 mem-to-mem queues. If v4l2_m2m_buf_queue() is
> + *		called in struct vb2_ops->buf_queue(), the buffer enqueued
> + *		by user would be added to this list.
>   * @rdy_spinlock: spin lock to protect the struct usage
>   * @num_rdy:	number of buffers ready to be processed
> + * @hw_queue:	A list for tracking the buffer is occupied by the hardware
> + * 		(or device's firmware). A buffer could only be in either
> + * 		this list or @rdy_queue.
> + * 		Driver may choose not to use this list while uses its own
> + * 		private data to do this work.
>   * @buffered:	is the queue buffered?
>   *
>   * Queue for buffers ready to be processed as soon as this
> @@ -68,6 +75,7 @@ struct v4l2_m2m_queue_ctx {
>  	struct list_head	rdy_queue;
>  	spinlock_t		rdy_spinlock;
>  	u8			num_rdy;
> +	struct list_head	hw_queue;
>  	bool			buffered;
>  };
>  
> -- 
> 2.17.1
> 
