Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5188496F63
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 02:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235181AbiAWB0W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 20:26:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235171AbiAWB0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 20:26:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B018C06173B;
        Sat, 22 Jan 2022 17:26:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF77825E;
        Sun, 23 Jan 2022 02:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642901179;
        bh=QTTTVMXy88p6+ruvZJNMd8ekhYuSzmYmFD7bUoZmjYY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=odC8wHCL7nK3x09pUslGVQqzQaaesHz2DS2ZA3mdSJOgLEhABDDd9iMIWBiwDinR3
         eJ/q7+XhRdo2wd5NQhumc18h5VX1HGSzSDFCUhbKaP1fwygUCqypm5gMSnqsH/0T16
         zUgidgGsiu5RukjLCEth8xP2K7Z/yhfhFiDXhB+4=
Date:   Sun, 23 Jan 2022 03:26:01 +0200
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
Subject: Re: [RFC 20/28] media: vsp1: Add support for the RZ/G2L VSPD
Message-ID: <YeyuqbNfETGOxzfZ@pendragon.ideasonboard.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-21-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220112174612.10773-21-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Wed, Jan 12, 2022 at 05:46:04PM +0000, Biju Das wrote:
> The RZ/G2L VSPD provides a single VSPD instance. it has the following
> sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
> 
> It does not have version register, so added a new compatible string to
> match to get the version value. Also the reset is shared with DU
> module.

Does it really lack the version register, or is it just not documented ?
It hasn't been documented on all R-Car variants, but has consistently
been present.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/platform/vsp1/vsp1.h      |  1 +
>  drivers/media/platform/vsp1/vsp1_drv.c  | 31 ++++++++++++++++++++++++-
>  drivers/media/platform/vsp1/vsp1_lif.c  |  7 ++++--
>  drivers/media/platform/vsp1/vsp1_regs.h |  1 +
>  4 files changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1.h b/drivers/media/platform/vsp1/vsp1.h
> index 37cf33c7e6ca..b137c0233db5 100644
> --- a/drivers/media/platform/vsp1/vsp1.h
> +++ b/drivers/media/platform/vsp1/vsp1.h
> @@ -103,6 +103,7 @@ struct vsp1_device {
>  	struct media_entity_operations media_ops;
>  
>  	struct vsp1_drm *drm;
> +	struct reset_control *rstc;

Could you move this with the toher resources, just after the bus_master
field ?

>  };
>  
>  int vsp1_device_get(struct vsp1_device *vsp1);
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index c9044785b903..c00ba65030fd 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/videodev2.h>
>  
>  #include <media/rcar-fcp.h>
> @@ -559,6 +560,15 @@ static int vsp1_device_init(struct vsp1_device *vsp1)
>   */
>  int vsp1_device_get(struct vsp1_device *vsp1)
>  {
> +	int ret;
> +
> +	if (vsp1->rstc) {
> +		ret = reset_control_deassert(vsp1->rstc);

Adding reset support could be split to a separate patch.

> +		if (ret < 0) {
> +			reset_control_assert(vsp1->rstc);

Is asserting reset needed here ?

> +			return ret;
> +		}
> +	}
>  	return pm_runtime_resume_and_get(vsp1->dev);
>  }
>  
> @@ -571,6 +581,8 @@ int vsp1_device_get(struct vsp1_device *vsp1)
>  void vsp1_device_put(struct vsp1_device *vsp1)
>  {
>  	pm_runtime_put_sync(vsp1->dev);
> +	if (vsp1->rstc)
> +		reset_control_assert(vsp1->rstc);
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -787,6 +799,14 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>  		.uif_count = 2,
>  		.wpf_count = 1,
>  		.num_bru_inputs = 5,
> +	}, {
> +		.version = VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> +		.model = "VSP2-D",
> +		.gen = 3,
> +		.features = VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HAS_EXT_DL,
> +		.lif_count = 1,
> +		.rpf_count = 2,
> +		.wpf_count = 1,
>  	},
>  };
>  
> @@ -826,6 +846,13 @@ static int vsp1_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	vsp1->version = (uintptr_t)of_device_get_match_data(&pdev->dev);
> +	if (vsp1->version == VI6_IP_VERSION_MODEL_VSPD_RZG2L) {
> +		vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
> +		if (IS_ERR(vsp1->rstc))
> +			return PTR_ERR(vsp1->rstc);

As the resets DT property is mandatory, and is present in all .dtsi in
mainline, should the devm_reset_control_get_shared() call be made for
all VSPs ?

> +	}
> +
>  	/* FCP (optional). */
>  	fcp_node = of_parse_phandle(pdev->dev.of_node, "renesas,fcp", 0);
>  	if (fcp_node) {
> @@ -854,7 +881,8 @@ static int vsp1_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto done;
>  
> -	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> +	if (vsp1->version != VI6_IP_VERSION_MODEL_VSPD_RZG2L)
> +		vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
>  	vsp1_device_put(vsp1);

You could condition the whole block of vsp1_device_get(), vsp1_read()
and vsp1_device_put() on the version not being set.

>  
>  	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> @@ -905,6 +933,7 @@ static int vsp1_remove(struct platform_device *pdev)
>  static const struct of_device_id vsp1_of_match[] = {
>  	{ .compatible = "renesas,vsp1" },
>  	{ .compatible = "renesas,vsp2" },
> +	{ .compatible = "renesas,vsp2-r9a07g044", .data = (void *)VI6_IP_VERSION_MODEL_VSPD_RZG2L },

Let's point to the vsp1_device_infos entry instead.

>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, vsp1_of_match);
> diff --git a/drivers/media/platform/vsp1/vsp1_lif.c b/drivers/media/platform/vsp1/vsp1_lif.c
> index 6a6857ac9327..6e997653cfac 100644
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
> @@ -135,8 +136,10 @@ static void lif_configure_stream(struct vsp1_entity *entity,
>  	 * may appear on the output). The value required by the manual is not
>  	 * explained but is likely a buffer size or threshold.
>  	 */
> -	if ((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
> -	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> +	if (((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
> +	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M)) ||
> +	    ((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
> +	     VI6_IP_VERSION_MODEL_VSPD_RZG2L))
>  		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
>  			       VI6_LIF_LBA_LBA0 |
>  			       (1536 << VI6_LIF_LBA_LBA1_SHIFT));
> diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
> index fae7286eb01e..12c5b09885dc 100644
> --- a/drivers/media/platform/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> @@ -766,6 +766,7 @@
>  #define VI6_IP_VERSION_MODEL_VSPD_V3	(0x18 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
> +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x1b << 8)
>  #define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
>  
>  #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)

-- 
Regards,

Laurent Pinchart
