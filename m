Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11C3F4D75C4
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 15:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbiCMOO0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 10:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbiCMOOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 10:14:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF02D48301;
        Sun, 13 Mar 2022 07:13:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8176B475;
        Sun, 13 Mar 2022 15:13:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647180793;
        bh=QCpKdF+5FSj5nydPhCRMHblxki9jTdazQiDzcJi0tyk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TIX1qU4Ny7BrcdXg1qpPOIPIoVvs/b93L2iifWVMvdct3kJ067hYfHLdSfO5oP3WX
         mhrkSKTA38ELfTYX05xSVhHnQZt4exAfQHFzn3TxgdYIR6il4kFX/iLxjvPMigZMZW
         pGc0qpzFazuS64vF03MCSVlK+RiuyyZo+CLOp2+0=
Date:   Sun, 13 Mar 2022 16:12:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 3/3] media: vsp1: Add support for RZ/G2L VSPD
Message-ID: <Yi375+TLcYhc+FGU@pendragon.ideasonboard.com>
References: <20220312084205.31462-1-biju.das.jz@bp.renesas.com>
 <20220312084205.31462-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220312084205.31462-4-biju.das.jz@bp.renesas.com>
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

On Sat, Mar 12, 2022 at 08:42:05AM +0000, Biju Das wrote:
> The RZ/G2L VSPD provides a single VSPD instance. It has the following
> sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
> 
> The VSPD block on RZ/G2L does not have a version register, so added a
> new compatible string "renesas,rzg2l-vsp2" with a data pointer containing
> the info structure. Also the reset line is shared with the DU module.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
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
>  drivers/media/platform/vsp1/vsp1_drv.c  | 44 +++++++++++++++++++------
>  drivers/media/platform/vsp1/vsp1_lif.c  | 16 +++++----
>  drivers/media/platform/vsp1/vsp1_regs.h |  4 +++
>  3 files changed, 48 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index 699d7d985df4..4eef6d525eda 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -811,11 +811,37 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>  	},
>  };
>  
> +static const struct vsp1_device_info rzg2l_vsp2_device_info = {
> +		.version = VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> +		.model = "VSP2-D",
> +		.gen = 3,
> +		.features = VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HAS_EXT_DL,
> +		.lif_count = 1,
> +		.rpf_count = 2,
> +		.wpf_count = 1,

One tab is enough for indentation.

> +};
> +
> +static const struct vsp1_device_info *vsp1_lookup(struct vsp1_device *vsp1,
> +						  u32 version)

Let's call this vsp1_lookup_info(), just "lookup" is a bit vague.

> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> +		if ((version & VI6_IP_VERSION_MODEL_MASK) ==
> +		    vsp1_device_infos[i].version) {
> +			vsp1->info = &vsp1_device_infos[i];
> +			break;
> +		}
> +	}
> +
> +	return vsp1->info;

Could we move all the info logic in this function ? Something like this:

	const struct vsp1_device_info *info;
	unsigned int i;
	u32 version;

	/*
	 * Try the info stored in match data first for devices that don't have
	 * a version register.
	 */
	info = of_device_get_match_data(vsp1->dev);
	if (info)
		return info;

	version = vsp1_read(vsp1, VI6_IP_VERSION);

	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
		info = &vsp1_device_infos[i];

		if ((version & VI6_IP_VERSION_MODEL_MASK) == info->version);
			return info;
	}

	dev_err(vsp1->dev, "unsupported IP version 0x%08x\n", version);

	return NULL;

> +}
> +
>  static int vsp1_probe(struct platform_device *pdev)
>  {
>  	struct vsp1_device *vsp1;
>  	struct device_node *fcp_node;
> -	unsigned int i;
> +	u32 version;
>  	int ret;
>  	int irq;
>  
> @@ -871,24 +897,21 @@ static int vsp1_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto done;
>  
> -	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> -
> -	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> -		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> -		    vsp1_device_infos[i].version) {
> -			vsp1->info = &vsp1_device_infos[i];
> -			break;
> -		}
> +	vsp1->info = of_device_get_match_data(&pdev->dev);
> +	if (!vsp1->info) {
> +		version = vsp1_read(vsp1, VI6_IP_VERSION);
> +		vsp1->info = vsp1_lookup(vsp1, version);
>  	}
>  
>  	if (!vsp1->info) {
>  		dev_err(&pdev->dev, "unsupported IP version 0x%08x\n",
> -			vsp1->version);
> +			version);
>  		vsp1_device_put(vsp1);
>  		ret = -ENXIO;
>  		goto done;
>  	}
>  
> +	vsp1->version = vsp1->info->version;

And here you would have

	vsp1->info = vsp1_lookup_info(vsp1);
	if (!vsp1->info) {
		ret = -ENXIO;
		goto done;
	}

	vsp1->version = vsp1->info->version;

A subsequent patch could even drop the version field from vsp1_device
and use vsp1->info->version instead of vsp1->version.

There's however a small issue. The version number is exposed to
userspace. Currently it's a full 32-bit value with the 16 MSBs being
0x0101 for all VSP versions, and the 16 LSBs identifying the VSP model
and SoC. With this patch, the version number is retrieved from the info
structure, and the 16 MSBs will thus be 0x0000. This may cause issues in
userspace.

One option would be to set the 16 MSBs in vsp1_device_info.version
(using a new macro added to vsp1_regs.h, I'm not sure how to call it as
it's not clear what 0x0101 represents, if it's meant to identify the
fact that the device is a VSP, maybe VI6_IP_VERSION_VSP ?).

>  	dev_dbg(&pdev->dev, "IP version 0x%08x\n", vsp1->version);
>  
>  	/*
> @@ -940,6 +963,7 @@ static int vsp1_remove(struct platform_device *pdev)
>  static const struct of_device_id vsp1_of_match[] = {
>  	{ .compatible = "renesas,vsp1" },
>  	{ .compatible = "renesas,vsp2" },
> +	{ .compatible = "renesas,rzg2l-vsp2", .data = &rzg2l_vsp2_device_info },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, vsp1_of_match);
> diff --git a/drivers/media/platform/vsp1/vsp1_lif.c b/drivers/media/platform/vsp1/vsp1_lif.c
> index 6a6857ac9327..35abed29f269 100644
> --- a/drivers/media/platform/vsp1/vsp1_lif.c
> +++ b/drivers/media/platform/vsp1/vsp1_lif.c
> @@ -107,6 +107,7 @@ static void lif_configure_stream(struct vsp1_entity *entity,
>  
>  	case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
>  	case VI6_IP_VERSION_MODEL_VSPD_V3:
> +	case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
>  		hbth = 0;
>  		obth = 1500;
>  		lbth = 0;
> @@ -130,16 +131,19 @@ static void lif_configure_stream(struct vsp1_entity *entity,
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
> -	if ((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
> -	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> +	switch (entity->vsp1->version & VI6_IP_VERSION_MASK) {
> +	case (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M):
> +	case (VI6_IP_VERSION_MODEL_VSPD_RZG2L | VI6_IP_VERSION_SOC_G2L):
>  		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
>  			       VI6_LIF_LBA_LBA0 |
>  			       (1536 << VI6_LIF_LBA_LBA1_SHIFT));
> +		break;
> +	}
>  }
>  
>  static const struct vsp1_entity_operations lif_entity_ops = {
> diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
> index fae7286eb01e..3963119eecc5 100644
> --- a/drivers/media/platform/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> @@ -767,8 +767,12 @@
>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
>  #define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
> +/* RZ/G2L SoC's have no version register, So using last ID for the version */
> +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0xff << 8)
>  
>  #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
> +/* RZ/G2L SoC's have no version register, So use '0' for SoC Identification */
> +#define VI6_IP_VERSION_SOC_G2L		(0x00 << 0)

Hmmmm... I wonder how we can make sure here that no future SoCs will use
0xff or 0x00. Especially from a userspace point of view, The resulting
version number will be 0x0000ff00, I'm not sure it will let us have a
nice versioning scheme if we have to extend this to new SoCs that have
different VSPs also lacking a version register.

I wonder if we could possibly use the 16 MSBs to differentiate between
real hardware versions and synthetic versions. For instance, we could
set the MSBs to 0xfffe (unlikely to be used by real hardware), and then
we could allocate version numbers for the 16 LSBs freely, starting
numbering at 0x01 (or maybe a higher value, such as 0x80 ?) for the
model and SoC identifiers.

What does everybody think ?

>  #define VI6_IP_VERSION_SOC_H2		(0x01 << 0)
>  #define VI6_IP_VERSION_SOC_V2H		(0x01 << 0)
>  #define VI6_IP_VERSION_SOC_V3M		(0x01 << 0)
> 

-- 
Regards,

Laurent Pinchart
