Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4DD3F69AF
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 21:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234424AbhHXTVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 15:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234287AbhHXTVa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 15:21:30 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF39AC061757
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 12:20:45 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so2539563pje.0
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 12:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mVPoYVWoIvb5FZ8mV7/5paxx0nV7NsVnW/KlyUCKuhA=;
        b=ItO9aTgPCLyylgqQH5P4MQ6LZ82koN27g+C017e7/xl7kVMH5aX3KWis8yt4wUVkjz
         wXxAZo1Q8eLMiOAddoLWaM84tLRf81rhbCmAohc/2+/UwUqeEdhOAiL2+G12JlKhzbpH
         ekC6QRzWvElQU52222Pns750NpbfIXJVUjyIbd4tPpOEExnSXybjVvgl56ljNmeLDmUN
         esoFzVFtQVpkl3aOw9YJyy9pQN97CxAds/fk+M8Q7QfvwMGmer7737do2vcvZU5l+FuF
         DbHrw2ZIHuglgesi++0vAVfK3geqR/zo/P07zpo8GBT95HUJApgtaMVW1g0nSBFqGu82
         wQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mVPoYVWoIvb5FZ8mV7/5paxx0nV7NsVnW/KlyUCKuhA=;
        b=YsgJvVEgy40tOVD08gOdt0VFRPZRHYkN0ZuSO1FF1S7ewdrLDcs5L3PAixr5yp+Wda
         Sx/54TgSc2a5CBkwLZQN3WwGmwwnPPrLIgiHLiFnpkfg88SLCKg1EmL+Ta6r0o4SDiVQ
         GrERp6JbbCRm6SPduutT/VHKYqVoFDp8b9aDC5cQkJMUdUXke7ZEBIKee0BoLB0Ea0UG
         yS1sFZH/WHXUJmvjXEzdNLXx1ynW1beCvNdMey/mIKksW6bYnbBnNBW3kseLV4U6QwLN
         bVhDVDtp31rpezMaLpkHFXQluosfNWpuuSZckgQHG3nTuOptl9BFQkth/FNasN14phgj
         X2nA==
X-Gm-Message-State: AOAM5303RWScMNd4V119eqCxibpp3saEKnuTN3miDMwZo46wwJA/g5/5
        Eo/HsnDVMsNSykHFSIKaK8aGbA==
X-Google-Smtp-Source: ABdhPJzSrMM4MxmIH6A8jSFtIdKi3nUJc7HYA8i2icWXwYCfSIFFuVlTcRtN6GWtJN/aAKArKjaNiw==
X-Received: by 2002:a17:902:e0cc:b0:134:7191:f39 with SMTP id e12-20020a170902e0cc00b0013471910f39mr10468342pla.36.1629832844892;
        Tue, 24 Aug 2021 12:20:44 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:4a93:46f4:da9a:4371])
        by smtp.gmail.com with ESMTPSA id 22sm23515422pgn.88.2021.08.24.12.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 12:20:44 -0700 (PDT)
Date:   Wed, 25 Aug 2021 03:20:39 +0800
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 7/9] media: mtk-vcodec: Add frame racing mode encode
 process
Message-ID: <YSVGh0/6mAgHFmPb@google.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-8-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816105934.28265-8-irui.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 16, 2021 at 06:59:32PM +0800, Irui Wang wrote:
> The frame_racing mode encoding is try to use the two venc cores:
s/is try/tries/

> frame#0 use core#0, frame#1 use core#1, frame#2 use core#0...,
s/use/uses/g

> Lock the device and enabe the clock by used core, for sequence
s/enabe/enable/

> header encoding, it always used core#0.
s/used/uses/

> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -273,6 +273,7 @@ struct vdec_pic_info {
>   * @decoded_frame_cnt: number of decoded frames
>   * @lock: protect variables accessed by V4L2 threads and worker thread such as
>   *	  mtk_video_dec_buf.
> + * @enc_idx: used to record encoded frame count
>   */
>  struct mtk_vcodec_ctx {
>  	enum mtk_instance_type type;
> @@ -313,6 +314,8 @@ struct mtk_vcodec_ctx {
>  	int decoded_frame_cnt;
>  	struct mutex lock;
>  
> +	int hw_id;
> +	int enc_idx;
hw_id lacks of kerneldoc which could introduce smatch warning.

> --- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
> @@ -15,6 +15,7 @@
>  
>  #include "mtk_vcodec_enc.h"
>  #include "mtk_vcodec_enc_pm.h"
> +#include "mtk_vcodec_enc_hw.h"
Please try to maintain the order.

> @@ -34,9 +35,9 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
>  		return -EINVAL;
>  	}
>  
> -	mtk_venc_lock(ctx);
> +	mtk_venc_lock(ctx, 0);
Does it make more sense to use ctx->hw_id instead 0 (even if it is always 0 in the path)?

>  	ret = ctx->enc_if->init(ctx);
> -	mtk_venc_unlock(ctx);
> +	mtk_venc_unlock(ctx, 0);
Same.

> @@ -46,9 +47,9 @@ int venc_if_set_param(struct mtk_vcodec_ctx *ctx,
>  {
>  	int ret = 0;
>  
> -	mtk_venc_lock(ctx);
> +	mtk_venc_lock(ctx, 0);
Same.

>  	ret = ctx->enc_if->set_param(ctx->drv_handle, type, in);
> -	mtk_venc_unlock(ctx);
> +	mtk_venc_unlock(ctx, 0);
Same.

> @@ -87,11 +76,67 @@ int venc_if_deinit(struct mtk_vcodec_ctx *ctx)
>  	if (!ctx->drv_handle)
>  		return 0;
>  
> -	mtk_venc_lock(ctx);
> +	mtk_venc_lock(ctx, 0);
Same.

>  	ret = ctx->enc_if->deinit(ctx->drv_handle);
> -	mtk_venc_unlock(ctx);
> +	mtk_venc_unlock(ctx, 0);
Same.

> +void venc_encode_unprepare(struct mtk_vcodec_ctx *ctx,
> +			   enum venc_start_opt opt)
> +{
> +	unsigned long flags;
> +	struct mtk_venc_comp_dev *venc;
> +
> +	/*clock off and unlock after irq done*/
> +	if (ctx->dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
> +		if (opt == VENC_START_OPT_ENCODE_SEQUENCE_HEADER) {
> +			mtk_vcodec_enc_clock_off(ctx->dev, ctx->hw_id);
> +			spin_lock_irqsave(&ctx->dev->irqlock, flags);
> +			venc = ctx->dev->enc_comp_dev[ctx->hw_id];
> +			venc->curr_ctx = NULL;
> +			spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
> +			mtk_venc_unlock(ctx, ctx->hw_id);
> +		}
> +	} else {
> +		mtk_vcodec_enc_clock_off(ctx->dev, ctx->hw_id);
> +		spin_lock_irqsave(&ctx->dev->irqlock, flags);
> +		ctx->dev->curr_ctx = NULL;
> +		spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
> +		mtk_venc_unlock(ctx, ctx->hw_id);
The few statements are identical.  Should try to reuse them.
