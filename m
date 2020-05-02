Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C005B1C23FA
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 10:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgEBIPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 04:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725785AbgEBIPr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 04:15:47 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BACFC061A0C
        for <linux-media@vger.kernel.org>; Sat,  2 May 2020 01:15:47 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k12so2476954wmj.3
        for <linux-media@vger.kernel.org>; Sat, 02 May 2020 01:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=riboMJMQxErCeBYOJJK8BQ/alrAy8n1dEwPHfqGFJw8=;
        b=RA9bYqkMn0FmP+Cj/ClNtfWM4z9mQ0k/kmnKOXbPGDqikwBMy5DroZu0GpTmM8jFwE
         cc+jgKlikuOgQ6XttMIUaS+7evPLcT/jzyGErUfnCxwsKNC1jGC9Elrm7NA8xCAbvecb
         K7FLF9evcQt0JGsZcUcMjWkot9LxDDlYohyEFi3lvl+clkECuTTFU/+SvZlYfa95IeyV
         kzf2cu+iWdAIBZyEZJNwZeBli5qGvwP3Tp7rZsyN7BiJ2QRVxIootKLNQtRrXg4FFSTp
         6gULNVQubaOoIUSnb6ieIeS/k3Jh2mV3RpatJY6OAPNnhLZFnsR/FoWOtCedWQP61OVx
         ywCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=riboMJMQxErCeBYOJJK8BQ/alrAy8n1dEwPHfqGFJw8=;
        b=L4fNm4Xu901PLWn3pjoBaGKfw5ZKxmDSk72h05kejs0xB1/G1m4782R6DN79zWT2yL
         7g4PI/erI7S7IGlSlba+pBU5tJn/dP20apr0VQwBR/40EoxVlYiLib/mllOPNWRqiBT5
         7XezO5c1aWa6I5WQy8TbhCOY7zBZtx0zkJ7VLSFNwb7Os6AmEOleIICz9inEcAtqyv+y
         EeeS1iXstoPCkvl4x3wdq6M34eDxe9G76lkYTKmUwSh3FPv02fXbwidtywQy49TIvbXl
         Ztr2tHWoUpOi4qh2BWuZP3mCk+0Vjkn4Hufi4e3R2XvbR/klZKrPRlmRI8xPajAx4rDo
         NzGQ==
X-Gm-Message-State: AGi0PuZnR9/hxlANu9QPedXv7CSv5umGqhGOJ5lANdA+lQLNlVpHwJWL
        Y//lgpeuIHRxRfWI5bLvc6GmQbist9U=
X-Google-Smtp-Source: APiQypIaqvjhtXRtqfNgCqNdkj3/buPJiS5pl/t7ZRREhgcR1HuZ5TdEHCqcNYcKT4BdAIN+IW8KeA==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr3835824wmi.52.1588407345795;
        Sat, 02 May 2020 01:15:45 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id a24sm3037987wmb.24.2020.05.02.01.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 01:15:45 -0700 (PDT)
Date:   Sat, 2 May 2020 10:15:42 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200502101542.2972010a@ASUS>
In-Reply-To: <20200501213023.7fe29188@coco.lan>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <20200422211344.2ec3d93e@coco.lan>
        <23b3a078-2a9a-5f50-a35e-9f40f5aa8a6e@gmail.com>
        <86413836-e4b5-cb53-3ac0-1764c693ec7b@gmail.com>
        <682558b0-a2cf-9fe2-6e54-20462ecccb5d@gmail.com>
        <20200425132255.4bf872b2@coco.lan>
        <131a4247-cef3-d651-a0ea-defd32b8bf20@gmail.com>
        <20200426185007.1954885a@coco.lan>
        <45817a6a-dd2f-13a6-835b-fd2b04ded23f@gmail.com>
        <20200427235027.15cd4e03@coco.lan>
        <d9ec5067-142c-66c9-c412-51ddf38e44f7@gmail.com>
        <20200429011339.03af3c2a@coco.lan>
        <3b7366b9-463d-c49b-0f2d-51a1d5475a9d@gmail.com>
        <20200429201753.3b2d679b@coco.lan>
        <6fffdf73-a0eb-1b1c-d894-e4799b8ef944@gmail.com>
        <20200430125544.10a9830d@coco.lan>
        <403b799e-6ae9-d62b-1f3a-a1b6b874071b@gmail.com>
        <20200501002510.0ead955d@coco.lan>
        <1a17ffad-9792-a4ff-519e-a4306e7bf3e1@gmail.com>
        <20200501113812.7f16b7ca@coco.lan>
        <20200501192844.397efcaa@ASUS>
        <20200501213023.7fe29188@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 1 May 2020 21:30:23 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Fri, 1 May 2020 19:31:05 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>=20
> > On Fri, 1 May 2020 11:38:12 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >=20
> > [...]=20
> >=20
> > > Hmm.. your e-mailer is breaking long lines again  :-( =20
> >=20
> > Ok - then the configuration option I used is not reliable. I've now swi=
tched to Claws Mail; I hope this resolves the problem.
>=20
> Yeah, that's what I use here. I actually manually break my lines
> when I'm closed to the 80 column, as most people do on mailing
> lists (some people read those upstream MLs with emacs).
>=20
> >=20
> > >  =20
> > > > [=C2=A0=C2=A0=C2=A0 9.175421] kernel: ov2680 i2c-OVTI2680:00: gmin:=
 initializing atomisp module subdev data.PMIC ID 1
> > > > [=C2=A0=C2=A0=C2=A0 9.178755] kernel: ov2680 i2c-OVTI2680:00: suppl=
y V1P2A not
> > > > found, using dummy regulator [=C2=A0=C2=A0=C2=A0 9.189966] kernel: =
proc_thermal
> > > > 0000:00:0b.0: enabling device (0000 -> 0002)   =20
> > > > [=C2=A0=C2=A0=C2=A0 9.212704] kernel: ov2680 i2c-OVTI2680:00: suppl=
y VPROG4B not
> > > > found, using dummy regulator
> > > > [=C2=A0=C2=A0=C2=A0 9.235024] kernel: ov2680 i2c-OVTI2680:00: suppl=
y Regulator1p8v
> > > > not found, using dummy regulator   =20
> > >=20
> > > I'll check this.
> > >  =20
> > > > [=C2=A0=C2=A0=C2=A0 9.235057] kernel: proc_thermal 0000:00:0b.0: Cr=
eating sysfs
> > > > group for PROC_THERMAL_PCI
> > > [...]
> > >=20
> > > It sounds that we need to add:
> > >=20
> > >         if (isp->media_dev.hw_revision =3D=3D
> > >             ((ATOMISP_HW_REVISION_ISP2401 <<
> > > ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0))
> > >                 fw_path =3D "shisp_2401b0_v21.bin";
> > >=20
> > > Eventually, other changes may be needed, depending on how different is
> > > this B0 revision from A0.
> > >=20
> > > Patch for it pushed. Please notice that it will seek for a firmware
> > > named "shisp_2401b0_v21.bin". =20
> >=20
> > Unfortunately I was not able to find "shisp_2401b0_v21.bin";=20
>=20
> Yeah, I also searched for it. Was unable to find it. I suspect that the
> B0 version could be newer than the atomisp driver that got merged.
>=20
> > so I changed the values in the code and tried with "shisp_2401a0_v21.bi=
n, irci_master_20140707_0622".
>=20
> Yeah, I suspect that this is the next best thing.
>=20
> > I contacted Intel to see if they are willing to provide the newer firmw=
are. Alan Cox mentioned in a commit message, that the drivers can be extrac=
ted from an "upgrade kit":
> >=20
> >    "... The firmware files will usually be found in /etc/firmware on an=
 Android
> >    device but can also be extracted from the upgrade kit if you've mana=
ged
> >    to lose them somehow. ..."
> >=20
> > But I did not yet figure out what this kit is.
>=20
> The firmware should be there somewhere at the BSP for Android
> (for hardware that came originally with it). It should also be
> present on Windows and other OSes that support, although the
> version could be different.
>=20
> >=20
> > There is also an open support request with Intel to get some hardware/f=
irmware documentation. But this will be difficult (as expected by you and L=
aurent) - their process only supports requests from companies that sign an =
NDA. But I opened a ticket as well to see if there's a way to get access to=
 their developer network someway, or if it is possible that they send only =
the documents required.=20
>=20
> Yeah, I suspect that they would open this only for companies
> with signed NDAs.
>=20
> >=20
> > I also sent an Mail to the original authors of the drivers at Intel. Tw=
o of them no longer work there (mail was rejected), but one went trough. Le=
t's see...
>=20
> Ok. Btw, there is a driver for Atomisp on an yocto tree:
>=20
> 	https://github.com/intel-aero/meta-intel-aero.git
>=20
> It got removed back in 2018, but if you checkout this changeset:
>=20
> 	Merge: db1df368eb58 08f476112708
> 	Author: Lucas De Marchi <lucas.demarchi@intel.com>
> 	Date:   Tue Apr 4 11:51:42 2017 -0700
>=20
> 	    Merge pull request #70 from zehortigoza/jam
>    =20

Cool, the code might give additional information. I've also send a
request regarding the firmware and HW documentation to the author and
the engineers that signed the patch. The firmware in the patch has a
different version string and the size is surprisingly a few MB bigger
than the one I used for the first experiment. I'll give that one a try
as well.

> You would be able to see it. Unfortunately, the driver there
> also came with shisp_2401a0_v21.bin.
>=20
> The driver there forces this specific version, disabling the=20
> firmware version checking:
>=20
> recipes-kernel/linux/linux-yocto/0013-temp-atomisp-support.patch:+ccflags=
-y +=3D -DATOMISP_POSTFIX=3D\"css2401a0_v21\" -DATOMISP_FWNAME=3D\"shisp_24=
01a0_v21.bin\" -DISP2401 -DISP2401_NEW_INPUT_SYSTEM
>=20
> I also found a firmware for some other Asus Transformer device:
>=20
> 	https://github.com/jfwells/linux-asus-t100ta/tree/master/webcam/firmware
>=20

It looks a this firmware is for the 2400 variant; I could also not
extract the irci version string. Thus I'll not try them for the moment
to perform experiments.

> That's said, there's also a firmware for it inside this:
> 	https://dlcdnets.asus.com/pub/ASUS/nb/DriversForWin10/Chipset/Chipset_In=
tel_CherryTrail_T_Win10_64_VER110.zip
>=20
> Probably it is a different version, but it could be worth renaming it and
> try it. The firmware load code should check if the firmware version is the
> right one.

It identifies itself as irci_stable_bw10p_0518_20150801_0537; I'll give
that one a try first. As usual it will unfortunately take some time
until I get back to you with the results, as every experiment takes
many hours (building the kernel on what is essentially a tablet takes
time).

>=20
> Also, the .INF file seems to point to the right PCI ID:
>=20
> 	[Device.NTamd64]
> 	%iacamera.DeviceDesc%=3Diacamera,VIDEO\INT22B8
>=20
> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:       {PCI_DEVICE(PCI_V=
ENDOR_ID_INTEL, 0x22b8), .driver_data =3D HW_IS_ISP2401},
>=20
> The inf file also contains this:
>=20
> 	DriverVer=3D03/02/2016,21.10586.6069.2007
>=20
> So, it sounds to be Version 21. If it is the right one or
> something else, I dunno.
>=20
> >=20
> > >=20
> > > This driver will also check if the firmware version is:
> > >=20
> > > 	"irci_ecr - master_20150911_0724"
> > >=20
> > > As far as I know, the firmware is linked to the driver's code.=20
> > > So, supporting a different firmware version will likely require
> > > changes at the driver.
> > >  =20
> > > > [=C2=A0=C2=A0=C2=A0 9.416174] kernel: atomisp-isp2: probe of 0000:0=
0:03.0 failed
> > > > with error -2   =20
> >=20
> > With the older firmware it does not look good (full dmesg output attach=
ed):
> > [    9.416329] ov2680 i2c-OVTI2680:00: supply Regulator1p8v not found, =
using dummy regulator
> > [    9.425878] ov2680 i2c-OVTI2680:00: supply Regulator2p8v not found, =
using dummy regulator
> > [    9.471140] atomisp-isp2 0000:00:03.0: enabling device (0000 -> 0002)
> > [    9.476362] proc_thermal 0000:00:0b.0: enabling device (0000 -> 0002)
> > [    9.478540] ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
> > [    9.493784] cfg80211: Loading compiled-in X.509 certificates for reg=
ulatory database
> > [    9.495675] atomisp-isp2 0000:00:03.0: ISP HPLL frequency base =3D 1=
600 MHz
> > [    9.501274] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea=
7'
> > [    9.510963] ov2680 i2c-OVTI2680:00: camera pdata: port: 1 lanes: 1 o=
rder: 00000002
> > [    9.515507] ov2680 i2c-OVTI2680:00: sensor_revision id =3D 0x2680, r=
ev=3D 0
> > [    9.519100] ov2680 i2c-OVTI2680:00: register atomisp i2c module type=
 1
> > [    9.530607] proc_thermal 0000:00:0b.0: Creating sysfs group for PROC=
_THERMAL_PCI
> > [    9.585233] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=3D0 as /devic=
es/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input17
> > [    9.591623] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=3D1 as /devic=
es/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input18
> > [    9.603063] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=3D2 as /devic=
es/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input19
> > [    9.688254] ------------[ cut here ]------------
> > [    9.691775] cpu_latency_qos_update_request called for unknown object
> > [    9.695279] WARNING: CPU: 3 PID: 523 at kernel/power/qos.c:296 cpu_l=
atency_qos_update_request+0x3a/0xb0
> > [    9.698826] Modules linked in: snd_soc_acpi_intel_match [...]
> > [    9.736699] CPU: 3 PID: 523 Comm: systemd-udevd Tainted: G         C=
        5.7.0-rc1+ #2
> > [    9.741309] Hardware name: ASUSTeK COMPUTER INC. T101HA/T101HA, BIOS=
 T101HA.305 01/24/2018
> > [    9.745962] RIP: 0010:cpu_latency_qos_update_request+0x3a/0xb0
> > [    9.750615] Code: [...]
> > [    9.760065] RSP: 0018:ffffa865404f39c0 EFLAGS: 00010282
> > [    9.764734] RAX: 0000000000000000 RBX: ffff9d2aefc84350 RCX: 0000000=
000000000
> > [    9.769435] RDX: ffff9d2afbfa97c0 RSI: ffff9d2afbf99808 RDI: ffff9d2=
afbf99808
> > [    9.774125] RBP: ffffa865404f39d8 R08: 0000000000000304 R09: 0000000=
000aaaaaa
> > [    9.778804] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000=
0ffffffff
> > [    9.783491] R13: ffff9d2afb4640b0 R14: ffffffffc07ecf20 R15: 0000000=
091000000
> > [    9.788187] FS:  00007efe67ff8880(0000) GS:ffff9d2afbf80000(0000) kn=
lGS:0000000000000000
> > [    9.792864] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    9.797482] CR2: 00007ffc6424bdc8 CR3: 0000000178998000 CR4: 0000000=
0001006e0
> > [    9.802126] Call Trace:
> > [    9.806775]  atomisp_pci_probe.cold.19+0x15f/0x116f [atomisp]
> > [    9.811441]  local_pci_probe+0x47/0x80
> > [    9.816085]  pci_device_probe+0xff/0x1b0
> > [    9.820706]  really_probe+0x1c8/0x3e0
> > [    9.825247]  driver_probe_device+0xd9/0x120
> > [    9.829769]  device_driver_attach+0x58/0x60
> > [    9.834294]  __driver_attach+0x8f/0x150
> > [    9.838782]  ? device_driver_attach+0x60/0x60
> > [    9.843205]  ? device_driver_attach+0x60/0x60
> > [    9.847634]  bus_for_each_dev+0x79/0xc0
> > [    9.852033]  ? kmem_cache_alloc_trace+0x167/0x230
> > [    9.856462]  driver_attach+0x1e/0x20
> >=20
> > Well - It did more things than before.=20
>=20
> Actually, it looked a lot better for me, as the driver is now trying to=20
> do something ;-)
>=20
> > But my fear is that we really depend on the rev b firmware, which is ve=
ry difficult to get hold of :-(.
> >=20
> > >=20
> > > That's because it didn't load the firmware.
> > >=20
> > > Thanks,
> > > Mauro =20
> >=20
> > with kind regards,
> > Patrik
> >=20
>=20
> Thanks,
> Mauro

with kind regards,
Patrik
