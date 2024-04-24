Return-Path: <linux-media+bounces-10067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3262A8B0F61
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 18:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1805281FBD
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 16:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930ED15FD15;
	Wed, 24 Apr 2024 16:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fo2bwpTr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508A613D893
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 16:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713974845; cv=none; b=iT5Dg5RiapQ2DSaXdEpVDl3Vk1C44Osq5W/78UN99ThkrdGzltNJ9YETC3evELRv2liHqT5nPBQpCYtcA3iUgVJWQnId0TU7ZO0xo5o8BV7Y8H4EQ+DSSA9Ao/X18KgYXiI8PlgPvw1NTHPK140Ff+v3Hf9OqPZiEMjKPVlkKms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713974845; c=relaxed/simple;
	bh=pAtKt4pHpvOZRSbK9R54YrAqTi9ciaxYZuVwsBR7i6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXyZcMbjfpmVo+w6ADBl5VX+tYm49IggFOkmXfEBvTb9P78HDNkcCTFtmGOliDLZ6ftMZGLYYAnmr68TpFCPN6qcCmIx75D5ziPCI3yT+zHL4qwiNxEnGodMdGVMwY1ApzgKy04+RXN6k4XuipsVRJkP/BBBJgV4JXRtaAgoCSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fo2bwpTr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9C18674;
	Wed, 24 Apr 2024 18:06:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713974783;
	bh=pAtKt4pHpvOZRSbK9R54YrAqTi9ciaxYZuVwsBR7i6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fo2bwpTrjqcG+YRG5BZD9iN0qpmKVE5Zq/r/gGX97RSRIxgMsYcpPmE3F6+DQY10/
	 oPXD8Waw948JQrArxCDL0UaNn/U7P7NdFDRCPIMLPL6BzDbw0caXJ8s/MifviPzxEU
	 flhJQbP8RNltPE6W6bWD/Tics8/4jyOB76yNmq+U=
Date: Wed, 24 Apr 2024 19:07:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: Re: [v4l-utils] [PATCH v2 3/7] v4l2-compliance: Support the changed
 routing API
Message-ID: <20240424160708.GD32190@pendragon.ideasonboard.com>
References: <20240424152230.31923-1-laurent.pinchart@ideasonboard.com>
 <20240424152230.31923-4-laurent.pinchart@ideasonboard.com>
 <42abcacf-a160-4aed-8474-84f89c85f166@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <42abcacf-a160-4aed-8474-84f89c85f166@xs4all.nl>

Hi Hans,

On Wed, Apr 24, 2024 at 05:50:56PM +0200, Hans Verkuil wrote:
> On 24/04/2024 17:22, Laurent Pinchart wrote:
> > Set len_routes of struct v4l2_subdev_routing. ENOSPC error code is no
> > longer used, i.e. having room for fewer routes than exist in the
> > configuration is not considered an error anymore.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  utils/v4l2-compliance/v4l2-compliance.cpp   | 12 +++++++-----
> >  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 19 +++++++++++--------
> >  2 files changed, 18 insertions(+), 13 deletions(-)
> > 
> > diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> > index fd7e7d76e214..144f961842c6 100644
> > --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> > +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> > @@ -1272,15 +1272,17 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
> >  
> >  			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
> >  				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
> > +				struct v4l2_subdev_routing &routing = sd_routing[which];
> >  
> > -				sd_routing[which].which = which;
> > -				sd_routing[which].routes = (uintptr_t)sd_routes[which];
> > -				sd_routing[which].num_routes = NUM_ROUTES_MAX;
> > +				routing.which = which;
> > +				routing.routes = (uintptr_t)sd_routes[which];
> > +				routing.len_routes = NUM_ROUTES_MAX;
> > +				routing.num_routes = 0;
> >  
> > -				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which]);
> > +				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &routing);
> >  				if (ret) {
> >  					fail("VIDIOC_SUBDEV_G_ROUTING: failed to get routing\n");
> > -					sd_routing[which].num_routes = 0;
> > +					routing.num_routes = 0;
> >  				}
> >  			}
> >  		}
> > diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> > index da304a8caa8a..41eaf77112f0 100644
> > --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> > +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> > @@ -587,17 +587,15 @@ int testSubDevRouting(struct node *node, unsigned which)
> >  
> >  	routing.which = which;
> >  	routing.routes = (uintptr_t)&routes;
> > +	routing.len_routes = 0;
> >  	routing.num_routes = 0;
> >  	memset(routing.reserved, 0xff, sizeof(routing.reserved));
> >  
> > -	/*
> > -	 * First test that G_ROUTING either returns success, or ENOSPC and
> > -	 * updates num_routes.
> > -	 */
> > +	/* First test that G_ROUTING returns success even when len_routes is 0. */
> >  
> >  	ret = doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing);
> > -	fail_on_test(ret && ret != ENOSPC);
> > -	fail_on_test(ret == ENOSPC && routing.num_routes == 0);
> > +	fail_on_test(ret);
> > +	fail_on_test(routing.num_routes > NUM_ROUTES_MAX);
> >  	fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
> >  
> >  	if (!routing.num_routes)
> > @@ -609,7 +607,8 @@ int testSubDevRouting(struct node *node, unsigned which)
> >  	 */
> >  
> >  	uint32_t num_routes = routing.num_routes;
> > -	routing.num_routes = num_routes + 1;
> > +	routing.len_routes = NUM_ROUTES_MAX;
> > +	routing.num_routes = 0;
> >  	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
> >  	fail_on_test(routing.num_routes != num_routes);
> >  
> > @@ -633,10 +632,14 @@ int testSubDevRouting(struct node *node, unsigned which)
> >  		}
> >  	}
> >  
> > -	/* Set the same routes back, which should always succeed. */
> > +	/*
> > +	 * Set the same routes back, which should always succeed and report the
> > +	 * same number of routes.
> > +	 */
> >  
> >  	memset(routing.reserved, 0xff, sizeof(routing.reserved));
> >  	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing));
> > +	fail_on_test(routing.num_routes != num_routes);
> >  	fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
> 
> I think this needs another test: if S_ROUTING is called with num_routes > len_routes,
> then EINVAL must be returned. This is an important test to make sure the core handles
> this correctly and won't be using more than len_routes routes.

I'll add the test now, that should be easy. I'll push an update to my
branch but won't repost the patches yet, to let reviewers a chance to
check the series.

> >  
> >  	/* Test setting invalid pads */

-- 
Regards,

Laurent Pinchart

