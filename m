Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18A76CB81F
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 12:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbfJDKWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 06:22:41 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51077 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728935AbfJDKWl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Oct 2019 06:22:41 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id GKjKiwCQgjZ8vGKjOitKcw; Fri, 04 Oct 2019 12:22:38 +0200
Subject: Re: [PATCH v9 3/8] media: add V4L2_CTRL_TYPE_AREA control type
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ricardo@ribalda.com>
References: <20191001112421.2778-1-ribalda@kernel.org>
 <20191001112421.2778-4-ribalda@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a5d0217d-b07c-a92c-cb36-06ef1170dc4d@xs4all.nl>
Date:   Fri, 4 Oct 2019 12:22:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001112421.2778-4-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBls9NzP9w+McVmv9dSezrVWw/Gy+Yf5ZRHMaEF5FJKfR6W2Qm5Zft2brmc2DTE6FJS6M6vlAsLLWtxsvUdAOJmRPry5eyDJSLosT5UUuUMizjZRlr2v
 whna5W1PzEaPSrSvWyITnySYQO435tXwij7Lcqzx4xiEUlNTobnuegQhQlsbY/t1ZJHhVB6//wf4SHxOF4Qf6KAChg5MsOm8EeGyK6lduINW9VeKZJ8w8Ptz
 KODY0cOTdQuMFZszmHlKV1Dw2P+Stz4sLm5PvnsRcjm3ZpdcE7+qWI4iP7Oa8xwVkvDz07y0j0cSJ0WP+x7dVqX+9QZbZ6EvU/1WKk/UXp7qegOV4TsTjN7/
 dBoCWL8V
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/1/19 1:24 PM, Ricardo Ribalda Delgado wrote:
> From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> 
> This type contains the width and the height of a rectangular area.
> 
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 21 ++++++++++++++
>  include/media/v4l2-ctrls.h           | 42 ++++++++++++++++++++++++++++
>  include/uapi/linux/videodev2.h       |  6 ++++
>  3 files changed, 69 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 219d8aeefa20..b9a46f536406 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1678,6 +1678,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
>  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
>  	void *p = ptr.p + idx * ctrl->elem_size;
> +	struct v4l2_area *area;

This should go before the 'void *p' line.

>  
>  	switch ((u32)ctrl->type) {
>  	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
> @@ -1753,6 +1754,11 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		zero_padding(p_vp8_frame_header->entropy_header);
>  		zero_padding(p_vp8_frame_header->coder_state);
>  		break;
> +	case V4L2_CTRL_TYPE_AREA:
> +		area = p;
> +		if (!area->width || !area->height)
> +			return -EINVAL;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -2427,6 +2433,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
>  		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
>  		break;
> +	case V4L2_CTRL_TYPE_AREA:
> +		elem_size = sizeof(struct v4l2_area);
> +		break;
>  	default:
>  		if (type < V4L2_CTRL_COMPOUND_TYPES)
>  			elem_size = sizeof(s32);
> @@ -4116,6 +4125,18 @@ int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
>  }
>  EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_string);
>  
> +int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> +			    const struct v4l2_area *area)
> +{
> +	lockdep_assert_held(ctrl->handler->lock);
> +
> +	/* It's a driver bug if this happens. */
> +	WARN_ON(ctrl->type != V4L2_CTRL_TYPE_AREA);
> +	memcpy(ctrl->p_new.p_area, area, sizeof(*area));

Just do:  *ctrl->p_new.p_area = *area;

> +	return set_ctrl(NULL, ctrl, 0);
> +}
> +EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_area);
> +
>  void v4l2_ctrl_request_complete(struct media_request *req,
>  				struct v4l2_ctrl_handler *main_hdl)
>  {
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 90a8ee48c2f3..c42f164e2c9e 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -50,6 +50,7 @@ struct poll_table_struct;
>   * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
>   * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
>   * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
> + * @p_area:			Pointer to an area.
>   * @p:				Pointer to a compound value.
>   */
>  union v4l2_ctrl_ptr {
> @@ -68,6 +69,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>  	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
>  	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> +	struct v4l2_area *p_area;
>  	void *p;
>  };
>  
> @@ -1086,6 +1088,46 @@ static inline int v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *ctrl, const char *s)
>  	return rval;
>  }
>  
> +/**
> + * __v4l2_ctrl_s_ctrl_area() - Unlocked variant of v4l2_ctrl_s_ctrl_area().
> + *
> + * @ctrl:	The control.
> + * @area:	The new area.
> + *
> + * This sets the control's new area safely by going through the control
> + * framework. This function assumes the control's handler is already locked,
> + * allowing it to be used from within the &v4l2_ctrl_ops functions.
> + *
> + * This function is for area type controls only.
> + */
> +int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> +			    const struct v4l2_area *area);
> +
> +/**
> + * v4l2_ctrl_s_ctrl_area() - Helper function to set a control's area value
> + *	 from within a driver.
> + *
> + * @ctrl:	The control.
> + * @s:		The new area.
> + *
> + * This sets the control's new area safely by going through the control
> + * framework. This function will lock the control's handler, so it cannot be
> + * used from within the &v4l2_ctrl_ops functions.
> + *
> + * This function is for area type controls only.
> + */
> +static inline int v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> +					const struct v4l2_area *area)
> +{
> +	int rval;
> +
> +	v4l2_ctrl_lock(ctrl);
> +	rval = __v4l2_ctrl_s_ctrl_area(ctrl, area);
> +	v4l2_ctrl_unlock(ctrl);
> +
> +	return rval;
> +}
> +
>  /* Internal helper functions that deal with control events. */
>  extern const struct v4l2_subscribed_event_ops v4l2_ctrl_sub_ev_ops;
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..b3c0961b62a0 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -422,6 +422,11 @@ struct v4l2_fract {
>  	__u32   denominator;
>  };
>  
> +struct v4l2_area {
> +	__u32   width;
> +	__u32   height;
> +};
> +
>  /**
>    * struct v4l2_capability - Describes V4L2 device caps returned by VIDIOC_QUERYCAP
>    *
> @@ -1720,6 +1725,7 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U8	     = 0x0100,
>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
> +	V4L2_CTRL_TYPE_AREA          = 0x0106,
>  };
>  
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> 

Regards,

	Hans
