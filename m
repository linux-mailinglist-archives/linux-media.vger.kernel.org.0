Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F414C77533C
	for <lists+linux-media@lfdr.de>; Wed,  9 Aug 2023 08:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjHIGvy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 02:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjHIGvx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 02:51:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B9B10CF
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 23:51:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CBB9662F9E
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 06:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64C5C433C7;
        Wed,  9 Aug 2023 06:51:49 +0000 (UTC)
Message-ID: <3bba5445-4a9a-af9c-ea5d-82be3ab0468b@xs4all.nl>
Date:   Wed, 9 Aug 2023 08:51:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v11 01/11] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Content-Language: en-US, nl
To:     Yunke Cao <yunkec@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20230426082923.132909-1-yunkec@google.com>
 <20230426082923.132909-2-yunkec@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230426082923.132909-2-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/04/2023 10:29, Yunke Cao wrote:
> Add p_rect to struct v4l2_ext_control with basic support in
> v4l2-ctrls.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Yunke Cao <yunkec@google.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
> Changelog since v10:
> - Added reviewed-by from Sergey and Daniel.
> Changelog since v9:
> - No Change.
> Changelog since v8:
> - No change.
> Changelog since v7:
> - Document V4L2_CTRL_TYPE_RECT in vidioc-queryctrl.rst.
> - Rebased to media-stage master.
> - Do not assign each field in std_equal
> 
>  .../media/v4l/vidioc-g-ext-ctrls.rst              |  4 ++++
>  .../userspace-api/media/v4l/vidioc-queryctrl.rst  |  7 +++++++
>  .../media/videodev2.h.rst.exceptions              |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c         | 15 +++++++++++++++
>  include/media/v4l2-ctrls.h                        |  2 ++
>  include/uapi/linux/videodev2.h                    |  2 ++
>  6 files changed, 31 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index 892cfeb8b988..927ef397f1ce 100644
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
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index a20dfa2a933b..58982cd382e3 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -441,6 +441,13 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_area`, containing the width and the height
>          of a rectangular area. Units depend on the use case.
> +    * - ``V4L2_CTRL_TYPE_RECT``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_rect`, containing a rectangle described by
> +	the position of its top-left corner, the width and the height. Units
> +	depend on the use case.
>      * - ``V4L2_CTRL_TYPE_H264_SPS``
>        - n/a
>        - n/a
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 2a589d34b80e..828cca8e2daa 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -150,6 +150,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 29169170880a..e7f232842376 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -350,6 +350,11 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
>  		pr_cont("HEVC_DECODE_PARAMS");
>  		break;
> +	case V4L2_CTRL_TYPE_RECT:
> +		pr_cont("%ux%u@%dx%d",
> +			ptr.p_rect->width, ptr.p_rect->height,
> +			ptr.p_rect->left, ptr.p_rect->top);
> +		break;
>  	default:
>  		pr_cont("unknown type %d", ctrl->type);
>  		break;
> @@ -569,6 +574,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
>  	struct v4l2_area *area;
> +	struct v4l2_rect *rect;
>  	void *p = ptr.p + idx * ctrl->elem_size;
>  	unsigned int i;
>  
> @@ -918,6 +924,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
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
> @@ -1605,6 +1617,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
> index e59d9a234631..1846caf9dd53 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -52,6 +52,7 @@ struct video_device;
>   * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
>   * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display structure.
>   * @p_area:			Pointer to an area.
> + * @p_rect:			Pointer to a rectangle.
>   * @p:				Pointer to a compound value.
>   * @p_const:			Pointer to a constant compound value.
>   */
> @@ -81,6 +82,7 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
>  	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_area *p_area;
> +	struct v4l2_rect *p_rect;
>  	void *p;
>  	const void *p_const;
>  };
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 17a9b975177a..ce2bd9ac4c47 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1797,6 +1797,7 @@ struct v4l2_ext_control {
>  		__u32 __user *p_s32;
>  		__u32 __user *p_s64;
>  		struct v4l2_area __user *p_area;
> +		struct v4l2_rect __user *p_rect;
>  		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
>  		struct v4l2_ctrl_h264_pps *p_h264_pps;
>  		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
> @@ -1861,6 +1862,7 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
>  	V4L2_CTRL_TYPE_AREA          = 0x0106,
> +	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>  
>  	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
>  	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,

