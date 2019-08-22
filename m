Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2522498CB7
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 09:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730979AbfHVH4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 03:56:25 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:37435 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725799AbfHVH4Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 03:56:25 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 0hxCiaUu9Thuu0hxFij4sI; Thu, 22 Aug 2019 09:56:22 +0200
Subject: Re: [PATCH v2 1/3] media: add V4L2_CID_UNIT_CELL_SIZE control
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190820094027.4144-1-ribalda@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <58ea3b45-1936-7326-5064-e2ac2a862b81@xs4all.nl>
Date:   Thu, 22 Aug 2019 09:56:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190820094027.4144-1-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKgjC887wzIfi44vqDnXdGcskFyB4NBnkDhIJF/p0Y1w/SHkGHJbp/xQR/mRdpM447xV7ErGWTz3kpydEcWWetLPDxHW+GIVzBIYjrt3Ovyy5vcvSZp3
 2jQw3UWiVOZ4W4LxsN+WmJH7ZrBewXq3doOVvAgenidciV+a9IlVRBQ36EkyI726ngvSzMrYiO/R4tpsEA3/SqdfeYyfDNhG8YSPl2wsLzWTPqq/rffBjP7L
 FegziwyDCq7i1B7nPQZDVipFoHOSEg153RTMHbUjBvxfqLLwJDoapWWwbHdAndcKScDvZMyFeZ/EbIfJDQskYRVq6vStg9XYCPwOadgTt3F5tLuygnQZBsfM
 LXWDZ6KE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/20/19 11:40 AM, Ricardo Ribalda Delgado wrote:
> This control returns the unit cell size in nanometres. The struct provides
> the width and the height in separated fields to take into consideration
> asymmetric pixels and/or hardware binning.
> This control is required for automatic calibration of sensors/cameras.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 11 +++++++++++
>  include/media/v4l2-ctrls.h           |  2 ++
>  include/uapi/linux/v4l2-controls.h   |  3 +++
>  include/uapi/linux/videodev2.h       | 11 +++++++++++
>  4 files changed, 27 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index cd1ae016706f..ec949453a081 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -978,6 +978,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
> +	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
>  
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1357,6 +1358,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
>  		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
>  		break;
> +	case V4L2_CID_UNIT_CELL_SIZE:
> +		*type = V4L2_CTRL_TYPE_AREA;
> +		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> @@ -1423,6 +1427,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT:
>  	case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:
>  	case V4L2_CID_RDS_RX_MUSIC_SPEECH:
> +	case V4L2_CID_UNIT_CELL_SIZE:
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  		break;
>  	case V4L2_CID_RF_TUNER_PLL_LOCK:
> @@ -1705,6 +1710,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>  		break;
>  
> +	case V4L2_CTRL_TYPE_AREA:
> +		break;
> +
>  	case V4L2_CTRL_TYPE_H264_SPS:
>  	case V4L2_CTRL_TYPE_H264_PPS:
>  	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> @@ -2403,6 +2411,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
> index a2669b79b294..1332eabd27b1 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -912,6 +912,9 @@ enum v4l2_auto_focus_range {
>  #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
>  #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
>  
> +#define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_CAMERA_CLASS_BASE+34)
> +
> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 2427bc4d8eba..751e2065ac02 100644
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
> @@ -1718,6 +1723,12 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U8	     = 0x0100,
>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
> +	/*
> +	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS = 0x0103,
> +	 * V4L2_CTRL_TYPE_MPEG2_QUANTIZATION = 0x0104,
> +	 * V4L2_CTRL_TYPE_FWHT_PARAMS = 0x0105,
> +	 */
> +	V4L2_CTRL_TYPE_AREA    = 0x0106,

This new type should be documented.

Regards,

	Hans

>  };
>  
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> 

