Return-Path: <linux-media+bounces-13182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAFD906985
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 11:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ADC91F2182A
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A01B1411D8;
	Thu, 13 Jun 2024 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hu5cS9rg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F8E13E036
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272768; cv=none; b=Ri1AUnHPZ0AOMyC/r4UzpMtdU2mOOlIPAXYUHPh1zz06oT5BwHhdxSFJJ6WF7b+oWnqjcb1xSGeaaL4Ruo+1DUA2rTOTZAvtdVxHqbEUaLUOg1fGXXN8zcPSqEWppGdIthsW34UCqsyj3Q9F/Hhut1nGs9fW2XcZXuQB/i3yLcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272768; c=relaxed/simple;
	bh=0DDy1C07VV53dm4IMPLJSemE8lC3tRihpGMsRKwo2cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmczN6q5vgrbZp5GkoxH4SzmKtyFAyjTcwicBuavaMNq1lhKAxTHiOT3SP+19xU4rK56f08mtXToZiNu3N+msLqQ7Fs+EZJIZ4WQQBWo2Nf1tL3r7fL6MEKVVB/AUSC7j6GyiK4veg7VBZzlwuHqwQ1LA77FEBZl120+PnFPeWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hu5cS9rg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E14EBEB;
	Thu, 13 Jun 2024 11:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718272751;
	bh=0DDy1C07VV53dm4IMPLJSemE8lC3tRihpGMsRKwo2cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hu5cS9rgGmiFslp6ium/pmoPCPmtIBdH3kcqTYfWUplVHRnb7MTLZsRy686vaS1ZP
	 48J0KJxmM5AM8/kRqXlzwQKg4sWplX7rJSWhVIQsumEyWlPo4R418h2Sx4F02aUZWR
	 Zc//BALYe7YwK4D+9Z0yHUz9VCzvemtSS7EZZbWY=
Date: Thu, 13 Jun 2024 12:59:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <20240613095904.GE7291@pendragon.ideasonboard.com>
References: <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
 <20240612095448.1e99b751@coco.lan>
 <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
 <20240612083430.GE28989@pendragon.ideasonboard.com>
 <20240612224406.41dd88fc@coco.lan>
 <20240612205249.GB11102@pendragon.ideasonboard.com>
 <ae8cc9b0-2792-4991-83b5-d6a5e50f2d2e@xs4all.nl>
 <20240613091213.GC7291@pendragon.ideasonboard.com>
 <475341fe-39bf-4104-bcf1-c4fd7ff73a68@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <475341fe-39bf-4104-bcf1-c4fd7ff73a68@xs4all.nl>

On Thu, Jun 13, 2024 at 11:38:47AM +0200, Hans Verkuil wrote:
> On 13/06/2024 11:12, Laurent Pinchart wrote:
> > On Thu, Jun 13, 2024 at 09:08:55AM +0200, Hans Verkuil wrote:
> >> On 12/06/2024 22:52, Laurent Pinchart wrote:
> >>> On Wed, Jun 12, 2024 at 10:44:06PM +0200, Mauro Carvalho Chehab wrote:
> >>>> Em Wed, 12 Jun 2024 11:34:30 +0300 Laurent Pinchart escreveu:
> >>>>
> >>>>> Focussing on this topic, if we're brainstorming memory management for
> >>>>> media devices, I'd like to throw in a controversial idea. In addition to
> >>>>> being clearer on the fact that USERPTR is deprecated, I would like to
> >>>>> deprecate MMAP too and only focus on DMABUF. I believe Linux needs a
> >>>>> centralized buffer allocator, instead of having multiple allocation APIs
> >>>>> scattered in different places. There are design ideas in gralloc that we
> >>>>> could benefit from.
> >>>>
> >>>> Deprecating USERPTR is doable, as not many apps use it, and they're
> >>>> mostly focused on complex camera/ARM scenario. Now, deprecating MMAP at 
> >>>> V4L2 core is a different history: lots of different userspace programs,
> >>>> including browsers and proprietary apps like zoom, etc. rely on MMAP
> >>>> support. We can only consider deprecating MMAP once applications switch 
> >>>> to DMABUF.
> >>>
> >>> Deprecating doesn't mean dropping it right away, it means telling
> >>> application developers that DMABUF is the recommended way. We will still
> >>> have to support MMAP for a long time, including fixing bugs in it, as
> >>> that will be a long transition. And it first requires solving the
> >>> problem of centralizing allocation for DMABUF. It won't happen
> >>> overnight, but I'm trying to gather support for the idea, and get people
> >>> to collaborate on solving the technical problems that are currently
> >>> blocking this long term evolution. If the media subsystem endorsed the
> >>> effort, basically saying publicly that we are fine deprecating MMAP in
> >>> principle once a good replacement will be available, it may help. I
> >>> don't expect the deprecation to happen before at least two years, and
> >>> the removal from the kernel would probably take another 10 to 15 years
> >>> :-)
> >>
> >> IMHO you cannot removed MMAP support: it is the only streaming I/O method
> >> that is supported by all drivers, whereas DMABUF isn't. And many, many userspace
> >> applications use that. Nor does it pose problems: it just works.
> > 
> > I may have failed to get my point across properly, so I'll try again :-)
> > 
> > What I would like to do is
> > 
> > 1. Explore how we can implement a centralized allocator that
> > applications can use on any Linux system to provide dmabuf instances.
> 
> Would be nice.
> 
> > 2. Implement that allocator.
> 
> Good.
> 
> 2.5: start adding DMABUF support to all drivers that do not yet
> support this.
> 
> > 3. Deprecate MMAP, meaning documenting that users of V4L2 should use the
> > centralized allocator and DMABUF. No code change in V4L2, no removal of
> > MMAP, and bugs in MMAP support would keep being addressed.
> > 
> > 4. 5-10 years later, start scheduling MMAP removal, as in setting a date
> > for it.
> > 
> > 5. 5-10 years more in the future, drop MMAP when nobody will be using it
> > anymore.
> 
> 3-5: seems pointless to me. It would break many userspace applications.
> 
> Frankly, MMAP just works, and has since forever. Perhaps at some point
> we might switch to dmabufs internally to vb2 (that would require that
> the driver can call that central allocator!) if that would simplify
> matters, but in the uAPI we need to keep MMAP.

3 is important in my opinion, it's about telling, once 1-2 are in place,
that new applications should use the new API. It doesn't break anything
because it doesn't change any code in the kernel. The only thing that
will change is the V4L2 documentation, to tell users "please use DMABUF
for new applications". Nothing more than that.

4-5 are not strictly necessary, and are for much later anyway. They're
about dropping a feature once all users will be gone. If it happens, it
won't break anything because nobody will notice :-)

> > It's phases 1 to 3 that I'm the most interested in. 4 and 5 are just
> > about dropping code *when* MMAP isn't used anymore *iff* that ever
> > happens.
> > 
> >> USERPTR support is another matter: there have been problems with it, and
> >> the vb2 code is hard to understand and to support.
> >>
> >> I wouldn't shed a tear if it disappears. The strategy would be to first
> >> make sure any driver supporting USERPTR also supports DMABUF, and then
> >> put USERPTR under a kernel config option. Initially it would default to y,
> >> but issue a warning, and later (after a few years) it can default to n
> >> and eventually be removed.

-- 
Regards,

Laurent Pinchart

