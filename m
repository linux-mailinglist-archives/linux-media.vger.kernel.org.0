Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FA22A6F9B
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 22:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732126AbgKDVY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 16:24:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732089AbgKDVY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 16:24:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE49C0613D3
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 13:24:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 153D0563;
        Wed,  4 Nov 2020 22:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604525095;
        bh=ijuBo8DyQVl5cgttjl4X6ci8FBI/6JLAsvb5gSATbHg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bOI4keR+8M2Rwhn9FtNInBgmJ1ec5rcd0af1I+zGmpopDvF7DCPbQFdGHp+WjfcuP
         Q2Eyg9jr5Cd0jfLGYFqJie+QyF4PatC1UyNo1gVkJ10KENgF0UdCTo+n39ndzyRZFK
         tMMLl3fhrvnQKeKGfrh64jatTMl5H37deoAT/oDM=
Date:   Wed, 4 Nov 2020 23:24:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Gregor Hlawacek <g.hlawacek@hzdr.de>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: Philips Monitor with webcam
Message-ID: <20201104212454.GF29958@pendragon.ideasonboard.com>
References: <51207fd712e3c1001b80c6642021b1a5d5763ade.camel@hzdr.de>
 <20201104170233.0d405dff@coco.lan>
 <59f848e83354ad72c11dacaf571f20a8084baf58.camel@hzdr.de>
 <20201104174554.4bbec36a@coco.lan>
 <b8fcc03ed79873f9e55ab394b4b95140ab8b215b.camel@hzdr.de>
 <20201104210155.353a0d6a@coco.lan>
 <40a643d5fd9b6dd387d9cbde3e5ba1796b282f6a.camel@hzdr.de>
 <20201104221148.4d5c644d@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104221148.4d5c644d@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

On Wed, Nov 04, 2020 at 10:11:48PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 04 Nov 2020 21:22:55 +0100 Gregor Hlawacek escreveu:
> > On Wed, 2020-11-04 at 21:01 +0100, Mauro Carvalho Chehab wrote:
> > > Em Wed, 04 Nov 2020 20:43:27 +0100 Gregor Hlawacek escreveu:
> > > 
> > > I'm c/c Laurent, as he is the author of the UVC driver.
> > >   
> > > > On Wed, 2020-11-04 at 17:45 +0100, Mauro Carvalho Chehab wrote:  
> > > > > Em Wed, 04 Nov 2020 17:25:48 +0100 Gregor Hlawacek escreveu:
> > > > > > On Wed, 2020-11-04 at 17:02 +0100, Mauro Carvalho Chehab wrote:    
> > > > > > > Em Wed, 04 Nov 2020 14:24:34 +0100 Gregor Hlawacek escreveu:
> > > > > > >       
> > > > > > > > Hi all
> > > > > > > > 
> > > > > > > > I own a Philips Brilliance 241B which has a webcam attached. The device
> > > > > > > > is listed as 0412:612b Chicony Electronics Co., Ltd, bubt doesn't work
> > > > > > > > with the latest UVC stock kernel driver. Is there any hope to get this
> > > > > > > > supported?
> > > > > > > > 
> > > > > > > > uname -a:
> > > > > > > > Linux it72 5.9.3-arch1-1 #1 SMP PREEMPT Sun, 01 Nov 2020 12:58:59+0000 x86_64 GNU/Linux
> > > > > > > > 
> > > > > > > > running Arch Linux on a Lenovo Thinkpad  T490s
> > > > > > > > 
> > > > > > > > dmesg:
> > > > > > > > 
> > > > > > > > [76850.137838] usb 3-1.1.1.2: New USB device found, idVendor=04f2, idProduct=b612, bcdDevice= 2.10
> > > > > > > > [76850.137841] usb 3-1.1.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > > > > > > > [76850.137843] usb 3-1.1.1.2: Product: USB2.0 FHD UVC WebCam
> > > > > > > > [76850.137845] usb 3-1.1.1.2: Manufacturer: SunplusIT Inc
> > > > > > > > [76850.137846] usb 3-1.1.1.2: SerialNumber: 01.00.00
> > > > > > > > [76850.152761] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC WebCam (04f2:b612)
> > > > > > > > [76850.215683] input: USB2.0 FHD UVC WebCam: USB2.0 F as /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:00.0/usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.0/input/input66
> > > > > > > > [76850.223642] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC WebCam (04f2:b612)
> > > > > > > > [76850.232499] usb 4-1.1.2: new SuperSpeed Gen 1 USB device number 5 using xhci_hcd
> > > > > > > > [76850.241004] input: USB2.0 FHD UVC WebCam: IR Camer as /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:00.0/usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.2/input/input67      
> > > > > > > 
> > > > > > > Hmm... it sounds that the camera was properly detected here. 
> > > > > > > 
> > > > > > > Could you please enclose the contents of the following
> > > > > > > command?
> > > > > > > 
> > > > > > >         $ v4l2-ctl --all
> > > > > > > 
> > > > > > > Thanks,
> > > > > > > Mauro      
> > > > > > 
> > > > > > Hi Mauro 
> > > > > > 
> > > > > > thanks for the quick answer. Here is the output but I am pretty sure
> > > > > > that this come from the integrated laptop camera and not the one in the
> > > > > > external monitor    
> > > > > 
> > > > > Well, you can use "-d" parameter to identify the device, like:
> > > > > 
> > > > >         $ v4l2-ctl -d /dev/v4l/by-path/pci-0000\:00\:14.0-usb-0\:3.2\:1.0-video-index0 --all
> > > > > 
> > > > > The real path depends on your camera - you can take a look at:
> > > > > 
> > > > >         $ tree /dev/v4l/
> > > > >         /dev/v4l/
> > > > >         ├── by-id
> > > > >         │   ├── usb-046d_HD_Pro_Webcam_C920_55DA1CCF-video-index0 -> ../../video0
> > > > >         │   └── usb-046d_HD_Pro_Webcam_C920_55DA1CCF-video-index1 -> ../../video1
> > > > >         └── by-path
> > > > >             ├── pci-0000:00:14.0-usb-0:3.2:1.0-video-index0 -> ../../video0
> > > > >             └── pci-0000:00:14.0-usb-0:3.2:1.0-video-index1 -> ../../video1
> > > > > 
> > > > >         
> > > > > In order to check the ones that were detected.
> > > >
> > > > ├── by-id
> > > > │   ├── usb-Chicony_Electronics_Co._Ltd._Integrated_Camera_0001-video-index0 -> ../../video0
> > > > │   ├── usb-Chicony_Electronics_Co._Ltd._Integrated_Camera_0001-video-index1 -> ../../video1  
> > > 
> > > Ok. So, /dev/video0 is the video streaming device (and /dev/video1
> > > carries on metadata).
> > > 
> > > > │   ├── usb-SunplusIT_Inc_USB2.0_FHD_UVC_WebCam_01.00.00-video-index0 -> ../../video4    
> > > > │   └── usb-SunplusIT_Inc_USB2.0_FHD_UVC_WebCam_01.00.00-video-index1 -> ../../video5    
> > > > └── by-path
> > > >     ├── pci-0000:00:14.0-usb-0:8:1.0-video-index0 -> ../../video0
> > > >     ├── pci-0000:00:14.0-usb-0:8:1.0-video-index1 -> ../../video1
> > > >     ├── pci-0000:3c:00.0-usb-0:1.1.1.2:1.0-video-index0 -> ../../video2
> > > >     ├── pci-0000:3c:00.0-usb-0:1.1.1.2:1.0-video-index1 -> ../../video3
> > > >     ├── pci-0000:3c:00.0-usb-0:1.1.1.2:1.2-video-index0 -> ../../video4
> > > >     └── pci-0000:3c:00.0-usb-0:1.1.1.2:1.2-video-index1 -> ../../video5
> > > > 
> > > > It seems non of them responds. They are either busy, can not be opened
> > > > or fail to produce any response.
> > > > 
> > > > sudo v4l2-ctl -d /dev/v4l/by-id/usb-sunplusIT_Inc_USB2.0_FHD_UVC_WebCam_01.00.00-video-index0
> > > > Failed to open /dev/v4l/by-id/usb-SunplusIT_Inc_USB2.0_FHD_UVC_WebCam_01.00.00-video-index0: Device or resource busy  
> > > 
> > > Weird. It is not usual to receive -EBUSY if there's no other program
> > > using the device at the same time.
> > > 
> > > Yet, from what I understood, on this device, the camera is hidden inside
> > > the monitor until an application tries to use it.
> > > 
> > > While uvc driver has support for Linux PM, perhaps this specific
> > > device requires some extra command to turn the camera on and to 
> > > open it from the monitor case.
> > > 
> > > After you called v4l2-ctl, does any message appears at dmesg?
> > 
> > Hi Mauro
> > 
> > no nothing. 
> > 
> > ls -l /dev/video* 
> > crw-rw----+ 1 root video 81, 0 4. Nov 15:19 /dev/video0
> > crw-rw----+ 1 root video 81, 1 4. Nov 15:19 /dev/video1
> > crw-rw----+ 1 root video 81, 2 4. Nov 15:19 /dev/video2
> > crw-rw----+ 1 root video 81, 3 4. Nov 15:19 /dev/video3
> > crw-rw----+ 1 root video 81, 4 4. Nov 15:19 /dev/video4
> > crw-rw----+ 1 root video 81, 5 4. Nov 15:19 /dev/video5
> > 
> > video0 and 1 are the laptop cam. video2-5 is related to the not working
> > one inside the external monitor.
> 
> Well, based on the results of your tree command:
> 
> $ tree /dev/v4l/
>         /dev/v4l/
> 	├── by-id
> 	│   ├── usb-Chicony_Electronics_Co._Ltd._Integrated_Camera_0001-video-index0 -> ../../video0
> 	│   ├── usb-Chicony_Electronics_Co._Ltd._Integrated_Camera_0001-video-index1 -> ../../video1
> 	│   ├── usb-SunplusIT_Inc_USB2.0_FHD_UVC_WebCam_01.00.00-video-index0 -> ../../video4  
> 	│   └── usb-SunplusIT_Inc_USB2.0_FHD_UVC_WebCam_01.00.00-video-index1 -> ../../video5  
> 	└── by-path
> 	    ├── pci-0000:00:14.0-usb-0:8:1.0-video-index0 -> ../../video0
> 	    ├── pci-0000:00:14.0-usb-0:8:1.0-video-index1 -> ../../video1
> 	    ├── pci-0000:3c:00.0-usb-0:1.1.1.2:1.0-video-index0 -> ../../video2
> 	    ├── pci-0000:3c:00.0-usb-0:1.1.1.2:1.0-video-index1 -> ../../video3
> 	    ├── pci-0000:3c:00.0-usb-0:1.1.1.2:1.2-video-index0 -> ../../video4
> 	    └── pci-0000:3c:00.0-usb-0:1.1.1.2:1.2-video-index1 -> ../../video5
> 
> you have:
> 	- Chicony devices: video0 and video1
> 	- SunplusIT FHD WebCam: video4 and video5
> 	- Two other video devnodes (video2 and video3) that didn't return
> 	  any ID.
> 
> From what you mentioned on your first e-mail, the Chicony device is
> the webcam mounted inside the Philips monitor. Right?
> 
> -
> 
> The issue with video2 and video3 can actually put something in
> perspective.
> 
> When systemd/udev detects a video device, it runs the ruleset at:
> 
> 	/usr/lib/udev/rules.d/60-persistent-v4l.rules
> 
> Which calls a program:
> 
> 	/usr/lib/udev/v4l_id
> 
> via those rules:
> 
> 	SUBSYSTEMS=="usb", IMPORT{builtin}="usb_id"
> 	KERNEL=="video*", ENV{ID_SERIAL}=="?*", SYMLINK+="v4l/by-id/$env{ID_BUS}-$env{ID_SERIAL}-video-index$attr{index}"
> 
> This small program checks the features on all V4L2 devices (a simplified
> version of v4l2-ctl --all) and populate the aliases under /dev/v4l.
> 
> As it didn't create any nodes at /dev/v4l/by-id for video2 and video3,
> perhaps, due to a bug somewhere, this program is locked, and it is keeping
> the device opened. If this is the case, you can indeed receive -EBUSY when
> trying to access the device nodes.
> 
> Another weird thing is that the same USB device at:
> 	
> 	pci-0000:3c:00.0-usb-0:1.1.1.2:1
> 
> is creating 4 devnodes instead of two. This command may help to
> better understand what's happening:
> 
> 	$ lsusb -t
> 
> But usually USB camera devices have an internal hub, with multiple
> ports on it, like my Logitech camera:
> 
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
>     |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 4: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 2: Dev 8, If 2, Class=Audio, Driver=snd-usb-audio, 480M
>         |__ Port 2: Dev 8, If 0, Class=Video, Driver=uvcvideo, 480M
>         |__ Port 2: Dev 8, If 3, Class=Audio, Driver=snd-usb-audio, 480M
>         |__ Port 2: Dev 8, If 1, Class=Video, Driver=uvcvideo, 480M
>         |__ Port 1: Dev 4, If 1, Class=Human Interface Device, Driver=usbhid, 12M
>         |__ Port 1: Dev 4, If 2, Class=Human Interface Device, Driver=usbhid, 12M
>         |__ Port 1: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 12M
> 
> At the above, uvcvideo is used on port 2.
> 
> On your case, both port 0 and port 2 seem to be reporting an UVC
> camera, which sounds wrong. On a first glance, that sounds to be a
> problem at the USB descriptors stored at the device's EEPROM.

What's the output of 'lsusb -v -d 04f2:b612' (running as root if
possible) ?

-- 
Regards,

Laurent Pinchart
