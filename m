Return-Path: <linux-media+bounces-27329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE8A4C20D
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 14:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 203E9173852
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 13:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647F153365;
	Mon,  3 Mar 2025 13:32:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065978634C;
	Mon,  3 Mar 2025 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008765; cv=none; b=V6nh0kt+O7IV/xDlv7nNDstWEisPqS8IdKYEov977PZXIUO/cugPV7kQQGmFbDnSLhWz/mOGvD4C1h8T6b+IP3UsIyjrSCc//dbyMi7DUlzNd+AXyosTiU+6BcZEeF7vGdBJANQ3iDjz7wFVnztY1sEqXAbkXlO5BxDhs7GRQPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008765; c=relaxed/simple;
	bh=JVfg1N8LSE+DTYPTu0sMQmjySx4p+I4p4xIPv4FZHn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzMf8KA3EL5xMSikKQeuPOowlArwohaqx9ALSuKv5rDSLCur5ca7cEpuQ8SVFvER5zXtvjab6R3U+Xnxh3W9/cloUOBTD/EMnpCr32fKd++pOWITFgcV9ntemeDdAxIIoXQlbCTlhlzm7zHnvY+6yt0hlFKeElrfaL7dUCx5wJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DADC4CED6;
	Mon,  3 Mar 2025 13:32:41 +0000 (UTC)
Message-ID: <6944a221-b0b4-4042-9d4a-98a0cc806116@xs4all.nl>
Date: Mon, 3 Mar 2025 14:32:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 16/17] media: uvcvideo: implement UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>
References: <20250203-uvc-roi-v17-0-5900a9fed613@chromium.org>
 <20250203-uvc-roi-v17-16-5900a9fed613@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250203-uvc-roi-v17-16-5900a9fed613@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hans, Laurent, Yunke,

On 03/02/2025 12:55, Ricardo Ribalda wrote:
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
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 81 ++++++++++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  7 ++++
>  include/uapi/linux/usb/video.h     |  1 +
>  include/uapi/linux/uvcvideo.h      | 13 ++++++
>  include/uapi/linux/v4l2-controls.h |  7 ++++
>  5 files changed, 109 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 17a7ce525f71..1906ce5b7d50 100644
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

According to how titles are capitalized in english, this should be lower-case "of".

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

Ditto.

This string is also one character too long (the control description string is at
most 31 characters). Suggested alternatives:

"Region of Interest Auto Ctrls"
"ROI Auto Controls"
"Region Of Interest Auto Control"

I can make the changes myself, but I need to know which alternative to use for
this string.

Regards,

	Hans

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
> index 6fc1cb9e99d1..b63720e21075 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -543,6 +543,13 @@ struct uvc_device_info {
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
> index 526b5155e23c..e1d9f5773187 100644
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


