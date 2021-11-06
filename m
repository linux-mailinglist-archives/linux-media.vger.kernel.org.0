Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19ACE446D42
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 11:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbhKFJ7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 05:59:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:48466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231765AbhKFJ7I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Nov 2021 05:59:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AF596103B;
        Sat,  6 Nov 2021 09:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636192587;
        bh=2RGksmbLqJt05OZ+nKuuF+ItF/ul71ljtRAyj5xCHXI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MkmzzW+dGmIjMzgSyV8+6dgaFegOEJlXRr7R8sFP+b2ffBd+hbYf1PQ1syh6QLNXC
         nfXWZ++CEVZEKmU/5RNUc25ALFUn0Eu1rNtvweaRF12j3psgey3ev1+nCOLQV6IYZG
         hQ/IvU3AH0szoghMEVn6DC7ezzkQv+JRiTT+LCG4HBSOGjZu4iGSehVs/hltBIMaWN
         Zu/GrJzkMSa0MXpTk/nO6j9DbSpkDD8jL5vVKBVvQMvAGsVOm8mPRciTyzBcCCc1cx
         haT5ESoa1a9Nt4WVnHp0x/1r0EedFdE6nJzDaQzYXESj53eZuPIARg0ww3rMCrrEH4
         QbbZOYJjfvNQQ==
Date:   Sat, 6 Nov 2021 09:56:19 +0000
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
Message-ID: <20211106095619.573e8d54@sal.lan>
In-Reply-To: <YYW6tzJG1u84zMDD@pendragon.ideasonboard.com>
References: <20211103135418.496f75d5@sal.lan>
        <YYOts0aoD/Quo5r6@pendragon.ideasonboard.com>
        <20211104105051.4836fafb@sal.lan>
        <YYPWUiPT80zQ7sKo@pendragon.ideasonboard.com>
        <20211105185526.1b91d679@sal.lan>
        <YYW6tzJG1u84zMDD@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 6 Nov 2021 01:13:59 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Fri, Nov 05, 2021 at 06:55:26PM +0000, Mauro Carvalho Chehab wrote:
> > Em Thu, 4 Nov 2021 14:47:14 +0200 Laurent Pinchart escreveu:  
> > > On Thu, Nov 04, 2021 at 10:50:51AM +0000, Mauro Carvalho Chehab wrote:  
> > > > Em Thu, 4 Nov 2021 11:53:55 +0200 Laurent Pinchart escreveu:    
> > > > > On Wed, Nov 03, 2021 at 01:54:18PM +0000, Mauro Carvalho Chehab wrote:    
> > > > > > Hi,
> > > > > > 
> > > > > > From what I've seen so far, those are the main issues with regards to V4L2 API,
> > > > > > in order to allow a generic V4L2 application to work with it.
> > > > > > 
> > > > > > MMAP support
> > > > > > ============
> > > > > > 
> > > > > > Despite having some MMAP code on it, the current implementation is broken. 
> > > > > > Fixing it is not trivial, as it would require fixing the HMM support on it, 
> > > > > > which does several tricks.
> > > > > > 
> > > > > > The best would be to replace it by something simpler. If this is similar
> > > > > > enough to IPU3, perhaps one idea would be to replace the HMM code on it by 
> > > > > > videodev2 + IPU3 HMM code.
> > > > > > 
> > > > > > As this is not trivial, I'm postponing such task. If someone has enough
> > > > > > time, it would be great to have this fixed.
> > > > > > 
> > > > > > From my side, I opted to add support for USERPTR on camorama:
> > > > > > 
> > > > > > 	https://github.com/alessio/camorama      
> > > > > 
> > > > > We should *really* phase out USERPTR support.     
> > > > 
> > > > I'm not a big fan of userptr, buy why do we phase it out?    
> > > 
> > > Because USERPTR is broken by design. It gives a false promise to
> > > userspace that a user pointer can be DMA'ed to, and this isn't generally
> > > true.   
> > 
> > Actually, the only promise USERPTR gives is that the driver should
> > be able to store streaming data on it (usually done via DMA from
> > the V4L2 card to the memory).  
> 
> Yes, and that promise is broken. It doesn't work universally (across
> architectures, or across devices).
> 
> > It never promised - or was designed - to be used on embedded
> > devices and allow DMA transfers to GPU. See, the original design
> > is from 1999 and it was focused only on x86 archs ;-)  
> 
> Embedded isn't relevant in this context anymore. x86 hasn't been limited
> to the desktop space for a long time, and neither is ARM embedded-only.

I see your point. Back on the old days, VB1 had some VMA code that would 
reallocate the physical memory associated with an userptr, in order to 
warrant that it would fit the driver's requirement (basically aiming
devices that won't support DMA scatter/gather).

So, yeah, it was always harder for the Kernel to support USERPTR.

> 
> > The thing is that it was an alternative to FBUF before DMABUF
> > was added.
> > 
> > But yeah, newer embedded device drivers should not enable it,
> > using instead VB2 and DMABUF.
> > 
> > Perhaps we should document it better at:
> > 	https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/userp.html#userp
> > 
> > warning developers to use DMABUF when the goal is to share DMA buffers
> > with other drivers.
> >   
> > > Even if buffer are carefully allocated to be compatible with the
> > > device requirements, there are corner cases that prevent making a
> > > mechanism based on get_user_pages() a first class citizen.  
> > 
> > Drivers that can't warrant that should disable support for it ;-)  
> 
> With USERPTR implemented through videobuf2, I doubt most driver authors
> are aware of the USERPTR corner cases and limitations.

I guess the first step to deprecate this feature would be to write some
text at the uAPI Documentation explaining the USERPTR corner
cases/limitations and recommend userspace apps to not to rely on it.

> > > In any case,
> > > USERPTR makes life more difficult for the kernel.
> > > 
> > > There may be some use cases for which USERPTR could be an appropriate
> > > solution, but now that we have DMABUF (and of course MMAP), I see no
> > > reason to continue supporting USERPTR forever, and certainly not adding
> > > new users.  
> > 
> > As we need to support this forever, IMO, it doesn't make sense to deny
> > patches adding new users for it - yet it makes sense to recommend not to,
> > specially on drivers whose usage would be on embedded systems.  
> 
> Why should we accept it for new drivers, what use cases does it enable
> that can't be supported through MMAP and DMABUF ?

I can't think on any special reason, except for compatibility with some
userspace app that might only work with USERPTR. I don't know any
open source app that supports USERPTR but doesn't support MMAP those
days, but I won't doubt they exist.

Anyway, if we're willing to do that, the first step would be to
write a Documentation patch for driver API, documenting VB2
I/O flags and recommending not to set VB2_USERPTR on new drivers,
explaining why it is a bad idea to use it.

Feel free to write such patch.

> 
> > > > > Worst case you may support
> > > > > DMABUF only if MMAP is problematic, but I don't really see why it could
> > > > > be easy to map an imported buffer and difficult to map a buffer
> > > > > allocated by the driver. videobuf2 should be used.    
> > > > 
> > > > Yeah, atomisp should be migrated to VB2, and such migration is listed at
> > > > its TODO file. However, this is a complex task, as its memory management
> > > > code is very complex.    
> > > 
> > > Have a look at GPU memory management, and you'll find the atomisp driver
> > > very simple in comparison :-)  
> > 
> > Yeah, there are lots of complex thing at GPU mm. Yet, I don't see too much 
> > levels of abstraction there... the biggest issue on atomisp is that there
> > are usually two or three levels of abstraction between the actual 
> > implementation and the callers. It also has some hacks in the middle of code
> > that seems to be due to some special devices for Android.  
> 
> Isn't it just a matter of dropping the abstraction layers ?

Easier said than done.

> > > I'm also pretty sure that drivers/staging/media/atomisp/pci/hmm/ could
> > > be rewritten to use more of the existing kernel frameworks.  
> > 
> > Yes, I guess so. Again, the problem is that the glue also require
> > changes and cleanups. It also requires migration from VB1 to VB2.
> >   
> > > > Maybe we could try to use the ISP3 code on it,
> > > > replacing the current HMM logic, but not sure if the implementation there 
> > > > would be compatible.    
> > > 
> > > I'd be surprised if the IPU3 was compatible.  
> > 
> > If IPU3 started as an upgrade from ISP2, then maybe it is partially
> > compatible.
> > 
> > Anyway, further studies and tests are required.
> >   
> > > > In any case, the current priority is to make the driver to work, fixing 
> > > > the V4L2 API implementation, which has several issues.
> > > > 
> > > > ...
> > > >     
> > > > > > Video devices
> > > > > > =============
> > > > > > 
> > > > > > Currently, 10 video? devices are created:
> > > > > > 
> > > > > > 	$ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
> > > > > > 	/dev/video0:	Name             : ATOMISP ISP CAPTURE output
> > > > > > 	/dev/video1:	Name             : ATOMISP ISP VIEWFINDER output
> > > > > > 	/dev/video2:	Name             : ATOMISP ISP PREVIEW output
> > > > > > 	/dev/video3:	Name             : ATOMISP ISP VIDEO output
> > > > > > 	/dev/video4:	Name             : ATOMISP ISP ACC
> > > > > > 	/dev/video5:	Name             : ATOMISP ISP MEMORY input
> > > > > > 	/dev/video6:	Name             : ATOMISP ISP CAPTURE output
> > > > > > 	/dev/video7:	Name             : ATOMISP ISP VIEWFINDER output
> > > > > > 	/dev/video8:	Name             : ATOMISP ISP PREVIEW output
> > > > > > 	/dev/video9:	Name             : ATOMISP ISP VIDEO output
> > > > > > 	/dev/video10:	Name             : ATOMISP ISP ACC
> > > > > > 
> > > > > > That seems to be written to satisfy some Android-based app, but we don't
> > > > > > really need all of those.
> > > > > > 
> > > > > > I'm thinking to comment out the part of the code which creates all of those,
> > > > > > keeping just "ATOMISP ISP PREVIEW output", as I don't think we need all
> > > > > > of those.      
> > > > > 
> > > > > Why is that ? Being able to capture multiple streams in different
> > > > > resolutions is important for lots of applications, the viewfinder
> > > > > resolution is often different than the video streaming and/or still
> > > > > capture resolution. Scaling after capture is often expensive (and there
> > > > > are memory bandwidth and power constraints to take into account too). A
> > > > > single-stream device may be better than nothing, but it's time to move
> > > > > to the 21st century.    
> > > > 
> > > > True, but having multiple videonodes at this moment is not helping,
> > > > specially since only one of such modes (PREVIEW) is actually working at
> > > > the moment.
> > > > 
> > > > So, this is more a strategy to help focusing on making this work
> > > > properly, and not a statement that those modules would be dropped.
> > > > 
> > > > I'd say that the "final" version of atomisp - once it gets 
> > > > fixed, cleaned up and started being MC-controlled - should support
> > > > all such features, and have the pipelines setup via libcamera.    
> > > 
> > > I have no issue with phasing development (I have few issues with the
> > > atomisp driver in general actually, as it's in staging), but the goal
> > > should be kept in mind to make sure development goes in the right
> > > direction.  
> > 
> > Yeah, surely it needs to progress at the right direction. We're
> > just too far of having it ready to be ported to MC and libcamera...
> > there are too many issues to be solved.  
> 
> I'm not even sure porting it to MC makes sense, the firmware seems to
> expose a too high level of abstraction. I could be wrong though.

I see your point. Yeah, ISP2 seems very different than other MC-based
devices, as the firmware provides ~60 different programs (the driver refers
to them as binaries) so, you can't just add/remove a processing block.
You need to stick with whatever is there.

So, for instance, this:

	$ v4l2grab -f YUYV -x 1600 -y 1200 -d /dev/video2 -n 1 -u

Makes the driver to use two binaries:

	[  145.386407] atomisp-isp2 0000:00:03.0: Using binary isp_preview_var_isp2 (id 22), type 0, mode 1, continuous true
	[  145.386616] atomisp-isp2 0000:00:03.0: Using binary isp_vf_pp_opt (id 3), type 0, mode 9, continuous true

Internally, this binary combination will do, at least:

	Bayer->YUV conversion
	Scaler
	Cropping

The driver has a complex logic (with lots of layers) to try to select the
right binaries. Based on the comments there, those are auto-generated together
with the firmware file itself. So, when a "copy-mode" binary is added at the
firmware file, the code generator also adds (via two or three abstraction layers)
the code that would allow selecting and configuring such binary.

It can still be mapped via MC, in the sense that you would have:

	- source nodes - one for each sensor
	- sink nodes
	- several binary blocks that do a mix of things

If it would make sense to use MC to setup such pipelines and/or moving the
binary selection logic to libcamera is a separate matter.

IMO, we should first cleanup and drop the abstraction layers, having a
better understanding about the binary selection logic before start
thinking about moving pipeline setup to userspace.

Regards,
Mauro

-

As a reference, those are the binaries inside the
candrpv_0415_20150521_0458 firmware file for ISP2401:

[   19.289518] atomisp-isp2 0000:00:03.0: binary #0  type SP: sp
[   19.289714] atomisp-isp2 0000:00:03.0: binary #1  type ISP (Normal), binary id is  0: isp_copy_var
[   19.289726] atomisp-isp2 0000:00:03.0: binary #2  type ISP (Normal), binary id is  2: isp_vf_pp_full
[   19.289733] atomisp-isp2 0000:00:03.0: binary #3  type ISP (Normal), binary id is  3: isp_vf_pp_opt
[   19.289739] atomisp-isp2 0000:00:03.0: binary #4  type ISP (Normal), binary id is 60: isp_capture_pp_var_bli
[   19.289749] atomisp-isp2 0000:00:03.0: binary #5  type ISP (Normal), binary id is 61: isp_capture_pp_ldc
[   19.289755] atomisp-isp2 0000:00:03.0: binary #6  type ISP (Normal), binary id is  5: isp_capture_pp_var
[   19.289762] atomisp-isp2 0000:00:03.0: binary #7  type ISP (Normal), binary id is  4: isp_yuv_scale_var
[   19.289768] atomisp-isp2 0000:00:03.0: binary #8  type ISP (Normal), binary id is  6: isp_preisp_var
[   19.289776] atomisp-isp2 0000:00:03.0: binary #9  type ISP (Normal), binary id is  7: isp_preisp_var_isp2
[   19.289782] atomisp-isp2 0000:00:03.0: binary #10 type ISP (Normal), binary id is 58: isp_pre_de_var_isp2
[   19.289789] atomisp-isp2 0000:00:03.0: binary #11 type ISP (Normal), binary id is  8: isp_gdc_var
[   19.289795] atomisp-isp2 0000:00:03.0: binary #12 type ISP (Normal), binary id is 11: isp_anr_var
[   19.289801] atomisp-isp2 0000:00:03.0: binary #13 type ISP (Normal), binary id is 12: isp_anr_var_isp2
[   19.289807] atomisp-isp2 0000:00:03.0: binary #14 type ISP (Normal), binary id is  9: isp_postisp_var
[   19.289813] atomisp-isp2 0000:00:03.0: binary #15 type ISP (Normal), binary id is 10: isp_postisp_var_isp2
[   19.289819] atomisp-isp2 0000:00:03.0: binary #16 type ISP (Normal), binary id is 15: isp_preview_dec
[   19.289825] atomisp-isp2 0000:00:03.0: binary #17 type ISP (Normal), binary id is 16: isp_preview_cont_bds125_isp2
[   19.289831] atomisp-isp2 0000:00:03.0: binary #18 type ISP (Normal), binary id is 17: isp_preview_cont_dpc_bds150_isp2
[   19.289847] atomisp-isp2 0000:00:03.0: binary #19 type ISP (Normal), binary id is 19: isp_preview_cont_dpc_bds200_isp2
[   19.289854] atomisp-isp2 0000:00:03.0: binary #20 type ISP (Normal), binary id is 18: isp_preview_cont_bds150_isp2
[   19.289860] atomisp-isp2 0000:00:03.0: binary #21 type ISP (Normal), binary id is 20: isp_preview_cont_bds200_isp2
[   19.289867] atomisp-isp2 0000:00:03.0: binary #22 type ISP (Normal), binary id is 21: isp_preview_var
[   19.289873] atomisp-isp2 0000:00:03.0: binary #23 type ISP (Normal), binary id is 22: isp_preview_var_isp2
[   19.289879] atomisp-isp2 0000:00:03.0: binary #24 type ISP (Normal), binary id is 24: isp_primary_var
[   19.289885] atomisp-isp2 0000:00:03.0: binary #25 type ISP (Normal), binary id is 25: isp_primary_var_isp2
[   19.289891] atomisp-isp2 0000:00:03.0: binary #26 type ISP (Normal), binary id is 26: isp_primary_small
[   19.289897] atomisp-isp2 0000:00:03.0: binary #27 type ISP (Normal), binary id is 27: isp_primary_striped
[   19.289903] atomisp-isp2 0000:00:03.0: binary #28 type ISP (Normal), binary id is 28: isp_primary_striped_isp2
[   19.289909] atomisp-isp2 0000:00:03.0: binary #29 type ISP (Normal), binary id is 29: isp_primary_8mp
[   19.289915] atomisp-isp2 0000:00:03.0: binary #30 type ISP (Normal), binary id is 30: isp_primary_14mp
[   19.289921] atomisp-isp2 0000:00:03.0: binary #31 type ISP (Normal), binary id is 31: isp_primary_16mp
[   19.289926] atomisp-isp2 0000:00:03.0: binary #32 type ISP (Normal), binary id is 33: isp_primary_isp261_stage0
[   19.289932] atomisp-isp2 0000:00:03.0: binary #33 type ISP (Normal), binary id is 34: isp_primary_isp261_stage1
[   19.289938] atomisp-isp2 0000:00:03.0: binary #34 type ISP (Normal), binary id is 35: isp_primary_isp261_stage2
[   19.289947] atomisp-isp2 0000:00:03.0: binary #35 type ISP (Normal), binary id is 36: isp_primary_isp261_stage3
[   19.289954] atomisp-isp2 0000:00:03.0: binary #36 type ISP (Normal), binary id is 37: isp_primary_isp261_stage4
[   19.289960] atomisp-isp2 0000:00:03.0: binary #37 type ISP (Normal), binary id is 38: isp_primary_isp261_stage5
[   19.289966] atomisp-isp2 0000:00:03.0: binary #38 type ISP (Normal), binary id is 42: isp_video_dz
[   19.289971] atomisp-isp2 0000:00:03.0: binary #39 type ISP (Normal), binary id is 44: isp_video_high
[   19.289978] atomisp-isp2 0000:00:03.0: binary #40 type ISP (Normal), binary id is 45: isp_video_nodz
[   19.289984] atomisp-isp2 0000:00:03.0: binary #41 type ISP (Normal), binary id is 46: isp_video_cont_multibds_isp2_min
[   19.289990] atomisp-isp2 0000:00:03.0: binary #42 type ISP (Normal), binary id is 47: isp_video_cont_bds_300_600_isp2_min
[   19.290029] atomisp-isp2 0000:00:03.0: binary #43 type ISP (Normal), binary id is 48: isp_video_cont_dpc_bds150_isp2_min
[   19.290037] atomisp-isp2 0000:00:03.0: binary #44 type ISP (Normal), binary id is 50: isp_video_cont_dpc_bds200_isp2_min
[   19.290044] atomisp-isp2 0000:00:03.0: binary #45 type ISP (Normal), binary id is 49: isp_video_cont_bds150_isp2_min
[   19.290050] atomisp-isp2 0000:00:03.0: binary #46 type ISP (Normal), binary id is 51: isp_video_cont_bds200_isp2_min
[   19.290057] atomisp-isp2 0000:00:03.0: binary #47 type ISP (Normal), binary id is 52: isp_video_cont_nobds_isp2_min
[   19.290063] atomisp-isp2 0000:00:03.0: binary #48 type ISP (Normal), binary id is 53: isp_video_dz_isp2_min
[   19.290070] atomisp-isp2 0000:00:03.0: binary #49 type ISP (Normal), binary id is 54: isp_video_dz_isp2
[   19.290076] atomisp-isp2 0000:00:03.0: binary #50 type ISP (Normal), binary id is 55: isp_video_lp_isp2

