Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4599D2F2C7D
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 11:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404524AbhALKSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 05:18:20 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:39803 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727053AbhALKST (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 05:18:19 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zGk0kDf9FVfyLzGk3kp6Bd; Tue, 12 Jan 2021 11:17:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610446655; bh=BvimkMfLcHGMoc07KAwPIZpzvCmAEbR/EJ40smYhPZM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lZzAXJE7rDGnwQrfaWzl8tssRj8GyE/D80oq08tX/QYPPOUPULmY1QyrFdIDULHyS
         ojapb5vXkx2ohon8c2e8z0M99B0HvHLEC2mWAzuvSFljCNOOSntGbEH1c94O5EW+Lp
         mN+U2xGhb9JM4B1wfX76CkZa5FTZnMtgyXmYBxtm9uJvOrWdahVlps/9i2ygue7Cfu
         XzBBWU+wKza9nAl/lt28txmFBl0xKs2onoJ42XAi108pZoDIN950WqbxWBtl/Lv/s/
         okqhqW2tV4JiyA4PRMzwwNsNNC63zUOg0f/zyjOCgblCT45XdTD0KtvkUFT7FOAOVU
         SWSDqBoTc1tKg==
Subject: Re: [PATCH v3 1/3] v4l: Add HDR10 static metadata controls
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20201208145931.6187-1-stanimir.varbanov@linaro.org>
 <20201208145931.6187-2-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <dcfafee3-9ac8-3f00-3f1d-82fa916abf1a@xs4all.nl>
Date:   Tue, 12 Jan 2021 11:17:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201208145931.6187-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDFxN3iFfB16jOihL7StkkuHV4WdOhi9w6ZbaqhBNhtrHorRMPPrmHyOMrjzpPjvhSdpHbAUF8grmtZ8CnzAOsctc8ZMvcKBkIpAxYSG3q4Ugb+Q1j51
 Tqg5NdCYwEzu/tTOqX/WPRvci0WgEZsY2gM470l4JPlDQWSTvJxmQO3V4Lpifjt279w7wgV5uUxyabYj8tC838/tpDIj94zuiA2cAs+Keha9paEzDFLnHhCB
 BtVxZtuA9Qd4TfAKgKJIgUVAncP++8fR7TaO81FCPShSfE9ax/TCsK5rFUqcTxoBayJ8XHptEpMo1ISPhTi92X6U1ra1B6sv5wn8461TK/ri1bf89I2uDZ8h
 1ikRYZjcVfKDffd6TKk6Hi7hkvjhSWWozK1V1KCrPkO64sAIvOyGfeytwKiVN7Z/ia2+5t5t
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/12/2020 15:59, Stanimir Varbanov wrote:
> Here we introduce a new Colorimetry control class and add
> Content light level and Mastering display colour volume v4l2
> compound controls, relevant payload structures and validation.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../media/videodev2.h.rst.exceptions          |  2 +
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 68 +++++++++++++++++++
>  include/media/v4l2-ctrls.h                    |  4 ++
>  include/uapi/linux/v4l2-controls.h            | 35 ++++++++++
>  include/uapi/linux/videodev2.h                |  2 +
>  5 files changed, 111 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 0ed170c6e720..af4b8b87c5d7 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -147,6 +147,8 @@ replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`v4l2_ctrl_hdr10_cll_info`
> +replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`v4l2_ctrl_hdr10_mastering_display`
>  
>  # V4L2 capability defines
>  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 5cbe0ffbf501..7bd6c3098f30 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1015,6 +1015,9 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
>  
> +	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
> +	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
> +
>  	/* CAMERA controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
>  	case V4L2_CID_CAMERA_CLASS:		return "Camera Controls";
> @@ -1466,6 +1469,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
>  		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
>  		break;
> +	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:
> +		*type = V4L2_CTRL_TYPE_HDR10_CLL_INFO;
> +		break;
> +	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> +		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> +		break;
>  	case V4L2_CID_UNIT_CELL_SIZE:
>  		*type = V4L2_CTRL_TYPE_AREA;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> @@ -1765,6 +1774,12 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_FWHT_PARAMS:
>  		pr_cont("FWHT_PARAMS");
>  		break;
> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> +		pr_cont("HDR10_CLL_INFO");
> +		break;
> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
> +		pr_cont("HDR10_MASTERING_DISPLAY");
> +		break;
>  	default:
>  		pr_cont("unknown type %d", ctrl->type);
>  		break;

I'm missing support for the new V4L2_CID_COLORIMETRY_CLASS here.

Please split up this patch in two parts: the first adds the new class, the
second adds the new controls in that class.

Ditto for the documentation. I recommend that you do a grep for e.g.
V4L2_CID_DETECT_CLASS to see all the places where you need to add something
for this new class.

> @@ -1817,6 +1832,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_area *area;
>  	void *p = ptr.p + idx * ctrl->elem_size;
>  	unsigned int i;
> @@ -2112,6 +2128,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		zero_padding(*p_hevc_slice_params);
>  		break;
>  
> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> +		break;
> +
> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
> +		p_hdr10_mastering = p;
> +
> +		for (i = 0; i < 3; ++i) {
> +			if (p_hdr10_mastering->display_primaries_x[i] <
> +				V4L2_HDR10_MASTERING_PRIMARIES_X_LOW ||
> +			    p_hdr10_mastering->display_primaries_x[i] >
> +				V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH ||
> +			    p_hdr10_mastering->display_primaries_y[i] <
> +				V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW ||
> +			    p_hdr10_mastering->display_primaries_y[i] >
> +				V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH)
> +				return -EINVAL;
> +		}
> +
> +		if (p_hdr10_mastering->white_point_x <
> +			V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW ||
> +		    p_hdr10_mastering->white_point_x >
> +			V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH ||
> +		    p_hdr10_mastering->white_point_y <
> +			V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW ||
> +		    p_hdr10_mastering->white_point_y >
> +			V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH)
> +			return -EINVAL;
> +
> +		if (p_hdr10_mastering->max_display_mastering_luminance <
> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
> +		    p_hdr10_mastering->max_display_mastering_luminance >
> +			V4L2_HDR10_MASTERING_MAX_LUMA_HIGH ||
> +		    p_hdr10_mastering->min_display_mastering_luminance <
> +			V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
> +		    p_hdr10_mastering->min_display_mastering_luminance >
> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
> +			return -EINVAL;
> +
> +		if (p_hdr10_mastering->max_display_mastering_luminance ==
> +			V4L2_HDR10_MASTERING_MAX_LUMA_LOW &&
> +		    p_hdr10_mastering->min_display_mastering_luminance ==
> +			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
> +			return -EINVAL;
> +
> +		break;
> +
>  	case V4L2_CTRL_TYPE_AREA:
>  		area = p;
>  		if (!area->width || !area->height)
> @@ -2804,6 +2866,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>  		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
>  		break;
> +	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> +		elem_size = sizeof(struct v4l2_ctrl_hdr10_cll_info);
> +		break;
> +	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
> +		elem_size = sizeof(struct v4l2_ctrl_hdr10_mastering_display);
> +		break;
>  	case V4L2_CTRL_TYPE_AREA:
>  		elem_size = sizeof(struct v4l2_area);
>  		break;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 167ca8c8424f..8308acc89b11 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -54,6 +54,8 @@ struct video_device;
>   * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
>   * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
>   * @p_hevc_slice_params:	Pointer to an HEVC slice parameters structure.
> + * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
> + * @p_hdr10_mastering	:	Pointer to an HDR10 Mastering Display structure.
>   * @p_area:			Pointer to an area.
>   * @p:				Pointer to a compound value.
>   * @p_const:			Pointer to a constant compound value.
> @@ -78,6 +80,8 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
> +	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_area *p_area;
>  	void *p;
>  	const void *p_const;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 823b214aac0c..8563f789cbe2 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -66,6 +66,7 @@
>  #define V4L2_CTRL_CLASS_RF_TUNER	0x00a20000	/* RF tuner controls */
>  #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
>  #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
> +#define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
>  
>  /* User-class control IDs */
>  
> @@ -1635,6 +1636,40 @@ struct v4l2_ctrl_fwht_params {
>  	__u32 quantization;
>  };
>  
> +#define V4L2_CID_COLORIMETRY_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
> +#define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
> +
> +#define V4L2_CID_COLORIMETRY_HDR10_CLL_INFO	(V4L2_CID_COLORIMETRY_BASE + 0)
> +
> +struct v4l2_ctrl_hdr10_cll_info {
> +	__u16 max_content_light_level;
> +	__u16 max_pic_average_light_level;
> +};
> +
> +#define V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY	(V4L2_CID_COLORIMETRY_BASE + 1)
> +
> +#define V4L2_HDR10_MASTERING_PRIMARIES_X_LOW	5
> +#define V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH	37000
> +#define V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW	5
> +#define V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH	42000
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW	5
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH	37000
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW	5
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH	42000
> +#define V4L2_HDR10_MASTERING_MAX_LUMA_LOW	50000
> +#define V4L2_HDR10_MASTERING_MAX_LUMA_HIGH	100000000
> +#define V4L2_HDR10_MASTERING_MIN_LUMA_LOW	1
> +#define V4L2_HDR10_MASTERING_MIN_LUMA_HIGH	50000
> +
> +struct v4l2_ctrl_hdr10_mastering_display {
> +	__u16 display_primaries_x[3];
> +	__u16 display_primaries_y[3];
> +	__u16 white_point_x;
> +	__u16 white_point_y;
> +	__u32 max_display_mastering_luminance;
> +	__u32 min_display_mastering_luminance;
> +};
> +
>  /* MPEG-compression definitions kept for backwards compatibility */
>  #ifndef __KERNEL__
>  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 79dbde3bcf8d..1bde498e36a0 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1792,6 +1792,8 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_H264_PRED_WEIGHTS    = 0x0205,
>  
>  	V4L2_CTRL_TYPE_FWHT_PARAMS	    = 0x0220,
> +	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0221,

I'd change this to 0x0110 and move it up to after V4L2_CTRL_TYPE_AREA.

> +	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0222,
>  };
>  
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> 

Regards,

	Hans
