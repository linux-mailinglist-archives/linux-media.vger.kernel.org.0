Return-Path: <linux-media+bounces-1950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9560D80A492
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5015B2814C7
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 13:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6341D54D;
	Fri,  8 Dec 2023 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QYAJWnpY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E63172B
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 05:41:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9AF0552;
	Fri,  8 Dec 2023 14:40:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702042837;
	bh=3osJeJCqJtcakt26dvhKd1WKeD1g/4pIs01mVV4F+cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYAJWnpYdTafvPKHRcKGMng9A/6/1Xw/uO7j+gRUCEy3YDXkRWwjkEiUuTK/vBYrB
	 g4vfuzxWbu0qOEeaaX9a7VnH6hwl1gz+FtMRi89cf8tUeUcmPX4DX3/HymwNfx7Gy+
	 YswnrdoHYPipu5ESVRhQANyMkUSR2/9Wfxt+flmk=
Date: Fri, 8 Dec 2023 15:41:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Yunke Cao <yunkec@google.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v14 01/11] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Message-ID: <20231208134125.GG25616@pendragon.ideasonboard.com>
References: <20231201071907.3080126-1-yunkec@google.com>
 <20231201071907.3080126-2-yunkec@google.com>
 <a328cfe8-cf87-4260-aad1-933f7a6057cf@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a328cfe8-cf87-4260-aad1-933f7a6057cf@xs4all.nl>

Hi Hans,

On Fri, Dec 01, 2023 at 09:35:21AM +0100, Hans Verkuil wrote:
> On 01/12/2023 08:18, Yunke Cao wrote:
> > Add p_rect to struct v4l2_ext_control with basic support in
> > v4l2-ctrls.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> > Changelog since v12:
> > - No Change.
> > Changelog since v11:
> > - Added reviewed-by from Hans
> > Changelog since v10:
> > - Added reviewed-by from Sergey and Daniel.
> > Changelog since v9:
> > - No Change.
> > Changelog since v8:
> > - No change.
> > Changelog since v7:
> > - Document V4L2_CTRL_TYPE_RECT in vidioc-queryctrl.rst.
> > - Rebased to media-stage master.
> > - Do not assign each field in std_equal
> > 
> >  .../media/v4l/vidioc-g-ext-ctrls.rst             |  4 ++++
> >  .../userspace-api/media/v4l/vidioc-queryctrl.rst |  7 +++++++
> >  .../media/videodev2.h.rst.exceptions             |  1 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c        | 16 +++++++++++++++-
> >  include/media/v4l2-ctrls.h                       |  2 ++
> >  include/uapi/linux/videodev2.h                   |  2 ++
> >  6 files changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > index f9f73530a6be..7b1001d11f9c 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > @@ -199,6 +199,10 @@ still cause this situation.
> >        - ``p_area``
> >        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
> >          of type ``V4L2_CTRL_TYPE_AREA``.
> > +    * - struct :c:type:`v4l2_rect` *
> > +      - ``p_rect``
> > +      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
> > +        of type ``V4L2_CTRL_TYPE_RECT``.
> >      * - struct :c:type:`v4l2_ctrl_h264_sps` *
> >        - ``p_h264_sps``
> >        - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > index 4d38acafe8e1..56d5c8b0b88b 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > @@ -441,6 +441,13 @@ See also the examples in :ref:`control`.
> >        - n/a
> >        - A struct :c:type:`v4l2_area`, containing the width and the height
> >          of a rectangular area. Units depend on the use case.
> > +    * - ``V4L2_CTRL_TYPE_RECT``
> > +      - n/a
> > +      - n/a
> > +      - n/a
> > +      - A struct :c:type:`v4l2_rect`, containing a rectangle described by
> > +	the position of its top-left corner, the width and the height. Units
> > +	depend on the use case.
> >      * - ``V4L2_CTRL_TYPE_H264_SPS``
> >        - n/a
> >        - n/a
> > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > index 3e58aac4ef0b..c46082ef0e4d 100644
> > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > @@ -150,6 +150,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> > +replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index a662fb60f73f..f1486ab032cf 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -367,7 +367,11 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
> >  	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
> >  		pr_cont("AV1_FILM_GRAIN");
> >  		break;
> > -
> > +	case V4L2_CTRL_TYPE_RECT:
> > +		pr_cont("%ux%u@%dx%d",
> > +			ptr.p_rect->width, ptr.p_rect->height,
> > +			ptr.p_rect->left, ptr.p_rect->top);
> > +		break;
> >  	default:
> >  		pr_cont("unknown type %d", ctrl->type);
> >  		break;
> > @@ -812,6 +816,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >  	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> >  	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> >  	struct v4l2_area *area;
> > +	struct v4l2_rect *rect;
> >  	void *p = ptr.p + idx * ctrl->elem_size;
> >  	unsigned int i;
> >  
> > @@ -1169,6 +1174,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >  			return -EINVAL;
> >  		break;
> >  
> > +	case V4L2_CTRL_TYPE_RECT:
> > +		rect = p;
> > +		if (!rect->width || !rect->height)
> > +			return -EINVAL;
> > +		break;
> > +
> >  	default:
> >  		return -EINVAL;
> >  	}
> > @@ -1868,6 +1879,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >  	case V4L2_CTRL_TYPE_AREA:
> >  		elem_size = sizeof(struct v4l2_area);
> >  		break;
> > +	case V4L2_CTRL_TYPE_RECT:
> > +		elem_size = sizeof(struct v4l2_rect);
> > +		break;
> >  	default:
> >  		if (type < V4L2_CTRL_COMPOUND_TYPES)
> >  			elem_size = sizeof(s32);
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index 59679a42b3e7..b0db167a3ac4 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -56,6 +56,7 @@ struct video_device;
> >   * @p_av1_tile_group_entry:	Pointer to an AV1 tile group entry structure.
> >   * @p_av1_frame:		Pointer to an AV1 frame structure.
> >   * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
> > + * @p_rect:			Pointer to a rectangle.
> >   * @p:				Pointer to a compound value.
> >   * @p_const:			Pointer to a constant compound value.
> >   */
> > @@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
> >  	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
> >  	struct v4l2_ctrl_av1_frame *p_av1_frame;
> >  	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
> > +	struct v4l2_rect *p_rect;
> >  	void *p;
> >  	const void *p_const;
> >  };
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index c3d4e490ce7c..82d86abcf89c 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -1815,6 +1815,7 @@ struct v4l2_ext_control {
> >  		__s32 __user *p_s32;
> >  		__s64 __user *p_s64;
> >  		struct v4l2_area __user *p_area;
> > +		struct v4l2_rect __user *p_rect;
> >  		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
> >  		struct v4l2_ctrl_h264_pps *p_h264_pps;
> >  		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
> 
> This will probably not apply cleanly anymore to the latest staging tree due
> to a change to this struct that was merged there.
> 
> Laurent, are you planning to make a PR for this? If so, then you can fix this
> up yourself, ditto for the very small typo in patch 06/11 that I found.

'git am' complained indeed, but 'patch' was happy with a bit of fuzz.
I've checked the result and it's all fine.

I'm reviewing the rest of the series now.

> I'm happy with the v4l2 control changes, so this is ready to go as far as I am
> concerned.
> 
> > @@ -1883,6 +1884,7 @@ enum v4l2_ctrl_type {
> >  	V4L2_CTRL_TYPE_U16	     = 0x0101,
> >  	V4L2_CTRL_TYPE_U32	     = 0x0102,
> >  	V4L2_CTRL_TYPE_AREA          = 0x0106,
> > +	V4L2_CTRL_TYPE_RECT	     = 0x0107,
> >  
> >  	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
> >  	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,

-- 
Regards,

Laurent Pinchart

