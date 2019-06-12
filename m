Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0F2E429B8
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 16:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732505AbfFLOpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 10:45:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49284 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbfFLOpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 10:45:18 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 326599B1;
        Wed, 12 Jun 2019 16:45:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560350716;
        bh=SUQ+g8BoQCUWiMccKA9g5COZBgRnGBPawulg/lxaGXk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ckbgKyCO98q5Digo+fghazWKwj4e1yeYWcdLYp4Swf+5zWeIBhr69UTh2dMma72by
         5BTJqrjlIzrc3ouQsPWTu26SXKfaWL2Ze/wY82M5kW6NhtJYQHupbDaZKMbs/DJ5mo
         /anUxCBB+Xpzn6kYdrnCtADLXhToGv1J8ek9gSp8=
Date:   Wed, 12 Jun 2019 17:45:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] media: vsp1: drm: Remove vsp1_du_setup_lif()
Message-ID: <20190612144500.GP5035@pendragon.ideasonboard.com>
References: <20190517223143.26251-1-kieran.bingham+renesas@ideasonboard.com>
 <20190517223143.26251-4-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190517223143.26251-4-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Fri, May 17, 2019 at 11:31:43PM +0100, Kieran Bingham wrote:
> The vsp1_du_setup_lif() function is deprecated, and the users have been
> removed. Remove the implementation and the associated configuration
> structure.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/vsp1/vsp1_drm.c | 47 --------------------------
>  include/media/vsp1.h                   | 22 ------------
>  2 files changed, 69 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
> index ce5c0780680f..12f76344bdec 100644
> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> @@ -817,53 +817,6 @@ int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index)
>  }
>  EXPORT_SYMBOL_GPL(vsp1_du_atomic_disable);
>  
> -/**
> - * vsp1_du_setup_lif - Setup the output part of the VSP pipeline
> - * @dev: the VSP device
> - * @pipe_index: the DRM pipeline index
> - * @cfg: the LIF configuration
> - *
> - * Configure the output part of VSP DRM pipeline for the given frame @cfg.width
> - * and @cfg.height. This sets up formats on the BRx source pad, the WPF sink and
> - * source pads, and the LIF sink pad.
> - *
> - * The @pipe_index argument selects which DRM pipeline to setup. The number of
> - * available pipelines depend on the VSP instance.
> - *
> - * As the media bus code on the blend unit source pad is conditioned by the
> - * configuration of its sink 0 pad, we also set up the formats on all blend unit
> - * sinks, even if the configuration will be overwritten later by
> - * vsp1_du_setup_rpf(). This ensures that the blend unit configuration is set to
> - * a well defined state.
> - *
> - * Return 0 on success or a negative error code on failure.
> - */
> -int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> -		      const struct vsp1_du_lif_config *cfg)
> -{
> -	int ret;
> -
> -	struct vsp1_du_modeset_config modes = {
> -		.width = cfg->width,
> -		.height = cfg->height,
> -		.interlaced = cfg->interlaced,
> -	};
> -	struct vsp1_du_enable_config enable = {
> -		.callback = cfg->callback,
> -		.callback_data = cfg->callback_data,
> -	};
> -
> -	if (!cfg)
> -		return vsp1_du_atomic_disable(dev, pipe_index);
> -
> -	ret = vsp1_du_atomic_modeset(dev, pipe_index, &modes);
> -	if (ret)
> -		return ret;
> -
> -	return vsp1_du_atomic_enable(dev, pipe_index, &enable);
> -}
> -EXPORT_SYMBOL_GPL(vsp1_du_setup_lif);
> -
>  /**
>   * vsp1_du_atomic_begin - Prepare for an atomic update
>   * @dev: the VSP device
> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> index 13f5a1c4d45a..bc0a26d33d9a 100644
> --- a/include/media/vsp1.h
> +++ b/include/media/vsp1.h
> @@ -20,28 +20,6 @@ int vsp1_du_init(struct device *dev);
>  #define VSP1_DU_STATUS_COMPLETE		BIT(0)
>  #define VSP1_DU_STATUS_WRITEBACK	BIT(1)
>  
> -/**
> - * struct vsp1_du_lif_config - VSP LIF configuration - Deprecated
> - * @width: output frame width
> - * @height: output frame height
> - * @interlaced: true for interlaced pipelines
> - * @callback: frame completion callback function (optional). When a callback
> - *	      is provided, the VSP driver guarantees that it will be called once
> - *	      and only once for each vsp1_du_atomic_flush() call.
> - * @callback_data: data to be passed to the frame completion callback
> - */
> -struct vsp1_du_lif_config {
> -	unsigned int width;
> -	unsigned int height;
> -	bool interlaced;
> -
> -	void (*callback)(void *data, unsigned int status, u32 crc);
> -	void *callback_data;
> -};
> -
> -int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> -		      const struct vsp1_du_lif_config *cfg);
> -
>  /**
>   * struct vsp1_du_modeset_config - VSP LIF Mode configuration
>   * @width: output frame width

-- 
Regards,

Laurent Pinchart
