Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20FE1340036
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 08:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbhCRHYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 03:24:08 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:48769 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229803AbhCRHYD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 03:24:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Mn0glHf7RDUxpMn0jlhyS0; Thu, 18 Mar 2021 08:24:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616052241; bh=deuUQU78hwcxkDF8i9lvlwSPAnhnrqcqvlsxydh6vw0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qjWC5C7JwQCG+FZOAL/J8pAROAMB1dE5MRHGiJwlwIVjFadV1LwtVpQI4uTSh+FUA
         c7xoEDOi6t2h8EDvmHy6c5s4aaQkou9sSIvWtmvDnqW3RRXIOxfg3LXOpSnver3efs
         73+IjJdw9xjNzwLVUIgxyAOliLdNWMO+Cm2bphu5V2+pcAEpZsdkKmhTi+mPCBjbE/
         qYWgFI1/dD/3ddmNDGm+dDbJKH9FJe1VgAHtPQ6thXHRGKMybaQncNOQe1uEg4c9cc
         ovIgHjoPqnqSO1i8N4E/8f7QPSvw1/mR7LfvtMhFd+1mYcJwTzD3slo1kVa5W2GLUp
         o7z+qgF3LjXSA==
Subject: Re: [PATCH v6 09/17] media: uvcvideo: refactor __uvc_ctrl_add_mapping
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210317164511.39967-1-ribalda@chromium.org>
 <20210317164511.39967-10-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ea946fbd-712b-717a-15c7-84a22816d051@xs4all.nl>
Date:   Thu, 18 Mar 2021 08:23:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317164511.39967-10-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfP7GNOQrueMSsK8pHIgg11LweBLFzckYnmjel4qTYYtOi+/jKZ0okzL+y16S4rAqnDlAC1L38ilwSiqm1zwX0P1IEuMMdfelhn9n5S0G/lWaGgI/VlNS
 QSkOFsFRsOAzzpTEHwAXHhFLNSpII96dMG0QwD4hDJsGwf4l6WE9rqxjNnhLND6BRyVYY1BWetXWloACNqcC0H1cI18iXjoTeVN74m6jj1MeCw32x3+I2lvu
 CK32zBehTSK3uGfnWvWd6jGahQ6twtDkxkM/eT8zhyR5x1CzEWXcL6AKx5FEP/MFsyxAd5vnV1XtUEwKgQzIjTYun9dlwm6wgtYqpQWXmJthR276rIyI4Fgc
 +xC4ZYdo2R2k7x5BM1kro7qWqqUk1glCe3fZz9NVwnm4yrQr/i4rdM4n1os82XfY7nA1Rc12
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2021 17:45, Ricardo Ribalda wrote:
> Pass the chain instead of the device. We want to keed the reference to

keed -> keep

With that typo fixed you can add my:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> the chain that controls belong to.
> 
> We need to delay the initialization of the controls after the chains
> have been initialized.
> 
> This is a cleanup needed for the next patches.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 41 ++++++++++++++++++++----------
>  drivers/media/usb/uvc/uvc_driver.c |  8 +++---
>  2 files changed, 32 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b3dde98499f4..b75da65115ef 100644
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
> +	return 0;
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
> 

