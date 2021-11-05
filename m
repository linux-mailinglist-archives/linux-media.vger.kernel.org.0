Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50434468B3
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 19:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbhKES6P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 14:58:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:58452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233172AbhKES6N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 14:58:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17DA66120D;
        Fri,  5 Nov 2021 18:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636138533;
        bh=3qx/OsMBOfLKMVE67cIPP+56zsEesvy1E4J/OSBexWc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lleeFoWFWQWdGWFpPS6kpx1bcWZV5rF69LjeahPn7uX4k53718bCxh4KE7iDbjDPf
         4pPh5FPX6RZN/GILjFmKXSL8urcYPv3fbs18PUerkV+vpe8oAa6ZsOWBZ4PVm0AbPM
         F3mTMlw0IMuhNUpthtv0xyyuAlso1hH7Jvp3cp+V7yNUns4LihglZgeYRYxqDCWipJ
         gRLpMJI1hQNMA6caDhSGFcDyTod2/0l8h9dOwmAWxINqXUw+5NdxwTWvhUWzEzJtKU
         0lkI/u0g8BKsUYEGJg2X0DUCit4ZQXWQsDcu43zObVGLwqu4eYodTrxLp5l/2EPb7R
         3KpcvT6Yt4vXw==
Date:   Fri, 5 Nov 2021 18:55:26 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>, linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: atomisp current issues
Message-ID: <20211105185526.1b91d679@sal.lan>
In-Reply-To: <YYPWUiPT80zQ7sKo@pendragon.ideasonboard.com>
References: <20211103135418.496f75d5@sal.lan>
        <YYOts0aoD/Quo5r6@pendragon.ideasonboard.com>
        <20211104105051.4836fafb@sal.lan>
        <YYPWUiPT80zQ7sKo@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 4 Nov 2021 14:47:14 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Thu, Nov 04, 2021 at 10:50:51AM +0000, Mauro Carvalho Chehab wrote:
> > Em Thu, 4 Nov 2021 11:53:55 +0200 Laurent Pinchart escreveu:  
> > > On Wed, Nov 03, 2021 at 01:54:18PM +0000, Mauro Carvalho Chehab wrote:  
> > > > Hi,
> > > > 
> > > > From what I've seen so far, those are the main issues with regards to V4L2 API,
> > > > in order to allow a generic V4L2 application to work with it.
> > > > 
> > > > MMAP support
> > > > ============
> > > > 
> > > > Despite having some MMAP code on it, the current implementation is broken. 
> > > > Fixing it is not trivial, as it would require fixing the HMM support on it, 
> > > > which does several tricks.
> > > > 
> > > > The best would be to replace it by something simpler. If this is similar
> > > > enough to IPU3, perhaps one idea would be to replace the HMM code on it by 
> > > > videodev2 + IPU3 HMM code.
> > > > 
> > > > As this is not trivial, I'm postponing such task. If someone has enough
> > > > time, it would be great to have this fixed.
> > > > 
> > > > From my side, I opted to add support for USERPTR on camorama:
> > > > 
> > > > 	https://github.com/alessio/camorama    
> > > 
> > > We should *really* phase out USERPTR support.   
> > 
> > I'm not a big fan of userptr, buy why do we phase it out?  
> 
> Because USERPTR is broken by design. It gives a false promise to
> userspace that a user pointer can be DMA'ed to, and this isn't generally
> true. 

Actually, the only promise USERPTR gives is that the driver should
be able to store streaming data on it (usually done via DMA from
the V4L2 card to the memory).

It never promised - or was designed - to be used on embedded
devices and allow DMA transfers to GPU. See, the original design
is from 1999 and it was focused only on x86 archs ;-)

The thing is that it was an alternative to FBUF before DMABUF
was added.

But yeah, newer embedded device drivers should not enable it,
using instead VB2 and DMABUF.

Perhaps we should document it better at:
	https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/userp.html#userp

warning developers to use DMABUF when the goal is to share DMA buffers
with other drivers.

> Even if buffer are carefully allocated to be compatible with the
> device requirements, there are corner cases that prevent making a
> mechanism based on get_user_pages() a first class citizen.

Drivers that can't warrant that should disable support for it ;-)

> In any case,
> USERPTR makes life more difficult for the kernel.
> 
> There may be some use cases for which USERPTR could be an appropriate
> solution, but now that we have DMABUF (and of course MMAP), I see no
> reason to continue supporting USERPTR forever, and certainly not adding
> new users.

As we need to support this forever, IMO, it doesn't make sense to deny
patches adding new users for it - yet it makes sense to recommend not to,
specially on drivers whose usage would be on embedded systems.

> > > Worst case you may support
> > > DMABUF only if MMAP is problematic, but I don't really see why it could
> > > be easy to map an imported buffer and difficult to map a buffer
> > > allocated by the driver. videobuf2 should be used.  
> > 
> > Yeah, atomisp should be migrated to VB2, and such migration is listed at
> > its TODO file. However, this is a complex task, as its memory management
> > code is very complex.  
> 
> Have a look at GPU memory management, and you'll find the atomisp driver
> very simple in comparison :-)

Yeah, there are lots of complex thing at GPU mm. Yet, I don't see too much 
levels of abstraction there... the biggest issue on atomisp is that there
are usually two or three levels of abstraction between the actual 
implementation and the callers. It also has some hacks in the middle of code
that seems to be due to some special devices for Android.

> I'm also pretty sure that drivers/staging/media/atomisp/pci/hmm/ could
> be rewritten to use more of the existing kernel frameworks.

Yes, I guess so. Again, the problem is that the glue also require
changes and cleanups. It also requires migration from VB1 to VB2.

> > Maybe we could try to use the ISP3 code on it,
> > replacing the current HMM logic, but not sure if the implementation there 
> > would be compatible.  
> 
> I'd be surprised if the IPU3 was compatible.

If IPU3 started as an upgrade from ISP2, then maybe it is partially
compatible.

Anyway, further studies and tests are required.

> > In any case, the current priority is to make the driver to work, fixing 
> > the V4L2 API implementation, which has several issues.
> > 
> > ...
> >   
> > > > Video devices
> > > > =============
> > > > 
> > > > Currently, 10 video? devices are created:
> > > > 
> > > > 	$ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
> > > > 	/dev/video0:	Name             : ATOMISP ISP CAPTURE output
> > > > 	/dev/video1:	Name             : ATOMISP ISP VIEWFINDER output
> > > > 	/dev/video2:	Name             : ATOMISP ISP PREVIEW output
> > > > 	/dev/video3:	Name             : ATOMISP ISP VIDEO output
> > > > 	/dev/video4:	Name             : ATOMISP ISP ACC
> > > > 	/dev/video5:	Name             : ATOMISP ISP MEMORY input
> > > > 	/dev/video6:	Name             : ATOMISP ISP CAPTURE output
> > > > 	/dev/video7:	Name             : ATOMISP ISP VIEWFINDER output
> > > > 	/dev/video8:	Name             : ATOMISP ISP PREVIEW output
> > > > 	/dev/video9:	Name             : ATOMISP ISP VIDEO output
> > > > 	/dev/video10:	Name             : ATOMISP ISP ACC
> > > > 
> > > > That seems to be written to satisfy some Android-based app, but we don't
> > > > really need all of those.
> > > > 
> > > > I'm thinking to comment out the part of the code which creates all of those,
> > > > keeping just "ATOMISP ISP PREVIEW output", as I don't think we need all
> > > > of those.    
> > > 
> > > Why is that ? Being able to capture multiple streams in different
> > > resolutions is important for lots of applications, the viewfinder
> > > resolution is often different than the video streaming and/or still
> > > capture resolution. Scaling after capture is often expensive (and there
> > > are memory bandwidth and power constraints to take into account too). A
> > > single-stream device may be better than nothing, but it's time to move
> > > to the 21st century.  
> > 
> > True, but having multiple videonodes at this moment is not helping,
> > specially since only one of such modes (PREVIEW) is actually working at
> > the moment.
> > 
> > So, this is more a strategy to help focusing on making this work
> > properly, and not a statement that those modules would be dropped.
> > 
> > I'd say that the "final" version of atomisp - once it gets 
> > fixed, cleaned up and started being MC-controlled - should support
> > all such features, and have the pipelines setup via libcamera.  
> 
> I have no issue with phasing development (I have few issues with the
> atomisp driver in general actually, as it's in staging), but the goal
> should be kept in mind to make sure development goes in the right
> direction.

Yeah, surely it needs to progress at the right direction. We're
just too far of having it ready to be ported to MC and libcamera...
there are too many issues to be solved.

Regards,
Mauro

