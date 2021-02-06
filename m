Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D60E311BEA
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 08:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhBFHVc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Feb 2021 02:21:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:50570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229522AbhBFHVa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Feb 2021 02:21:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1874E64EB9;
        Sat,  6 Feb 2021 07:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612596049;
        bh=xdg+P2Qc0twWG80mc917q0suMB4BOviqUgCbHNfbBos=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SsZtTDrEbppS+wSks1Hq0AMqCTxk1HExT5dtEj6uRz+9sbcwaRSpwm5xE/E1G1ffI
         XwKjgWK/E0y50hzOrWiYVX2rQfWvtZO1vA+n/ddjw9MoAfFu/SRVL+jBf5DG7dXHN6
         iAd6RmtV32zeVoDbYhe6HOQIT497oT5cpNiOgrTs=
Date:   Sat, 6 Feb 2021 08:20:45 +0100
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
Message-ID: <YB5DTUiurAwqZbz1@kroah.com>
References: <a85b7749-38b2-8ce9-c15a-8acb9a54c5b5@kernel.org>
 <0b12bac9-1b4e-ec4a-8a45-5eb3f1dbbeca@cybernetics.com>
 <20210205191105.128c6e48@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210205191105.128c6e48@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 05, 2021 at 07:11:05PM +0100, Mauro Carvalho Chehab wrote:
> Em Fri, 5 Feb 2021 12:31:05 -0500
> Tony Battersby <tonyb@cybernetics.com> escreveu:
> 
> > On 2/4/21 6:00 AM, Jiri Slaby wrote:
> > > Agreed. But currently, sublevel won't "wrap", it will "overflow" to 
> > > patchlevel. And that might be a problem. So we might need to update the 
> > > header generation using e.g. "sublevel & 0xff" (wrap around) or 
> > > "sublevel > 255 : 255 : sublevel" (be monotonic and get stuck at 255).
> > >
> > > In both LINUX_VERSION_CODE generation and KERNEL_VERSION proper.  
> > 
> > My preference would be to be monotonic and get stuck at 255 to avoid
> > breaking out-of-tree modules.  If needed, add another macro that
> > increases the number of bits that can be used to check for sublevels >
> > 255, while keeping the old macros for compatibility reasons.  Since
> > sublevels > 255 have never existed before, any such checks must be
> > newly-added, so they can be required to use the new macros.
> > 
> > I do not run the 4.4/4.9 kernels usually, but I do sometimes test a wide
> > range of kernels from 3.18 (gasp!) up to the latest when bisecting,
> > benchmarking, or debugging problems.  And I use a number of out-of-tree
> > modules that rely on the KERNEL_VERSION to make everything work.  Some
> > out-of-tree modules like an updated igb network driver might be needed
> > to make it possible to test the old kernel on particular hardware.
> > 
> > In the worst case, I can patch LINUX_VERSION_CODE and KERNEL_VERSION
> > locally to make out-of-tree modules work.  Or else just not test kernels
> > with sublevel > 255.
> 
> Overflowing LINUX_VERSION_CODE breaks media applications. Several media
> APIs have an ioctl that returns the Kernel version:
> 
> 	drivers/media/cec/core/cec-api.c:       caps.version = LINUX_VERSION_CODE;
> 	drivers/media/mc/mc-device.c:   info->media_version = LINUX_VERSION_CODE;
> 	drivers/media/v4l2-core/v4l2-ioctl.c:   cap->version = LINUX_VERSION_CODE;
> 	drivers/media/v4l2-core/v4l2-subdev.c:          cap->version = LINUX_VERSION_CODE;

This always struck me as odd, because why can't they just use the
uname(2) syscall instead?

> Those can be used by applications in order to enable some features that
> are available only after certain Kernel versions.
> 
> This is somewhat deprecated, in favor of the usage of some other
> capability fields, but for instance, the v4l2-compliance userspace tool
> have two such checks:
> 
> 	utils/v4l2-compliance/v4l2-compliance.cpp
> 	640:	fail_on_test((vcap.version >> 16) < 3);
> 	641:	if (vcap.version >= 0x050900)  // Present from 5.9.0 onwards
> 
> As far as I remember, all such checks are against major.minor. So,
> something like:
> 
> 	sublevel = (sublevel > 0xff) ? 0xff : sublevel;
> 
> inside KERNEL_VERSION macro should fix such regression at -stable.

I think if we clamp KERNEL_VERSION at 255 we should be fine for anyone
checking this type of thing.  Sasha has posted patches to do this.

thanks,

greg k-h
