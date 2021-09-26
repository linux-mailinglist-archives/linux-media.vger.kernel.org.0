Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158B0418CF9
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 01:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbhIZXIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 19:08:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39414 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbhIZXIZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 19:08:25 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A66C649A;
        Mon, 27 Sep 2021 01:06:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632697607;
        bh=CDC8EqQ5zCYrbhsqQf4E2vnR5hsrL3nFRbBhjfXLwXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WctOx4c5p1vWHxDV1rAVd6MdchEF8Hn4jAzr+rKtssL/IgidPN0CSt1Zhpt94L7QG
         2DNGNaHmeSecFbBkvLed7q7Z4wrYpKrVCbOlk+JYSTHDP+6TD/8IqHh59MIt5exTXw
         R4FeksP9SDwn739+2vsKCMR2tUFlxk/weLlWJ+0M=
Date:   Mon, 27 Sep 2021 02:06:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v8 01/36] media: subdev: rename subdev-state alloc & free
Message-ID: <YVD9AQp1Y+CCEThn@pendragon.ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210830110116.488338-2-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Aug 30, 2021 at 02:00:41PM +0300, Tomi Valkeinen wrote:
> The recently added v4l2_subdev_alloc_state() and
> v4l2_subdev_free_state() were somewhat badly named. They allocate/free
> the state that can be used for a subdev, but they don't change the
> subdev itself in any way.
> 
> In the future we want to have the subdev state available easily for all
> subdevs, and we want to store the state to subdev struct. Thus we will
> be needing a new function which allocates the state and stores it into
> the subdev struct.
> 
> This patch renames v4l2_subdev_alloc/free_state functions to
> v4l2_alloc/free_subdev_state, so that we can later use
> v4l2_subdev_alloc/free_state for the versions which work on the subdev
> struct.

With have video_device_alloc() and media_request_alloc(), should we use
v4l2_subdev_state_alloc() and v4l2_subdev_state_free() to be consistent
?

With or without this (but preferably with ;-)),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Note that regardless of the name, if we have both
v4l2_subdev_alloc_state() (to allocate the state and store it in the
subdev structure) and v4l2_subdev_alloc_state() (to allocate the state),
it could be confusing for driver authors. Let's discuss this further in
the patch series when the problem arises (if it does).

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++--
>  drivers/media/platform/vsp1/vsp1_entity.c   |  4 ++--
>  drivers/media/v4l2-core/v4l2-subdev.c       | 12 ++++++------
>  drivers/staging/media/tegra-video/vi.c      |  4 ++--
>  include/media/v4l2-subdev.h                 | 10 +++++-----
>  5 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 0d141155f0e3..5f4fa8c48f68 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -252,7 +252,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  	u32 width, height;
>  	int ret;
>  
> -	sd_state = v4l2_subdev_alloc_state(sd);
> +	sd_state = v4l2_alloc_subdev_state(sd);
>  	if (IS_ERR(sd_state))
>  		return PTR_ERR(sd_state);
>  
> @@ -288,7 +288,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  
>  	rvin_format_align(vin, pix);
>  done:
> -	v4l2_subdev_free_state(sd_state);
> +	v4l2_free_subdev_state(sd_state);
>  
>  	return ret;
>  }
> diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
> index 823c15facd1b..e40bca254b8b 100644
> --- a/drivers/media/platform/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/vsp1/vsp1_entity.c
> @@ -675,7 +675,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>  	 * Allocate the pad configuration to store formats and selection
>  	 * rectangles.
>  	 */
> -	entity->config = v4l2_subdev_alloc_state(&entity->subdev);
> +	entity->config = v4l2_alloc_subdev_state(&entity->subdev);
>  	if (IS_ERR(entity->config)) {
>  		media_entity_cleanup(&entity->subdev.entity);
>  		return PTR_ERR(entity->config);
> @@ -690,6 +690,6 @@ void vsp1_entity_destroy(struct vsp1_entity *entity)
>  		entity->ops->destroy(entity);
>  	if (entity->subdev.ctrl_handler)
>  		v4l2_ctrl_handler_free(entity->subdev.ctrl_handler);
> -	v4l2_subdev_free_state(entity->config);
> +	v4l2_free_subdev_state(entity->config);
>  	media_entity_cleanup(&entity->subdev.entity);
>  }
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 5d27a27cc2f2..26a34a8e3d37 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -28,7 +28,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>  {
>  	struct v4l2_subdev_state *state;
>  
> -	state = v4l2_subdev_alloc_state(sd);
> +	state = v4l2_alloc_subdev_state(sd);
>  	if (IS_ERR(state))
>  		return PTR_ERR(state);
>  
> @@ -39,7 +39,7 @@ static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>  
>  static void subdev_fh_free(struct v4l2_subdev_fh *fh)
>  {
> -	v4l2_subdev_free_state(fh->state);
> +	v4l2_free_subdev_state(fh->state);
>  	fh->state = NULL;
>  }
>  
> @@ -870,7 +870,7 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>  
> -struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
> +struct v4l2_subdev_state *v4l2_alloc_subdev_state(struct v4l2_subdev *sd)
>  {
>  	struct v4l2_subdev_state *state;
>  	int ret;
> @@ -903,9 +903,9 @@ struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
>  
>  	return ERR_PTR(ret);
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
> +EXPORT_SYMBOL_GPL(v4l2_alloc_subdev_state);
>  
> -void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
> +void v4l2_free_subdev_state(struct v4l2_subdev_state *state)
>  {
>  	if (!state)
>  		return;
> @@ -913,7 +913,7 @@ void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
>  	kvfree(state->pads);
>  	kfree(state);
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
> +EXPORT_SYMBOL_GPL(v4l2_free_subdev_state);
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index d321790b07d9..a94d19e2a67c 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -507,7 +507,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>  	if (!subdev)
>  		return -ENODEV;
>  
> -	sd_state = v4l2_subdev_alloc_state(subdev);
> +	sd_state = v4l2_alloc_subdev_state(subdev);
>  	if (IS_ERR(sd_state))
>  		return PTR_ERR(sd_state);
>  	/*
> @@ -558,7 +558,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>  	v4l2_fill_pix_format(pix, &fmt.format);
>  	tegra_channel_fmt_align(chan, pix, fmtinfo->bpp);
>  
> -	v4l2_subdev_free_state(sd_state);
> +	v4l2_free_subdev_state(sd_state);
>  
>  	return 0;
>  }
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 95ec18c2f49c..8701d2e7d893 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1135,20 +1135,20 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>  int v4l2_subdev_link_validate(struct media_link *link);
>  
>  /**
> - * v4l2_subdev_alloc_state - allocate v4l2_subdev_state
> + * v4l2_alloc_subdev_state - allocate v4l2_subdev_state
>   *
>   * @sd: pointer to &struct v4l2_subdev for which the state is being allocated.
>   *
> - * Must call v4l2_subdev_free_state() when state is no longer needed.
> + * Must call v4l2_free_subdev_state() when state is no longer needed.
>   */
> -struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
> +struct v4l2_subdev_state *v4l2_alloc_subdev_state(struct v4l2_subdev *sd);
>  
>  /**
> - * v4l2_subdev_free_state - free a v4l2_subdev_state
> + * v4l2_free_subdev_state - free a v4l2_subdev_state
>   *
>   * @state: v4l2_subdev_state to be freed.
>   */
> -void v4l2_subdev_free_state(struct v4l2_subdev_state *state);
> +void v4l2_free_subdev_state(struct v4l2_subdev_state *state);
>  
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  

-- 
Regards,

Laurent Pinchart
