Return-Path: <linux-media+bounces-12869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 461ED902519
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 17:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5A181F23AE5
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 15:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B8313F437;
	Mon, 10 Jun 2024 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MfCiaIy3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F4913D8BF;
	Mon, 10 Jun 2024 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032364; cv=none; b=hSeAkG5yp4j/FgZ45Yx7FMl+QDiz74oV/lHEWh5193IfrVjfNtS1WhjRujBlzUlCyu9F8ZpylDcV879HOumnXcoh4uOnG1WY0b5CTA2S2yejF0zMhcpUvofkvb2MpoOD7ixkItHG3JgVs2ZJZvWPWyOvH9Out+xhBxvSSz4zHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032364; c=relaxed/simple;
	bh=Y57ApLX20A/77kiC6X5p1+QDAwxyCh4m0CBGPX/KFBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMww/LjCfDMFS1eKlSrP9wqT5XnWds/1y9m7JQy0C4xcenDTp/1Twa9yxseNpYRyzqYWnlB3z+co9hH8AuuBwSQa+RIvg/9AJGTBtaNySWPjwoHru6KuK+KCrtD+vtEhQOauOwg+/Ph/Lo6qXQxikDoGsgjHDd+4KFn6wU9O7V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MfCiaIy3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3578B39F;
	Mon, 10 Jun 2024 17:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718032349;
	bh=Y57ApLX20A/77kiC6X5p1+QDAwxyCh4m0CBGPX/KFBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MfCiaIy34BeAmIWH//ozCzoqy0wiW1L4Spz09e4cvBMqNry6uHeDJXeJVV8qI6SdJ
	 Xztl/NSqsfa48wxI8ZayIjI+rQHj+C3mYw1dVNxyN4xiwYVPenmCf2jxzqG26Y315M
	 Z4jEJpgHUz111W/nh2yyjmzkVvhlatvTbiTjJx4Y=
Date: Mon, 10 Jun 2024 18:12:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] media: uvcvideo: Allow custom control mapping
Message-ID: <20240610151221.GI26663@pendragon.ideasonboard.com>
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
 <20240318-billion-v1-1-2f7bc0ee2030@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318-billion-v1-1-2f7bc0ee2030@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Mar 18, 2024 at 11:55:23PM +0000, Ricardo Ribalda wrote:
> Some advanced controls might not be completely implemented by vendors.
> 
> If the controls are a enumeration, UVC does not gives a way to probe
> what is implemented and what is not.
> 
> Lets create a new callback function where heuristics can be implemented

s/Lets/Let's/

> to detect what is implemented and what not.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 15 ++++++++--
>  drivers/media/usb/uvc/uvcvideo.h | 59 +++++++++++++++++++++-------------------
>  2 files changed, 43 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e59a463c27618..3e939b4fbaaaf 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2434,6 +2434,14 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	return -ENOMEM;
>  }
>  
> +static int __uvc_ctrl_add_custom_mapping(struct uvc_video_chain *chain,
> +	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)

The name isn't great is in most cases it doesn't add a custom mapping.

> +{
> +	if (mapping && mapping->add_mapping)
> +		return mapping->add_mapping(chain, ctrl, mapping);
> +	return __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> +}
> +
>  int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	const struct uvc_control_mapping *mapping)
>  {
> @@ -2637,7 +2645,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  
>  			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
>  			    ctrl->info.selector == mapping->selector) {
> -				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
> +				__uvc_ctrl_add_custom_mapping(chain, ctrl,
> +							      mapping);
>  				custom = true;
>  			}
>  		}
> @@ -2652,7 +2661,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  
>  		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
>  		    ctrl->info.selector == mapping->selector)
> -			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
> +			__uvc_ctrl_add_custom_mapping(chain, ctrl, mapping);
>  	}
>  
>  	/* Finally process version-specific mappings. */
> @@ -2664,7 +2673,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  
>  		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
>  		    ctrl->info.selector == mapping->selector)
> -			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
> +			__uvc_ctrl_add_custom_mapping(chain, ctrl, mapping);
>  	}
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 6fb0a78b1b009..611350a82c37f 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -101,34 +101,6 @@ struct uvc_control_info {
>  	u32 flags;
>  };
>  
> -struct uvc_control_mapping {
> -	struct list_head list;
> -	struct list_head ev_subs;
> -
> -	u32 id;
> -	char *name;
> -	u8 entity[16];
> -	u8 selector;
> -
> -	u8 size;
> -	u8 offset;
> -	enum v4l2_ctrl_type v4l2_type;
> -	u32 data_type;
> -
> -	const u32 *menu_mapping;
> -	const char (*menu_names)[UVC_MENU_NAME_LEN];
> -	unsigned long menu_mask;
> -
> -	u32 master_id;
> -	s32 master_manual;
> -	u32 slave_ids[2];
> -
> -	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
> -		   const u8 *data);
> -	void (*set)(struct uvc_control_mapping *mapping, s32 value,
> -		    u8 *data);
> -};
> -

You can leave the structure here, close to the other related structuers,
and add forward declarations of the uvc_video_chain and uvc_control
structures just before the existing forward declaration of uvc_device.

>  struct uvc_control {
>  	struct uvc_entity *entity;
>  	struct uvc_control_info info;
> @@ -336,6 +308,37 @@ struct uvc_video_chain {
>  	u8 ctrl_class_bitmap;			/* Bitmap of valid classes */
>  };
>  
> +struct uvc_control_mapping {
> +	struct list_head list;
> +	struct list_head ev_subs;
> +
> +	u32 id;
> +	char *name;
> +	u8 entity[16];
> +	u8 selector;
> +
> +	u8 size;
> +	u8 offset;
> +	enum v4l2_ctrl_type v4l2_type;
> +	u32 data_type;
> +
> +	const u32 *menu_mapping;
> +	const char (*menu_names)[UVC_MENU_NAME_LEN];
> +	unsigned long menu_mask;
> +
> +	u32 master_id;
> +	s32 master_manual;
> +	u32 slave_ids[2];
> +
> +	int (*add_mapping)(struct uvc_video_chain *chain,
> +			   struct uvc_control *ctrl,
> +			   const struct uvc_control_mapping *mapping);
> +	s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
> +		   const u8 *data);
> +	void (*set)(struct uvc_control_mapping *mapping, s32 value,
> +		    u8 *data);
> +};
> +
>  struct uvc_stats_frame {
>  	unsigned int size;		/* Number of bytes captured */
>  	unsigned int first_data;	/* Index of the first non-empty packet */
> 

-- 
Regards,

Laurent Pinchart

