Return-Path: <linux-media+bounces-36868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C551AF9AF2
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 20:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E34A21CA52A5
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 18:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F0D1E5B69;
	Fri,  4 Jul 2025 18:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AuWP12Ke"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC15D1DE3B5;
	Fri,  4 Jul 2025 18:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751655415; cv=none; b=VfUD2xCzn+8y7AB5ZqeY/ahNapU/aCd+gueftEmX+hIOFT+lkSKpYaakquiAZPHkk7+sb8X9ajIAptI+SjXj+MQpFRByH4HoPEDJ9k+y73xf8lIHlKeTxTAbk6Y5OkG/QUO3I7ZN8+/KWjbMtbjU3AGQmfe2Pgcncvnsbu7EWOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751655415; c=relaxed/simple;
	bh=HDgcXGsG7OVkpfgJypzMX1fLjux0md5Lz2UpbxoCKY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/aKBHa+iw3QUrfAtWtxdGJ6k6xNBsmCJnXG1f7jTYZ0aROuGQXjSq2OqZP0AhQTQmEXZIMlkOdC1Ead+enGg976IVvc8lqIFi6XwHUtSx0aApJg1zJmgnD/bC4v/nRI5AsI5YhOdKRS+lfTvBf7sjdT+YMivhv2JuoRahoZwjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AuWP12Ke; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CEB0E669;
	Fri,  4 Jul 2025 20:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751655387;
	bh=HDgcXGsG7OVkpfgJypzMX1fLjux0md5Lz2UpbxoCKY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuWP12KeNVRFJTRp6GLdg2MSbWwbrwMZ5N+mF2uZh8GS+2FMurzou80lAtbV0O6el
	 /Mipqz3dD7Nu0jyN0O3fCovbTQA1YVBB21HFWcDvceqG4j8AoMcpYyrTgARMZx2BBn
	 VPoTaKzKgEptt1WxkLTKqTaaS20YE2Bl/hU9QYKw=
Date: Fri, 4 Jul 2025 21:56:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 4/8] media: renesas: vsp1: Fix crop left and top
 clamping on RPF
Message-ID: <20250704185622.GB30285@pendragon.ideasonboard.com>
References: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250704001812.30064-5-laurent.pinchart+renesas@ideasonboard.com>
 <6ub7ckelxn6ln47ml6xm4g35em3l22lunv3afsgrhyktng5qsw@3d272lxmg3nq>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6ub7ckelxn6ln47ml6xm4g35em3l22lunv3afsgrhyktng5qsw@3d272lxmg3nq>

On Fri, Jul 04, 2025 at 06:44:04PM +0200, Jacopo Mondi wrote:
> On Fri, Jul 04, 2025 at 03:18:08AM +0300, Laurent Pinchart wrote:
> > The RPF doesn't enforces the alignment constraint on the sink pad
> > format, which could have an odd size, possibly down to 1x1. In that
> > case, the upper bounds for the left and top coordinates clamping would
> > become negative, cast to a very large positive value. Incorrect crop
> > rectangle coordinates would then be incorrectly accepted.
> >
> > A second issue can occur when the requested left and top coordinates are
> > negative. They are cast to a large unsigned value, clamped to the
> > maximum. While the calculation will produce valid values for the
> > hardware, this is not compliant with the V4L2 specification that
> > requires values to be adjusted to the closest valid value.
> >
> > Fix both issues by switching to signed clamping, with an explicit
> > minimum to adjust negative values, and adjusting the clamp bounds to
> > avoid negative upper bounds.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 28 ++++++++++++++++---
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > index 56464875a6c5..ffc1b3ab54e2 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > @@ -201,6 +201,8 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> >  				   struct v4l2_subdev_state *sd_state,
> >  				   struct v4l2_subdev_selection *sel)
> >  {
> > +	unsigned int min_width = RWPF_MIN_WIDTH;
> > +	unsigned int min_height = RWPF_MIN_HEIGHT;
> >  	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
> >  	struct v4l2_subdev_state *state;
> >  	struct v4l2_mbus_framefmt *format;
> > @@ -229,18 +231,36 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> >  	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
> >
> >  	/*
> > -	 * Restrict the crop rectangle coordinates to multiples of 2 to avoid
> > -	 * shifting the color plane.
> > +	 * For YUV formats, restrict the crop rectangle coordinates to multiples
> > +	 * of 2 to avoid shifting the color plane.
> >  	 */
> >  	if (format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
> >  		sel->r.left = ALIGN(sel->r.left, 2);
> >  		sel->r.top = ALIGN(sel->r.top, 2);
> >  		sel->r.width = round_down(sel->r.width, 2);
> >  		sel->r.height = round_down(sel->r.height, 2);
> > +
> > +		/*
> > +		 * The RPF doesn't enforces the alignment constraint on the sink
> > +		 * pad format, which could have an odd size, possibly down to
> > +		 * 1x1. In that case, the minimum width and height would be
> > +		 * smaller than the sink pad format, leading to a negative upper
> > +		 * bound in the left and top clamping. Clamp the minimum width
> > +		 * and height to the format width and height to avoid this.
> > +		 *
> > +		 * In such a situation, odd values for the crop rectangle size
> > +		 * would be accepted when clamping the width and height below.
> > +		 * While that would create an invalid hardware configuration,
> > +		 * the video device enforces proper alignment of the pixel
> > +		 * format, and the mismatch will then result in link validation
> > +		 * failure. Incorrect operation of the hardware is not possible.
> > +		 */
> > +		min_width = min(ALIGN(min_width, 2), format->width);
> > +		min_height = min(ALIGN(min_height, 2), format->height);
> 
> I wonder if initializing min_width (and height) to RWPF_MIN_WIDTH and
> then here unconditionally make it 2 (because of ALIGN) wouldn't just
> be better expressed as
> 
> 		min_width = min(2, format->width);

The calculation will lead to the same result. I thought about expressing
it this way, but I think the explicit ALIGN() makes the intent clearer.
Testing both with a gcc 13.3.0-based arm64 cross-compiler, the generated
code is the same.

> >  	}
> >
> > -	sel->r.left = min_t(unsigned int, sel->r.left, format->width - 2);
> > -	sel->r.top = min_t(unsigned int, sel->r.top, format->height - 2);
> > +	sel->r.left = clamp_t(int, sel->r.left, 0, format->width - min_width);
> > +	sel->r.top = clamp_t(int, sel->r.top, 0, format->height - min_height);
> 
> Regardless of the above
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> >  	sel->r.width = min_t(unsigned int, sel->r.width,
> >  			     format->width - sel->r.left);
> >  	sel->r.height = min_t(unsigned int, sel->r.height,

-- 
Regards,

Laurent Pinchart

