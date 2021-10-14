Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A7142D59F
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 11:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhJNJGW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 05:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbhJNJGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 05:06:20 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF93BC061570
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 02:04:15 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id e10so5242719uab.3
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 02:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gCQivZ8gRzBRQ5j1FLIiAHT/GjTqN2xJlUgLj8Dx02k=;
        b=QYme62iW6Dpakq1dSAs8/GUCGJwSB4+OIeXFcr5NHsHZLqUntSpxFB3xU4hPHKdTlC
         NjA/GRF8IWme/Wh7X9g0WLxfSR6IeXBNOqhOxIzy4xKiTv2aPUQR3381oI6by0vH7Ipc
         fKIGo1LiIL8HLWYBBvi9YUWL6A//ukuG7bwsDzB6O5IG1rGCroWxzQiQnz37bJIyuGyB
         85Rzh9JkB5PN/xzWdPoRybSJL5NlZYLgrS0xRubVPgjhSTElUhCT5v++m0SEQDH+0RUe
         ZEaQDHTOhilMdReAJU4LvOA6Y177o/4FBv7v0JkDv8BTsqEmHXNShInnkOU9durwxo1P
         dMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gCQivZ8gRzBRQ5j1FLIiAHT/GjTqN2xJlUgLj8Dx02k=;
        b=OwO8OTv79xWjofEmBzXRaAMRF4IvsuTY7yvER7heXQfLe4a9dxIM5SojPEo1jbBcZk
         OCaIOhaBa9QiwNPNoJojy8yHbUwBLFXI29hJ3NNqnwU7TijbS2X195aBYFqLAIHOk5zU
         uW8/gRe+zOZKU68o8dRYR8A76uwAb5iCznSwV36a0/u7mNC9jThRygvA11u3xsMVO00Y
         OBe/ZemwGVshd9eDWVn5jpJqascXAJFEiauidsJdEcM0H21tGQIac3TOvsqWvQOgLMZ1
         2KIWDt9fm6ASka6wXUzwKtJoLeTIF8ybK8K2E44FO2u0tmhcrFEKQut/XkWdX/7qKkTo
         BOnQ==
X-Gm-Message-State: AOAM5339xFDcPV+qJ/ZuOvR06RBB8EEBCH12lhTZ1SIl0QGuC7zKShd6
        w7vx05rzcfxi77dXrZ2RN5KZpQ==
X-Google-Smtp-Source: ABdhPJwkYCO9hZLrEGqbYwQPPZ9KIqpQHCmz1Bq4SdZWxkdHLhRnfph+8nV2sgA1L88bu0z5zUOFrA==
X-Received: by 2002:a67:c30b:: with SMTP id r11mr5414370vsj.20.1634202254777;
        Thu, 14 Oct 2021 02:04:14 -0700 (PDT)
Received: from fedora ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id n20sm1263125vkn.7.2021.10.14.02.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 02:04:13 -0700 (PDT)
Date:   Thu, 14 Oct 2021 06:04:09 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2] media: hantro: Auto generate the AXI ID to avoid
 conflicts
Message-ID: <YWfyiSUqNHnsGzzp@fedora>
References: <20210924132447.2288167-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924132447.2288167-1-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Thanks for picking up the patch.

On Fri, Sep 24, 2021 at 03:24:47PM +0200, Benjamin Gaignard wrote:
> The AXI ID is an AXI bus configuration for improve bus performance. 
> If read and write operations use different ID the operations can be paralleled,
> whereas when they have the same ID the operations will be serialized. 
> Right now, the write ID is fixed to 0 but we can set it to 0xff to get auto
> generated ID to avoid possible conflicts.
> 
> This change has no functional changes, but seems reasonable to let the
> hardware to autogenerate the ID instead of hardcoding in software.
> 

Well, it may not have functional changes, but it is expected to have
performance impact on a contended AXI bus.

> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in version 2:
> - Add a macro with comment about the value.
> - Make VP8 and H264 codecs use the macro.
> - fluster tests on the both codecs show no regressions.
>   ./fluster.py run -ts VP8-TEST-VECTORS -d GStreamer-VP8-V4L2SL-Gst1.0
>   ./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2SL-Gst1.0
> - The both codec write other bits in the same configuration register
>   so the simplest solution is to use the macro in the both cases.
> 

Please describe the performance test that you did to make
sure it's not regressing.

>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 2 +-
>  drivers/staging/media/hantro/hantro_g1_regs.h     | 2 ++
>  drivers/staging/media/hantro/hantro_g1_vp8_dec.c  | 3 ++-

This covers VP8 and H264 on some of the cores (i.MX8 and Rockchip VPU1).
I believe you are missing the VPU2 cores (RK3399), see for instance
rockchip_vpu2_hw_h264_dec.c.

What about MPEG-2? If the tests show no performance impact,
then please do the change for MPEG-2 as well.

Thanks,
Ezequiel

>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 236ce24ca00c..f49dbfb8a843 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -29,7 +29,7 @@ static void set_params(struct hantro_ctx *ctx, struct vb2_v4l2_buffer *src_buf)
>  	u32 reg;
>  
>  	/* Decoder control register 0. */
> -	reg = G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(0x0);
> +	reg = G1_REG_DEC_CTRL0_DEC_AXI_AUTO;
>  	if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
>  		reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
>  	if (sps->profile_idc > 66) {
> diff --git a/drivers/staging/media/hantro/hantro_g1_regs.h b/drivers/staging/media/hantro/hantro_g1_regs.h
> index c1756e3d5391..c623b3b0be18 100644
> --- a/drivers/staging/media/hantro/hantro_g1_regs.h
> +++ b/drivers/staging/media/hantro/hantro_g1_regs.h
> @@ -68,6 +68,8 @@
>  #define     G1_REG_DEC_CTRL0_PICORD_COUNT_E		BIT(9)
>  #define     G1_REG_DEC_CTRL0_DEC_AHB_HLOCK_E		BIT(8)
>  #define     G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(x)		(((x) & 0xff) << 0)
> +/* Setting AXI ID to 0xff to get auto generated ID to avoid possible conflicts */
> +#define     G1_REG_DEC_CTRL0_DEC_AXI_AUTO		G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(0xff)
>  #define G1_REG_DEC_CTRL1				0x010
>  #define     G1_REG_DEC_CTRL1_PIC_MB_WIDTH(x)		(((x) & 0x1ff) << 23)
>  #define     G1_REG_DEC_CTRL1_MB_WIDTH_OFF(x)		(((x) & 0xf) << 19)
> diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> index 6180b23e7d94..851eb67f19f5 100644
> --- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> @@ -463,7 +463,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>  	      G1_REG_CONFIG_DEC_MAX_BURST(16);
>  	vdpu_write_relaxed(vpu, reg, G1_REG_CONFIG);
>  
> -	reg = G1_REG_DEC_CTRL0_DEC_MODE(10);
> +	reg = G1_REG_DEC_CTRL0_DEC_MODE(10) |
> +	      G1_REG_DEC_CTRL0_DEC_AXI_AUTO;
>  	if (!V4L2_VP8_FRAME_IS_KEY_FRAME(hdr))
>  		reg |= G1_REG_DEC_CTRL0_PIC_INTER_E;
>  	if (!(hdr->flags & V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF))
> -- 
> 2.30.2
> 
