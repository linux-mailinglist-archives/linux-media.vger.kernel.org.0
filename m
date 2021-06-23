Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA653B21DE
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 22:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhFWUlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 16:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWUln (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 16:41:43 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE7EC061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 13:39:24 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d9so3154550qtx.8
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 13:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=k4qkyjL0MrUMIpFL541YoqkV0a+RVUlDDEI3e+/h4rs=;
        b=SFC/g9Pbp6+j+d7IOMmGPMWwujTnYEj5WMCWwUxRYlctQsqkC6eKTqxGq+GL6yg88Q
         4LDzZnkZY7bQq/Or6a+FxWCBT/eIHKr+dl7Oz/UxmTkum1VB8BzwM9/T7nGD20B12G6J
         xVA7mNjlJaz7lME5snh0OZJhPlPXnixusLax1+F2WWJGN93GToEdf21sbYD3z+lbTdWy
         bqzZWPC1zA4IDZ737Z2XZtDsslr8ASttUcTB8t9HWttq0W28TxRumLX8VH00RwyWpR1F
         B1PvS3DlG683HfdEhnWWBcQwd6XVPE35JQNfEKb673GQzZQaDbqdspNLG2WufRkFTeGU
         CpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=k4qkyjL0MrUMIpFL541YoqkV0a+RVUlDDEI3e+/h4rs=;
        b=a4Enh7P4jwRTxxyv0JTo3snS7sHF8mRikOIE16sZCEqPuV/idGERZoj9RyhfQvUkQL
         tK+Dkqg3ydHsd7le0acDK9T/GmiKK6W8xvWb90BcxcU7ms1WaV9Ryo1mgUdZug8Bpkvl
         zMYZjjU5vdwgfgPcr1NBV+lRAaY6WWRbs2whzRqXVKancOZqe7a3VG0qcE8tuJBwJZVi
         14CHjNG6hD3MgrWoSfYTY5Ikj56SL/xYETdbzFdowNhjLkNumkaklERchp24JPguNb3i
         9f2hbWLEjxWJTViUBaU2j4dhYP2eHKwQo8FuClRC6ZpV/ldBEkhjr9p9fUULuoOpVw9v
         OmBQ==
X-Gm-Message-State: AOAM531nEME6cUG6R/ShrGlGfCqjpaa/BZgeqs3JNnIR2RNurI5aPxNq
        rdwdqq37mBV4StkhOMvY7rt8DQ==
X-Google-Smtp-Source: ABdhPJwE9Fc8YWuz0fP2FWaiBDsjRZxWU9YXo1MKTeTpTpbBSDBB10fgqFWH0JOnlCar5xWpuBEdWg==
X-Received: by 2002:a05:622a:1886:: with SMTP id v6mr1708062qtc.91.1624480763969;
        Wed, 23 Jun 2021 13:39:23 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 4sm799203qkv.134.2021.06.23.13.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 13:39:23 -0700 (PDT)
Message-ID: <b79f0b84998148b869ba90dc555a60e1807dd0a5.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] hantro: vp8: Move noisy WARN_ON to vpu_debug
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, kernel@collabora.com
Date:   Wed, 23 Jun 2021 16:39:22 -0400
In-Reply-To: <20210621231157.226962-2-ezequiel@collabora.com>
References: <20210621231157.226962-1-ezequiel@collabora.com>
         <20210621231157.226962-2-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 21 juin 2021 à 20:11 -0300, Ezequiel Garcia a écrit :
> When the VP8 decoders can't find a reference frame,
> the driver falls back to the current output frame.
> 
> This will probably produce some undesirable results,
> leading to frame corruption, but shouldn't cause
> noisy warnings.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Greatly appreciated fix.

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro_g1_vp8_dec.c    | 13 ++++++++++---
>  .../staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c | 13 ++++++++++---
>  2 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> index 96622a7f8279..7f88dcee1473 100644
> --- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> @@ -376,12 +376,17 @@ static void cfg_ref(struct hantro_ctx *ctx,
>  	vb2_dst = hantro_get_dst_buf(ctx);
>  
>  	ref = hantro_get_ref(ctx, hdr->last_frame_ts);
> -	if (!ref)
> +	if (!ref) {
> +		vpu_debug(0, "failed to find last frame ts=%ld\n",
> +			  hdr->last_frame_ts);
>  		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
> +	}
>  	vdpu_write_relaxed(vpu, ref, G1_REG_ADDR_REF(0));
>  
>  	ref = hantro_get_ref(ctx, hdr->golden_frame_ts);
> -	WARN_ON(!ref && hdr->golden_frame_ts);
> +	if (!ref && hdr->golden_frame_ts)
> +		vpu_debug(0, "failed to find golden frame ts=%ld\n",
> +			  hdr->golden_frame_ts);
>  	if (!ref)
>  		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
>  	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN)
> @@ -389,7 +394,9 @@ static void cfg_ref(struct hantro_ctx *ctx,
>  	vdpu_write_relaxed(vpu, ref, G1_REG_ADDR_REF(4));
>  
>  	ref = hantro_get_ref(ctx, hdr->alt_frame_ts);
> -	WARN_ON(!ref && hdr->alt_frame_ts);
> +	if (!ref && hdr->alt_frame_ts)
> +		vpu_debug(0, "failed to find alt frame ts=%ld\n",
> +			  hdr->alt_frame_ts);
>  	if (!ref)
>  		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
>  	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT)
> diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
> index 951b55f58a61..cd53748efe4e 100644
> --- a/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
> +++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_vp8_dec.c
> @@ -453,12 +453,17 @@ static void cfg_ref(struct hantro_ctx *ctx,
>  	vb2_dst = hantro_get_dst_buf(ctx);
>  
>  	ref = hantro_get_ref(ctx, hdr->last_frame_ts);
> -	if (!ref)
> +	if (!ref) {
> +		vpu_debug(0, "failed to find last frame ts=%ld\n",
> +			  hdr->last_frame_ts);
>  		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
> +	}
>  	vdpu_write_relaxed(vpu, ref, VDPU_REG_VP8_ADDR_REF0);
>  
>  	ref = hantro_get_ref(ctx, hdr->golden_frame_ts);
> -	WARN_ON(!ref && hdr->golden_frame_ts);
> +	if (!ref && hdr->golden_frame_ts)
> +		vpu_debug(0, "failed to find golden frame ts=%ld\n",
> +			  hdr->golden_frame_ts);
>  	if (!ref)
>  		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
>  	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN)
> @@ -466,7 +471,9 @@ static void cfg_ref(struct hantro_ctx *ctx,
>  	vdpu_write_relaxed(vpu, ref, VDPU_REG_VP8_ADDR_REF2_5(2));
>  
>  	ref = hantro_get_ref(ctx, hdr->alt_frame_ts);
> -	WARN_ON(!ref && hdr->alt_frame_ts);
> +	if (!ref && hdr->alt_frame_ts)
> +		vpu_debug(0, "failed to find alt frame ts=%ld\n",
> +			  hdr->alt_frame_ts);
>  	if (!ref)
>  		ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
>  	if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT)


