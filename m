Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CCF1C1DE5
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 21:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgEATa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 15:30:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:36438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbgEATa2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 15:30:28 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 513AB2137B;
        Fri,  1 May 2020 19:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588361427;
        bh=CdZpFAvc6bJ4mUQLvMN/5BekrVW2IwArxsoXURgSIqY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=q+UmCnIEGyFlV1unEEoyT5dGD7eCLap6i2k14SJ9kqcfUOsaIFVJKEsaEkn33zaBw
         e4OBbINvk3kNnx6hij/p92+KxkHYvO3J6GxBJ4nw2Kc81K57EJGIJ0vJnwkls5JmXz
         RByvmeNWUen9jq+G0Aj/RZMGkGMYKrf5WCa0TMeI=
Date:   Fri, 1 May 2020 21:30:23 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200501213023.7fe29188@coco.lan>
In-Reply-To: <20200501192844.397efcaa@ASUS>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <dd8ab5df-31c7-f009-36e4-ca4fd0605e97@gmail.com>
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
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 1 May 2020 19:31:05 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On Fri, 1 May 2020 11:38:12 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > Em Fri, 1 May 2020 10:54:18 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >=20
> >  [...] =20
> >  [...] =20
> >  [...] =20
> >  [...] =20
> >  [...] =20
> >  [...] =20
> >  [...] =20
> >  [...]   =20
> > >=20
> > > Compiled and linked :-). We get some more output this time:   =20
> >=20
> > Good!
> >=20
> >  [...] =20
> >=20
> > Hmm.. your e-mailer is breaking long lines again  :-( =20
>=20
> Ok - then the configuration option I used is not reliable. I've now switc=
hed to Claws Mail; I hope this resolves the problem.

Yeah, that's what I use here. I actually manually break my lines
when I'm closed to the 80 column, as most people do on mailing
lists (some people read those upstream MLs with emacs).

>=20
> >  =20
> > > [=C2=A0=C2=A0=C2=A0 9.175421] kernel: ov2680 i2c-OVTI2680:00: gmin: i=
nitializing atomisp module subdev data.PMIC ID 1
> > > [=C2=A0=C2=A0=C2=A0 9.178755] kernel: ov2680 i2c-OVTI2680:00: supply =
V1P2A not
> > > found, using dummy regulator [=C2=A0=C2=A0=C2=A0 9.189966] kernel: pr=
oc_thermal
> > > 0000:00:0b.0: enabling device (0000 -> 0002)   =20
> > > [=C2=A0=C2=A0=C2=A0 9.212704] kernel: ov2680 i2c-OVTI2680:00: supply =
VPROG4B not
> > > found, using dummy regulator
> > > [=C2=A0=C2=A0=C2=A0 9.235024] kernel: ov2680 i2c-OVTI2680:00: supply =
Regulator1p8v
> > > not found, using dummy regulator   =20
> >=20
> > I'll check this.
> >  =20
> > > [=C2=A0=C2=A0=C2=A0 9.235057] kernel: proc_thermal 0000:00:0b.0: Crea=
ting sysfs
> > > group for PROC_THERMAL_PCI
> > > [=C2=A0=C2=A0=C2=A0 9.238185] kernel: ov2680 i2c-OVTI2680:00: supply =
Regulator2p8v
> > > not found, using dummy regulator
> > > [=C2=A0=C2=A0=C2=A0 9.337925] kernel: atomisp: module is from the sta=
ging
> > > directory, the quality is unknown, you have been warned.
> > > [=C2=A0=C2=A0=C2=A0 9.404666] kernel: atomisp-isp2 0000:00:03.0: enab=
ling device
> > > (0000 -> 0002)   =20
> > > [=C2=A0=C2=A0=C2=A0 9.408680] kernel: atomisp-isp2 0000:00:03.0: ISP =
HPLL
> > > frequency base =3D 1600 MHz
> > > [=C2=A0=C2=A0=C2=A0 9.412197] kernel: atomisp-isp2 0000:00:03.0: Unsu=
pported=20
> > > hw_revision 0x2010   =20
> >=20
> > This is related to firmware load stuff. The code use those macros:
> >=20
> > 	#define ATOMISP_HW_REVISION_MASK	0x0000ff00
> > 	#define ATOMISP_HW_REVISION_SHIFT	8
> > 	#define ATOMISP_HW_REVISION_ISP2300	0x00
> > 	#define ATOMISP_HW_REVISION_ISP2400	0x10
> > 	#define ATOMISP_HW_REVISION_ISP2401_LEGACY 0x11
> > 	#define ATOMISP_HW_REVISION_ISP2401	0x20
> >=20
> > 	#define ATOMISP_HW_STEPPING_MASK	0x000000ff
> > 	#define ATOMISP_HW_STEPPING_A0		0x00
> > 	#define ATOMISP_HW_STEPPING_B0		0x10
> >=20
> > According with the above, 0x2010 would mean ISP2401-B0.
> >=20
> > The code itself check those macros in order to load the right
> > firmware:
> >=20
> >         if (isp->media_dev.hw_revision =3D=3D
> >             ((ATOMISP_HW_REVISION_ISP2401 <<
> > ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_A0))
> >                 fw_path =3D "shisp_2401a0_v21.bin";
> >=20
> >         if (isp->media_dev.hw_revision =3D=3D
> >             ((ATOMISP_HW_REVISION_ISP2401_LEGACY <<
> > ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_A0))
> >                 fw_path =3D "shisp_2401a0_legacy_v21.bin";
> >=20
> >         if (isp->media_dev.hw_revision =3D=3D
> >             ((ATOMISP_HW_REVISION_ISP2400 <<
> > ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0))
> >                 fw_path =3D "shisp_2400b0_v21.bin";
> >=20
> >         if (!fw_path) {
> >                 dev_err(isp->dev, "Unsupported hw_revision 0x%x\n",
> >                         isp->media_dev.hw_revision);
> >                 return NULL;
> >         }
> >=20
> > It sounds that we need to add:
> >=20
> >         if (isp->media_dev.hw_revision =3D=3D
> >             ((ATOMISP_HW_REVISION_ISP2401 <<
> > ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0))
> >                 fw_path =3D "shisp_2401b0_v21.bin";
> >=20
> > Eventually, other changes may be needed, depending on how different is
> > this B0 revision from A0.
> >=20
> > Patch for it pushed. Please notice that it will seek for a firmware
> > named "shisp_2401b0_v21.bin". =20
>=20
> Unfortunately I was not able to find "shisp_2401b0_v21.bin";=20

Yeah, I also searched for it. Was unable to find it. I suspect that the
B0 version could be newer than the atomisp driver that got merged.

> so I changed the values in the code and tried with "shisp_2401a0_v21.bin,=
 irci_master_20140707_0622".

Yeah, I suspect that this is the next best thing.

> I contacted Intel to see if they are willing to provide the newer firmwar=
e. Alan Cox mentioned in a commit message, that the drivers can be extracte=
d from an "upgrade kit":
>=20
>    "... The firmware files will usually be found in /etc/firmware on an A=
ndroid
>    device but can also be extracted from the upgrade kit if you've managed
>    to lose them somehow. ..."
>=20
> But I did not yet figure out what this kit is.

The firmware should be there somewhere at the BSP for Android
(for hardware that came originally with it). It should also be
present on Windows and other OSes that support, although the
version could be different.

>=20
> There is also an open support request with Intel to get some hardware/fir=
mware documentation. But this will be difficult (as expected by you and Lau=
rent) - their process only supports requests from companies that sign an ND=
A. But I opened a ticket as well to see if there's a way to get access to t=
heir developer network someway, or if it is possible that they send only th=
e documents required.=20

Yeah, I suspect that they would open this only for companies
with signed NDAs.

>=20
> I also sent an Mail to the original authors of the drivers at Intel. Two =
of them no longer work there (mail was rejected), but one went trough. Let'=
s see...

Ok. Btw, there is a driver for Atomisp on an yocto tree:

	https://github.com/intel-aero/meta-intel-aero.git

It got removed back in 2018, but if you checkout this changeset:

	Merge: db1df368eb58 08f476112708
	Author: Lucas De Marchi <lucas.demarchi@intel.com>
	Date:   Tue Apr 4 11:51:42 2017 -0700

	    Merge pull request #70 from zehortigoza/jam
   =20
You would be able to see it. Unfortunately, the driver there
also came with shisp_2401a0_v21.bin.

The driver there forces this specific version, disabling the=20
firmware version checking:

recipes-kernel/linux/linux-yocto/0013-temp-atomisp-support.patch:+ccflags-y=
 +=3D -DATOMISP_POSTFIX=3D\"css2401a0_v21\" -DATOMISP_FWNAME=3D\"shisp_2401=
a0_v21.bin\" -DISP2401 -DISP2401_NEW_INPUT_SYSTEM

I also found a firmware for some other Asus Transformer device:

	https://github.com/jfwells/linux-asus-t100ta/tree/master/webcam/firmware

That's said, there's also a firmware for it inside this:
	https://dlcdnets.asus.com/pub/ASUS/nb/DriversForWin10/Chipset/Chipset_Inte=
l_CherryTrail_T_Win10_64_VER110.zip

Probably it is a different version, but it could be worth renaming it and
try it. The firmware load code should check if the firmware version is the
right one.

Also, the .INF file seems to point to the right PCI ID:

	[Device.NTamd64]
	%iacamera.DeviceDesc%=3Diacamera,VIDEO\INT22B8

drivers/staging/media/atomisp/pci/atomisp_v4l2.c:       {PCI_DEVICE(PCI_VEN=
DOR_ID_INTEL, 0x22b8), .driver_data =3D HW_IS_ISP2401},

The inf file also contains this:

	DriverVer=3D03/02/2016,21.10586.6069.2007

So, it sounds to be Version 21. If it is the right one or
something else, I dunno.

>=20
> >=20
> > This driver will also check if the firmware version is:
> >=20
> > 	"irci_ecr - master_20150911_0724"
> >=20
> > As far as I know, the firmware is linked to the driver's code.=20
> > So, supporting a different firmware version will likely require
> > changes at the driver.
> >  =20
> > > [=C2=A0=C2=A0=C2=A0 9.416174] kernel: atomisp-isp2: probe of 0000:00:=
03.0 failed
> > > with error -2   =20
>=20
> With the older firmware it does not look good (full dmesg output attached=
):
> [    9.416329] ov2680 i2c-OVTI2680:00: supply Regulator1p8v not found, us=
ing dummy regulator
> [    9.425878] ov2680 i2c-OVTI2680:00: supply Regulator2p8v not found, us=
ing dummy regulator
> [    9.471140] atomisp-isp2 0000:00:03.0: enabling device (0000 -> 0002)
> [    9.476362] proc_thermal 0000:00:0b.0: enabling device (0000 -> 0002)
> [    9.478540] ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
> [    9.493784] cfg80211: Loading compiled-in X.509 certificates for regul=
atory database
> [    9.495675] atomisp-isp2 0000:00:03.0: ISP HPLL frequency base =3D 160=
0 MHz
> [    9.501274] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [    9.510963] ov2680 i2c-OVTI2680:00: camera pdata: port: 1 lanes: 1 ord=
er: 00000002
> [    9.515507] ov2680 i2c-OVTI2680:00: sensor_revision id =3D 0x2680, rev=
=3D 0
> [    9.519100] ov2680 i2c-OVTI2680:00: register atomisp i2c module type 1
> [    9.530607] proc_thermal 0000:00:0b.0: Creating sysfs group for PROC_T=
HERMAL_PCI
> [    9.585233] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=3D0 as /devices=
/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input17
> [    9.591623] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=3D1 as /devices=
/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input18
> [    9.603063] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=3D2 as /devices=
/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input19
> [    9.688254] ------------[ cut here ]------------
> [    9.691775] cpu_latency_qos_update_request called for unknown object
> [    9.695279] WARNING: CPU: 3 PID: 523 at kernel/power/qos.c:296 cpu_lat=
ency_qos_update_request+0x3a/0xb0
> [    9.698826] Modules linked in: snd_soc_acpi_intel_match snd_rawmidi sn=
d_soc_acpi snd_soc_rl6231 snd_soc_core ath mac80211 snd_compress snd_hdmi_l=
pe_audio ac97_bus hid_sensor_accel_3d snd_pcm_dmaengine hid_sensor_gyro_3d =
hid_sensor_trigger industrialio_triggered_buffer kfifo_buf hid_sensor_iio_c=
ommon processor_thermal_device industrialio cfg80211 snd_pcm snd_seq intel_=
rapl_common atomisp(C+) libarc4 intel_soc_dts_iosf cros_ec_ishtp intel_xhci=
_usb_role_switch mei_txe cros_ec videobuf_vmalloc mei roles atomisp_ov2680(=
C) videobuf_core snd_seq_device snd_timer spi_pxa2xx_platform videodev snd =
mc dw_dmac intel_hid dw_dmac_core 8250_dw soundcore int3406_thermal int3400=
_thermal intel_int0002_vgpio acpi_pad acpi_thermal_rel soc_button_array int=
3403_thermal int340x_thermal_zone mac_hid sch_fq_codel parport_pc ppdev lp =
parport ip_tables x_tables autofs4 hid_sensor_custom hid_sensor_hub intel_i=
shtp_loader intel_ishtp_hid crct10dif_pclmul crc32_pclmul ghash_clmulni_int=
el i915 mmc_block i2c_algo_bit
> [    9.698885]  aesni_intel crypto_simd drm_kms_helper cryptd syscopyarea=
 sysfillrect glue_helper sysimgblt fb_sys_fops cec intel_ish_ipc drm lpc_ic=
h intel_ishtp hid_asus intel_soc_pmic_chtdc_ti asus_wmi i2c_hid sparse_keym=
ap sdhci_acpi wmi video sdhci hid_generic usbhid hid
> [    9.736699] CPU: 3 PID: 523 Comm: systemd-udevd Tainted: G         C  =
      5.7.0-rc1+ #2
> [    9.741309] Hardware name: ASUSTeK COMPUTER INC. T101HA/T101HA, BIOS T=
101HA.305 01/24/2018
> [    9.745962] RIP: 0010:cpu_latency_qos_update_request+0x3a/0xb0
> [    9.750615] Code: 89 e5 41 55 41 54 41 89 f4 53 48 89 fb 48 81 7f 28 e=
0 7f c6 9e 74 1c 48 c7 c6 60 f3 65 9e 48 c7 c7 e8 a9 99 9e e8 b2 a6 f9 ff <=
0f> 0b 5b 41 5c 41 5d 5d c3 0f 1f 44 00 00 44 3b 23 74 ef 44 89 e2
> [    9.760065] RSP: 0018:ffffa865404f39c0 EFLAGS: 00010282
> [    9.764734] RAX: 0000000000000000 RBX: ffff9d2aefc84350 RCX: 000000000=
0000000
> [    9.769435] RDX: ffff9d2afbfa97c0 RSI: ffff9d2afbf99808 RDI: ffff9d2af=
bf99808
> [    9.774125] RBP: ffffa865404f39d8 R08: 0000000000000304 R09: 000000000=
0aaaaaa
> [    9.778804] R10: 0000000000000000 R11: 0000000000000001 R12: 00000000f=
fffffff
> [    9.783491] R13: ffff9d2afb4640b0 R14: ffffffffc07ecf20 R15: 000000009=
1000000
> [    9.788187] FS:  00007efe67ff8880(0000) GS:ffff9d2afbf80000(0000) knlG=
S:0000000000000000
> [    9.792864] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    9.797482] CR2: 00007ffc6424bdc8 CR3: 0000000178998000 CR4: 000000000=
01006e0
> [    9.802126] Call Trace:
> [    9.806775]  atomisp_pci_probe.cold.19+0x15f/0x116f [atomisp]
> [    9.811441]  local_pci_probe+0x47/0x80
> [    9.816085]  pci_device_probe+0xff/0x1b0
> [    9.820706]  really_probe+0x1c8/0x3e0
> [    9.825247]  driver_probe_device+0xd9/0x120
> [    9.829769]  device_driver_attach+0x58/0x60
> [    9.834294]  __driver_attach+0x8f/0x150
> [    9.838782]  ? device_driver_attach+0x60/0x60
> [    9.843205]  ? device_driver_attach+0x60/0x60
> [    9.847634]  bus_for_each_dev+0x79/0xc0
> [    9.852033]  ? kmem_cache_alloc_trace+0x167/0x230
> [    9.856462]  driver_attach+0x1e/0x20
>=20
> Well - It did more things than before.=20

Actually, it looked a lot better for me, as the driver is now trying to=20
do something ;-)

> But my fear is that we really depend on the rev b firmware, which is very=
 difficult to get hold of :-(.
>=20
> >=20
> > That's because it didn't load the firmware.
> >=20
> > Thanks,
> > Mauro =20
>=20
> with kind regards,
> Patrik
>=20



Thanks,
Mauro
