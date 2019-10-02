Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDDA8C928E
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 21:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfJBTmn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 15:42:43 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:42272 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfJBTmn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 15:42:43 -0400
Received: by mail-wr1-f53.google.com with SMTP id n14so329398wrw.9
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 12:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=amsVCAETqOF7Kkjzf7Ol8ialzJf8utlQOXmnDHL4Tjc=;
        b=FlXs08/LjCMruTAiHk2TCbUMK2VSfiOI0d1eIksvMhYG2iZFo1U4O8iUSJeTedBAQn
         rsnXCQnLIkcDg2DMY/xUnwNFjLbC4e1Jy3Z4jbucL40TPyN6Jfyh32ZAweqFuCbwCqJM
         B/UwFSFqnQi2znKziWFbW89o8GpSTLnFByu3Fz4cJ3dE2F3/7C7rb24YKQegKKh/eYtJ
         RP7uOe9t2XHcRwyzXJG7aHRi/vMJzZgevEIzJn+PuBbbFSN5xojDrGqL0M8yI8aD+rV+
         6mNDKrLE6Fm+J0cCoOFZGiaX66mDgh5rp8De9Nt/Rj687FUHlftENyl70iNPxe/4r++u
         P8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=amsVCAETqOF7Kkjzf7Ol8ialzJf8utlQOXmnDHL4Tjc=;
        b=A6u+W37l+cmOJOVSljOQD3kF1b0Kv6TDt3+efCi4hiuuHa7k9uk16L0FWjA7PsyGEU
         96NXiEmcb2sUHghfeHMphbPVLqdq8keEVyX/JxLxdKAYGUXMoM+Lohx1jX04HyQxjatc
         ED2RyQhUpLpplQrXpce5tf52cM4I7yZQIU23AyfcEdg9QjsC1i+iwnG88mgQbcKG+9G3
         G9dhhCC31hy17wAbJUE2agOxKG51tQN7Y7ULtJtB78XEaGYrHnnX6+wDFhw3r1rYzgZR
         NA8erC7u2QwNEI1urW8nWFd26lSmG4gGYUCaJfdYsenxGcblRwer+ErzTkvXUDafk3kb
         uatw==
X-Gm-Message-State: APjAAAWJ3xkHrPcddYWZn+lF5/YNilBAjvPI9s4HyzgxiQ4Gc/zEUc+C
        nOT1heR6h/T+T6fwWHNRH922lcFb/HsgGBCEy/qNintf
X-Google-Smtp-Source: APXvYqydP5o+xJ6MnWhcS3wcH9OA7pIb54YBgjOJcSAneHIVOajeBvrikOS56USoDoveX0vwKx0Eav/gErEVLh78e0I=
X-Received: by 2002:adf:e591:: with SMTP id l17mr4336229wrm.199.1570045358212;
 Wed, 02 Oct 2019 12:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU32WbBd8BuHmojDh4adEemT57qviM12AeeiC8yFVNUgmg@mail.gmail.com>
 <Pine.LNX.4.44L0.1910021343290.1552-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1910021343290.1552-100000@iolanthe.rowland.org>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 2 Oct 2019 12:42:27 -0700
Message-ID: <CAJ+vNU194rZZRjQxSjN6OXXWBEgniHcO1=g==rPwcumKqhh1hA@mail.gmail.com>
Subject: Re: PureThermal2 UVC video camera: Failed to submit URB 0 (-28)
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-media <linux-media@vger.kernel.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 2, 2019 at 10:58 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, 2 Oct 2019, Tim Harvey wrote:
>
> > On Tue, Oct 1, 2019 at 12:19 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Tue, 1 Oct 2019, Tim Harvey wrote:
> > >
> > > > On Thu, Sep 26, 2019 at 3:47 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > > > >
> > > > > Greetings,
> > > > >
> > > > > I'm running into an issue with a USB UVC Full speed camera, the
> > > > > PureThermal2 [1] on an IMX6 based ARM board.
> > > > >
> > > > > What I find is that I get two video devices registered (the first one
> > > > > is the expected device, and I'm not clear what the 2nd one is). When I
> > > > > try to capture a single frame I get 'Failed to submit URB 0 (-28)'
> > > > > which historically has been due to a bandwidth issue. I encounter this
> > > > > on the IMX6 EHCI host as well as the OTG host when no other devices
> > > > > are connected (no hubs either). I've tested with both a 4.20 kernel
> > > > > and a 5.3 kernel.
> > > > >
> > > > > If I plug this device into another board I have based on an OcteonTX
> > > > > ARM64 cpu with a fairly modern 4.14 kernel and I find that a single
> > > > > video device gets registered and I can capture just fine.
> > > > >
> > > > > Here are some details:
> > > > > lsusb reports: 1e4e:0100 Cubeternet WebCam
> > > > >
> > > > > working system with 4.14 kernel hot-inserting the camera:
> > > > > [  495.163276] usb 1-1.2: new full-speed USB device number 6 using xhci_hcd
> > > > > [  495.291685] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> > > > > (1e4e:0100)
> > > > > [  495.300543] input: PureThermal (fw:v1.2.2): PureTh as
> > > > > /devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input1
> > > > > [  496.731214] usb 1-1.2: USB disconnect, device number 6
> > > > > [  496.987294] usb 1-1.2: new full-speed USB device number 7 using xhci_hcd
> > > > > [  497.115683] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> > > > > (1e4e:0100)
> > > > > [  497.124182] input: PureThermal (fw:v1.2.2): PureTh as
> > > > > /devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input2
> > >
> > > ...
> > >
> > > > > I'm also not clear why the device enumerates then disconnects and
> > > > > enumerates again when plugged in but this happens on the system it
> > > > > works on as well and I've seen similar things with other devices.
> > >
> > > Perhaps some process opens the camera's device file, does something to
> > > cause the camera to disconnect and reconnect, but then doesn't close
> > > the file.
> >
> > Alan,
> >
> > I found that the '2 devices' is because of a kernel commit in 4.16
> > that adds support for UVC metadata: 088ead2 media: uvcvideo: Add a
> > metadata device node. I can comment out the call to
> > uvc_meta_register() and the 2nd device goes away but the first (and
> > only) v4l2 capture device still has the same issue.
>
> Okay, that explains that.
>
> > > > I have found that if I enumerate the camera through a PCIe based XHCI
> > > > host controller it still registers the 2 v4l2 devices but in this case
> > > > I can capture fine. So it would appear that this has something to do
> > > > with the IMX6 ci_hdrc controller. The -ENOSPC is getting returned from
> > > > drivers/usb/host/ehci-sched.c:iso_stream_schedule()
> > > >
> > > > I feel perhaps this is something basic I don't understand regarding
> > > > USB URB scheduling but I don't get why it occurs on the IMX6 ci_hdrc
> > > > controller on not an XHCI controller.
> > >
> > > It's probably related to differences between the drivers.  What shows
> > > up in /sys/kernel/debug/usb/devices with the camera plugged in?
> > >
> >
> > Here's some more debugging including /sys/kernel/debug/usb/devices:
> > ~# cat /sys/kernel/debug/usb/devices
> >
> > T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=480  MxCh= 1
> > B:  Alloc=  0/800 us ( 0%), #Int=  0, #Iso=  0
> > D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=01 MxPS=64 #Cfgs=  1
> > P:  Vendor=1d6b ProdID=0002 Rev= 5.03
> > S:  Manufacturer=Linux 5.3.0-00157-g651f7f9-dirty ehci_hcd
> > S:  Product=EHCI Host Controller
> > S:  SerialNumber=ci_hdrc.0
> > C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=  0mA
> > I:* If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
> > E:  Ad=81(I) Atr=03(Int.) MxPS=   4 Ivl=256ms
> >
> > T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
> > D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> > P:  Vendor=1e4e ProdID=0100 Rev= 2.00
> > S:  Manufacturer=GroupGets
> > S:  Product=PureThermal (fw:v1.2.2)
> > S:  SerialNumber=801f001c-5102-3038-3835-393400000000
> > C:* #Ifs= 2 Cfg#= 1 Atr=80 MxPwr=100mA
> > A:  FirstIf#= 0 IfCount= 2 Cls=0e(video) Sub=03 Prot=00
> > I:* If#= 0 Alt= 0 #EPs= 1 Cls=0e(video) Sub=01 Prot=00 Driver=uvcvideo
> > E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> > I:* If#= 1 Alt= 0 #EPs= 0 Cls=0e(video) Sub=02 Prot=00 Driver=uvcvideo
> > I:  If#= 1 Alt= 1 #EPs= 1 Cls=0e(video) Sub=02 Prot=00 Driver=uvcvideo
> > E:  Ad=81(I) Atr=01(Isoc) MxPS= 962 Ivl=1ms
>
> So the camera is the only device on the bus (aside from the root hub).
> And it asks for an 8-byte interrupt endpoint together with a 962-byte
> isochronous endpoint.
>
> That explains the problem.  ehci-hcd (the same code manages ChipIdea
> controllers) doesn't do a good job of handling high-bandwidth periodic
> requests for full-speed devices, particularly when isochronous and
> interrupt endpoints are both present.
>
> > So regardless of resolution/frame-size the device is requesting 962
> > byte USB frame bandwidth which should be just fine for USB full speed
> > in iso mode (max 1023). I'm not sure why the bandwidth reservation
> > fails.
>
> Yes, that amount of data is fine for full-speed USB.  But handling
> full-speed devices attached to a high-speed controller isn't easy, and
> ehci-hcd isn't able to make use of all the possible bandwidth.  In
> fact, you'd be better off attaching the camera to a full-speed USB 1.1
> controller, if one were available for your system.
>
> xHCI controllers, on the other hand, handle all the scheduling issues
> in hardware so the driver doesn't have to deal with them.  Evidently
> the ones you tried don't have any trouble in this situation.
>
> > Apparently the RaspberryPi 4 has this same issue:
> > https://github.com/raspberrypi/linux/issues/3136. The same thread
> > mentions that most USB full speed devices have fall-back endpoint
> > max-packet sizes that allow for reduced bandwidth reservations (but
> > this camera does not).
> >
> > I get the same results regardless of CONFIG_USB_EHCI_TT_NEWSCHED enabled or not.
>
> And indeed, the same problem will occur whenever this device is
> attached to an EHCI controller on a Linux-based system, unless somebody
> goes to the trouble of improving the driver.  (It's tremendously
> complicated -- the spec puts almost all the burden on the software
> rather than the hardware/firmware -- and probably not worth the effort
> of trying to do it correctly.  I wouldn't be surprised if adding proper
> support for this would double the size of the driver.)
>

Alan,

Thanks for explaining this - its incredibly helpful!

Tim
