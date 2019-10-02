Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59892C904D
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 19:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbfJBR6I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 13:58:08 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39130 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726708AbfJBR6H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 13:58:07 -0400
Received: (qmail 5129 invoked by uid 2102); 2 Oct 2019 13:58:06 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Oct 2019 13:58:06 -0400
Date:   Wed, 2 Oct 2019 13:58:06 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Tim Harvey <tharvey@gateworks.com>
cc:     linux-media <linux-media@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: PureThermal2 UVC video camera: Failed to submit URB 0 (-28)
In-Reply-To: <CAJ+vNU32WbBd8BuHmojDh4adEemT57qviM12AeeiC8yFVNUgmg@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1910021343290.1552-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2 Oct 2019, Tim Harvey wrote:

> On Tue, Oct 1, 2019 at 12:19 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Tue, 1 Oct 2019, Tim Harvey wrote:
> >
> > > On Thu, Sep 26, 2019 at 3:47 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > > >
> > > > Greetings,
> > > >
> > > > I'm running into an issue with a USB UVC Full speed camera, the
> > > > PureThermal2 [1] on an IMX6 based ARM board.
> > > >
> > > > What I find is that I get two video devices registered (the first one
> > > > is the expected device, and I'm not clear what the 2nd one is). When I
> > > > try to capture a single frame I get 'Failed to submit URB 0 (-28)'
> > > > which historically has been due to a bandwidth issue. I encounter this
> > > > on the IMX6 EHCI host as well as the OTG host when no other devices
> > > > are connected (no hubs either). I've tested with both a 4.20 kernel
> > > > and a 5.3 kernel.
> > > >
> > > > If I plug this device into another board I have based on an OcteonTX
> > > > ARM64 cpu with a fairly modern 4.14 kernel and I find that a single
> > > > video device gets registered and I can capture just fine.
> > > >
> > > > Here are some details:
> > > > lsusb reports: 1e4e:0100 Cubeternet WebCam
> > > >
> > > > working system with 4.14 kernel hot-inserting the camera:
> > > > [  495.163276] usb 1-1.2: new full-speed USB device number 6 using xhci_hcd
> > > > [  495.291685] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> > > > (1e4e:0100)
> > > > [  495.300543] input: PureThermal (fw:v1.2.2): PureTh as
> > > > /devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input1
> > > > [  496.731214] usb 1-1.2: USB disconnect, device number 6
> > > > [  496.987294] usb 1-1.2: new full-speed USB device number 7 using xhci_hcd
> > > > [  497.115683] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> > > > (1e4e:0100)
> > > > [  497.124182] input: PureThermal (fw:v1.2.2): PureTh as
> > > > /devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input2
> >
> > ...
> >
> > > > I'm also not clear why the device enumerates then disconnects and
> > > > enumerates again when plugged in but this happens on the system it
> > > > works on as well and I've seen similar things with other devices.
> >
> > Perhaps some process opens the camera's device file, does something to
> > cause the camera to disconnect and reconnect, but then doesn't close
> > the file.
> 
> Alan,
> 
> I found that the '2 devices' is because of a kernel commit in 4.16
> that adds support for UVC metadata: 088ead2 media: uvcvideo: Add a
> metadata device node. I can comment out the call to
> uvc_meta_register() and the 2nd device goes away but the first (and
> only) v4l2 capture device still has the same issue.

Okay, that explains that.

> > > I have found that if I enumerate the camera through a PCIe based XHCI
> > > host controller it still registers the 2 v4l2 devices but in this case
> > > I can capture fine. So it would appear that this has something to do
> > > with the IMX6 ci_hdrc controller. The -ENOSPC is getting returned from
> > > drivers/usb/host/ehci-sched.c:iso_stream_schedule()
> > >
> > > I feel perhaps this is something basic I don't understand regarding
> > > USB URB scheduling but I don't get why it occurs on the IMX6 ci_hdrc
> > > controller on not an XHCI controller.
> >
> > It's probably related to differences between the drivers.  What shows
> > up in /sys/kernel/debug/usb/devices with the camera plugged in?
> >
> 
> Here's some more debugging including /sys/kernel/debug/usb/devices:
> ~# cat /sys/kernel/debug/usb/devices
> 
> T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=480  MxCh= 1
> B:  Alloc=  0/800 us ( 0%), #Int=  0, #Iso=  0
> D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=1d6b ProdID=0002 Rev= 5.03
> S:  Manufacturer=Linux 5.3.0-00157-g651f7f9-dirty ehci_hcd
> S:  Product=EHCI Host Controller
> S:  SerialNumber=ci_hdrc.0
> C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=  0mA
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
> E:  Ad=81(I) Atr=03(Int.) MxPS=   4 Ivl=256ms
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
> D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=1e4e ProdID=0100 Rev= 2.00
> S:  Manufacturer=GroupGets
> S:  Product=PureThermal (fw:v1.2.2)
> S:  SerialNumber=801f001c-5102-3038-3835-393400000000
> C:* #Ifs= 2 Cfg#= 1 Atr=80 MxPwr=100mA
> A:  FirstIf#= 0 IfCount= 2 Cls=0e(video) Sub=03 Prot=00
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=0e(video) Sub=01 Prot=00 Driver=uvcvideo
> E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> I:* If#= 1 Alt= 0 #EPs= 0 Cls=0e(video) Sub=02 Prot=00 Driver=uvcvideo
> I:  If#= 1 Alt= 1 #EPs= 1 Cls=0e(video) Sub=02 Prot=00 Driver=uvcvideo
> E:  Ad=81(I) Atr=01(Isoc) MxPS= 962 Ivl=1ms

So the camera is the only device on the bus (aside from the root hub).  
And it asks for an 8-byte interrupt endpoint together with a 962-byte
isochronous endpoint.

That explains the problem.  ehci-hcd (the same code manages ChipIdea
controllers) doesn't do a good job of handling high-bandwidth periodic
requests for full-speed devices, particularly when isochronous and
interrupt endpoints are both present.

> So regardless of resolution/frame-size the device is requesting 962
> byte USB frame bandwidth which should be just fine for USB full speed
> in iso mode (max 1023). I'm not sure why the bandwidth reservation
> fails.

Yes, that amount of data is fine for full-speed USB.  But handling 
full-speed devices attached to a high-speed controller isn't easy, and 
ehci-hcd isn't able to make use of all the possible bandwidth.  In 
fact, you'd be better off attaching the camera to a full-speed USB 1.1 
controller, if one were available for your system.

xHCI controllers, on the other hand, handle all the scheduling issues
in hardware so the driver doesn't have to deal with them.  Evidently
the ones you tried don't have any trouble in this situation.

> Apparently the RaspberryPi 4 has this same issue:
> https://github.com/raspberrypi/linux/issues/3136. The same thread
> mentions that most USB full speed devices have fall-back endpoint
> max-packet sizes that allow for reduced bandwidth reservations (but
> this camera does not).
> 
> I get the same results regardless of CONFIG_USB_EHCI_TT_NEWSCHED enabled or not.

And indeed, the same problem will occur whenever this device is 
attached to an EHCI controller on a Linux-based system, unless somebody 
goes to the trouble of improving the driver.  (It's tremendously 
complicated -- the spec puts almost all the burden on the software 
rather than the hardware/firmware -- and probably not worth the effort 
of trying to do it correctly.  I wouldn't be surprised if adding proper 
support for this would double the size of the driver.)

Alan Stern

