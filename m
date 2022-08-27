Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D6D5A3339
	for <lists+linux-media@lfdr.de>; Sat, 27 Aug 2022 02:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbiH0As5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 20:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiH0As4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 20:48:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD49AE3C12;
        Fri, 26 Aug 2022 17:48:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB8A5120A;
        Sat, 27 Aug 2022 02:48:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661561330;
        bh=8qlAy2blaZOd9YFQDit5ux9NfDHjk6Z1/clYCeQjLxE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M6HfDKX1nOQs7Tn2mcCECpxel0fHkHq/+IRs9rBoTotY/xeaiQAfoV0TQ77iGrl0o
         VTIlWZ4Jq8itqhsrJrfex+t9UNMUT6gY617jUn8dopaBvkWK/gA/XcuMnqA5zaUzDc
         oebefNZa4s6YWs3UhbZHWN083YGMSr1sQLzj2c7k=
Date:   Sat, 27 Aug 2022 03:48:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 3/5] media: renesas: vsp1: Add support for VSP
 software version
Message-ID: <Ywlp6i8xYg7rAIt1@pendragon.ideasonboard.com>
References: <20220825132144.2619239-1-biju.das.jz@bp.renesas.com>
 <20220825132144.2619239-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825132144.2619239-4-biju.das.jz@bp.renesas.com>
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

On Thu, Aug 25, 2022 at 02:21:42PM +0100, Biju Das wrote:
> The VSPD block on RZ/G2L SoCs does not have a version register.
> 
> This patch adds support for adding VSP software version based on
> device match.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v12->v13:
>  * No change
> v11->v12:
>  * No change
> v10->v11:
>  * No change
> v9->v10:
>  * No change
> v8->v9:
>  * Added Rb tag from Geert
>  * Updated commit description RZ/G2L -> RZ/G2L SoCs.
>  * Replaced break with return info in case a Model match is found and
>    removed additional check for non-match case.
> v8:
>  * New patch
> ---
>  drivers/media/platform/renesas/vsp1/vsp1.h    |  1 +
>  .../media/platform/renesas/vsp1/vsp1_drv.c    | 43 +++++++++++++------
>  .../media/platform/renesas/vsp1/vsp1_regs.h   |  2 +
>  3 files changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
> index baf898d577ec..ff4435705abb 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1.h
> @@ -67,6 +67,7 @@ struct vsp1_device_info {
>  	unsigned int uif_count;
>  	unsigned int wpf_count;
>  	unsigned int num_bru_inputs;
> +	u8 soc;
>  	bool uapi;
>  };
>  
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 975e6851735e..223dd5f557ba 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -817,11 +817,39 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>  	},
>  };
>  
> +static const struct vsp1_device_info *vsp1_lookup_info(struct vsp1_device *vsp1)
> +{
> +	const struct vsp1_device_info *info;
> +	unsigned int i;
> +
> +	/*
> +	 * Try the info stored in match data first for devices that don't have
> +	 * a version register.
> +	 */
> +	info = of_device_get_match_data(vsp1->dev);
> +	if (info) {
> +		vsp1->version = VI6_IP_VERSION_VSP_SW | info->version | info->soc;
> +		return info;
> +	}
> +
> +	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> +
> +	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> +		info = &vsp1_device_infos[i];
> +
> +		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version)
> +			return info;
> +	}
> +
> +	dev_err(vsp1->dev, "unsupported IP version 0x%08x\n", vsp1->version);
> +
> +	return NULL;
> +}
> +
>  static int vsp1_probe(struct platform_device *pdev)
>  {
>  	struct vsp1_device *vsp1;
>  	struct device_node *fcp_node;
> -	unsigned int i;
>  	int ret;
>  	int irq;
>  
> @@ -877,19 +905,8 @@ static int vsp1_probe(struct platform_device *pdev)
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
> -	}
> -
> +	vsp1->info = vsp1_lookup_info(vsp1);
>  	if (!vsp1->info) {
> -		dev_err(&pdev->dev, "unsupported IP version 0x%08x\n",
> -			vsp1->version);
>  		vsp1_device_put(vsp1);
>  		ret = -ENXIO;
>  		goto done;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> index fae7286eb01e..4286d13eca32 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -781,6 +781,8 @@
>  #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
>  #define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
>  
> +#define VI6_IP_VERSION_VSP_SW		(0xfffe << 16) /* SW VSP version */
> +
>  /* -----------------------------------------------------------------------------
>   * RPF CLUT Registers
>   */

-- 
Regards,

Laurent Pinchart
