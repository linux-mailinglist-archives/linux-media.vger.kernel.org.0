Return-Path: <linux-media+bounces-22935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D329E98A3
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5749165FF8
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95211B0421;
	Mon,  9 Dec 2024 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y/1rUFLF"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8932C1A2397
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754153; cv=none; b=ZMJns080EOig9U9JF4XL3WvL0uKChF8LxUjhiHv5j4eolqg2rjrDcFBzhz1epH4+dR140JNq9zOLpPLt3EbrZuxXHVhyPirzrl2A01zXV15blh8mVqx24eIYhBiuhK9I2gxJBy+wzhscb0L6eu8wpGwOSjOy6us2leB3kkeRNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754153; c=relaxed/simple;
	bh=z8i9JE/M2TpoKuzzzLL3ggeMCS3mz6tVCMuopnJHmX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tM1kIFlD2my+OBec7YDP2TsDWSneHSi4NRrfSEv6Ydvq81z3oheRY1NaCdRmTGI7PmoiwDz2HL3GEpbliZZ6y54r1PDslg+KUcrWhndAEwDyWc3SOD1OOtHQ1zM21Lz9bg6Z3qdSJ37jhHrwdqpgetCSZ5a8yhtAfGTeLnFi0gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y/1rUFLF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733754149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e3gNPOLaU3HR9EicQ6QEcIww4JThxb2rt188WRNqvSk=;
	b=Y/1rUFLFuT1tzddWoMUHfg0h33bsnIPUDOYooae8rmIiqL9JRUg+8MLGUM+AhXayJTKeHc
	4+Lsq2o1UUdXvw+XtyymD2r0ghrjb8dSFQa9T4eSehCnO9MZQIWrqr7JmxTobiVzU1+zYC
	IIaZGdjMfwwQAKp8fA+3AzPvodGp1Gs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-YwdUvxOaNkCDCrM7rLlBnA-1; Mon, 09 Dec 2024 09:22:28 -0500
X-MC-Unique: YwdUvxOaNkCDCrM7rLlBnA-1
X-Mimecast-MFC-AGG-ID: YwdUvxOaNkCDCrM7rLlBnA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa676465b44so147101866b.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:22:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754147; x=1734358947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3gNPOLaU3HR9EicQ6QEcIww4JThxb2rt188WRNqvSk=;
        b=DccKiWNfegA0GI02p3WlHxr8VPHwl/NR+Wt6B60JdTYjy51RGx5Vt62Tzg8a44qzue
         fq9gw+0dEWIG83dnLa2gY5UnSq6hMYogYyWwcn8ebK4J1YI0tSjc3cv4jgNgGN8IooUZ
         s9U7+QWJrDb/r6OpJGwviYSh6Xu3P/xOYAe80hFs3d13YnBldbI7bXYxHV/SrpoYHAQQ
         srws5gefO+0WLNi+bJe7xhJvcWpdLN9FbOH7DP9v/b29qTGbq1UqE2k/RONwdwK5p9cH
         YmvYfkECUnUr1zMN6AKKdLDZqrDqISVoJrZ755xCtGtTpqacC2vf34GRqOg49vGO2mC7
         q5CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBwG2eUcV3sWkp+WmpJBTgYrTX+ZhmLRI+02r7jcQCXZp66FHVDIyjAbZQi0n+M2Q8qIkeWOEqdNba8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6b2yk1GsCP9J66llhEPbtWHBqibOFZg9i3SZ7euJGLn2b/jt3
	G1qOE/F9x2iwxKePj+WfkzDh2+umShUWOoYZlrHqPAWIYr9V1qOFkR2CXEHH+XLByfst+Aw4WGI
	8If6xYWMykPVppUJITNDjWiHEppQkCPQXbvv1qHNPqkIduCm9ZWtwIEyuLN6Y
X-Gm-Gg: ASbGncty4eT/prSwjB3Ob42/kCKT7GpXZtoJ6FUt8eUzF1i7zUtZTod89I1tMhBslLh
	zqE9d9JzBnUS5aWHqyUagj31RvpoqYmXJCoZsJ0lUIyPMRmSO2m7aKe6CPWhFFPsaqAJ+YiFTau
	lmV3dn5YVzNfaPNEr8+ynKDpPfc+OHJMIVVul9jI5JUxTCPDtY//HXir0tvuEPqwUKs9UOH+WwP
	3kJ2qLiAAEHsiOW2WvUq1GrOy2/pGVqHIzHRphdmcHBYgspI4nGRQ==
X-Received: by 2002:a17:907:784e:b0:aa6:3de7:f25b with SMTP id a640c23a62f3a-aa69cd5baf3mr63552466b.27.1733754146961;
        Mon, 09 Dec 2024 06:22:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfLIzH8P8QC6jIiE6M0pZhPY3N2JInnjTPvTLGiLONNa409y5MOkeiI9bUlAeRTGE3T8Wsbg==
X-Received: by 2002:a17:907:784e:b0:aa6:3de7:f25b with SMTP id a640c23a62f3a-aa69cd5baf3mr63549666b.27.1733754146546;
        Mon, 09 Dec 2024 06:22:26 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3c2b0137asm4882560a12.4.2024.12.09.06.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:22:26 -0800 (PST)
Message-ID: <2e90c10a-71fe-4e80-9ac3-80393bc8b266@redhat.com>
Date: Mon, 9 Dec 2024 15:22:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
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
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
>  include/uapi/linux/usb/video.h     |  1 +
>  include/uapi/linux/uvcvideo.h      | 13 ++++++
>  include/uapi/linux/v4l2-controls.h |  9 +++++
>  5 files changed, 111 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index f262e05ad3a8..5b619ef40dd3 100644
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
> +	uvc_rect->top = max(0xffff, v4l2_rect->top);
> +	uvc_rect->left = max(0xffff, v4l2_rect->left);
> +	uvc_rect->bottom = max(0xffff, v4l2_rect->height + v4l2_rect->top - 1);
> +	uvc_rect->right = max(0xffff, v4l2_rect->width + v4l2_rect->left - 1);

As already remarked all 4 lines should be min() not max()

Also this might just be me, but I have a preference for writing top + height
for the bottom rather then writing height + top, since the window starts with
skippig top pixels and then has height pixels filled in. And same for
calculating rect->width. IOW I have a preference for writing this as:

	uvc_rect->bottom = min(0xffff, v4l2_rect->top + v4l2_rect->height - 1);
	uvc_rect->right = min(0xffff, v4l2_rect->left + v4l2_rect->width - 1);

As I said this might just be me, but to me the above reads more naturally.




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
> @@ -1465,6 +1543,9 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
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
> index 8aca1a2fe587..d910a5e5b514 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -294,6 +294,13 @@ struct uvc_streaming_header {
>  	u8 bTriggerUsage;
>  };
>  
> +struct uvc_rect {
> +	u16 top;
> +	u16 left;
> +	u16 bottom;
> +	u16 right;
> +} __packed;
> +

This should probably be grouped togather with uvc_status_* structs which are
also marked __packed because they represent hw API rather then just host
in memory structures.

>  enum uvc_buffer_state {
>  	UVC_BUF_STATE_IDLE	= 0,
>  	UVC_BUF_STATE_QUEUED	= 1,
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

Hmm, shoudn't these be standardized. At least the ROI rect control seems like
something which could be standardized ?

Was using driver specific CIDs for this discussed with Hans Verkuil ?

>  struct uvc_menu_info {
>  	__u32 value;
>  	__u8 name[UVC_MENU_NAME_LEN];
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 974fd254e573..6c91d6fa4708 100644
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
> @@ -1089,6 +1096,8 @@ enum v4l2_auto_focus_range {
>  
>  #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
>  
> +/* CAMERA-class private control IDs */
> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> 


Regards,

Hans



