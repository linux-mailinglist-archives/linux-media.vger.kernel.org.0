Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813C43B39AC
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 01:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232582AbhFXXQC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 19:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhFXXQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 19:16:02 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A84E5C061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 16:13:41 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso5586091wmc.1
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 16:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6zyJubaI7jmIklMw5VtrnMCnmEJ/7YKY0fPlXYHDlPM=;
        b=mgumS2FDOw1v8FdMm3+0c7dzQz/qB727+WyJwN3YTYtt9WzrdjDgOADcIPm4NRIOuU
         tlz+jCHlq2r9gvyzlgar7o5moTjd8rP3L340F5ipMQ9THtuQaU5zudXGMlwC7vXMtMOS
         OVKGkFVjRQdliZLBUnVY4omDJy/8gyD4IJwQifbq6X1kdPaiepgMubgCa+xIDzEnvxq7
         lRraMsTy9PZGqZX+VE7wFGHTHv1ctszIP5ncA2Tv/Tcb/NPxjgqqXFQ+WPIi22X4nULs
         aXJ+A2X9EzcTwfyLJRqvR+67ZfYbUHVXiiAL/GOeXsNH04uLPUYtTJVFBv6uC0lMXxSU
         iTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6zyJubaI7jmIklMw5VtrnMCnmEJ/7YKY0fPlXYHDlPM=;
        b=hETfeCkoexQIJvfOL2hUa/ohpSVIsWYU9x5S6Rx6+8xFeRlhgNBntjKFgo/dfk53Mg
         JwoWom9nIiJRV+hLFiJIIyQw65HYMslLVorP2CKREqg29hErjil709q2hPwuIfFOHyqD
         bNTh7WCraI554hJI3CPOoMYYwwxg5QYZM6qXqP6T+2OSzokJwqL+e/zr9vyNiAAqYQ0s
         QkXUksPG0OQtAOcgshc8E88KAbSM7LjnSsuedLlIG/qA2Yx93apPtwiuHjRPOWSeEI69
         U5txMPdA6VAZ5i662CGXRuF47xLKA07hnsuw1RdaG6PaAyEWGaJYt20V+/t8b5rJ8ZrO
         7LjA==
X-Gm-Message-State: AOAM532hgOxeHz89fqTiUTXJUAw5VqQd2GU/mARKPKZuQ8PzmfEy9o43
        Dte1/izqXp+q65a5VfDlvA==
X-Google-Smtp-Source: ABdhPJyVekguF76rQyEM/xY2RG6RZhDgaFrWaRAuRIOLJit2uHpFEhKoCkvkHzXhLkao2VSN1L/IHw==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr7041877wme.95.1624576420249;
        Thu, 24 Jun 2021 16:13:40 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de. [91.67.75.139])
        by smtp.gmail.com with ESMTPSA id i18sm778948wrw.55.2021.06.24.16.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 16:13:39 -0700 (PDT)
Subject: Re: [PATCH 09/12] media: hantro: Enable H.264 on Rockchip VDPU2
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>, kernel@collabora.com
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-10-ezequiel@collabora.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <2ae869f3-7f3a-f184-93cc-61fca0f9022f@gmail.com>
Date:   Fri, 25 Jun 2021 01:13:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210624182612.177969-10-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Am 24.06.21 um 20:26 schrieb Ezequiel Garcia:
> Given H.264 support for VDPU2 was just added, let's enable it.
> For now, this is only enabled on platform that don't have
> an RKVDEC core, such as RK3328.

Is there any reason, you do not want to enabe H.264 on RK3399? I know 
H.264 can be done by by rkvdec already, but from what I understand that 
shouldn't be an issue: The first decoder found that meets the 
requirements will be taken.

RK3328 has a variant (mpp calls it vdpu341) of rkvdec also which also 
supports H.264 (and HEVC/VP9). rkvdec driver needs a (much simpler) 
variant implementation in order to support it there also, since its has 
some additional registers.

Thanks,

Alex

>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>   .../staging/media/hantro/rockchip_vpu_hw.c    | 26 ++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> index 3ccc16413f42..e4e3b5e7689b 100644
> --- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> @@ -162,6 +162,19 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
>   		.fourcc = V4L2_PIX_FMT_NV12,
>   		.codec_mode = HANTRO_MODE_NONE,
>   	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> +		.codec_mode = HANTRO_MODE_H264_DEC,
> +		.max_depth = 2,
> +		.frmsize = {
> +			.min_width = 48,
> +			.max_width = 1920,
> +			.step_width = MB_DIM,
> +			.min_height = 48,
> +			.max_height = 1088,
> +			.step_height = MB_DIM,
> +		},
> +	},
>   	{
>   		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
>   		.codec_mode = HANTRO_MODE_MPEG2_DEC,
> @@ -388,6 +401,12 @@ static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
>   		.init = hantro_jpeg_enc_init,
>   		.exit = hantro_jpeg_enc_exit,
>   	},
> +	[HANTRO_MODE_H264_DEC] = {
> +		.run = rockchip_vpu2_h264_dec_run,
> +		.reset = rockchip_vpu2_dec_reset,
> +		.init = hantro_h264_dec_init,
> +		.exit = hantro_h264_dec_exit,
> +	},
>   	[HANTRO_MODE_MPEG2_DEC] = {
>   		.run = rockchip_vpu2_mpeg2_dec_run,
>   		.reset = rockchip_vpu2_dec_reset,
> @@ -433,6 +452,8 @@ static const char * const rockchip_vpu_clk_names[] = {
>   	"aclk", "hclk"
>   };
>   
> +/* VDPU1/VEPU1 */
> +
>   const struct hantro_variant rk3036_vpu_variant = {
>   	.dec_offset = 0x400,
>   	.dec_fmts = rk3066_vpu_dec_fmts,
> @@ -495,11 +516,14 @@ const struct hantro_variant rk3288_vpu_variant = {
>   	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
>   };
>   
> +/* VDPU2/VEPU2 */
> +
>   const struct hantro_variant rk3328_vpu_variant = {
>   	.dec_offset = 0x400,
>   	.dec_fmts = rk3399_vpu_dec_fmts,
>   	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
> -	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER,
> +	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> +		 HANTRO_H264_DECODER,
>   	.codec_ops = rk3399_vpu_codec_ops,
>   	.irqs = rockchip_vdpu2_irqs,
>   	.num_irqs = ARRAY_SIZE(rockchip_vdpu2_irqs),
