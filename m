Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D654451C0
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 11:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhKDKxi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 06:53:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:40018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhKDKxh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 06:53:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1523F61108;
        Thu,  4 Nov 2021 10:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636023060;
        bh=qjQ0ddQkxndA+aapAprmzKfzleHUEyxYbCE4SjmdBPw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=T11yYq5LylUhk07FMRyPTH/4B/cokH2cq3JnmmaxIeLQV4vKu1iplf4lhK9hMB7BQ
         n99U3raqYtxeqs94B+kh+O7P4wD7KPUj735yp+Gn5q9pDHFewnHwIezJtgGvmSnvtW
         oyuWcc2zhqrJfNgjX35uzTPCPEfjWAXkRh6enp++PBUL7Zz/hyT6J3w/u2INNk79UH
         FtCII8n9a7sI+jrCXwHSnnGIAwYz68wIX0FJ4qhyw3dKLnoNUOkb7T86bCedhIw06Q
         STm9mW5mbvTSHmOgZxo+HYPlriQ1HQzQY0EjZu7Awdu3sRoLsu8dJlT/srBCG/Yk0C
         XemZocGpJvZlg==
Date:   Thu, 4 Nov 2021 10:50:51 +0000
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
Message-ID: <20211104105051.4836fafb@sal.lan>
In-Reply-To: <YYOts0aoD/Quo5r6@pendragon.ideasonboard.com>
References: <20211103135418.496f75d5@sal.lan>
        <YYOts0aoD/Quo5r6@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 4 Nov 2021 11:53:55 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Wed, Nov 03, 2021 at 01:54:18PM +0000, Mauro Carvalho Chehab wrote:
> > Hi,
> > 
> > From what I've seen so far, those are the main issues with regards to V4L2 API,
> > in order to allow a generic V4L2 application to work with it.
> > 
> > MMAP support
> > ============
> > 
> > Despite having some MMAP code on it, the current implementation is broken. 
> > Fixing it is not trivial, as it would require fixing the HMM support on it, 
> > which does several tricks.
> > 
> > The best would be to replace it by something simpler. If this is similar
> > enough to IPU3, perhaps one idea would be to replace the HMM code on it by 
> > videodev2 + IPU3 HMM code.
> > 
> > As this is not trivial, I'm postponing such task. If someone has enough
> > time, it would be great to have this fixed.
> > 
> > From my side, I opted to add support for USERPTR on camorama:
> > 
> > 	https://github.com/alessio/camorama  
> 
> We should *really* phase out USERPTR support. 

I'm not a big fan of userptr, buy why do we phase it out?

> Worst case you may support
> DMABUF only if MMAP is problematic, but I don't really see why it could
> be easy to map an imported buffer and difficult to map a buffer
> allocated by the driver. videobuf2 should be used.

Yeah, atomisp should be migrated to VB2, and such migration is listed at
its TODO file. However, this is a complex task, as its memory management
code is very complex. Maybe we could try to use the ISP3 code on it,
replacing the current HMM logic, but not sure if the implementation there 
would be compatible.

In any case, the current priority is to make the driver to work, fixing 
the V4L2 API implementation, which has several issues.

...

> > Video devices
> > =============
> > 
> > Currently, 10 video? devices are created:
> > 
> > 	$ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
> > 	/dev/video0:	Name             : ATOMISP ISP CAPTURE output
> > 	/dev/video1:	Name             : ATOMISP ISP VIEWFINDER output
> > 	/dev/video2:	Name             : ATOMISP ISP PREVIEW output
> > 	/dev/video3:	Name             : ATOMISP ISP VIDEO output
> > 	/dev/video4:	Name             : ATOMISP ISP ACC
> > 	/dev/video5:	Name             : ATOMISP ISP MEMORY input
> > 	/dev/video6:	Name             : ATOMISP ISP CAPTURE output
> > 	/dev/video7:	Name             : ATOMISP ISP VIEWFINDER output
> > 	/dev/video8:	Name             : ATOMISP ISP PREVIEW output
> > 	/dev/video9:	Name             : ATOMISP ISP VIDEO output
> > 	/dev/video10:	Name             : ATOMISP ISP ACC
> > 
> > That seems to be written to satisfy some Android-based app, but we don't
> > really need all of those.
> > 
> > I'm thinking to comment out the part of the code which creates all of those,
> > keeping just "ATOMISP ISP PREVIEW output", as I don't think we need all
> > of those.  
> 
> Why is that ? Being able to capture multiple streams in different
> resolutions is important for lots of applications, the viewfinder
> resolution is often different than the video streaming and/or still
> capture resolution. Scaling after capture is often expensive (and there
> are memory bandwidth and power constraints to take into account too). A
> single-stream device may be better than nothing, but it's time to move
> to the 21st century.

True, but having multiple videonodes at this moment is not helping,
specially since only one of such modes (PREVIEW) is actually working at
the moment.

So, this is more a strategy to help focusing on making this work
properly, and not a statement that those modules would be dropped.

I'd say that the "final" version of atomisp - once it gets 
fixed, cleaned up and started being MC-controlled - should support
all such features, and have the pipelines setup via libcamera.

Regards,
Mauro
