Return-Path: <linux-media+bounces-1989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B2E80A7C4
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDFB11C2097F
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E248F328DB;
	Fri,  8 Dec 2023 15:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vMecTH+k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8623171E
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 07:43:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59E82512;
	Fri,  8 Dec 2023 16:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702050189;
	bh=oxpHfc9zuNLyW1wqYOmOsuU2enqlKtNChVUTraN8/H4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMecTH+kdX+LPHJ4UzbBapDE+WxumJxjj7/ffb+R3E055SJJ73tWxHBdxpGsyjN+s
	 OWf8FXdmEvV8aDuy1NVIFfEr1gCdkvIj72s1rY14CglOnInOqCDj32TaK9eQAA0XdM
	 6QkWLgpmVbLP+W4hCxrGg4nTCGIx9NAeplTkxODI=
Date: Fri, 8 Dec 2023 17:43:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yunke Cao <yunkec@google.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v14 09/11] media: uvcvideo: implement UVC v1.5 ROI
Message-ID: <20231208154358.GJ25616@pendragon.ideasonboard.com>
References: <20231201071907.3080126-1-yunkec@google.com>
 <20231201071907.3080126-10-yunkec@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231201071907.3080126-10-yunkec@google.com>

Hi Yunke,

Thank you for the patch.

On Fri, Dec 01, 2023 at 04:19:00PM +0900, Yunke Cao wrote:
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
> Changelog since v11:
> - No change.
> Changelog since v10:
> - Moved after the patches adding support for MIN/MAX.
> - Clamp the set current value based on MIN/MAX.
> - Thanks, Daniel!
> Changelog since v9:
> - No change.
> Changelog since v8:
> - No change.
> Changelog since v7:
> - Fix a few style issues.
> - Only allow 4-byte aligned data.
> - Add control names.
> - Move initialization to 7/10.
> 
>  drivers/media/usb/uvc/uvc_ctrl.c   | 137 +++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c   |   5 +-
>  drivers/media/usb/uvc/uvcvideo.h   |  12 ++-
>  include/uapi/linux/usb/video.h     |   1 +
>  include/uapi/linux/uvcvideo.h      |  13 +++
>  include/uapi/linux/v4l2-controls.h |   9 ++
>  6 files changed, 167 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index c073c2a02102..d405b2a9d477 100644
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
> @@ -459,6 +477,70 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
>  	data[first+1] = min_t(int, abs(value), 0xff);
>  }
>  
> +static int uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
> +			    const struct uvc_rect *uvc_rect)
> +{
> +	if (uvc_rect->bottom < uvc_rect->top ||
> +	    uvc_rect->right < uvc_rect->left)
> +		return -EINVAL;

This can only happen when the device is buggy. -EINVAL is not a great
error code in that case, as it usually indicates that a parameter passed
by the application is invalid.

> +
> +	v4l2_rect->top = uvc_rect->top;
> +	v4l2_rect->left = uvc_rect->left;
> +	v4l2_rect->height = uvc_rect->bottom - uvc_rect->top + 1;
> +	v4l2_rect->width = uvc_rect->right - uvc_rect->left + 1;
> +	return 0;
> +}
> +
> +static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
> +			    const struct v4l2_rect *min_rect,
> +			    const struct v4l2_rect *max_rect,
> +			    struct v4l2_rect *v4l2_rect)
> +{
> +	v4l2_rect->left = clamp_t(s32, v4l2_rect->left, 0, max_rect->width);
> +	v4l2_rect->top = clamp_t(s32, v4l2_rect->top, 0, max_rect->height);
> +	v4l2_rect->height = clamp_t(s32, v4l2_rect->height,
> +				    min_rect->height, max_rect->height);
> +	v4l2_rect->width = clamp_t(s32, v4l2_rect->width,
> +				   min_rect->width, max_rect->width);
> +
> +	uvc_rect->top = v4l2_rect->top;
> +	uvc_rect->left = v4l2_rect->left;
> +	uvc_rect->bottom = v4l2_rect->height + v4l2_rect->top - 1;
> +	uvc_rect->right = v4l2_rect->width + v4l2_rect->left - 1;
> +	return 0;
> +}
> +
> +static int uvc_get_compound_rect(struct uvc_control_mapping *mapping,
> +				 const u8 *data, u8 *data_out)
> +{
> +	struct uvc_rect *uvc_rect;
> +
> +	uvc_rect = (struct uvc_rect *)(data + mapping->offset / 8);
> +	return uvc_to_v4l2_rect((struct v4l2_rect *)data_out, uvc_rect);
> +}
> +
> +static int uvc_set_compound_rect(struct uvc_control_mapping *mapping,
> +				 const u8 *data_in, const u8 *data_min,
> +				 const u8 *data_max, u8 *data)
> +{
> +	struct uvc_rect *uvc_rect;
> +	struct v4l2_rect min_rect, max_rect;
> +	int ret;
> +
> +	uvc_rect = (struct uvc_rect *)(data + mapping->offset / 8);
> +
> +	ret = uvc_get_compound_rect(mapping, data_min, (u8 *)&min_rect);
> +	if (ret)
> +		return ret;
> +
> +	ret = uvc_get_compound_rect(mapping, data_max, (u8 *)&max_rect);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_to_uvc_rect(uvc_rect, &min_rect, &max_rect,
> +				(struct v4l2_rect *)data_in);
> +}
> +
>  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	{
>  		.id		= V4L2_CID_BRIGHTNESS,
> @@ -748,6 +830,29 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
>  	},
> +	{
> +		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
> +		.entity		= UVC_GUID_UVC_CAMERA,
> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
> +		.v4l2_size	= sizeof(struct v4l2_rect) * 8,
> +		.data_size	= sizeof(struct uvc_rect) * 8,
> +		.offset		= 0,
> +		.v4l2_type	= V4L2_CTRL_TYPE_RECT,
> +		.data_type	= UVC_CTRL_DATA_TYPE_RECT,
> +		.get_compound	= uvc_get_compound_rect,
> +		.set_compound	= uvc_set_compound_rect,
> +		.name		= "Region Of Interest Rectangle",
> +	},
> +	{
> +		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> +		.entity		= UVC_GUID_UVC_CAMERA,
> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
> +		.data_size	= 16,
> +		.offset		= 64,
> +		.v4l2_type	= V4L2_CTRL_TYPE_BITMASK,
> +		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
> +		.name		= "Region Of Interest Auto Controls",
> +	},
>  };
>  
>  const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
> @@ -900,12 +1005,12 @@ static int uvc_get_compound(struct uvc_control_mapping *mapping, const u8 *data,
>   * and mapping->data_size stored at 'data'.
>   */
>  static int uvc_set_compound(struct uvc_control_mapping *mapping,
> -			    const u8 *data_in, u8 *data)
> +			    const u8 *data_in, const u8 *data_min,
> +			    const u8 *data_max, u8 *data)
>  {
>  	memcpy(data + mapping->offset / 8, data_in, mapping->data_size / 8);
>  	return 0;
>  }
> -
>  static bool
>  uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping)
>  {
> @@ -2100,6 +2205,8 @@ static int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping,
>  		goto out;
>  
>  	ret = mapping->set_compound(mapping, data,
> +			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN),
> +			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX),
>  			uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>  
>  	__uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT, xctrl);
> @@ -2224,6 +2331,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  	}
>  
>  	if (uvc_ctrl_mapping_is_compound(mapping)) {
> +		/* Populates min/max value cache for clamping. */
> +		if (!ctrl->cached) {
> +			ret = uvc_ctrl_populate_cache(chain, ctrl);
> +			if (ret < 0)
> +				return ret;
> +		}
> +
>  		ret = __uvc_ctrl_set_compound(mapping, xctrl, ctrl);
>  		if (ret < 0)
>  			return ret;
> @@ -2641,12 +2755,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  	}
>  
>  	if (uvc_ctrl_mapping_is_compound(map)) {
> -		if (map->data_size != map->v4l2_size)
> -			return -EINVAL;
> +		switch (map->v4l2_type) {
> +		case V4L2_CTRL_TYPE_RECT:
> +			/* Only supports 4 bytes-aligned data. */
> +			if (WARN_ON(map->offset % 32))
> +				return -EINVAL;

Why is there no need to check the size here ?

> +			break;
> +		default:
> +			if (WARN_ON(map->data_size != map->v4l2_size))
> +				return -EINVAL;
> +
> +			/* Only supports byte-aligned data. */
> +			if (WARN_ON(map->offset % 8 || map->data_size % 8))
> +				return -EINVAL;
> +		}
>  
> -		/* Only supports byte-aligned data. */
> -		if (WARN_ON(map->offset % 8 || map->data_size % 8))
> -			return -EINVAL;
>  	}
>  
>  	if (!map->get && !uvc_ctrl_mapping_is_compound(map))
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 352f62ef02f2..c0a7c0091099 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1053,7 +1053,10 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
>  	qec->step = qc.step;
>  	qec->default_value = qc.default_value;
>  	qec->flags = qc.flags;
> -	qec->elem_size = 4;
> +	if (qc.type == V4L2_CTRL_TYPE_RECT)
> +		qec->elem_size = sizeof(struct v4l2_rect);
> +	else
> +		qec->elem_size = 4;
>  	qec->elems = 1;
>  	qec->nr_of_dims = 0;
>  	memset(qec->dims, 0, sizeof(qec->dims));
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 6fda40919e7f..18da5e0b8cb2 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -133,8 +133,9 @@ struct uvc_control_mapping {
>  			    u8 *data_out);
>  	void (*set)(struct uvc_control_mapping *mapping, s32 value,
>  		    u8 *data);
> -	int (*set_compound)(struct uvc_control_mapping *mapping, const u8 *data_in,
> -			    u8 *data);
> +	int (*set_compound)(struct uvc_control_mapping *mapping,
> +			    const u8 *data_in, const u8 *data_min,
> +			    const u8 *data_max, u8 *data);

I think this belongs to a separate patch.

>  };
>  
>  struct uvc_control {
> @@ -289,6 +290,13 @@ struct uvc_streaming_header {
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
> index f86185456dc5..9d1e6085feba 100644
> --- a/include/uapi/linux/uvcvideo.h
> +++ b/include/uapi/linux/uvcvideo.h
> @@ -16,6 +16,7 @@
>  #define UVC_CTRL_DATA_TYPE_BOOLEAN	3
>  #define UVC_CTRL_DATA_TYPE_ENUM		4
>  #define UVC_CTRL_DATA_TYPE_BITMASK	5
> +#define UVC_CTRL_DATA_TYPE_RECT		6

Should this type be rejected in uvc_control_add_xu_mapping() ?

>  
>  /* Control flags */
>  #define UVC_CTRL_FLAG_SET_CUR		(1 << 0)
> @@ -38,6 +39,18 @@
>  
>  #define UVC_MENU_NAME_LEN 32
>  
> +/* V4L2 driver-specific controls */
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT	(V4L2_CID_CAMERA_UVC_BASE + 1)
> +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_UVC_BASE + 2)
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
> index 68db66d4aae8..6c7e03d18d79 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1081,6 +1081,15 @@ enum v4l2_auto_focus_range {
>  
>  #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
>  
> +/* CAMERA-class private control IDs */
> +
> +/*
> + * The base for the uvc driver controls.
> + * See linux/uvcvideo.h for the list of controls.
> + * We reserve 64 controls for this driver.
> + */
> +#define V4L2_CID_CAMERA_UVC_BASE		(V4L2_CID_CAMERA_CLASS_BASE + 0x1000)

All driver-specific controls are in the user class, is there a reason to
create driver-specific controls in the camera class here ?

> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)

-- 
Regards,

Laurent Pinchart

