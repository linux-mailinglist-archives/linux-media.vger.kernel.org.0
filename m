Return-Path: <linux-media+bounces-35639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1483AE4049
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 923D17A1052
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D4F242927;
	Mon, 23 Jun 2025 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KqtGLcOo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD54374EA
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681865; cv=none; b=uKsBZi9y05lPoM16D9jqKp7+TR/QJln5hAatM6vVqTxuYC8+K0xFRWq3QLnrSIiQlm8WpdjG+UlBAQHAyG3vJXELXCgViQ1OwzOOxFxQ1E1FChpcp8iBypYlTe/mJ04T0bhGgH4wDXDZt4MmTIaboZsLxqxBL75H3q0WAqbbQ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681865; c=relaxed/simple;
	bh=rwXiR8gNMizQkVuYJ8nq6DtLOVdyGDRAgnN8YDVkmY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bd4YsSL3bSaX8myZD7ArWkVyc/BsoYgMhYNLWfTqR7LhAK9YWhnO4CAozQXBCyeklkZsAjAjJls2r1UfnGuegKo5oSC61s+ZpqtMR7SqCaNZZqUphfU+gnD+CZzyL2qJwEGk9o3fyL6ik5u1BfrAJkDI5er6hqxurCknaEYnZMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KqtGLcOo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C5FEFD77;
	Mon, 23 Jun 2025 14:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750681846;
	bh=rwXiR8gNMizQkVuYJ8nq6DtLOVdyGDRAgnN8YDVkmY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqtGLcOoV1U0TDjaK1Ycihd4Q5TrItNGs21SA0G7scsXYCrUD4ICDrlI9DXyPytNd
	 ewo+8hhcZu55RrLkArakmEVCG9sk0EvnsNmW6KW2zEmlEVcXte4Pxmsbl5kzCvmXpd
	 ld364O7ZQX0XBPESpPqtML1v6v1O11IYSuIrH/e8=
Date: Mon, 23 Jun 2025 15:30:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/5] media: v4l2-subdev: Limit the number of active
 routes to V4L2_FRAME_DESC_ENTRY_MAX
Message-ID: <20250623123042.GJ826@pendragon.ideasonboard.com>
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
 <20250619204712.16099-2-laurent.pinchart@ideasonboard.com>
 <ssyt7zhekhln6i6lf2ulrhomo5f24d54f55dhtusljnp5iqrfe@edwtnuga2po6>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ssyt7zhekhln6i6lf2ulrhomo5f24d54f55dhtusljnp5iqrfe@edwtnuga2po6>

Hi Jacopo,

On Mon, Jun 23, 2025 at 10:22:27AM +0200, Jacopo Mondi wrote:
> On Thu, Jun 19, 2025 at 11:47:08PM +0300, Laurent Pinchart wrote:
> > Drivers that implement routing need to report a frame descriptor
> > accordingly, with up to one entry per route. The number of frame
> > descriptor entries is fixed to V4L2_FRAME_DESC_ENTRY_MAX, currently
> > equal to 8. Multiple drivers therefore limit the number of routes to
> > V4L2_FRAME_DESC_ENTRY_MAX, with a note indicating that the limit should
> > be lifted when frame descriptor entries will be allocated dynamically.
> >
> > Duplicating the check in multiple drivers isn't ideal. Move it to the
> > VIDIOC_SUBDEV_S_ROUTING handling code in the v4l2-subdev core.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index e99647200e49..013ebb14b37b 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -985,6 +985,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		struct v4l2_subdev_route *routes =
> >  			(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
> >  		struct v4l2_subdev_krouting krouting = {};
> > +		unsigned int num_active_routes = 0;
> >  		unsigned int i;
> >
> >  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> > @@ -1019,8 +1020,21 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  			if (!(pads[route->source_pad].flags &
> >  			      MEDIA_PAD_FL_SOURCE))
> >  				return -EINVAL;
> > +
> > +			if (route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE)
> > +				num_active_routes++;
> 
> There also is the possibility to return here if num_active_routes >
> V4L2_FRAME_DESC_ENTRY_MAX. If instead, like you're doing here, we
> continue validating all route entries, if any further route is
> malformed we will return -EINVAL and -E2BIG. I can't tell what error
> should be prioritized, and this seems a corner-case anyway, so:

Good question. I have a slight preference for the current behaviour (not
totally sure why), but I don't think it matters too much.

> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> >  		}
> >
> > +		/*
> > +		 * Drivers that implement routing need to report a frame
> > +		 * descriptor accordingly, with up to one entry per route. Until
> > +		 * the frame descriptors entries get allocated dynamically,
> > +		 * limit the number of active routes to
> > +		 * V4L2_FRAME_DESC_ENTRY_MAX.
> > +		 */
> > +		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> > +			return -E2BIG;
> > +
> >  		/*
> >  		 * If the driver doesn't support setting routing, just return
> >  		 * the routing table.

-- 
Regards,

Laurent Pinchart

