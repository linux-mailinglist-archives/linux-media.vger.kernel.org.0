Return-Path: <linux-media+bounces-23726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE32C9F6F2B
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 22:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9855B18918EA
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 21:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0011FCF60;
	Wed, 18 Dec 2024 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JjH2d2TG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE26154BE2
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734555763; cv=none; b=meI22v0ewAcO79wwePr5BJosTZhPGNS5CbWV0bm8PLpZZsp9wVdkFxVRJ0IRlGVV0r4fodSz894vXxpWsg3qM0rzA3t+gztJQy7HPFy8raA73wutDDGtD1F5TxzKCENrUn/a+/2CTAYSWPeCveQ4SdaILe3PAimM9XnY9v1kATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734555763; c=relaxed/simple;
	bh=CpMwj9TMpIFn7KyKM9x7JmJAbkRDzhQFpE6B55UMyEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KsNLnl13Z/Lm5iHackwC0IFPmxyb5tAbGHNtvx55kCcKLLOfO/R6hfmpeS8Mv9G7Z9BrGHspaXQfvSi+bXC7isn8qW4lOCmh9/ui35FxbIK8At1g80fqSGGZE5F4KqFMpuYkEB4ojI8aBoC8+sBzwWkOmkRSXHf2c6QizHSR1ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JjH2d2TG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734555761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KurRWUwQUwzBDr/KoRRtoTl5MY1mFC93K7J+MA0MFuE=;
	b=JjH2d2TGMbfHs7k97mo8EJHcxHjhWueQJk6UAvq6DSJN25VT10LbM4kiBxyPOZTV0nPYP2
	KngOFg3zAoFvW7HEBS0VkrFCqz6V/z7Qdmi9LDX6hayvgd4mlfha5ub3OoWBOrp7pTsghC
	g5xykOMvdnTM6TlhasPRlscjs2sQelo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-D_fqcw7vN8umGbB39LcBHg-1; Wed, 18 Dec 2024 16:02:38 -0500
X-MC-Unique: D_fqcw7vN8umGbB39LcBHg-1
X-Mimecast-MFC-AGG-ID: D_fqcw7vN8umGbB39LcBHg
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d3bf8874dbso72183a12.2
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 13:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734555757; x=1735160557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KurRWUwQUwzBDr/KoRRtoTl5MY1mFC93K7J+MA0MFuE=;
        b=vWdXy5pU/Pt9QIBppvv72gI8YgInKoGL3xSkjUpkExTEEX86wZC1qc+99gpemEMDNo
         IS/vE3hzM7zOEmGnyatGWMULxNMP+msT8JBx5tL7vQkuFRfXGHOEN7MvbzcQ2ZZyS1TS
         8p2bZY9hx3DISOOaofWfXWiUAR7g3Ak+aC8HV1nq8N7RWz1yrzoDJwhA77h7xgZc/5eL
         ln9mBNDM6taPAkAeLpiJerDEe0lMvguB5rJ7l7XJhRty1zHBwqhjT+71KtPeiHzgtcZO
         I0obyGWO1eTDcobyyUWSE/OI5MEA60Wy+u/K2xKd3rWDs+2LIDbQo2yfi2sP9eqUssIN
         OkLg==
X-Forwarded-Encrypted: i=1; AJvYcCVwzZV0UKNZgcoxsvMheinynM8gnjgGHitYMSldzgSO5Ko6sL9x5J1eZdkyYoUERU+EdCg1fr1rCQZ2KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUiPvl6+Ad6l/UbbvHLi4/4Iox7JxBc8maXysZG5ICy6EYd5ri
	KcDOvp0FDSgdtR49d1gLcs583+nY7CQmZun6ZV1fPABfUPCXKUDaPD3Lt5MdVWjf5W1g2N79XO8
	RC8P9+zvUnx2jpzdUTwqyyzKFIyWYEpdglhuN8S/BJNPVmG2dZn5lKkLz7GeX
X-Gm-Gg: ASbGncu3hBObUnJlslKGYaZZChWZIXZ/Mfx1kfHqzY8pAALgSpYp1l74Ee2QWOvjxY+
	RBobCeQvIVbnWbMNaQJnPt+4pP/e9VwSt9oRT38ehyeOCqD6N1mlUVWh6FintrOrrk7NLHWzcJp
	ffgfwxHnIAFbNeGHqLK/mkYhGGTztwljwfmL2ZenBfdgj1I8yAv2Ji8vaik3N0hyVlXyYMb9fm1
	kqUY6wxfyGdMxIckcTzEByFBtB3NypxJcxhw0R8/jY4CcZHCpHA+j+fO7DhguK0ZbNOkqPjVRlF
	h6brIRhaQKCpGXvH+2WS19mHxZ/Sazyd+LGQJr1Ke5GY6HabOFwY4DwoiY6QWj1Ds+eUhz7/xek
	vozxyn66m9mZPKKKeh9ZR/6GCW3mH8kM=
X-Received: by 2002:a05:6402:238c:b0:5d0:e570:508d with SMTP id 4fb4d7f45d1cf-5d7ee3d5b4fmr2914674a12.17.1734555757203;
        Wed, 18 Dec 2024 13:02:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmOGdbjW9C0BYh6GDxyBcm15TfL8ntaSZ0y+kHAn7ezLEpIFRmsauQ/njfasKhmYz4mB2Fdg==
X-Received: by 2002:a05:6402:238c:b0:5d0:e570:508d with SMTP id 4fb4d7f45d1cf-5d7ee3d5b4fmr2914658a12.17.1734555756798;
        Wed, 18 Dec 2024 13:02:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae128fsm5680863a12.46.2024.12.18.13.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 13:02:35 -0800 (PST)
Message-ID: <9837f93e-cc45-4927-b1bf-e3351400e699@redhat.com>
Date: Wed, 18 Dec 2024 22:02:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 17/18] media: uvcvideo: implement UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
 <20241210-uvc-roi-v16-17-e8201f7e8e57@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241210-uvc-roi-v16-17-e8201f7e8e57@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

p.s.

On 10-Dec-24 10:42 AM, Ricardo Ribalda wrote:
> From: Yunke Cao <yunkec@google.com>
> 
> Implement support for ROI as described in UVC 1.5:
> 4.2.2.1.20 Digital Region of Interest (ROI) Control
> 
> ROI control is implemented using V4L2 control API as
> two UVC-specific controls:
> V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> Reviewed-by: Yunke Cao <yunkec@google.com>
> Tested-by: Yunke Cao <yunkec@google.com>

I just noticed this is missing a:

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Ricardo, I assume it is ok if we add that while merging
this series?

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
>  include/uapi/linux/usb/video.h     |  1 +
>  include/uapi/linux/uvcvideo.h      | 13 ++++++
>  include/uapi/linux/v4l2-controls.h |  7 ++++
>  5 files changed, 109 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index dd6129becf58..86ea24b10b54 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -358,6 +358,24 @@ static const struct uvc_control_info uvc_ctrls[] = {
>  		.flags		= UVC_CTRL_FLAG_GET_CUR
>  				| UVC_CTRL_FLAG_AUTO_UPDATE,
>  	},
> +	/*
> +	 * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get updated
> +	 * by sensors.
> +	 * "This RoI should be the same as specified in most recent SET_CUR
> +	 * except in the case where the ‘Auto Detect and Track’ and/or
> +	 * ‘Image Stabilization’ bit have been set."
> +	 * 4.2.2.1.20 Digital Region of Interest (ROI) Control
> +	 */
> +	{
> +		.entity		= UVC_GUID_UVC_CAMERA,
> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
> +		.index		= 21,
> +		.size		= 10,
> +		.flags		= UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_CUR
> +				| UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_DEF
> +				| UVC_CTRL_FLAG_AUTO_UPDATE,
> +	},
>  };
>  
>  static const u32 uvc_control_classes[] = {
> @@ -603,6 +621,44 @@ static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping(
>  	return out_mapping;
>  }
>  
> +static int uvc_get_rect(struct uvc_control_mapping *mapping, u8 query,
> +			const void *uvc_in, size_t v4l2_size, void *v4l2_out)
> +{
> +	const struct uvc_rect *uvc_rect = uvc_in;
> +	struct v4l2_rect *v4l2_rect = v4l2_out;
> +
> +	if (WARN_ON(v4l2_size != sizeof(struct v4l2_rect)))
> +		return -EINVAL;
> +
> +	if (uvc_rect->left > uvc_rect->right ||
> +	    uvc_rect->top > uvc_rect->bottom)
> +		return -EIO;
> +
> +	v4l2_rect->top = uvc_rect->top;
> +	v4l2_rect->left = uvc_rect->left;
> +	v4l2_rect->height = uvc_rect->bottom - uvc_rect->top + 1;
> +	v4l2_rect->width = uvc_rect->right - uvc_rect->left + 1;
> +
> +	return 0;
> +}
> +
> +static int uvc_set_rect(struct uvc_control_mapping *mapping, size_t v4l2_size,
> +			const void *v4l2_in, void *uvc_out)
> +{
> +	struct uvc_rect *uvc_rect = uvc_out;
> +	const struct v4l2_rect *v4l2_rect = v4l2_in;
> +
> +	if (WARN_ON(v4l2_size != sizeof(struct v4l2_rect)))
> +		return -EINVAL;
> +
> +	uvc_rect->top = min(0xffff, v4l2_rect->top);
> +	uvc_rect->left = min(0xffff, v4l2_rect->left);
> +	uvc_rect->bottom = min(0xffff, v4l2_rect->top + v4l2_rect->height - 1);
> +	uvc_rect->right = min(0xffff, v4l2_rect->left + v4l2_rect->width - 1);
> +
> +	return 0;
> +}
> +
>  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	{
>  		.id		= V4L2_CID_BRIGHTNESS,
> @@ -897,6 +953,28 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
>  		.filter_mapping	= uvc_ctrl_filter_plf_mapping,
>  	},
> +	{
> +		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
> +		.entity		= UVC_GUID_UVC_CAMERA,
> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
> +		.size		= sizeof(struct uvc_rect) * 8,
> +		.offset		= 0,
> +		.v4l2_type	= V4L2_CTRL_TYPE_RECT,
> +		.data_type	= UVC_CTRL_DATA_TYPE_RECT,
> +		.get		= uvc_get_rect,
> +		.set		= uvc_set_rect,
> +		.name		= "Region Of Interest Rectangle",
> +	},
> +	{
> +		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> +		.entity		= UVC_GUID_UVC_CAMERA,
> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
> +		.size		= 16,
> +		.offset		= 64,
> +		.v4l2_type	= V4L2_CTRL_TYPE_BITMASK,
> +		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
> +		.name		= "Region Of Interest Auto Controls",
> +	},
>  };
>  
>  /* ------------------------------------------------------------------------
> @@ -1473,6 +1551,9 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
>  
>  static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mapping)
>  {
> +	if (mapping->v4l2_type == V4L2_CTRL_TYPE_RECT)
> +		return sizeof(struct v4l2_rect);
> +
>  	if (uvc_ctrl_mapping_is_compound(mapping))
>  		return DIV_ROUND_UP(mapping->size, 8);
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 8aca1a2fe587..17b79108599f 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -538,6 +538,13 @@ struct uvc_device_info {
>  	u16	uvc_version;
>  };
>  
> +struct uvc_rect {
> +	u16 top;
> +	u16 left;
> +	u16 bottom;
> +	u16 right;
> +} __packed;
> +
>  struct uvc_status_streaming {
>  	u8	button;
>  } __packed;
> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> index 2ff0e8a3a683..2afb4420e6c4 100644
> --- a/include/uapi/linux/usb/video.h
> +++ b/include/uapi/linux/usb/video.h
> @@ -104,6 +104,7 @@
>  #define UVC_CT_ROLL_ABSOLUTE_CONTROL			0x0f
>  #define UVC_CT_ROLL_RELATIVE_CONTROL			0x10
>  #define UVC_CT_PRIVACY_CONTROL				0x11
> +#define UVC_CT_REGION_OF_INTEREST_CONTROL		0x14
>  
>  /* A.9.5. Processing Unit Control Selectors */
>  #define UVC_PU_CONTROL_UNDEFINED			0x00
> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
> index f86185456dc5..cbe15bca9569 100644
> --- a/include/uapi/linux/uvcvideo.h
> +++ b/include/uapi/linux/uvcvideo.h
> @@ -16,6 +16,7 @@
>  #define UVC_CTRL_DATA_TYPE_BOOLEAN	3
>  #define UVC_CTRL_DATA_TYPE_ENUM		4
>  #define UVC_CTRL_DATA_TYPE_BITMASK	5
> +#define UVC_CTRL_DATA_TYPE_RECT		6
>  
>  /* Control flags */
>  #define UVC_CTRL_FLAG_SET_CUR		(1 << 0)
> @@ -38,6 +39,18 @@
>  
>  #define UVC_MENU_NAME_LEN 32
>  
> +/* V4L2 driver-specific controls */
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT	(V4L2_CID_USER_UVC_BASE + 1)
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO	(V4L2_CID_USER_UVC_BASE + 2)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE		(1 << 0)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK	(1 << 5)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION	(1 << 6)
> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY		(1 << 7)
> +
>  struct uvc_menu_info {
>  	__u32 value;
>  	__u8 name[UVC_MENU_NAME_LEN];
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 974fd254e573..72e32814ea83 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -215,6 +215,13 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_THP7312_BASE		(V4L2_CID_USER_BASE + 0x11c0)
>  
> +/*
> + * The base for the uvc driver controls.
> + * See linux/uvcvideo.h for the list of controls.
> + * We reserve 64 controls for this driver.
> + */
> +#define V4L2_CID_USER_UVC_BASE			(V4L2_CID_USER_BASE + 0x11e0)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
> 


