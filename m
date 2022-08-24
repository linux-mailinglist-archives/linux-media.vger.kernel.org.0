Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0D8859F574
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 10:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbiHXIlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 04:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234260AbiHXIlB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 04:41:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9790C140CE
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 01:40:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0DDB2B3;
        Wed, 24 Aug 2022 10:40:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661330456;
        bh=hQzeVL5gGjm0HYD0m9/mJ8pTtpsZPU0JHXA3ihoKcaE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S8KxpxQL5aOFbLPVv8CXZ2F8XYLTqXSXaZWA1fb7EyezFRvv3SlLxcZN7hY3hcvXx
         Z65YSSyRUEkknqYkic6u79wGrBh3s5Ns8Pp9cHtZDNIwlRz/RhkJbO/QAfm1++wZmH
         6HKV8cIAsDVRzBzCLwGh0t3mjCtCwJ0nj739B80A=
Date:   Wed, 24 Aug 2022 11:40:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v7 1/7] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Message-ID: <YwXkEWDnXIhkfgzb@pendragon.ideasonboard.com>
References: <20220628075705.2278044-1-yunkec@google.com>
 <20220628075705.2278044-2-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628075705.2278044-2-yunkec@google.com>
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

On Tue, Jun 28, 2022 at 04:56:59PM +0900, Yunke Cao wrote:
> Add p_rect to struct v4l2_ext_control with basic support in
> v4l2-ctrls.

This looks good to me, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'm no expert on the V4L2 control framework though, a review from Hans
would be useful.

> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++++
>  .../media/videodev2.h.rst.exceptions          |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
>  include/media/v4l2-ctrls.h                    |  2 ++
>  include/uapi/linux/videodev2.h                |  2 ++
>  5 files changed, 29 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index 29971a45a2d4..7473baa4e977 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -189,6 +189,10 @@ still cause this situation.
>        - ``p_area``
>        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
>          of type ``V4L2_CTRL_TYPE_AREA``.
> +    * - struct :c:type:`v4l2_rect` *
> +      - ``p_rect``
> +      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
> +        of type ``V4L2_CTRL_TYPE_RECT``.
>      * - struct :c:type:`v4l2_ctrl_h264_sps` *
>        - ``p_h264_sps``
>        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 9cbb7a0c354a..7b423475281d 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -147,6 +147,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 949c1884d9c1..35d43ba650db 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -84,6 +84,11 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
>  		return ptr1.p_u16[idx] == ptr2.p_u16[idx];
>  	case V4L2_CTRL_TYPE_U32:
>  		return ptr1.p_u32[idx] == ptr2.p_u32[idx];
> +	case V4L2_CTRL_TYPE_RECT:
> +		return ptr1.p_rect->top == ptr2.p_rect->top &&
> +		       ptr1.p_rect->left == ptr2.p_rect->left &&
> +		       ptr1.p_rect->height == ptr2.p_rect->height &&
> +		       ptr1.p_rect->width == ptr2.p_rect->width;
>  	default:
>  		if (ctrl->is_int)
>  			return ptr1.p_s32[idx] == ptr2.p_s32[idx];
> @@ -307,6 +312,11 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_VP9_FRAME:
>  		pr_cont("VP9_FRAME");
>  		break;
> +	case V4L2_CTRL_TYPE_RECT:
> +		pr_cont("%ux%u@%dx%d",
> +			ptr.p_rect->width, ptr.p_rect->height,
> +			ptr.p_rect->left, ptr.p_rect->top);
> +		break;
>  	default:
>  		pr_cont("unknown type %d", ctrl->type);
>  		break;
> @@ -525,6 +535,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
>  	struct v4l2_area *area;
> +	struct v4l2_rect *rect;
>  	void *p = ptr.p + idx * ctrl->elem_size;
>  	unsigned int i;
>  
> @@ -888,6 +899,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  			return -EINVAL;
>  		break;
>  
> +	case V4L2_CTRL_TYPE_RECT:
> +		rect = p;
> +		if (!rect->width || !rect->height)
> +			return -EINVAL;
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1455,6 +1472,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_AREA:
>  		elem_size = sizeof(struct v4l2_area);
>  		break;
> +	case V4L2_CTRL_TYPE_RECT:
> +		elem_size = sizeof(struct v4l2_rect);
> +		break;
>  	default:
>  		if (type < V4L2_CTRL_COMPOUND_TYPES)
>  			elem_size = sizeof(s32);
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index b3ce438f1329..919e104de50b 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -58,6 +58,7 @@ struct video_device;
>   * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
>   * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display structure.
>   * @p_area:			Pointer to an area.
> + * @p_rect:			Pointer to a rectangle.
>   * @p:				Pointer to a compound value.
>   * @p_const:			Pointer to a constant compound value.
>   */
> @@ -87,6 +88,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
>  	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_area *p_area;
> +	struct v4l2_rect *p_rect;
>  	void *p;
>  	const void *p_const;
>  };
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 343b95107fce..2e36bb610ea6 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1754,6 +1754,7 @@ struct v4l2_ext_control {
>  		__u16 __user *p_u16;
>  		__u32 __user *p_u32;
>  		struct v4l2_area __user *p_area;
> +		struct v4l2_rect __user *p_rect;
>  		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
>  		struct v4l2_ctrl_h264_pps *p_h264_pps;
>  		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
> @@ -1813,6 +1814,7 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
>  	V4L2_CTRL_TYPE_AREA          = 0x0106,
> +	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>  
>  	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
>  	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,

-- 
Regards,

Laurent Pinchart
