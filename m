Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA4E1F6778
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 14:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgFKMIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 08:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgFKMIZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 08:08:25 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A49C08C5C1
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 05:08:24 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d128so4804769wmc.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l9/1IkVcWGgYEUiuZWnQIOE6uUjuPXFr0zUWFBzg324=;
        b=kIE33h7Lf2r+tx6hQ/ix/6+/19I3lB8Ldey0jlumYHalyyXnEmqjH3Ykw4mPIPgrcv
         4dkNF36frta7vt0Et8JEAJhO/OWx50XwV4omuBKChHuTgqeA1dZ4TD8tQT9UZmcYYDBD
         iVtWJnbCi9wgpwY0FWz7KnMUpzhRVlUGS2xbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l9/1IkVcWGgYEUiuZWnQIOE6uUjuPXFr0zUWFBzg324=;
        b=F+xzmYC295uBPqjj1fVn6hfb7ryBIpPSLWiVvEIdwsm8oc5zEmQvhsiyp2+LSUQt0f
         ar09kRNFG79+K6UU+WMoETn5bqWKLvktj7RfSX/ROl2292mtHEwyPwqy7roYWf8+hMdo
         NOYtLhP5I+zeQRHJdGuVKMQ0kBWggF685OEYZMSTu+H0/uXJzSom27EjDo4DrRgm/iUn
         YkPT6SaV26a9FE9maEVtne2NW8LUp+6Ygaa+fEcTRdeoXqbTwWiV63bisQuW9rflCx1A
         +spS9LG0iO1DwXemjtkOH4e9qHxv/zp43B9tUpn9Lh3It1DXN+FtTGD5Bshs573n4/E9
         rt2w==
X-Gm-Message-State: AOAM531VOpEXgcg0lwC3AvOnK+9pl+4bX5CEWLexY94GR+rK9mWvN9iW
        XuOp7TnNJKm9wQNEBySwQ+BSog==
X-Google-Smtp-Source: ABdhPJw/4tFHFEvAplryswUi9eYGwKBoFlfEALinuD5TCcI+/+xf1W81Wni9oObHj3ji4UEsPf8kKQ==
X-Received: by 2002:a1c:7416:: with SMTP id p22mr7953394wmc.95.1591877303012;
        Thu, 11 Jun 2020 05:08:23 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5sm6618926wrr.5.2020.06.11.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 05:08:22 -0700 (PDT)
Date:   Thu, 11 Jun 2020 12:08:20 +0000
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
Subject: Re: [PATCH RESEND v9 05/18] media: platform: Improve power on and
 power off flow
Message-ID: <20200611120820.GC135826@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-7-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-7-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:40PM +0800, Xia Jiang wrote:
> Call pm_runtime_get_sync() before starting a frame and then
> pm_runtime_put() after completing it. This can save power for the time
> between processing two frames.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: use pm_runtime_put() to replace pm_runtime_put_sync()
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 27 +++++--------------
>  1 file changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 12609ca46fd9..fb624385969e 100644
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
> +	pm_runtime_put(ctx->jpeg->dev);

This patch itself is correct and feel free to add my

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

However, it looks like there might be one more problem with this driver.
What happens if the hardware locks up? The driver doesn't seem to take
any measures to detect that and recover the system.

If you take a look at other drivers, e.g. the MTK FD driver, there is a
delayed work scheduled before starting the hardware and canceled in the
interrupt handler. If the delayed work is executed, it resets the
hardware and reports the failure to V4L2, so that the execution can
continue from next frames.

This should be fixed in a separate patch, could be outside of this
series.

Best regards,
Tomasz
