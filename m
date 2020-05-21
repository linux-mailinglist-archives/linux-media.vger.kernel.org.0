Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1CD1DD11F
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 17:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729786AbgEUPW5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 11:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729633AbgEUPW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 11:22:56 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86ABFC061A0F
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 08:22:56 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id v19so94617wmj.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BAKLcpITx/3kGgWTBYxDEZTohF/5xKJj7rJDCLE80Zo=;
        b=jO1m0/v5PI18i/EX4FCyeJ0cr5KPOWycKpGnRQGN0bSwCpxt8XWGDKkwubaWb0doVL
         QFggHPhQuapuwFk2GcAO/sFU/5KXmx6tmurSe+maOk6IxIvLE1mzL7tSB5gKF1y76rqk
         6N5xVsZYZakqqegyFos4roVrtKTae2J8IVQO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BAKLcpITx/3kGgWTBYxDEZTohF/5xKJj7rJDCLE80Zo=;
        b=dc47gy3eZe/eWpkDwSNZeC9SXuru4ZGp4t7OJKUplWhlvxiTHkAwxAYFRApGFasuBv
         2pKqW5uFf9Wc346au0NKyWO8EPtq10f2YsWqheh+CzXmgOxp4LejhteI2L8n4gEO2+6W
         F/4c7JIY7ghxnlW3qZWIDHL/lC/0H8HtxsDJH9i0nXo7XEWpvuvbDGcwpGkjRQqHjisz
         Rh6ie8yjY6UauaPHADEEgT1WBzPlpWcsNnT/LWRl+8tY/Xw2atmuMSvHFaY6S1Rf/TnQ
         Rv6Jeq0szwwOVKkdJ0pRcnpi1o4gMmfQ50AxvYqBLhtP0hwDJCJVBIR9PffflA/1QrlZ
         GTdQ==
X-Gm-Message-State: AOAM530mIG6VbdwQxemMZHAZjBvcrAantvBpNa7FDfl+bci7IVl1X0HY
        7quEWInx6KNnkczf+9w/dU/fkQ==
X-Google-Smtp-Source: ABdhPJwMue+mt+thE6n7MP8xM0aOjfshOU4d1sP9ElGBs9Eu1VhZydaalBi9QV0v2+BvJeu8Riv4sg==
X-Received: by 2002:a1c:a74a:: with SMTP id q71mr9177584wme.23.1590074575192;
        Thu, 21 May 2020 08:22:55 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id j190sm7073152wmb.33.2020.05.21.08.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:22:54 -0700 (PDT)
Date:   Thu, 21 May 2020 15:22:53 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com, sj.huang@mediatek.com
Subject: Re: [PATCH v8 05/14] media: platform: Improve power on and power off
 flow
Message-ID: <20200521152253.GE209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-6-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-6-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:24PM +0800, Xia Jiang wrote:
> Call pm_runtime_get_sync() before starting a frame and then
> pm_runtime_put() after completing it. This can save power for the time
> between processing two frames.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 27 +++++--------------
>  1 file changed, 6 insertions(+), 21 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index a536fa95b3d6..dd5cadd101ef 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -710,23 +710,6 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
>  		return v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>  }
>  
> -static int mtk_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
> -{
> -	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
> -	struct vb2_v4l2_buffer *vb;
> -	int ret = 0;
> -
> -	ret = pm_runtime_get_sync(ctx->jpeg->dev);
> -	if (ret < 0)
> -		goto err;
> -
> -	return 0;
> -err:
> -	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
> -		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_QUEUED);
> -	return ret;
> -}
> -
>  static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
>  {
>  	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
> @@ -751,8 +734,6 @@ static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
>  
>  	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
>  		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> -
> -	pm_runtime_put_sync(ctx->jpeg->dev);
>  }
>  
>  static const struct vb2_ops mtk_jpeg_qops = {
> @@ -761,7 +742,6 @@ static const struct vb2_ops mtk_jpeg_qops = {
>  	.buf_queue          = mtk_jpeg_buf_queue,
>  	.wait_prepare       = vb2_ops_wait_prepare,
>  	.wait_finish        = vb2_ops_wait_finish,
> -	.start_streaming    = mtk_jpeg_start_streaming,
>  	.stop_streaming     = mtk_jpeg_stop_streaming,
>  };
>  
> @@ -812,7 +792,7 @@ static void mtk_jpeg_device_run(void *priv)
>  	struct mtk_jpeg_src_buf *jpeg_src_buf;
>  	struct mtk_jpeg_bs bs;
>  	struct mtk_jpeg_fb fb;
> -	int i;
> +	int i, ret;
>  
>  	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> @@ -832,6 +812,10 @@ static void mtk_jpeg_device_run(void *priv)
>  		return;
>  	}
>  
> +	ret = pm_runtime_get_sync(jpeg->dev);
> +	if (ret < 0)
> +		goto dec_end;
> +
>  	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
>  	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
>  		goto dec_end;
> @@ -957,6 +941,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	v4l2_m2m_buf_done(dst_buf, buf_state);
>  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +	pm_runtime_put_sync(ctx->jpeg->dev);

The _sync variant explicitly waits until the asynchronous PM operation
completes. This is usually undesired, because the CPU stays blocked for
no good reason. In this context it is actually a bug, because this is an
interrupt handler and it's not allowed to sleep. I wonder why this
actually didn't crash in your testing. Please change to the regular
pm_runtime_put().

Best regards,
Tomasz
