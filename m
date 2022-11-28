Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E02863AAC7
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 15:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbiK1OYV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 09:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbiK1OYU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 09:24:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998ED2AEF
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 06:24:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED9C4501;
        Mon, 28 Nov 2022 15:24:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669645457;
        bh=Adf2NxFkLOhCU+hBfB7R2PuQK3cg1+KgdFaQlPXnJzs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MhqX07eU6Tc1pqzEBeyW26Tc1Pp1+aA2DQSl+rAEgxKPcL0A968QHk15WS2O/IrMH
         gUwWKe9VVWnact672mXtJ+Zs3Q0251MeGoKkOLpJ6iGfaR/H7MpeE0wVbjCUmHxXJH
         Oacks/ruIwj9xBjkX82cGKcIZ6EJXPX/9gt0kZe0=
Date:   Mon, 28 Nov 2022 16:24:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Amos Tibaldi <tibaldi.amos@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: request for help on uvcvideo driver issue
Message-ID: <Y4TEgkIQS3MswsxR@pendragon.ideasonboard.com>
References: <CAKAO289-s=VJYJzt5JBCSvAzHmG-KMY12yX-RMREQTQCHVe6YA@mail.gmail.com>
 <Y358tj0cKyXyaFFF@pendragon.ideasonboard.com>
 <CAKAO28-5OPZgz=7oSr9qrU0KRB7=Tmfj_nM3DQP6rdgw61=YaQ@mail.gmail.com>
 <Y4AbJFVL426tanO5@pendragon.ideasonboard.com>
 <CAKAO289ZCUgpCmgOO8Oe3DNB60tLHvmRq_zu_zOmUkvO19C7OA@mail.gmail.com>
 <Y4Dk3R3qSnszEOO3@pendragon.ideasonboard.com>
 <CAKAO28-2TdOjjGN0hYwwN-u7e0makaOX=OLOwWoTCX4VRJvtvQ@mail.gmail.com>
 <CAKAO28_nE6v+f8wPab9cHuJRwjmneaADLy-GwsWQEk343=dERg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKAO28_nE6v+f8wPab9cHuJRwjmneaADLy-GwsWQEk343=dERg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Amos,

On Sat, Nov 26, 2022 at 06:06:48PM +0100, Amos Tibaldi wrote:
> Hello. Anyway the 10 frames captured are empty, so there is a problem
> anyway.

The logs suggest otherwise. yavta doesn't capture frames to disk by
default. Could you add the `-F` argument and check if frames are
captured correctly ?

> I wonder why two years ago the driver was working and now not any more.
> 
> On Fri, Nov 25, 2022 at 6:38 PM Amos Tibaldi <tibaldi.amos@gmail.com> wrote:
> 
> > Hello, here is the output from yavta, it captures 10 frames but does not
> > show anything, and if I run it again other times it captures nothing more,
> > unluckily.
> >
> > tibaldi@ryzen:~/Desktop/src/yavta$ yavta -f YUYV -s 1920x1080 -c10
> > /dev/video0
> > Device /dev/video0 opened.
> > Device `ezcap U3 capture: ezcap U3 capt' on `usb-0000:02:00.0-3' (driver
> > 'uvcvideo') supports video, capture, without mplanes.
> > Video format set: YUYV (56595559) 1920x1080 (stride 3840) field none
> > buffer size 4147200
> > Video format: YUYV (56595559) 1920x1080 (stride 3840) field none buffer
> > size 4147200
> > 8 buffers requested.
> > length: 4147200 offset: 0 timestamp type/source: mono/SoE
> > Buffer 0/0 mapped at address 0x7fcd90081000.
> > length: 4147200 offset: 4149248 timestamp type/source: mono/SoE
> > Buffer 1/0 mapped at address 0x7fcd8fc8c000.
> > length: 4147200 offset: 8298496 timestamp type/source: mono/SoE
> > Buffer 2/0 mapped at address 0x7fcd8f897000.
> > length: 4147200 offset: 12447744 timestamp type/source: mono/SoE
> > Buffer 3/0 mapped at address 0x7fcd8f4a2000.
> > length: 4147200 offset: 16596992 timestamp type/source: mono/SoE
> > Buffer 4/0 mapped at address 0x7fcd8f0ad000.
> > length: 4147200 offset: 20746240 timestamp type/source: mono/SoE
> > Buffer 5/0 mapped at address 0x7fcd8ecb8000.
> > length: 4147200 offset: 24895488 timestamp type/source: mono/SoE
> > Buffer 6/0 mapped at address 0x7fcd8e8c3000.
> > length: 4147200 offset: 29044736 timestamp type/source: mono/SoE
> > Buffer 7/0 mapped at address 0x7fcd8e4ce000.
> > 0 (0) [-] none 0 4147200 B 636.063000 636.094430 4.068 fps ts mono/SoE
> > 1 (1) [-] none 1 4147200 B 636.095847 636.127739 30.444 fps ts mono/SoE
> > 2 (2) [-] none 2 4147200 B 636.129171 636.161062 30.008 fps ts mono/SoE
> > 3 (3) [-] none 3 4147200 B 636.162494 636.194385 30.009 fps ts mono/SoE
> > 4 (4) [-] none 4 4147200 B 636.195818 636.227709 30.008 fps ts mono/SoE
> > 5 (5) [-] none 5 4147200 B 636.229142 636.261034 30.008 fps ts mono/SoE
> > 6 (6) [-] none 6 4147200 B 636.262465 636.294357 30.009 fps ts mono/SoE
> > 7 (7) [-] none 7 4147200 B 636.295789 636.327681 30.008 fps ts mono/SoE
> > 8 (0) [-] none 8 4147200 B 636.329112 636.361005 30.009 fps ts mono/SoE
> > 9 (1) [-] none 9 4147200 B 636.362436 636.394328 30.008 fps ts mono/SoE
> > Captured 10 frames in 0.577147 seconds (17.326601 fps, 71856878.812123 B/s).
> > 8 buffers released.
> > tibaldi@ryzen:~/Desktop/src/yavta$ ls
> > yavta-0.0+git20190114.e21525b
> >  yavta_0.0+git20190114.e21525b-1.debian.tar.xz
> >  yavta_0.0+git20190114.e21525b-1.dsc
> >  yavta_0.0+git20190114.e21525b.orig.tar.gz
> > tibaldi@ryzen:~/Desktop/src/yavta$
> >
> > Here is the dmesg:
> >
> > [  590.224080] usb 2-3: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> > [  590.257648] usb 2-3: New USB device found, idVendor=1bcf, idProduct=2c99, bcdDevice= 2.00
> > [  590.257651] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > [  590.257652] usb 2-3: Product: ezcap U3 capture
> > [  590.257653] usb 2-3: Manufacturer: VXIS Inc
> > [  590.288882] mc: Linux media interface: v0.10
> > [  590.295626] videodev: Linux video capture interface: v2.00
> > [  590.302902] uvcvideo: Found UVC 1.00 device ezcap U3 capture (1bcf:2c99)
> > [  590.322509] input: ezcap U3 capture: ezcap U3 capt as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb2/2-3/2-3:1.0/input/input17
> > [  590.322603] usbcore: registered new interface driver uvcvideo
> > [  590.322603] USB Video Class driver (1.1.1)
> > [  722.776405] usbcore: deregistering interface driver uvcvideo
> > [  730.533290] uvcvideo: Probing generic UVC device 3
> > [  730.534818] uvcvideo: Found format MJPEG.
> > [  730.534820] uvcvideo: - 1920x1080 (30.0 fps)
> > [  730.534820] uvcvideo: - 640x480 (30.0 fps)
> > [  730.534821] uvcvideo: - 800x600 (30.0 fps)
> > [  730.534822] uvcvideo: - 1024x768 (30.0 fps)
> > [  730.534822] uvcvideo: - 1280x720 (30.0 fps)
> > [  730.534823] uvcvideo: - 1280x960 (30.0 fps)
> > [  730.534824] uvcvideo: - 1280x1024 (30.0 fps)
> > [  730.534824] uvcvideo: - 1360x768 (30.0 fps)
> > [  730.534825] uvcvideo: - 1400x900 (30.0 fps)
> > [  730.534825] uvcvideo: - 1440x900 (30.0 fps)
> > [  730.534826] uvcvideo: Found format YUV 4:2:2 (YUYV).
> > [  730.534827] uvcvideo: - 1920x1080 (30.0 fps)
> > [  730.534827] uvcvideo: - 640x480 (30.0 fps)
> > [  730.534828] uvcvideo: - 800x600 (30.0 fps)
> > [  730.534829] uvcvideo: - 1024x768 (30.0 fps)
> > [  730.534829] uvcvideo: - 1280x720 (30.0 fps)
> > [  730.534830] uvcvideo: - 1280x960 (30.0 fps)
> > [  730.534831] uvcvideo: - 1280x1024 (30.0 fps)
> > [  730.534831] uvcvideo: - 1360x768 (30.0 fps)
> > [  730.534832] uvcvideo: - 1400x900 (30.0 fps)
> > [  730.534832] uvcvideo: - 1440x900 (30.0 fps)
> > [  730.534835] uvcvideo: Found a Status endpoint (addr 87).
> > [  730.534836] uvcvideo: Found UVC 1.00 device ezcap U3 capture (1bcf:2c99)
> > [  730.534839] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 3 entity 2
> > [  730.536029] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
> > [  730.536032] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 3 entity 2
> > [  730.537278] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
> > [  730.537281] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/6 to device 3 entity 2
> > [  730.538778] uvcvideo: Adding mapping 'Hue' to control 00000000-0000-0000-0000-000000000101/6.
> > [  730.538781] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 3 entity 2
> > [  730.539779] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
> > [  730.539782] uvcvideo: Scanning UVC chain: OT 5 <- XU 4 <- XU 3 <- PU 2 <- IT 1
> > [  730.539785] uvcvideo: Found a valid video chain (1 -> 5).
> > [  730.552707] input: ezcap U3 capture: ezcap U3 capt as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb2/2-3/2-3:1.0/input/input18
> > [  730.552746] uvcvideo: UVC device initialized.
> > [  730.552778] usbcore: registered new interface driver uvcvideo
> > [  730.552779] USB Video Class driver (1.1.1)
> > [  730.555114] uvcvideo: uvc_v4l2_open
> > [  730.555199] uvcvideo: uvc_v4l2_release
> > [  730.560666] uvcvideo: uvc_v4l2_open
> > [  730.560675] uvcvideo: uvc_v4l2_release
> > [  730.561046] uvcvideo: uvc_v4l2_open
> > [  730.561053] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.561090] uvcvideo: uvc_v4l2_open
> > [  730.561095] uvcvideo: uvc_v4l2_release
> > [  730.561147] uvcvideo: uvc_v4l2_open
> > [  730.561149] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.565780] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.565784] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.570782] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.570802] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.576534] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.582041] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.582065] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.582067] uvcvideo: uvc_v4l2_release
> > [  730.582069] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.582071] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.582073] uvcvideo: uvc_ioctl_queryctrl 1
> > [  730.582075] uvcvideo: uvc_v4l2_release
> > [  732.812026] uvcvideo: Suspending interface 1
> > [  732.812028] uvcvideo: Suspending interface 0
> > [  735.089271] uvcvideo: uvc_v4l2_open
> > [  735.188180] uvcvideo: Resuming interface 0
> > [  735.188182] uvcvideo: Resuming interface 1
> > [  735.188308] uvcvideo: Trying format 0x56595559 (YUYV): 1920x1080.
> > [  735.188309] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> > [  735.205693] uvcvideo: uvc_v4l2_mmap
> > [  735.205798] uvcvideo: uvc_v4l2_mmap
> > [  735.205868] uvcvideo: uvc_v4l2_mmap
> > [  735.205938] uvcvideo: uvc_v4l2_mmap
> > [  735.206007] uvcvideo: uvc_v4l2_mmap
> > [  735.206075] uvcvideo: uvc_v4l2_mmap
> > [  735.206144] uvcvideo: uvc_v4l2_mmap
> > [  735.206213] uvcvideo: uvc_v4l2_mmap
> > [  735.206288] uvcvideo: uvc_ioctl_streamon 1
> > [  735.206289] uvcvideo: uvc_ioctl_streamon 2
> > [  735.208655] uvcvideo: Allocated 5 URB buffers of 16x1024 bytes each.
> > [  735.484187] uvcvideo: Frame complete (EOF found).
> > [  735.484188] uvcvideo: EOF in empty payload.
> > [  735.485645] uvcvideo: frame 1 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 252/255 scr, last pts/stc/sof 1327236385/1331368258/1068
> > [  735.517519] uvcvideo: Frame complete (EOF found).
> > [  735.517520] uvcvideo: EOF in empty payload.
> > [  735.518977] uvcvideo: frame 2 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 254/255 scr, last pts/stc/sof 1331392640/1335530392/1102
> > [  735.550850] uvcvideo: Frame complete (EOF found).
> > [  735.550850] uvcvideo: EOF in empty payload.
> > [  735.552311] uvcvideo: frame 3 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 1335548893/1339676935/1135
> > [  735.584182] uvcvideo: Frame complete (EOF found).
> > [  735.584183] uvcvideo: EOF in empty payload.
> > [  735.585642] uvcvideo: frame 4 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 254/255 scr, last pts/stc/sof 1339705150/1343839068/1168
> > [  735.617515] uvcvideo: Frame complete (EOF found).
> > [  735.617516] uvcvideo: EOF in empty payload.
> > [  735.618973] uvcvideo: frame 5 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 1343861406/1347985615/1202
> > [  735.650846] uvcvideo: Frame complete (EOF found).
> > [  735.650847] uvcvideo: EOF in empty payload.
> > [  735.652307] uvcvideo: frame 6 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 1348017659/1352147749/1235
> > [  735.684178] uvcvideo: Frame complete (EOF found).
> > [  735.684179] uvcvideo: EOF in empty payload.
> > [  735.685639] uvcvideo: frame 7 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 254/255 scr, last pts/stc/sof 1352173915/1356309883/1268
> > [  735.717511] uvcvideo: Frame complete (EOF found).
> > [  735.717512] uvcvideo: EOF in empty payload.
> > [  735.718969] uvcvideo: frame 8 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 1356330172/1360456426/1302
> > [  735.750842] uvcvideo: Frame complete (EOF found).
> > [  735.750843] uvcvideo: EOF in empty payload.
> > [  735.752303] uvcvideo: frame 9 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 1360486426/1364618560/1335
> > [  735.784175] uvcvideo: Frame complete (EOF found).
> > [  735.784175] uvcvideo: EOF in empty payload.
> > [  735.784409] uvcvideo: uvc_ioctl_streamoff 1
> > [  735.787877] uvcvideo: uvc_v4l2_release
> > [  737.804700] uvcvideo: Suspending interface 1
> > [  737.804701] uvcvideo: Suspending interface 0
> > [  759.203616] uvcvideo: uvc_v4l2_open
> > [  759.299952] uvcvideo: Resuming interface 0
> > [  759.299953] uvcvideo: Resuming interface 1
> > [  759.300035] uvcvideo: Trying format 0x56595559 (YUYV): 1920x1080.
> > [  759.300036] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> > [  759.317823] uvcvideo: uvc_v4l2_mmap
> > [  759.317938] uvcvideo: uvc_v4l2_mmap
> > [  759.317998] uvcvideo: uvc_v4l2_mmap
> > [  759.318054] uvcvideo: uvc_v4l2_mmap
> > [  759.318108] uvcvideo: uvc_v4l2_mmap
> > [  759.318163] uvcvideo: uvc_v4l2_mmap
> > [  759.318217] uvcvideo: uvc_v4l2_mmap
> > [  759.318271] uvcvideo: uvc_v4l2_mmap
> > [  759.318331] uvcvideo: uvc_ioctl_streamon 1
> > [  759.318331] uvcvideo: uvc_ioctl_streamon 2
> > [  759.320968] uvcvideo: Allocated 5 URB buffers of 16x1024 bytes each.
> > [  792.216502] uvcvideo: uvc_v4l2_release
> > [  792.216709] xhci_hcd 0000:02:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
> > [  794.720498] uvcvideo: Suspending interface 1
> > [  794.720500] uvcvideo: Suspending interface 0
> > [  806.281910] uvcvideo: uvc_v4l2_open
> > [  806.378953] uvcvideo: Resuming interface 0
> > [  806.378954] uvcvideo: Resuming interface 1
> > [  806.379036] uvcvideo: Trying format 0x56595559 (YUYV): 1920x1080.
> > [  806.379037] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> > [  806.396248] uvcvideo: uvc_v4l2_mmap
> > [  806.396356] uvcvideo: uvc_v4l2_mmap
> > [  806.396427] uvcvideo: uvc_v4l2_mmap
> > [  806.396496] uvcvideo: uvc_v4l2_mmap
> > [  806.396565] uvcvideo: uvc_v4l2_mmap
> > [  806.396634] uvcvideo: uvc_v4l2_mmap
> > [  806.396745] uvcvideo: uvc_v4l2_mmap
> > [  806.396821] uvcvideo: uvc_v4l2_mmap
> > [  806.396896] uvcvideo: uvc_ioctl_streamon 1
> > [  806.396896] uvcvideo: uvc_ioctl_streamon 2
> > [  806.399460] uvcvideo: Allocated 5 URB buffers of 16x1024 bytes each.
> > [  808.585707] uvcvideo: uvc_v4l2_release
> > [  810.589730] uvcvideo: Suspending interface 1
> > [  810.589732] uvcvideo: Suspending interface 0
> >
> > On Fri, Nov 25, 2022 at 4:53 PM Laurent Pinchart wrote:
> >
> >> Hi Amos,
> >>
> >> On Fri, Nov 25, 2022 at 03:11:22AM +0100, Amos Tibaldi wrote:
> >> > Hello, I blacklisted the snd_usb_audio and traced 0xffff uvcvideo.ko. The
> >> > problem has slightly changed. Now the frames are coming but are not shown,
> >> > as you can see from the syslog and dmesg below. Cheese, mpv, vlc, xawtv
> >> > show all black window
> >> >
> >> > tibaldi@ryzen:~/Desktop/src/svl2/SimpleV4L2-SimpleV4L2_v0.2.5/build$ xawtv
> >> > This is xawtv-3.106, running on Linux/x86_64 (5.4.212)
> >> > xinerama 0: 1920x1080+0+0
> >> > vid-open-auto: using grabber/webcam device /dev/video0
> >> > v4l2: oops: select timeout
> >>
> >> [snip]
> >>
> >> > [  686.740627] uvcvideo: Probing generic UVC device 3
> >> > [  686.742123] uvcvideo: Found format MJPEG.
> >> > [  686.742125] uvcvideo: - 1920x1080 (30.0 fps)
> >> > [  686.742126] uvcvideo: - 640x480 (30.0 fps)
> >> > [  686.742127] uvcvideo: - 800x600 (30.0 fps)
> >> > [  686.742128] uvcvideo: - 1024x768 (30.0 fps)
> >> > [  686.742129] uvcvideo: - 1280x720 (30.0 fps)
> >> > [  686.742130] uvcvideo: - 1280x960 (30.0 fps)
> >> > [  686.742130] uvcvideo: - 1280x1024 (30.0 fps)
> >> > [  686.742131] uvcvideo: - 1360x768 (30.0 fps)
> >> > [  686.742132] uvcvideo: - 1400x900 (30.0 fps)
> >> > [  686.742133] uvcvideo: - 1440x900 (30.0 fps)
> >> > [  686.742134] uvcvideo: Found format YUV 4:2:2 (YUYV).
> >> > [  686.742135] uvcvideo: - 1920x1080 (30.0 fps)
> >> > [  686.742135] uvcvideo: - 640x480 (30.0 fps)
> >> > [  686.742136] uvcvideo: - 800x600 (30.0 fps)
> >> > [  686.742137] uvcvideo: - 1024x768 (30.0 fps)
> >> > [  686.742138] uvcvideo: - 1280x720 (30.0 fps)
> >> > [  686.742139] uvcvideo: - 1280x960 (30.0 fps)
> >> > [  686.742140] uvcvideo: - 1280x1024 (30.0 fps)
> >> > [  686.742141] uvcvideo: - 1360x768 (30.0 fps)
> >> > [  686.742141] uvcvideo: - 1400x900 (30.0 fps)
> >> > [  686.742142] uvcvideo: - 1440x900 (30.0 fps)
> >> > [  686.742146] uvcvideo: Found a Status endpoint (addr 87).
> >> > [  686.742147] uvcvideo: Found UVC 1.00 device ezcap U3 capture (1bcf:2c99)
> >> > [  686.742151] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 3 entity 2
> >> > [  686.743061] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
> >> > [  686.743063] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 3 entity 2
> >> > [  686.744306] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
> >> > [  686.744307] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/6 to device 3 entity 2
> >> > [  686.745557] uvcvideo: Adding mapping 'Hue' to control 00000000-0000-0000-0000-000000000101/6.
> >> > [  686.745558] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 3 entity 2
> >> > [  686.746808] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
> >> > [  686.746811] uvcvideo: Scanning UVC chain: OT 5 <- XU 4 <- XU 3 <- PU 2 <- IT 1
> >> > [  686.746814] uvcvideo: Found a valid video chain (1 -> 5).
> >> > [  686.759767] input: ezcap U3 capture: ezcap U3 capt as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb2/2-3/2-3:1.0/input/input20
> >> > [  686.759814] uvcvideo: UVC device initialized.
> >> > [  686.759856] usbcore: registered new interface driver uvcvideo
> >> > [  686.759857] USB Video Class driver (1.1.1)
> >> > [  688.950588] uvcvideo: Suspending interface 1
> >> > [  688.950591] uvcvideo: Suspending interface 0
> >> > [  693.066866] uvcvideo: uvc_v4l2_open
> >> > [  693.164163] uvcvideo: Resuming interface 0
> >> > [  693.164164] uvcvideo: Resuming interface 1
> >> > [  693.164213] uvcvideo: uvc_v4l2_poll
> >> > [  693.164216] uvcvideo: uvc_v4l2_read: not implemented.
> >>
> >> That's an ancient API that the uvcvideo driver doesn't support. xawtv is
> >> likely a bad test application. Let's start simply, could you run
> >>
> >> yavta -f YUYV -s 1920x1080 -c10 /dev/video0
> >>
> >> and provide both the kernel log and the messages output by yavta ?
> >>
> >> > [  693.164220] uvcvideo: uvc_v4l2_poll
> >> > [  693.164221] uvcvideo: uvc_v4l2_read: not implemented.
> >> > [  693.164234] uvcvideo: uvc_v4l2_poll
> >> > [  693.164234] uvcvideo: uvc_v4l2_read: not implemented.
> >> > [  693.164240] uvcvideo: uvc_v4l2_poll
> >> > [  693.164241] uvcvideo: uvc_v4l2_read: not implemented.
> >> > [  693.167317] uvcvideo: uvc_v4l2_poll
> >> > [  693.167320] uvcvideo: uvc_v4l2_read: not implemented.
> >> > [  693.167887] uvcvideo: uvc_v4l2_open
> >> > [  693.167894] uvcvideo: uvc_ioctl_g_input 1
> >> > [  693.167895] uvcvideo: uvc_ioctl_enum_input 1
> >> > [  693.167903] uvcvideo: Trying format 0x32315559 (YU12): 1920x1080.
> >> > [  693.167904] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> >> > [  693.181968] uvcvideo: Trying format 0x32315559 (YU12): 1920x1080.
> >> > [  693.181970] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> >> > [  693.196719] uvcvideo: Trying format 0x32315659 (YV12): 1920x1080.
> >> > [  693.196721] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> >> > [  693.210226] uvcvideo: Trying format 0x50323234 (422P): 1920x1080.
> >> > [  693.210228] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> >> > [  693.224215] uvcvideo: Trying format 0x56595559 (YUYV): 1920x1080.
> >> > [  693.224217] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
> >> > [  693.237715] uvcvideo: uvc_ioctl_g_parm 1
> >> > [  693.251341] uvcvideo: uvc_v4l2_mmap
> >> > [  693.251460] uvcvideo: uvc_v4l2_mmap
> >> > [  693.251536] uvcvideo: uvc_v4l2_mmap
> >> > [  693.251602] uvcvideo: uvc_v4l2_mmap
> >> > [  693.251660] uvcvideo: uvc_v4l2_mmap
> >> > [  693.251715] uvcvideo: uvc_v4l2_mmap
> >> > [  693.251768] uvcvideo: uvc_v4l2_mmap
> >> > [  693.251821] uvcvideo: uvc_v4l2_mmap
> >> > [  693.251873] uvcvideo: uvc_v4l2_mmap
> >> > [  693.251925] uvcvideo: uvc_v4l2_mmap
> >> > [  693.251977] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252030] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252082] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252134] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252185] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252237] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252288] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252340] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252391] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252442] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252494] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252545] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252596] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252648] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252699] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252750] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252801] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252852] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252903] uvcvideo: uvc_v4l2_mmap
> >> > [  693.252954] uvcvideo: uvc_v4l2_mmap
> >> > [  693.253005] uvcvideo: uvc_v4l2_mmap
> >> > [  693.253056] uvcvideo: uvc_v4l2_mmap
> >> > [  693.253126] uvcvideo: uvc_ioctl_streamon 1
> >> > [  693.253126] uvcvideo: uvc_ioctl_streamon 2
> >> > [  693.255834] uvcvideo: Allocated 5 URB buffers of 16x1024 bytes each.
> >> > [  693.528952] uvcvideo: Frame complete (EOF found).
> >> > [  693.528953] uvcvideo: EOF in empty payload.
> >> > [  693.530411] uvcvideo: frame 1 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 532789400/536923291/88
> >> > [  693.562281] uvcvideo: Frame complete (EOF found).
> >> > [  693.562282] uvcvideo: EOF in empty payload.
> >> > [  693.563740] uvcvideo: frame 2 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 536945656/541069838/121
> >> > [  693.595614] uvcvideo: Frame complete (EOF found).
> >> > [  693.595615] uvcvideo: EOF in empty payload.
> >> > [  693.597074] uvcvideo: frame 3 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 541101909/545231972/154
> >> > [  693.628948] uvcvideo: Frame complete (EOF found).
> >> > [  693.628949] uvcvideo: EOF in empty payload.
> >> > [  693.630406] uvcvideo: frame 4 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 254/255 scr, last pts/stc/sof 545258164/549394108/188
> >> > [  693.662279] uvcvideo: Frame complete (EOF found).
> >> > [  693.662280] uvcvideo: EOF in empty payload.
> >> > .......
> >> > [  710.361665] uvcvideo: EOF in empty payload.
> >> > [  710.363124] uvcvideo: frame 506 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 2631698065/2635823538/534
> >> > [  710.394996] uvcvideo: Frame complete (EOF found).
> >> > [  710.394997] uvcvideo: EOF in empty payload.
> >> > [  710.396456] uvcvideo: frame 507 stats: 0/254/255 packets, 0/0/255 pts (!early initial), 253/255 scr, last pts/stc/sof 2635854320/2639985673/567
> >> > [  710.428329] uvcvideo: Frame complete (EOF found).
> >> > [  710.428330] uvcvideo: EOF in empty payload.
> >> > [  710.428407] uvcvideo: uvc_ioctl_streamoff 1
> >> > [  710.432808] uvcvideo: uvc_v4l2_release
> >> > [  710.435191] uvcvideo: uvc_v4l2_release
> >> > [  712.815575] uvcvideo: Suspending interface 1
> >> > [  712.815578] uvcvideo: Suspending interface 0
> >> >
> >> > On Fri, Nov 25, 2022 at 2:32 AM Laurent Pinchart wrote:
> >> >
> >> > > Hi Amos,
> >> > >
> >> > > Could you please avoid dropping the mailing list from CC when replying ?
> >> > >
> >> > > On Wed, Nov 23, 2022 at 09:43:10PM +0100, Amos Tibaldi wrote:
> >> > > > Hello, I attached the dmesg text file of one linux mint 20.1 that I have
> >> > > > just installed. The issue is the same. I hope it helps. Thanks.
> >> > >
> >> > > Quoting the interesting part from the log:
> >> > >
> >> > > > [  823.596518] usb 2-3: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> >> > > > [  823.629237] usb 2-3: New USB device found, idVendor=1bcf, idProduct=2c99, bcdDevice= 2.00
> >> > > > [  823.629239] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> >> > > > [  823.629240] usb 2-3: Product: ezcap U3 capture
> >> > > > [  823.629241] usb 2-3: Manufacturer: VXIS Inc
> >> > >
> >> > > So far so good.
> >> > >
> >> > > > [  823.659423] mc: Linux media interface: v0.10
> >> > > > [  823.667890] videodev: Linux video capture interface: v2.00
> >> > > > [  823.678367] usb 2-3: 3:1: cannot get freq at ep 0x86
> >> > > > [  823.685869] usb 2-3: 3:2: cannot get freq at ep 0x86
> >> > > > [  823.692874] usb 2-3: 3:3: cannot get freq at ep 0x86
> >> > >
> >> > > This I don't like. I've seen many devices having trouble with the audio
> >> > > side, which resulted in different kind of firmware misbehaviours (most
> >> > > likely including crashes) that affected the video side. Could you try to
> >> > > blacklist the snd_usb_audio module to see if it helps ? It can be done
> >> > > by adding
> >> > >
> >> > > blacklist snd_usb_audio
> >> > >
> >> > > to /etc/modprobe.d/blacklist.conf
> >> > >
> >> > > > [  823.738250] usb 2-3: Warning! Unlikely big volume range (=4096), cval->res is probably wrong.
> >> > > > [  823.738252] usb 2-3: [5] FU [Digital In Capture Volume] ch = 1, val = 0/4096/1
> >> > > > [  823.738384] usbcore: registered new interface driver snd-usb-audio
> >> > > > [  823.740047] uvcvideo: Found UVC 1.00 device ezcap U3 capture (1bcf:2c99)
> >> > > > [  823.760905] input: ezcap U3 capture: ezcap U3 capt as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb2/2-3/2-3:1.0/input/input17
> >> > > > [  823.760976] usbcore: registered new interface driver uvcvideo
> >> > > > [  823.760977] USB Video Class driver (1.1.1)
> >> > >
> >> > > Could you start video capture with any application and check if
> >> > > additional messages are then printed in the kernel log ?
> >> > >
> >> > > > On Wed, Nov 23, 2022 at 9:04 PM Laurent Pinchart wrote:
> >> > > >
> >> > > > > Hi Amos,
> >> > > > >
> >> > > > > CC'ing the linux-media mailing list.
> >> > > > >
> >> > > > > On Wed, Nov 23, 2022 at 07:16:05PM +0100, Amos Tibaldi wrote:
> >> > > > > > Hello,
> >> > > > > >    I have a usb framegrabber and it worked fine in ubuntu 20.04 and previous
> >> > > > > > releases of ubuntu with the uvcvideo.ko kernel module but now that I have
> >> > > > > > ubuntu 22.10 the uvcvideo.ko does not work with the ezcap261 framegrabber. The
> >> > > > > > ko is loaded but cheese or xawtv or vlc go on timeout when issuing video
> >> > > > > > acquisition, and the select returns wrong argument. I have also updated the
> >> > > > > > firmware of the framegrabber. What can I do?
> >> > > > >
> >> > > > > Could you please send a copy of the kernel log, in text form ? You can
> >> > > > > retrieve it with `dmesg` or `sudo dmesg`. I'm particularly interested in
> >> > > > > messages printed when the device is plugged in, or when an application
> >> > > > > attempts to use it.

-- 
Regards,

Laurent Pinchart
