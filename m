Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78508311C62
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 10:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhBFJ34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Feb 2021 04:29:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:34920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229508AbhBFJ3z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Feb 2021 04:29:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CF9C64DFD;
        Sat,  6 Feb 2021 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612603754;
        bh=ra5EQF4KhGbkkIpiYGeKqQIM0s5ti2jSWpDdGHZm6K4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VIk6lubBMCtBxmcXHohRjyfTRDl2F6bXwR3aAGppQlw5wuBRgZhZqx4k1nz38kF0l
         qnMfhof/43+HgucIVLBG9PpaclcKV4xfKC3yqORPju7L8MR+OR5kZv7rhZxGX4dX6H
         Gdd5xJG8Y3L5uZ+kPe60tAwIHsM1v63dm0o4j5DU=
Date:   Sat, 6 Feb 2021 10:29:10 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Tony Battersby <tonyb@cybernetics.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-kernel@vger.kernel.org,
        Jari Ruusu <jariruusu@protonmail.com>,
        David Laight <David.Laight@aculab.com>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-media@vger.kernel.org
Subject: Re: Kernel version numbers after 4.9.255 and 4.4.255
Message-ID: <YB5hZop6JZ2Lgv63@kroah.com>
References: <a85b7749-38b2-8ce9-c15a-8acb9a54c5b5@kernel.org>
 <0b12bac9-1b4e-ec4a-8a45-5eb3f1dbbeca@cybernetics.com>
 <20210205191105.128c6e48@coco.lan>
 <YB5DTUiurAwqZbz1@kroah.com>
 <20210206102402.2611b23f@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210206102402.2611b23f@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Feb 06, 2021 at 10:24:02AM +0100, Mauro Carvalho Chehab wrote:
> Em Sat, 6 Feb 2021 08:20:45 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
> 
> > On Fri, Feb 05, 2021 at 07:11:05PM +0100, Mauro Carvalho Chehab wrote:
> > > Em Fri, 5 Feb 2021 12:31:05 -0500
> > > Tony Battersby <tonyb@cybernetics.com> escreveu:
> > >   
> > > > On 2/4/21 6:00 AM, Jiri Slaby wrote:  
> > > > > Agreed. But currently, sublevel won't "wrap", it will "overflow" to 
> > > > > patchlevel. And that might be a problem. So we might need to update the 
> > > > > header generation using e.g. "sublevel & 0xff" (wrap around) or 
> > > > > "sublevel > 255 : 255 : sublevel" (be monotonic and get stuck at 255).
> > > > >
> > > > > In both LINUX_VERSION_CODE generation and KERNEL_VERSION proper.    
> > > > 
> > > > My preference would be to be monotonic and get stuck at 255 to avoid
> > > > breaking out-of-tree modules.  If needed, add another macro that
> > > > increases the number of bits that can be used to check for sublevels >
> > > > 255, while keeping the old macros for compatibility reasons.  Since
> > > > sublevels > 255 have never existed before, any such checks must be
> > > > newly-added, so they can be required to use the new macros.
> > > > 
> > > > I do not run the 4.4/4.9 kernels usually, but I do sometimes test a wide
> > > > range of kernels from 3.18 (gasp!) up to the latest when bisecting,
> > > > benchmarking, or debugging problems.  And I use a number of out-of-tree
> > > > modules that rely on the KERNEL_VERSION to make everything work.  Some
> > > > out-of-tree modules like an updated igb network driver might be needed
> > > > to make it possible to test the old kernel on particular hardware.
> > > > 
> > > > In the worst case, I can patch LINUX_VERSION_CODE and KERNEL_VERSION
> > > > locally to make out-of-tree modules work.  Or else just not test kernels
> > > > with sublevel > 255.  
> > > 
> > > Overflowing LINUX_VERSION_CODE breaks media applications. Several media
> > > APIs have an ioctl that returns the Kernel version:
> > > 
> > > 	drivers/media/cec/core/cec-api.c:       caps.version = LINUX_VERSION_CODE;
> > > 	drivers/media/mc/mc-device.c:   info->media_version = LINUX_VERSION_CODE;
> > > 	drivers/media/v4l2-core/v4l2-ioctl.c:   cap->version = LINUX_VERSION_CODE;
> > > 	drivers/media/v4l2-core/v4l2-subdev.c:          cap->version = LINUX_VERSION_CODE;  
> > 
> > This always struck me as odd, because why can't they just use the
> > uname(2) syscall instead?
> 
> I agree that this is odd on upstream Kernels.
> 
> On backported ones, this should be filled with the version of the V4L2 core.
> 
> We maintain a tree that allows running older Kernels with the latest V4L2
> media drivers and subsystem. On such tree, there's a patch that replaces
> LINUX_VERSION_CODE macro to V4L2_VERSION:
> 
> 	https://git.linuxtv.org/media_build.git/tree/backports/api_version.patch
> 
> There's a logic here which gets the version of the V4L2 used at the
> build. So, right now, it is filled with:
> 
> 	#define V4L2_VERSION 330496 /* 0x050b00 */
> 
> In other words, even if you run the backported driver on, let's say, Kernel
> 4.8, those calls will tell that the driver's version is from Kernel
> 5.11.

That too, is crazy and insane :)

> Providing a little of history behind those, this came together with the
> V4L version 2 API developed during Kernel 2.5.x and merged at Kernel
> 2.6.0. 
> 
> When such API was originally introduced, this field was meant to 
> contain the driver's version. The problem is that people used to change
> the drivers (even with major rewrites) without changing its version.
> 
> We ended by standardizing it everywhere, filling those at the media core,
> instead of doing it at driver's level - and using the Kernel version.
> 
> This way, developers won't need to be concerned of keeping this
> updated as the subsystem evolves.
> 
> With time, we also improved the V4L2 API in a way that applications can
> be able to directly detect the core/driver functionalities without needing
> to rely on such fields. So, I guess recent versions of most open source
> applications nowadays don't use it.

Yes, driver "version" means nothing, so functionality is the correct way
to handle this.

Any chance you all can just drop the kernel version stuff and just
report a static number that never goes up to allow people to use the
correct api for new stuff?  Pick a "modern" number, like 5.10 and leave
it there for forever.

> > > Those can be used by applications in order to enable some features that
> > > are available only after certain Kernel versions.
> > > 
> > > This is somewhat deprecated, in favor of the usage of some other
> > > capability fields, but for instance, the v4l2-compliance userspace tool
> > > have two such checks:
> > > 
> > > 	utils/v4l2-compliance/v4l2-compliance.cpp
> > > 	640:	fail_on_test((vcap.version >> 16) < 3);
> > > 	641:	if (vcap.version >= 0x050900)  // Present from 5.9.0 onwards
> > > 
> > > As far as I remember, all such checks are against major.minor. So,
> > > something like:
> > > 
> > > 	sublevel = (sublevel > 0xff) ? 0xff : sublevel;
> > > 
> > > inside KERNEL_VERSION macro should fix such regression at -stable.  
> > 
> > I think if we clamp KERNEL_VERSION at 255 we should be fine for anyone
> > checking this type of thing.  Sasha has posted patches to do this.
> 
> Yes, this should be enough.
> 
> As far as I remember, when opensource apps use the version from the API,
> since Kernel 3.0, they always check only for major.minor.
> 
> So, the only problem with those APIs are due to overflows. Setting
> sublevel to any value beteen 0-255 should work, from V4L2 API
> standpoint.

Great, thanks for checking.

greg k-h
