Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7854ACEC3
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 03:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244359AbiBHCSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 21:18:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbiBHCSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 21:18:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AC8C061355
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 18:18:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9E69340;
        Tue,  8 Feb 2022 03:18:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644286727;
        bh=XoLGtPKqJoSsnR488IlsMXGz5pSRWuD1oJnVVopW2WA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EZ2tYYzbCuwZuT4phi3pM14Ey4vX9HeS7mkME1f4mblAQEvRu5K09RmUx52PKTFth
         QSmSyBsNjS7WwKClRNMcqmanc5S/dBfdxoN0RhIqvBeJmQjXW14YN/ofxjx8ekCIDS
         zSUVUHMfyJ9uLG8SgRH96B1s7gKXhLj9hpvI7VOQ=
Date:   Tue, 8 Feb 2022 04:18:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v3 1/7] media: subdev: rename subdev-state alloc & free
Message-ID: <YgHTBDTNYNoPckTh@pendragon.ideasonboard.com>
References: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
 <20220207161107.1166376-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220207161107.1166376-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Feb 07, 2022 at 06:11:01PM +0200, Tomi Valkeinen wrote:
> v4l2_subdev_alloc_state() and v4l2_subdev_free_state() are not supposed
> to be used by the drivers. However, we do have a few drivers that use
> those at the moment, so we need to expose these functions for the time
> being.
> 
> Prefix the functions with __ to mark the functions as internal.
> 
> At the same time, rename them to v4l2_subdev_state_alloc and
> v4l2_subdev_state_free to match the style used for other functions like
> video_device_alloc() and media_request_alloc().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++--
>  drivers/media/platform/vsp1/vsp1_entity.c   |  4 ++--
>  drivers/media/v4l2-core/v4l2-subdev.c       | 12 ++++++------
>  drivers/staging/media/tegra-video/vi.c      |  4 ++--
>  include/media/v4l2-subdev.h                 | 10 +++++-----
>  5 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 2e60b9fce03b..5aae01456c04 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -263,7 +263,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  	u32 width, height;
>  	int ret;
>  
> -	sd_state = v4l2_subdev_alloc_state(sd);
> +	sd_state = __v4l2_subdev_state_alloc(sd);
>  	if (IS_ERR(sd_state))
>  		return PTR_ERR(sd_state);
>  
> @@ -299,7 +299,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  
>  	rvin_format_align(vin, pix);
>  done:
> -	v4l2_subdev_free_state(sd_state);
> +	__v4l2_subdev_state_free(sd_state);
>  
>  	return ret;
>  }
> diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
> index 823c15facd1b..869cadc1468d 100644
> --- a/drivers/media/platform/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/vsp1/vsp1_entity.c
> @@ -675,7 +675,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>  	 * Allocate the pad configuration to store formats and selection
>  	 * rectangles.
>  	 */
> -	entity->config = v4l2_subdev_alloc_state(&entity->subdev);
> +	entity->config = __v4l2_subdev_state_alloc(&entity->subdev);
>  	if (IS_ERR(entity->config)) {
>  		media_entity_cleanup(&entity->subdev.entity);
>  		return PTR_ERR(entity->config);
> @@ -690,6 +690,6 @@ void vsp1_entity_destroy(struct vsp1_entity *entity)
>  		entity->ops->destroy(entity);
>  	if (entity->subdev.ctrl_handler)
>  		v4l2_ctrl_handler_free(entity->subdev.ctrl_handler);
> -	v4l2_subdev_free_state(entity->config);
> +	__v4l2_subdev_state_free(entity->config);
>  	media_entity_cleanup(&entity->subdev.entity);
>  }
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 5d27a27cc2f2..fe49c86a9b02 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -28,7 +28,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>  {
>  	struct v4l2_subdev_state *state;
>  
> -	state = v4l2_subdev_alloc_state(sd);
> +	state = __v4l2_subdev_state_alloc(sd);
>  	if (IS_ERR(state))
>  		return PTR_ERR(state);
>  
> @@ -39,7 +39,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>  
>  static void subdev_fh_free(struct v4l2_subdev_fh *fh)
>  {
> -	v4l2_subdev_free_state(fh->state);
> +	__v4l2_subdev_state_free(fh->state);
>  	fh->state = NULL;
>  }
>  
> @@ -870,7 +870,7 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>  
> -struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
> +struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
>  {
>  	struct v4l2_subdev_state *state;
>  	int ret;
> @@ -903,9 +903,9 @@ struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
>  
>  	return ERR_PTR(ret);
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_alloc);
>  
> -void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
> +void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
>  {
>  	if (!state)
>  		return;
> @@ -913,7 +913,7 @@ void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
>  	kvfree(state->pads);
>  	kfree(state);
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
> +EXPORT_SYMBOL_GPL(__v4l2_subdev_state_free);
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index d1f43f465c22..dc16406ff7dc 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -507,7 +507,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>  	if (!subdev)
>  		return -ENODEV;
>  
> -	sd_state = v4l2_subdev_alloc_state(subdev);
> +	sd_state = __v4l2_subdev_state_alloc(subdev);
>  	if (IS_ERR(sd_state))
>  		return PTR_ERR(sd_state);
>  	/*
> @@ -558,7 +558,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>  	v4l2_fill_pix_format(pix, &fmt.format);
>  	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
>  
> -	v4l2_subdev_free_state(sd_state);
> +	__v4l2_subdev_state_free(sd_state);
>  
>  	return 0;
>  }
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 95ec18c2f49c..e52bf508c75b 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1135,20 +1135,20 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>  int v4l2_subdev_link_validate(struct media_link *link);
>  
>  /**
> - * v4l2_subdev_alloc_state - allocate v4l2_subdev_state
> + * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
>   *
>   * @sd: pointer to &struct v4l2_subdev for which the state is being allocated.
>   *
> - * Must call v4l2_subdev_free_state() when state is no longer needed.
> + * Must call __v4l2_subdev_state_free() when state is no longer needed.

While at it, you could add a sentence to indicate that the function
should not be called by drivers. Same for __v4l2_subdev_state_free().

>   */
> -struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
> +struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd);
>  
>  /**
> - * v4l2_subdev_free_state - free a v4l2_subdev_state
> + * __v4l2_subdev_state_free - free a v4l2_subdev_state
>   *
>   * @state: v4l2_subdev_state to be freed.
>   */
> -void v4l2_subdev_free_state(struct v4l2_subdev_state *state);
> +void __v4l2_subdev_state_free(struct v4l2_subdev_state *state);
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  

-- 
Regards,

Laurent Pinchart
