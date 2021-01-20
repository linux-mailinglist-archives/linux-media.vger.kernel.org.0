Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED63E2FD082
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 13:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389892AbhATMj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 07:39:59 -0500
Received: from smtpout2.fz-rossendorf.de ([149.220.4.206]:41192 "EHLO
        smtpout2.fz-rossendorf.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389659AbhATMTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 07:19:32 -0500
X-CheckPoint: {60081FA1-0-73F7816D-D6D7A659}
X-MAIL-CPID: D566FE1DC4D5566BAFCD0DE2BC6B8ECD_11
X-Control-Analysis: str=0001.0A682F27.60081FCB.0007,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from fz-rossendorf.de (mail.casus.science [149.220.4.66])
        by smtpout2.fz-rossendorf.de (Postfix) with ESMTPS id B75254037C;
        Wed, 20 Jan 2021 12:53:04 +0100 (CET)
Received: from [80.137.178.20] (account hlawac90@hzdr.de HELO [192.168.178.61])
  by hzdr.de (CommuniGate Pro SMTP 6.2.15)
  with ESMTPSA id 27065082; Wed, 20 Jan 2021 12:53:04 +0100
Message-ID: <5adc8e43c71d20bf5b7b1b7907c375724457a997.camel@hzdr.de>
Subject: Re: Philips Monitor with webcam
From:   Gregor Hlawacek <g.hlawacek@hzdr.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
Date:   Wed, 20 Jan 2021 12:53:03 +0100
In-Reply-To: <20201116084519.GA3892@pendragon.ideasonboard.com>
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
         <20201116084519.GA3892@pendragon.ideasonboard.com>
Organization: HZDR/FWIZ-N
Content-Type: multipart/signed; micalg="sha-512"; protocol="application/pkcs7-signature";
        boundary="=-wyeb9L9fiCXVPCa5/rwv"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-wyeb9L9fiCXVPCa5/rwv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent and Mauro

Sometime has gone by and I don't know what you have done but one of the
kernel updates has actually resulted in a working camera.=20

thanks

Gregor

On Mon, 2020-11-16 at 10:45 +0200, Laurent Pinchart wrote:
> Hi Gregor,
>=20
> On Sat, Nov 07, 2020 at 05:23:39PM +0100, Gregor Hlawacek wrote:
> > On Thu, 2020-11-05 at 11:19 +0200, Laurent Pinchart wrote:
> > > Hi Gregor,
> > >=20
> > > On Thu, Nov 05, 2020 at 08:41:27AM +0100, Gregor Hlawacek wrote:
> > >=20
> > > [snip]
> > >=20
> > > > Hi Mauro and Laurent
> > > >=20
> > > > @Mauro:
> > > >=20
> > > > I think there is a confusion, which might be my fault as I
> > > > talked about
> > > > a chicony cam in the external monitor. The chicony cam that
> > > > shows up as
> > > > video0/1 is my internal laptop camera which is working fine.
> > > > The
> > > > problematic one is the sunplusIT camera which has a chicony usb
> > > > identifier (0412). This is connected to video2-5 and also the
> > > > one
> > > > for
> > > > which I reported the above information.
> > > >=20
> > > > @Laurent:
> > > >=20
> > > > lsusb -v -d 0412:612b:
> > >=20
> > > [snip]
> > >=20
> > > Thank for the information. Nothing strikes me as weird. Could you
> > >=20
> > > - Set the uvcvideo trace parameter to 0xffff:
> > >=20
> > > =C2=A0 sudo echo 0xffff > /sys/module/uvcvideo/parameters/trace
> > >=20
> > > - Unplug and replug the monitor
> > > - Open the video devices in turn with v4l2-ctl (use the video
> > > device
> > > =C2=A0 nodes /dev/video* directly, not the by-id links)
> > > - Send send the output of 'sudo dmesg'
> > >=20
> > > You can clear the kernel log with 'sudo dmesg -c' before doing so
> > > to
> > > avoid including unrelated data (or just strip it from the dmesg
> > > output manually when copying it to an e-mail).
> >=20
> > Hi Laurent
> >=20
> > sorry for the delay but I had to many other things going on during
> > the
> > end of this week. Here is the output attached.
> >=20
> > Have a nice weekend
> >=20
> > [33660.481848] usb 3-1: USB disconnect, device number 2
> > [33660.481849] usb 3-1.1: USB disconnect, device number 3
> > [33660.481851] usb 3-1.1.1: USB disconnect, device number 4
> > [33660.481851] usb 3-1.1.1.1: USB disconnect, device number 6
> > [33660.484576] usb 3-1.1.1.2: USB disconnect, device number 7
> > [33660.549398] xhci_hcd 0000:3c:00.0: xHCI host controller not
> > responding, assume dead
> > [33660.549413] xhci_hcd 0000:3c:00.0: HC died; cleaning up
> > [33660.549431] r8152 4-1.1.2:1.0 enp60s0u1u1u2: Stop submitting
> > intr, status -108
> > [33660.549508] usb 4-1: USB disconnect, device number 2
> > [33660.549510] usb 4-1.1: USB disconnect, device number 3
> > [33660.549512] usb 4-1.1.1: USB disconnect, device number 4
> > [33660.550559] usb 4-1.1.2: USB disconnect, device number 5
> > [33660.572578] xhci_hcd 0000:3c:00.0: remove, state 1
> > [33660.572582] usb usb4: USB disconnect, device number 1
> > [33660.597015] xhci_hcd 0000:3c:00.0: USB bus 4 deregistered
> > [33660.597022] xhci_hcd 0000:3c:00.0: remove, state 1
> > [33660.597027] usb usb3: USB disconnect, device number 1
> > [33660.598130] uvcvideo: uvc_v4l2_open
> > [33660.603339] usb 3-1.1.3: USB disconnect, device number 5
> > [33660.709741] uvcvideo: Resuming interface 0
> > [33660.709743] uvcvideo: Resuming interface 1
> > [33660.709837] uvcvideo: uvc_v4l2_release
> > [33660.710050] uvcvideo: uvc_v4l2_open
> > [33660.710104] uvcvideo: uvc_v4l2_release
> > [33660.711395] uvcvideo: uvc_v4l2_open
> > [33660.711449] uvcvideo: uvc_v4l2_release
> > [33660.746041] xhci_hcd 0000:3c:00.0: Host halt failed, -19
> > [33660.746047] xhci_hcd 0000:3c:00.0: Host not accessible, reset
> > failed.
> > [33660.746484] xhci_hcd 0000:3c:00.0: USB bus 3 deregistered
> > [33660.765730] uvcvideo: uvc_v4l2_open
> > [33660.765969] uvcvideo: uvc_v4l2_release
> > [33660.785299] uvcvideo: uvc_v4l2_open
> > [33660.787265] uvcvideo: uvc_v4l2_release
> > [33660.976605] pci_bus 0000:05: Allocating resources
> > [33660.976635] pcieport 0000:05:01.0: bridge window [io=C2=A0 0x1000-
> > 0x0fff] to [bus 07-3b] add_size 1000
> > [33660.976642] pcieport 0000:05:02.0: bridge window [io=C2=A0 0x1000-
> > 0x0fff] to [bus 3c] add_size 1000
> > [33660.976649] pcieport 0000:05:02.0: bridge window [mem
> > 0x00100000-0x000fffff 64bit pref] to [bus 3c] add_size 200000
> > add_align 100000
> > [33660.976656] pcieport 0000:04:00.0: bridge window [io=C2=A0 0x1000-
> > 0x0fff] to [bus 05-3c] add_size 3000
> > [33660.976666] pcieport 0000:04:00.0: BAR 13: no space for [io=C2=A0
> > size 0x3000]
> > [33660.976671] pcieport 0000:04:00.0: BAR 13: failed to assign [io=C2=
=A0
> > size 0x3000]
> > [33660.976677] pcieport 0000:04:00.0: BAR 13: no space for [io=C2=A0
> > size 0x3000]
> > [33660.976682] pcieport 0000:04:00.0: BAR 13: failed to assign [io=C2=
=A0
> > size 0x3000]
> > [33660.976696] pcieport 0000:05:02.0: BAR 15: no space for [mem
> > size 0x00200000 64bit pref]
> > [33660.976700] pcieport 0000:05:02.0: BAR 15: failed to assign [mem
> > size 0x00200000 64bit pref]
> > [33660.976705] pcieport 0000:05:01.0: BAR 13: no space for [io=C2=A0
> > size 0x1000]
> > [33660.976711] pcieport 0000:05:01.0: BAR 13: failed to assign [io=C2=
=A0
> > size 0x1000]
> > [33660.976716] pcieport 0000:05:02.0: BAR 13: no space for [io=C2=A0
> > size 0x1000]
> > [33660.976720] pcieport 0000:05:02.0: BAR 13: failed to assign [io=C2=
=A0
> > size 0x1000]
> > [33660.976730] pcieport 0000:05:02.0: BAR 15: no space for [mem
> > size 0x00200000 64bit pref]
> > [33660.976734] pcieport 0000:05:02.0: BAR 15: failed to assign [mem
> > size 0x00200000 64bit pref]
> > [33660.976739] pcieport 0000:05:02.0: BAR 13: no space for [io=C2=A0
> > size 0x1000]
> > [33660.976744] pcieport 0000:05:02.0: BAR 13: failed to assign [io=C2=
=A0
> > size 0x1000]
> > [33660.976748] pcieport 0000:05:01.0: BAR 13: no space for [io=C2=A0
> > size 0x1000]
> > [33660.976753] pcieport 0000:05:01.0: BAR 13: failed to assign [io=C2=
=A0
> > size 0x1000]
> > [33663.292784] uvcvideo: Suspending interface 1
> > [33663.292787] uvcvideo: Suspending interface 0
> > [33665.695288] pcieport 0000:05:00.0: can't change power state from
> > D3cold to D0 (config space inaccessible)
> > [33665.695971] pci_bus 0000:06: busn_res: [bus 06] is released
> > [33665.696182] pci_bus 0000:07: busn_res: [bus 07-3b] is released
> > [33665.696329] pci_bus 0000:3c: busn_res: [bus 3c] is released
> > [33665.701153] pci_bus 0000:05: busn_res: [bus 05-3c] is released
>=20
> I assume all this corresponds to unplugging the monitor. Is it
> connected
> over a thunderbolt 3 (PCIe and DP over a USB type C donnector) ?
>=20
> > [33667.950096] wlp61s0: authenticate with f0:b0:14:99:cd:fc
> > [33667.960464] wlp61s0: send auth to f0:b0:14:99:cd:fc (try 1/3)
> > [33667.971065] wlp61s0: authenticated
> > [33667.972706] wlp61s0: associate with f0:b0:14:99:cd:fc (try 1/3)
> > [33667.975090] wlp61s0: RX AssocResp from f0:b0:14:99:cd:fc
> > (capab=3D0x1511 status=3D0 aid=3D3)
> > [33667.977717] wlp61s0: associated
> > [33668.004909] wlp61s0: Limiting TX power to 27 (30 - 3) dBm as
> > advertised by f0:b0:14:99:cd:fc
> > [33668.004996] IPv6: ADDRCONF(NETDEV_CHANGE): wlp61s0: link becomes
> > ready
>=20
> This is unrelated.
>=20
> I assume that you've replugged the monitor at this point.
>=20
> > [33675.939837] pci 0000:04:00.0: [8086:15c0] type 01 class 0x060400
> > [33675.939900] pci 0000:04:00.0: enabling Extended Tags
> > [33675.940013] pci 0000:04:00.0: supports D1 D2
> > [33675.940015] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot
> > D3cold
> > [33675.940292] pci 0000:05:00.0: [8086:15c0] type 01 class 0x060400
> > [33675.940343] pci 0000:05:00.0: enabling Extended Tags
> > [33675.940426] pci 0000:05:00.0: supports D1 D2
> > [33675.940426] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot
> > D3cold
> > [33675.940546] pci 0000:05:01.0: [8086:15c0] type 01 class 0x060400
> > [33675.940597] pci 0000:05:01.0: enabling Extended Tags
> > [33675.940678] pci 0000:05:01.0: supports D1 D2
> > [33675.940679] pci 0000:05:01.0: PME# supported from D0 D1 D2 D3hot
> > D3cold
> > [33675.940802] pci 0000:05:02.0: [8086:15c0] type 01 class 0x060400
> > [33675.940854] pci 0000:05:02.0: enabling Extended Tags
> > [33675.940938] pci 0000:05:02.0: supports D1 D2
> > [33675.940939] pci 0000:05:02.0: PME# supported from D0 D1 D2 D3hot
> > D3cold
> > [33675.941100] pci 0000:04:00.0: PCI bridge to [bus 05-3c]
> > [33675.941108] pci 0000:04:00.0:=C2=A0=C2=A0 bridge window [mem 0xc4000=
000-
> > 0xda0fffff]
> > [33675.941114] pci 0000:04:00.0:=C2=A0=C2=A0 bridge window [mem 0xa0000=
000-
> > 0xc1ffffff 64bit pref]
> > [33675.941161] pci 0000:05:00.0: PCI bridge to [bus 06]
> > [33675.941168] pci 0000:05:00.0:=C2=A0=C2=A0 bridge window [mem 0xda000=
000-
> > 0xda0fffff]
> > [33675.941212] pci 0000:05:01.0: PCI bridge to [bus 07-3b]
> > [33675.941220] pci 0000:05:01.0:=C2=A0=C2=A0 bridge window [mem 0xc4000=
000-
> > 0xd9efffff]
> > [33675.941225] pci 0000:05:01.0:=C2=A0=C2=A0 bridge window [mem 0xa0000=
000-
> > 0xc1ffffff 64bit pref]
> > [33675.941307] pci 0000:3c:00.0: [8086:15c1] type 00 class 0x0c0330
> > [33675.941329] pci 0000:3c:00.0: reg 0x10: [mem 0xd9f00000-
> > 0xd9f0ffff]
> > [33675.941404] pci 0000:3c:00.0: enabling Extended Tags
> > [33675.941517] pci 0000:3c:00.0: supports D1 D2
> > [33675.941518] pci 0000:3c:00.0: PME# supported from D0 D1 D2 D3hot
> > D3cold
> > [33675.941607] pci 0000:3c:00.0: 8.000 Gb/s available PCIe
> > bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:05:02.0
> > (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
> > [33675.941745] pci 0000:05:02.0: PCI bridge to [bus 3c]
> > [33675.941754] pci 0000:05:02.0:=C2=A0=C2=A0 bridge window [mem 0xd9f00=
000-
> > 0xd9ffffff]
> > [33675.941782] pci_bus 0000:05: Allocating resources
> > [33675.941797] pci 0000:05:01.0: bridge window [io=C2=A0 0x1000-0x0fff]
> > to [bus 07-3b] add_size 1000
> > [33675.941799] pci 0000:05:02.0: bridge window [io=C2=A0 0x1000-0x0fff]
> > to [bus 3c] add_size 1000
> > [33675.941800] pci 0000:05:02.0: bridge window [mem 0x00100000-
> > 0x000fffff 64bit pref] to [bus 3c] add_size 200000 add_align 100000
> > [33675.941802] pci 0000:04:00.0: bridge window [io=C2=A0 0x1000-0x0fff]
> > to [bus 05-3c] add_size 3000
> > [33675.941805] pci 0000:04:00.0: BAR 13: no space for [io=C2=A0 size
> > 0x3000]
> > [33675.941806] pci 0000:04:00.0: BAR 13: failed to assign [io=C2=A0 siz=
e
> > 0x3000]
> > [33675.941808] pci 0000:04:00.0: BAR 13: no space for [io=C2=A0 size
> > 0x3000]
> > [33675.941809] pci 0000:04:00.0: BAR 13: failed to assign [io=C2=A0 siz=
e
> > 0x3000]
> > [33675.941812] pci 0000:05:02.0: BAR 15: no space for [mem size
> > 0x00200000 64bit pref]
> > [33675.941813] pci 0000:05:02.0: BAR 15: failed to assign [mem size
> > 0x00200000 64bit pref]
> > [33675.941814] pci 0000:05:01.0: BAR 13: no space for [io=C2=A0 size
> > 0x1000]
> > [33675.941815] pci 0000:05:01.0: BAR 13: failed to assign [io=C2=A0 siz=
e
> > 0x1000]
> > [33675.941815] pci 0000:05:02.0: BAR 13: no space for [io=C2=A0 size
> > 0x1000]
> > [33675.941816] pci 0000:05:02.0: BAR 13: failed to assign [io=C2=A0 siz=
e
> > 0x1000]
> > [33675.941819] pci 0000:05:02.0: BAR 15: no space for [mem size
> > 0x00200000 64bit pref]
> > [33675.941819] pci 0000:05:02.0: BAR 15: failed to assign [mem size
> > 0x00200000 64bit pref]
> > [33675.941820] pci 0000:05:02.0: BAR 13: no space for [io=C2=A0 size
> > 0x1000]
> > [33675.941821] pci 0000:05:02.0: BAR 13: failed to assign [io=C2=A0 siz=
e
> > 0x1000]
> > [33675.941822] pci 0000:05:01.0: BAR 13: no space for [io=C2=A0 size
> > 0x1000]
> > [33675.941822] pci 0000:05:01.0: BAR 13: failed to assign [io=C2=A0 siz=
e
> > 0x1000]
> > [33675.941825] pci 0000:05:00.0: PCI bridge to [bus 06]
> > [33675.941832] pci 0000:05:00.0:=C2=A0=C2=A0 bridge window [mem 0xda000=
000-
> > 0xda0fffff]
> > [33675.941840] pci 0000:05:01.0: PCI bridge to [bus 07-3b]
> > [33675.941844] pci 0000:05:01.0:=C2=A0=C2=A0 bridge window [mem 0xc4000=
000-
> > 0xd9efffff]
> > [33675.941847] pci 0000:05:01.0:=C2=A0=C2=A0 bridge window [mem 0xa0000=
000-
> > 0xc1ffffff 64bit pref]
> > [33675.941852] pci 0000:05:02.0: PCI bridge to [bus 3c]
> > [33675.941856] pci 0000:05:02.0:=C2=A0=C2=A0 bridge window [mem 0xd9f00=
000-
> > 0xd9ffffff]
> > [33675.941864] pci 0000:04:00.0: PCI bridge to [bus 05-3c]
> > [33675.941868] pci 0000:04:00.0:=C2=A0=C2=A0 bridge window [mem 0xc4000=
000-
> > 0xda0fffff]
> > [33675.941871] pci 0000:04:00.0:=C2=A0=C2=A0 bridge window [mem 0xa0000=
000-
> > 0xc1ffffff 64bit pref]
> > [33675.943143] xhci_hcd 0000:3c:00.0: xHCI Host Controller
> > [33675.943149] xhci_hcd 0000:3c:00.0: new USB bus registered,
> > assigned bus number 3
> > [33675.944287] xhci_hcd 0000:3c:00.0: hcc params 0x200077c1 hci
> > version 0x110 quirks 0x0000000000009810
> > [33675.944513] usb usb3: New USB device found, idVendor=3D1d6b,
> > idProduct=3D0002, bcdDevice=3D 5.09
> > [33675.944514] usb usb3: New USB device strings: Mfr=3D3, Product=3D2,
> > SerialNumber=3D1
> > [33675.944516] usb usb3: Product: xHCI Host Controller
> > [33675.944517] usb usb3: Manufacturer: Linux 5.9.4-arch1-1 xhci-hcd
> > [33675.944518] usb usb3: SerialNumber: 0000:3c:00.0
> > [33675.944681] hub 3-0:1.0: USB hub found
> > [33675.944691] hub 3-0:1.0: 2 ports detected
> > [33675.945358] xhci_hcd 0000:3c:00.0: xHCI Host Controller
> > [33675.945362] xhci_hcd 0000:3c:00.0: new USB bus registered,
> > assigned bus number 4
> > [33675.945366] xhci_hcd 0000:3c:00.0: Host supports USB 3.1
> > Enhanced SuperSpeed
> > [33675.945405] usb usb4: New USB device found, idVendor=3D1d6b,
> > idProduct=3D0003, bcdDevice=3D 5.09
> > [33675.945407] usb usb4: New USB device strings: Mfr=3D3, Product=3D2,
> > SerialNumber=3D1
> > [33675.945408] usb usb4: Product: xHCI Host Controller
> > [33675.945410] usb usb4: Manufacturer: Linux 5.9.4-arch1-1 xhci-hcd
> > [33675.945411] usb usb4: SerialNumber: 0000:3c:00.0
> > [33675.945533] hub 4-0:1.0: USB hub found
> > [33675.945541] hub 4-0:1.0: 2 ports detected
>=20
> Two XHCI (USB 3) controllers seem to be present in your monitor,
> they're
> assigned buses 3 and 4.
>=20
> > [33676.272630] usb 3-1: new high-speed USB device number 2 using
> > xhci_hcd
> > [33676.415928] usb 3-1: New USB device found, idVendor=3D0bda,
> > idProduct=3D5420, bcdDevice=3D 1.30
> > [33676.415929] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2,
> > SerialNumber=3D0
> > [33676.415930] usb 3-1: Product: 4-Port USB 2.0 Hub
> > [33676.415931] usb 3-1: Manufacturer: Generic
> > [33676.416882] hub 3-1:1.0: USB hub found
> > [33676.417126] hub 3-1:1.0: 5 ports detected
> > [33676.539368] usb 4-1: new SuperSpeedPlus Gen 2 USB device number
> > 2 using xhci_hcd
> > [33676.562679] usb 4-1: New USB device found, idVendor=3D0bda,
> > idProduct=3D0420, bcdDevice=3D 1.30
> > [33676.562681] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2,
> > SerialNumber=3D0
> > [33676.562682] usb 4-1: Product: 4-Port USB 3.0 Hub
> > [33676.562683] usb 4-1: Manufacturer: Generic
> > [33676.565072] hub 4-1:1.0: USB hub found
> > [33676.565367] hub 4-1:1.0: 4 ports detected
>=20
> Each of them has a root hub with 5 and 4 ports respectively.
>=20
> > [33676.699303] usb 3-1.1: new high-speed USB device number 3 using
> > xhci_hcd
> > [33676.824290] usb 3-1.1: New USB device found, idVendor=3D0bda,
> > idProduct=3D5420, bcdDevice=3D 1.29
> > [33676.824292] usb 3-1.1: New USB device strings: Mfr=3D1, Product=3D2,
> > SerialNumber=3D0
> > [33676.824294] usb 3-1.1: Product: 4-Port USB 2.0 Hub
> > [33676.824294] usb 3-1.1: Manufacturer: Generic
> > [33676.826109] hub 3-1.1:1.0: USB hub found
> > [33676.827260] hub 3-1.1:1.0: 4 ports detected
> > [33676.889920] usb 4-1.1: new SuperSpeedPlus Gen 2 USB device
> > number 3 using xhci_hcd
> > [33676.921137] usb 4-1.1: New USB device found, idVendor=3D0bda,
> > idProduct=3D0420, bcdDevice=3D 1.29
> > [33676.921139] usb 4-1.1: New USB device strings: Mfr=3D1, Product=3D2,
> > SerialNumber=3D0
> > [33676.921140] usb 4-1.1: Product: 4-Port USB 3.0 Hub
> > [33676.921141] usb 4-1.1: Manufacturer: Generic
> > [33676.929999] hub 4-1.1:1.0: USB hub found
> > [33676.931410] hub 4-1.1:1.0: 4 ports detected
>=20
> On port 1 of each root hub there's a USB 2.0 hub with 4 ports.
>=20
> > [33677.109278] usb 3-1.1.1: new high-speed USB device number 4
> > using xhci_hcd
> > [33677.234131] usb 3-1.1.1: New USB device found, idVendor=3D0bda,
> > idProduct=3D5412, bcdDevice=3D 1.20
> > [33677.234133] usb 3-1.1.1: New USB device strings: Mfr=3D1,
> > Product=3D2, SerialNumber=3D0
> > [33677.234134] usb 3-1.1.1: Product: 2-Port USB 2.1 Hub
> > [33677.234135] usb 3-1.1.1: Manufacturer: Generic
> > [33677.235575] hub 3-1.1.1:1.0: USB hub found
> > [33677.237584] hub 3-1.1.1:1.0: 2 ports detected
> > [33677.299864] usb 4-1.1.1: new SuperSpeed Gen 1 USB device number
> > 4 using xhci_hcd
> > [33677.330281] usb 4-1.1.1: New USB device found, idVendor=3D0bda,
> > idProduct=3D0412, bcdDevice=3D 1.20
> > [33677.330283] usb 4-1.1.1: New USB device strings: Mfr=3D1,
> > Product=3D2, SerialNumber=3D0
> > [33677.330284] usb 4-1.1.1: Product: 4-Port USB 3.1 Hub
> > [33677.330286] usb 4-1.1.1: Manufacturer: Generic
> > [33677.339379] hub 4-1.1.1:1.0: USB hub found
> > [33677.341114] hub 4-1.1.1:1.0: 2 ports detected
>=20
> And on port 1 of each of the USB 2.0 hubs there's a USB 2.1 hub with
> two
> ports. The topology is getting a bit complicated.
>=20
> > [33677.395926] usb 3-1.1.3: new full-speed USB device number 5
> > using xhci_hcd
> > [33677.487520] usb 3-1.1.3: New USB device found, idVendor=3D046a,
> > idProduct=3D00b0, bcdDevice=3D 1.01
> > [33677.487522] usb 3-1.1.3: New USB device strings: Mfr=3D1,
> > Product=3D2, SerialNumber=3D0
> > [33677.487523] usb 3-1.1.3: Product: Mechanical Keyboard
> > [33677.487524] usb 3-1.1.3: Manufacturer: CHERRY
> > [33677.494244] input: CHERRY Mechanical Keyboard as
> > /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:
> > 00.0/usb3/3-1/3-1.1/3-1.1.3/3-
> > 1.1.3:1.0/0003:046A:00B0.000A/input/input43
> > [33677.549426] hid-generic 0003:046A:00B0.000A: input,hidraw1: USB
> > HID v1.11 Keyboard [CHERRY Mechanical Keyboard] on usb-
> > 0000:3c:00.0-1.1.3/input0
> > [33677.550173] input: CHERRY Mechanical Keyboard as
> > /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:
> > 00.0/usb3/3-1/3-1.1/3-1.1.3/3-
> > 1.1.3:1.1/0003:046A:00B0.000B/input/input44
>=20
> On port 3 of the USB 2.0 hub for bus 3 there's a keyboard.
>=20
> > [33677.559243] usb 3-1.1.1.1: new high-speed USB device number 6
> > using xhci_hcd
> > [33677.606030] hid-generic 0003:046A:00B0.000B: input,hidraw2: USB
> > HID v1.11 Device [CHERRY Mechanical Keyboard] on usb-0000:3c:00.0-
> > 1.1.3/input1
> > [33677.848662] usb 3-1.1.1.1: New USB device found, idVendor=3D0bda,
> > idProduct=3D48a5, bcdDevice=3D 0.01
> > [33677.848663] usb 3-1.1.1.1: New USB device strings: Mfr=3D3,
> > Product=3D1, SerialNumber=3D2
> > [33677.848664] usb 3-1.1.1.1: Product: USB Audio
> > [33677.848665] usb 3-1.1.1.1: Manufacturer: Generic
> > [33677.848666] usb 3-1.1.1.1: SerialNumber: 201405280001
>=20
> On port 1 of the USB 2.1 hub for bus 3 there's an audio device.
>=20
> > [33677.969289] usb 3-1.1.1.2: new high-speed USB device number 7
> > using xhci_hcd
> > [33678.134841] usb 3-1.1.1.2: New USB device found, idVendor=3D04f2,
> > idProduct=3Db612, bcdDevice=3D 2.10
> > [33678.134843] usb 3-1.1.1.2: New USB device strings: Mfr=3D1,
> > Product=3D2, SerialNumber=3D3
> > [33678.134844] usb 3-1.1.1.2: Product: USB2.0 FHD UVC WebCam
> > [33678.134844] usb 3-1.1.1.2: Manufacturer: SunplusIT Inc
> > [33678.134845] usb 3-1.1.1.2: SerialNumber: 01.00.00
>=20
> And on port 2 of the same hub there's your webcam.
>=20
> > [33678.145922] uvcvideo: Probing generic UVC device 1.1.1.2
> > [33678.149746] uvcvideo: Found format MJPEG.
> > [33678.149748] uvcvideo: - 640x480 (30.0 fps)
> > [33678.149749] uvcvideo: - 1920x1080 (30.0 fps)
> > [33678.149750] uvcvideo: - 1280x720 (30.0 fps)
> > [33678.149750] uvcvideo: - 640x360 (30.0 fps)
> > [33678.149751] uvcvideo: - 352x288 (30.0 fps)
> > [33678.149752] uvcvideo: - 320x240 (30.0 fps)
> > [33678.149753] uvcvideo: - 176x144 (30.0 fps)
> > [33678.149754] uvcvideo: Found format YUV 4:2:2 (YUYV).
> > [33678.149754] uvcvideo: - 640x480 (30.0 fps)
> > [33678.149755] uvcvideo: - 640x360 (30.0 fps)
> > [33678.149755] uvcvideo: - 352x288 (30.0 fps)
> > [33678.149756] uvcvideo: - 320x240 (30.0 fps)
> > [33678.149756] uvcvideo: - 176x144 (30.0 fps)
> > [33678.149759] uvcvideo: Found a Status endpoint (addr 87).
> > [33678.149760] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC
> > WebCam (04f2:b612)
> > [33678.153431] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000001/2 to device 1.1.1.2 entity 1
> > [33678.153434] uvcvideo: Adding mapping 'Exposure, Auto' to control
> > 00000000-0000-0000-0000-000000000001/2.
> > [33678.157171] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000001/4 to device 1.1.1.2 entity 1
> > [33678.157175] uvcvideo: Adding mapping 'Exposure (Absolute)' to
> > control 00000000-0000-0000-0000-000000000001/4.
> > [33678.160954] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000101/2 to device 1.1.1.2 entity 2
> > [33678.160956] uvcvideo: Adding mapping 'Brightness' to control
> > 00000000-0000-0000-0000-000000000101/2.
> > [33678.164794] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000101/3 to device 1.1.1.2 entity 2
> > [33678.164797] uvcvideo: Adding mapping 'Contrast' to control
> > 00000000-0000-0000-0000-000000000101/3.
> > [33678.168589] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000101/6 to device 1.1.1.2 entity 2
> > [33678.168590] uvcvideo: Adding mapping 'Hue' to control 00000000-
> > 0000-0000-0000-000000000101/6.
> > [33678.172374] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000101/7 to device 1.1.1.2 entity 2
> > [33678.172376] uvcvideo: Adding mapping 'Saturation' to control
> > 00000000-0000-0000-0000-000000000101/7.
> > [33678.176233] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000101/8 to device 1.1.1.2 entity 2
> > [33678.176236] uvcvideo: Adding mapping 'Sharpness' to control
> > 00000000-0000-0000-0000-000000000101/8.
> > [33678.179988] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000101/9 to device 1.1.1.2 entity 2
> > [33678.179990] uvcvideo: Adding mapping 'Gamma' to control
> > 00000000-0000-0000-0000-000000000101/9.
> > [33678.183820] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000101/10 to device 1.1.1.2 entity 2
> > [33678.183822] uvcvideo: Adding mapping 'White Balance Temperature'
> > to control 00000000-0000-0000-0000-000000000101/10.
> > [33678.187612] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000101/1 to device 1.1.1.2 entity 2
> > [33678.187614] uvcvideo: Adding mapping 'Backlight Compensation' to
> > control 00000000-0000-0000-0000-000000000101/1.
> > [33678.191115] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000101/5 to device 1.1.1.2 entity 2
> > [33678.191118] uvcvideo: Adding mapping 'Power Line Frequency' to
> > control 00000000-0000-0000-0000-000000000101/5.
> > [33678.194955] uvcvideo: Added control 00000000-0000-0000-0000-
> > 000000000101/11 to device 1.1.1.2 entity 2
> > [33678.194959] uvcvideo: Adding mapping 'White Balance Temperature,
> > Auto' to control 00000000-0000-0000-0000-000000000101/11.
> > [33678.194963] uvcvideo: Scanning UVC chain: OT 5 <- XU 4 <- XU 3
> > <- PU 2 <- IT 1
> > [33678.194966] uvcvideo: Found a valid video chain (1 -> 5).
> > [33678.212183] input: USB2.0 FHD UVC WebCam: USB2.0 F as
> > /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:
> > 00.0/usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.0/input/input45
> > [33678.212283] uvcvideo: UVC device initialized.
> > [33678.216492] uvcvideo: Probing generic UVC device 1.1.1.2
> > [33678.220254] uvcvideo: Found format IR 8-bit (L8_IR).
> > [33678.220256] uvcvideo: - 352x352 (30.0 fps)
> > [33678.220260] uvcvideo: Found a Status endpoint (addr 84).
> > [33678.220261] uvcvideo: Found UVC 1.50 device USB2.0 FHD UVC
> > WebCam (04f2:b612)
> > [33678.220264] uvcvideo: Scanning UVC chain: OT 5 <- XU 4 <- XU 7
> > <- PU 2 <- IT 1
> > [33678.220267] uvcvideo: Found a valid video chain (1 -> 5).
> > [33678.237583] input: USB2.0 FHD UVC WebCam: IR Camer as
> > /devices/pci0000:00/0000:00:1c.4/0000:04:00.0/0000:05:02.0/0000:3c:
> > 00.0/usb3/3-1/3-1.1/3-1.1.1/3-1.1.1.2/3-1.1.1.2:1.2/input/input46
> > [33678.237667] uvcvideo: UVC device initialized.
> > [33678.329348] usb 4-1.1.2: new SuperSpeed Gen 1 USB device number
> > 5 using xhci_hcd
> > [33678.346494] usb 4-1.1.2: New USB device found, idVendor=3D0bda,
> > idProduct=3D8153, bcdDevice=3D31.00
> > [33678.346497] usb 4-1.1.2: New USB device strings: Mfr=3D1,
> > Product=3D2, SerialNumber=3D6
> > [33678.346498] usb 4-1.1.2: Product: USB 10/100/1000 LAN
> > [33678.346500] usb 4-1.1.2: Manufacturer: Realtek
> > [33678.346501] usb 4-1.1.2: SerialNumber: 000000000000
> > [33678.426195] usb 4-1.1.2: reset SuperSpeed Gen 1 USB device
> > number 5 using xhci_hcd
> > [33678.489706] r8152 4-1.1.2:1.0 eth0: v2.14.0 (2020/09/24)
> > [33678.489708] r8152 4-1.1.2:1.0 eth0: This product is covered by
> > one or more of the following patents:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
US6,570,884, US6,115,776, and US6,327,625.
> >=20
> > [33678.632895] usb 4-1.1.2: reset SuperSpeed Gen 1 USB device
> > number 5 using xhci_hcd
> > [33678.698562] r8152 4-1.1.2:1.0 eth0: v2.14.0 (2020/09/24)
> > [33678.698565] r8152 4-1.1.2:1.0 eth0: This product is covered by
> > one or more of the following patents:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
US6,570,884, US6,115,776, and US6,327,625.
> >=20
> > [33678.969798] r8152 4-1.1.2:1.0 enp60s0u1u1u2: renamed from eth0
>=20
> Then on bus 4 there's a network controller (the patents information
> really don't belong to the kernel... I wonder where those messages
> come
> from though, I can't find them in the kernel sources).
>=20
> > [33679.516896] uvcvideo: uvc_v4l2_open
> > [33679.516929] uvcvideo: uvc_v4l2_release
> > [33679.534194] uvcvideo: uvc_v4l2_open
> > [33679.534210] uvcvideo: uvc_v4l2_release
> > [33679.535192] uvcvideo: uvc_v4l2_open
> > [33679.535293] uvcvideo: uvc_v4l2_release
> > [33679.535393] uvcvideo: uvc_v4l2_open
> > [33679.535407] uvcvideo: Control 0x00980900 not found.
> > [33679.535411] uvcvideo: Control 0x00980901 not found.
> > [33679.535414] uvcvideo: Control 0x00980902 not found.
> > [33679.535416] uvcvideo: Control 0x00980903 not found.
> > [33679.535419] uvcvideo: Control 0x00980904 not found.
> > [33679.535421] uvcvideo: Control 0x00980905 not found.
> > [33679.535424] uvcvideo: Control 0x00980906 not found.
> > [33679.535427] uvcvideo: Control 0x00980907 not found.
> > [33679.535429] uvcvideo: Control 0x00980908 not found.
> > [33679.535432] uvcvideo: Control 0x00980909 not found.
> > [33679.535434] uvcvideo: Control 0x0098090a not found.
> > [33679.535437] uvcvideo: Control 0x0098090b not found.
> > [33679.535440] uvcvideo: Control 0x0098090c not found.
> > [33679.535442] uvcvideo: Control 0x0098090d not found.
> > [33679.535445] uvcvideo: Control 0x0098090e not found.
> > [33679.535448] uvcvideo: Control 0x0098090f not found.
> > [33679.535450] uvcvideo: Control 0x00980910 not found.
> > [33679.535453] uvcvideo: Control 0x00980911 not found.
> > [33679.535456] uvcvideo: Control 0x00980912 not found.
> > [33679.535458] uvcvideo: Control 0x00980913 not found.
> > [33679.535461] uvcvideo: Control 0x00980914 not found.
> > [33679.535463] uvcvideo: Control 0x00980915 not found.
> > [33679.535466] uvcvideo: Control 0x00980916 not found.
> > [33679.535469] uvcvideo: Control 0x00980917 not found.
> > [33679.535472] uvcvideo: Control 0x00980918 not found.
> > [33679.535475] uvcvideo: Control 0x00980919 not found.
> > [33679.535477] uvcvideo: Control 0x0098091a not found.
> > [33679.535480] uvcvideo: Control 0x0098091b not found.
> > [33679.535483] uvcvideo: Control 0x0098091c not found.
> > [33679.535485] uvcvideo: Control 0x0098091d not found.
> > [33679.535488] uvcvideo: Control 0x0098091e not found.
> > [33679.535491] uvcvideo: Control 0x0098091f not found.
> > [33679.535493] uvcvideo: Control 0x00980920 not found.
> > [33679.535496] uvcvideo: Control 0x00980921 not found.
> > [33679.535499] uvcvideo: Control 0x00980922 not found.
> > [33679.535501] uvcvideo: Control 0x00980923 not found.
> > [33679.535504] uvcvideo: Control 0x00980924 not found.
> > [33679.535507] uvcvideo: Control 0x00980925 not found.
> > [33679.535509] uvcvideo: Control 0x00980926 not found.
> > [33679.535511] uvcvideo: uvc_v4l2_open
> > [33679.535512] uvcvideo: Control 0x00980927 not found.
> > [33679.535515] uvcvideo: Control 0x00980928 not found.
> > [33679.535517] uvcvideo: Control 0x00980929 not found.
> > [33679.535520] uvcvideo: Control 0x0098092a not found.
> > [33679.535523] uvcvideo: Control 0x00980900 not found.
> > [33679.535524] uvcvideo: Control 0x08000000 not found.
> > [33679.535527] uvcvideo: Control 0x00980901 not found.
> > [33679.535528] uvcvideo: uvc_v4l2_release
> > [33679.535532] uvcvideo: Control 0x00980902 not found.
> > [33679.535536] uvcvideo: Control 0x00980903 not found.
> > [33679.535540] uvcvideo: Control 0x00980904 not found.
> > [33679.535540] uvcvideo: uvc_v4l2_open
> > [33679.535544] uvcvideo: Control 0x00980905 not found.
> > [33679.535548] uvcvideo: Control 0x00980906 not found.
> > [33679.535550] uvcvideo: uvc_v4l2_release
> > [33679.535552] uvcvideo: Control 0x00980907 not found.
> > [33679.535556] uvcvideo: Control 0x00980908 not found.
> > [33679.535560] uvcvideo: Control 0x00980909 not found.
> > [33679.535564] uvcvideo: Control 0x0098090a not found.
> > [33679.535568] uvcvideo: Control 0x0098090b not found.
> > [33679.535571] uvcvideo: Control 0x0098090c not found.
> > [33679.535575] uvcvideo: Control 0x0098090d not found.
> > [33679.535579] uvcvideo: Control 0x0098090e not found.
> > [33679.535583] uvcvideo: Control 0x0098090f not found.
> > [33679.535587] uvcvideo: Control 0x00980910 not found.
> > [33679.535590] uvcvideo: Control 0x00980911 not found.
> > [33679.535594] uvcvideo: Control 0x00980912 not found.
> > [33679.535598] uvcvideo: Control 0x00980913 not found.
> > [33679.535602] uvcvideo: Control 0x00980914 not found.
> > [33679.535605] uvcvideo: Control 0x00980915 not found.
> > [33679.535609] uvcvideo: Control 0x00980916 not found.
> > [33679.535613] uvcvideo: Control 0x00980917 not found.
> > [33679.535617] uvcvideo: Control 0x00980918 not found.
> > [33679.535620] uvcvideo: Control 0x00980919 not found.
> > [33679.535625] uvcvideo: Control 0x0098091a not found.
> > [33679.535628] uvcvideo: Control 0x0098091b not found.
> > [33679.535632] uvcvideo: Control 0x0098091c not found.
> > [33679.535636] uvcvideo: Control 0x0098091d not found.
> > [33679.535640] uvcvideo: Control 0x0098091e not found.
> > [33679.535644] uvcvideo: Control 0x0098091f not found.
> > [33679.535648] uvcvideo: Control 0x00980920 not found.
> > [33679.535651] uvcvideo: Control 0x00980921 not found.
> > [33679.535655] uvcvideo: Control 0x00980922 not found.
> > [33679.535659] uvcvideo: Control 0x00980923 not found.
> > [33679.535663] uvcvideo: Control 0x00980924 not found.
> > [33679.535666] uvcvideo: Control 0x00980925 not found.
> > [33679.535670] uvcvideo: Control 0x00980926 not found.
> > [33679.535674] uvcvideo: Control 0x00980927 not found.
> > [33679.535678] uvcvideo: Control 0x00980928 not found.
> > [33679.535682] uvcvideo: Control 0x00980929 not found.
> > [33679.535685] uvcvideo: Control 0x0098092a not found.
> > [33679.535689] uvcvideo: Control 0x08000000 not found.
> > [33679.535693] uvcvideo: uvc_v4l2_release
> > [33679.539084] uvcvideo: uvc_v4l2_open
> > [33679.539933] uvcvideo: uvc_v4l2_open
> > [33679.541867] uvcvideo: uvc_v4l2_release
> > [33679.541979] uvcvideo: uvc_v4l2_open
> > [33679.542010] uvcvideo: uvc_v4l2_release
> > [33679.542097] uvcvideo: uvc_v4l2_open
> > [33679.543598] uvcvideo: uvc_v4l2_open
> > [33679.543614] uvcvideo: uvc_v4l2_release
> > [33679.543875] uvcvideo: uvc_v4l2_open
> > [33679.543886] uvcvideo: Control 0x00980900 not found.
> > [33679.543889] uvcvideo: Control 0x00980901 not found.
> > [33679.543892] uvcvideo: Control 0x00980902 not found.
> > [33679.543895] uvcvideo: Control 0x00980903 not found.
> > [33679.543897] uvcvideo: Control 0x00980904 not found.
> > [33679.543900] uvcvideo: Control 0x00980905 not found.
> > [33679.543903] uvcvideo: Control 0x00980906 not found.
> > [33679.543905] uvcvideo: Control 0x00980907 not found.
> > [33679.543908] uvcvideo: Control 0x00980908 not found.
> > [33679.543911] uvcvideo: Control 0x00980909 not found.
> > [33679.543913] uvcvideo: Control 0x0098090a not found.
> > [33679.543916] uvcvideo: Control 0x0098090b not found.
> > [33679.543919] uvcvideo: Control 0x0098090c not found.
> > [33679.543921] uvcvideo: Control 0x0098090d not found.
> > [33679.543924] uvcvideo: Control 0x0098090e not found.
> > [33679.543927] uvcvideo: Control 0x0098090f not found.
> > [33679.543930] uvcvideo: Control 0x00980910 not found.
> > [33679.543933] uvcvideo: Control 0x00980911 not found.
> > [33679.543935] uvcvideo: Control 0x00980912 not found.
> > [33679.543938] uvcvideo: Control 0x00980913 not found.
> > [33679.543941] uvcvideo: Control 0x00980914 not found.
> > [33679.543943] uvcvideo: Control 0x00980915 not found.
> > [33679.543946] uvcvideo: Control 0x00980916 not found.
> > [33679.543949] uvcvideo: Control 0x00980917 not found.
> > [33679.543951] uvcvideo: Control 0x00980918 not found.
> > [33679.543954] uvcvideo: Control 0x00980919 not found.
> > [33679.543957] uvcvideo: Control 0x0098091a not found.
> > [33679.543959] uvcvideo: Control 0x0098091b not found.
> > [33679.543962] uvcvideo: Control 0x0098091c not found.
> > [33679.543964] uvcvideo: Control 0x0098091d not found.
> > [33679.543967] uvcvideo: Control 0x0098091e not found.
> > [33679.543970] uvcvideo: Control 0x0098091f not found.
> > [33679.543973] uvcvideo: Control 0x00980920 not found.
> > [33679.543975] uvcvideo: Control 0x00980921 not found.
> > [33679.543978] uvcvideo: Control 0x00980922 not found.
> > [33679.543980] uvcvideo: Control 0x00980923 not found.
> > [33679.543983] uvcvideo: Control 0x00980924 not found.
> > [33679.543986] uvcvideo: Control 0x00980925 not found.
> > [33679.543989] uvcvideo: Control 0x00980926 not found.
> > [33679.543991] uvcvideo: Control 0x00980927 not found.
> > [33679.543994] uvcvideo: Control 0x00980928 not found.
> > [33679.543996] uvcvideo: Control 0x00980929 not found.
> > [33679.543999] uvcvideo: Control 0x0098092a not found.
> > [33679.544002] uvcvideo: Control 0x08000000 not found.
> > [33679.544005] uvcvideo: uvc_v4l2_release
> > [33679.544091] uvcvideo: uvc_v4l2_open
> > [33679.544100] uvcvideo: uvc_v4l2_release
> > [33679.544214] uvcvideo: uvc_v4l2_open
> > [33679.557062] uvcvideo: uvc_v4l2_open
> > [33679.557076] uvcvideo: uvc_v4l2_release
> > [33679.557228] uvcvideo: uvc_v4l2_open
> > [33679.557239] uvcvideo: Control 0x00980900 not found.
> > [33679.557242] uvcvideo: Control 0x00980901 not found.
> > [33679.557246] uvcvideo: Control 0x00980902 not found.
> > [33679.557249] uvcvideo: Control 0x00980903 not found.
> > [33679.557252] uvcvideo: Control 0x00980904 not found.
> > [33679.557255] uvcvideo: Control 0x00980905 not found.
> > [33679.557258] uvcvideo: Control 0x00980906 not found.
> > [33679.557261] uvcvideo: Control 0x00980907 not found.
> > [33679.557263] uvcvideo: Control 0x00980908 not found.
> > [33679.557266] uvcvideo: Control 0x00980909 not found.
> > [33679.557269] uvcvideo: Control 0x0098090a not found.
> > [33679.557272] uvcvideo: Control 0x0098090b not found.
> > [33679.557275] uvcvideo: Control 0x0098090c not found.
> > [33679.557277] uvcvideo: Control 0x0098090d not found.
> > [33679.557280] uvcvideo: Control 0x0098090e not found.
> > [33679.557283] uvcvideo: Control 0x0098090f not found.
> > [33679.557285] uvcvideo: Control 0x00980910 not found.
> > [33679.557288] uvcvideo: Control 0x00980911 not found.
> > [33679.557291] uvcvideo: Control 0x00980912 not found.
> > [33679.557294] uvcvideo: Control 0x00980913 not found.
> > [33679.557297] uvcvideo: Control 0x00980914 not found.
> > [33679.557299] uvcvideo: Control 0x00980915 not found.
> > [33679.557302] uvcvideo: Control 0x00980916 not found.
> > [33679.557305] uvcvideo: Control 0x00980917 not found.
> > [33679.557308] uvcvideo: Control 0x00980918 not found.
> > [33679.557311] uvcvideo: Control 0x00980919 not found.
> > [33679.557313] uvcvideo: Control 0x0098091a not found.
> > [33679.557316] uvcvideo: Control 0x0098091b not found.
> > [33679.557318] uvcvideo: Control 0x0098091c not found.
> > [33679.557321] uvcvideo: Control 0x0098091d not found.
> > [33679.557324] uvcvideo: Control 0x0098091e not found.
> > [33679.557327] uvcvideo: Control 0x0098091f not found.
> > [33679.557331] uvcvideo: Control 0x00980920 not found.
> > [33679.557334] uvcvideo: Control 0x00980921 not found.
> > [33679.557337] uvcvideo: Control 0x00980922 not found.
> > [33679.557340] uvcvideo: Control 0x00980923 not found.
> > [33679.557343] uvcvideo: Control 0x00980924 not found.
> > [33679.557345] uvcvideo: Control 0x00980925 not found.
> > [33679.557348] uvcvideo: Control 0x00980926 not found.
> > [33679.557351] uvcvideo: Control 0x00980927 not found.
> > [33679.557353] uvcvideo: Control 0x00980928 not found.
> > [33679.557356] uvcvideo: Control 0x00980929 not found.
> > [33679.557359] uvcvideo: Control 0x0098092a not found.
> > [33679.557361] uvcvideo: Control 0x08000000 not found.
> > [33679.557364] uvcvideo: uvc_v4l2_release
> > [33679.557446] uvcvideo: uvc_v4l2_open
> > [33679.557463] uvcvideo: uvc_v4l2_release
> > [33679.557547] uvcvideo: uvc_v4l2_open
> > [33679.701284] uvcvideo: uvc_v4l2_release
> > [33679.701293] uvcvideo: uvc_v4l2_release
> > [33679.701305] uvcvideo: uvc_v4l2_open
> > [33679.701305] uvcvideo: uvc_v4l2_open
> > [33679.701310] uvcvideo: uvc_v4l2_release
> > [33679.701326] uvcvideo: uvc_v4l2_release
> > [33679.701332] uvcvideo: uvc_v4l2_open
> > [33679.701393] uvcvideo: uvc_v4l2_open
> > [33679.812706] uvcvideo: Resuming interface 0
> > [33679.812708] uvcvideo: Resuming interface 1
> > [33679.812745] uvcvideo: uvc_v4l2_release
> > [33679.812746] uvcvideo: uvc_v4l2_release
> > [33679.812746] uvcvideo: uvc_v4l2_release
> > [33679.812747] uvcvideo: uvc_v4l2_release
> > [33679.812871] uvcvideo: uvc_v4l2_open
> > [33679.812871] uvcvideo: uvc_v4l2_open
> > [33679.812872] uvcvideo: uvc_v4l2_open
> > [33679.812881] uvcvideo: uvc_v4l2_open
> > [33679.812944] uvcvideo: uvc_v4l2_release
> > [33679.812945] uvcvideo: uvc_v4l2_release
> > [33679.812945] uvcvideo: uvc_v4l2_release
> > [33679.812949] uvcvideo: uvc_v4l2_release
> > [33679.814214] uvcvideo: uvc_v4l2_open
> > [33679.814235] uvcvideo: uvc_v4l2_release
> > [33679.815265] uvcvideo: uvc_v4l2_open
> > [33679.815289] uvcvideo: uvc_v4l2_release
> > [33679.815774] uvcvideo: uvc_v4l2_open
> > [33679.815798] uvcvideo: uvc_v4l2_release
> > [33679.815888] uvcvideo: uvc_v4l2_open
> > [33679.815916] uvcvideo: uvc_v4l2_release
> > [33679.816772] uvcvideo: uvc_v4l2_open
> > [33679.816783] uvcvideo: uvc_v4l2_release
> > [33679.816994] uvcvideo: uvc_v4l2_open
> > [33679.817004] uvcvideo: uvc_v4l2_release
> > [33679.868762] uvcvideo: uvc_v4l2_open
> > [33679.868775] uvcvideo: uvc_v4l2_release
> > [33679.868875] uvcvideo: uvc_v4l2_open
> > [33679.868985] uvcvideo: uvc_v4l2_release
> > [33679.869075] uvcvideo: uvc_v4l2_open
> > [33679.869153] uvcvideo: uvc_v4l2_release
> > [33679.869244] uvcvideo: uvc_v4l2_open
> > [33679.869311] uvcvideo: uvc_v4l2_release
> > [33679.869394] uvcvideo: uvc_v4l2_open
> > [33679.869442] uvcvideo: uvc_v4l2_release
> > [33679.870128] uvcvideo: uvc_v4l2_open
> > [33679.870136] uvcvideo: uvc_v4l2_release
> > [33679.870237] uvcvideo: uvc_v4l2_open
> > [33679.870330] uvcvideo: uvc_v4l2_release
> > [33679.870431] uvcvideo: uvc_v4l2_open
> > [33679.870502] uvcvideo: uvc_v4l2_release
>=20
> Userspace looks at the V4L2 devices (I assume this is an automated
> process under udev's control, possibly running /lib/udev/v4l_id).
>=20
> > [33681.724746] IPv6: ADDRCONF(NETDEV_CHANGE): enp60s0u1u1u2: link
> > becomes ready
> > [33681.725242] r8152 4-1.1.2:1.0 enp60s0u1u1u2: carrier on
> > [33682.312529] uvcvideo: Suspending interface 1
> > [33682.312532] uvcvideo: Suspending interface 0
> > [33682.369227] uvcvideo: Suspending interface 3
> > [33682.369228] uvcvideo: Suspending interface 2
> > [33682.369229] uvcvideo: Suspending interface 1
> > [33682.369229] uvcvideo: Suspending interface 0
>=20
> And there the kernel auto-suspends the camera, as it's not in use.
>=20
> > [33684.020289] wlp61s0: deauthenticating from f0:b0:14:99:cd:fc by
> > local choice (Reason: 3=3DDEAUTH_LEAVING)
> > [33688.189318] usb 3-1.1.1: Failed to suspend device, error -110
>=20
> However, something goes wrong.
>=20
> > [33733.405785] uvcvideo: uvc_v4l2_open
> > [33733.405906] hub 3-1.1.1:1.0: hub_ext_port_status failed (err =3D -
> > 71)
> > [33733.406202] usb 3-1.1.1-port2: cannot disable (err =3D -71)
> > [33733.406391] usb 3-1.1.1-port2: device 3-1.1.1.2 not suspended
> > yet
>=20
> And when opening the device, an error occurs.
>=20
> I'm afraid I don't know why the device fails to suspend :-S As a
> quick
> hack, you could try commenting out the call to
> usb_enable_autosuspend()
> in uvc_probe(). If that fixes the issue then we know it's an
> auto-suspend problem, and I would then recommend CC'ing the linux-usb
> mailing list to get help with that. It may be that the camera is
> buggy
> and doesn't support auto-suspend (in which case we could add a quirk
> in
> the UVC driver - or possibly in the USB subsystem core - to
> selectively
> disable auto-suspend for that model), or there could be a bug
> somewhere
> in the kernel.
>=20
> > [33739.747081] uvcvideo: uvc_v4l2_open
>=20


--=-wyeb9L9fiCXVPCa5/rwv
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgMFADCABgkqhkiG9w0BBwEAAKCCFpgw
ggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYTAkRFMSsw
KQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYDVQQLDBZULVN5
c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFsUm9vdCBDbGFzcyAy
MB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNVBAYTAkRFMUUwQwYDVQQK
EzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMg
ZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERGTi1WZXJlaW4gQ2VydGlmaWNhdGlv
biBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMtg1/9moUHN0vqH
l4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZsFVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8F
XRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0peQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+Ba
L2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qL
NupOkSk9s1FcragMvp0049ENF4N1xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz
9AkH4wKGMUZrAcUQDBHHWekCAwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQU
k+PYMiba1fFKpZFK4OpL4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYD
VR0TAQH/BAgwBgEB/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGC
LB4wCAYGZ4EMAQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUv
cmwvVGVsZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYB
BQUHMAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5jZXIw
DQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4eTizDnS6
dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/MOaZ/SLick0+
hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3SPXez7vTXTf/D6OWS
T1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc22CzeIs2LgtjZeOJVEqM7
h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bPZYoaorVyGTkwggWsMIIElKAD
AgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYDVQQGEwJERTFFMEMGA1UEChM8VmVy
ZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYu
MRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRERk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0
aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcNMzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUx
RTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5n
c25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9i
YWwgSXNzdWluZyBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp
1xCeOdfZojDbchwFfylfS2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6W
LkDh0YNMZj0cZGnlm6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mI
TQ5HjUhfZZkQ0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUk
P7agCwf9TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22M
ZD08WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAdBgNV
HQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK4OpL4qIM
z+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwtcm9v
dC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYBBQUHAQEEgdAwgc0wMwYI
KwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1TZXJ2ZXIvT0NTUDBKBggrBgEF
BQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY2FjZXJ0
L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJv
b3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/
DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCN
T1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7Ln8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+
lgQCXISoKTlslPwQkgZ7nu7YRrQbtQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v
9NsH1VuEGMGpuEvObJAaguS5Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7
EUkp2KgtdRXYShjqFu9VNCIaE40GMIIF5TCCBM2gAwIBAgIMITw++XMeenpZKoHZMA0GCSqGSIb3
DQEBCwUAMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVp
bmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUw
IwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE5MDcwMzE0NTMzM1oXDTIy
MDcwMjE0NTMzM1owgYMxCzAJBgNVBAYTAkRFMRAwDgYDVQQIDAdTYWNoc2VuMRAwDgYDVQQHDAdE
cmVzZGVuMTUwMwYDVQQKDCxIZWxtaG9sdHotWmVudHJ1bSBEcmVzZGVuIC0gUm9zc2VuZG9yZiBl
LiBWLjEZMBcGA1UEAwwQSGxhd2FjZWssIEdyZWdvcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAPT2husCqijBQDUyAd8yXl3PBKBB44b6kSh4kUIsskuSqPIV2Bbdo61wy7inFK/iSt4f
7DITlGarq3fwKtlDWHuHDyZhpv8gRea7T4Ul/lw8w4oymaimKNz47Ofio2XsosCWX7RQYitgTbr+
VlPKj36HlEv9BIr1+SxRXESr2FSIYRaFxwW+QA+ic0JJ3iimG8P7BQ+ylVqbnFMU+QqC739qC1HB
DPTSoi30gEBkQI1gcNL+dN1j0b1WibYZGQXcABjydbpy1ow17OyxpQVXNA4DaEI8VtGldmPqyXo7
QocVkn3hCoVCgcm23H1WSlFpNoC3C09CvsYPxny5vZ5O3dkCAwEAAaOCAkswggJHMD4GA1UdIAQ3
MDUwDwYNKwYBBAGBrSGCLAEBBDAQBg4rBgEEAYGtIYIsAQEEBDAQBg4rBgEEAYGtIYIsAgEEBDAJ
BgNVHRMEAjAAMA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
HQYDVR0OBBYEFD9v9h1AN9B7JVmbUR3b4sCrEHIqMB8GA1UdIwQYMBaAFGs6mIv58lOJ2uCtsjIe
CR/oqjt0MB0GA1UdEQQWMBSBEmcuaGxhd2FjZWtAaHpkci5kZTCBjQYDVR0fBIGFMIGCMD+gPaA7
hjlodHRwOi8vY2RwMS5wY2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5j
cmwwP6A9oDuGOWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY3Js
L2NhY3JsLmNybDCB2wYIKwYBBQUHAQEEgc4wgcswMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBj
YS5kZm4uZGUvT0NTUC1TZXJ2ZXIvT0NTUDBJBggrBgEFBQcwAoY9aHR0cDovL2NkcDEucGNhLmRm
bi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDBJBggrBgEFBQcwAoY9
aHR0cDovL2NkcDIucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0
LmNydDANBgkqhkiG9w0BAQsFAAOCAQEAl0uz9sxJ9EKjOX+9CcXVGa219cKWtKWqJh5hlvhfE/0W
eQAp7cs+5XX9y4a5+huV4z2iqMlwR2Bt4nmlxTrnv6E6LGfQS4z9KGS2LvXLV4eelXFLK8C2z3U1
gkUJF4VAtCadN1q1zPWMXA4lRgwuurqS0tNCKPJEjYjwc5vJVtzZudfX3vTOCcJ4/HEZts0s5zbO
TfKmutq0r3/ePxrkUhRnK0SdBYdDeLCZpWIya3VQhLgzH0j54dOKbGO3MT1bjnTdcgThrF7LU+ON
wTAwxG37DaIU4nD4mTghk01C3iYDvBUmiCLEYEeeOTfOyPzG/FoDj0ZAhj9AXvP0+3sW3TCCBeUw
ggTNoAMCAQICDCE8PvlzHnp6WSqB2TANBgkqhkiG9w0BAQsFADCBjTELMAkGA1UEBhMCREUxRTBD
BgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25l
dHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwg
SXNzdWluZyBDQTAeFw0xOTA3MDMxNDUzMzNaFw0yMjA3MDIxNDUzMzNaMIGDMQswCQYDVQQGEwJE
RTEQMA4GA1UECAwHU2FjaHNlbjEQMA4GA1UEBwwHRHJlc2RlbjE1MDMGA1UECgwsSGVsbWhvbHR6
LVplbnRydW0gRHJlc2RlbiAtIFJvc3NlbmRvcmYgZS4gVi4xGTAXBgNVBAMMEEhsYXdhY2VrLCBH
cmVnb3IwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQD09obrAqoowUA1MgHfMl5dzwSg
QeOG+pEoeJFCLLJLkqjyFdgW3aOtcMu4pxSv4kreH+wyE5Rmq6t38CrZQ1h7hw8mYab/IEXmu0+F
Jf5cPMOKMpmopijc+Ozn4qNl7KLAll+0UGIrYE26/lZTyo9+h5RL/QSK9fksUVxEq9hUiGEWhccF
vkAPonNCSd4ophvD+wUPspVam5xTFPkKgu9/agtRwQz00qIt9IBAZECNYHDS/nTdY9G9Vom2GRkF
3AAY8nW6ctaMNezssaUFVzQOA2hCPFbRpXZj6sl6O0KHFZJ94QqFQoHJttx9VkpRaTaAtwtPQr7G
D8Z8ub2eTt3ZAgMBAAGjggJLMIICRzA+BgNVHSAENzA1MA8GDSsGAQQBga0hgiwBAQQwEAYOKwYB
BAGBrSGCLAEBBAQwEAYOKwYBBAGBrSGCLAIBBAQwCQYDVR0TBAIwADAOBgNVHQ8BAf8EBAMCBeAw
HQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBQ/b/YdQDfQeyVZm1Ed2+LA
qxByKjAfBgNVHSMEGDAWgBRrOpiL+fJTidrgrbIyHgkf6Ko7dDAdBgNVHREEFjAUgRJnLmhsYXdh
Y2VrQGh6ZHIuZGUwgY0GA1UdHwSBhTCBgjA/oD2gO4Y5aHR0cDovL2NkcDEucGNhLmRmbi5kZS9k
Zm4tY2EtZ2xvYmFsLWcyL3B1Yi9jcmwvY2FjcmwuY3JsMD+gPaA7hjlodHRwOi8vY2RwMi5wY2Eu
ZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5jcmwwgdsGCCsGAQUFBwEBBIHO
MIHLMDMGCCsGAQUFBzABhidodHRwOi8vb2NzcC5wY2EuZGZuLmRlL09DU1AtU2VydmVyL09DU1Aw
SQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAxLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIv
Y2FjZXJ0L2NhY2VydC5jcnQwSQYIKwYBBQUHMAKGPWh0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZu
LWNhLWdsb2JhbC1nMi9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQELBQADggEBAJdL
s/bMSfRCozl/vQnF1RmttfXClrSlqiYeYZb4XxP9FnkAKe3LPuV1/cuGufobleM9oqjJcEdgbeJ5
pcU657+hOixn0EuM/Shkti71y1eHnpVxSyvAts91NYJFCReFQLQmnTdatcz1jFwOJUYMLrq6ktLT
QijyRI2I8HObyVbc2bnX1970zgnCePxxGbbNLOc2zk3yprratK9/3j8a5FIUZytEnQWHQ3iwmaVi
Mmt1UIS4Mx9I+eHTimxjtzE9W4503XIE4axey1PjjcEwMMRt+w2iFOJw+Jk4IZNNQt4mA7wVJogi
xGBHnjk3zsj8xvxaA49GQIY/QF7z9Pt7Ft0xggO9MIIDuQIBATCBnjCBjTELMAkGA1UEBhMCREUx
RTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5n
c25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9i
YWwgSXNzdWluZyBDQQIMITw++XMeenpZKoHZMA0GCWCGSAFlAwQCAwUAoIIB7zAYBgkqhkiG9w0B
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAxMjAxMTUzMDNaME8GCSqGSIb3DQEJ
BDFCBEAoBMncAsFKoxEfcDBjXktxFto7bBIAvjVavkfSc8j7i63lsu69HY5siyMKcmZMGkXDwlUZ
KMUEVE+7UStDGpPZMIGvBgkrBgEEAYI3EAQxgaEwgZ4wgY0xCzAJBgNVBAYTAkRFMUUwQwYDVQQK
DDxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMg
ZS4gVi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4gR2xvYmFsIElzc3Vp
bmcgQ0ECDCE8PvlzHnp6WSqB2TCBsQYLKoZIhvcNAQkQAgsxgaGggZ4wgY0xCzAJBgNVBAYTAkRF
MUUwQwYDVQQKDDxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVuIEZvcnNjaHVu
Z3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsMB0RGTi1QS0kxJTAjBgNVBAMMHERGTi1WZXJlaW4gR2xv
YmFsIElzc3VpbmcgQ0ECDCE8PvlzHnp6WSqB2TANBgkqhkiG9w0BAQEFAASCAQB2ZqBCC7qcil85
J/atfbbjkeZwo6k6U142m7sF0oiZP37DNs9szH2DouAq2Ym3KAqEzYbwJdeVNl7PX3H7Qc8CzX9W
vwzWdno6r5DzZhtrnanLI4LJQsBF/faEcm9nCgsycBl0LBdxR4+6Uy7O9TJN2Q5OvwY+avGc+Lr/
f1QsaCf/Iwa9iAZe6YqcyQK41xbSP7HhDRTFqoMA7k0K1954rM+JHR7wPWKEESRZbYDyoIxdoY5I
k5/1KN8QGfByPSBn43BZVbbPnSQiiBtiaJR9Geoqmc7ZmzhL/SEGcWapKOPfixXaf3EiHHUAR6+I
4Urh6tVIAI+SvGuHd41+xS+IAAAAAAAA


--=-wyeb9L9fiCXVPCa5/rwv--

