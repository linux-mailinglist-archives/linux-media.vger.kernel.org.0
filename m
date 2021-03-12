Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67A83399BD
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 23:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbhCLWlK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 17:41:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48158 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235509AbhCLWkv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 17:40:51 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6705788F;
        Fri, 12 Mar 2021 23:40:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615588850;
        bh=hr7iQRljK8V9DAtBjhcQWTdNd7SJTCEOQRIfP4Aj1i0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HA9flI9oyDGKoSHaW0SdUTOrgCpObXE0sz9aLcUpiF86S3BS5Z1kgfbPGjNr7sa/4
         VYgFyGj41rNEPGPQfZNYjyBDojMB4GvcaK+MoIw279CsP8eeuA654L+TxHBFz3b3P/
         89Mp837ai4HYo1IJG3XuFF8x1VICsWjfU47RIuds=
Date:   Sat, 13 Mar 2021 00:40:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v3 5/8] media: uvcvideo: refactor __uvc_ctrl_add_mapping
Message-ID: <YEvtzxvS7NrXyfbA@pendragon.ideasonboard.com>
References: <20210312124830.1344255-1-ribalda@chromium.org>
 <20210312124830.1344255-6-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210312124830.1344255-6-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch, and thank you for splitting it out of 6/8, it
makes review easier.

On Fri, Mar 12, 2021 at 01:48:27PM +0100, Ricardo Ribalda wrote:
> Pass the chain instead of the device. We want to keed the reference to
> the chain that controls belong to.
> 
> We need to delay the initialization of the controls after the chains
> have been initialized.
> 
> This is a cleanup needed for the next patches.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 41 ++++++++++++++++++++----------
>  drivers/media/usb/uvc/uvc_driver.c |  8 +++---
>  2 files changed, 32 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b3dde98499f4..90ecdc24d70a 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2057,7 +2057,7 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
>  /*
>   * Add a control mapping to a given control.
>   */
> -static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
> +static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
>  {
>  	struct uvc_control_mapping *map;
> @@ -2086,7 +2086,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
>  		map->set = uvc_set_le_value;
>  
>  	list_add_tail(&map->list, &ctrl->info.mappings);
> -	uvc_dbg(dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
> +	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
>  		map->name, ctrl->info.entity, ctrl->info.selector);
>  
>  	return 0;
> @@ -2168,7 +2168,7 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  		goto done;
>  	}
>  
> -	ret = __uvc_ctrl_add_mapping(dev, ctrl, mapping);
> +	ret = __uvc_ctrl_add_mapping(chain, ctrl, mapping);
>  	if (ret < 0)
>  		atomic_dec(&dev->nmappings);
>  
> @@ -2244,7 +2244,8 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
>   * Add control information and hardcoded stock control mappings to the given
>   * device.
>   */
> -static void uvc_ctrl_init_ctrl(struct uvc_device *dev, struct uvc_control *ctrl)
> +static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> +			       struct uvc_control *ctrl)
>  {
>  	const struct uvc_control_info *info = uvc_ctrls;
>  	const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
> @@ -2263,14 +2264,14 @@ static void uvc_ctrl_init_ctrl(struct uvc_device *dev, struct uvc_control *ctrl)
>  	for (; info < iend; ++info) {
>  		if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
>  		    ctrl->index == info->index) {
> -			uvc_ctrl_add_info(dev, ctrl, info);
> +			uvc_ctrl_add_info(chain->dev, ctrl, info);
>  			/*
>  			 * Retrieve control flags from the device. Ignore errors
>  			 * and work with default flag values from the uvc_ctrl
>  			 * array when the device doesn't properly implement
>  			 * GET_INFO on standard controls.
>  			 */
> -			uvc_ctrl_get_flags(dev, ctrl, &ctrl->info);
> +			uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
>  			break;
>  		 }
>  	}
> @@ -2281,22 +2282,20 @@ static void uvc_ctrl_init_ctrl(struct uvc_device *dev, struct uvc_control *ctrl)
>  	for (; mapping < mend; ++mapping) {
>  		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
>  		    ctrl->info.selector == mapping->selector)
> -			__uvc_ctrl_add_mapping(dev, ctrl, mapping);
> +			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
>  	}
>  }
>  
>  /*
>   * Initialize device controls.
>   */
> -int uvc_ctrl_init_device(struct uvc_device *dev)
> +static int uvc_ctrl_init_chain(struct uvc_video_chain *chain)
>  {
>  	struct uvc_entity *entity;
>  	unsigned int i;
>  
> -	INIT_WORK(&dev->async_ctrl.work, uvc_ctrl_status_event_work);
> -
>  	/* Walk the entities list and instantiate controls */
> -	list_for_each_entry(entity, &dev->entities, list) {
> +	list_for_each_entry(entity, &chain->entities, chain) {
>  		struct uvc_control *ctrl;
>  		unsigned int bControlSize = 0, ncontrols;
>  		u8 *bmControls = NULL;
> @@ -2316,7 +2315,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  		}
>  
>  		/* Remove bogus/blacklisted controls */
> -		uvc_ctrl_prune_entity(dev, entity);
> +		uvc_ctrl_prune_entity(chain->dev, entity);
>  
>  		/* Count supported controls and allocate the controls array */
>  		ncontrols = memweight(bmControls, bControlSize);
> @@ -2338,7 +2337,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  			ctrl->entity = entity;
>  			ctrl->index = i;
>  
> -			uvc_ctrl_init_ctrl(dev, ctrl);
> +			uvc_ctrl_init_ctrl(chain, ctrl);
>  			ctrl++;
>  		}
>  	}
> @@ -2346,6 +2345,22 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  	return 0;
>  }
>  
> +int uvc_ctrl_init_device(struct uvc_device *dev)
> +{
> +	struct uvc_video_chain *chain;
> +	int ret;
> +
> +	INIT_WORK(&dev->async_ctrl.work, uvc_ctrl_status_event_work);
> +
> +	list_for_each_entry(chain, &dev->chains, list) {
> +		ret = uvc_ctrl_init_chain(chain);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;

ret will be initialized if dev->chains is empty. This shouldn't happen,
but static analyzers may complain. I'd return 0 instead.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +}
> +
>  /*
>   * Cleanup device controls.
>   */
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 30ef2a3110f7..35873cf2773d 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2423,14 +2423,14 @@ static int uvc_probe(struct usb_interface *intf,
>  	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
>  		goto error;
>  
> -	/* Initialize controls. */
> -	if (uvc_ctrl_init_device(dev) < 0)
> -		goto error;
> -
>  	/* Scan the device for video chains. */
>  	if (uvc_scan_device(dev) < 0)
>  		goto error;
>  
> +	/* Initialize controls. */
> +	if (uvc_ctrl_init_device(dev) < 0)
> +		goto error;
> +
>  	/* Register video device nodes. */
>  	if (uvc_register_chains(dev) < 0)
>  		goto error;

-- 
Regards,

Laurent Pinchart
