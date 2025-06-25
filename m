Return-Path: <linux-media+bounces-35919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C82AE92F1
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 01:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF1E43BB941
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 23:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD772F1FDB;
	Wed, 25 Jun 2025 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K8KMR8a8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C9A2F1FC5;
	Wed, 25 Jun 2025 23:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750895291; cv=none; b=qg+lA+fXD38WgzzOa0Q/b06XrcDLV/StT+vlYt8nWAbSycuhWI9gQ9lr/pX2vi0Elx5WgbEedRZEVw56ZZBKdPqQMEGTm9rxJljDCDqkiOeUXmIgm05V/jj3HiMfaClsOUJbr/sGLwBFk7Wo6qG+gNcoC5/s9aMlQiiPz5ZKkVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750895291; c=relaxed/simple;
	bh=vGtjhlYZ6CZb5Ch/ChYL8HfIIvYaFZIcynPaHEyvoD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfDofqtUyS94O2KtY4kcTZEC4LBbY4nCCc1EhRgLNErKxhAgkXWtQZ7w3w8Onwra03TII3t0Zb5Po+1cXm6qeeYiN7ZLce2x+hsMlIQOfW61ZnsuSwqhVc4cq7cM7YllJ/NfqJlOckxN+DUxX0GLfRczttVb7NyBO/s88QoOQSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K8KMR8a8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E8FFDC9;
	Thu, 26 Jun 2025 01:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750895270;
	bh=vGtjhlYZ6CZb5Ch/ChYL8HfIIvYaFZIcynPaHEyvoD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8KMR8a8d23XIRw4tSSduMuj0XSQYrW3vfmfVqwv1vnwa96QX0wVBoQ3OL/OEHjlF
	 HCB/EMyW8Q30QY37+UsCe79tJx9TyY1QZDUYzdXAieB+U0TBRcctbATLKVx9trW3NN
	 gWiZg7z8bJOQzTQA9aWYCqt97LPIf4ek4OPHexbA=
Date: Thu, 26 Jun 2025 02:47:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 5/7] media: renesas: vsp1: Fix RWPF media bus code and
 frame size enumeration
Message-ID: <20250625234745.GD15008@pendragon.ideasonboard.com>
References: <20250429235322.29826-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250429235322.29826-6-laurent.pinchart+renesas@ideasonboard.com>
 <nury6gimeh45moskbhhqtjzpb3uoqhqhrj3hw7cbm2fetiuub7@jmbq2762qfw2>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <nury6gimeh45moskbhhqtjzpb3uoqhqhrj3hw7cbm2fetiuub7@jmbq2762qfw2>

On Wed, May 28, 2025 at 04:58:45PM +0200, Jacopo Mondi wrote:
> On Wed, Apr 30, 2025 at 02:53:20AM +0300, Laurent Pinchart wrote:
> > The RWPF can't freely convert between all input and output formats. They
> > support RGB <-> YUV conversion, but HSV formats can't be converted. Fix
> > the media bus code and frame size enumeration to take this into account
> > on the source pad.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 80 +++++++++++++++++--
> >  1 file changed, 74 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > index 61f7e13ebeee..bd97fc75eb5b 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > @@ -21,29 +21,97 @@
> >   * V4L2 Subdevice Operations
> >   */
> >
> > +/* Keep HSV last. */
> >  static const unsigned int rwpf_codes[] = {
> > +	MEDIA_BUS_FMT_AYUV8_1X32,
> >  	MEDIA_BUS_FMT_ARGB8888_1X32,
> >  	MEDIA_BUS_FMT_AHSV8888_1X32,
> > -	MEDIA_BUS_FMT_AYUV8_1X32,
> >  };
> >
> >  static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
> >  				    struct v4l2_subdev_state *sd_state,
> >  				    struct v4l2_subdev_mbus_code_enum *code)
> >  {
> > -	if (code->index >= ARRAY_SIZE(rwpf_codes))
> > +	struct vsp1_entity *entity = to_vsp1_entity(subdev);
> > +	struct v4l2_subdev_state *state;
> > +	struct v4l2_mbus_framefmt *format;
> 
> minor nit: could you move this one line up for ... reverse xmas tree
> ordering :)

state goes first because in my head you get the state and then access
the format from it. As the line are nearly the same length, the breach
of the reverse xmas tree rule didn't shock me. We're really getting into
nitpicking territory :-)

This will go away when switching to the V4L2 subdev active state API. I
have a patch series for that, but need to fix a lockdep issue.

> > +
> > +	if (code->pad == RWPF_PAD_SINK)
> > +		return vsp1_subdev_enum_mbus_code(subdev, sd_state, code);
> > +
> > +	state = vsp1_entity_get_state(entity, sd_state, code->which);
> > +	if (!state)
> >  		return -EINVAL;
> >
> > -	code->code = rwpf_codes[code->index];
> > +	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
> >
> > -	if (code->pad == RWPF_PAD_SOURCE &&
> > -	    code->code == MEDIA_BUS_FMT_AYUV8_1X32)
> > +	guard(mutex)(&entity->lock);
> > +
> > +	/*
> > +	 * The RWPF supports conversion between RGB and YUV formats, but HSV
> > +	 * formats can't be converted.
> > +	 */
> > +	if (format->code == MEDIA_BUS_FMT_AHSV8888_1X32) {
> > +		if (code->index)
> > +			return -EINVAL;
> > +
> > +		code->code = MEDIA_BUS_FMT_AHSV8888_1X32;
> > +	} else {
> > +		if (code->index >= ARRAY_SIZE(rwpf_codes) - 1)
> > +			return -EINVAL;
> > +
> > +		code->code = rwpf_codes[code->index];
> > +	}
> > +
> > +	if (code->code == MEDIA_BUS_FMT_AYUV8_1X32)
> >  		code->flags = V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC
> >  			    | V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
> >
> >  	return 0;
> >  }
> >
> > +static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
> > +				     struct v4l2_subdev_state *sd_state,
> > +				     struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +	struct vsp1_entity *entity = to_vsp1_entity(subdev);
> > +	struct v4l2_subdev_state *state;
> > +	struct v4l2_mbus_framefmt *format;
> > +
> > +	if (fse->pad == RWPF_PAD_SINK)
> > +		return vsp1_subdev_enum_frame_size(subdev, sd_state, fse);
> > +
> > +	if (fse->index)
> > +		return -EINVAL;
> > +
> > +	state = vsp1_entity_get_state(entity, sd_state, fse->which);
> > +	if (!state)
> > +		return -EINVAL;
> > +
> > +	format = v4l2_subdev_state_get_format(state, 0);
> 
> Could you use RWPF_PAD_SINK ?

Will do.

> > +
> > +	guard(mutex)(&entity->lock);
> 
> As a general question, shouldn't we use the state lock ?

The series I mentioned above will handle this. The driver doesn't
currently use the active statue API.

> > +
> > +	/*
> > +	 * The RWPF supports conversion between RGB and YUV formats, but
> > +	 * HSV formats can't be converted.
> > +	 */
> > +	if ((format->code == MEDIA_BUS_FMT_AHSV8888_1X32) !=
> > +	    (fse->code == MEDIA_BUS_FMT_AHSV8888_1X32))
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The size on the source pad is fixed and always identical to
> > +	 * the sink pad.
> > +	 */
> > +	fse->min_width = format->width;
> > +	fse->max_width = format->width;
> > +	fse->min_height = format->height;
> > +	fse->max_height = format->height;
> > +
> > +	return 0;
> > +}
> 
> All minors
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> > +
> >  static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
> >  				struct v4l2_subdev_state *sd_state,
> >  				struct v4l2_subdev_format *fmt)
> > @@ -275,7 +343,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> >
> >  static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
> >  	.enum_mbus_code = vsp1_rwpf_enum_mbus_code,
> > -	.enum_frame_size = vsp1_subdev_enum_frame_size,
> > +	.enum_frame_size = vsp1_rwpf_enum_frame_size,
> >  	.get_fmt = vsp1_subdev_get_pad_format,
> >  	.set_fmt = vsp1_rwpf_set_format,
> >  	.get_selection = vsp1_rwpf_get_selection,

-- 
Regards,

Laurent Pinchart

