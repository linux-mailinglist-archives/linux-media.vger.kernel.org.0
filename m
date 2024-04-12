Return-Path: <linux-media+bounces-9220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7E8A363D
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 21:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58D521C21911
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 19:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7E414F9E9;
	Fri, 12 Apr 2024 19:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uyDdfqgH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D2814EC60
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 19:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712949279; cv=none; b=lA0Yyz2ZA3hrIU0mB76AGSwFsiLLX1CSL9iYVqgivqh8ZJ6zx2uwaWLrIKjTxCJm/9eIuH/roP/B4qKap59MUBuBEga/YScs8KiYu6KTtbmcVd4L0Z1XL1gZoTyAvrod218LRzXZzN0vL/r1RiQltd7AZ1Y+Io4LFAdZ3SXe7Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712949279; c=relaxed/simple;
	bh=C1ym4YV+Y1ooaHWTck1UZbnVnQmvhIKB+659C35PaAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxKZ8AOMSRR8kJqe9CNj98mtsWH771uiZmL8LYr1JSVzzfz7sRWFYQw/5GxrCyob+9MLwf2KdI+Otn2IZQjUYEj8pLYQGHf4tjqo4n+OopUvx8hUNVTBLH8VAtzMRA1rjOeSV1G9O1ZJ5bdsbhfioFPz0bnlxqUawv7IvwBkKjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uyDdfqgH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-48-227-nat.elisa-mobile.fi [85.76.48.227])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E18D9D5;
	Fri, 12 Apr 2024 21:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712949232;
	bh=C1ym4YV+Y1ooaHWTck1UZbnVnQmvhIKB+659C35PaAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uyDdfqgH9GrPMjJLS9B2fokG0I7OyRKokfRskdNWy/mcS0elWtYlsYJnItwfXE1S6
	 QqtzBiXYJLMqtHU9VNhXxs3VzAryNqKVrIalTEGWuAfQpDFXdeOiWtI+43X5QBDB40
	 2WPoNPHsxFmwQKV8iefdZvvFTr2RkhhVx71opP14=
Date: Fri, 12 Apr 2024 22:14:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 17/38] media: v4l: subdev: Add trivial set_routing
 support
Message-ID: <20240412191035.GP31122@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-18-sakari.ailus@linux.intel.com>
 <20240320015558.GV8501@pendragon.ideasonboard.com>
 <20240401234105.GA2492@pendragon.ideasonboard.com>
 <Zhebq7FxeDolVDTp@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zhebq7FxeDolVDTp@kekkonen.localdomain>

On Thu, Apr 11, 2024 at 08:13:31AM +0000, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Tue, Apr 02, 2024 at 02:41:05AM +0300, Laurent Pinchart wrote:
> > On Wed, Mar 20, 2024 at 03:55:58AM +0200, Laurent Pinchart wrote:
> > > Hi Sakari,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Wed, Mar 13, 2024 at 09:24:55AM +0200, Sakari Ailus wrote:
> > > > Add trivial S_ROUTING IOCTL support for drivers where routing is static.
> > > > Essentially this means returning the same information G_ROUTING call would
> > > > have done.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Actually...
> > 
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index a6107e440ef0..c8c435df92c8 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -930,6 +930,20 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > > >  
> > > >  		memset(routing->reserved, 0, sizeof(routing->reserved));
> > > >  
> > > > +		/*
> > > > +		 * If the driver doesn't support setting routing, just return
> > > > +		 * the routing table here.
> > > > +		 */
> > > > +		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> > > > +			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> > > > +			       state->routing.routes,
> > > > +			       min(state->routing.num_routes, routing->len_routes) *
> > > > +			       sizeof(*state->routing.routes));
> > > > +			routing->num_routes = state->routing.num_routes;
> > > > +
> > > > +			return 0;
> > > > +		}
> > > > +
> > 
> > I think this should be done after the next code block that validates the
> > arguments. Otherwise the S_ROUTING ioctl will behave differently with
> > regard to blatantly invalid arguments, depending on whether or not the
> > subdev implements the .set_routing() operation. This can confuse
> > userspace, and does confuse v4l2-compliance.
> > 
> > I have the following change in my tree that fixes the problem, feel free
> > to squash it with this patch in v9.
> > 
> > commit 1e1f03eb8bc118c53a9deab05063d71a2fe7aa5f
> > Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Date:   Tue Apr 2 02:06:01 2024 +0300
> > 
> >     fixup! media: v4l: subdev: Add trivial set_routing support
> > 
> >     Validate arguments before handling the trivial set_routing support to
> >     expose a consistent behaviour to userspace. This fixes an issue with
> >     v4l2-compliance.
> > 
> >     Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks, I'll squash this into the patch.
> 
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index def91ab32c07..129867ed2bad 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -933,19 +933,12 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		memset(routing->reserved, 0, sizeof(routing->reserved));
> > 
> >  		/*
> > -		 * If the driver doesn't support setting routing, just return
> > -		 * the routing table here.
> > +		 * Perform argument validation first, or subdevs that don't
> > +		 * support setting routing will not return an error when
> > +		 * arguments are blatantly wrong. The difference in behaviour
> > +		 * could be confusing for userspace, and in particular for API
> > +		 * compliance checkers.
> 
> This is more fit for development time discussion, not something that should
> be left in the code IMO.

I added that comment to make sure that the next developer who refactors
the code will not end up changing the order and introducing subtle
breakages without realizing it. There's a high chance we wouldn't catch
the problem during review if this happens after our brain caches get
flushed.

> > -		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> > -			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> > -			       state->routing.routes,
> > -			       min(state->routing.num_routes, routing->len_routes) *
> > -			       sizeof(*state->routing.routes));
> > -			routing->num_routes = state->routing.num_routes;
> > -
> > -			return 0;
> > -		}
> > -
> >  		for (i = 0; i < routing->num_routes; ++i) {
> >  			const struct v4l2_subdev_route *route = &routes[i];
> >  			const struct media_pad *pads = sd->entity.pads;
> > @@ -969,6 +962,20 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  				return -EINVAL;
> >  		}
> > 
> > +		/*
> > +		 * If the driver doesn't support setting routing, just return
> > +		 * the routing table here.
> > +		 */
> > +		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> > +			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> > +			       state->routing.routes,
> > +			       min(state->routing.num_routes, routing->len_routes) *
> > +			       sizeof(*state->routing.routes));
> > +			routing->num_routes = state->routing.num_routes;
> > +
> > +			return 0;
> > +		}
> > +
> >  		krouting.num_routes = routing->num_routes;
> >  		krouting.len_routes = routing->len_routes;
> >  		krouting.routes = routes;
> > 
> > 
> > > >  		for (i = 0; i < routing->num_routes; ++i) {
> > > >  			const struct v4l2_subdev_route *route = &routes[i];
> > > >  			const struct media_pad *pads = sd->entity.pads;

-- 
Regards,

Laurent Pinchart

