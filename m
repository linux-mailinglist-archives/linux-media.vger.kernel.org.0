Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3D3249259
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 03:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgHSBa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 21:30:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49386 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbgHSBa1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 21:30:27 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2906029E;
        Wed, 19 Aug 2020 03:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597800620;
        bh=dMBTP3/aUShIIxAPGHT1oBW+ufOzD6gArNzzuucdIzM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XPrGD3So8PK82m9zzNn98Ejky+jbLowQRCTEkey8Ft72CT+omvYTD6sp+r3T6gDsz
         EPnCDox0BkKPy6i9ts5bXV7q+ZLGsazJdc7m4vLL/gHxcrokanKP048/+CefdzA0Pm
         6sfv0lfbEQEGNpnSY5BYu5jOZVjqWH2lkqlkDyaA=
Date:   Wed, 19 Aug 2020 04:30:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        linux-usb <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-media@vger.kernel.org, linux-uvc-devel@lists.sourceforge.net,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Protecting uvcvideo againt USB device disconnect [Was: Re:
 Protecting usb_set_interface() against device removal]
Message-ID: <20200819013002.GL2360@pendragon.ideasonboard.com>
References: <b0a7247c-bed3-934b-2c73-7f4b0adb5e75@roeck-us.net>
 <20200815020739.GB52242@rowland.harvard.edu>
 <20200816003315.GA13826@roeck-us.net>
 <20200816121816.GC32174@pendragon.ideasonboard.com>
 <9bb20ed7-b156-f6c2-4d25-6acac1a0021b@roeck-us.net>
 <20200816235155.GA7729@pendragon.ideasonboard.com>
 <0684b71c-8ac5-8962-cbd5-c0bcaa8b6881@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0684b71c-8ac5-8962-cbd5-c0bcaa8b6881@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Aug 17, 2020 at 01:00:49PM +0200, Hans Verkuil wrote:
> On 17/08/2020 01:51, Laurent Pinchart wrote:
> > On Sun, Aug 16, 2020 at 08:54:18AM -0700, Guenter Roeck wrote:
> >> On 8/16/20 5:18 AM, Laurent Pinchart wrote:
> >>> CC'ing Hans Verkuil and Sakari Ailus for the discussion about handling
> >>> file operations and disconnect in V4L2.
> >>>
> >>> On Sat, Aug 15, 2020 at 05:33:15PM -0700, Guenter Roeck wrote:
> >>>> + linux-uvc-devel@lists.sourceforge.net
> >>>> + linux-media@vger.kernel.org
> >>>> + laurent.pinchart@ideasonboard.com
> >>>>
> >>>> and changed subject
> >>>>
> >>>> On Fri, Aug 14, 2020 at 10:07:39PM -0400, Alan Stern wrote:
> >>>>> On Fri, Aug 14, 2020 at 04:07:03PM -0700, Guenter Roeck wrote:
> >>>>>> Hi all,
> >>>>>>
> >>>>>> over time, there have been a number of reports of crashes in usb_ifnum_to_if(),
> >>>>>> called from usb_hcd_alloc_bandwidth, which is in turn called from usb_set_interface().
> >>>>>> Examples are [1] [2] [3]. A typical backtrace is:
> >>>>>>
> >>>>>> <3>[ 3489.445468] intel_sst_acpi 808622A8:00: sst: Busy wait failed, cant send this msg
> >>>>>> <6>[ 3490.507273] usb 1-4: USB disconnect, device number 3
> >>>>>> <1>[ 3490.516670] BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
> >>>>>> <6>[ 3490.516680] PGD 0 P4D 0
> >>>>>> <4>[ 3490.516687] Oops: 0000 [#1] PREEMPT SMP PTI
> >>>>>> <4>[ 3490.516693] CPU: 0 PID: 5633 Comm: V4L2CaptureThre Not tainted 4.19.113-08536-g5d29ca36db06 #1
> >>>>>> <4>[ 3490.516696] Hardware name: GOOGLE Edgar, BIOS Google_Edgar.7287.167.156 03/25/2019
> >>>>>> <4>[ 3490.516706] RIP: 0010:usb_ifnum_to_if+0x29/0x40
> >>>>>> <4>[ 3490.516710] Code: ee 0f 1f 44 00 00 55 48 89 e5 48 8b 8f f8 03 00 00 48 85 c9 74 27 44 0f b6 41 04 4d 85 c0 74 1d 31 ff 48 8b 84 f9 98 00 00 00 <48> 8b 10 0f b6 52 02 39 f2 74 0a 48 ff c7 4c 39 c7 72 e5 31 c0 5d
> >>>>>> <4>[ 3490.516714] RSP: 0018:ffffa46f42a47a80 EFLAGS: 00010246
> >>>>>> <4>[ 3490.516718] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff904a396c9000
> >>>>>> <4>[ 3490.516721] RDX: ffff904a39641320 RSI: 0000000000000001 RDI: 0000000000000000
> >>>>>> <4>[ 3490.516724] RBP: ffffa46f42a47a80 R08: 0000000000000002 R09: 0000000000000000
> >>>>>> <4>[ 3490.516727] R10: 0000000000009975 R11: 0000000000000009 R12: 0000000000000000
> >>>>>> <4>[ 3490.516731] R13: ffff904a396b3800 R14: ffff904a39e88000 R15: 0000000000000000
> >>>>>> <4>[ 3490.516735] FS: 00007f396448e700(0000) GS:ffff904a3ba00000(0000) knlGS:0000000000000000
> >>>>>> <4>[ 3490.516738] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>>>> <4>[ 3490.516742] CR2: 0000000000000000 CR3: 000000016cb46000 CR4: 00000000001006f0
> >>>>>> <4>[ 3490.516745] Call Trace:
> >>>>>> <4>[ 3490.516756] usb_hcd_alloc_bandwidth+0x1ee/0x30f
> >>>>>> <4>[ 3490.516762] usb_set_interface+0x1a3/0x2b7
> >>>>>> <4>[ 3490.516773] uvc_video_start_transfer+0x29b/0x4b8 [uvcvideo]
> >>>>>> <4>[ 3490.516781] uvc_video_start_streaming+0x91/0xdd [uvcvideo]
> >>>>>> <4>[ 3490.516787] uvc_start_streaming+0x28/0x5d [uvcvideo]
> >>>>>> <4>[ 3490.516795] vb2_start_streaming+0x61/0x143 [videobuf2_common]
> >>>>>> <4>[ 3490.516801] vb2_core_streamon+0xf7/0x10f [videobuf2_common]
> >>>>>> <4>[ 3490.516807] uvc_queue_streamon+0x2e/0x41 [uvcvideo]
> >>>>>> <4>[ 3490.516814] uvc_ioctl_streamon+0x42/0x5c [uvcvideo]
> >>>>>> <4>[ 3490.516820] __video_do_ioctl+0x33d/0x42a
> >>>>>> <4>[ 3490.516826] video_usercopy+0x34e/0x5ff
> >>>>>> <4>[ 3490.516831] ? video_ioctl2+0x16/0x16
> >>>>>> <4>[ 3490.516837] v4l2_ioctl+0x46/0x53
> >>>>>> <4>[ 3490.516843] do_vfs_ioctl+0x50a/0x76f
> >>>>>> <4>[ 3490.516848] ksys_ioctl+0x58/0x83
> >>>>>> <4>[ 3490.516853] __x64_sys_ioctl+0x1a/0x1e
> >>>>>> <4>[ 3490.516858] do_syscall_64+0x54/0xde
> >>>>>>
> >>>>>> I have been able to reproduce the problem on a Chromebook by strategically placing
> >>>>>> msleep() calls into usb_set_interface() and usb_disable_device(). Ultimately, the
> >>>>>> problem boils down to lack of protection against device removal in usb_set_interface()
> >>>>>> [and/or possibly other callers of usb_ifnum_to_if()].
> >>>>>>
> >>>>>> Sequence of events is roughly as follows:
> >>>>>>
> >>>>>> - usb_set_interface() is called and proceeds to some point, possibly to
> >>>>>>   mutex_lock(hcd->bandwidth_mutex);
> >>>>>> - Device removal event is detected, and usb_disable_device() is called
> >>>>>
> >>>>> At this point all interface drivers get unbound (their disconnect 
> >>>>> routines are called).
> >>>>>
> >>>>>> - usb_disable_device() starts removing actconfig data. It has removed
> >>>>>>   and cleared dev->actconfig->interface[i], but not dev->actconfig
> >>>>>> - usb_set_interface() calls usb_hcd_alloc_bandwidth(), which calls
> >>>>>>   usb_ifnum_to_if()
> >>>>>> - In usb_ifnum_to_if(), dev->actconfig is not NULL, but
> >>>>>>   dev->actconfig->interface[i] is NULL
> >>>>>> - crash
> >>>>>>
> >>>>>> Question is what we can do about this. Checking if dev->state != USB_STATE_NOTATTACHED
> >>>>>> in usb_ifnum_to_if() might be a possible approach, but strictly speaking it would
> >>>>>> still be racy since there is still no lock against device removal. I have not tried
> >>>>>> calling usb_lock_device() in usb_set_interface() - would that possibly be an option ?
> >>>>>
> >>>>> As far as I know, protecting against these races is the responsibility 
> >>>>> of the USB interface drivers.  They must make sure that their disconnect 
> >>>>> routines block until all outstanding calls to usb_set_interface return 
> >>>>> (in fact, until all outstanding device accesses have finished).
> >>>>>
> >>>>> For instance, in the log extract you showed, it's obvious that the 
> >>>>> uvc_start_streaming routine was running after the disconnect routine had 
> >>>>> returned, which looks like a bug in itself: Once the disconnect routine 
> >>>>> returns, the driver is not supposed to try to access the device at all 
> >>>>> because some other driver may now be bound to it.
> >>>>>
> >>>>> We can't just call usb_lock_device from within usb_set_interface, 
> >>>>> because usb_set_interface is often called with that lock already held.
> >>>>>
> >>>> I had a closer look into the uvcvideo driver and compared it to other usb
> >>>> drivers, including drivers in drivers/media/usb/ which connect to the video
> >>>> subsystem.
> >>>>
> >>>> The usbvideo driver lacks protection against calls to uvc_disconnect() while
> >>>
> >>> Are you confusing usbvideo and uvcvideo ? Both exist, and uvcvideo would
> >>> have been called usbvideo if the former hadn't already been in use.
> >>
> >> Yes, sorry :-(. I am not sure how s/uvc/usb/ happened.
> > 
> > No worries.
> > 
> >>>> calls into file operations are ongoing. This is pretty widespread, and not
> >>>> even limited to file operations (for example, there is a worker which is only
> >>>> canceled in uvc_delete, not in ucv_disconnect). The existing protection only
> >>>> ensures that no file operations are started after the call to ucv_disconnect,
> >>>> but that is insufficient.
> >>>>
> >>>> Other drivers do have that protection and make sure that no usb operations
> >>>> can happen after the disconnect call.
> >>>>
> >>>> The only remedy I can see is to rework the usbvideo driver and add the
> >>>> necessary protections. At first glance, it looks like this may be a
> >>>> substantial amount of work. I'd sign up for that, but before I start,
> >>>> I would like to get input from the usbvideo community. Is such an effort
> >>>> already going on ? If yes, how can I help ? If not, is the problem
> >>>> understood and accepted ? Are there any ideas on how to solve it ?
> >>>
> >>> This is something that has been discussed before, and needs to be solved
> >>> in the V4L2 framework itself, not in individual drivers. Not only would
> >>> this avoid rolling out the same code manually everywhere (in different
> >>> incorrect ways, as races are difficult to solve and implementations are
> >>> more often wrong than right), but it will also avoid similar issues for
> >>> non-USB devices.
> >>
> >> You mean code that ensures that no user-space v4l2 operation is in progress
> >> after video_device_unregister / v4l2_device_unregister return ? I agree,
> >> that would simplify the necessary changes on the uvc side.
> > 
> > I was thinking about adding a new function to be called from the
> > disconnect handler to implement the wait on end of userspace access, but
> > video_device_unregister() seems an even better idea.
> > v4l2_device_unregister() is probably not very useful as v4l2_device
> > isn't exposed to userspace, only video_device is (and v4l2_subdev and
> > media_device, but that's a different story, although probably still an
> > issue for the latter in the UVC driver).
> 
> Actually, all that is needed is to take the ioctl serialization lock in the disconnect
> function.

It's not just ioctls though, the other file operations also need to be
handled (read, write, mmap).

> See last paragraph in 1.4.1 here:
> 
> https://hverkuil.home.xs4all.nl/spec/driver-api/v4l2-dev.html
> 
> Since uvc uses its own lock, you need to take that one.

Drivers that use their own lock do so to avoid serializing all ioctls.
This means that different ioctls may be covered by different locks
(possibly with part of some ioctls running without locking). I don't
think we can just dismiss the issue saying those drivers need to
implement the disconnection manually. It would be much better to
integrate handling of userspace access with video_device_unregister()
like proposed above, as that will work for all drivers in a transparent
way. It would also be fairly simple to implement in the V4L2 core.

> > We also have a v4l2_device_disconnect() function which is supposed to
> > handle hot-pluggable device disconnection, but it's fairly useless (I'd
> > even say harmful as it gives the illusion that hotplugging is correctly
> > handled, while in reality the media subsystem is plagged by hot-unplug
> > issues :-S).
> 
> The v4l2_device_disconnect() is there to remove a v4l2_dev reference to
> the device that is about to be removed when the disconnect() exists.
> Otherwise v4l2_dev->dev would point to a missing device.
> 
> However, I wonder if it is still needed: commit 236c5441d703 from 2011 added
> code to take a reference to v4l2_dev->dev in v4l2_device_register(). This
> should prevent the device from disappearing until v4l2_device_unregister() is
> called. I suspect that v4l2_device_disconnect() can be removed completely, and
> instead v4l2_device_unregister() just calls put_device(v4l2_dev->dev).
> 
> I don't like v4l2_device_disconnect() either, so if this works, then that would
> be a nice simplification.
> 
> >> I actually came from the other side - I assumed that there is a reason
> >> that is not already the case, and that the problem therefore has to be
> >> resolved on the driver side.
> >>
> >> So I guess the next question is: Is this already being addressed on the
> >> v4l2 side ?
> > 
> > I'm not aware of anyone working on this.
> > 
> >>> It shouldn't take more than two flags (to track user-space operations in
> >>> progress and disconnection), a spinlock and a wait queue entry. I'm not
> >>> sure if someone has already given it a try, and don't recall why this
> >>> hasn't been done yet, as it should be fairly straightforward.
> >>>
> >>> On the UVC side, the work queue probably has to be flushed in
> >>> uvc_disconnect(). I'd keep the destroy call in uvc_delete() though.
> >>> Please make sure to look for potential race conditions between the URB
> >>> completion handler and the .disconnect() handler (they shouldn't be any,
> >>> but I haven't checked lately myself).
> >>
> >> My current solution for this problem is to call uvc_ctrl_cleanup_device()
> >> from uvc_disconnect(), after uvc_unregister_video().
> > 
> > I'd rather avoid that, as the cleanup functions in the UVC driver are
> > generally meant to free memory when the last user disappears. While no
> > new userspace operation will be started after disconnection once the
> > above fix will be in place, there's one operation we can't avoid: the
> > file release. This will access some of the memory allocated by the
> > driver, and while the current implementation probably doesn't access in
> > .release() any memory freed by uvc_ctrl_cleanup_device(), I think it's a
> > good practice to only shut down the userspace API in .disconnect(), and
> > free memory when the last reference is released.
> > 
> >> An alternative might
> >> be to add a uvc_ctrl_stop_device() function which would just cancel the
> >> worker.
> > 
> > I think that would be best. Should stream->async_wq (in uvc_video.c) be
> > similarly flushed ? The driver does so in stream->async_wq(), called
> > from uvc_video_stop_transfer(), itself called from
> > uvc_video_stop_streaming() (among other places, that are either error
> > paths or system suspend handling). The call stack goes to
> > uvc_stop_streaming(), and, through the videobuf2 helpers, to
> > vb2_queue_release() called by uvc_queue_release() itself called by
> > uvc_v4l2_release() (in the non-disconnect case,
> > uvc_video_stop_streaming() will be called through videobuf2 by
> > uvc_queue_streamoff(), in response to a VIDIOC_STREAMOFF ioctl). We thus
> > flush the workqueue too late, and also access the device in
> > uvc_video_stop_streaming() long after .disconnect() returns.
> > 
> > I think uvc_video_stop_streaming() could be called in uvc_disconnect()
> > after uvc_unregister_video().

-- 
Regards,

Laurent Pinchart
