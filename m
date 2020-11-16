Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114932B3F00
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 09:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgKPIp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 03:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgKPIp2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 03:45:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C4FC0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 00:45:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F1A5A1B;
        Mon, 16 Nov 2020 09:45:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605516325;
        bh=kWOMPNv+A1DK7+Q0qmZe26ymnbEOlaae7P+ExgE/7oI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j+N/FP7pDQQNiKRmsNzDF0aL9dQsK2GYy1NRX71W0vJysnpt4rHngzT/Q5qQfDPjF
         4pZfKLaGF32bzT0pfulkCReqJ08/PMrySyQAow8JxVWFyPocKRNIolsNXuW46MRUkM
         ihjhvc8cYC4gDDJAgJ6jJxZY2RlntivDy+shim+w=
Date:   Mon, 16 Nov 2020 10:45:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Gregor Hlawacek <g.hlawacek@hzdr.de>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: Philips Monitor with webcam
Message-ID: <20201116084519.GA3892@pendragon.ideasonboard.com>
References: <59f848e83354ad72c11dacaf571f20a8084baf58.camel@hzdr.de>
 <20201104174554.4bbec36a@coco.lan>
 <b8fcc03ed79873f9e55ab394b4b95140ab8b215b.camel@hzdr.de>
 <20201104210155.353a0d6a@coco.lan>
 <40a643d5fd9b6dd387d9cbde3e5ba1796b282f6a.camel@hzdr.de>
 <20201104221148.4d5c644d@coco.lan>
 <20201104212454.GF29958@pendragon.ideasonboard.com>
 <73b62785d882113351d0e69e3b552f0f271e4f2d.camel@hzdr.de>
 <20201105091905.GD3988@pendragon.ideasonboard.com>
 <0575b7608e42ef4ffd4964cd2fa19d9d128a90d2.camel@hzdr.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0575b7608e42ef4ffd4964cd2fa19d9d128a90d2.camel@hzdr.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

On Sat, Nov 07, 2020 at 05:23:39PM +0100, Gregor Hlawacek wrote:
> On Thu, 2020-11-05 at 11:19 +0200, Laurent Pinchart wrote:
> > Hi Gregor,
> > 
> > On Thu, Nov 05, 2020 at 08:41:27AM +0100, Gregor Hlawacek wrote:
> > 
> > [snip]
> > 
> > > Hi Mauro and Laurent
> > > 
> > > @Mauro:
> > > 
> > > I think there is a confusion, which might be my fault as I talked about
> > > a chicony cam in the external monitor. The chicony cam that shows up as
> > > video0/1 is my internal laptop camera which is working fine. The
> > > problematic one is the sunplusIT camera which has a chicony usb
> > > identifier (0412). This is connected to video2-5 and also the one
> > > for
> > > which I reported the above information.
> > > 
> > > @Laurent:
> > > 
> > > lsusb -v -d 0412:612b:
> > 
> > [snip]
> > 
> > Thank for the information. Nothing strikes me as weird. Could you
> > 
> > - Set the uvcvideo trace parameter to 0xffff:
> > 
> >   sudo echo 0xffff > /sys/module/uvcvideo/parameters/trace
> > 
> > - Unplug and replug the monitor
> > - Open the video devices in turn with v4l2-ctl (use the video device
> >   nodes /dev/video* directly, not the by-id links)
> > - Send send the output of 'sudo dmesg'
> > 
> > You can clear the kernel log with 'sudo dmesg -c' before doing so to
> > avoid including unrelated data (or just strip it from the dmesg
> > output manually when copying it to an e-mail).
> 
> Hi Laurent
> 
> sorry for the delay but I had to many other things going on during the
> end of this week. Here is the output attached.
> 
> Have a nice weekend
> 
> [33660.481848] usb 3-1: USB disconnect, device number 2
> [33660.481849] usb 3-1.1: USB disconnect, device number 3
> [33660.481851] usb 3-1.1.1: USB disconnect, device number 4
> [33660.481851] usb 3-1.1.1.1: USB disconnect, device number 6
> [33660.484576] usb 3-1.1.1.2: USB disconnect, device number 7
> [33660.549398] xhci_hcd 0000:3c:00.0: xHCI host controller not responding, assume dead
> [33660.549413] xhci_hcd 0000:3c:00.0: HC died; cleaning up
> [33660.549431] r8152 4-1.1.2:1.0 enp60s0u1u1u2: Stop submitting intr, status -108
> [33660.549508] usb 4-1: USB disconnect, device number 2
> [33660.549510] usb 4-1.1: USB disconnect, device number 3
> [33660.549512] usb 4-1.1.1: USB disconnect, device number 4
> [33660.550559] usb 4-1.1.2: USB disconnect, device number 5
> [33660.572578] xhci_hcd 0000:3c:00.0: remove, state 1
> [33660.572582] usb usb4: USB disconnect, device number 1
> [33660.597015] xhci_hcd 0000:3c:00.0: USB bus 4 deregistered
> [33660.597022] xhci_hcd 0000:3c:00.0: remove, state 1
> [33660.597027] usb usb3: USB disconnect, device number 1
> [33660.598130] uvcvideo: uvc_v4l2_open
> [33660.603339] usb 3-1.1.3: USB disconnect, device number 5
> [33660.709741] uvcvideo: Resuming interface 0
> [33660.709743] uvcvideo: Resuming interface 1
> [33660.709837] uvcvideo: uvc_v4l2_release
> [33660.710050] uvcvideo: uvc_v4l2_open
> [33660.710104] uvcvideo: uvc_v4l2_release
> [33660.711395] uvcvideo: uvc_v4l2_open
> [33660.711449] uvcvideo: uvc_v4l2_release
> [33660.746041] xhci_hcd 0000:3c:00.0: Host halt failed, -19
> [33660.746047] xhci_hcd 0000:3c:00.0: Host not accessible, reset failed.
> [33660.746484] xhci_hcd 0000:3c:00.0: USB bus 3 deregistered
> [33660.765730] uvcvideo: uvc_v4l2_open
> [33660.765969] uvcvideo: uvc_v4l2_release
> [33660.785299] uvcvideo: uvc_v4l2_open
> [33660.787265] uvcvideo: uvc_v4l2_release
> [33660.976605] pci_bus 0000:05: Allocating resources
> [33660.976635] pcieport 0000:05:01.0: bridge window [io  0x1000-0x0fff] to [bus 07-3b] add_size 1000
> [33660.976642] pcieport 0000:05:02.0: bridge window [io  0x1000-0x0fff] to [bus 3c] add_size 1000
> [33660.976649] pcieport 0000:05:02.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 3c] add_size 200000 add_align 100000
> [33660.976656] pcieport 0000:04:00.0: bridge window [io  0x1000-0x0fff] to [bus 05-3c] add_size 3000
> [33660.976666] pcieport 0000:04:00.0: BAR 13: no space for [io  size 0x3000]
> [33660.976671] pcieport 0000:04:00.0: BAR 13: failed to assign [io  size 0x3000]
> [33660.976677] pcieport 0000:04:00.0: BAR 13: no space for [io  size 0x3000]
> [33660.976682] pcieport 0000:04:00.0: BAR 13: failed to assign [io  size 0x3000]
> [33660.976696] pcieport 0000:05:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
> [33660.976700] pcieport 0000:05:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
> [33660.976705] pcieport 0000:05:01.0: BAR 13: no space for [io  size 0x1000]
> [33660.976711] pcieport 0000:05:01.0: BAR 13: failed to assign [io  size 0x1000]
> [33660.976716] pcieport 0000:05:02.0: BAR 13: no space for [io  size 0x1000]
> [33660.976720] pcieport 0000:05:02.0: BAR 13: failed to assign [io  size 0x1000]
> [33660.976730] pcieport 0000:05:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
> [33660.976734] pcieport 0000:05:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
> [33660.976739] pcieport 0000:05:02.0: BAR 13: no space for [io  size 0x1000]
> [33660.976744] pcieport 0000:05:02.0: BAR 13: failed to assign [io  size 0x1000]
> [33660.976748] pcieport 0000:05:01.0: BAR 13: no space for [io  size 0x1000]
> [33660.976753] pcieport 0000:05:01.0: BAR 13: failed to assign [io  size 0x1000]
> [33663.292784] uvcvideo: Suspending interface 1
> [33663.292787] uvcvideo: Suspending interface 0
> [33665.695288] pcieport 0000:05:00.0: can't change power state from D3cold to D0 (config space inaccessible)
> [33665.695971] pci_bus 0000:06: busn_res: [bus 06] is released
> [33665.696182] pci_bus 0000:07: busn_res: [bus 07-3b] is released
> [33665.696329] pci_bus 0000:3c: busn_res: [bus 3c] is released
> [33665.701153] pci_bus 0000:05: busn_res: [bus 05-3c] is released

I assume all this corresponds to unplugging the monitor. Is it connected
over a thunderbolt 3 (PCIe and DP over a USB type C donnector) ?

> [33667.950096] wlp61s0: authenticate with f0:b0:14:99:cd:fc
> [33667.960464] wlp61s0: send auth to f0:b0:14:99:cd:fc (try 1/3)
> [33667.971065] wlp61s0: authenticated
> [33667.972706] wlp61s0: associate with f0:b0:14:99:cd:fc (try 1/3)
> [33667.975090] wlp61s0: RX AssocResp from f0:b0:14:99:cd:fc (capab=0x1511 status=0 aid=3)
> [33667.977717] wlp61s0: associated
> [33668.004909] wlp61s0: Limiting TX power to 27 (30 - 3) dBm as advertised by f0:b0:14:99:cd:fc
> [33668.004996] IPv6: ADDRCONF(NETDEV_CHANGE): wlp61s0: link becomes ready

This is unrelated.

I assume that you've replugged the monitor at this point.

> [33675.939837] pci 0000:04:00.0: [8086:15c0] type 01 class 0x060400
> [33675.939900] pci 0000:04:00.0: enabling Extended Tags
> [33675.940013] pci 0000:04:00.0: supports D1 D2
> [33675.940015] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [33675.940292] pci 0000:05:00.0: [8086:15c0] type 01 class 0x060400
> [33675.940343] pci 0000:05:00.0: enabling Extended Tags
> [33675.940426] pci 0000:05:00.0: supports D1 D2
> [33675.940426] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [33675.940546] pci 0000:05:01.0: [8086:15c0] type 01 class 0x060400
> [33675.940597] pci 0000:05:01.0: enabling Extended Tags
> [33675.940678] pci 0000:05:01.0: supports D1 D2
> [33675.940679] pci 0000:05:01.0: PME# supported from D0 D1 D2 D3hot D3cold
> [33675.940802] pci 0000:05:02.0: [8086:15c0] type 01 class 0x060400
> [33675.940854] pci 0000:05:02.0: enabling Extended Tags
> [33675.940938] pci 0000:05:02.0: supports D1 D2
> [33675.940939] pci 0000:05:02.0: PME# supported from D0 D1 D2 D3hot D3cold
> [33675.941100] pci 0000:04:00.0: PCI bridge to [bus 05-3c]
> [33675.941108] pci 0000:04:00.0:   bridge window [mem 0xc4000000-0xda0fffff]
> [33675.941114] pci 0000:04:00.0:   bridge window [mem 0xa0000000-0xc1ffffff 64bit pref]
> [33675.941161] pci 0000:05:00.0: PCI bridge to [bus 06]
> [33675.941168] pci 0000:05:00.0:   bridge window [mem 0xda000000-0xda0fffff]
> [33675.941212] pci 0000:05:01.0: PCI bridge to [bus 07-3b]
> [33675.941220] pci 0000:05:01.0:   bridge window [mem 0xc4000000-0xd9efffff]
> [33675.941225] pci 0000:05:01.0:   bridge window [mem 0xa0000000-0xc1ffffff 64bit pref]
> [33675.941307] pci 0000:3c:00.0: [8086:15c1] type 00 class 0x0c0330
> [33675.941329] pci 0000:3c:00.0: reg 0x10: [mem 0xd9f00000-0xd9f0ffff]
> [33675.941404] pci 0000:3c:00.0: enabling Extended Tags
> [33675.941517] pci 0000:3c:00.0: supports D1 D2
> [33675.941518] pci 0000:3c:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [33675.941607] pci 0000:3c:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:05:02.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
> [33675.941745] pci 0000:05:02.0: PCI bridge to [bus 3c]
> [33675.941754] pci 0000:05:02.0:   bridge window [mem 0xd9f00000-0xd9ffffff]
> [33675.941782] pci_bus 0000:05: Allocating resources
> [33675.941797] pci 0000:05:01.0: bridge window [io  0x1000-0x0fff] to [bus 07-3b] add_size 1000
> [33675.941799] pci 0000:05:02.0: bridge window [io  0x1000-0x0fff] to [bus 3c] add_size 1000
> [33675.941800] pci 0000:05:02.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 3c] add_size 200000 add_align 100000
> [33675.941802] pci 0000:04:00.0: bridge window [io  0x1000-0x0fff] to [bus 05-3c] add_size 3000
> [33675.941805] pci 0000:04:00.0: BAR 13: no space for [io  size 0x3000]
> [33675.941806] pci 0000:04:00.0: BAR 13: failed to assign [io  size 0x3000]
> [33675.941808] pci 0000:04:00.0: BAR 13: no space for [io  size 0x3000]
> [33675.941809] pci 0000:04:00.0: BAR 13: failed to assign [io  size 0x3000]
> [33675.941812] pci 0000:05:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
> [33675.941813] pci 0000:05:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
> [33675.941814] pci 0000:05:01.0: BAR 13: no space for [io  size 0x1000]
> [33675.941815] pci 0000:05:01.0: BAR 13: failed to assign [io  size 0x1000]
> [33675.941815] pci 0000:05:02.0: BAR 13: no space for [io  size 0x1000]
> [33675.941816] pci 0000:05:02.0: BAR 13: failed to assign [io  size 0x1000]
> [33675.941819] pci 0000:05:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
> [33675.941819] pci 0000:05:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
> [33675.941820] pci 0000:05:02.0: BAR 13: no space for [io  size 0x1000]
> [33675.941821] pci 0000:05:02.0: BAR 13: failed to assign [io  size 0x1000]
> [33675.941822] pci 0000:05:01.0: BAR 13: no space for [io  size 0x1000]
> [33675.941822] pci 0000:05:01.0: BAR 13: failed to assign [io  size 0x1000]
> [33675.941825] pci 0000:05:00.0: PCI bridge to [bus 06]
> [33675.941832] pci 0000:05:00.0:   bridge window [mem 0xda000000-0xda0fffff]
> [33675.941840] pci 0000:05:01.0: PCI bridge to [bus 07-3b]
> [33675.941844] pci 0000:05:01.0:   bridge window [mem 0xc4000000-0xd9efffff]
> [33675.941847] pci 0000:05:01.0:   bridge window [mem 0xa0000000-0xc1ffffff 64bit pref]
> [33675.941852] pci 0000:05:02.0: PCI bridge to [bus 3c]
> [33675.941856] pci 0000:05:02.0:   bridge window [mem 0xd9f00000-0xd9ffffff]
> [33675.941864] pci 0000:04:00.0: PCI bridge to [bus 05-3c]
> [33675.941868] pci 0000:04:00.0:   bridge window [mem 0xc4000000-0xda0fffff]
> [33675.941871] pci 0000:04:00.0:   bridge window [mem 0xa0000000-0xc1ffffff 64bit pref]
> [33675.943143] xhci_hcd 0000:3c:00.0: xHCI Host Controller
> [33675.943149] xhci_hcd 0000:3c:00.0: new USB bus registered, assigned bus number 3
> [33675.944287] xhci_hcd 0000:3c:00.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000000009810
> [33675.944513] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.09
> [33675.944514] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [33675.944516] usb usb3: Product: xHCI Host Controller
> [33675.944517] usb usb3: Manufacturer: Linux 5.9.4-arch1-1 xhci-hcd
> [33675.944518] usb usb3: SerialNumber: 0000:3c:00.0
> [33675.944681] hub 3-0:1.0: USB hub found
> [33675.944691] hub 3-0:1.0: 2 ports detected
> [33675.945358] xhci_hcd 0000:3c:00.0: xHCI Host Controller
> [33675.945362] xhci_hcd 0000:3c:00.0: new USB bus registered, assigned bus number 4
> [33675.945366] xhci_hcd 0000:3c:00.0: Host supports USB 3.1 Enhanced SuperSpeed
> [33675.945405] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.09
> [33675.945407] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [33675.945408] usb usb4: Product: xHCI Host Controller
> [33675.945410] usb usb4: Manufacturer: Linux 5.9.4-arch1-1 xhci-hcd
> [33675.945411] usb usb4: SerialNumber: 0000:3c:00.0
> [33675.945533] hub 4-0:1.0: USB hub found
> [33675.945541] hub 4-0:1.0: 2 ports detected

Two XHCI (USB 3) controllers seem to be present in your monitor, they're
assigned buses 3 and 4.

> [33676.272630] usb 3-1: new high-speed USB device number 2 using xhci_hcd
> [33676.415928] usb 3-1: New USB device found, idVendor=0bda, idProduct=5420, bcdDevice= 1.30
> [33676.415929] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [33676.415930] usb 3-1: Product: 4-Port USB 2.0 Hub
> [33676.415931] usb 3-1: Manufacturer: Generic
> [33676.416882] hub 3-1:1.0: USB hub found
> [33676.417126] hub 3-1:1.0: 5 ports detected
> [33676.539368] usb 4-1: new SuperSpeedPlus Gen 2 USB device number 2 using xhci_hcd
> [33676.562679] usb 4-1: New USB device found, idVendor=0bda, idProduct=0420, bcdDevice= 1.30
> [33676.562681] usb 4-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [33676.562682] usb 4-1: Product: 4-Port USB 3.0 Hub
> [33676.562683] usb 4-1: Manufacturer: Generic
> [33676.565072] hub 4-1:1.0: USB hub found
> [33676.565367] hub 4-1:1.0: 4 ports detected

Each of them has a root hub with 5 and 4 ports respectively.

> [33676.699303] usb 3-1.1: new high-speed USB device number 3 using xhci_hcd
> [33676.824290] usb 3-1.1: New USB device found, idVendor=0bda, idProduct=5420, bcdDevice= 1.29
> [33676.824292] usb 3-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [33676.824294] usb 3-1.1: Product: 4-Port USB 2.0 Hub
> [33676.824294] usb 3-1.1: Manufacturer: Generic
> [33676.826109] hub 3-1.1:1.0: USB hub found
> [33676.827260] hub 3-1.1:1.0: 4 ports detected
> [33676.889920] usb 4-1.1: new SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd
> [33676.921137] usb 4-1.1: New USB device found, idVendor=0bda, idProduct=0420, bcdDevice= 1.29
> [33676.921139] usb 4-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [33676.921140] usb 4-1.1: Product: 4-Port USB 3.0 Hub
> [33676.921141] usb 4-1.1: Manufacturer: Generic
> [33676.929999] hub 4-1.1:1.0: USB hub found
> [33676.931410] hub 4-1.1:1.0: 4 ports detected

On port 1 of each root hub there's a USB 2.0 hub with 4 ports.

> [33677.109278] usb 3-1.1.1: new high-speed USB device number 4 using xhci_hcd
> [33677.234131] usb 3-1.1.1: New USB device found, idVendor=0bda, idProduct=5412, bcdDevice= 1.20
> [33677.234133] usb 3-1.1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [33677.234134] usb 3-1.1.1: Product: 2-Port USB 2.1 Hub
> [33677.234135] usb 3-1.1.1: Manufacturer: Generic
> [33677.235575] hub 3-1.1.1:1.0: USB hub found
> [33677.237584] hub 3-1.1.1:1.0: 2 ports detected
> [33677.299864] usb 4-1.1.1: new SuperSpeed Gen 1 USB device number 4 using xhci_hcd
> [33677.330281] usb 4-1.1.1: New USB device found, idVendor=0bda, idProduct=0412, bcdDevice= 1.20
> [33677.330283] usb 4-1.1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [33677.330284] usb 4-1.1.1: Product: 4-Port USB 3.1 Hub
> [33677.330286] usb 4-1.1.1: Manufacturer: Generic
> [33677.339379] hub 4-1.1.1:1.0: USB hub found
> [33677.341114] hub 4-1.1.1:1.0: 2 ports detected

And on port 1 of each of the USB 2.0 hubs there's a USB 2.1 hub with two
ports. The topology is getting a bit complicated.

> [33677.395926] usb 3-1.1.3: new full-speed USB device number 5 using xhci_hcd
> [33677.487520] usb 3-1.1.3: New USB device found, idVendor=046a, idProduct=00b0, bcdDevice= 1.01
> [33677.487522] usb 3-1.1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [33677.487523] usb 3-1.1.3: Product: Mechanical Keyboard
> [33677.487524] usb 3-1.1.3: Manufacturer: CHERRY
> [33677.494244] input: CHERRY Mechanical Keyboard as /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:00.0/usb3/3-1/3-1.1/3-1.1.3/3-1.1.3:1.0/0003:046A:00B0.000A/input/input43
> [33677.549426] hid-generic 0003:046A:00B0.000A: input,hidraw1: USB HID v1.11 Keyboard [CHERRY Mechanical Keyboard] on usb-0000:3c:00.0-1.1.3/input0
> [33677.550173] input: CHERRY Mechanical Keyboard as /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:00.0/usb3/3-1/3-1.1/3-1.1.3/3-1.1.3:1.1/0003:046A:00B0.000B/input/input44

On port 3 of the USB 2.0 hub for bus 3 there's a keyboard.

> [33677.559243] usb 3-1.1.1.1: new high-speed USB device number 6 using xhci_hcd
> [33677.606030] hid-generic 0003:046A:00B0.000B: input,hidraw2: USB HID v1.11 Device [CHERRY Mechanical Keyboard] on usb-0000:3c:00.0-1.1.3/input1
> [33677.848662] usb 3-1.1.1.1: New USB device found, idVendor=0bda, idProduct=48a5, bcdDevice= 0.01
> [33677.848663] usb 3-1.1.1.1: New USB device strings: Mfr=3, Product=1, SerialNumber=2
> [33677.848664] usb 3-1.1.1.1: Product: USB Audio
> [33677.848665] usb 3-1.1.1.1: Manufacturer: Generic
> [33677.848666] usb 3-1.1.1.1: SerialNumber: 201405280001

On port 1 of the USB 2.1 hub for bus 3 there's an audio device.

> [33677.969289] usb 3-1.1.1.2: new high-speed USB device number 7 using xhci_hcd
> [33678.134841] usb 3-1.1.1.2: New USB device found, idVendor=04f2, idProduct=b612, bcdDevice= 2.10
> [33678.134843] usb 3-1.1.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [33678.134844] usb 3-1.1.1.2: Product: USB2.0 FHD UVC WebCam
> [33678.134844] usb 3-1.1.1.2: Manufacturer: SunplusIT Inc
> [33678.134845] usb 3-1.1.1.2: SerialNumber: 01.00.00

And on port 2 of the same hub there's your webcam.

> [33678.145922] uvcvideo: Probing generic UVC device 1.1.1.2
> [33678.149746] uvcvideo: Found format MJPEG.
> [33678.149748] uvcvideo: - 640x480 (30.0 fps)
> [33678.149749] uvcvideo: - 1920x1080 (30.0 fps)
> [33678.149750] uvcvideo: - 1280x720 (30.0 fps)
> [33678.149750] uvcvideo: - 640x360 (30.0 fps)
> [33678.149751] uvcvideo: - 352x288 (30.0 fps)
> [33678.149752] uvcvideo: - 320x240 (30.0 fps)
> [33678.149753] uvcvideo: - 176x144 (30.0 fps)
> [33678.149754] uvcvideo: Found format YUV 4:2:2 (YUYV).
> [33678.149754] uvcvideo: - 640x480 (30.0 fps)
> [33678.149755] uvcvideo: - 640x360 (30.0 fps)
> [33678.149755] uvcvideo: - 352x288 (30.0 fps)
> [33678.149756] uvcvideo: - 320x240 (30.0 fps)
> [33678.149756] uvcvideo: - 176x144 (30.0 fps)
> [33678.149759] uvcvideo: Found a Status endpoint (addr 87).
> [33678.149760] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC WebCam (04f2:b612)
> [33678.153431] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1.1.1.2 entity 1
> [33678.153434] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
> [33678.157171] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/4 to device 1.1.1.2 entity 1
> [33678.157175] uvcvideo: Adding mapping 'Exposure (Absolute)' to control 00000000-0000-0000-0000-000000000001/4.
> [33678.160954] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1.1.1.2 entity 2
> [33678.160956] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
> [33678.164794] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1.1.1.2 entity 2
> [33678.164797] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
> [33678.168589] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/6 to device 1.1.1.2 entity 2
> [33678.168590] uvcvideo: Adding mapping 'Hue' to control 00000000-0000-0000-0000-000000000101/6.
> [33678.172374] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1.1.1.2 entity 2
> [33678.172376] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
> [33678.176233] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1.1.1.2 entity 2
> [33678.176236] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
> [33678.179988] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/9 to device 1.1.1.2 entity 2
> [33678.179990] uvcvideo: Adding mapping 'Gamma' to control 00000000-0000-0000-0000-000000000101/9.
> [33678.183820] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1.1.1.2 entity 2
> [33678.183822] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
> [33678.187612] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/1 to device 1.1.1.2 entity 2
> [33678.187614] uvcvideo: Adding mapping 'Backlight Compensation' to control 00000000-0000-0000-0000-000000000101/1.
> [33678.191115] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1.1.1.2 entity 2
> [33678.191118] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
> [33678.194955] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1.1.1.2 entity 2
> [33678.194959] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
> [33678.194963] uvcvideo: Scanning UVC chain: OT 5 <- XU 4 <- XU 3 <- PU 2 <- IT 1
> [33678.194966] uvcvideo: Found a valid video chain (1 -> 5).
> [33678.212183] input: USB2.0 FHD UVC WebCam: USB2.0 F as /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:00.0/usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.0/input/input45
> [33678.212283] uvcvideo: UVC device initialized.
> [33678.216492] uvcvideo: Probing generic UVC device 1.1.1.2
> [33678.220254] uvcvideo: Found format IR 8-bit (L8_IR).
> [33678.220256] uvcvideo: - 352x352 (30.0 fps)
> [33678.220260] uvcvideo: Found a Status endpoint (addr 84).
> [33678.220261] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC WebCam (04f2:b612)
> [33678.220264] uvcvideo: Scanning UVC chain: OT 5 <- XU 4 <- XU 7 <- PU 2 <- IT 1
> [33678.220267] uvcvideo: Found a valid video chain (1 -> 5).
> [33678.237583] input: USB2.0 FHD UVC WebCam: IR Camer as /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:00.0/usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.2/input/input46
> [33678.237667] uvcvideo: UVC device initialized.
> [33678.329348] usb 4-1.1.2: new SuperSpeed Gen 1 USB device number 5 using xhci_hcd
> [33678.346494] usb 4-1.1.2: New USB device found, idVendor=0bda, idProduct=8153, bcdDevice=31.00
> [33678.346497] usb 4-1.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=6
> [33678.346498] usb 4-1.1.2: Product: USB 10/100/1000 LAN
> [33678.346500] usb 4-1.1.2: Manufacturer: Realtek
> [33678.346501] usb 4-1.1.2: SerialNumber: 000000000000
> [33678.426195] usb 4-1.1.2: reset SuperSpeed Gen 1 USB device number 5 using xhci_hcd
> [33678.489706] r8152 4-1.1.2:1.0 eth0: v2.14.0 (2020/09/24)
> [33678.489708] r8152 4-1.1.2:1.0 eth0: This product is covered by one or more of the following patents:
>                		US6,570,884, US6,115,776, and US6,327,625.
> 
> [33678.632895] usb 4-1.1.2: reset SuperSpeed Gen 1 USB device number 5 using xhci_hcd
> [33678.698562] r8152 4-1.1.2:1.0 eth0: v2.14.0 (2020/09/24)
> [33678.698565] r8152 4-1.1.2:1.0 eth0: This product is covered by one or more of the following patents:
>                		US6,570,884, US6,115,776, and US6,327,625.
> 
> [33678.969798] r8152 4-1.1.2:1.0 enp60s0u1u1u2: renamed from eth0

Then on bus 4 there's a network controller (the patents information
really don't belong to the kernel... I wonder where those messages come
from though, I can't find them in the kernel sources).

> [33679.516896] uvcvideo: uvc_v4l2_open
> [33679.516929] uvcvideo: uvc_v4l2_release
> [33679.534194] uvcvideo: uvc_v4l2_open
> [33679.534210] uvcvideo: uvc_v4l2_release
> [33679.535192] uvcvideo: uvc_v4l2_open
> [33679.535293] uvcvideo: uvc_v4l2_release
> [33679.535393] uvcvideo: uvc_v4l2_open
> [33679.535407] uvcvideo: Control 0x00980900 not found.
> [33679.535411] uvcvideo: Control 0x00980901 not found.
> [33679.535414] uvcvideo: Control 0x00980902 not found.
> [33679.535416] uvcvideo: Control 0x00980903 not found.
> [33679.535419] uvcvideo: Control 0x00980904 not found.
> [33679.535421] uvcvideo: Control 0x00980905 not found.
> [33679.535424] uvcvideo: Control 0x00980906 not found.
> [33679.535427] uvcvideo: Control 0x00980907 not found.
> [33679.535429] uvcvideo: Control 0x00980908 not found.
> [33679.535432] uvcvideo: Control 0x00980909 not found.
> [33679.535434] uvcvideo: Control 0x0098090a not found.
> [33679.535437] uvcvideo: Control 0x0098090b not found.
> [33679.535440] uvcvideo: Control 0x0098090c not found.
> [33679.535442] uvcvideo: Control 0x0098090d not found.
> [33679.535445] uvcvideo: Control 0x0098090e not found.
> [33679.535448] uvcvideo: Control 0x0098090f not found.
> [33679.535450] uvcvideo: Control 0x00980910 not found.
> [33679.535453] uvcvideo: Control 0x00980911 not found.
> [33679.535456] uvcvideo: Control 0x00980912 not found.
> [33679.535458] uvcvideo: Control 0x00980913 not found.
> [33679.535461] uvcvideo: Control 0x00980914 not found.
> [33679.535463] uvcvideo: Control 0x00980915 not found.
> [33679.535466] uvcvideo: Control 0x00980916 not found.
> [33679.535469] uvcvideo: Control 0x00980917 not found.
> [33679.535472] uvcvideo: Control 0x00980918 not found.
> [33679.535475] uvcvideo: Control 0x00980919 not found.
> [33679.535477] uvcvideo: Control 0x0098091a not found.
> [33679.535480] uvcvideo: Control 0x0098091b not found.
> [33679.535483] uvcvideo: Control 0x0098091c not found.
> [33679.535485] uvcvideo: Control 0x0098091d not found.
> [33679.535488] uvcvideo: Control 0x0098091e not found.
> [33679.535491] uvcvideo: Control 0x0098091f not found.
> [33679.535493] uvcvideo: Control 0x00980920 not found.
> [33679.535496] uvcvideo: Control 0x00980921 not found.
> [33679.535499] uvcvideo: Control 0x00980922 not found.
> [33679.535501] uvcvideo: Control 0x00980923 not found.
> [33679.535504] uvcvideo: Control 0x00980924 not found.
> [33679.535507] uvcvideo: Control 0x00980925 not found.
> [33679.535509] uvcvideo: Control 0x00980926 not found.
> [33679.535511] uvcvideo: uvc_v4l2_open
> [33679.535512] uvcvideo: Control 0x00980927 not found.
> [33679.535515] uvcvideo: Control 0x00980928 not found.
> [33679.535517] uvcvideo: Control 0x00980929 not found.
> [33679.535520] uvcvideo: Control 0x0098092a not found.
> [33679.535523] uvcvideo: Control 0x00980900 not found.
> [33679.535524] uvcvideo: Control 0x08000000 not found.
> [33679.535527] uvcvideo: Control 0x00980901 not found.
> [33679.535528] uvcvideo: uvc_v4l2_release
> [33679.535532] uvcvideo: Control 0x00980902 not found.
> [33679.535536] uvcvideo: Control 0x00980903 not found.
> [33679.535540] uvcvideo: Control 0x00980904 not found.
> [33679.535540] uvcvideo: uvc_v4l2_open
> [33679.535544] uvcvideo: Control 0x00980905 not found.
> [33679.535548] uvcvideo: Control 0x00980906 not found.
> [33679.535550] uvcvideo: uvc_v4l2_release
> [33679.535552] uvcvideo: Control 0x00980907 not found.
> [33679.535556] uvcvideo: Control 0x00980908 not found.
> [33679.535560] uvcvideo: Control 0x00980909 not found.
> [33679.535564] uvcvideo: Control 0x0098090a not found.
> [33679.535568] uvcvideo: Control 0x0098090b not found.
> [33679.535571] uvcvideo: Control 0x0098090c not found.
> [33679.535575] uvcvideo: Control 0x0098090d not found.
> [33679.535579] uvcvideo: Control 0x0098090e not found.
> [33679.535583] uvcvideo: Control 0x0098090f not found.
> [33679.535587] uvcvideo: Control 0x00980910 not found.
> [33679.535590] uvcvideo: Control 0x00980911 not found.
> [33679.535594] uvcvideo: Control 0x00980912 not found.
> [33679.535598] uvcvideo: Control 0x00980913 not found.
> [33679.535602] uvcvideo: Control 0x00980914 not found.
> [33679.535605] uvcvideo: Control 0x00980915 not found.
> [33679.535609] uvcvideo: Control 0x00980916 not found.
> [33679.535613] uvcvideo: Control 0x00980917 not found.
> [33679.535617] uvcvideo: Control 0x00980918 not found.
> [33679.535620] uvcvideo: Control 0x00980919 not found.
> [33679.535625] uvcvideo: Control 0x0098091a not found.
> [33679.535628] uvcvideo: Control 0x0098091b not found.
> [33679.535632] uvcvideo: Control 0x0098091c not found.
> [33679.535636] uvcvideo: Control 0x0098091d not found.
> [33679.535640] uvcvideo: Control 0x0098091e not found.
> [33679.535644] uvcvideo: Control 0x0098091f not found.
> [33679.535648] uvcvideo: Control 0x00980920 not found.
> [33679.535651] uvcvideo: Control 0x00980921 not found.
> [33679.535655] uvcvideo: Control 0x00980922 not found.
> [33679.535659] uvcvideo: Control 0x00980923 not found.
> [33679.535663] uvcvideo: Control 0x00980924 not found.
> [33679.535666] uvcvideo: Control 0x00980925 not found.
> [33679.535670] uvcvideo: Control 0x00980926 not found.
> [33679.535674] uvcvideo: Control 0x00980927 not found.
> [33679.535678] uvcvideo: Control 0x00980928 not found.
> [33679.535682] uvcvideo: Control 0x00980929 not found.
> [33679.535685] uvcvideo: Control 0x0098092a not found.
> [33679.535689] uvcvideo: Control 0x08000000 not found.
> [33679.535693] uvcvideo: uvc_v4l2_release
> [33679.539084] uvcvideo: uvc_v4l2_open
> [33679.539933] uvcvideo: uvc_v4l2_open
> [33679.541867] uvcvideo: uvc_v4l2_release
> [33679.541979] uvcvideo: uvc_v4l2_open
> [33679.542010] uvcvideo: uvc_v4l2_release
> [33679.542097] uvcvideo: uvc_v4l2_open
> [33679.543598] uvcvideo: uvc_v4l2_open
> [33679.543614] uvcvideo: uvc_v4l2_release
> [33679.543875] uvcvideo: uvc_v4l2_open
> [33679.543886] uvcvideo: Control 0x00980900 not found.
> [33679.543889] uvcvideo: Control 0x00980901 not found.
> [33679.543892] uvcvideo: Control 0x00980902 not found.
> [33679.543895] uvcvideo: Control 0x00980903 not found.
> [33679.543897] uvcvideo: Control 0x00980904 not found.
> [33679.543900] uvcvideo: Control 0x00980905 not found.
> [33679.543903] uvcvideo: Control 0x00980906 not found.
> [33679.543905] uvcvideo: Control 0x00980907 not found.
> [33679.543908] uvcvideo: Control 0x00980908 not found.
> [33679.543911] uvcvideo: Control 0x00980909 not found.
> [33679.543913] uvcvideo: Control 0x0098090a not found.
> [33679.543916] uvcvideo: Control 0x0098090b not found.
> [33679.543919] uvcvideo: Control 0x0098090c not found.
> [33679.543921] uvcvideo: Control 0x0098090d not found.
> [33679.543924] uvcvideo: Control 0x0098090e not found.
> [33679.543927] uvcvideo: Control 0x0098090f not found.
> [33679.543930] uvcvideo: Control 0x00980910 not found.
> [33679.543933] uvcvideo: Control 0x00980911 not found.
> [33679.543935] uvcvideo: Control 0x00980912 not found.
> [33679.543938] uvcvideo: Control 0x00980913 not found.
> [33679.543941] uvcvideo: Control 0x00980914 not found.
> [33679.543943] uvcvideo: Control 0x00980915 not found.
> [33679.543946] uvcvideo: Control 0x00980916 not found.
> [33679.543949] uvcvideo: Control 0x00980917 not found.
> [33679.543951] uvcvideo: Control 0x00980918 not found.
> [33679.543954] uvcvideo: Control 0x00980919 not found.
> [33679.543957] uvcvideo: Control 0x0098091a not found.
> [33679.543959] uvcvideo: Control 0x0098091b not found.
> [33679.543962] uvcvideo: Control 0x0098091c not found.
> [33679.543964] uvcvideo: Control 0x0098091d not found.
> [33679.543967] uvcvideo: Control 0x0098091e not found.
> [33679.543970] uvcvideo: Control 0x0098091f not found.
> [33679.543973] uvcvideo: Control 0x00980920 not found.
> [33679.543975] uvcvideo: Control 0x00980921 not found.
> [33679.543978] uvcvideo: Control 0x00980922 not found.
> [33679.543980] uvcvideo: Control 0x00980923 not found.
> [33679.543983] uvcvideo: Control 0x00980924 not found.
> [33679.543986] uvcvideo: Control 0x00980925 not found.
> [33679.543989] uvcvideo: Control 0x00980926 not found.
> [33679.543991] uvcvideo: Control 0x00980927 not found.
> [33679.543994] uvcvideo: Control 0x00980928 not found.
> [33679.543996] uvcvideo: Control 0x00980929 not found.
> [33679.543999] uvcvideo: Control 0x0098092a not found.
> [33679.544002] uvcvideo: Control 0x08000000 not found.
> [33679.544005] uvcvideo: uvc_v4l2_release
> [33679.544091] uvcvideo: uvc_v4l2_open
> [33679.544100] uvcvideo: uvc_v4l2_release
> [33679.544214] uvcvideo: uvc_v4l2_open
> [33679.557062] uvcvideo: uvc_v4l2_open
> [33679.557076] uvcvideo: uvc_v4l2_release
> [33679.557228] uvcvideo: uvc_v4l2_open
> [33679.557239] uvcvideo: Control 0x00980900 not found.
> [33679.557242] uvcvideo: Control 0x00980901 not found.
> [33679.557246] uvcvideo: Control 0x00980902 not found.
> [33679.557249] uvcvideo: Control 0x00980903 not found.
> [33679.557252] uvcvideo: Control 0x00980904 not found.
> [33679.557255] uvcvideo: Control 0x00980905 not found.
> [33679.557258] uvcvideo: Control 0x00980906 not found.
> [33679.557261] uvcvideo: Control 0x00980907 not found.
> [33679.557263] uvcvideo: Control 0x00980908 not found.
> [33679.557266] uvcvideo: Control 0x00980909 not found.
> [33679.557269] uvcvideo: Control 0x0098090a not found.
> [33679.557272] uvcvideo: Control 0x0098090b not found.
> [33679.557275] uvcvideo: Control 0x0098090c not found.
> [33679.557277] uvcvideo: Control 0x0098090d not found.
> [33679.557280] uvcvideo: Control 0x0098090e not found.
> [33679.557283] uvcvideo: Control 0x0098090f not found.
> [33679.557285] uvcvideo: Control 0x00980910 not found.
> [33679.557288] uvcvideo: Control 0x00980911 not found.
> [33679.557291] uvcvideo: Control 0x00980912 not found.
> [33679.557294] uvcvideo: Control 0x00980913 not found.
> [33679.557297] uvcvideo: Control 0x00980914 not found.
> [33679.557299] uvcvideo: Control 0x00980915 not found.
> [33679.557302] uvcvideo: Control 0x00980916 not found.
> [33679.557305] uvcvideo: Control 0x00980917 not found.
> [33679.557308] uvcvideo: Control 0x00980918 not found.
> [33679.557311] uvcvideo: Control 0x00980919 not found.
> [33679.557313] uvcvideo: Control 0x0098091a not found.
> [33679.557316] uvcvideo: Control 0x0098091b not found.
> [33679.557318] uvcvideo: Control 0x0098091c not found.
> [33679.557321] uvcvideo: Control 0x0098091d not found.
> [33679.557324] uvcvideo: Control 0x0098091e not found.
> [33679.557327] uvcvideo: Control 0x0098091f not found.
> [33679.557331] uvcvideo: Control 0x00980920 not found.
> [33679.557334] uvcvideo: Control 0x00980921 not found.
> [33679.557337] uvcvideo: Control 0x00980922 not found.
> [33679.557340] uvcvideo: Control 0x00980923 not found.
> [33679.557343] uvcvideo: Control 0x00980924 not found.
> [33679.557345] uvcvideo: Control 0x00980925 not found.
> [33679.557348] uvcvideo: Control 0x00980926 not found.
> [33679.557351] uvcvideo: Control 0x00980927 not found.
> [33679.557353] uvcvideo: Control 0x00980928 not found.
> [33679.557356] uvcvideo: Control 0x00980929 not found.
> [33679.557359] uvcvideo: Control 0x0098092a not found.
> [33679.557361] uvcvideo: Control 0x08000000 not found.
> [33679.557364] uvcvideo: uvc_v4l2_release
> [33679.557446] uvcvideo: uvc_v4l2_open
> [33679.557463] uvcvideo: uvc_v4l2_release
> [33679.557547] uvcvideo: uvc_v4l2_open
> [33679.701284] uvcvideo: uvc_v4l2_release
> [33679.701293] uvcvideo: uvc_v4l2_release
> [33679.701305] uvcvideo: uvc_v4l2_open
> [33679.701305] uvcvideo: uvc_v4l2_open
> [33679.701310] uvcvideo: uvc_v4l2_release
> [33679.701326] uvcvideo: uvc_v4l2_release
> [33679.701332] uvcvideo: uvc_v4l2_open
> [33679.701393] uvcvideo: uvc_v4l2_open
> [33679.812706] uvcvideo: Resuming interface 0
> [33679.812708] uvcvideo: Resuming interface 1
> [33679.812745] uvcvideo: uvc_v4l2_release
> [33679.812746] uvcvideo: uvc_v4l2_release
> [33679.812746] uvcvideo: uvc_v4l2_release
> [33679.812747] uvcvideo: uvc_v4l2_release
> [33679.812871] uvcvideo: uvc_v4l2_open
> [33679.812871] uvcvideo: uvc_v4l2_open
> [33679.812872] uvcvideo: uvc_v4l2_open
> [33679.812881] uvcvideo: uvc_v4l2_open
> [33679.812944] uvcvideo: uvc_v4l2_release
> [33679.812945] uvcvideo: uvc_v4l2_release
> [33679.812945] uvcvideo: uvc_v4l2_release
> [33679.812949] uvcvideo: uvc_v4l2_release
> [33679.814214] uvcvideo: uvc_v4l2_open
> [33679.814235] uvcvideo: uvc_v4l2_release
> [33679.815265] uvcvideo: uvc_v4l2_open
> [33679.815289] uvcvideo: uvc_v4l2_release
> [33679.815774] uvcvideo: uvc_v4l2_open
> [33679.815798] uvcvideo: uvc_v4l2_release
> [33679.815888] uvcvideo: uvc_v4l2_open
> [33679.815916] uvcvideo: uvc_v4l2_release
> [33679.816772] uvcvideo: uvc_v4l2_open
> [33679.816783] uvcvideo: uvc_v4l2_release
> [33679.816994] uvcvideo: uvc_v4l2_open
> [33679.817004] uvcvideo: uvc_v4l2_release
> [33679.868762] uvcvideo: uvc_v4l2_open
> [33679.868775] uvcvideo: uvc_v4l2_release
> [33679.868875] uvcvideo: uvc_v4l2_open
> [33679.868985] uvcvideo: uvc_v4l2_release
> [33679.869075] uvcvideo: uvc_v4l2_open
> [33679.869153] uvcvideo: uvc_v4l2_release
> [33679.869244] uvcvideo: uvc_v4l2_open
> [33679.869311] uvcvideo: uvc_v4l2_release
> [33679.869394] uvcvideo: uvc_v4l2_open
> [33679.869442] uvcvideo: uvc_v4l2_release
> [33679.870128] uvcvideo: uvc_v4l2_open
> [33679.870136] uvcvideo: uvc_v4l2_release
> [33679.870237] uvcvideo: uvc_v4l2_open
> [33679.870330] uvcvideo: uvc_v4l2_release
> [33679.870431] uvcvideo: uvc_v4l2_open
> [33679.870502] uvcvideo: uvc_v4l2_release

Userspace looks at the V4L2 devices (I assume this is an automated
process under udev's control, possibly running /lib/udev/v4l_id).

> [33681.724746] IPv6: ADDRCONF(NETDEV_CHANGE): enp60s0u1u1u2: link becomes ready
> [33681.725242] r8152 4-1.1.2:1.0 enp60s0u1u1u2: carrier on
> [33682.312529] uvcvideo: Suspending interface 1
> [33682.312532] uvcvideo: Suspending interface 0
> [33682.369227] uvcvideo: Suspending interface 3
> [33682.369228] uvcvideo: Suspending interface 2
> [33682.369229] uvcvideo: Suspending interface 1
> [33682.369229] uvcvideo: Suspending interface 0

And there the kernel auto-suspends the camera, as it's not in use.

> [33684.020289] wlp61s0: deauthenticating from f0:b0:14:99:cd:fc by local choice (Reason: 3=DEAUTH_LEAVING)
> [33688.189318] usb 3-1.1.1: Failed to suspend device, error -110

However, something goes wrong.

> [33733.405785] uvcvideo: uvc_v4l2_open
> [33733.405906] hub 3-1.1.1:1.0: hub_ext_port_status failed (err = -71)
> [33733.406202] usb 3-1.1.1-port2: cannot disable (err = -71)
> [33733.406391] usb 3-1.1.1-port2: device 3-1.1.1.2 not suspended yet

And when opening the device, an error occurs.

I'm afraid I don't know why the device fails to suspend :-S As a quick
hack, you could try commenting out the call to usb_enable_autosuspend()
in uvc_probe(). If that fixes the issue then we know it's an
auto-suspend problem, and I would then recommend CC'ing the linux-usb
mailing list to get help with that. It may be that the camera is buggy
and doesn't support auto-suspend (in which case we could add a quirk in
the UVC driver - or possibly in the USB subsystem core - to selectively
disable auto-suspend for that model), or there could be a bug somewhere
in the kernel.

> [33739.747081] uvcvideo: uvc_v4l2_open

-- 
Regards,

Laurent Pinchart
