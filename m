Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF111DD1EF
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 17:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729920AbgEUPdE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 11:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgEUPdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 11:33:02 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EE3C061A0E
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 08:33:01 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u12so1994824wmd.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a+XGEo7RdRLWXaBT5I1D5SW4Aa/jygWE9YUzvCS9gvI=;
        b=C6QnsephZ4AXYbZbM1y/Cghfe4u+luUWsgG6OhW+RMXWdsfoZHD3nxlNwa1hYOht3T
         WTfDVrMB9YUP/UOKUCF8OVzgeCtW2v5g8iWYm18a9M2nlHg/NnB8Ir6MPtJ5w+UhTuNZ
         xvN1sB6mgklbOCg7LJog22flxrih0eY9gDBhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a+XGEo7RdRLWXaBT5I1D5SW4Aa/jygWE9YUzvCS9gvI=;
        b=ad+OK66PTph3gaUyeIsmDoWLijaFjcdpWeYmOZF5/7XlTY5SxgmazrJv58qas6eELt
         BtTzjt+eOf0iqJ1NO5YDhKvec2HkyM3f6FoKHER+09l5n6864IF08vbHX3SwOkoOVsOI
         DqVu0Rft4BYjX/OLKpuWbZ7EitI94RhlbSt4ID7ijspoJqXojjojRv274HMqrybX53Od
         IRG44EzaRPuA7CdlI2P5IqCh8OMmo/6VsngnpN1g3CupPM/ZHwSSx2jCZVBPAPWVoTTi
         /q2E9QW/HijByw2duzSYRClg3IqVK7CiZeDj9PgtASrZBeLO2ChfaOJl/La0UGB64okw
         Fhdg==
X-Gm-Message-State: AOAM5333bl2MGQMLZvMCNsIlM0UQCOC1Csw3/OLpZwIKduPFs81lOQ95
        yrJAzaXanAqXebp8pmghj2J4eQ==
X-Google-Smtp-Source: ABdhPJx2S+yj9zmPBMi83WiNn64bblaOIC/n37oVO4cTDq4iHNfMT2oRcmN73GTSL9Yc4JsMWCaKAA==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr9202139wmk.168.1590075179928;
        Thu, 21 May 2020 08:32:59 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id i11sm7245926wrc.35.2020.05.21.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:32:59 -0700 (PDT)
Date:   Thu, 21 May 2020 15:32:57 +0000
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
Subject: Re: [PATCH v8 06/14] media: platform: Improve the implementation of
 the system PM ops
Message-ID: <20200521153257.GF209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-7-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-7-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:25PM +0800, Xia Jiang wrote:
> Cancel reset hw operation in suspend and resume function because this
> will be done in device_run().

This and...

> Add spin_lock and unlock operation in irq and resume function to make
> sure that the current frame is processed completely before suspend.

...this are two separate changes. Please split.

> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index dd5cadd101ef..2fa3711fdc9b 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -911,6 +911,8 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
>  	u32 dec_ret;
>  	int i;
>  
> +	spin_lock(&jpeg->hw_lock);
> +

nit: For consistency, it is recommended to always use the same, i.e. the
strongest, spin_(un)lock_ primitives when operating on the same spinlock.
In this case it would be the irqsave(restore) variants.

>  	dec_ret = mtk_jpeg_dec_get_int_status(jpeg->dec_reg_base);
>  	dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
>  	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
> @@ -941,6 +943,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	v4l2_m2m_buf_done(dst_buf, buf_state);
>  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +	spin_unlock(&jpeg->hw_lock);
>  	pm_runtime_put_sync(ctx->jpeg->dev);
>  	return IRQ_HANDLED;
>  }
> @@ -1191,7 +1194,6 @@ static __maybe_unused int mtk_jpeg_pm_suspend(struct device *dev)
>  {
>  	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
>  
> -	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
>  	mtk_jpeg_clk_off(jpeg);
>  
>  	return 0;
> @@ -1202,19 +1204,24 @@ static __maybe_unused int mtk_jpeg_pm_resume(struct device *dev)
>  	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
>  
>  	mtk_jpeg_clk_on(jpeg);
> -	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
>  
>  	return 0;
>  }
>  
>  static __maybe_unused int mtk_jpeg_suspend(struct device *dev)
>  {
> +	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
> +	unsigned long flags;
>  	int ret;
>  
>  	if (pm_runtime_suspended(dev))
>  		return 0;
>  
> +	spin_lock_irqsave(&jpeg->hw_lock, flags);

What does this spinlock protect us from? I can see that it would prevent
the interrupt handler from being called, but is it okay to suspend the
system without handling the interrupt?

> +
>  	ret = mtk_jpeg_pm_suspend(dev);
> +

Looking at the implementation of mtk_jpeg_pm_suspend(), all it does is
disabling the clock. How do we make sure that there is no frame currently
being processed by the hardware?

Best regards,
Tomasz
