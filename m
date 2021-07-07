Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE8A33BE6E6
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 13:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbhGGLLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 07:11:44 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:42129 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbhGGLLo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 07:11:44 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1CECD20000E;
        Wed,  7 Jul 2021 11:09:01 +0000 (UTC)
Date:   Wed, 7 Jul 2021 13:09:50 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 11/11] rcar-vin: Add r8a779a0 support
Message-ID: <20210707110950.3l7j6bqrkwugf6iq@uno.localdomain>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-12-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413180253.2575451-12-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Apr 13, 2021 at 08:02:53PM +0200, Niklas Söderlund wrote:
> Add support for the R-Car V3U (r8a779a0) to the driver. The V3U have the

has

> VIN modules connected to a ISP instead of directly to the R-Car CSI-2
> receivers. The reason being that the ISP performs channel selection
> based on CSI-2 VC/DT pairs and routes the video data to different VIN
> modules. Other SoC versions this filtering is done by the VIN modules

"In other SoC versions". Or "For"...

> themself.
>
> While the media graph very different from other SoCs the only difference

the media graph is

> in operating the VIN modules is that the VC/DT filtering should be
> skipped as that is performed by the ISP.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 102 +++++++++++++++++++-
>  drivers/media/platform/rcar-vin/rcar-dma.c  |  20 ++--
>  drivers/media/platform/rcar-vin/rcar-vin.h  |  15 ++-
>  3 files changed, 124 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 763be02f507e6f3f..98326e80d2ed23d2 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -1006,6 +1006,87 @@ static int rvin_csi2_init(struct rvin_dev *vin)
>  	return ret;
>  }
>
> +/* -----------------------------------------------------------------------------
> + * ISP
> + */
> +
> +static void rvin_isp_setup_links(struct rvin_dev *vin)
> +{
> +	unsigned int i;
> +
> +	/* Create all media device links between VINs and ISP's. */
> +	mutex_lock(&vin->group->lock);
> +	for (i = 0; i < RCAR_VIN_NUM; i++) {
> +		struct media_pad *source_pad, *sink_pad;
> +		struct media_entity *source, *sink;
> +		unsigned int source_slot = i / 8;
> +		unsigned int source_idx = i % 8 + 1;
> +
> +		if (!vin->group->vin[i])
> +			continue;
> +
> +		/* Check that ISP is part of the group. */
> +		if (!vin->group->remotes[source_slot].subdev)
> +			continue;
> +
> +		source = &vin->group->remotes[source_slot].subdev->entity;
> +		source_pad = &source->pads[source_idx];
> +
> +		sink = &vin->group->vin[i]->vdev.entity;
> +		sink_pad = &sink->pads[0];
> +
> +		/* Skip if link already exists. */
> +		if (media_entity_find_link(source_pad, sink_pad))
> +			continue;
> +
> +		if (media_create_pad_link(source, source_idx, sink, 0,
> +					  MEDIA_LNK_FL_ENABLED |
> +					  MEDIA_LNK_FL_IMMUTABLE)) {
> +			vin_err(vin, "Error adding link from %s to %s\n",
> +				source->name, sink->name);

Same question about the CSI-2 version, is is ok not reporting errors ?

> +			break;
> +		}
> +	}
> +	mutex_unlock(&vin->group->lock);
> +}
> +
> +static void rvin_isp_cleanup(struct rvin_dev *vin)
> +{
> +	rvin_group_notifier_cleanup(vin);
> +	rvin_group_put(vin);
> +	rvin_free_controls(vin);
> +}
> +
> +static int rvin_isp_init(struct rvin_dev *vin)
> +{
> +	int ret;
> +
> +	vin->pad.flags = MEDIA_PAD_FL_SINK;
> +	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
> +	if (ret)
> +		return ret;
> +
> +	ret = rvin_create_controls(vin, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = rvin_group_get(vin, rvin_isp_setup_links, NULL);
> +	if (ret)
> +		goto err_controls;
> +
> +	ret = rvin_group_notifier_init(vin, 2, RVIN_ISP_MAX);
> +	if (ret)
> +		goto err_group;
> +
> +	return 0;
> +err_group:
> +	rvin_group_put(vin);
> +err_controls:
> +	rvin_free_controls(vin);
> +
> +	return ret;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Suspend / Resume
>   */
> @@ -1378,6 +1459,15 @@ static const struct rvin_info rcar_info_r8a77995 = {
>  	.routes = rcar_info_r8a77995_routes,
>  };
>
> +static const struct rvin_info rcar_info_r8a779a0 = {
> +	.model = RCAR_GEN3,
> +	.use_mc = true,
> +	.use_isp = true,
> +	.nv12 = true,
> +	.max_width = 4096,
> +	.max_height = 4096,
> +};
> +
>  static const struct of_device_id rvin_of_id_table[] = {
>  	{
>  		.compatible = "renesas,vin-r8a774a1",
> @@ -1435,6 +1525,10 @@ static const struct of_device_id rvin_of_id_table[] = {
>  		.compatible = "renesas,vin-r8a77995",
>  		.data = &rcar_info_r8a77995,
>  	},
> +	{
> +		.compatible = "renesas,vin-r8a779a0",
> +		.data = &rcar_info_r8a779a0,
> +	},
>  	{ /* Sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, rvin_of_id_table);
> @@ -1483,7 +1577,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, vin);
>
> -	if (vin->info->use_mc)
> +	if (vin->info->use_isp)
> +		ret = rvin_isp_init(vin);
> +	else if (vin->info->use_mc)
>  		ret = rvin_csi2_init(vin);
>  	else
>  		ret = rvin_parallel_init(vin);
> @@ -1507,7 +1603,9 @@ static int rcar_vin_remove(struct platform_device *pdev)
>
>  	rvin_v4l2_unregister(vin);
>
> -	if (vin->info->use_mc)
> +	if (vin->info->use_isp)
> +		rvin_isp_cleanup(vin);
> +	else if (vin->info->use_mc)
>  		rvin_csi2_cleanup(vin);
>  	else
>  		rvin_parallel_cleanup(vin);
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index f30dafbdf61ca15f..24b3a51e524fcc72 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -783,16 +783,18 @@ static int rvin_setup(struct rvin_dev *vin)
>  	/* Always update on field change */
>  	vnmc |= VNMC_VUP;
>
> -	/* If input and output use the same colorspace, use bypass mode */
> -	if (input_is_yuv == output_is_yuv)
> -		vnmc |= VNMC_BPS;
> +	if (!vin->info->use_isp) {
> +		/* If input and output use the same colorspace, use bypass mode */
> +		if (input_is_yuv == output_is_yuv)
> +			vnmc |= VNMC_BPS;
>
> -	if (vin->info->model == RCAR_GEN3) {
> -		/* Select between CSI-2 and parallel input */
> -		if (vin->is_csi)
> -			vnmc &= ~VNMC_DPINE;
> -		else
> -			vnmc |= VNMC_DPINE;
> +		if (vin->info->model == RCAR_GEN3) {
> +			/* Select between CSI-2 and parallel input */
> +			if (vin->is_csi)
> +				vnmc &= ~VNMC_DPINE;
> +			else
> +				vnmc |= VNMC_DPINE;
> +		}
>  	}
>
>  	/* Progressive or interlaced mode */
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index f2c32d5ceb7f83d9..88728ebe470ecafd 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -29,7 +29,7 @@
>  #define HW_BUFFER_MASK 0x7f
>
>  /* Max number on VIN instances that can be in a system */
> -#define RCAR_VIN_NUM 8
> +#define RCAR_VIN_NUM 32
>
>  struct rvin_group;
>
> @@ -48,7 +48,17 @@ enum rvin_csi_id {
>  	RVIN_CSI_MAX,
>  };
>
> -#define RVIN_REMOTES_MAX RVIN_CSI_MAX
> +enum rvin_isp_id {
> +	RVIN_ISP0,
> +	RVIN_ISP1,
> +	RVIN_ISP2,
> +	RVIN_ISP4,
> +	RVIN_ISP_MAX,
> +};

Be aware this seems not to be used

> +
> +#define RVIN_REMOTES_MAX \
> +	(((unsigned int)RVIN_CSI_MAX) > ((unsigned int)RVIN_ISP_MAX) ? \
> +	 RVIN_CSI_MAX : RVIN_ISP_MAX)

And I assume this is here in order to prepare for the introduction of
new CSI-2 interfaces or new ISPs

The way how easy it looks plumbing ISP support is means you did a
great job paving the way for that to happen in the previous patches!
Really good job!

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>
>  /**
>   * enum rvin_dma_state - DMA states
> @@ -158,6 +168,7 @@ struct rvin_group_route {
>  struct rvin_info {
>  	enum model_id model;
>  	bool use_mc;
> +	bool use_isp;
>  	bool nv12;
>
>  	unsigned int max_width;
> --
> 2.31.1
>
