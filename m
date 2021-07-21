Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C872E3D0911
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 08:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234096AbhGUF7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 01:59:08 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:43805 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234155AbhGUF7A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 01:59:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 65tFmzWSYhqx965tGmxxc7; Wed, 21 Jul 2021 08:39:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626849576; bh=yQp/l5p8mvzmmq77UUizGDSncWfEuOVkcUW8on3dISE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FUBjnNfpY311gRji6jhwHG2HqaeREskPN4PmH90MPqOMDuVjueVYZlo8di1myg2JC
         BJpVuwkFwd5mGUMFYBbv60Wutd8MmyIITl/TRayLzV969LdBAbRoZwIiQ0xRpdCJPE
         KphoQVi4GM0Ilh1/C5yPYmBgdf6iHO3D6PAlsmXGAdp86EqvUdLZcm0txMspNAFUDF
         8FL+s81PHlQ8OwWAWFcnojpI4MV8f3/ETyHcDPe2ReEyjBIrk83JRDusLjg3OAnS6+
         Y78jsfAmDdFlEkQxM4mNPzTOcs3waX7ChibP//D58e+j/aC8ZM4gEI2+4wLjD3YreA
         DbpgzOyhVtgqw==
Subject: Re: [PATCH v2 11/11] rcar-vin: Add r8a779a0 support
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
 <20210709142600.651718-12-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3b15cc12-2c3c-c622-fcbb-3aed583f09d1@xs4all.nl>
Date:   Wed, 21 Jul 2021 08:39:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709142600.651718-12-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfE4QgkbtxbajqtR8m4zsY1WGBJOAlqqTqhS4uQmpYssKHvLT88+h5xIlSkFnq6oxXP6rVGUw7uCfpsxi4/ZFdhYRO6R212LJTGAPTHA4fyb3HhMZoZEy
 VoLC0ERRUnNR2bzVgvxYMY1eRtfEAimjKuccBQlDv3FslDkRgvypJJaNJ8zutNHYSLuY/y+ACTPpMq2R9tnAX7U9icnVddU19zW54/00MGUaWgyX384mNDfW
 lbV7SpaPnZjuMxvuM2DpeT/bexsN2DgovHio5V6ie0d+XpSQlkTA8glLtQxOS3I/YGbyBzSBOseVpj4uIFJZRzQuwBYGoe0wMztAUVF6TRiJda9YKoLtmkrx
 dEB+pD7JusLuVtPsXLDqkRZ8Tr9oG2l2VYcBNET0jtOirgW2f4xMNYD8UF7PLaZMY/fKZhjL783/ASrCvwiDeTBdwr0LLiC4ov1wKmSuuqkTTr6lFOs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Just one thing at the end of this patch:

On 09/07/2021 16:26, Niklas Söderlund wrote:
> Add support for the R-Car V3U (r8a779a0) to the driver. The V3U has the
> VIN modules connected to a ISP instead of directly to the R-Car CSI-2
> receivers. The reason being that the ISP performs channel selection
> based on CSI-2 VC/DT pairs and routes the video data to different VIN
> modules. In other SoC versions this filtering is done by the VIN modules
> themself.
> 
> While the media graph is very different from other SoCs the only
> difference in operating the VIN modules is that the VC/DT filtering
> should be skipped as that is performed by the ISP.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> * Changes since v1
> - Allow the link_setup() return an error.
> - Fix spelling in commit message.
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 106 +++++++++++++++++++-
>  drivers/media/platform/rcar-vin/rcar-dma.c  |  20 ++--
>  drivers/media/platform/rcar-vin/rcar-vin.h  |  15 ++-
>  3 files changed, 128 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 0653e1ce144860fe..690e3f7e5a1c68ca 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -1007,6 +1007,91 @@ static int rvin_csi2_init(struct rvin_dev *vin)
>  	return ret;
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * ISP
> + */
> +
> +static int rvin_isp_setup_links(struct rvin_dev *vin)
> +{
> +	unsigned int i;
> +	int ret = -EINVAL;
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
> +		ret = media_create_pad_link(source, source_idx, sink, 0,
> +					    MEDIA_LNK_FL_ENABLED |
> +					    MEDIA_LNK_FL_IMMUTABLE);
> +		if (ret) {
> +			vin_err(vin, "Error adding link from %s to %s\n",
> +				source->name, sink->name);
> +			break;
> +		}
> +	}
> +	mutex_unlock(&vin->group->lock);
> +
> +	return ret;
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
> @@ -1379,6 +1464,15 @@ static const struct rvin_info rcar_info_r8a77995 = {
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
> @@ -1440,6 +1534,10 @@ static const struct of_device_id rvin_of_id_table[] = {
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
> @@ -1488,7 +1586,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
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
> @@ -1512,7 +1612,9 @@ static int rcar_vin_remove(struct platform_device *pdev)
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
> index f5f722ab1d4e8461..58718e52ae541a87 100644
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
> index 49c148c40ea52b79..36a229c9bb35c3c1 100644
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
> +
> +#define RVIN_REMOTES_MAX \
> +	(((unsigned int)RVIN_CSI_MAX) > ((unsigned int)RVIN_ISP_MAX) ? \
> +	 RVIN_CSI_MAX : RVIN_ISP_MAX)
>  
>  /**
>   * enum rvin_dma_state - DMA states
> @@ -158,6 +168,7 @@ struct rvin_group_route {
>  struct rvin_info {
>  	enum model_id model;
>  	bool use_mc;
> +	bool use_isp;

drivers/media/platform/rcar-vin/rcar-vin.h:177: warning: Function parameter or member 'use_isp' not described in 'rvin_info'

Can you post a v3 just for this patch?

>  	bool nv12;
>  
>  	unsigned int max_width;
> 

Regards,

	Hans
