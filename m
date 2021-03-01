Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25FD3327643
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 03:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhCAC7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Feb 2021 21:59:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59280 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhCAC7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Feb 2021 21:59:32 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 312D8332;
        Mon,  1 Mar 2021 03:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614567528;
        bh=LixW+EW5kJB9/klpLKiQcDX8tJG2nw7Dleul4a/6H9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RLO3LLI/KbraTVDZgQhK2BoQ4mvEex9/kvNeTmBpL6vUFGsDbrotaT5+6PXFTJqiL
         DTHM5/W5ioDMMYdSW4tTGG0G5E9PeVGcwOcdpO2RBTTttg3rdBRXAqKIa34yxeVQYR
         eHZZ/e4LqRkn4+WuVkVCHM05p15QbAkrtptgO+dk=
Date:   Mon, 1 Mar 2021 04:58:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Zhengyang Feng <zyfeng97@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: An unsupported UVC device
Message-ID: <YDxYTLXQjYMEp3A5@pendragon.ideasonboard.com>
References: <CAK80=wMNP=1DPi=4G3ONxjLUm+5Kqv7YULcr85QHd85P_5aktA@mail.gmail.com>
 <CAHp75VftsNoroK3-fKaR5VGsbh-2dahPEM650+Sw880jPFD9dQ@mail.gmail.com>
 <20210228120630.75d98739@coco.lan>
 <YDuZ5T1vKjutGPgK@pendragon.ideasonboard.com>
 <CAK80=wOY8oUv+ctgksWFwjKe8kUo-_AwAhOewf5hEq9Wei9n=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK80=wOY8oUv+ctgksWFwjKe8kUo-_AwAhOewf5hEq9Wei9n=g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Zhengyang,

On Mon, Mar 01, 2021 at 10:46:21AM +0800, Zhengyang Feng wrote:
> Laurent Pinchart 于2021年2月28日周日 下午9:26写道：
> > On Sun, Feb 28, 2021 at 12:06:30PM +0100, Mauro Carvalho Chehab wrote:
> > > Em Sun, 28 Feb 2021 11:38:32 +0200 Andy Shevchenko escreveu:
> > > > On Sat, Feb 27, 2021 at 12:04 PM Zhengyang Feng <zyfeng97@gmail.com> wrote:
> > > > >
> > > > > Dear maintainers,
> > > > >
> > > > > I'm resending this because the previous email was not clear and should
> > > > > be ignored. Sorry for the inconvenience caused.
> > > > >
> > > > > I was using HIK DS-U14 2K camera on Ubuntu 20.04 with built-in MIC
> > > > > (but it has only one USB cable) but it seems unsupported. It
> > > > > does not need a driver to be used on Windows (usable by just plugging
> > > > > in).
> > > > > I see no HIK devices on the support list
> > > > > (http://www.ideasonboard.org/uvc/), but when I run lsusb -d 2bdf:0281
> > > > > -v | grep "14 Video" it does output several lines like these:
> > > > >
> > > > > bFunctionClass         14 Video
> > > > > bInterfaceClass        14 Video
> > > > > bInterfaceClass        14 Video
> > > > > bInterfaceClass        14 Video
> > > > > bInterfaceClass        14 Video
> > > > >
> > > > > It also says "Couldn't open device, some information will be missing".
> > > > > But it does not require a driver to work on Windows, so it should be a
> > > > > normal UVC device right?
> > > > >
> > > > > I observed that it is not supported as a camera, because although I
> > > > > see /dev/video0 and /dev/video1 (quite odd since it is only 1 camera),
> > > > > it fails by either OpenCV (cv2.VideoCapture(id)) or `cheese`, where it
> > > > > says "cannot open by index" (I tried both video0 and video1).
> > > > > Then I got the logs with `cheese`, in the zip file attached. I think since the
> > > > > device is quite new on the market, maybe you guys haven't tested it.
> > > > >
> > > > > BTW, I installed the latest from
> > > > > https://git.linuxtv.org/media_build.git before I generated the logs.
> > > > > The camera shows same behavior before and after I installed the latest
> > > > > version. And the USB connection works fine (I can use other cameras on
> > > > > this machine), also the camera itself is fine (tested on Windows machines).
> > > > >
> > > > > Feel free to tell me this is unrelated to the project/this mailing
> > > > > list, in that case I'll just
> > > > > get another camera.
> > >
> > > It sounds to me that there's something broken on this camera's
> > > descriptors, with the USB cable or with the USB stack.
> > >
> > > It sounds very weird to my eyes to see errors when getting
> > > the device descriptors like those:
> > >
> > >       Bus 001 Device 007: ID 2bdf:0281 SN0002 HIK 2K USB CAMERA
> > >       Device Descriptor:
> > >         bLength                18
> > >         bDescriptorType         1
> > >         bcdUSB               2.00
> > >         bDeviceClass          239 Miscellaneous Device
> > >         bDeviceSubClass         2
> > >         bDeviceProtocol         1 Interface Association
> > >         bMaxPacketSize0        64
> > >         idVendor           0x2bdf
> > >         idProduct          0x0281
> > >         bcdDevice           11.00
> > >         iManufacturer           1 (error)
> > >         iProduct                2 (error)
> > >         iSerial                 3 (error)
> >
> > Note that the descriptors can be read by the kernel:
> >
> > [ 1013.137790] usb 1-1: new high-speed USB device number 7 using xhci_hcd
> > [ 1013.287536] usb 1-1: New USB device found, idVendor=2bdf, idProduct=0281, bcdDevice=11.00
> > [ 1013.287542] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > [ 1013.287545] usb 1-1: Product: HIK 2K USB CAMERA
> > [ 1013.287548] usb 1-1: Manufacturer: SN0002
> > [ 1013.287550] usb 1-1: SerialNumber: SN0002
> > [ 1013.289504] usb 1-1: Found UVC 1.00 device HIK 2K USB CAMERA (2bdf:0281)
> > [ 1013.291886] input: HIK 2K USB CAMERA: HIK 2K USB C as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/input/input21
> >
> > This is immediately followed by
> >
> > [ 1013.300287] usb 1-1: 3:1: cannot get freq at ep 0x89
> > [ 1028.831102] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [ 1033.951429] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [ 1039.071697] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [ 1044.191786] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [ 1049.311948] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [ 1054.432472] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [ 1059.552484] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [ 1064.672763] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [ 1069.792953] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [ 1074.912868] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [ 1078.496721] uvcvideo 1-1:1.1: Failed to set UVC probe control : -110 (exp. 26).
> > [ 1080.033398] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [ 1083.616960] uvcvideo 1-1:1.1: Failed to set UVC probe control : -110 (exp. 26).
> > [ 1085.157405] usb 1-1: 3:1: usb_set_interface failed (-110)
> > [...]
> >
> > The "cannot get freq" message comes from the snd_usb_audio driver, and
> > after that, the video device starts failing ("Failed to set UVC probe
> > control...").
> >
> > I suspect that the device firmware has crashed, possibly as a
> > consequence of requests related to the audio interface.
> >
> > Zhengyang, could you try to blacklist the snd_usb_audio driver to avoid
> > it being automatically loaded, and see if the camera then works (after
> > unplugging and replugging it) ? If it doesn't, please provide the
> > contents of the kernel log.
> >
> > > The Kernel probe also has similar troubles:
> > >
> > >       [   31.553926] usb 1-1: Found UVC 1.00 device HIK 2K USB CAMERA (2bdf:0281)
> > >       [   32.065510] usb 1-1: Failed to query (GET_INFO) UVC control 11 on unit 1: -110 (exp. 1).
> > >       [   32.577665] usb 1-1: Failed to query (GET_INFO) UVC control 12 on unit 1: -110 (exp. 1).
> > >       [   33.089610] usb 1-1: Failed to query (GET_INFO) UVC control 2 on unit 2: -110 (exp. 1).
> > >       [   33.601620] usb 1-1: Failed to query (GET_INFO) UVC control 3 on unit 2: -110 (exp. 1).
> > >       [   34.113672] usb 1-1: Failed to query (GET_INFO) UVC control 7 on unit 2: -110 (exp. 1).
> > >       [   34.625635] usb 1-1: Failed to query (GET_INFO) UVC control 8 on unit 2: -110 (exp. 1).
> > >       [   35.137673] usb 1-1: Failed to query (GET_INFO) UVC control 10 on unit 2: -110 (exp. 1).
> > >       [   35.649581] usb 1-1: Failed to query (GET_INFO) UVC control 5 on unit 2: -110 (exp. 1).
> > >       [   36.161693] usb 1-1: Failed to query (GET_INFO) UVC control 11 on unit 2: -110 (exp. 1).
> > >       [   46.401833] usb 1-1: UVC non compliance - GET_DEF(PROBE) not supported. Enabling workaround.
> > >       [   51.460664] uvcvideo 1-1:1.1: Failed to query (129) UVC probe control : -110 (exp. 26).
> > >       [   51.460672] uvcvideo 1-1:1.1: Failed to initialize the device (-5).
> > >       [   61.656435] usb 1-1: 3:1: usb_set_interface failed (-110)
> > >       [   71.885237] usb 1-1: 3:1: usb_set_interface failed (-110)
> > >       [   77.003565] usb 1-1: 3:1: usb_set_interface failed (-110)
> > > ...
> > >       [ 2022.115559] usb 1-1: 3:1: usb_set_interface failed (-110)
> > >
> > >
> > > Are you using any proprietary driver or had applied any patch/driver
> > > to the Kernel?
> > >
> > > Can you try testing it with vanilla Kernel 5.10?
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> 
> 
> Thanks for your through inspections about the log, me too suspect the
> problem is related to the audio input, since the audio and video
> stream share the same usb cable.
> I blacklisted the snd_usb_audio driver, and the camera works fine now.
> (I dont really need the audio in the first place so I guess this
> solves it)

Both audio and video are supposed to work, so if you want to use audio
as well, I'd recommend contacting the alsa-devel@alsa-project.org
mailing list for support.

> Thanks very much!

You're welcome.

> p.s. As for the kernel version, it was 5.8.0-44-generic and I just
> installed the ubuntu system a weak ago without adding any customized
> patch/driver except for the nvidia GPU.

-- 
Regards,

Laurent Pinchart
