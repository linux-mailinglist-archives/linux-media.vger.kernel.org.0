Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F592638DDA
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 16:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiKYPxs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 10:53:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiKYPxb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 10:53:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4884B992
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:53:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7BB1496;
        Fri, 25 Nov 2022 16:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669391598;
        bh=hg/bWXABPL6JxDCFVcgpE2kVy9o99AnuBiTAolJ3slQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BGtbePN5I5qEUFyyHCQPsrvT84/59z10XvR0JfGIru/aLYlkWghThT0wlsg68VtMY
         5nwYkCsuzudSqRHhkycEdEKc8xuRe+4nYtmKbVAIvBkUprSI59FoU5aPzHMZin/AYz
         hm4FK4atEj89hvorWGwQJMErICmquz6eobHnMtUc=
Date:   Fri, 25 Nov 2022 17:53:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Amos Tibaldi <tibaldi.amos@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: request for help on uvcvideo driver issue
Message-ID: <Y4Dk3R3qSnszEOO3@pendragon.ideasonboard.com>
References: <CAKAO289-s=VJYJzt5JBCSvAzHmG-KMY12yX-RMREQTQCHVe6YA@mail.gmail.com>
 <Y358tj0cKyXyaFFF@pendragon.ideasonboard.com>
 <CAKAO28-5OPZgz=7oSr9qrU0KRB7=Tmfj_nM3DQP6rdgw61=YaQ@mail.gmail.com>
 <Y4AbJFVL426tanO5@pendragon.ideasonboard.com>
 <CAKAO289ZCUgpCmgOO8Oe3DNB60tLHvmRq_zu_zOmUkvO19C7OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKAO289ZCUgpCmgOO8Oe3DNB60tLHvmRq_zu_zOmUkvO19C7OA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Amos,

On Fri, Nov 25, 2022 at 03:11:22AM +0100, Amos Tibaldi wrote:
> Hello, I blacklisted the snd_usb_audio and traced 0xffff uvcvideo.ko. The
> problem has slightly changed. Now the frames are coming but are not shown,
> as you can see from the syslog and dmesg below. Cheese, mpv, vlc, xawtv
> show all black window
> 
> tibaldi@ryzen:~/Desktop/src/svl2/SimpleV4L2-SimpleV4L2_v0.2.5/build$ xawtv
> This is xawtv-3.106, running on Linux/x86_64 (5.4.212)
> xinerama 0: 1920x1080+0+0
> vid-open-auto: using grabber/webcam device /dev/video0
> v4l2: oops: select timeout

[snip]

> [  686.740627] uvcvideo: Probing generic UVC device 3
> [  686.742123] uvcvideo: Found format MJPEG.
> [  686.742125] uvcvideo: - 1920x1080 (30.0 fps)
> [  686.742126] uvcvideo: - 640x480 (30.0 fps)
> [  686.742127] uvcvideo: - 800x600 (30.0 fps)
> [  686.742128] uvcvideo: - 1024x768 (30.0 fps)
> [  686.742129] uvcvideo: - 1280x720 (30.0 fps)
> [  686.742130] uvcvideo: - 1280x960 (30.0 fps)
> [  686.742130] uvcvideo: - 1280x1024 (30.0 fps)
> [  686.742131] uvcvideo: - 1360x768 (30.0 fps)
> [  686.742132] uvcvideo: - 1400x900 (30.0 fps)
> [  686.742133] uvcvideo: - 1440x900 (30.0 fps)
> [  686.742134] uvcvideo: Found format YUV 4:2:2 (YUYV).
> [  686.742135] uvcvideo: - 1920x1080 (30.0 fps)
> [  686.742135] uvcvideo: - 640x480 (30.0 fps)
> [  686.742136] uvcvideo: - 800x600 (30.0 fps)
> [  686.742137] uvcvideo: - 1024x768 (30.0 fps)
> [  686.742138] uvcvideo: - 1280x720 (30.0 fps)
> [  686.742139] uvcvideo: - 1280x960 (30.0 fps)
> [  686.742140] uvcvideo: - 1280x1024 (30.0 fps)
> [  686.742141] uvcvideo: - 1360x768 (30.0 fps)
> [  686.742141] uvcvideo: - 1400x900 (30.0 fps)
> [  686.742142] uvcvideo: - 1440x900 (30.0 fps)
> [  686.742146] uvcvideo: Found a Status endpoint (addr 87).
> [  686.742147] uvcvideo: Found UVC 1.00 device ezcap U3 capture (1bcf:2c99)
> [  686.742151] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 3 entity 2
> [  686.743061] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
> [  686.743063] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 3 entity 2
> [  686.744306] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
> [  686.744307] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/6 to device 3 entity 2
> [  686.745557] uvcvideo: Adding mapping 'Hue' to control 00000000-0000-0000-0000-000000000101/6.
> [  686.745558] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 3 entity 2
> [  686.746808] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
> [  686.746811] uvcvideo: Scanning UVC chain: OT 5 <- XU 4 <- XU 3 <- PU 2 <- IT 1
> [  686.746814] uvcvideo: Found a valid video chain (1 -> 5).
> [  686.759767] input: ezcap U3 capture: ezcap U3 capt as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb2/2-3/2-3:1.0/input/input20
> [  686.759814] uvcvideo: UVC device initialized.
> [  686.759856] usbcore: registered new interface driver uvcvideo
> [  686.759857] USB Video Class driver (1.1.1)
> [  688.950588] uvcvideo: Suspending interface 1
> [  688.950591] uvcvideo: Suspending interface 0
> [  693.066866] uvcvideo: uvc_v4l2_open
> [  693.164163] uvcvideo: Resuming interface 0
> [  693.164164] uvcvideo: Resuming interface 1
> [  693.164213] uvcvideo: uvc_v4l2_poll
> [  693.164216] uvcvideo: uvc_v4l2_read: not implemented.

That's an ancient API that the uvcvideo driver doesn't support. xawtv is
likely a bad test application. Let's start simply, could you run

yavta -f YUYV -s 1920x1080 -c10 /dev/video0

and provide both the kernel log and the messages output by yavta ?

> [  693.164220] uvcvideo: uvc_v4l2_poll
> [  693.164221] uvcvideo: uvc_v4l2_read: not implemented.
> [  693.164234] uvcvideo: uvc_v4l2_poll
> [  693.164234] uvcvideo: uvc_v4l2_read: not implemented.
> [  693.164240] uvcvideo: uvc_v4l2_poll
> [  693.164241] uvcvideo: uvc_v4l2_read: not implemented.
> [  693.167317] uvcvideo: uvc_v4l2_poll
> [  693.167320] uvcvideo: uvc_v4l2_read: not implemented.
> [  693.167887] uvcvideo: uvc_v4l2_open
> [  693.167894] uvcvideo: uvc_ioctl_g_input 1
> [  693.167895] uvcvideo: uvc_ioctl_enum_input 1
> [  693.167903] uvcvideo: Trying format 0x32315559 (YU12): 1920x1080.
> [  693.167904] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> [  693.181968] uvcvideo: Trying format 0x32315559 (YU12): 1920x1080.
> [  693.181970] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> [  693.196719] uvcvideo: Trying format 0x32315659 (YV12): 1920x1080.
> [  693.196721] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> [  693.210226] uvcvideo: Trying format 0x50323234 (422P): 1920x1080.
> [  693.210228] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> [  693.224215] uvcvideo: Trying format 0x56595559 (YUYV): 1920x1080.
> [  693.224217] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> [  693.237715] uvcvideo: uvc_ioctl_g_parm 1
> [  693.251341] uvcvideo: uvc_v4l2_mmap
> [  693.251460] uvcvideo: uvc_v4l2_mmap
> [  693.251536] uvcvideo: uvc_v4l2_mmap
> [  693.251602] uvcvideo: uvc_v4l2_mmap
> [  693.251660] uvcvideo: uvc_v4l2_mmap
> [  693.251715] uvcvideo: uvc_v4l2_mmap
> [  693.251768] uvcvideo: uvc_v4l2_mmap
> [  693.251821] uvcvideo: uvc_v4l2_mmap
> [  693.251873] uvcvideo: uvc_v4l2_mmap
> [  693.251925] uvcvideo: uvc_v4l2_mmap
> [  693.251977] uvcvideo: uvc_v4l2_mmap
> [  693.252030] uvcvideo: uvc_v4l2_mmap
> [  693.252082] uvcvideo: uvc_v4l2_mmap
> [  693.252134] uvcvideo: uvc_v4l2_mmap
> [  693.252185] uvcvideo: uvc_v4l2_mmap
> [  693.252237] uvcvideo: uvc_v4l2_mmap
> [  693.252288] uvcvideo: uvc_v4l2_mmap
> [  693.252340] uvcvideo: uvc_v4l2_mmap
> [  693.252391] uvcvideo: uvc_v4l2_mmap
> [  693.252442] uvcvideo: uvc_v4l2_mmap
> [  693.252494] uvcvideo: uvc_v4l2_mmap
> [  693.252545] uvcvideo: uvc_v4l2_mmap
> [  693.252596] uvcvideo: uvc_v4l2_mmap
> [  693.252648] uvcvideo: uvc_v4l2_mmap
> [  693.252699] uvcvideo: uvc_v4l2_mmap
> [  693.252750] uvcvideo: uvc_v4l2_mmap
> [  693.252801] uvcvideo: uvc_v4l2_mmap
> [  693.252852] uvcvideo: uvc_v4l2_mmap
> [  693.252903] uvcvideo: uvc_v4l2_mmap
> [  693.252954] uvcvideo: uvc_v4l2_mmap
> [  693.253005] uvcvideo: uvc_v4l2_mmap
> [  693.253056] uvcvideo: uvc_v4l2_mmap
> [  693.253126] uvcvideo: uvc_ioctl_streamon 1
> [  693.253126] uvcvideo: uvc_ioctl_streamon 2
> [  693.255834] uvcvideo: Allocated 5 URB buffers of 16x1024 bytes each.
> [  693.528952] uvcvideo: Frame complete (EOF found).
> [  693.528953] uvcvideo: EOF in empty payload.
> [  693.530411] uvcvideo: frame 1 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 532789400/536923291/88
> [  693.562281] uvcvideo: Frame complete (EOF found).
> [  693.562282] uvcvideo: EOF in empty payload.
> [  693.563740] uvcvideo: frame 2 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 536945656/541069838/121
> [  693.595614] uvcvideo: Frame complete (EOF found).
> [  693.595615] uvcvideo: EOF in empty payload.
> [  693.597074] uvcvideo: frame 3 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 541101909/545231972/154
> [  693.628948] uvcvideo: Frame complete (EOF found).
> [  693.628949] uvcvideo: EOF in empty payload.
> [  693.630406] uvcvideo: frame 4 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 254/255 scr, last pts/stc/sof 545258164/549394108/188
> [  693.662279] uvcvideo: Frame complete (EOF found).
> [  693.662280] uvcvideo: EOF in empty payload.
> .......
> [  710.361665] uvcvideo: EOF in empty payload.
> [  710.363124] uvcvideo: frame 506 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 2631698065/2635823538/534
> [  710.394996] uvcvideo: Frame complete (EOF found).
> [  710.394997] uvcvideo: EOF in empty payload.
> [  710.396456] uvcvideo: frame 507 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 2635854320/2639985673/567
> [  710.428329] uvcvideo: Frame complete (EOF found).
> [  710.428330] uvcvideo: EOF in empty payload.
> [  710.428407] uvcvideo: uvc_ioctl_streamoff 1
> [  710.432808] uvcvideo: uvc_v4l2_release
> [  710.435191] uvcvideo: uvc_v4l2_release
> [  712.815575] uvcvideo: Suspending interface 1
> [  712.815578] uvcvideo: Suspending interface 0
> 
> On Fri, Nov 25, 2022 at 2:32 AM Laurent Pinchart wrote:
> 
> > Hi Amos,
> >
> > Could you please avoid dropping the mailing list from CC when replying ?
> >
> > On Wed, Nov 23, 2022 at 09:43:10PM +0100, Amos Tibaldi wrote:
> > > Hello, I attached the dmesg text file of one linux mint 20.1 that I have
> > > just installed. The issue is the same. I hope it helps. Thanks.
> >
> > Quoting the interesting part from the log:
> >
> > > [  823.596518] usb 2-3: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> > > [  823.629237] usb 2-3: New USB device found, idVendor=1bcf, idProduct=2c99, bcdDevice= 2.00
> > > [  823.629239] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > [  823.629240] usb 2-3: Product: ezcap U3 capture
> > > [  823.629241] usb 2-3: Manufacturer: VXIS Inc
> >
> > So far so good.
> >
> > > [  823.659423] mc: Linux media interface: v0.10
> > > [  823.667890] videodev: Linux video capture interface: v2.00
> > > [  823.678367] usb 2-3: 3:1: cannot get freq at ep 0x86
> > > [  823.685869] usb 2-3: 3:2: cannot get freq at ep 0x86
> > > [  823.692874] usb 2-3: 3:3: cannot get freq at ep 0x86
> >
> > This I don't like. I've seen many devices having trouble with the audio
> > side, which resulted in different kind of firmware misbehaviours (most
> > likely including crashes) that affected the video side. Could you try to
> > blacklist the snd_usb_audio module to see if it helps ? It can be done
> > by adding
> >
> > blacklist snd_usb_audio
> >
> > to /etc/modprobe.d/blacklist.conf
> >
> > > [  823.738250] usb 2-3: Warning! Unlikely big volume range (=4096), cval->res is probably wrong.
> > > [  823.738252] usb 2-3: [5] FU [Digital In Capture Volume] ch = 1, val = 0/4096/1
> > > [  823.738384] usbcore: registered new interface driver snd-usb-audio
> > > [  823.740047] uvcvideo: Found UVC 1.00 device ezcap U3 capture (1bcf:2c99)
> > > [  823.760905] input: ezcap U3 capture: ezcap U3 capt as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb2/2-3/2-3:1.0/input/input17
> > > [  823.760976] usbcore: registered new interface driver uvcvideo
> > > [  823.760977] USB Video Class driver (1.1.1)
> >
> > Could you start video capture with any application and check if
> > additional messages are then printed in the kernel log ?
> >
> > > On Wed, Nov 23, 2022 at 9:04 PM Laurent Pinchart wrote:
> > >
> > > > Hi Amos,
> > > >
> > > > CC'ing the linux-media mailing list.
> > > >
> > > > On Wed, Nov 23, 2022 at 07:16:05PM +0100, Amos Tibaldi wrote:
> > > > > Hello,
> > > > >    I have a usb framegrabber and it worked fine in ubuntu 20.04 and previous
> > > > > releases of ubuntu with the uvcvideo.ko kernel module but now that I have
> > > > > ubuntu 22.10 the uvcvideo.ko does not work with the ezcap261 framegrabber. The
> > > > > ko is loaded but cheese or xawtv or vlc go on timeout when issuing video
> > > > > acquisition, and the select returns wrong argument. I have also updated the
> > > > > firmware of the framegrabber. What can I do?
> > > >
> > > > Could you please send a copy of the kernel log, in text form ? You can
> > > > retrieve it with `dmesg` or `sudo dmesg`. I'm particularly interested in
> > > > messages printed when the device is plugged in, or when an application
> > > > attempts to use it.

-- 
Regards,

Laurent Pinchart
