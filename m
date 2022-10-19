Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD0E6037A2
	for <lists+linux-media@lfdr.de>; Wed, 19 Oct 2022 03:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbiJSBpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Oct 2022 21:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiJSBpW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Oct 2022 21:45:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2D678214;
        Tue, 18 Oct 2022 18:45:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01CFB5A4;
        Wed, 19 Oct 2022 03:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1666143918;
        bh=4fpsRQyvNiBfjUNmuJ+PHujTa19ZfHlaYVQUh6HbBQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v9T4YHk/c8m4qLkVt51WcMehO1+m2JpUkgaWpsXL/v618IM1Kyl1mANgn899kE3Nd
         RqS/Xn4LKZ1NdlBhQ3cGOJtPb5r4UUS4iV8xyhB/p9GyBm+jAEOLYn1IQeutrJNrP0
         eChmmte0Ul3I+tn6lkQM1e98nZ6nUMhcx6XQhzmE=
Date:   Wed, 19 Oct 2022 04:44:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Nazar Mokrynskyi <nazar@mokrynskyi.com>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        linux@roeck-us.net, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [Bug 216543] kernel NULL pointer dereference
 usb_hcd_alloc_bandwidth
Message-ID: <Y09WlZwb270lHPkv@pendragon.ideasonboard.com>
References: <bug-216543-208809@https.bugzilla.kernel.org/>
 <bug-216543-208809-AR52CPrAl3@https.bugzilla.kernel.org/>
 <Y03IXMGpZ2fCof2k@rowland.harvard.edu>
 <CANiDSCuiYCNM+6F2+3efps2uR_Q+p-oBSu-gVmY6ygf4_1U49Q@mail.gmail.com>
 <Y07AAmc2QnP5HiBg@pendragon.ideasonboard.com>
 <CANiDSCsSn=UJfCt6shy8htGXAPyeEceVzKva3eD+YxhC3YVmxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsSn=UJfCt6shy8htGXAPyeEceVzKva3eD+YxhC3YVmxA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Wed, Oct 19, 2022 at 10:35:00AM +0900, Ricardo Ribalda wrote:
> On Wed, 19 Oct 2022 at 00:02, Laurent Pinchart wrote:
> > On Tue, Oct 18, 2022 at 02:40:44PM +0900, Ricardo Ribalda wrote:
> > > Hi
> > >
> > > Guenter already provided some patches to fix this issue:
> > > https://lore.kernel.org/lkml/20200917022547.198090-1-linux@roeck-us.net/
> > >
> > > Until we have a solution on the core (or rewrite the kernel in rust
> > > ;P) , I think we should merge them (or something similar).
> > >
> > > I can prepare a patchset merging Guenter set and my "grannular PM"
> > > https://lore.kernel.org/linux-media/20220920-resend-powersave-v1-0-123aa2ba3836@chromium.org/
> >
> > How about working on a proper fix instead ? :-)
> 
> We already have a fix that has been extensively tested ;P
> 
> When put on top of granular PM it is a tiny patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/ribalda/linux.git/commit/?h=b4/resend-powersave&id=cf826010bedda38f8faf8d072f95a9ca69ed452d
> that can be cleanly reverted when/if we fix it in core.
> 
> I would like to avoid that more and more people/distros have
> downstream patches on top of uvc to fix real issues just because we
> think that it is not the "perfect" solution.

And I would like to avoid having to roll out manual changes to all
drivers when the problem can be fixed in the core, just because nobody
can be bothered to spend time to implement a good fix. We don't have to
aim for a solution at the cdev level if that takes too long, an
implementation in V4L2 would be enough to start with.

I'm getting tired of having to reexplain this continuously with nobody
listening. This could have been solved a long time ago.

> Would you please take a second look at the combined patchset?

I will have a look. If I recall correctly, there were some patches in
Guenter's series that I had no issue with, I'll start with those.

> > > It can always be reverted when we reach consensus on how to do it for
> > > every driver.
> > >
> > > Regards!
> > >
> > > On Tue, 18 Oct 2022 at 06:46, Alan Stern wrote:
> > > >
> > > > Moving this bug report from bugzilla to the mailing lists.
> > > >
> > > > The short description of the bug is that in uvcvideo, disconnect races
> > > > with starting a video transfer.  The race shows up on Nazar's system
> > > > because of a marginal USB cable which leads to a lot of spontaneous
> > > > disconnections.
> > > >
> > > > On Mon, Oct 17, 2022 at 05:59:48PM +0000, bugzilla-daemon@kernel.org wrote:
> > > > > https://bugzilla.kernel.org/show_bug.cgi?id=216543
> > > > >
> > > > > --- Comment #7 from Nazar Mokrynskyi (nazar@mokrynskyi.com) ---
> > > > > Created attachment 303022
> > > > >   --> https://bugzilla.kernel.org/attachment.cgi?id=303022&action=edit
> > > > > Kernel log with uvc-trace patch applied
> > > >
> > > > For everyone's information, here is the uvc-trace patch.  All it does is
> > > > add messages to the kernel log when uvcvideo's probe and disconnect
> > > > routines run, and just before uvc_video_start_transfer() calls
> > > > usb_set_interface().
> > > >
> > > > --- usb-devel/drivers/media/usb/uvc/uvc_video.c
> > > > +++ usb-devel/drivers/media/usb/uvc/uvc_video.c
> > > > @@ -1965,6 +1965,7 @@ static int uvc_video_start_transfer(stru
> > > >                         "Selecting alternate setting %u (%u B/frame bandwidth)\n",
> > > >                         altsetting, best_psize);
> > > >
> > > > +               dev_info(&intf->dev, "uvc set alt\n");
> > > >                 ret = usb_set_interface(stream->dev->udev, intfnum, altsetting);
> > > >                 if (ret < 0)
> > > >                         return ret;
> > > > --- usb-devel/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ usb-devel/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -2374,6 +2374,8 @@ static int uvc_probe(struct usb_interfac
> > > >         int function;
> > > >         int ret;
> > > >
> > > > +       dev_info(&intf->dev, "uvc_probe start\n");
> > > > +
> > > >         /* Allocate memory for the device and initialize it. */
> > > >         dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> > > >         if (dev == NULL)
> > > > @@ -2535,6 +2537,7 @@ static void uvc_disconnect(struct usb_in
> > > >                 return;
> > > >
> > > >         uvc_unregister_video(dev);
> > > > +       dev_info(&intf->dev, "uvc_disconnect done\n");
> > > >         kref_put(&dev->ref, uvc_delete);
> > > >  }
> > > >
> > > > The output in the kernel log below clearly shows that there is a bug in
> > > > the uvcvideo driver.
> > > >
> > > > > I'm on 6.0.2 and seemingly get this even more frequently with good cable and no
> > > > > extra adapters. So I patched 6.0.2 with uvc-trace above and reproduced it
> > > > > within a few minutes.
> > > > >
> > > > > USB seems to reset, often camera stops or freezes in the browser, but the light
> > > > > on the camera itself remains on. Sometimes I can enable/disable/enable camera
> > > > > for it to reboot, but the last time I did that in the log I got null pointer
> > > > > de-reference again.
> > > >
> > > > Here is the important part of the log:
> > > >
> > > > [  684.746848] usb 8-2.4.4: reset SuperSpeed USB device number 6 using xhci_hcd
> > > > [  684.810979] uvcvideo 8-2.4.4:1.0: uvc_probe start
> > > > [  684.811032] usb 8-2.4.4: Found UVC 1.00 device Logitech BRIO (046d:085e)
> > > > [  684.843413] input: Logitech BRIO as /devices/pci0000:00/0000:00:08.1/0000:59:00.3/usb8/8-2/8-2.4/8-2.4.4/8-2.4.4:1.0/input/input43
> > > > [  684.911255] usb 8-2.4.4: current rate 16000 is different from the runtime rate 24000
> > > > ...
> > > > [  743.800368] uvcvideo 8-2.4.4:1.1: uvc set alt
> > > >
> > > > This is where an ioctl calls uvc_video_start_transfer.
> > > >
> > > > [  748.654701] usb 8-2.4.4: USB disconnect, device number 6
> > > > [  748.714355] uvcvideo 8-2.4.4:1.0: uvc_disconnect done
> > > >
> > > > This is where the disconnect starts and finishes
> > > >
> > > > [  748.898340] BUG: kernel NULL pointer dereference, address: 0000000000000000
> > > > [  748.898344] #PF: supervisor read access in kernel mode
> > > > [  748.898346] #PF: error_code(0x0000) - not-present page
> > > > [  748.898347] PGD 0 P4D 0
> > > > [  748.898349] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > > [  748.898351] CPU: 16 PID: 11890 Comm: VideoCapture Not tainted 6.0.2-x64v2-uvc-trace-xanmod1 #1
> > > > [  748.898353] Hardware name: Gigabyte Technology Co., Ltd. B550 VISION D/B550 VISION D, BIOS F15d 07/20/2022
> > > > [  748.898354] RIP: 0010:usb_ifnum_to_if+0x35/0x60
> > > > ...
> > > > [  748.898368] Call Trace:
> > > > [  748.898370]  <TASK>
> > > > [  748.898370]  usb_hcd_alloc_bandwidth+0x240/0x370
> > > > [  748.898375]  usb_set_interface+0x122/0x350
> > > > [  748.898378]  uvc_video_start_transfer.cold+0xd8/0x2ae [uvcvideo]
> > > > [  748.898383]  uvc_video_start_streaming+0x75/0xd0 [uvcvideo]
> > > > [  748.898386]  uvc_start_streaming+0x25/0xe0 [uvcvideo]
> > > > [  748.898390]  vb2_start_streaming+0x86/0x140 [videobuf2_common]
> > > > [  748.898393]  vb2_core_streamon+0x57/0xc0 [videobuf2_common]
> > > > [  748.898395]  uvc_queue_streamon+0x25/0x40 [uvcvideo]
> > > > [  748.898398]  uvc_ioctl_streamon+0x35/0x60 [uvcvideo]
> > > > [  748.898401]  __video_do_ioctl+0x19a/0x3f0 [videodev]
> > > >
> > > > And this proves that uvc_disconnect() returned before the driver was
> > > > finished accessing the device.
> > > >
> > > > I don't know how the driver works or how it tries to prevent this sort
> > > > of race from occurring, but apparently the strategy isn't working.
> > > >
> > > > > Please let me know if there is any other information I can provide and what
> > > > > could be the root cause of this annoying behavior.
> > > >
> > > > At this point I will bow out of the discussion; it's up to the uvcvideo
> > > > maintainers to investigate further.  Maybe they can provide a patch for
> > > > you to test.

-- 
Regards,

Laurent Pinchart
