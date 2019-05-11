Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E63E1A937
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2019 21:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfEKTT6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 May 2019 15:19:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57366 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfEKTT5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 May 2019 15:19:57 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D31002B6;
        Sat, 11 May 2019 21:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557602395;
        bh=N9FrpQlMLYI6rzPXpiofwX81vn3OadVb+j/RphktR9I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pY7cNStGazVJAdCKEQrnAPB7kQ6hKJptdbsC4lVJxZhR3HdGXaZaTYobcwYKxaSYE
         4x/UVeve1OCI5rYM4gSvx4HPxe/i9EKZVOyLrvMGzPOibRNi3I8EvfHcdJZHsDf1N4
         AIHdv78uiYefUPYLrh2u7ekvhJP9Y8XLrIOJBo1s=
Date:   Sat, 11 May 2019 22:19:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 00/20] drm: Split out the formats API and move it to a
 common place
Message-ID: <20190511191938.GM13043@pendragon.ideasonboard.com>
References: <cover.8ec406bf8f4f097e9dc909d5aac466556822f592.1555487650.git-series.maxime.ripard@bootlin.com>
 <20190417154121.GJ13337@phenom.ffwll.local>
 <20190418062229.eyog4i62eg4pr6uf@flea>
 <CAKMK7uHwSjqXwWGt+wQ6oMFWoPqmBxYHL7r+vTOXdYt9KMCYLQ@mail.gmail.com>
 <20190418090221.e57dogn4yx5nwdni@flea>
 <6578c22ddf5420d4dead69d29f451bc6a91f6c4a.camel@bootlin.com>
 <20190420224045.GY4964@pendragon.ideasonboard.com>
 <06f3722e96df32c02421105cab1280f2fbe52e2b.camel@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06f3722e96df32c02421105cab1280f2fbe52e2b.camel@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Tue, Apr 23, 2019 at 06:54:49PM +0200, Paul Kocialkowski wrote:
> Le dimanche 21 avril 2019 à 01:40 +0300, Laurent Pinchart a écrit :
> > On Thu, Apr 18, 2019 at 01:49:54PM +0200, Paul Kocialkowski wrote:
> >> On Thu, 2019-04-18 at 11:02 +0200, Maxime Ripard wrote:
> >>> On Thu, Apr 18, 2019 at 09:52:10AM +0200, Daniel Vetter wrote:
> >>>> And a lot of people pushed for the "fourcc is a standard", when
> >>>> really it's totally not.
> >>> 
> >>> Even if it's not a standard, having consistency would be a good thing.
> >>> 
> >>> And you said yourself that DRM fourcc is now pretty much an authority
> >>> for the fourcc, so it definitely looks like a standard to me.
> >> 
> >> I think trying to make the V4L2 and DRM fourccs converge is a lost
> >> cause, as it has already significantly diverged. Even if we coordinate
> >> an effort to introduce new formats with the same fourcc on both sides,
> >> I don't see what good that would be since the formats we have now are
> >> still plagued by the inconsistency.
> >> 
> >> I think we always need an explicit translation step from either v4l2 or
> >> drm to the internal representation and back, without ever assuming that
> >> formats might be compatible because they share the same fourcc.
> > 
> > I don't agree. APIs evolve, and while we can't switch from one set of
> > 4CCs to another in existing APIs, we could in new APIs. Boris is working
> > on new ioctls to handle formats in V4L2, and while 4CC unification could
> > be impopular from a userspace developers point of view there, I don't
> > think we have ruled it out completely. The move to the request API is
> > also an area where a common set of 4CCs could be used, as it will depart
> > from the existing V4L2 ioctls. To summarize my opinion, we're not there
> > yet, but I wouldn't rule it out completely for the future.
> 
> Well, I don't see how we could maintain backward compatibility with
> some DRM and V4L2 fourccs that are compatible and some that aren't.
> Since both descriptions have diverged already, one would need explicit
> checking of whether the format at hand is a compatible one or not
> before passing-it along as-is to the other subsystem or going through a
> format conversion step (in userspace, duplicating the information).
> So it feels like it kind of defeats the purpose.

Yes and no. If a V4L2-only application needs to deal with two sets of
4CCs for old and new APIs, it's a burden. However, if an application
that shares buffers between V4L2 and DRM/KMS can use a single set of
4CCs, that's a win, as those applications already need to convert. In
the end this shifts the problem from one set of applications to another,
but as soon as the new APIs get old enough to mandate their usage (which
would roughly be when the corresponding kernel ships in all supported
versions of all major distros), then applications will be able to drop
the conversion code, and everybody will be happier. Short term pain for
long term gain.

> If we're going to use a unified 4CC representation in the future, I
> think we should do it by using the new formats that this proposal is
> introducing instead of subsystem-specific formats. At which point I
> believe we will need an internal conversion step between that format
> and what the subsystem uses internally. Or do it the other way round
> and use the unified format all around the subsystem, with a legacy
> layer for the previous subsystem-specific format.

I agree with you. I would like new APIs to use unified 4CCs (probably
coming from DRM), and have an internal conversion from and to
subsystem-specific 4CCs where needed. That's quite a lot of work of
course, and won't happen overnight.

-- 
Regards,

Laurent Pinchart
