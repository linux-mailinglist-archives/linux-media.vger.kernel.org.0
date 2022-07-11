Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1131D562167
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 19:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235780AbiF3Rkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 13:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234838AbiF3Rki (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 13:40:38 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF232BB04
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 10:40:37 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-f2a4c51c45so165557fac.9
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 10:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EGE13E6ZZhU25BMBFH6IJpwsNUcglEsD50ZGiHxhMVQ=;
        b=wjpd5H5KnbK7QTTI1de178JpUIRh8kjd3V+neF7jaJMjKPOwwd8Yj3j6ypd/aj7XyM
         FzeRco6DWJdluLH2th9Nq4HXW38kLqUF3qG1n4XIiBYQ5zcqmNYdWeZizDCDQ33xm8Wy
         Aq73WpUD4rUGSpe56pix+rm8fChl04rPKwtNEekm2OFX5I3OGhJuYUwpxV1TeRJd7F+D
         DeLAlCLrs2bVcRtK5YhtTnLLRzsRtx3/T3KAsaF6pCoOXqbOymhLjFdHJ26WHOojebDo
         BTXJy5O7P4JetRaGRewOjy+iWEcba8u1xtxPSn+QL8OvxWqlXeoLpkq0C6SbUnx176lO
         RFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EGE13E6ZZhU25BMBFH6IJpwsNUcglEsD50ZGiHxhMVQ=;
        b=yPzAXosUk7zH5CMT00BG4xnk8UV+Tkfap2+VxHK1BgXFnyp40Oa+0E2fSHE29qX93M
         Hwk9+EMdd9CH/gXuztTjtIdOXN60sovsu2N9XRrgY78M4asx9QhPGCYju06e2cfYUajG
         eCzwYlSbqKNL0UQnGE4Zm4nixor9tY3CYZq4gp0sv3Qhj90Yrghz78MvMNGNkuEH2mue
         lRWFyJwfm+h68lDD4jlEaGNE7+flKDQgTvovi/2jE7DFcdUC5ER08n5+vH838m8yAjBr
         9PXirfPg5rk7eD94WHri8ZggZgo9W76/uIi02806s11aqvxbh6x5jjU7NGSlj0V/J2BP
         RJCQ==
X-Gm-Message-State: AJIora8rfAfGDU1Xd7AW4CtvH/S0cZejSSR5feTRUpAToGQVXrff+JLC
        7zw+Qs1WTSnIdxOojWeuP8mk1g==
X-Google-Smtp-Source: AGRyM1v0Nx0E1opyB9avEAkzQRKPrjH670PrUahCZqH0PNOb+fyeVLDUCCM6nt1U4s8F/ZcMFjbTWw==
X-Received: by 2002:a05:6870:7885:b0:104:9120:c382 with SMTP id hc5-20020a056870788500b001049120c382mr5973550oab.115.1656610836765;
        Thu, 30 Jun 2022 10:40:36 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id m13-20020a056820050d00b0041b8e651c1csm11819888ooj.40.2022.06.30.10.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:40:36 -0700 (PDT)
Date:   Thu, 30 Jun 2022 14:40:30 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com
Subject: Re: [PATCH 6/7] media: hantro: imx8m: Enable 10bit decoding
Message-ID: <Yr3gDuzOXk58wTnd@eze-laptop>
References: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
 <20220617115802.396442-7-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617115802.396442-7-benjamin.gaignard@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, Jun 17, 2022 at 01:58:01PM +0200, Benjamin Gaignard wrote:
> Expose 10bit pixel formats to enable 10bit decoding in IMX8M SoCs.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Looks good to me.

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Have you checked Fluster tests passess using both P010 and P010_4L4?
It would be good to double-check.

Thanks a lot,
Ezequiel

> ---
>  drivers/staging/media/hantro/imx8m_vpu_hw.c | 27 +++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index 77f574fdfa77..b390228fd3b4 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -162,12 +162,39 @@ static const struct hantro_fmt imx8m_vpu_g2_postproc_fmts[] = {
>  			.step_height = MB_DIM,
>  		},
>  	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_P010,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.postprocessed = true,
> +		.frmsize = {
> +			.min_width = FMT_MIN_WIDTH,
> +			.max_width = FMT_UHD_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = FMT_MIN_HEIGHT,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
>  };
>  
>  static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV12_4L4,
>  		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
> +		.frmsize = {
> +			.min_width = FMT_MIN_WIDTH,
> +			.max_width = FMT_UHD_WIDTH,
> +			.step_width = TILE_MB_DIM,
> +			.min_height = FMT_MIN_HEIGHT,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = TILE_MB_DIM,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_P010_4L4,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
>  		.frmsize = {
>  			.min_width = FMT_MIN_WIDTH,
>  			.max_width = FMT_UHD_WIDTH,
> -- 
> 2.32.0
> 
