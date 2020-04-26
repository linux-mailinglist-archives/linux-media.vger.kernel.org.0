Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E011B91DD
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 18:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgDZQuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 12:50:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:41622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgDZQuN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 12:50:13 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F07D2071C;
        Sun, 26 Apr 2020 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587919812;
        bh=mlWi3E4UTLoa4CBbH6JgGV9W/xyUkYo6KhBl+pxe0gk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sfBQ+bWq6FKVrHciEN9OxIbnSDgCjQXjTBg1WL/85bzxfaFa4bk8ZnjhWIjxF74gl
         hrdhWh34pgLkP+/BYFezZMajmjgrURYu3QRjkKJPQouGEJD+SoW5n5h0OM4h11sthx
         Z/DpvoN0MoHMory208qez8N1AtFADjc6AjQs9hfI=
Date:   Sun, 26 Apr 2020 18:50:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200426185007.1954885a@coco.lan>
In-Reply-To: <131a4247-cef3-d651-a0ea-defd32b8bf20@gmail.com>
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
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 26 Apr 2020 13:38:19 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On 25.04.20 13:22, Mauro Carvalho Chehab wrote:
> > Hi Patrik,
> >
> > Em Fri, 24 Apr 2020 12:07:30 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> > =20
> >> On 24.04.20 11:10, Patrik Gfeller wrote: =20
> >>> On 24.04.20 10:52, Patrik Gfeller wrote: =20
> >>>> On 22.04.20 21:13, Mauro Carvalho Chehab wrote: =20
> >>>>> Em Wed, 22 Apr 2020 19:56:56 +0200
> >>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >>>>>    =20
> >>>>>> On 20.04.20 22:47, Mauro Carvalho Chehab wrote: =20
> >>>>>>> Em Mon, 20 Apr 2020 20:27:25 +0200
> >>>>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu: =20
> >>>>>>>> Me again ... sorry to ask such a basic question, but I can't get
> >>>>>>>> your
> >>>>>>>> modified source code. I get the following error:
> >>>>>>>>  =C2=A0 =C2=A0=C2=A0 > git clone https://git.linuxtv.$ sudo make=
 M=3Ddrivers/staging/media/atomisp/ modules_install
> >>>>>>>> org/mchehab/experimental.git/
> >>>>>>>> Cloning into 'experimental'...
> >>>>>>>> warning: adding alternate object store:
> >>>>>>>> https://git.linuxtv.org/git/linux.git/
> >>>>>>>> warning: adding alternate object store:
> >>>>>>>> https://git.linuxtv.org/git/media_tree.git/
> >>>>>>>> warning: adding alternate object store:
> >>>>>>>> https://git.linuxtv.org/git/linux.git/
> >>>>>>>> error: Unable to find fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f u=
nder
> >>>>>>>> https://git.linuxtv.org/mchehab/experimental.git
> >>>>>>>> Cannot obtain needed object fc8670d1f72b746ff3a5fe441f1fca4c4dba=
0e6f
> >>>>>>>> while processing commit 6d80bfc14608f4bb5514b79721d30b486f50c987.
> >>>>>>>> error: fetch failed.
> >>>>>>>>
> >>>>>>>> Do I use the wrong command? =20
> >>>>>>> Better to use git:// url:
> >>>>>>>
> >>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0git clone git://git.linuxtv.org/mchehab/=
experimental.git/ =20
> >>>>>> I was able to download and compile the code. I installed the kernel
> >>>>>> and
> >>>>>> tried to boot; unfortunately it hangs with the message "Loading
> >>>>>> initial
> >>>>>> ramdisk ..." - after I start the old kernel I check kern.log and
> >>>>>> syslog
> >>>>>> - but I do not see entries from the failed boot attempt. I'll read
> >>>>>> into
> >>>>>> the topic and try around. This will take some time ... so there
> >>>>>> will be
> >>>>>> a dealy, but it's not that I do not care or lacking interest, I ju=
st
> >>>>>> first have to sort this out. =20
> >>>>> Well, try to build it first without the atomisp driver. This would
> >>>>> allow
> >>>>> you to see what's going on. =20
> >>>> I was able to solve the problem I had with the ramdisk - I had to
> >>>> strip the kernel modules, probably the ramdisk file was too big.
> >>>>
> >>>> It is possible to boot with the atomisp driver, but I can not see the
> >>>> camera yet - but maybe that's due to missing firmware, as there were
> >>>> warnings when I installed the kernel that firmware files are missing=
. =20
> >> I've added the missing firmware files and now I do not have warnings
> >> when I create the ramdisk. Unfortunately it makes no difference - the
> >> device does not work yet (dmesg looks the same). =20
> >>>> The following I found in dmesg:
> >>>>
> >>>> [=C2=A0=C2=A0=C2=A0 9.331011] kernel: atomisp_ov2680: module is from=
 the staging
> >>>> directory, the quality is unknown, you have been warned.
> >>>> [=C2=A0=C2=A0=C2=A0 9.402456] kernel: ov2680 i2c-OVTI2680:00: gmin: =
initializing
> >>>> atomisp module subdev data.PMIC ID 1
> >>>> [=C2=A0=C2=A0=C2=A0 9.421113] kernel: acpi OVTI2680:00: Failed to fi=
nd gmin variable
> >>>> OVTI2680:00_CamClk
> >>>> [=C2=A0=C2=A0=C2=A0 9.433478] kernel: acpi OVTI2680:00: Failed to fi=
nd gmin variable
> >>>> OVTI2680:00_ClkSrc
> >>>> [=C2=A0=C2=A0=C2=A0 9.443146] kernel: acpi OVTI2680:00: Failed to fi=
nd gmin variable
> >>>> OVTI2680:00_CsiPort
> >>>> [=C2=A0=C2=A0=C2=A0 9.456677] kernel: acpi OVTI2680:00: Failed to fi=
nd gmin variable
> >>>> OVTI2680:00_CsiLanes
> >>>> [=C2=A0=C2=A0=C2=A0 9.479411] kernel: ov2680 i2c-OVTI2680:00: supply=
 V1P8SX not
> >>>> found, using dummy regulator
> >>>> [=C2=A0=C2=A0=C2=A0 ...
> >>>> [=C2=A0=C2=A0=C2=A0 9.510282] kernel: ov2680 i2c-OVTI2680:00: supply=
 V2P8SX not
> >>>> found, using dummy regulator
> >>>> [=C2=A0=C2=A0=C2=A0 ...
> >>>> [=C2=A0=C2=A0=C2=A0 9.532284] kernel: ov2680 i2c-OVTI2680:00: supply=
 V1P2A not
> >>>> found, using dummy regulator
> >>>> [=C2=A0=C2=A0=C2=A0 9.536200] kernel: ov2680 i2c-OVTI2680:00: supply=
 VPROG4B not
> >>>> found, using dummy regulator
> >>>> [=C2=A0=C2=A0 ...'
> >>>> [=C2=A0=C2=A0=C2=A0 9.592064] kernel: ov2680 i2c-OVTI2680:00: unable=
 to set PMC rate 1
> >>>> [=C2=A0=C2=A0=C2=A0 9.623628] kernel: ov2680 i2c-OVTI2680:00: camera=
 pdata: port: 0
> >>>> lanes: 1 order: 00000002
> >>>> [=C2=A0=C2=A0=C2=A0 9.628258] kernel: ov2680 i2c-OVTI2680:00: sensor=
_revision id =3D
> >>>> 0x2680, rev=3D 0
> >>>> [=C2=A0=C2=A0=C2=A0 9.636582] kernel: ov2680 i2c-OVTI2680:00: regist=
er atomisp i2c
> >>>> module type 1
> >>>>
> >>>> The first signs of live :-) ... I'll try to find the firmware files
> >>>> to see if it makes a difference. =20
> > Atomisp driver uses ACPI to detect the camera configuration. As you
> > can see at drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:
> >
> > 	static const struct acpi_device_id ov2680_acpi_match[] =3D {
> > 	        {"XXOV2680"},
> > 	        {"OVTI2680"},
> > 	        {},
> > 	};
> > 	MODULE_DEVICE_TABLE(acpi, ov2680_acpi_match);
> >
> > The regulator data is parsed at
> > drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.=
c:
> >
> >          if (pmic_id =3D=3D PMIC_REGULATOR) {
> >                  gmin_subdevs[i].v1p8_reg =3D regulator_get(dev, "V1P8S=
X");
> >                  gmin_subdevs[i].v2p8_reg =3D regulator_get(dev, "V2P8S=
X");
> >                  gmin_subdevs[i].v1p2_reg =3D regulator_get(dev, "V1P2A=
");
> >                  gmin_subdevs[i].v2p8_vcm_reg =3D regulator_get(dev, "V=
PROG4B");
> >
> >                  /* Note: ideally we would initialize v[12]p8_on to the
> >                   * output of regulator_is_enabled(), but sadly that
> >                   * API is broken with the current drivers, returning
> >                   * "1" for a regulator that will then emit a
> >                   * "unbalanced disable" WARNing if we try to disable
> >                   * it.
> >                   */
> >          }
> >
> > There are two things that could be the cause of this issue:
> >
> > 1) Some patch could have broken support for it.
> >
> > Doing a:
> >
> > 	git diff a49d25364dfb drivers/staging/media/atomisp/platform/intel-mid=
/atomisp_gmin_platform.c
> >
> > will allow you to check the changes on this file.
> >
> > 2) Maybe recent BIOSes may have changed the names of the ACPI variables.
> >
> > For instance, from the code, the driver should be seeking for those
> > variables for OV2680 (and several others that seem to be common among
> > multiple combinations):
> >
> > 	XXOV2680:00_CsiPort
> > 	XXOV2680:00_CsiLanes
> > 	XXOV2680:00_CamClk
> >
> > It would be possible, that, on a modern BIOS, such vars were, for examp=
le,
> > renamed to 'XXOV2680_V2*'. =20
>=20
> Thank you for the explanations. I've read the article about ACPI and=20
> have now a basic idea what it is.
>=20
> I tried to figure out if the ACPI variable names changed ... in the ACPI=
=20
> dump the variables seem to match the code (if I understood correctly). I=
=20
> tried to scan the firmware file to check if there's a hint regarding a=20
> changed variable:
>=20
> $ strings shisp_2401a0_v21.bin | grep 2680
> $ strings shisp_2401a0_v21.bin | grep OV

No, you're looking at the wrong place. This should be at the system=20
board's BIOS, and not at something that the driver would load.

Just run (as root):

	# dmidecode

and check the name of your board. It should be similar to this:

	...
	System Information
	        Manufacturer: Intel Corporation
	        Product Name: (something)

The "(something)" is the board name. The atomisp driver will seek for
it. So, you need to patch the driver (using the example I gave) in
order for it to look at the right DMI_MATCH() table. Right now,
the driver knows only those:

	$ git grep DMI_MATCH drivers/staging/media/atomisp/
	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c: =
                      DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c: =
                      DMI_MATCH(DMI_BOARD_NAME, "T100TA"),
	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c: =
                      DMI_MATCH(DMI_BOARD_NAME, "TABLET"),=09
	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c: =
                      DMI_MATCH(DMI_BOARD_VERSION, "MRD 7"),
	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c: =
                      DMI_MATCH(DMI_BOARD_NAME, "ST70408"),
	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c: =
                      DMI_MATCH(DMI_BOARD_NAME, "VTA0803"),

Your asus board should likely use "ASUS", "_ASUS_" or something similar.
So, you should take a look on the patch I sent you and modify it to
match whatever name dmidecode printed.

See for example this patch:

	https://www.spinics.net/lists/linux-media/msg126880.html

If it finds the right table, it should end by calling gmin_subdev_add(),
with should use DTST table, also from the ACPI table inside the system's BI=
OS.

Thanks,
Mauro
