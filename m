Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 291B15A3346
	for <lists+linux-media@lfdr.de>; Sat, 27 Aug 2022 02:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242176AbiH0A5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 20:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbiH0A5G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 20:57:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD41BB019;
        Fri, 26 Aug 2022 17:57:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B341120A;
        Sat, 27 Aug 2022 02:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661561824;
        bh=Ri1wLoPekTyLgjwHNsKBxT+2SZ08l/Hp9thLZMvYSqM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TLTmHS6+OEr3mmATjtbeg5uSQjxZQWSkA6AKdp7Wfe8qSBGvm73Q1Pt23o+HFPSux
         YMiVjAr2KTcvsiZjB2O3btWPPmOwQJCshA1o+uFVjzY8HGDgI1uRWxRfPgxUuzWYNS
         78ixjiJsbjRN0HlogSRXTGFum0KoZAHfK85xVTmI=
Date:   Sat, 27 Aug 2022 03:56:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 5/5] media: renesas: vsp1: Add support for RZ/G2L VSPD
Message-ID: <Ywlr2Fjl582MAXI7@pendragon.ideasonboard.com>
References: <20220825132144.2619239-1-biju.das.jz@bp.renesas.com>
 <20220825132144.2619239-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825132144.2619239-6-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Thu, Aug 25, 2022 at 02:21:44PM +0100, Biju Das wrote:
> The RZ/G2L VSPD provides a single VSPD instance. It has the following
> sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
> 
> The VSPD block on RZ/G2L SoCs does not have a version register, so
> added a new compatible string "renesas,r9a07g044-vsp2" with a data
> pointer containing the info structure. Also the reset line is shared
> with the DU module.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v12->v13:
>  * No change
> v11->v12:
>  * No change
> v10->v11:
>  * No change.
> v9->v10:
>  * No change.
> v8->v9:
>  * Replaced the code comments RZ/G2L {SoC's,SoC} with RZ/G2L SoCs.
> v7->v8:
>  * Split the patch for adding s/w version, feature bit and RZ/G2L support
>  * Added feature bit VSP1_HAS_NON_ZERO_LBA to device_info
>  * Added .soc for RZ/G2L
>  * Replaced the compatible "renesas,rzg2l-vsp2" -> "renesas,r9a07g044-vsp2"
> v6->v7:
>  * Added Rb tag from Kieran
>  * Added a quirk to handle LIF0 buffer attribute related
>    changes for V3M and G2L.
>  * Removed the macro for VSP HW version
> v5->v6:
>  * Rebased to media_staging and updated commit header
>  * Removed the extra tab from rzg2l_vsp2_device_info
>  * Changed the function vsp1_lookup->vsp1_lookup_info and
>    all info match related code moved here.
>  * Add VI6_IP_VERSION_VSP and VI6_IP_VERSION_VSP_SW macros to
>    distinguish HW & SW IP_VSP_Version.
>  * Used 0x80 for RZG2L VSPD model and SoC identification
>  * Updated Switch() for LIF0 buffer attribute handling.
> v4->v5:
>  * Fixed typo VI6_IP_VERSION_MODEL_MASK->VI6_IP_VERSION_MASK
>  * To be consistent with other SoC's, introduced VI6_IP_VERSION_SOC_G2L
>    for RZ/G2L SoC's.
> v3->v4:
>  * Added Rb tag from Geert
>  * Add switch() for LIF0 buffer attribute handling for RZ/G2L and V3M
> v2->v3:
>  * Fixed version comparison in vsp1_lookup()
> v1->v2:
>  * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
>  * Added standalone device info for rzg2l-vsp2.
>  * Added vsp1_lookup helper function.
>  * Updated comments for LIF0 buffer attribute register
>  * Used last ID for rzg2l-vsp2.
> RFC->v1:
>  * Used data pointer containing info structure to retrieve version information
> RFC:
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-21-biju.das.jz@bp.renesas.com/
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 13 +++++++++++++
>  drivers/media/platform/renesas/vsp1/vsp1_lif.c  |  9 +++++----
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h |  4 ++++
>  3 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index c0d814d9044e..3af09df86c3f 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -829,6 +829,18 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>  	},
>  };
>  
> +static const struct vsp1_device_info rzg2l_vsp2_device_info = {
> +	.version = VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> +	.model = "VSP2-D",
> +	.soc = VI6_IP_VERSION_SOC_RZG2L,
> +	.gen = 3,
> +	.features = VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HAS_EXT_DL
> +		  | VSP1_HAS_NON_ZERO_LBA,
> +	.lif_count = 1,
> +	.rpf_count = 2,
> +	.wpf_count = 1,
> +};
> +
>  static const struct vsp1_device_info *vsp1_lookup_info(struct vsp1_device *vsp1)
>  {
>  	const struct vsp1_device_info *info;
> @@ -979,6 +991,7 @@ static int vsp1_remove(struct platform_device *pdev)
>  static const struct of_device_id vsp1_of_match[] = {
>  	{ .compatible = "renesas,vsp1" },
>  	{ .compatible = "renesas,vsp2" },
> +	{ .compatible = "renesas,r9a07g044-vsp2", .data = &rzg2l_vsp2_device_info },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, vsp1_of_match);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> index 9adb892edcdc..186a5730e1e3 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> @@ -107,6 +107,7 @@ static void lif_configure_stream(struct vsp1_entity *entity,
>  
>  	case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
>  	case VI6_IP_VERSION_MODEL_VSPD_V3:
> +	case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
>  		hbth = 0;
>  		obth = 1500;
>  		lbth = 0;
> @@ -130,10 +131,10 @@ static void lif_configure_stream(struct vsp1_entity *entity,
>  			VI6_LIF_CTRL_REQSEL | VI6_LIF_CTRL_LIF_EN);
>  
>  	/*
> -	 * On R-Car V3M the LIF0 buffer attribute register has to be set to a
> -	 * non-default value to guarantee proper operation (otherwise artifacts
> -	 * may appear on the output). The value required by the manual is not
> -	 * explained but is likely a buffer size or threshold.
> +	 * On R-Car V3M and RZ/G2L the LIF0 buffer attribute register has to be
> +	 * set to a non-default value to guarantee proper operation (otherwise
> +	 * artifacts may appear on the output). The value required by the
> +	 * manual is not explained but is likely a buffer size or threshold.
>  	 */
>  	if (vsp1_feature(entity->vsp1, VSP1_HAS_NON_ZERO_LBA))
>  		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> index 4286d13eca32..8928f4c6bb55 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -767,6 +767,8 @@
>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
>  #define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
> +/* RZ/G2L SoCs have no version register, So use 0x80 as the model version */
> +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x80 << 8)
>  
>  #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
>  #define VI6_IP_VERSION_SOC_H2		(0x01 << 0)
> @@ -780,6 +782,8 @@
>  #define VI6_IP_VERSION_SOC_M3N		(0x04 << 0)
>  #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
>  #define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
> +/* RZ/G2L SoCs have no version register, So use 0x80 for SoC Identification */
> +#define VI6_IP_VERSION_SOC_RZG2L	(0x80 << 0)
>  
>  #define VI6_IP_VERSION_VSP_SW		(0xfffe << 16) /* SW VSP version */
>  

-- 
Regards,

Laurent Pinchart
