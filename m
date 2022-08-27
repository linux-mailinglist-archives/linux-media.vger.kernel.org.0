Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7035C5A3344
	for <lists+linux-media@lfdr.de>; Sat, 27 Aug 2022 02:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242289AbiH0Az4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 20:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbiH0Azy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 20:55:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D12C47BA8;
        Fri, 26 Aug 2022 17:55:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F7D6120A;
        Sat, 27 Aug 2022 02:55:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661561751;
        bh=ZzVx45gDLVcOyi3dIbGTS5mwbOcIYQTfqzbEATqCIZk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vWftRULlwXw391iIGhhb/iyD6t6SwCf44FFv4TCt71imFxEnlDVpL84AvTQ4qyYVA
         JuBCEadIFjnq2nWU5rAV3TJZTWQtOrD2VTupllD/plHhDLbfs0TyU8SegNmGxhExM4
         d2uqOgp01AGZUT3b/Bk7wdLaeBF5e432QfRTf0XE=
Date:   Sat, 27 Aug 2022 03:55:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 4/5] media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA
 feature bit
Message-ID: <Ywlrj28w+8/Coe4Z@pendragon.ideasonboard.com>
References: <20220825132144.2619239-1-biju.das.jz@bp.renesas.com>
 <20220825132144.2619239-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825132144.2619239-5-biju.das.jz@bp.renesas.com>
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

On Thu, Aug 25, 2022 at 02:21:43PM +0100, Biju Das wrote:
> As per HW manual V3M and RZ/G2L SoCs has nonzero LIF buffer
> attributes. So, introduce a feature bit for handling the same.
> 
> This patch also adds separate device info structure for V3M and V3H
> SoCs, as both these SoCs share the same model ID, but V3H does not
> have VSP1_HAS_NON_ZERO_LBA feature bit.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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
>  * Used generic check for matching SoCs with LBA feature.
> v8:
>  * New patch
> ---
>  drivers/media/platform/renesas/vsp1/vsp1.h     |  1 +
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 18 +++++++++++++++++-
>  drivers/media/platform/renesas/vsp1/vsp1_lif.c |  3 +--
>  3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
> index ff4435705abb..2f6f0c6ae555 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1.h
> @@ -55,6 +55,7 @@ struct vsp1_uif;
>  #define VSP1_HAS_HGT		BIT(8)
>  #define VSP1_HAS_BRS		BIT(9)
>  #define VSP1_HAS_EXT_DL		BIT(10)
> +#define VSP1_HAS_NON_ZERO_LBA	BIT(11)
>  
>  struct vsp1_device_info {
>  	u32 version;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 223dd5f557ba..c0d814d9044e 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -787,6 +787,7 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>  	}, {
>  		.version = VI6_IP_VERSION_MODEL_VSPD_V3,
>  		.model = "VSP2-D",
> +		.soc = VI6_IP_VERSION_SOC_V3H,
>  		.gen = 3,
>  		.features = VSP1_HAS_BRS | VSP1_HAS_BRU,
>  		.lif_count = 1,
> @@ -794,6 +795,17 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>  		.uif_count = 1,
>  		.wpf_count = 1,
>  		.num_bru_inputs = 5,
> +	}, {
> +		.version = VI6_IP_VERSION_MODEL_VSPD_V3,
> +		.model = "VSP2-D",
> +		.soc = VI6_IP_VERSION_SOC_V3M,
> +		.gen = 3,
> +		.features = VSP1_HAS_BRS | VSP1_HAS_BRU | VSP1_HAS_NON_ZERO_LBA,
> +		.lif_count = 1,
> +		.rpf_count = 5,
> +		.uif_count = 1,
> +		.wpf_count = 1,
> +		.num_bru_inputs = 5,
>  	}, {
>  		.version = VI6_IP_VERSION_MODEL_VSPDL_GEN3,
>  		.model = "VSP2-DL",
> @@ -837,8 +849,12 @@ static const struct vsp1_device_info *vsp1_lookup_info(struct vsp1_device *vsp1)
>  	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
>  		info = &vsp1_device_infos[i];
>  
> -		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version)
> +		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version) {
> +			if (info->soc &&
> +			    ((vsp1->version & VI6_IP_VERSION_SOC_MASK) != info->soc))
> +				continue;
>  			return info;
> +		}

How about making this more readable ?

	u32 model;
	u32 soc;

	...

	model = vsp1->version & VI6_IP_VERSION_MODEL_MASK;
	soc = vsp1->version & VI6_IP_VERSION_SOC_MASK;

	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
		info = &vsp1_device_infos[i];

		if (model == info->version && (!info->soc || soc == info->soc))
			return info;
	}

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	}
>  
>  	dev_err(vsp1->dev, "unsupported IP version 0x%08x\n", vsp1->version);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> index 6a6857ac9327..9adb892edcdc 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> @@ -135,8 +135,7 @@ static void lif_configure_stream(struct vsp1_entity *entity,
>  	 * may appear on the output). The value required by the manual is not
>  	 * explained but is likely a buffer size or threshold.
>  	 */
> -	if ((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
> -	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> +	if (vsp1_feature(entity->vsp1, VSP1_HAS_NON_ZERO_LBA))
>  		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
>  			       VI6_LIF_LBA_LBA0 |
>  			       (1536 << VI6_LIF_LBA_LBA1_SHIFT));

-- 
Regards,

Laurent Pinchart
