Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76D55279998
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 15:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgIZNRP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 09:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbgIZNRM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 09:17:12 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11631C0613CE
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 06:17:12 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id a9so2141346wmm.2
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 06:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d4WdYnhNduVMb4IQylvNj0b3+xUXtGAllJOGjx+LukM=;
        b=bu7rNwBBrw/g6/MQUYPv/rJuxs4kAJuSUSGF7HaoBxYmz+CE+8kF5cU7Vk+A9yw9fT
         2uTqTzH0/a59B/1vQknmTX55axzITAT5Sk1Eml/bFiKnwHjUdhTv0Q+hwWWoD69eTq2r
         yb7hM4IaJd6RS4hi5svCI3acUoPyo69HIgP2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d4WdYnhNduVMb4IQylvNj0b3+xUXtGAllJOGjx+LukM=;
        b=efO2fCleCPqsk6Fo1y1JCJGfgalQajpbl9ea2Msrh+lLpnwcMsbHS3ir7fmN4iPQZF
         fUob+87EMHeZAP/ssYCxhlGX4rsKA9Do4u3P8ZiVVikOFKafF4hfLVYnJFKR7cb3IMLA
         Q+qQltNuwZf76LWdkgJADTfMQTUD4mtDbMLfO4TwK7ProADxTG97SigqOJjtnE43e4CV
         bzWePVWoj3cd/FuOz+s2ukGhpHevAl4gIbFwzcnfsS5VbdOGHGNGAluapbmZQj9+VdY9
         GKA/s20N6s76DTxjurcEL85979KBxmHhRgyrGcaR9LjHv8M6e0IDOrVscxjlfpcoM4uT
         BN0A==
X-Gm-Message-State: AOAM532cLc8TcUZ7eGmOufEnAztbpIEWvb2TeU6xDAnH4XD/R5MmcMXi
        eWDiLW5ZdJpI5j1Q79JA9/xCgA==
X-Google-Smtp-Source: ABdhPJzA9zIAszTN7VfMOAdSZYj9TgCEGPni6cWED8LMBF3e0XPhvf2pPLGokCCo/16b8UNSW4Do6Q==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr2589182wmj.101.1601126230700;
        Sat, 26 Sep 2020 06:17:10 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id m185sm2768709wmf.5.2020.09.26.06.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:17:09 -0700 (PDT)
Date:   Sat, 26 Sep 2020 13:17:08 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v4 02/10] media: staging: rkisp1: cap: remove unsupported
 formats
Message-ID: <20200926131708.GE3781977@chromium.org>
References: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
 <20200901111612.10552-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901111612.10552-3-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Sep 01, 2020 at 01:16:04PM +0200, Dafna Hirschfeld wrote:
> For Ycbcr packed formats only YUYV can be supported by
> the driver. This patch removes the other formats.

I can see the driver already setting the
RKISP1_CIF_MI_XTD_FMT_CTRL_*_CB_CR_SWAP register according to the
uv_swap flag, but it currently does it so only if comp_planes is 2.
Wouldn't just doing the same if the number of planes is 1 fix the
support for at least the YVYU format?

Best regards,
Tomasz

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index f4d5cc3e2f12..79195e74d995 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -88,13 +88,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  		.fourcc = V4L2_PIX_FMT_YUYV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> -	}, {
> -		.fourcc = V4L2_PIX_FMT_YVYU,
> -		.uv_swap = 1,
> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> -	}, {
> -		.fourcc = V4L2_PIX_FMT_VYUY,
> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
>  		.uv_swap = 0,
> @@ -197,16 +190,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> -	}, {
> -		.fourcc = V4L2_PIX_FMT_YVYU,
> -		.uv_swap = 1,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> -	}, {
> -		.fourcc = V4L2_PIX_FMT_VYUY,
> -		.uv_swap = 1,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
>  		.uv_swap = 0,
> -- 
> 2.17.1
> 
