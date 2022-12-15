Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C96964D9BA
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 11:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiLOKtD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 05:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiLOKtA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 05:49:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389462BB0F
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 02:48:58 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0834327;
        Thu, 15 Dec 2022 11:48:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671101336;
        bh=nmS9750fU+m5rMVPA4j0k3ADhTY/MC0xZxg+dR3DX34=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=eJAVotw4exKovk5no9Dy7F9vYILzsu5aH9g1DA+2czPQvRGFIOfE85XAG003U4USt
         G/xCaaWFKNc5tWX9/YGE5n7BDS4W60pa9/u5i0G2LlkFZOVf8xHxGWMyLgyMg3GiWP
         z3//2YLEJ9g6/yHYB906DpXv5g3RySNvXj1ErMfI=
Message-ID: <f1e6c073-6fca-658c-0060-aa4f9c4ec72f@ideasonboard.com>
Date:   Thu, 15 Dec 2022 10:48:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20221109060621.704531-1-yunkec@google.com>
 <20221109060621.704531-2-yunkec@google.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v10 01/11] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
In-Reply-To: <20221109060621.704531-2-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke

On 09/11/2022 06:06, Yunke Cao wrote:
> Add p_rect to struct v4l2_ext_control with basic support in
> v4l2-ctrls.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> Changelog since v9:
> - No Change.
> Changelog since v8:
> - No change.
> Changelog since v7:
> - Document V4L2_CTRL_TYPE_RECT in vidioc-queryctrl.rst.
> - Rebased to media-stage master.
> - Do not assign each field in std_equal.
>
>   .../media/v4l/vidioc-g-ext-ctrls.rst              |  4 ++++
>   .../userspace-api/media/v4l/vidioc-queryctrl.rst  |  7 +++++++
>   .../media/videodev2.h.rst.exceptions              |  1 +
>   drivers/media/v4l2-core/v4l2-ctrls-core.c         | 15 +++++++++++++++
>   include/media/v4l2-ctrls.h                        |  2 ++
>   include/uapi/linux/videodev2.h                    |  2 ++
>   6 files changed, 31 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index 892cfeb8b988..927ef397f1ce 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -189,6 +189,10 @@ still cause this situation.
>         - ``p_area``
>         - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
>           of type ``V4L2_CTRL_TYPE_AREA``.
> +    * - struct :c:type:`v4l2_rect` *
> +      - ``p_rect``
> +      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
> +        of type ``V4L2_CTRL_TYPE_RECT``.
>       * - struct :c:type:`v4l2_ctrl_h264_sps` *
>         - ``p_h264_sps``
>         - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index a20dfa2a933b..58982cd382e3 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -441,6 +441,13 @@ See also the examples in :ref:`control`.
>         - n/a
>         - A struct :c:type:`v4l2_area`, containing the width and the height
>           of a rectangular area. Units depend on the use case.
> +    * - ``V4L2_CTRL_TYPE_RECT``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_rect`, containing a rectangle described by
> +	the position of its top-left corner, the width and the height. Units
> +	depend on the use case.
>       * - ``V4L2_CTRL_TYPE_H264_SPS``
>         - n/a
>         - n/a
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 2a589d34b80e..828cca8e2daa 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -150,6 +150,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
>   replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 0dab1d7b90f0..0ac36ebc45dd 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -350,6 +350,11 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>   	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
>   		pr_cont("HEVC_DECODE_PARAMS");
>   		break;
> +	case V4L2_CTRL_TYPE_RECT:
> +		pr_cont("%ux%u@%dx%d",
> +			ptr.p_rect->width, ptr.p_rect->height,
> +			ptr.p_rect->left, ptr.p_rect->top);
> +		break;
>   	default:
>   		pr_cont("unknown type %d", ctrl->type);
>   		break;
> @@ -569,6 +574,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>   	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>   	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
>   	struct v4l2_area *area;
> +	struct v4l2_rect *rect;
>   	void *p = ptr.p + idx * ctrl->elem_size;
>   	unsigned int i;
>   
> @@ -918,6 +924,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>   			return -EINVAL;
>   		break;
>   
> +	case V4L2_CTRL_TYPE_RECT:
> +		rect = p;
> +		if (!rect->width || !rect->height)
> +			return -EINVAL;
> +		break;
> +
>   	default:
>   		return -EINVAL;
>   	}
> @@ -1605,6 +1617,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>   	case V4L2_CTRL_TYPE_AREA:
>   		elem_size = sizeof(struct v4l2_area);
>   		break;
> +	case V4L2_CTRL_TYPE_RECT:
> +		elem_size = sizeof(struct v4l2_rect);
> +		break;
>   	default:
>   		if (type < V4L2_CTRL_COMPOUND_TYPES)
>   			elem_size = sizeof(s32);
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index e59d9a234631..1846caf9dd53 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -52,6 +52,7 @@ struct video_device;
>    * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
>    * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display structure.
>    * @p_area:			Pointer to an area.
> + * @p_rect:			Pointer to a rectangle.
>    * @p:				Pointer to a compound value.
>    * @p_const:			Pointer to a constant compound value.
>    */
> @@ -81,6 +82,7 @@ union v4l2_ctrl_ptr {
>   	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
>   	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>   	struct v4l2_area *p_area;
> +	struct v4l2_rect *p_rect;
>   	void *p;
>   	const void *p_const;
>   };
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 29da1f4b4578..be04a7e28836 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1781,6 +1781,7 @@ struct v4l2_ext_control {
>   		__u16 __user *p_u16;
>   		__u32 __user *p_u32;
>   		struct v4l2_area __user *p_area;
> +		struct v4l2_rect __user *p_rect;
>   		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
>   		struct v4l2_ctrl_h264_pps *p_h264_pps;
>   		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
> @@ -1845,6 +1846,7 @@ enum v4l2_ctrl_type {
>   	V4L2_CTRL_TYPE_U16	     = 0x0101,
>   	V4L2_CTRL_TYPE_U32	     = 0x0102,
>   	V4L2_CTRL_TYPE_AREA          = 0x0106,
> +	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>   
>   	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
>   	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
