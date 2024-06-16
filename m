Return-Path: <linux-media+bounces-13335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B7F90A07D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 00:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F4371F21251
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 22:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6A16FE21;
	Sun, 16 Jun 2024 22:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z4vTfOsf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0761FE2;
	Sun, 16 Jun 2024 22:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718576280; cv=none; b=KIJJvneh/u81miuf+2JJ4NPjo8IWsmI/nYTlgPxFkAUWfXa4mp/jSF9IpzEKxL9I0OSSg6Ew0mQMZscUDZKmHON7K9HodAOob0n9acdmnbQPHlLZJ8RBgUz1YwazUVNh3olGOw492C4CJj1X508H2uiC8aau6E9h210yp7Mtx7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718576280; c=relaxed/simple;
	bh=5EYKRxyw3DYvd0M9CgxDJnnoiSC2ajqzDD48TiJhHJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQIWzjQfbOg9nPuQoxiZZMFMX26UUc9B6HRAdYk/22WXsgCE8dXid2gsNxakykgBZGNqO4AIicGKA+deIKXXZielEDphZLifDRUSsGXbGqyTQLJtZ6fdY85ilkUY+i8Lek1q7TAUcmDAy7b9OydRx7a5MKnMS6/3R+QZ/kmj8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z4vTfOsf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 982D4593;
	Mon, 17 Jun 2024 00:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718576258;
	bh=5EYKRxyw3DYvd0M9CgxDJnnoiSC2ajqzDD48TiJhHJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4vTfOsfgbeQwW4MRBwuorcH8Tc7wHWNfsrh/prX2HUGe7X/yhMDHICIYkKvA5jte
	 a+UrYhqI8lWPHlvodjJJ/dolCoWJRrF2rP5vrvygKEO8RE+3aSqYdfrhqZGvRpdE01
	 CSzD0V9mpxavvmhPoEnkGQoDQxxDFtjeXiWrJSsY=
Date: Mon, 17 Jun 2024 01:17:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] media: uvcvideo: Replace get_mapping with
 filter_mapping
Message-ID: <20240616221733.GA28126@pendragon.ideasonboard.com>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
 <20240610-billion-v2-7-38e861475f85@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610-billion-v2-7-38e861475f85@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Jun 10, 2024 at 11:09:58PM +0000, Ricardo Ribalda wrote:
> If the callback returns a mapping instead of adding it, the codeflow is
> more clean and we do not need a forward declaration of
> __uvc_ctrl_add_mapping_to_list().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

This should have been squashed in the previous patches as appropriate.
It's hard to review the new version this way.

The diff with v1 looks good, so I don't expect to have further comments.

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 40 ++++++++++++++++++----------------------
>  drivers/media/usb/uvc/uvcvideo.h |  6 +++---
>  2 files changed, 21 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 1c1710e3c486..4a13f2685d9e 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -495,11 +495,8 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
>  				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
>  };
>  
> -static int __uvc_ctrl_add_mapping_to_list(struct uvc_video_chain *chain,
> -	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping);
> -
> -static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
> -	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
> +static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping
> +		(struct uvc_video_chain *chain, struct uvc_control *ctrl)
>  {
>  	const struct uvc_control_mapping *out_mapping =
>  					&uvc_ctrl_power_line_mapping_uvc11;
> @@ -509,7 +506,7 @@ static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
>  
>  	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
>  	if (!buf)
> -		return -ENOMEM;
> +		return NULL;
>  
>  	/* Save the default PLF value, so we can restore it. */
>  	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
> @@ -517,7 +514,7 @@ static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
>  			     buf, sizeof(*buf));
>  	/* If we cannot read the control skip it. */
>  	if (ret)
> -		return ret;
> +		return NULL;
>  	init_val = *buf;
>  
>  	/* If PLF value cannot be set to off, it is limited. */
> @@ -526,8 +523,7 @@ static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
>  			     chain->dev->intfnum, ctrl->info.selector,
>  			     buf, sizeof(*buf));
>  	if (ret)
> -		return __uvc_ctrl_add_mapping_to_list(chain, ctrl,
> -					&uvc_ctrl_power_line_mapping_limited);
> +		return &uvc_ctrl_power_line_mapping_limited;
>  
>  	/* UVC 1.1 does not define auto, we can exit. */
>  	if (chain->dev->uvc_version < 0x150)
> @@ -548,7 +544,7 @@ static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
>  		       chain->dev->intfnum, ctrl->info.selector,
>  		       buf, sizeof(*buf));
>  
> -	return __uvc_ctrl_add_mapping_to_list(chain, ctrl, out_mapping);
> +	return out_mapping;
>  }
>  
>  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> @@ -843,7 +839,7 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	{
>  		.entity		= UVC_GUID_UVC_PROCESSING,
>  		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> -		.add_mapping	= uvc_ctrl_add_plf_mapping,
> +		.filter_mapping	= uvc_ctrl_filter_plf_mapping,
>  	},
>  };
>  
> @@ -2411,8 +2407,9 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
>  /*
>   * Add a control mapping to a given control.
>   */
> -static int __uvc_ctrl_add_mapping_to_list(struct uvc_video_chain *chain,
> -	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
> +static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> +				  struct uvc_control *ctrl,
> +				  const struct uvc_control_mapping *mapping)
>  {
>  	struct uvc_control_mapping *map;
>  	unsigned int size;
> @@ -2485,14 +2482,6 @@ static int __uvc_ctrl_add_mapping_to_list(struct uvc_video_chain *chain,
>  	return -ENOMEM;
>  }
>  
> -static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> -	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
> -{
> -	if (mapping && mapping->add_mapping)
> -		return mapping->add_mapping(chain, ctrl, mapping);
> -	return __uvc_ctrl_add_mapping_to_list(chain, ctrl, mapping);
> -}
> -
>  int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	const struct uvc_control_mapping *mapping)
>  {
> @@ -2681,7 +2670,14 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  
>  	/* Process common mappings. */
>  	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
> -		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
> +		const struct uvc_control_mapping *mapping = NULL;
> +
> +		/* Try to get a custom mapping from the device. */
> +		if (uvc_ctrl_mappings[i].filter_mapping)
> +			mapping = uvc_ctrl_mappings[i].filter_mapping(chain,
> +								      ctrl);
> +		if (!mapping)
> +			mapping = &uvc_ctrl_mappings[i];
>  
>  		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
>  		    ctrl->info.selector == mapping->selector)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index ff9545dcf716..a9547795fe22 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -125,9 +125,9 @@ struct uvc_control_mapping {
>  	s32 master_manual;
>  	u32 slave_ids[2];
>  
> -	int (*add_mapping)(struct uvc_video_chain *chain,
> -			   struct uvc_control *ctrl,
> -			   const struct uvc_control_mapping *mapping);
> +	const struct uvc_control_mapping *(*filter_mapping)
> +				(struct uvc_video_chain *chain,
> +				struct uvc_control *ctrl);
>  	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
>  		   const u8 *data);
>  	void (*set)(struct uvc_control_mapping *mapping, s32 value,
> 

-- 
Regards,

Laurent Pinchart

