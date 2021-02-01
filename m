Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344E130B19B
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 21:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhBAUct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 15:32:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34576 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbhBAUco (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 15:32:44 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD236556;
        Mon,  1 Feb 2021 21:32:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1612211521;
        bh=jyIVuGf3EGcPMVwAAPO/NUEYKehW7X7dQX/KlSR+thU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KgdARKpQ001g7HVYMLOXxWbH3XdH5Fhbz2BAQsQFOb8atX/cDzIG2sulcrC4ucLev
         mdC0OV5zOkRQdKYR1tvMJZpZ20wGsDps3Y7p8mk+EmZVyUTavan7q5Cqbe4jV4qTzn
         Ckq2Ne9pIEHLTcJz1+OgdgFbOySzAPxvbD9mXlXo=
Date:   Mon, 1 Feb 2021 22:31:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCH] media: uvcvideo: initial UVC 1.5 region of interest
 support
Message-ID: <YBhlKyZMEnvxhwHe@pendragon.ideasonboard.com>
References: <20210201033441.112092-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210201033441.112092-1-senozhatsky@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

Thank you for the patch.

On Mon, Feb 01, 2021 at 12:34:41PM +0900, Sergey Senozhatsky wrote:
> This patch implements parts of UVC 1.5 Region of Interest (ROI)
> control, using the uvcvideo selection API.
> 
> There are several things to mention here.
> 
> First, UVC 1.5 defines CT_DIGITAL_WINDOW_CONTROL; and ROI rectangle
> coordinates "must be within the current Digital Window as specified
> by the CT_WINDOW control."  (4.2.2.1.20 Digital Region of Interest
> (ROI) Control.) This is not entirely clear if we need to implement
> CT_DIGITAL_WINDOW_CONTROL. ROI is naturally limited by:
> a) ROI GET_MIN and GET_MAX rectangles
> b) current image crop
> c) stream->cur_frame->wWidth/stream->cur_frame->wHeight
> 
> Second, ROI control is a compound data type:
>   Control Selector     CT_REGION_OF_INTEREST_CONTROL
>   Mandatory Requests   SET_CUR, GET_CUR, GET_MIN, GET_MAX, GET_DEF
>   wLength 10
>   Offset   Field            Size
>   0        wROI_Top         2
>   2        wROI_Left        2
>   4        wROI_Bottom      2
>   6        wROI_Right       2
>   8        bmAutoControls   2       (Bitmap)
> 
> While uvc_control_mapping can handle only s32 data at the moment:
> ->get() returns s32 value, ->set() accepts s32 value; while v4l2_ctrl
> maximum/minimum/default_value can hold only s64 values.
> 
> Therefore ROI control handling is split into two parts:
> a) bmAutoControls is handled via uvc_control_mapping as V4L2_CTRL_TYPE_MENU
> b) ROI rectangle (SET_CUR, GET_CUR, GET_DEF) handling is implemented
>    by the means of selection API.
> 
> Third, the patch adds new selection targets in order to handle ROI
> control requests, but it doesn't implement all of the requests.
> Namely, SEL_TGT_BOUNDS for ROI implements GET_MAX (that is maximal
> ROI rectangle area). GET_MIN is not implemented ( as of now) since
> it's not very clear if user space would need such information.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   |  32 +++++++
>  drivers/media/usb/uvc/uvc_v4l2.c   | 143 ++++++++++++++++++++++++++++-
>  include/uapi/linux/usb/video.h     |   1 +
>  include/uapi/linux/v4l2-common.h   |  10 ++
>  include/uapi/linux/v4l2-controls.h |   1 +

Before commenting on the uvcvideo-specific implementation, I'd like to
discuss the API. For this we need documentation for the new selection
targets. While doing so, could you split this patch in three:

- The new selection rectangles in the V4L2 core (and documentation)
- The new V4L2 control (and its documentation)
- The implementation of the feature in the uvcvideo driver

The first and second patches could be squashed if the two API elements
are tightly coupled.

Please note that the documentation should explain what the selection
rectangles apply to, whether they're only valid on video nodes, or on
subdevs as well, and how they related to other API elements.

>  5 files changed, 184 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b3dde98499f4..4e55a0922f15 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -355,6 +355,15 @@ static const struct uvc_control_info uvc_ctrls[] = {
>  		.flags		= UVC_CTRL_FLAG_GET_CUR
>  				| UVC_CTRL_FLAG_AUTO_UPDATE,
>  	},
> +	{
> +		.entity		= UVC_GUID_UVC_CAMERA,
> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
> +		.index		= 21,
> +		.size		= 10,
> +		.flags		= UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_CUR
> +				| UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
> +				| UVC_CTRL_FLAG_GET_DEF
> +	},
>  };
>  
>  static const struct uvc_menu_info power_line_frequency_controls[] = {
> @@ -370,6 +379,17 @@ static const struct uvc_menu_info exposure_auto_controls[] = {
>  	{ 8, "Aperture Priority Mode" },
>  };
>  
> +static struct uvc_menu_info roi_auto_controls[] = {
> +	{ 0, "Auto Exposure" },
> +	{ 1, "Auto Iris" },
> +	{ 2, "Auto White Balance" },
> +	{ 3, "Auto Focus" },
> +	{ 4, "Auto Face Detect" },
> +	{ 5, "Auto Detect and Track" },
> +	{ 6, "Image Stabilization" },
> +	{ 7, "Higher Quality" },
> +};
> +
>  static s32 uvc_ctrl_get_zoom(struct uvc_control_mapping *mapping,
>  	u8 query, const u8 *data)
>  {
> @@ -753,6 +773,18 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
>  	},
> +	{
> +		.id		= V4L2_CID_REGION_OF_INTEREST_CONTROLS,
> +		.name		= "Region of Interest (controls)",
> +		.entity		= UVC_GUID_UVC_CAMERA,
> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
> +		.size		= 16,
> +		.offset		= 64,
> +		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
> +		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
> +		.menu_info	= roi_auto_controls,
> +		.menu_count	= ARRAY_SIZE(roi_auto_controls),
> +	},
>  };
>  
>  /* ------------------------------------------------------------------------
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 252136cc885c..71b4577196e5 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1139,14 +1139,60 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
>  	return uvc_query_v4l2_menu(chain, qm);
>  }
>  
> -static int uvc_ioctl_g_selection(struct file *file, void *fh,
> -				 struct v4l2_selection *sel)
> +/* UVC 1.5 ROI rectangle is half the size of v4l2_rect */
> +struct uvc_roi_rect {
> +	__u16			top;
> +	__u16			left;
> +	__u16			bottom;
> +	__u16			right;
> +};
> +
> +static int uvc_ioctl_g_roi_target(struct file *file, void *fh,
> +				  struct v4l2_selection *sel)
>  {
>  	struct uvc_fh *handle = fh;
>  	struct uvc_streaming *stream = handle->stream;
> +	struct uvc_roi_rect *roi;
> +	u8 query;
> +	int ret;
>  
> -	if (sel->type != stream->type)
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_ROI_DEFAULT:
> +		query = UVC_GET_DEF;
> +		break;
> +	case V4L2_SEL_TGT_ROI_CURRENT:
> +		query = UVC_GET_CUR;
> +		break;
> +	case V4L2_SEL_TGT_ROI_BOUNDS:
> +		query = UVC_GET_MAX;
> +		break;
> +	default:
>  		return -EINVAL;
> +	}
> +
> +	roi = kzalloc(sizeof(struct uvc_roi_rect), GFP_KERNEL);
> +	if (!roi)
> +		return -ENOMEM;
> +
> +	ret = uvc_query_ctrl(stream->dev, query, 1, stream->dev->intfnum,
> +			     UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
> +			     sizeof(struct uvc_roi_rect));
> +	if (!ret) {
> +		sel->r.left	= roi->left;
> +		sel->r.top	= roi->top;
> +		sel->r.width	= roi->right;
> +		sel->r.height	= roi->bottom;
> +	}
> +
> +	kfree(roi);
> +	return ret;
> +}
> +
> +static int uvc_ioctl_g_sel_target(struct file *file, void *fh,
> +				  struct v4l2_selection *sel)
> +{
> +	struct uvc_fh *handle = fh;
> +	struct uvc_streaming *stream = handle->stream;
>  
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP_DEFAULT:
> @@ -1173,6 +1219,96 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
>  	return 0;
>  }
>  
> +static int uvc_ioctl_g_selection(struct file *file, void *fh,
> +				 struct v4l2_selection *sel)
> +{
> +	struct uvc_fh *handle = fh;
> +	struct uvc_streaming *stream = handle->stream;
> +
> +	if (sel->type != stream->type)
> +		return -EINVAL;
> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> +		return uvc_ioctl_g_sel_target(file, fh, sel);
> +	case V4L2_SEL_TGT_ROI_CURRENT:
> +	case V4L2_SEL_TGT_ROI_DEFAULT:
> +	case V4L2_SEL_TGT_ROI_BOUNDS:
> +		return uvc_ioctl_g_roi_target(file, fh, sel);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static bool validate_roi_bounds(struct uvc_streaming *stream,
> +				struct v4l2_selection *sel)
> +{
> +	bool ok = true;
> +
> +	if (sel->r.left > USHRT_MAX || sel->r.top > USHRT_MAX ||
> +	    sel->r.width > USHRT_MAX || sel->r.height > USHRT_MAX)
> +		return false;
> +
> +	/* perhaps also can test against ROI GET_MAX */
> +
> +	mutex_lock(&stream->mutex);
> +	if ((u16)sel->r.width > stream->cur_frame->wWidth)
> +		ok = false;
> +	if ((u16)sel->r.height > stream->cur_frame->wHeight)
> +		ok = false;
> +	mutex_unlock(&stream->mutex);
> +
> +	return ok;
> +}
> +
> +static int uvc_ioctl_s_roi(struct file *file, void *fh,
> +			   struct v4l2_selection *sel)
> +{
> +	struct uvc_fh *handle = fh;
> +	struct uvc_streaming *stream = handle->stream;
> +	struct uvc_roi_rect *roi;
> +	int ret;
> +
> +	if (!validate_roi_bounds(stream, sel))
> +		return -E2BIG;
> +
> +	roi = kzalloc(sizeof(struct uvc_roi_rect), GFP_KERNEL);
> +	if (!roi)
> +		return -ENOMEM;
> +
> +	roi->left	= sel->r.left;
> +	roi->top	= sel->r.top;
> +	roi->right	= sel->r.width;
> +	roi->bottom	= sel->r.height;
> +
> +	ret = uvc_query_ctrl(stream->dev, UVC_SET_CUR, 1, stream->dev->intfnum,
> +			     UVC_CT_REGION_OF_INTEREST_CONTROL, roi,
> +			     sizeof(struct uvc_roi_rect));
> +
> +	kfree(roi);
> +	return ret;
> +}
> +
> +static int uvc_ioctl_s_selection(struct file *file, void *fh,
> +				 struct v4l2_selection *sel)
> +{
> +	struct uvc_fh *handle = fh;
> +	struct uvc_streaming *stream = handle->stream;
> +
> +	if (sel->type != stream->type)
> +		return -EINVAL;
> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_ROI:
> +		return uvc_ioctl_s_roi(file, fh, sel);
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int uvc_ioctl_g_parm(struct file *file, void *fh,
>  			    struct v4l2_streamparm *parm)
>  {
> @@ -1533,6 +1669,7 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>  	.vidioc_try_ext_ctrls = uvc_ioctl_try_ext_ctrls,
>  	.vidioc_querymenu = uvc_ioctl_querymenu,
>  	.vidioc_g_selection = uvc_ioctl_g_selection,
> +	.vidioc_s_selection = uvc_ioctl_s_selection,
>  	.vidioc_g_parm = uvc_ioctl_g_parm,
>  	.vidioc_s_parm = uvc_ioctl_s_parm,
>  	.vidioc_enum_framesizes = uvc_ioctl_enum_framesizes,
> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> index d854cb19c42c..c87624962896 100644
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
> diff --git a/include/uapi/linux/v4l2-common.h b/include/uapi/linux/v4l2-common.h
> index 7d21c1634b4d..60d5228f9113 100644
> --- a/include/uapi/linux/v4l2-common.h
> +++ b/include/uapi/linux/v4l2-common.h
> @@ -70,6 +70,16 @@
>  #define V4L2_SEL_TGT_CROP_BOUNDS	0x0002
>  /* Native frame size */
>  #define V4L2_SEL_TGT_NATIVE_SIZE	0x0003
> +
> +/* Current Region of Interest area */
> +#define V4L2_SEL_TGT_ROI_CURRENT	0x0004
> +/* Default Region of Interest area */
> +#define V4L2_SEL_TGT_ROI_DEFAULT	0x0005
> +/* Region of Interest bounds */
> +#define V4L2_SEL_TGT_ROI_BOUNDS	0x0006
> +/* Set Region of Interest area */
> +#define V4L2_SEL_TGT_ROI		0x0007
> +
>  /* Current composing area */
>  #define V4L2_SEL_TGT_COMPOSE		0x0100
>  /* Default composing area */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 039c0d7add1b..cbc1635046a0 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -976,6 +976,7 @@ enum v4l2_auto_focus_range {
>  
>  #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
>  #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
> +#define V4L2_CID_REGION_OF_INTEREST_CONTROLS	(V4L2_CID_CAMERA_CLASS_BASE+34)
>  
>  #define V4L2_CID_CAMERA_ORIENTATION		(V4L2_CID_CAMERA_CLASS_BASE+34)
>  #define V4L2_CAMERA_ORIENTATION_FRONT		0

-- 
Regards,

Laurent Pinchart
