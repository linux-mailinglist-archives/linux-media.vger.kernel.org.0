Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D57C259F5BB
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 10:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236065AbiHXIus (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 04:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236164AbiHXIuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 04:50:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD3173923
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 01:50:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 37A59B822BC
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 08:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7077CC433D7;
        Wed, 24 Aug 2022 08:50:34 +0000 (UTC)
Message-ID: <7b59fffc-fb69-dc87-c3cf-4e01632154f4@xs4all.nl>
Date:   Wed, 24 Aug 2022 10:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 1/7] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20220628075705.2278044-1-yunkec@google.com>
 <20220628075705.2278044-2-yunkec@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220628075705.2278044-2-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

You will need to rebase this since some of the v4l2-ctrl internals
have changed.

On 28/06/2022 09:56, Yunke Cao wrote:
> Add p_rect to struct v4l2_ext_control with basic support in
> v4l2-ctrls.
> 
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

You also need to update Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst.

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

You don't need to do anything here, it will fallback to a memcmp, and
that's fine for struct v4l2_rect.

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

Regards,

	Hans
