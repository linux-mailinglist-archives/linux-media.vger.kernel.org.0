Return-Path: <linux-media+bounces-23725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1989F6F18
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 22:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C939A7A063B
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 21:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E7F1FCD1F;
	Wed, 18 Dec 2024 21:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xv0qTvrP"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CACB15697B
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 21:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734555612; cv=none; b=FsPTLXrwJlapaHowbaarB0dDDkWmEGLI+9dn9eiH1i4yTSpUmdAo4XpPpKLu3xPqjuHlC+rzBR+Zf71WWsU3bCDSCpBYfaR7lwAFZE1CHEhZNq3qWR57ze+1pdJLNf609UTjf23ld/vPQF7vXxZxgqWHCXjY5BArKFXboXKy3HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734555612; c=relaxed/simple;
	bh=xm+N4399mFYIHzw9eedogF9hojnXYDmuBZGGitRHAaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNR3qJMTWYeucimJekA+QjCqerP/cCv4K09gS5gTt4MY6eahh1F6KmDaYFczdglt++U7z6DYRRaArS2X04rR563Hokmj8K3abqyrucS6SgSYv4VGvXGYk2EZi7RaOGIXS9G85SKpd76Dw3SmmOl4NzfqJ/ksb5OTpggWeo7orY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xv0qTvrP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734555609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTczfp9I0Zdyk0QzGImg2ocdimCrqSL7GD6QoAN/Hjc=;
	b=Xv0qTvrPa+5orubOHesg0bsjQ2QZGSmV0BLVwLJsvKKUlW3t7kVJm7XOVSvfZVl0/rxGJt
	3Oklvza/a0m73LTuhW2zQVdasYGFuTxTiU2HYPNzQYJcprQgOfCuEvUMrfGoh55gryGgWj
	53SGqv5u2oBthpQI7qalCwKnmGINKVs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-ZRosIBrRNtSFPhhkQ5Gylw-1; Wed, 18 Dec 2024 16:00:07 -0500
X-MC-Unique: ZRosIBrRNtSFPhhkQ5Gylw-1
X-Mimecast-MFC-AGG-ID: ZRosIBrRNtSFPhhkQ5Gylw
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d40db3d084so30155a12.3
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 13:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734555607; x=1735160407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTczfp9I0Zdyk0QzGImg2ocdimCrqSL7GD6QoAN/Hjc=;
        b=WNsiNwj+WLI8WBuCG9F3CEILsysIOZj+4kLRkFpRG1d4DVIT5OSN339e8LvBfUj2En
         uuP2hoScBLAUsXQim0gUXuY1CJZ98y+qmNDo6+Z9+5LEPBcqr2yfmqgTBtBln22U2BLE
         ca+895PSuEbIxicZHK9GbJnd119xSwigG+fdMuiEZeetLZSxO7//Z/0F83dh13D1YNZD
         Fm6UcOBPvwOfpteiaBCDIcOV24wXjQCDmrDMJEHRWT/TMGoJiDYRCv6KH+EWUd3rdGJn
         PWcpzOdBsbpeRxnP/zEUuQiY7QyW8ja7uFGv77bqeDBvVs+w0av5T8JWwy4c+ZXfHOUI
         BQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCWR5TZZLU5lKbLopXzfZ1daaFTSmnTpMqS7LgYoWEY3ac+gtaxGZS0maQmR/asmSUSMRVrZioG2xRjVxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRneov0X59y3JoTXwquoPbvSdjy7DFm7HyWlql4JmV503QJ1vB
	fh23qdcpY3g0UdVjxT59r4qdc+tXn012aYeNrnPPRZSrVE27s3l0rtgDKZ3clDQf0ROueQQoTJj
	cJSMzHg8ovzkJohOjWo8OkyBN4mx96MCXY434EA186nRZfsocelHsp5Y2TAO0
X-Gm-Gg: ASbGncubq2c53cy1KdUXUXpuFaFOUPfK13lfd4OICFeMg3ObX6QyjkiozlfHI3XRMIS
	GfZarq6cmqPnqEiImxUTVhJg9nIdVkRNZDQ7p9omz0ugYyr+99uMu+MfkfX4UsRSj2zI5WNcUFa
	u001sxDuyqQVIoC8b1s7lCjcuxPyW77Lt71H1c7n6BwIWg5IpYrajEg6H0OjlBjJGcPPO98HR3I
	EBD6Reey3fOHHFaDVE+IZ6v2sY7ikaJQ52yeyLF4pXt5QXmxAPmHVpF6OcOrOSrcxTboHidDW1P
	NkpjiFGxKsYkDY8qvS2h6O4S9FdtTwVx7BYbNPdDGr1hGFxeHyVQdwAkm6devnKSiYbJ7QKEy2h
	kcbolmcBCyCKGXcgP4Ydc2qv5UrwQ+9E=
X-Received: by 2002:a05:6402:5247:b0:5d0:ed92:cdf6 with SMTP id 4fb4d7f45d1cf-5d8025cad6cmr1446042a12.19.1734555606565;
        Wed, 18 Dec 2024 13:00:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3vyM92ln2EQgU2UGGD2yJivUXgy0iY/7TliRulvplcfSy714C5xevwPc1mof+HwCGSA+bRw==
X-Received: by 2002:a05:6402:5247:b0:5d0:ed92:cdf6 with SMTP id 4fb4d7f45d1cf-5d8025cad6cmr1445979a12.19.1734555606123;
        Wed, 18 Dec 2024 13:00:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f35365sm5953561a12.80.2024.12.18.13.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 13:00:04 -0800 (PST)
Message-ID: <2d45e2b3-5aad-4eb3-86b7-2f36a0824009@redhat.com>
Date: Wed, 18 Dec 2024 22:00:03 +0100
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

Hi,

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

Thank you for the new version, this looks good to me now:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

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


