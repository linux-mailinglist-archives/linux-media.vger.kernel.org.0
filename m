Return-Path: <linux-media+bounces-35918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A8AAE92D0
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 01:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA624E08E1
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 23:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959A92D3EEB;
	Wed, 25 Jun 2025 23:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yuzt1BZd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA732D3EE4;
	Wed, 25 Jun 2025 23:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750894740; cv=none; b=W0c5u33pFw1hQxeTq0Ysc6r8kLSsHjMRJ3hls6KB3OwtKl+YZHGsSeD/3bn63qCV6EvrTS+Zhr7he61XjGbVM75y94fnIrFLqNaniBF8QCVKiMllHAddaM+GNmoCddqq068/JUHfC0xrGJMjiYF2YRg+HlagKlMVlzXlI6jYVYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750894740; c=relaxed/simple;
	bh=K2U/Ph0FH3gOTOqSxcHT9xwCjgywl7MAJsMDUHzefGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D43x2AGGmSx9xKQ8BqLc7GiMMh6acYGcs6RkvETbdBARRP9px1khKq4XHQ7DapCWT9ytUdDzxcea7KnJYsWHzFXl6gfz7n0X6uki+ohbBzgRmhC2eVftYGnWenXeA/ZEezfaWWSRuQ+3/EEMiHF8lzjdg+3MifNhL7mG4KTfBtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yuzt1BZd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C2A37928;
	Thu, 26 Jun 2025 01:38:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750894718;
	bh=K2U/Ph0FH3gOTOqSxcHT9xwCjgywl7MAJsMDUHzefGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yuzt1BZdVs+gz/1q3I6qSW64kZmcjoMnUmLpEx+ADQ/gm5bKr1m3Z+PFI94ZC7h8J
	 upCdgijwHtr+zPiLBq6st54rNRMRZQNv0QGz4+/1z4FFZXbWMhtAiZqJesrYHGanoS
	 W8AlNR7iK8xENn5YJ6+ncxHJwMwoEGOUz4/WJv50=
Date: Thu, 26 Jun 2025 02:38:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 4/7] media: renesas: vsp1: Fix RPF sink alignment for YUV
 formats
Message-ID: <20250625233833.GC15008@pendragon.ideasonboard.com>
References: <20250429235322.29826-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250429235322.29826-5-laurent.pinchart+renesas@ideasonboard.com>
 <cjzbwptea7hee67jcf5mtzolunqo33vvr47a7elb4kdzlbzdmf@e54d5mwqep4a>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cjzbwptea7hee67jcf5mtzolunqo33vvr47a7elb4kdzlbzdmf@e54d5mwqep4a>

Hi Jacopo,

On Wed, May 28, 2025 at 04:49:50PM +0200, Jacopo Mondi wrote:
> On Wed, Apr 30, 2025 at 02:53:19AM +0300, Laurent Pinchart wrote:
> > When reading YUV formats from memory, the hardware requires the crop
> > rectangle size and position to be aligned to multiples of two, depending
> > on the horizontal and vertical subsampling factors. The driver doesn't
> > enforce this, leading to incorrect operation.
> >
> > As the crop rectangle is implemented on the RPF subdev's sink pad,
> > enforcing the constraint conditionally based on the subsampling factors
> > is difficult, as those are only known by the RPF video device. We could
> > perform the check at pipeline validation time, but that could lead to
> > confusing -EPIPE errors. As there is very few use cases for odd crop
> > offsets and sizes with non-subsampled YUV, take the easier and more
> > user-friendly route of enforcing the constraint on all YUV formats.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 41 ++++++++++++-------
> >  1 file changed, 26 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > index 83ff2c266038..61f7e13ebeee 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > @@ -117,6 +117,17 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
> >  				RWPF_MIN_WIDTH, rwpf->entity.max_width);
> >  	format->height = clamp_t(unsigned int, fmt->format.height,
> >  				 RWPF_MIN_HEIGHT, rwpf->entity.max_height);
> > +
> > +	/*
> > +	 * For YUV formats on the RPF, restrict the size to multiples of 2 to
> > +	 * avoid shifting the color plane.
> > +	 */
> > +	if (rwpf->entity.type == VSP1_ENTITY_RPF &&
> > +	    format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
> > +		format->width = ALIGN(format->width, 2);
> > +		format->height = ALIGN(format->height, 2);
> 
> ALIGN aligns up right ? Is it ok or is it better to read 1 pixel less
> than reading memory outside of the region the user asked for ?

This shouldn't actually matter. Link validation will ensure that the
format on the RPF subdev sink pad matches the format on the connected
video device. If this function rounds the value in a way that does not
match the format on the video device, link validation will fail.

I've checked the implementation on the video device, and the driver does

	/* Align the width and height for YUV 4:2:2 and 4:2:0 formats. */
	width = round_down(width, info->hsub);
	height = round_down(height, info->vsub);

	/* Clamp the width and height. */
	pix->width = clamp(width, info->hsub, VSP1_VIDEO_MAX_WIDTH);
	pix->height = clamp(height, info->vsub, VSP1_VIDEO_MAX_HEIGHT);

It seems I can drop the above code, as the video device correctly
handles the hardware requirement for the input size.

> > +	}
> > +
> >  	format->field = V4L2_FIELD_NONE;
> >
> >  	format->colorspace = fmt->format.colorspace;
> > @@ -231,23 +242,23 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> >  	/* Make sure the crop rectangle is entirely contained in the image. */
> >  	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
> >
> > -	/*
> > -	 * Restrict the crop rectangle coordinates to multiples of 2 to avoid
> > -	 * shifting the color plane.
> > -	 */
> > -	if (format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
> > -		sel->r.left = ALIGN(sel->r.left, 2);
> > -		sel->r.top = ALIGN(sel->r.top, 2);
> > -		sel->r.width = round_down(sel->r.width, 2);
> > -		sel->r.height = round_down(sel->r.height, 2);
> > -	}
> > -
> >  	sel->r.left = min_t(unsigned int, sel->r.left, format->width - 2);
> >  	sel->r.top = min_t(unsigned int, sel->r.top, format->height - 2);
> > -	sel->r.width = min_t(unsigned int, sel->r.width,
> > -			     format->width - sel->r.left);
> > -	sel->r.height = min_t(unsigned int, sel->r.height,
> > -			      format->height - sel->r.top);
> > +	sel->r.width = clamp_t(unsigned int, sel->r.width, RWPF_MIN_WIDTH,
> > +			       format->width - sel->r.left);
> > +	sel->r.height = clamp_t(unsigned int, sel->r.height, RWPF_MIN_HEIGHT,
> > +				format->height - sel->r.top);
> > +
> > +	/*
> > +	 * For YUV formats, restrict the crop rectangle coordinates to multiples
> > +	 * of 2 to avoid shifting the color plane.
> > +	 */
> > +	if (format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
> > +		sel->r.left = round_down(sel->r.left, 2);
> > +		sel->r.top = round_down(sel->r.top, 2);
> > +		sel->r.width = ALIGN(sel->r.width, 2);
> > +		sel->r.height = ALIGN(sel->r.height, 2);
> 
> The existing code did
> 
> 		sel->r.left = ALIGN(sel->r.left, 2);
> 		sel->r.top = ALIGN(sel->r.top, 2);
> 		sel->r.width = round_down(sel->r.width, 2);
> 		sel->r.height = round_down(sel->r.height, 2);
> 
> is it intentional ?

If width == left + 1 (which the clamping code allows), rounding left up
and width down will cause width to be 0. Going in the other direction
ensures we won't have an empty crop rectangle. But the width can then
exceed the sink format width, if I drop the rounding there. I'll rework
this patch.

> > +	}
> >
> >  	crop = v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
> >  	*crop = sel->r;

-- 
Regards,

Laurent Pinchart

