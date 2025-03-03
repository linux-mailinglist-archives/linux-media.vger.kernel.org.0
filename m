Return-Path: <linux-media+bounces-27331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF3EA4C2B3
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E452616266F
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 14:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D96B2135C5;
	Mon,  3 Mar 2025 14:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eXo6ZpCB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0696520FAB5
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741010577; cv=none; b=FQuceEQD84wKSQ5eAyd9GYI1VGJfIPEIgXjHqEUN6gQ8KLLZr7D8hCSSqY0jt1ARYuPM6EVH/zM1WPxvsh6b+RTj8RFfEXWy0YVDG587Dk4DLKtLEmTR1zWZ32RRID7Ubw+2Tjll7hyf3LU9/HXMaoQ8mG1gwQuo0lJ28TWhOww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741010577; c=relaxed/simple;
	bh=8bsnmvfAjGVIH7jOIPIvwYWB4Jv48r1mXeOXEvLWalA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nIkzx1/KZpy5RKP5y/Xz3FsVYTukESaMWgg6bW1fZzd8oa1+n1Y/hm6AMlmZQIe1/MKk/DL6szaL1QtcSnVVCwZKER7Tt2SIwnhk1h1PdjtSFACebiMIBCWXIt+emE2HGMQUQHa3SsCKWCXV2R4C6Z1igFlrM+ImklnQBbnnE9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eXo6ZpCB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741010574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJf4/zflZHu3IQNiMQ3lCM++w7NvTFqB4KzbfcfdNWc=;
	b=eXo6ZpCBdM4wTCNjto6X6xqZ6s7GlLmHcHgtaibm23n0rrJnVRsvOcnIW0cWb4FqpJvQoL
	pmZqEPXEW0nNlFzNDrV2CX4xoBoINJLQUQqdQtx7iX7+DlD2VVTfjY9lfD5UQDdtUm/IXk
	ef+DSgHSI5YbP9oilFv31yvAksDxI7E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-Zwls1MDbM_eIdSp71XzbeA-1; Mon, 03 Mar 2025 09:02:53 -0500
X-MC-Unique: Zwls1MDbM_eIdSp71XzbeA-1
X-Mimecast-MFC-AGG-ID: Zwls1MDbM_eIdSp71XzbeA_1741010572
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e041305a29so5126184a12.2
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 06:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741010571; x=1741615371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJf4/zflZHu3IQNiMQ3lCM++w7NvTFqB4KzbfcfdNWc=;
        b=Cv3tipVi7tF4DQ0NWC6gfZfGXo32C7rKfiH5aKPIPqRxrJZaSLoO88+f8xTlq+1FeN
         kSwTMkjI+x5W6AL5c0tg8odroBWMO4oBCnAIoGaYzj28xSI41GeysQE4/2gmqUCqfCQe
         rl/lbOufDkrwLJcpayJE8jTc7XBHYNXvg9Ug2D5NZ6JBeqvTURjrOO6XpbAafMvSyfeJ
         Du8erDyb0jBtpHNLjjl1BfDzZlO+OWuVZXmAJjUH2eSuscqJYkeTJVwBs2SEJhKv33mH
         OEsO/+NfhTmVNnaoGea+QBxjBZfRWiN17psUt+3geWziyFOaDo/ZP25DOKyayPvESimo
         yk1w==
X-Forwarded-Encrypted: i=1; AJvYcCUb1Ke3b+PRPLMCz+vFZ9bP92IK2H1PD0cPDKVAJZS+sE2RjStwBLaoMerFacV5lmCuUfm1h6IwkYyJFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT7PALrDedh7mvZUuxGiir6uh8KmnSb6uPzZdLkBo5Zk5oHHfy
	ak2OSQv48991jHCbdMO4mkXOAixaOo6waLDOEOYKF1VoLyzpXBr1z8QQUS0pn0K+VCYP2tbjZKj
	f6vj5Jyhklepl7rf6wt3dYBmt0CHvwFILELSyckuImEemY6jO72Ad7mY63f0wm+i3mYN0
X-Gm-Gg: ASbGnctADtjpJc6mYLz+S1OTIXvqcqGtJ96gmnlHgEI8j4teB2V7PH3mJSVLw57EqQA
	sfzLiS4p5LpYm2hRdS2pV77uF5Gs0fHuMkG8CX8iMoFnRGrvB0Pf7Fgs1+1bL34RtIJ7r6pb1Hj
	1qHuVIGBFXuVt2YrIvCgpd9r0KAk35pEFzmfKxeu3PYD0fXTUEQ0Nu4J6xWeA3RQIKmbxjibpLj
	D8gXzcdk03vDesghkaMoZtL6gefjoNfhzQ1J2oSn6hCdLaP17JxYhBDY/krOz1bZTtQUYGQhwkB
	VNNhJTGwJXhvNqXVVCw=
X-Received: by 2002:a50:cc0c:0:b0:5e4:d75a:573e with SMTP id 4fb4d7f45d1cf-5e4d75a57fcmr11163818a12.32.1741010571397;
        Mon, 03 Mar 2025 06:02:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZex1kQMieQKb+N4I4vdhl4budP4Re7r9POsYiHbgSvRvwVYw9B/430caOfAXmTSRcCnWdow==
X-Received: by 2002:a50:cc0c:0:b0:5e4:d75a:573e with SMTP id 4fb4d7f45d1cf-5e4d75a57fcmr11163779a12.32.1741010570844;
        Mon, 03 Mar 2025 06:02:50 -0800 (PST)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4aa13sm6798255a12.7.2025.03.03.06.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 06:02:50 -0800 (PST)
Message-ID: <5d229e8e-f4b9-4589-a978-e80848678e38@redhat.com>
Date: Mon, 3 Mar 2025 15:02:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 16/17] media: uvcvideo: implement UVC v1.5 ROI
To: Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
 <ribalda@chromium.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
 <20250203-uvc-roi-v17-16-5900a9fed613@chromium.org>
 <6944a221-b0b4-4042-9d4a-98a0cc806116@xs4all.nl>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6944a221-b0b4-4042-9d4a-98a0cc806116@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3-Mar-25 14:32, Hans Verkuil wrote:
> Hans, Laurent, Yunke,
> 
> On 03/02/2025 12:55, Ricardo Ribalda wrote:
>> From: Yunke Cao <yunkec@google.com>
>>
>> Implement support for ROI as described in UVC 1.5:
>> 4.2.2.1.20 Digital Region of Interest (ROI) Control
>>
>> ROI control is implemented using V4L2 control API as
>> two UVC-specific controls:
>> V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
>> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
>>
>> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>> Signed-off-by: Yunke Cao <yunkec@google.com>
>> Reviewed-by: Yunke Cao <yunkec@google.com>
>> Tested-by: Yunke Cao <yunkec@google.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++++++++++++
>>  drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
>>  include/uapi/linux/usb/video.h     |  1 +
>>  include/uapi/linux/uvcvideo.h      | 13 ++++++
>>  include/uapi/linux/v4l2-controls.h |  7 ++++
>>  5 files changed, 109 insertions(+)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>> index 17a7ce525f71..1906ce5b7d50 100644
>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>> @@ -358,6 +358,24 @@ static const struct uvc_control_info uvc_ctrls[] = {
>>  		.flags		= UVC_CTRL_FLAG_GET_CUR
>>  				| UVC_CTRL_FLAG_AUTO_UPDATE,
>>  	},
>> +	/*
>> +	 * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get updated
>> +	 * by sensors.
>> +	 * "This RoI should be the same as specified in most recent SET_CUR
>> +	 * except in the case where the ‘Auto Detect and Track’ and/or
>> +	 * ‘Image Stabilization’ bit have been set."
>> +	 * 4.2.2.1.20 Digital Region of Interest (ROI) Control
>> +	 */
>> +	{
>> +		.entity		= UVC_GUID_UVC_CAMERA,
>> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
>> +		.index		= 21,
>> +		.size		= 10,
>> +		.flags		= UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_CUR
>> +				| UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
>> +				| UVC_CTRL_FLAG_GET_DEF
>> +				| UVC_CTRL_FLAG_AUTO_UPDATE,
>> +	},
>>  };
>>  
>>  static const u32 uvc_control_classes[] = {
>> @@ -603,6 +621,44 @@ static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping(
>>  	return out_mapping;
>>  }
>>  
>> +static int uvc_get_rect(struct uvc_control_mapping *mapping, u8 query,
>> +			const void *uvc_in, size_t v4l2_size, void *v4l2_out)
>> +{
>> +	const struct uvc_rect *uvc_rect = uvc_in;
>> +	struct v4l2_rect *v4l2_rect = v4l2_out;
>> +
>> +	if (WARN_ON(v4l2_size != sizeof(struct v4l2_rect)))
>> +		return -EINVAL;
>> +
>> +	if (uvc_rect->left > uvc_rect->right ||
>> +	    uvc_rect->top > uvc_rect->bottom)
>> +		return -EIO;
>> +
>> +	v4l2_rect->top = uvc_rect->top;
>> +	v4l2_rect->left = uvc_rect->left;
>> +	v4l2_rect->height = uvc_rect->bottom - uvc_rect->top + 1;
>> +	v4l2_rect->width = uvc_rect->right - uvc_rect->left + 1;
>> +
>> +	return 0;
>> +}
>> +
>> +static int uvc_set_rect(struct uvc_control_mapping *mapping, size_t v4l2_size,
>> +			const void *v4l2_in, void *uvc_out)
>> +{
>> +	struct uvc_rect *uvc_rect = uvc_out;
>> +	const struct v4l2_rect *v4l2_rect = v4l2_in;
>> +
>> +	if (WARN_ON(v4l2_size != sizeof(struct v4l2_rect)))
>> +		return -EINVAL;
>> +
>> +	uvc_rect->top = min(0xffff, v4l2_rect->top);
>> +	uvc_rect->left = min(0xffff, v4l2_rect->left);
>> +	uvc_rect->bottom = min(0xffff, v4l2_rect->top + v4l2_rect->height - 1);
>> +	uvc_rect->right = min(0xffff, v4l2_rect->left + v4l2_rect->width - 1);
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>>  	{
>>  		.id		= V4L2_CID_BRIGHTNESS,
>> @@ -897,6 +953,28 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>>  		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
>>  		.filter_mapping	= uvc_ctrl_filter_plf_mapping,
>>  	},
>> +	{
>> +		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
>> +		.entity		= UVC_GUID_UVC_CAMERA,
>> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
>> +		.size		= sizeof(struct uvc_rect) * 8,
>> +		.offset		= 0,
>> +		.v4l2_type	= V4L2_CTRL_TYPE_RECT,
>> +		.data_type	= UVC_CTRL_DATA_TYPE_RECT,
>> +		.get		= uvc_get_rect,
>> +		.set		= uvc_set_rect,
>> +		.name		= "Region Of Interest Rectangle",
> 
> According to how titles are capitalized in english, this should be lower-case "of".
> 
>> +	},
>> +	{
>> +		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
>> +		.entity		= UVC_GUID_UVC_CAMERA,
>> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
>> +		.size		= 16,
>> +		.offset		= 64,
>> +		.v4l2_type	= V4L2_CTRL_TYPE_BITMASK,
>> +		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
>> +		.name		= "Region Of Interest Auto Controls",
> 
> Ditto.
> 
> This string is also one character too long (the control description string is at
> most 31 characters). Suggested alternatives:
> 
> "Region of Interest Auto Ctrls"

FWIW my vote goes to the above one, rationale:

1. ROI is unclear
2. "Ctrls" with the _s_ over "Control" as this is a bitmask which allows
   multiple options to be set at the same time (so not a menu style control)
 
> "ROI Auto Controls"
> "Region Of Interest Auto Control"
> 
> I can make the changes myself, but I need to know which alternative to use for
> this string.
 
Regards,
 
	Hans





> 
>> +	},
>>  };
>>  
>>  /* ------------------------------------------------------------------------
>> @@ -1473,6 +1551,9 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
>>  
>>  static size_t uvc_mapping_v4l2_size(struct uvc_control_mapping *mapping)
>>  {
>> +	if (mapping->v4l2_type == V4L2_CTRL_TYPE_RECT)
>> +		return sizeof(struct v4l2_rect);
>> +
>>  	if (uvc_ctrl_mapping_is_compound(mapping))
>>  		return DIV_ROUND_UP(mapping->size, 8);
>>  
>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>> index 6fc1cb9e99d1..b63720e21075 100644
>> --- a/drivers/media/usb/uvc/uvcvideo.h
>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>> @@ -543,6 +543,13 @@ struct uvc_device_info {
>>  	u16	uvc_version;
>>  };
>>  
>> +struct uvc_rect {
>> +	u16 top;
>> +	u16 left;
>> +	u16 bottom;
>> +	u16 right;
>> +} __packed;
>> +
>>  struct uvc_status_streaming {
>>  	u8	button;
>>  } __packed;
>> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
>> index 526b5155e23c..e1d9f5773187 100644
>> --- a/include/uapi/linux/usb/video.h
>> +++ b/include/uapi/linux/usb/video.h
>> @@ -104,6 +104,7 @@
>>  #define UVC_CT_ROLL_ABSOLUTE_CONTROL			0x0f
>>  #define UVC_CT_ROLL_RELATIVE_CONTROL			0x10
>>  #define UVC_CT_PRIVACY_CONTROL				0x11
>> +#define UVC_CT_REGION_OF_INTEREST_CONTROL		0x14
>>  
>>  /* A.9.5. Processing Unit Control Selectors */
>>  #define UVC_PU_CONTROL_UNDEFINED			0x00
>> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
>> index f86185456dc5..cbe15bca9569 100644
>> --- a/include/uapi/linux/uvcvideo.h
>> +++ b/include/uapi/linux/uvcvideo.h
>> @@ -16,6 +16,7 @@
>>  #define UVC_CTRL_DATA_TYPE_BOOLEAN	3
>>  #define UVC_CTRL_DATA_TYPE_ENUM		4
>>  #define UVC_CTRL_DATA_TYPE_BITMASK	5
>> +#define UVC_CTRL_DATA_TYPE_RECT		6
>>  
>>  /* Control flags */
>>  #define UVC_CTRL_FLAG_SET_CUR		(1 << 0)
>> @@ -38,6 +39,18 @@
>>  
>>  #define UVC_MENU_NAME_LEN 32
>>  
>> +/* V4L2 driver-specific controls */
>> +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT	(V4L2_CID_USER_UVC_BASE + 1)
>> +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO	(V4L2_CID_USER_UVC_BASE + 2)
>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE		(1 << 0)
>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK	(1 << 5)
>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION	(1 << 6)
>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY		(1 << 7)
>> +
>>  struct uvc_menu_info {
>>  	__u32 value;
>>  	__u8 name[UVC_MENU_NAME_LEN];
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 974fd254e573..72e32814ea83 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -215,6 +215,13 @@ enum v4l2_colorfx {
>>   */
>>  #define V4L2_CID_USER_THP7312_BASE		(V4L2_CID_USER_BASE + 0x11c0)
>>  
>> +/*
>> + * The base for the uvc driver controls.
>> + * See linux/uvcvideo.h for the list of controls.
>> + * We reserve 64 controls for this driver.
>> + */
>> +#define V4L2_CID_USER_UVC_BASE			(V4L2_CID_USER_BASE + 0x11e0)
>> +
>>  /* MPEG-class control IDs */
>>  /* The MPEG controls are applicable to all codec controls
>>   * and the 'MPEG' part of the define is historical */
>>
> 
> 


