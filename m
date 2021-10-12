Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7027542A660
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 15:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236968AbhJLNsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 09:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236678AbhJLNsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 09:48:37 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F975C061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 06:46:35 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aI6vmsEFJx7rIaI6zmMDTv; Tue, 12 Oct 2021 15:46:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634046393; bh=Jdom3KajSI6OQpXUfrIjpuEO48Ak/ZI9xw0UDHdBFa4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ZGnZlOjv009OcNUNvIlfNsakIiUJs2nSZvzQQLbERzD3rTSQWLfhhLUU2mht69L9M
         30ulWAa9aARb0QW3oLZ/O8/haPmwZKHuh4HNX/e6HPMkw+ElEPxinD/ghIElDeJwD3
         XQjIofuEZg7hH8g3CmpgGjnTrj9R011VlbVEJgT7qDrpiLPuDKyQtF15w+V9a7tP5F
         jxYyM5e0sQfwxGMW5YVyoC54fX2FLL31ZCePmqM++YFJRapCImjs0QU03PvxDasfmU
         XYM8a8vOkY//+fIZoVr6vUmjAXOLGRfy6wZNAqcxgPc8SKsKKEHdd3ccSar7/kIXud
         c2Hg6R2s+GiZg==
Subject: Re: [PATCH v9 01/36] media: subdev: rename subdev-state alloc & free
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-2-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ff2640ca-5c76-66aa-5af2-8dac133b95a3@xs4all.nl>
Date:   Tue, 12 Oct 2021 15:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-2-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGx2v3s1hRjOVzCzIDuVqQRm+eRbqO5dcizxfy1a/mwvI7m2NyFyty5paA/URud/5Vw53YqVxwLKdbA69zApqUDIZpPaJNQkyzEu6C6nkEHCjbYszAUg
 fh/yyKQfAP9+mUfPBTjsgU9jIap5hMvDUgN0Nmr/TKZwUNWs2xeGY4SJTJhdi1c7C0QmlFG6UdIwsden3Ob+M2lzDT+kHorcPaMRto7eKK6alGcdHrSz23aG
 zngBbePKtldROWNZwEo/aQHpdS437ANkS4s9Di5PJKRkBmGE5ryrwQ9LwesfyK8b7dSB8yLL4EAnZunQvDuaUnL+nnoz9h+YfJzVBe/Co0XbE7pnZlhoqV2D
 q9KntqRDQ53YiY9OpHpeqvecQHjCLrpdZKUMPi8hq586BUpZsocH5EkYH8/SV3i3zEVohjUYgxeqbrctdbpzz4rG2V9zhTj5XGajMKkLo3wtOwpw0KP4910N
 PiP5SsRx7lC5Bs55iOvl1VBcBkMUGe0TVG8Vbw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
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

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++--
>  drivers/media/platform/vsp1/vsp1_entity.c   |  4 ++--
>  drivers/media/v4l2-core/v4l2-subdev.c       | 12 ++++++------
>  drivers/staging/media/tegra-video/vi.c      |  4 ++--
>  include/media/v4l2-subdev.h                 | 10 +++++-----
>  5 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 0d141155f0e3..ba1d16ab1651 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -252,7 +252,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  	u32 width, height;
>  	int ret;
>  
> -	sd_state = v4l2_subdev_alloc_state(sd);
> +	sd_state = __v4l2_subdev_state_alloc(sd);
>  	if (IS_ERR(sd_state))
>  		return PTR_ERR(sd_state);
>  
> @@ -288,7 +288,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
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
> index d321790b07d9..66b9ce160472 100644
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
> 

