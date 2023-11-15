Return-Path: <linux-media+bounces-212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D2B7E9A79
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7C55280B97
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22931C6AE;
	Mon, 13 Nov 2023 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iLwdtlyj"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7696318E09
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:42:35 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A64C10CB;
	Mon, 13 Nov 2023 02:42:33 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E34D510A;
	Mon, 13 Nov 2023 11:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699872127;
	bh=6ihvpfxog/JlU6xFHC7s7/xfpVvhabzUKotPpV7QC2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLwdtlyjr9XaJgEq3GIS+tAqup/UOKkw9CD7xt6h7DwcFk2Jy6GcqzMIv8i5b2nty
	 YDM0eBQ9g6LgQ3Uiy6swYxkGgEHz9eKBgmI5tn7c0CpqziSP7wwwZNlU1vRvfyJlZM
	 e9cfogzJJnOl+xLA4frg+PnYkyippD2ByhKc6H38=
Date: Mon, 13 Nov 2023 12:42:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 10/15] media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
Message-ID: <20231113104238.GA13981@pendragon.ideasonboard.com>
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
 <1699595289-25773-11-git-send-email-shengjiu.wang@nxp.com>
 <4cd6b593-2376-4cbc-a7c8-d3eb36a2f7a0@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4cd6b593-2376-4cbc-a7c8-d3eb36a2f7a0@xs4all.nl>

On Mon, Nov 13, 2023 at 11:29:09AM +0100, Hans Verkuil wrote:
> Hi Shengjiu,
> 
> On 10/11/2023 06:48, Shengjiu Wang wrote:
> > Fixed point controls are used by the user to configure
> > a fixed point value in 64bits, which Q31.32 format.
> > 
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> This patch adds a new control type. This is something that also needs to be
> tested by v4l2-compliance, and for that we need to add support for this to
> one of the media test-drivers. The best place for that is the vivid driver,
> since that has already a bunch of test controls for other control types.
> 
> See e.g. VIVID_CID_INTEGER64 in vivid-ctrls.c.
> 
> Can you add a patch adding a fixed point test control to vivid?

I don't think V4L2_CTRL_TYPE_FIXED_POINT is a good idea. This seems to
relate more to units than control types. We have lots of fixed-point
values in controls already, using the 32-bit and 64-bit integer control
types. They use various locations for the decimal point, depending on
the control. If we want to make this more explicit to users, we should
work on adding unit support to the V4L2 controls.

> > ---
> >  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  | 13 +++++++------
> >  .../userspace-api/media/v4l/vidioc-queryctrl.rst    |  9 ++++++++-
> >  .../userspace-api/media/videodev2.h.rst.exceptions  |  1 +
> >  drivers/media/v4l2-core/v4l2-ctrls-api.c            |  5 ++++-
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c           |  2 ++
> >  include/uapi/linux/videodev2.h                      |  1 +
> >  6 files changed, 23 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > index e8475f9fd2cf..e7e5d78dc11e 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> > @@ -162,13 +162,13 @@ still cause this situation.
> >      * - __s32
> >        - ``value``
> >        - New value or current value. Valid if this control is not of type
> > -	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
> > -	not set.
> > +	``V4L2_CTRL_TYPE_INTEGER64``, ``V4L2_CTRL_TYPE_FIXED_POINT`` and
> > +	``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is not set.
> >      * - __s64
> >        - ``value64``
> >        - New value or current value. Valid if this control is of type
> > -	``V4L2_CTRL_TYPE_INTEGER64`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is
> > -	not set.
> > +	``V4L2_CTRL_TYPE_INTEGER64``, ``V4L2_CTRL_TYPE_FIXED_POINT`` and
> > +	``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is not set.
> >      * - char *
> >        - ``string``
> >        - A pointer to a string. Valid if this control is of type
> > @@ -193,8 +193,9 @@ still cause this situation.
> >      * - __s64 *
> >        - ``p_s64``
> >        - A pointer to a matrix control of signed 64-bit values. Valid if
> > -        this control is of type ``V4L2_CTRL_TYPE_INTEGER64`` and
> > -        ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
> > +        this control is of type ``V4L2_CTRL_TYPE_INTEGER64``,
> > +        ``V4L2_CTRL_TYPE_FIXED_POINT`` and ``V4L2_CTRL_FLAG_HAS_PAYLOAD``
> > +        is set.
> >      * - struct :c:type:`v4l2_area` *
> >        - ``p_area``
> >        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > index 4d38acafe8e1..f3995ec57044 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > @@ -235,7 +235,8 @@ See also the examples in :ref:`control`.
> >        - ``default_value``
> >        - The default value of a ``V4L2_CTRL_TYPE_INTEGER``, ``_INTEGER64``,
> >  	``_BOOLEAN``, ``_BITMASK``, ``_MENU``, ``_INTEGER_MENU``, ``_U8``
> > -	or ``_U16`` control. Not valid for other types of controls.
> > +	``_FIXED_POINT`` or ``_U16`` control. Not valid for other types of
> > +	controls.
> >  
> >  	.. note::
> >  
> > @@ -549,6 +550,12 @@ See also the examples in :ref:`control`.
> >        - n/a
> >        - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing AV1 Film Grain
> >          parameters for stateless video decoders.
> > +    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
> > +      - any
> > +      - any
> > +      - any
> > +      - A 64-bit integer valued control, containing parameter which is
> > +        Q31.32 format.
> >  
> >  .. raw:: latex
> >  
> > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > index e61152bb80d1..2faa5a2015eb 100644
> > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > @@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
> >  replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_type`
> > +replace symbol V4L2_CTRL_TYPE_FIXED_POINT :c:type:`v4l2_ctrl_type`
> >  
> >  # V4L2 capability defines
> >  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > index 002ea6588edf..e6a0fb8d6791 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> > @@ -57,6 +57,7 @@ static int ptr_to_user(struct v4l2_ext_control *c,
> >  		return copy_to_user(c->string, ptr.p_char, len + 1) ?
> >  		       -EFAULT : 0;
> >  	case V4L2_CTRL_TYPE_INTEGER64:
> > +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >  		c->value64 = *ptr.p_s64;
> >  		break;
> >  	default:
> > @@ -132,6 +133,7 @@ static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
> >  
> >  	switch (ctrl->type) {
> >  	case V4L2_CTRL_TYPE_INTEGER64:
> > +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >  		*ctrl->p_new.p_s64 = c->value64;
> >  		break;
> >  	case V4L2_CTRL_TYPE_STRING:
> > @@ -540,7 +542,8 @@ static int validate_ctrls(struct v4l2_ext_controls *cs,
> >  		 */
> >  		if (ctrl->is_ptr)
> >  			continue;
> > -		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64)
> > +		if (ctrl->type == V4L2_CTRL_TYPE_INTEGER64 ||
> > +		    ctrl->type == V4L2_CTRL_TYPE_FIXED_POINT)
> >  			p_new.p_s64 = &cs->controls[i].value64;
> >  		else
> >  			p_new.p_s32 = &cs->controls[i].value;
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index a662fb60f73f..9d50df0d9874 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -1187,6 +1187,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
> >  	case V4L2_CTRL_TYPE_INTEGER:
> >  		return ROUND_TO_RANGE(ptr.p_s32[idx], u32, ctrl);
> >  	case V4L2_CTRL_TYPE_INTEGER64:
> > +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >  		/*
> >  		 * We can't use the ROUND_TO_RANGE define here due to
> >  		 * the u64 divide that needs special care.
> > @@ -1779,6 +1780,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >  	/* Prefill elem_size for all types handled by std_type_ops */
> >  	switch ((u32)type) {
> >  	case V4L2_CTRL_TYPE_INTEGER64:
> > +	case V4L2_CTRL_TYPE_FIXED_POINT:
> >  		elem_size = sizeof(s64);
> >  		break;
> >  	case V4L2_CTRL_TYPE_STRING:
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index cf8c44595a1d..9482ac66a675 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -1903,6 +1903,7 @@ enum v4l2_ctrl_type {
> >  	V4L2_CTRL_TYPE_STRING        = 7,
> >  	V4L2_CTRL_TYPE_BITMASK       = 8,
> >  	V4L2_CTRL_TYPE_INTEGER_MENU  = 9,
> > +	V4L2_CTRL_TYPE_FIXED_POINT   = 10,
> >  
> >  	/* Compound types are >= 0x0100 */
> >  	V4L2_CTRL_COMPOUND_TYPES     = 0x0100,

-- 
Regards,

Laurent Pinchart

