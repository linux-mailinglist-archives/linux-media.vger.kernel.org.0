Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8FD55B18F
	for <lists+linux-media@lfdr.de>; Sun, 26 Jun 2022 13:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbiFZLqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 07:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiFZLqu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 07:46:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF67BF71
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 04:46:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE2B947C;
        Sun, 26 Jun 2022 13:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656244007;
        bh=9yPR3VHQevCvefusDd/W5ZySbqhRUXa/miHEVCwrIp4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T5C0jozZ2WWMJaMhUkI8qhQ2a7GBx7IGEBU6IG9Fy2EUPSwLfJ3d+pn4+21Qj+8LH
         jnJpXQyU9dyOAygFhdyt6P032jTzQclq5GSX/MNtrVnJnZa372G693R00HLrZcW06e
         it0WaWiL9zSTAm8iEdkOXmRccltA82B9cIxWwMG4=
Date:   Sun, 26 Jun 2022 14:46:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 51/55] media: rkisp1: Add and set registers for output
 size config on i.MX8MP
Message-ID: <YrhHFin2MmDgWIV/@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-52-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-52-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Wed, Jun 15, 2022 at 04:11:23AM +0900, Paul Elder wrote:
> The ISP version in the i.MX8MP has a set of registers currently not
> handled by the driver for output size configuration. Add a feature flag
> to determine if the ISP requires this, and set the registers based on
> that.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 8 ++++++++
>  drivers/media/platform/rockchip/rkisp1/rkisp1-common.h  | 1 +
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c     | 3 ++-
>  drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h    | 9 +++++++++
>  4 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 9edaa95fa44c..35cec263c563 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -420,6 +420,14 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
>  	rkisp1_write(rkisp1, cap->config->mi.cr_size_init,
>  		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
>  
> +	if (rkisp1->info->features & RKISP1_FEATURE_MAIN_STRIDE) {
> +		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_LLENGTH, pixm->width);
> +		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_WIDTH, pixm->width);
> +		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_HEIGHT, pixm->height);
> +		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_SIZE,
> +			     pixm->width * pixm->height);
> +	}
> +
>  	rkisp1_irq_frame_end_enable(cap);
>  
>  	/* set uv swapping for semiplanar formats */
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index e4f422bed09a..96657e55a5b0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -112,6 +112,7 @@ enum rkisp1_feature {
>  	RKISP1_FEATURE_MIPI_CSI2 = BIT(0),
>  	RKISP1_FEATURE_DUAL_CROP = BIT(1),
>  	RKISP1_FEATURE_RSZ_CROP = BIT(2),
> +	RKISP1_FEATURE_MAIN_STRIDE = BIT(3),
>  };
>  
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 5abe33f5fed4..d68a805e8b6b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -505,7 +505,8 @@ static const struct rkisp1_info imx8mp_isp_info = {
>  	.isrs = imx8mp_isp_isrs,
>  	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
>  	.isp_ver = IMX8MP_V10,
> -	.features = RKISP1_FEATURE_RSZ_CROP,
> +	.features = RKISP1_FEATURE_RSZ_CROP
> +		  | RKISP1_FEATURE_MAIN_STRIDE,
>  };
>  
>  static const struct of_device_id rkisp1_of_match[] = {
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index 1fc54ab22b6d..5c2195019723 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -1013,6 +1013,15 @@
>  #define RKISP1_CIF_MI_SP_CB_BASE_AD_INIT2	(RKISP1_CIF_MI_BASE + 0x00000140)
>  #define RKISP1_CIF_MI_SP_CR_BASE_AD_INIT2	(RKISP1_CIF_MI_BASE + 0x00000144)
>  #define RKISP1_CIF_MI_XTD_FORMAT_CTRL		(RKISP1_CIF_MI_BASE + 0x00000148)
> +#define RKISP1_CIF_MI_MP_HANDSHAKE_0		(RKISP1_CIF_MI_BASE + 0x0000014C)
> +#define RKISP1_CIF_MI_MP_Y_LLENGTH		(RKISP1_CIF_MI_BASE + 0x00000150)
> +#define RKISP1_CIF_MI_MP_Y_SLICE_OFFSET		(RKISP1_CIF_MI_BASE + 0x00000154)
> +#define RKISP1_CIF_MI_MP_C_SLICE_OFFSET		(RKISP1_CIF_MI_BASE + 0x00000158)
> +#define RKISP1_CIF_MI_OUTPUT_ALIGN_FORMAT	(RKISP1_CIF_MI_BASE + 0x0000015C)
> +#define RKISP1_CIF_MI_MP_OUTPUT_FIFO_SIZE	(RKISP1_CIF_MI_BASE + 0x00000160)
> +#define RKISP1_CIF_MI_MP_Y_PIC_WIDTH		(RKISP1_CIF_MI_BASE + 0x00000164)
> +#define RKISP1_CIF_MI_MP_Y_PIC_HEIGHT		(RKISP1_CIF_MI_BASE + 0x00000168)
> +#define RKISP1_CIF_MI_MP_Y_PIC_SIZE		(RKISP1_CIF_MI_BASE + 0x0000016C)
>  
>  #define RKISP1_CIF_SMIA_BASE			0x00001A00
>  #define RKISP1_CIF_SMIA_CTRL			(RKISP1_CIF_SMIA_BASE + 0x00000000)

-- 
Regards,

Laurent Pinchart
