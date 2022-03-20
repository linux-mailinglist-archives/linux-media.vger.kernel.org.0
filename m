Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E52DC4E1BAA
	for <lists+linux-media@lfdr.de>; Sun, 20 Mar 2022 13:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237963AbiCTMhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Mar 2022 08:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235927AbiCTMhL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Mar 2022 08:37:11 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49443149251
        for <linux-media@vger.kernel.org>; Sun, 20 Mar 2022 05:35:48 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id l24-20020a4a8558000000b00320d5a1f938so16134453ooh.8
        for <linux-media@vger.kernel.org>; Sun, 20 Mar 2022 05:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aeLVaTmXabVLUlXFaCtHYrDRRC0l+RSpU6HEllfefeU=;
        b=fzdmK3mbmfE4UdQTR/Md6nKXQc8ndDQ74/4mwpY+AV48s11JAI00kxB1O13ONtcAsB
         /GU+ENIc1bWTiLcx/8S81RU6LhLPLnX5Sd98F4zVX+ga+AzPNyk15vvo1HKq0/3hGrT2
         TNrOet6YGzb+6oSBDqtn+g3zzMaGDTO+jVk5MIqZ/fDiHmcB5FSBMY4EcBTnpcOZ2K7V
         ny4U1rera9js2nDUXarnaYthXDagwY2FhJytH+FzyfMtNK880qVzCDSAHLk1h75LglVh
         A8x0semzFYJsqLRzNWzYnJBaRZ63zUZCvDFZLKqyemFFcQjhquAuadLr3CaAWvusYM8f
         BrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aeLVaTmXabVLUlXFaCtHYrDRRC0l+RSpU6HEllfefeU=;
        b=RdXcE7je1m786hnDjzBuV+pveook1H3Exxef1R+bBy56bw1eyHRapNFF12MM6H52bm
         P4kTekz5RsTZ1/+x8kzsk9lXy1fXZuMqffSUgn6JLLATELiH9VNaBk8qJufUqvwYzub2
         JkRm7JZGEwzxTWwM+UI2WDrdAH5KB/mxtwpU3ZEaJDrQGVgtDQkTA4iVmU0s10Bk/UZF
         Q3Pe5FsXsvAeBe9xrK5E70zpTd+rLpUDVNs+WaTZmnQx9zrbCGKPsQX0AEvBL+qbaqXA
         5QVp3Qq586259wK8yd5nL5d5eC55Dtuh3At63H8KMyjcaWsk4PvVDmGt7z+WkKoKSUxM
         d85g==
X-Gm-Message-State: AOAM5336YYrWryj1/NsUPfeyZhnY1Dq5iroXKxwGtgwyE+mAwZEbqaSy
        +xWJcH6TSzA8E7gf7lzfF8NxYo5rmMRmvg==
X-Google-Smtp-Source: ABdhPJx7WKxSv8HUicHA5C8Hhfbuij0AJLhYQe0Nc+1uraQwttPVDLjecpRIms/+jGDdWfLNcvJt+A==
X-Received: by 2002:a05:6870:c588:b0:da:3d88:de58 with SMTP id ba8-20020a056870c58800b000da3d88de58mr10075670oab.32.1647779747582;
        Sun, 20 Mar 2022 05:35:47 -0700 (PDT)
Received: from eze-laptop ([186.122.18.6])
        by smtp.gmail.com with ESMTPSA id m26-20020a05680806da00b002d797266870sm6188356oih.9.2022.03.20.05.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 05:35:47 -0700 (PDT)
Date:   Sun, 20 Mar 2022 09:35:42 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc:     linux-media@vger.kernel.org, Linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/3] media: hantro: Add support for Hantro G1 on RK356x
Message-ID: <YjcfnptyJ2xdkw8H@eze-laptop>
References: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 14, 2022 at 10:29:53PM +0100, Piotr Oniszczuk wrote:
> From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
> 
> RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP8
> video formats.
> 
> This patch adds support for RK356x family in existing Hantro
> video decoder kernel driver.
> 
> Tested on [1] with FFmpeg v4l2_request code taken from [2]
> with MPEG2, H.642 and VP8 samples with results [3].
> 
> [1] https://github.com/warpme/minimyth2
> [2] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch
> [3] https://github.com/warpme/minimyth2/blob/master/video-test-summary.txt
> 
> Signed-off-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/hantro/hantro_drv.c      |  1 +
>  drivers/staging/media/hantro/hantro_hw.h       |  1 +
>  drivers/staging/media/hantro/rockchip_vpu_hw.c | 14 ++++++++++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 6a51f39dde56..ac7d58069eb8 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -613,6 +613,7 @@ static const struct of_device_id of_hantro_match[] = {
>  	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
>  	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
>  	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
> +	{ .compatible = "rockchip,rk3568-vpu", .data = &rk3568_vpu_variant, },
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>  	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 4a19ae8940b9..89ec6d500938 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -307,6 +307,7 @@ extern const struct hantro_variant rk3066_vpu_variant;
>  extern const struct hantro_variant rk3288_vpu_variant;
>  extern const struct hantro_variant rk3328_vpu_variant;
>  extern const struct hantro_variant rk3399_vpu_variant;
> +extern const struct hantro_variant rk3568_vpu_variant;
>  extern const struct hantro_variant sama5d4_vdec_variant;
>  extern const struct hantro_variant sunxi_vpu_variant;
>  
> diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> index c203b606e6e7..5e64cf068ff9 100644
> --- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> @@ -551,6 +551,20 @@ const struct hantro_variant rk3399_vpu_variant = {
>  	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
>  };
>  
> +const struct hantro_variant rk3568_vpu_variant = {
> +	.dec_offset = 0x400,
> +	.dec_fmts = rk3399_vpu_dec_fmts,
> +	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
> +	.codec = HANTRO_MPEG2_DECODER |
> +		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
> +	.codec_ops = rk3399_vpu_codec_ops,
> +	.irqs = rockchip_vdpu2_irqs,
> +	.num_irqs = ARRAY_SIZE(rockchip_vdpu2_irqs),
> +	.init = rockchip_vpu_hw_init,
> +	.clk_names = rockchip_vpu_clk_names,
> +	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
> +};
> +
>  const struct hantro_variant px30_vpu_variant = {
>  	.enc_offset = 0x0,
>  	.enc_fmts = rockchip_vpu_enc_fmts,
> -- 
> 2.29.2
> 
