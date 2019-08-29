Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC38A1664
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 12:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfH2Kjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 06:39:32 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:55099 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726379AbfH2Kjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 06:39:32 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3HpuiQwL5DqPe3HpxiNXpZ; Thu, 29 Aug 2019 12:39:30 +0200
Subject: Re: [PATCH v3 1/7] media: add V4L2_CID_UNIT_CELL_SIZE control
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4c2a519a-0e88-c4c8-9a71-e9d0cd370375@xs4all.nl>
Date:   Thu, 29 Aug 2019 12:39:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823123737.7774-1-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKiJd/quV9H3230XA0Uj1qaNmHrLgv4UyY2Ba1ZSFEH4INTC0Fc1teuPky/G4Oe7wbID2tYTQJkRuftHz2+4WBo+suCvSDi/znk9fTxe/33I85gD1OIA
 zAGWtbMEgrN7xRZ2ckHbRDt6XJmNHVvNNXsAZP8tLIhcY1Fiw5xmJvuxDlUhL2W8HnUxyUM5gdI5oTsiiSu//Cf4pmUX0qnYpVZxhYjEXHGXooDDUKZfB+tp
 O+7KBhTEnuFFIm96oBK6Lg1r5jFxMUW9p9J1xR+ajL+/o9Ywss7rmMCL7d2lvniQIMeXdNkCuW3WRbLMO2M28M7lWE7jDQFBVjN84NXZsZkTNnVib5yjkTOO
 PyplP3HwuvOKdXZv47Pi4Zq2AZCPyCUTsElqhKHdlE8lGhw873Q=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/23/19 2:37 PM, Ricardo Ribalda Delgado wrote:
> This control returns the unit cell size in nanometres. The struct provides
> the width and the height in separated fields to take into consideration
> asymmetric pixels and/or hardware binning.
> This control is required for automatic calibration of sensors/cameras.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
> v3:
> -Put together all actions on ctrl_fill
> -Move the control to IMAGE_SOURCE
> 
>  drivers/media/v4l2-core/v4l2-ctrls.c | 11 +++++++++++
>  include/media/v4l2-ctrls.h           |  2 ++
>  include/uapi/linux/v4l2-controls.h   |  1 +
>  include/uapi/linux/videodev2.h       | 11 +++++++++++
>  4 files changed, 25 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 1d8f38824631..b3bf458df7f7 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -994,6 +994,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
> +	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
>  
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1375,6 +1376,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
>  		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
>  		break;
> +	case V4L2_CID_UNIT_CELL_SIZE:
> +		*type = V4L2_CTRL_TYPE_AREA;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> @@ -1723,6 +1728,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>  		break;
>  
> +	case V4L2_CTRL_TYPE_AREA:

You need to check that the width and height are not 0 (that would make no sense).

> +		break;
> +
>  	case V4L2_CTRL_TYPE_H264_SPS:
>  	case V4L2_CTRL_TYPE_H264_PPS:
>  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> @@ -2421,6 +2429,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
>  		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
>  		break;
> +	case V4L2_CTRL_TYPE_AREA:
> +		elem_size = sizeof(struct v4l2_area);
> +		break;
>  	default:
>  		if (type < V4L2_CTRL_COMPOUND_TYPES)
>  			elem_size = sizeof(s32);
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 570ff4b0205a..9a3d11350e67 100644
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
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index a2669b79b294..5a7bedee2b0e 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1034,6 +1034,7 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN_GREENR		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 5)
>  #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
>  #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
> +#define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
>  
>  
>  /* Image processing controls */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..05cfc69d7ed6 100644
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
> @@ -1720,6 +1725,12 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U8	     = 0x0100,
>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
> +	/*
> +	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS = 0x0103,
> +	 * V4L2_CTRL_TYPE_MPEG2_QUANTIZATION = 0x0104,
> +	 * V4L2_CTRL_TYPE_FWHT_PARAMS = 0x0105,
> +	 */

I'd drop this comment. Not because it is wrong as such, but it is
incomplete (there are more of these types today) and I think these
types (most of them in staging) need a bit of a cleanup. Something
I want to look at for the next kernel cycle.

> +	V4L2_CTRL_TYPE_AREA    = 0x0106,
>  };
>  
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> 

Regards,

	Hans
