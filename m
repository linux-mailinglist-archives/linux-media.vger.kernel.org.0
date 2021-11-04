Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8698644534D
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 13:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhKDMuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 08:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhKDMuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 08:50:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5F3C061714;
        Thu,  4 Nov 2021 05:47:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-10-233-nat.elisa-mobile.fi [85.76.10.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FAB1E52;
        Thu,  4 Nov 2021 13:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636030058;
        bh=jqK037rTkFhq0dshtnlxaTIDkJboBkHRFVMrkuRsH8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RE/iEdVOO1SRvcGHkoa5cnmgcfJaBDrGDXAWt4OMAbMPmLFJb9rDpm9DfXYoRBX0a
         Sjpma+jy/aMHVCXlwab01131bNbLDYqX8LI3KnIdNwyWr051uXfCo4OxUM9MzbnUCG
         eCnSSPA+Rsegee53v+TsNIQ8DWKQlKkb58YIMuRA=
Date:   Thu, 4 Nov 2021 14:47:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Message-ID: <YYPWUiPT80zQ7sKo@pendragon.ideasonboard.com>
References: <20211103135418.496f75d5@sal.lan>
 <YYOts0aoD/Quo5r6@pendragon.ideasonboard.com>
 <20211104105051.4836fafb@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211104105051.4836fafb@sal.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Nov 04, 2021 at 10:50:51AM +0000, Mauro Carvalho Chehab wrote:
> Em Thu, 4 Nov 2021 11:53:55 +0200 Laurent Pinchart escreveu:
> > On Wed, Nov 03, 2021 at 01:54:18PM +0000, Mauro Carvalho Chehab wrote:
> > > Hi,
> > > 
> > > From what I've seen so far, those are the main issues with regards to V4L2 API,
> > > in order to allow a generic V4L2 application to work with it.
> > > 
> > > MMAP support
> > > ============
> > > 
> > > Despite having some MMAP code on it, the current implementation is broken. 
> > > Fixing it is not trivial, as it would require fixing the HMM support on it, 
> > > which does several tricks.
> > > 
> > > The best would be to replace it by something simpler. If this is similar
> > > enough to IPU3, perhaps one idea would be to replace the HMM code on it by 
> > > videodev2 + IPU3 HMM code.
> > > 
> > > As this is not trivial, I'm postponing such task. If someone has enough
> > > time, it would be great to have this fixed.
> > > 
> > > From my side, I opted to add support for USERPTR on camorama:
> > > 
> > > 	https://github.com/alessio/camorama  
> > 
> > We should *really* phase out USERPTR support. 
> 
> I'm not a big fan of userptr, buy why do we phase it out?

Because USERPTR is broken by design. It gives a false promise to
userspace that a user pointer can be DMA'ed to, and this isn't generally
true. Even if buffer are carefully allocated to be compatible with the
device requirements, there are corner cases that prevent making a
mechanism based on get_user_pages() a first class citizen. In any case,
USERPTR makes life more difficult for the kernel.

There may be some use cases for which USERPTR could be an appropriate
solution, but now that we have DMABUF (and of course MMAP), I see no
reason to continue supporting USERPTR forever, and certainly not adding
new users.

> > Worst case you may support
> > DMABUF only if MMAP is problematic, but I don't really see why it could
> > be easy to map an imported buffer and difficult to map a buffer
> > allocated by the driver. videobuf2 should be used.
> 
> Yeah, atomisp should be migrated to VB2, and such migration is listed at
> its TODO file. However, this is a complex task, as its memory management
> code is very complex.

Have a look at GPU memory management, and you'll find the atomisp driver
very simple in comparison :-)

I'm also pretty sure that drivers/staging/media/atomisp/pci/hmm/ could
be rewritten to use more of the existing kernel frameworks.

> Maybe we could try to use the ISP3 code on it,
> replacing the current HMM logic, but not sure if the implementation there 
> would be compatible.

I'd be surprised if the IPU3 was compatible.

> In any case, the current priority is to make the driver to work, fixing 
> the V4L2 API implementation, which has several issues.
> 
> ...
> 
> > > Video devices
> > > =============
> > > 
> > > Currently, 10 video? devices are created:
> > > 
> > > 	$ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
> > > 	/dev/video0:	Name             : ATOMISP ISP CAPTURE output
> > > 	/dev/video1:	Name             : ATOMISP ISP VIEWFINDER output
> > > 	/dev/video2:	Name             : ATOMISP ISP PREVIEW output
> > > 	/dev/video3:	Name             : ATOMISP ISP VIDEO output
> > > 	/dev/video4:	Name             : ATOMISP ISP ACC
> > > 	/dev/video5:	Name             : ATOMISP ISP MEMORY input
> > > 	/dev/video6:	Name             : ATOMISP ISP CAPTURE output
> > > 	/dev/video7:	Name             : ATOMISP ISP VIEWFINDER output
> > > 	/dev/video8:	Name             : ATOMISP ISP PREVIEW output
> > > 	/dev/video9:	Name             : ATOMISP ISP VIDEO output
> > > 	/dev/video10:	Name             : ATOMISP ISP ACC
> > > 
> > > That seems to be written to satisfy some Android-based app, but we don't
> > > really need all of those.
> > > 
> > > I'm thinking to comment out the part of the code which creates all of those,
> > > keeping just "ATOMISP ISP PREVIEW output", as I don't think we need all
> > > of those.  
> > 
> > Why is that ? Being able to capture multiple streams in different
> > resolutions is important for lots of applications, the viewfinder
> > resolution is often different than the video streaming and/or still
> > capture resolution. Scaling after capture is often expensive (and there
> > are memory bandwidth and power constraints to take into account too). A
> > single-stream device may be better than nothing, but it's time to move
> > to the 21st century.
> 
> True, but having multiple videonodes at this moment is not helping,
> specially since only one of such modes (PREVIEW) is actually working at
> the moment.
> 
> So, this is more a strategy to help focusing on making this work
> properly, and not a statement that those modules would be dropped.
> 
> I'd say that the "final" version of atomisp - once it gets 
> fixed, cleaned up and started being MC-controlled - should support
> all such features, and have the pipelines setup via libcamera.

I have no issue with phasing development (I have few issues with the
atomisp driver in general actually, as it's in staging), but the goal
should be kept in mind to make sure development goes in the right
direction.

-- 
Regards,

Laurent Pinchart
