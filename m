Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB64C1BB0C4
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 23:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgD0Vuc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 17:50:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:44968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726182AbgD0Vuc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 17:50:32 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B14222074F;
        Mon, 27 Apr 2020 21:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588024231;
        bh=wPm2PxXYoNg/47X6IFMG3UTByc5vCcWWaGQZnZtBCqo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rXd32h+frYLnd9ehnWqfmztVDyVgTFKC6FitJwVWx8xF2z0HUq1khibeG4xbZ6eHY
         mj6sIqwlIY+7XdrxBpdv5zuE1pIMCi3ttVMyCSXiQ4dl/wy6CUU4NwJMoxaQsCUJi9
         c/NMCAp1vp+WQv4201DrdVvUTlhk95G8BL6KgZ5g=
Date:   Mon, 27 Apr 2020 23:50:27 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200427235027.15cd4e03@coco.lan>
In-Reply-To: <45817a6a-dd2f-13a6-835b-fd2b04ded23f@gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <20200418172549.7cca07a7@coco.lan>
        <20200418172654.74a1eeea@coco.lan>
        <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
        <20200420013109.65babb54@coco.lan>
        <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
        <eb83f789-9595-55f0-d922-bab00ae85cff@gmail.com>
        <20200420224750.28c0181d@coco.lan>
        <dd8ab5df-31c7-f009-36e4-ca4fd0605e97@gmail.com>
        <20200422211344.2ec3d93e@coco.lan>
        <23b3a078-2a9a-5f50-a35e-9f40f5aa8a6e@gmail.com>
        <86413836-e4b5-cb53-3ac0-1764c693ec7b@gmail.com>
        <682558b0-a2cf-9fe2-6e54-20462ecccb5d@gmail.com>
        <20200425132255.4bf872b2@coco.lan>
        <131a4247-cef3-d651-a0ea-defd32b8bf20@gmail.com>
        <20200426185007.1954885a@coco.lan>
        <45817a6a-dd2f-13a6-835b-fd2b04ded23f@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 27 Apr 2020 20:31:31 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On 26.04.20 18:50, Mauro Carvalho Chehab wrote:
> > Em Sun, 26 Apr 2020 13:38:19 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> > =20
> >> On 25.04.20 13:22, Mauro Carvalho Chehab wrote: =20
> >>> Hi Patrik,
> >>>
> >>> Em Fri, 24 Apr 2020 12:07:30 +0200
> >>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >>>    =20
> >>>> On 24.04.20 11:10, Patrik Gfeller wrote: =20
> >>>>> On 24.04.20 10:52, Patrik Gfeller wrote: =20
> >>>>>> On 22.04.20 21:13, Mauro Carvalho Chehab wrote: =20
> >>>>>>> Em Wed, 22 Apr 2020 19:56:56 +0200
> >>>>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >>>>>>>       =20
> >>>>>>>> On 20.04.20 22:47, Mauro Carvalho Chehab wrote: =20
> >>>>>>>>> Em Mon, 20 Apr 2020 20:27:25 +0200
> >>>>>>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu: =20
> >>>>>>>>>> Me again ... sorry to ask such a basic question, but I can't g=
et
> >>>>>>>>>> your
> >>>>>>>>>> modified source code. I get the following error:
> >>>>>>>>>>   =C2=A0 =C2=A0=C2=A0 > git clone https://git.linuxtv.$ sudo m=
ake M=3Ddrivers/staging/media/atomisp/ modules_install
> >>>>>>>>>> org/mchehab/experimental.git/
> >>>>>>>>>> Cloning into 'experimental'...
> >>>>>>>>>> warning: adding alternate object store:
> >>>>>>>>>> https://git.linuxtv.org/git/linux.git/
> >>>>>>>>>> warning: adding alternate object store:
> >>>>>>>>>> https://git.linuxtv.org/git/media_tree.git/
> >>>>>>>>>> warning: adding alternate object store:
> >>>>>>>>>> https://git.linuxtv.org/git/linux.git/
> >>>>>>>>>> error: Unable to find fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f=
 under
> >>>>>>>>>> https://git.linuxtv.org/mchehab/experimental.git
> >>>>>>>>>> Cannot obtain needed object fc8670d1f72b746ff3a5fe441f1fca4c4d=
ba0e6f
> >>>>>>>>>> while processing commit 6d80bfc14608f4bb5514b79721d30b486f50c9=
87.
> >>>>>>>>>> error: fetch failed.
> >>>>>>>>>>
> >>>>>>>>>> Do I use the wrong command? =20
> >>>>>>>>> Better to use git:// url:
> >>>>>>>>>
> >>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0git clone git://git.linuxtv.org/mcheh=
ab/experimental.git/ =20
> >>>>>>>> I was able to download and compile the code. I installed the ker=
nel
> >>>>>>>> and
> >>>>>>>> tried to boot; unfortunately it hangs with the message "Loading
> >>>>>>>> initial
> >>>>>>>> ramdisk ..." - after I start the old kernel I check kern.log and
> >>>>>>>> syslog
> >>>>>>>> - but I do not see entries from the failed boot attempt. I'll re=
ad
> >>>>>>>> into
> >>>>>>>> the topic and try around. This will take some time ... so there
> >>>>>>>> will be
> >>>>>>>> a dealy, but it's not that I do not care or lacking interest, I =
just
> >>>>>>>> first have to sort this out. =20
> >>>>>>> Well, try to build it first without the atomisp driver. This would
> >>>>>>> allow
> >>>>>>> you to see what's going on. =20
> >>>>>> I was able to solve the problem I had with the ramdisk - I had to
> >>>>>> strip the kernel modules, probably the ramdisk file was too big.
> >>>>>>
> >>>>>> It is possible to boot with the atomisp driver, but I can not see =
the
> >>>>>> camera yet - but maybe that's due to missing firmware, as there we=
re
> >>>>>> warnings when I installed the kernel that firmware files are missi=
ng. =20
> >>>> I've added the missing firmware files and now I do not have warnings
> >>>> when I create the ramdisk. Unfortunately it makes no difference - the
> >>>> device does not work yet (dmesg looks the same). =20
> >>>>>> The following I found in dmesg:
> >>>>>>
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.331011] kernel: atomisp_ov2680: module is fr=
om the staging
> >>>>>> directory, the quality is unknown, you have been warned.
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.402456] kernel: ov2680 i2c-OVTI2680:00: gmin=
: initializing
> >>>>>> atomisp module subdev data.PMIC ID 1
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.421113] kernel: acpi OVTI2680:00: Failed to =
find gmin variable
> >>>>>> OVTI2680:00_CamClk
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.433478] kernel: acpi OVTI2680:00: Failed to =
find gmin variable
> >>>>>> OVTI2680:00_ClkSrc
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.443146] kernel: acpi OVTI2680:00: Failed to =
find gmin variable
> >>>>>> OVTI2680:00_CsiPort
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.456677] kernel: acpi OVTI2680:00: Failed to =
find gmin variable
> >>>>>> OVTI2680:00_CsiLanes
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.479411] kernel: ov2680 i2c-OVTI2680:00: supp=
ly V1P8SX not
> >>>>>> found, using dummy regulator
> >>>>>> [=C2=A0=C2=A0=C2=A0 ...
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.510282] kernel: ov2680 i2c-OVTI2680:00: supp=
ly V2P8SX not
> >>>>>> found, using dummy regulator
> >>>>>> [=C2=A0=C2=A0=C2=A0 ...
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.532284] kernel: ov2680 i2c-OVTI2680:00: supp=
ly V1P2A not
> >>>>>> found, using dummy regulator
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.536200] kernel: ov2680 i2c-OVTI2680:00: supp=
ly VPROG4B not
> >>>>>> found, using dummy regulator
> >>>>>> [=C2=A0=C2=A0 ...'
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.592064] kernel: ov2680 i2c-OVTI2680:00: unab=
le to set PMC rate 1
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.623628] kernel: ov2680 i2c-OVTI2680:00: came=
ra pdata: port: 0
> >>>>>> lanes: 1 order: 00000002
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.628258] kernel: ov2680 i2c-OVTI2680:00: sens=
or_revision id =3D
> >>>>>> 0x2680, rev=3D 0
> >>>>>> [=C2=A0=C2=A0=C2=A0 9.636582] kernel: ov2680 i2c-OVTI2680:00: regi=
ster atomisp i2c
> >>>>>> module type 1
> >>>>>>
> >>>>>> The first signs of live :-) ... I'll try to find the firmware files
> >>>>>> to see if it makes a difference. =20
> >>> Atomisp driver uses ACPI to detect the camera configuration. As you
> >>> can see at drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:
> >>>
> >>> 	static const struct acpi_device_id ov2680_acpi_match[] =3D {
> >>> 	        {"XXOV2680"},
> >>> 	        {"OVTI2680"},
> >>> 	        {},
> >>> 	};
> >>> 	MODULE_DEVICE_TABLE(acpi, ov2680_acpi_match);
> >>>
> >>> The regulator data is parsed at
> >>> drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platfor=
m.c:
> >>>
> >>>           if (pmic_id =3D=3D PMIC_REGULATOR) {
> >>>                   gmin_subdevs[i].v1p8_reg =3D regulator_get(dev, "V1=
P8SX");
> >>>                   gmin_subdevs[i].v2p8_reg =3D regulator_get(dev, "V2=
P8SX");
> >>>                   gmin_subdevs[i].v1p2_reg =3D regulator_get(dev, "V1=
P2A");
> >>>                   gmin_subdevs[i].v2p8_vcm_reg =3D regulator_get(dev,=
 "VPROG4B");
> >>>
> >>>                   /* Note: ideally we would initialize v[12]p8_on to =
the
> >>>                    * output of regulator_is_enabled(), but sadly that
> >>>                    * API is broken with the current drivers, returning
> >>>                    * "1" for a regulator that will then emit a
> >>>                    * "unbalanced disable" WARNing if we try to disable
> >>>                    * it.
> >>>                    */
> >>>           }
> >>>
> >>> There are two things that could be the cause of this issue:
> >>>
> >>> 1) Some patch could have broken support for it.
> >>>
> >>> Doing a:
> >>>
> >>> 	git diff a49d25364dfb drivers/staging/media/atomisp/platform/intel-m=
id/atomisp_gmin_platform.c
> >>>
> >>> will allow you to check the changes on this file.
> >>>
> >>> 2) Maybe recent BIOSes may have changed the names of the ACPI variabl=
es.
> >>>
> >>> For instance, from the code, the driver should be seeking for those
> >>> variables for OV2680 (and several others that seem to be common among
> >>> multiple combinations):
> >>>
> >>> 	XXOV2680:00_CsiPort
> >>> 	XXOV2680:00_CsiLanes
> >>> 	XXOV2680:00_CamClk
> >>>
> >>> It would be possible, that, on a modern BIOS, such vars were, for exa=
mple,
> >>> renamed to 'XXOV2680_V2*'. =20
> >> Thank you for the explanations. I've read the article about ACPI and
> >> have now a basic idea what it is.
> >>
> >> I tried to figure out if the ACPI variable names changed ... in the AC=
PI
> >> dump the variables seem to match the code (if I understood correctly).=
 I
> >> tried to scan the firmware file to check if there's a hint regarding a
> >> changed variable:
> >>
> >> $ strings shisp_2401a0_v21.bin | grep 2680
> >> $ strings shisp_2401a0_v21.bin | grep OV =20
> > No, you're looking at the wrong place. This should be at the system
> > board's BIOS, and not at something that the driver would load.
> >
> > Just run (as root):
> >
> > 	# dmidecode
> >
> > and check the name of your board. It should be similar to this:
> >
> > 	...
> > 	System Information
> > 	        Manufacturer: Intel Corporation
> > 	        Product Name: (something)
> >
> > The "(something)" is the board name. The atomisp driver will seek for
> > it. So, you need to patch the driver (using the example I gave) in
> > order for it to look at the right DMI_MATCH() table. Right now,
> > the driver knows only those:
> >
> > 	$ git grep DMI_MATCH drivers/staging/media/atomisp/
> > 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform=
.c:                       DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
> > 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform=
.c:                       DMI_MATCH(DMI_BOARD_NAME, "T100TA"),
> > 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform=
.c:                       DMI_MATCH(DMI_BOARD_NAME, "TABLET"),=09
> > 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform=
.c:                       DMI_MATCH(DMI_BOARD_VERSION, "MRD 7"),
> > 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform=
.c:                       DMI_MATCH(DMI_BOARD_NAME, "ST70408"),
> > 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform=
.c:                       DMI_MATCH(DMI_BOARD_NAME, "VTA0803"),
> >
> > Your asus board should likely use "ASUS", "_ASUS_" or something similar.
> > So, you should take a look on the patch I sent you and modify it to
> > match whatever name dmidecode printed.
> >
> > See for example this patch:
> >
> > 	https://www.spinics.net/lists/linux-media/msg126880.html
> >
> > If it finds the right table, it should end by calling gmin_subdev_add(),
> > with should use DTST table, also from the ACPI table inside the system'=
s BIOS. =20
> Now I understood :-). I've made the modifications as you explained and=20
> indeed the errors regarding
>=20
> OVTI2680:00_CamClk
> OVTI2680:00_ClkSrc
> OVTI2680:00_CsiPort
> OVTI2680:00_CsiLanes
>=20
> are gone.

Great! Could you please submit the exact patch you applied? I'll place=20
it on my experimental tree:

> Now we have the following in dmesg:
>=20
> [=C2=A0=C2=A0=C2=A0 8.815960] kernel: mc: Linux media interface: v0.10
> [=C2=A0=C2=A0=C2=A0 8.858458] kernel: videodev: Linux video capture inter=
face: v2.00
> [=C2=A0=C2=A0=C2=A0 8.876864] kernel: input: Intel HID events as=20
> /devices/pci0000:00/INT33D5:00/input/input16
> [=C2=A0=C2=A0=C2=A0 8.887625] kernel: 8086228A:01: ttyS5 at MMIO 0x91a1f0=
00 (irq =3D 40,=20
> base_baud =3D 2764800) is a 16550A
> [=C2=A0=C2=A0=C2=A0 8.894655] kernel: dw_dmac INTL9C60:01: DesignWare DMA=
 Controller, 8=20
> channels
> [=C2=A0=C2=A0=C2=A0 8.929818] kernel: atomisp_ov2680: module is from the =
staging=20
> directory, the quality is unknown, you have been warned.
> [=C2=A0=C2=A0=C2=A0 8.989630] kernel: ov2680 i2c-OVTI2680:00: gmin: initi=
alizing=20
> atomisp module subdev data.PMIC ID 1
> [=C2=A0=C2=A0=C2=A0 8.989887] kernel: ov2680 i2c-OVTI2680:00: supply V1P8=
SX not found,=20
> using dummy regulator
> [=C2=A0=C2=A0=C2=A0 8.989954] kernel: ov2680 i2c-OVTI2680:00: supply V2P8=
SX not found,=20
> using dummy regulator

Did you apply this patch also?

	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=3Datomisp&id=3D=
898564642042fdd136a16c3ee120a00061c13940

I guess this would get rid of the two above warnings.


> [=C2=A0=C2=A0=C2=A0 8.989977] kernel: ov2680 i2c-OVTI2680:00: supply V1P2=
A not found,=20
> using dummy regulator
> [=C2=A0=C2=A0=C2=A0 8.989998] kernel: ov2680 i2c-OVTI2680:00: supply VPRO=
G4B not found,=20
> using dummy regulator
> [=C2=A0=C2=A0=C2=A0 9.033505] kernel: ov2680 i2c-OVTI2680:00: unable to s=
et PMC rate 1
> [=C2=A0=C2=A0=C2=A0 9.061511] kernel: ov2680 i2c-OVTI2680:00: camera pdat=
a: port: 0=20
> lanes: 1 order: 00000002
> [=C2=A0=C2=A0=C2=A0 9.065178] kernel: ov2680 i2c-OVTI2680:00: sensor_revi=
sion id =3D=20
> 0x2680, rev=3D 0
> [=C2=A0=C2=A0=C2=A0 9.071095] kernel: ov2680 i2c-OVTI2680:00: register at=
omisp i2c=20
> module type 1

We need to double check if everything is ok on the above.

That's said, with the current code, I don't expect ISP2401 to work out
of the box, as the Kernel is set for ISP2400. I'm trying to address
this on my spare time.

> Laurent explained me how to enable internal debug messages. I'll read=20
> more about this to understand how to use it and hope this will give a=20
> more detailed insight.
>=20
>=20
> great to see some progress :-),

Yes!

> thanks and kind regards,
>=20
> Patrik
>=20
>=20
> >
> > Thanks,
> > Mauro =20



Thanks,
Mauro
