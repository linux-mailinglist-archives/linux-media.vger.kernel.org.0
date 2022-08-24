Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34D805A02E5
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 22:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240463AbiHXUhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 16:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240430AbiHXUhF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 16:37:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C735F980
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 13:37:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6584E2B3;
        Wed, 24 Aug 2022 22:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661373421;
        bh=pxKysjIvRh2mfX9LAFwXp3ozVdCa/BlH/wrefaGJfCg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HpzyIF4SZzACagevibHP/EyeeiOhNH1bMglqQ3zbwgdUoQ+OgA/NhCzy+B7ey/YKU
         0vnr80okwYzB5ufm8lBvVes2adtr4lsxlcy+ypPbLaPNOaxZhKySYIMPfOTTBivSX/
         BDOcl+ESxscSq22rUTq8z0/ydOt9+RFL1Joft3+w=
Date:   Wed, 24 Aug 2022 23:36:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v7 4/7] media: uvcvideo: implement UVC v1.5 ROI
Message-ID: <YwaL6BgwEwif7b16@pendragon.ideasonboard.com>
References: <20220628075705.2278044-1-yunkec@google.com>
 <20220628075705.2278044-5-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628075705.2278044-5-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

Thank you for the patch.

On Tue, Jun 28, 2022 at 04:57:02PM +0900, Yunke Cao wrote:
> Implement support for ROI as described in UVC 1.5:
> 4.2.2.1.20 Digital Region of Interest (ROI) Control
> 
> ROI control is implemented using V4L2 control API as
> two uvc-specific controls:

s/uvc/UVC/

> V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 146 ++++++++++++++++++++++++++++-
>  drivers/media/usb/uvc/uvc_v4l2.c   |   5 +-
>  drivers/media/usb/uvc/uvcvideo.h   |   7 ++
>  include/uapi/linux/usb/video.h     |   1 +
>  include/uapi/linux/uvcvideo.h      |  13 +++
>  include/uapi/linux/v4l2-controls.h |   8 ++
>  6 files changed, 178 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 508ee04afbcd..00482269233a 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -355,6 +355,23 @@ static const struct uvc_control_info uvc_ctrls[] = {
>  		.flags		= UVC_CTRL_FLAG_GET_CUR
>  				| UVC_CTRL_FLAG_AUTO_UPDATE,
>  	},
> +	/* UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get updated

	/*
	 * UVC_CTRL_...

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
> @@ -429,6 +446,64 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
>  	data[first+1] = min_t(int, abs(value), 0xff);
>  }
>  
> +static void uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
> +			     const struct uvc_rect *uvc_rect)
> +{
> +	v4l2_rect->top = uvc_rect->top;
> +	v4l2_rect->left = uvc_rect->left;
> +	v4l2_rect->height = uvc_rect->bottom - uvc_rect->top + 1;
> +	v4l2_rect->width = uvc_rect->right - uvc_rect->left + 1;

What happens if the device sends a bogus value with top > bottom or left
> right ?

> +}
> +
> +static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
> +			    const struct v4l2_rect *v4l2_rect)
> +{
> +	// Safely converts s32 and u32 to u16.

C-style comments.

> +	if (v4l2_rect->top > U16_MAX || v4l2_rect->top < 0 ||
> +	    v4l2_rect->left > U16_MAX || v4l2_rect->left < 0 ||
> +	    v4l2_rect->height > U16_MAX || v4l2_rect->height == 0 ||
> +	    v4l2_rect->width > U16_MAX || v4l2_rect->width == 0 ||
> +	    v4l2_rect->height + v4l2_rect->top - 1 > U16_MAX ||
> +	    v4l2_rect->width + v4l2_rect->left - 1 > U16_MAX)
> +		return -ERANGE;

Doesn't V4L2 adjust the control value instead ?

> +
> +	uvc_rect->top = v4l2_rect->top;
> +	uvc_rect->left = v4l2_rect->left;
> +	uvc_rect->bottom = v4l2_rect->height + v4l2_rect->top - 1;
> +	uvc_rect->right = v4l2_rect->width + v4l2_rect->left - 1;
> +	return 0;
> +}
> +
> +static int uvc_get_array_rect(struct uvc_control_mapping *mapping,
> +			      const u8 *data,  u8 *data_out)
> +{
> +	struct uvc_rect *uvc_rect;
> +
> +	if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> +		return -EINVAL;
> +	if (WARN_ON(mapping->size / 8 != sizeof(struct uvc_rect)))
> +		return -EINVAL;
> +

These checks should go to mapping creation time.

> +	uvc_rect = (struct uvc_rect *)(data + mapping->offset / 8);

If the offset happens to not be a multiple of 2 bytes this will cause
unaligned accesses on some platforms.

> +	uvc_to_v4l2_rect((struct v4l2_rect *)data_out, uvc_rect);

Same here if not aligned on 4 bytes.

> +
> +	return 0;
> +}
> +
> +static int uvc_set_array_rect(struct uvc_control_mapping *mapping,
> +			      const u8 *data_in, u8 *data)
> +{
> +	struct uvc_rect *uvc_rect;
> +
> +	if (WARN_ON(mapping->offset % 8 || mapping->size % 8))
> +		return -EINVAL;
> +	if (WARN_ON(mapping->size / 8 != sizeof(struct uvc_rect)))
> +		return -EINVAL;
> +

Same here.

> +	uvc_rect = (struct uvc_rect *)(data + mapping->offset / 8);
> +	return v4l2_to_uvc_rect(uvc_rect, (struct v4l2_rect *)data_in);
> +}
> +
>  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	{
>  		.id		= V4L2_CID_BRIGHTNESS,
> @@ -728,6 +803,26 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
>  	},
> +	{
> +		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
> +		.entity		= UVC_GUID_UVC_CAMERA,
> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
> +		.size		= 64,

sizeof(struct uvc_rect)

> +		.offset		= 0,
> +		.v4l2_type	= V4L2_CTRL_TYPE_RECT,
> +		.data_type	= UVC_CTRL_DATA_TYPE_RECT,
> +		.get_array	= uvc_get_array_rect,
> +		.set_array	= uvc_set_array_rect,
> +	},
> +	{
> +		.id		= V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
> +		.entity		= UVC_GUID_UVC_CAMERA,
> +		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
> +		.size		= 16,
> +		.offset		= 64,
> +		.v4l2_type	= V4L2_CTRL_TYPE_BITMASK,
> +		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
> +	},
>  };
>  
>  /* ------------------------------------------------------------------------
> @@ -1061,7 +1156,16 @@ static int __uvc_ctrl_get_compound_to_user(struct uvc_control_mapping *mapping,
>  	if (WARN_ON(!mapping->size % 8))
>  		return -EINVAL;
>  
> -	size = mapping->size / 8;
> +	switch (mapping->v4l2_type) {
> +	case V4L2_CTRL_TYPE_RECT:
> +		size = sizeof(struct v4l2_rect);

Oohhh that sounds fragile. I'm worried we may be using mapping->size as
the V4L2 control size somewhere else.

It would be safer to split the size field of uvc_control_mapping into a
v4l2_size and a uvc_size (or possibly data_size to match the v4l2_type
and data_type names) in a patch before this. This will force reviewing
all the users of the size field to check which size they need.

> +		break;
> +
> +	default:
> +		size = mapping->size / 8;
> +		break;
> +	}
> +
>  	if (xctrl->size < size) {
>  		xctrl->size = size;
>  		return -ENOSPC;
> @@ -2578,6 +2682,40 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
>  	}
>  }
>  
> +static int uvc_ctrl_init_roi(struct uvc_device *dev, struct uvc_control *ctrl)
> +{
> +	int ret;
> +
> +	ret = uvc_query_ctrl(dev, UVC_GET_DEF, ctrl->entity->id, dev->intfnum,
> +			     UVC_CT_REGION_OF_INTEREST_CONTROL,
> +			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> +			     ctrl->info.size);
> +	if (ret)
> +		goto out;
> +
> +	/*
> +	 * Most firmwares have wrong GET_CURRENT configuration. E.g. it's

s/GET_CURRENT/GET_CUR/

> +	 * below GET_MIN, or have rectangle coordinates mixed up. This
> +	 * causes problems sometimes, because we are unable to set
> +	 * auto-controls value without first setting ROI rectangle to
> +	 * valid configuration.
> +	 *
> +	 * We expect that default configuration is always correct and
> +	 * is within the GET_MIN / GET_MAX boundaries.

A dangerous expectation to make given the quality of most UVC camera
firmwares...

> +	 *
> +	 * Set current ROI configuration to GET_DEF, so that we will
> +	 * always have properly configured ROI.
> +	 */
> +	ret = uvc_query_ctrl(dev, UVC_SET_CUR, 1, dev->intfnum,
> +			     UVC_CT_REGION_OF_INTEREST_CONTROL,
> +			     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF),
> +			     ctrl->info.size);
> +out:
> +	if (ret)
> +		dev_err(&dev->udev->dev, "Failed to fixup ROI (%d).\n", ret);

s/(%d)./(%d)/

> +	return ret;
> +}
> +
>  /*
>   * Add control information and hardcoded stock control mappings to the given
>   * device.
> @@ -2590,6 +2728,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  	const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
>  	const struct uvc_control_mapping *mend =
>  		mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> +	const u8 camera_entity[16] = UVC_GUID_UVC_CAMERA;
>  
>  	/* XU controls initialization requires querying the device for control
>  	 * information. As some buggy UVC devices will crash when queried
> @@ -2610,6 +2749,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  			 * GET_INFO on standard controls.
>  			 */
>  			uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
> +
> +			if (ctrl->info.selector ==
> +				UVC_CT_REGION_OF_INTEREST_CONTROL &&
> +			    uvc_entity_match_guid(ctrl->entity, camera_entity))
> +				uvc_ctrl_init_roi(chain->dev, ctrl);

Should we instead add an init operation to the uvc_control_info
structure ?

>  			break;
>  		 }
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 0366d05895a9..aad61af36271 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -998,7 +998,10 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
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
> index 2f9b75faae83..9ff95bbad251 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -431,6 +431,13 @@ struct uvc_streaming_header {
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
> index bfdae12cdacf..9076a444758a 100644
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
> index 8288137387c0..e2feee15cb1b 100644
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
> @@ -36,6 +37,18 @@
>  	 UVC_CTRL_FLAG_GET_MAX | UVC_CTRL_FLAG_GET_RES | \
>  	 UVC_CTRL_FLAG_GET_DEF)
>  
> +/* V4L2 private controls */
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
>  	__u8 name[32];
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index dfff69ed88f7..d85be46e46f2 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1013,6 +1013,14 @@ enum v4l2_auto_focus_range {
>  
>  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
>  
> +/* CAMERA-class private control IDs */
> +

Why doesn't this go in the driver-specific controls range ?

> +/*
> + * The base for the uvc driver controls. See linux/uvcvideo.h for the list
> + * of controls. We reserve 16 controls for this driver.

I'd reserve more just in case, UVC 1.5 has quite a few controls that may
not be exposed through standard V4L2 controls, especially for encoding
units.

> + */
> +#define V4L2_CID_CAMERA_UVC_BASE		(V4L2_CID_CAMERA_CLASS_BASE + 0x1000)
> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)

-- 
Regards,

Laurent Pinchart
