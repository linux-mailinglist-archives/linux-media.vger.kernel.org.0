Return-Path: <linux-media+bounces-8316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BACE8947D8
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 01:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 134B81F228DE
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 23:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7455257301;
	Mon,  1 Apr 2024 23:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EYDTqR/Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B624456760
	for <linux-media@vger.kernel.org>; Mon,  1 Apr 2024 23:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712014878; cv=none; b=U18k3IErnG8PKXFEyar0wxL5u9Uof77BxAvMMrAFbJhC52+6VgZuXLHEBy8iqNroybaZCUoVvUby2q98wTTRjj5aahSLQTwigtfArTU9mkxuyxB4Gmit6Vn+5v0x4RrVAxNX++Sg8jr8jPO91aB3Ro290hawfyWPL4h9mznkyNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712014878; c=relaxed/simple;
	bh=wttrjGXo0jxom7NyE7V7MIlx7/1FGvenCwkzS0fo0KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdPUkWh0bmAHQ+bDB9MozZI2uwq1o/NOtLu+wVJXmVTa01le7HrqRqt+kV1sFWrm5iOsBqZOz2/2RjPOSG+CZiFEHiBH8g0EC4aAmnAlcauzg0Y1tXIOz5eiwPA/+oIKSQkbj/umcjkELyE4y27nwIHGsLsGs8JnxjOKDrDaPzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EYDTqR/Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6713C2A5;
	Tue,  2 Apr 2024 01:40:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712014838;
	bh=wttrjGXo0jxom7NyE7V7MIlx7/1FGvenCwkzS0fo0KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EYDTqR/ZxCp670XTYBgnL+ibd5F7E1uA46UsAzyoDAwfrb3FgOCnnC8HVRKv4sNJe
	 /Ju3CHzzFDIpaKm/ku6eXGc61kSgYItojVv8TuiTvng8epCibCQLOIjoJ5nGlhO2hf
	 zjZ8/9YajhGmdoSwQwzeVOQWCqzkuRtYsVNla0Ck=
Date: Tue, 2 Apr 2024 02:41:05 +0300
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
Message-ID: <20240401234105.GA2492@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-18-sakari.ailus@linux.intel.com>
 <20240320015558.GV8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240320015558.GV8501@pendragon.ideasonboard.com>

On Wed, Mar 20, 2024 at 03:55:58AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:24:55AM +0200, Sakari Ailus wrote:
> > Add trivial S_ROUTING IOCTL support for drivers where routing is static.
> > Essentially this means returning the same information G_ROUTING call would
> > have done.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Actually...

> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index a6107e440ef0..c8c435df92c8 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -930,6 +930,20 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  
> >  		memset(routing->reserved, 0, sizeof(routing->reserved));
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

I think this should be done after the next code block that validates the
arguments. Otherwise the S_ROUTING ioctl will behave differently with
regard to blatantly invalid arguments, depending on whether or not the
subdev implements the .set_routing() operation. This can confuse
userspace, and does confuse v4l2-compliance.

I have the following change in my tree that fixes the problem, feel free
to squash it with this patch in v9.

commit 1e1f03eb8bc118c53a9deab05063d71a2fe7aa5f
Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Tue Apr 2 02:06:01 2024 +0300

    fixup! media: v4l: subdev: Add trivial set_routing support

    Validate arguments before handling the trivial set_routing support to
    expose a consistent behaviour to userspace. This fixes an issue with
    v4l2-compliance.

    Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index def91ab32c07..129867ed2bad 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -933,19 +933,12 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		memset(routing->reserved, 0, sizeof(routing->reserved));

 		/*
-		 * If the driver doesn't support setting routing, just return
-		 * the routing table here.
+		 * Perform argument validation first, or subdevs that don't
+		 * support setting routing will not return an error when
+		 * arguments are blatantly wrong. The difference in behaviour
+		 * could be confusing for userspace, and in particular for API
+		 * compliance checkers.
 		 */
-		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
-			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-			       state->routing.routes,
-			       min(state->routing.num_routes, routing->len_routes) *
-			       sizeof(*state->routing.routes));
-			routing->num_routes = state->routing.num_routes;
-
-			return 0;
-		}
-
 		for (i = 0; i < routing->num_routes; ++i) {
 			const struct v4l2_subdev_route *route = &routes[i];
 			const struct media_pad *pads = sd->entity.pads;
@@ -969,6 +962,20 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 				return -EINVAL;
 		}

+		/*
+		 * If the driver doesn't support setting routing, just return
+		 * the routing table here.
+		 */
+		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
+			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
+			       state->routing.routes,
+			       min(state->routing.num_routes, routing->len_routes) *
+			       sizeof(*state->routing.routes));
+			routing->num_routes = state->routing.num_routes;
+
+			return 0;
+		}
+
 		krouting.num_routes = routing->num_routes;
 		krouting.len_routes = routing->len_routes;
 		krouting.routes = routes;


> >  		for (i = 0; i < routing->num_routes; ++i) {
> >  			const struct v4l2_subdev_route *route = &routes[i];
> >  			const struct media_pad *pads = sd->entity.pads;

-- 
Regards,

Laurent Pinchart

