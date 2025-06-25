Return-Path: <linux-media+bounces-35916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B80FAE9138
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 00:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 760E77A7760
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 22:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DF026E6E1;
	Wed, 25 Jun 2025 22:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vxA/tjGV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F7E30749E;
	Wed, 25 Jun 2025 22:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750891523; cv=none; b=lFoeWFEI62yoD9oT14HHnqIL1ni9tahB8QtsQUZUW1P0EaZwWoTkJRncOG/d7FCFUxFW2MroLx1y4lgraR+PSYCIDHaSINtpyyfoxWJ80ObqHpQOPZ0V3ryvNH0exhTnASmB04cuXpwXV1tABaQqH5fie+hMPvEb7Yb4xn9CSTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750891523; c=relaxed/simple;
	bh=ia5A8UcFJv83+wg/fT0X3ZhSzNgGuElRRIaNmCiq2ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdQm84agodD971ocu0muhr4+kADoztTiD20MMcqKMLqcsztsmCALFRria7SWn20DIJqCUjI04DEjj0xaEAtPrSbF9pxuqDnubh2Nh3ZE6JUO4CNF7Kijg7IbJnpHaNef/UEi9TVl6RJnF5cZjf6LBJGq0BPl4cY/AMpZFa2SrZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vxA/tjGV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DBFDD6BE;
	Thu, 26 Jun 2025 00:45:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750891501;
	bh=ia5A8UcFJv83+wg/fT0X3ZhSzNgGuElRRIaNmCiq2ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vxA/tjGVmyJIzUjWSlbBHBWl28IpNnwgNornYmabAkWZPRkEeUtFxzyIBjEpdNBme
	 rS6l4UE1afTf00+zUtostOXNXHcmLsB7DZqa3vP6R1WO0MDTBK5GDNvJMh1vhXtDvJ
	 MRXBPaK7WGgtBWV1TowA6nmse2Dsx7JFuNmpTWLY=
Date: Thu, 26 Jun 2025 01:44:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 2/7] media: renesas: vsp1: Store size limits in
 vsp1_entity
Message-ID: <20250625224456.GA15008@pendragon.ideasonboard.com>
References: <20250429235322.29826-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250429235322.29826-3-laurent.pinchart+renesas@ideasonboard.com>
 <fzug4mjmnstedc4wmx3krelhxoudfauu3xokc6kmr2qioznybj@3t6qjqyrwguj>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fzug4mjmnstedc4wmx3krelhxoudfauu3xokc6kmr2qioznybj@3t6qjqyrwguj>

Hi Jacopo,

On Wed, May 28, 2025 at 04:43:28PM +0200, Jacopo Mondi wrote:
> On Wed, Apr 30, 2025 at 02:53:17AM +0300, Laurent Pinchart wrote:
> > Most entities use the vsp1_subdev_enum_frame_size() and
> > vsp1_subdev_set_pad_format() helper functions to implement the
> > corresponding subdev operations. Both helpers are given the minimum and
> > maximum sizes supported by the entity as arguments, requiring each
> > entity to implement a wrapper.
> >
> > Replace the function arguments with storing the size limits in the
> > vsp1_entity structure. This allows dropping most of the
> > .enum_frame_size() and .set_fmt() wrappers in entities.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../media/platform/renesas/vsp1/vsp1_brx.c    |  4 +++
> >  .../media/platform/renesas/vsp1/vsp1_clu.c    | 32 ++++---------------
> >  .../media/platform/renesas/vsp1/vsp1_entity.c | 31 ++++++------------
> >  .../media/platform/renesas/vsp1/vsp1_entity.h | 12 +++----
> >  .../media/platform/renesas/vsp1/vsp1_histo.c  | 12 +++----
> >  .../media/platform/renesas/vsp1/vsp1_hsit.c   | 15 +++------
> >  .../media/platform/renesas/vsp1/vsp1_lif.c    | 26 ++++-----------
> >  .../media/platform/renesas/vsp1/vsp1_lut.c    | 32 ++++---------------
> >  .../media/platform/renesas/vsp1/vsp1_rpf.c    |  5 ++-
> >  .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 19 +++--------
> >  .../media/platform/renesas/vsp1/vsp1_rwpf.h   |  3 --
> >  .../media/platform/renesas/vsp1/vsp1_sru.c    |  4 +++
> >  .../media/platform/renesas/vsp1/vsp1_uds.c    |  4 +++
> >  .../media/platform/renesas/vsp1/vsp1_uif.c    | 26 ++++-----------
> >  .../media/platform/renesas/vsp1/vsp1_wpf.c    | 10 +++---
> >  15 files changed, 76 insertions(+), 159 deletions(-)

[snip]

> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > index 304a2f618777..83ff2c266038 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> > @@ -44,17 +44,6 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
> >  	return 0;
> >  }
> >
> > -static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
> > -				     struct v4l2_subdev_state *sd_state,
> > -				     struct v4l2_subdev_frame_size_enum *fse)
> > -{
> > -	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
> > -
> > -	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse,
> > -					   RWPF_MIN_WIDTH, RWPF_MIN_HEIGHT,
> > -					   rwpf->max_width, rwpf->max_height);
> > -}
> > -
> >  static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
> >  				struct v4l2_subdev_state *sd_state,
> >  				struct v4l2_subdev_format *fmt)
> > @@ -125,9 +114,9 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
> >
> >  	format->code = fmt->format.code;
> >  	format->width = clamp_t(unsigned int, fmt->format.width,
> > -				RWPF_MIN_WIDTH, rwpf->max_width);
> > +				RWPF_MIN_WIDTH, rwpf->entity.max_width);
> >  	format->height = clamp_t(unsigned int, fmt->format.height,
> > -				 RWPF_MIN_HEIGHT, rwpf->max_height);
> > +				 RWPF_MIN_HEIGHT, rwpf->entity.max_height);
> >  	format->field = V4L2_FIELD_NONE;
> >
> >  	format->colorspace = fmt->format.colorspace;
> > @@ -275,7 +264,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> >
> >  static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops = {
> >  	.enum_mbus_code = vsp1_rwpf_enum_mbus_code,
> > -	.enum_frame_size = vsp1_rwpf_enum_frame_size,
> > +	.enum_frame_size = vsp1_subdev_enum_frame_size,
> >  	.get_fmt = vsp1_subdev_get_pad_format,
> >  	.set_fmt = vsp1_rwpf_set_format,
> >  	.get_selection = vsp1_rwpf_get_selection,
> > @@ -312,6 +301,8 @@ int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols)
> >  {
> >  	rwpf->entity.codes = rwpf_codes;
> >  	rwpf->entity.num_codes = ARRAY_SIZE(rwpf_codes);
> > +	rwpf->entity.min_width = RWPF_MIN_WIDTH;
> > +	rwpf->entity.min_height = RWPF_MIN_HEIGHT;
> 
> I wonder if it wouldn't be clearer to initialize both min and max in
> the wpf an rpf modules, took me a bit to grasp where max sizes where
> set

I considered the same. I'll change that.

> >
> >  	v4l2_ctrl_handler_init(&rwpf->ctrls, ncontrols + 1);
> >  	v4l2_ctrl_new_std(&rwpf->ctrls, &vsp1_rwpf_ctrl_ops,

[snip]

> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > index 49af637c8186..349acdae83c7 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> > @@ -525,7 +525,7 @@ static unsigned int wpf_max_width(struct vsp1_entity *entity,
> >  {
> >  	struct vsp1_rwpf *wpf = to_rwpf(&entity->subdev);
> >
> > -	return wpf->flip.rotate ? 256 : wpf->max_width;
> > +	return wpf->flip.rotate ? 256 : wpf->entity.max_width;
> >  }
> >
> >  static void wpf_partition(struct vsp1_entity *entity,
> > @@ -562,11 +562,11 @@ struct vsp1_rwpf *vsp1_wpf_create(struct vsp1_device *vsp1, unsigned int index)
> >  		return ERR_PTR(-ENOMEM);
> >
> >  	if (vsp1->info->gen == 2) {
> > -		wpf->max_width = WPF_GEN2_MAX_WIDTH;
> > -		wpf->max_height = WPF_GEN2_MAX_HEIGHT;
> > +		wpf->entity.max_width = WPF_GEN2_MAX_WIDTH;
> > +		wpf->entity.max_height = WPF_GEN2_MAX_HEIGHT;
> >  	} else {
> > -		wpf->max_width = WPF_GEN3_MAX_WIDTH;
> > -		wpf->max_height = WPF_GEN3_MAX_HEIGHT;
> > +		wpf->entity.max_width = WPF_GEN3_MAX_WIDTH;
> > +		wpf->entity.max_height = WPF_GEN3_MAX_HEIGHT;
> 
> Minor thing though
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

I plan to keep your R-b tag with the above change.

> >  	}
> >
> >  	wpf->entity.ops = &wpf_entity_ops;
> >

-- 
Regards,

Laurent Pinchart

