Return-Path: <linux-media+bounces-8532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 524A58972C4
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 16:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 842481C26639
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 14:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6583B56B70;
	Wed,  3 Apr 2024 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m2yvhUmJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0822F844
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712155019; cv=none; b=owaYGjSLnQmv+dJ3Rd0/6gESw+PWdK45twJYu7xj7mwo1u9w9FE4cC7wUXfS8zM8cL3rwfVDdT4qnlqCNk2uTrFttuo5qZc4YWlS7sC6LtL5EbXMg8DS2IXnk0QKztgZ7vd1cnT1gIxFxWQVKP2ZjmELV6hlx9ytezHoqwJhj0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712155019; c=relaxed/simple;
	bh=8dUbc9zhecS0jjvbkqRgljYCxE6OXUq1atq/qZVnxxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRP8r8Xts0zNE4+huLEb2wm3lJh5+UPm6FUHTFqnBwZt9GPssKi531Ie8QbB+Dws4oYM2OObnwBUtwm6Y99apluwT4H2fIAWkEs/L/K8oy4ThrHmf6+uiitKxhh+nVOjymRXnxy9A9JIIrekzn4rn2zbOa2dcHnjq6uVOQjsiKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m2yvhUmJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45A9A674;
	Wed,  3 Apr 2024 16:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712154978;
	bh=8dUbc9zhecS0jjvbkqRgljYCxE6OXUq1atq/qZVnxxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2yvhUmJXPIU1QoYZ5HlW0bNLHxMiSOH8BVDEl6IjqyLFBXkwNnCxwQjRcJ+Q8vPT
	 3k3DalbZ/IkTGrxxqSM9Ic3JUvWR/lL9T2xMuORWJGEO1epFO5Ad8GEX9XAg1RgCgs
	 4xbo6zexfs0CYvsbhQnJpHj1PxKG3jnRKVhP5bJI=
Date: Wed, 3 Apr 2024 17:36:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4l-utils v2 1/2] v4l2-compliance: Fix use of routing on
 32-bit platforms
Message-ID: <20240403143644.GR16740@pendragon.ideasonboard.com>
References: <20240403-v4l2-compliance-streams-fixes-v2-0-be9b338dc204@ideasonboard.com>
 <20240403-v4l2-compliance-streams-fixes-v2-1-be9b338dc204@ideasonboard.com>
 <4752414a-dc7d-41f9-a92f-a7a2a20f91e9@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4752414a-dc7d-41f9-a92f-a7a2a20f91e9@xs4all.nl>

On Wed, Apr 03, 2024 at 12:27:40PM +0200, Hans Verkuil wrote:
> On 03.04.2024 12:15, Tomi Valkeinen wrote:
> > At the moment we do:
> > 
> > routing.routes = (__u64)&routes;
> > 
> > On 32-bit platforms the 32-bit address will be sign-extended, possibly
> > resulting setting the address to, e.g., 0xff000000 -> 0xffffffffff000000.
> > 
> > Fix this by converting the address to uintptr_t.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> >  utils/v4l2-compliance/v4l2-compliance.cpp   | 4 ++--
> >  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> > index 2cf97909..fd7e7d76 100644
> > --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> > +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> > @@ -1274,7 +1274,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
> >  				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
> >  
> >  				sd_routing[which].which = which;
> > -				sd_routing[which].routes = (__u64)sd_routes[which];
> > +				sd_routing[which].routes = (uintptr_t)sd_routes[which];
> >  				sd_routing[which].num_routes = NUM_ROUTES_MAX;
> >  
> >  				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which]);
> > @@ -1305,7 +1305,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
> >  					routes = sd_routes[which];
> >  				} else {
> >  					dummy_routing.num_routes = 1;
> > -					dummy_routing.routes = (__u64)&dummy_routes;
> > +					dummy_routing.routes = (uintptr_t)&dummy_routes;
> >  					dummy_routes[0].source_pad = pad;
> >  					dummy_routes[0].source_stream = 0;
> >  					dummy_routes[0].sink_pad = pad;
> > diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> > index ebca1b94..560efb70 100644
> > --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> > +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> > @@ -586,7 +586,7 @@ int testSubDevRouting(struct node *node, unsigned which)
> >  	int ret;
> >  
> >  	routing.which = which;
> > -	routing.routes = (__u64)&routes;
> > +	routing.routes = (uintptr_t)&routes;
> >  	routing.num_routes = 0;
> >  	memset(routing.reserved, 0xff, sizeof(routing.reserved));
> >  

-- 
Regards,

Laurent Pinchart

