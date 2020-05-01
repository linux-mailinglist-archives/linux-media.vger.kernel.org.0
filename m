Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5D21C106E
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 11:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbgEAJiW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 05:38:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:58358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728236AbgEAJiV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 05:38:21 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B903C2076D;
        Fri,  1 May 2020 09:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588325900;
        bh=l0FoOmEc6c2IIXe804SNSZqXZ9M+wy2WUGrWUpz208c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=R9kCbQKw7Mgg5IkynKdCw5hXMhMIJoq6LiLM2uhKDDQSObgeruMD8e7Tvsk7pxEYl
         0CSnHNLLOBYthrnrDeB10Jjzf+ohV4rMOfSN6V6FlRlfnlhCRkem91/T8qtCT6MmAt
         uy1+WgDX7elyf1wQsJEe9+oLJTMf1Wcti/R2N1Rk=
Date:   Fri, 1 May 2020 11:38:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200501113812.7f16b7ca@coco.lan>
In-Reply-To: <1a17ffad-9792-a4ff-519e-a4306e7bf3e1@gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
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
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 1 May 2020 10:54:18 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On 01.05.20 00:25, Mauro Carvalho Chehab wrote:
> > Em Thu, 30 Apr 2020 17:09:48 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> > =20
> >> Am 4/30/2020 um 12:55 PM schrieb Mauro Carvalho Chehab: =20
> >>> Em Thu, 30 Apr 2020 09:56:53 +0200
> >>> Patrik Gfeller<patrik.gfeller@gmail.com>  escreveu:
> >>>    =20
> >>>> For my first test tried to re-compile to module, without the whole
> >>>> kernel. That was a mistake, as I mixed something up, probably it loa=
ded
> >>>> an old version of the module ... to be on the save side the steps I =
used
> >>>> this time (in case we see something unexpected and for my later refe=
rence):
> >>>>
> >>>> $ git log --oneline
> >>>> 4c922df10252 (HEAD -> atomisp, origin/atomisp) media: atomisp2: get =
rid
> >>>> of ia_css_sc_param.h version dependency
> >>>> ...
> >>>>
> >>>> $ make -j4 clean
> >>>> $ make -j4
> >>>> $ sudo make modules_install INSTALL_MOD_STRIP=3D1
> >>>> $ sudo make install =20
> >>> Please try to build from this branch:
> >>>
> >>> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Datomisp_v2
> >>>
> >>> You'll need to setup a new config var there. So, please run this befo=
re
> >>> make clean. So, for building it, you will do:
> >>>
> >>> 	$ ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && make -j module=
s_prepare
> >>> 	$ make -j4 clean && make -j4
> >>> 	$ sudo make modules_install INSTALL_MOD_STRIP=3D1 && sudo make insta=
ll
> >>>
> >>> This won't change the regulator detection, but it should hopefully use
> >>> the ISP2401-specific code, with seems to be needed for your device. =
=20
> >> I've updated to the latest source (git checkout atomisp_v2 && git pull)
> >> and compiled using the instructions above. Compilation worked well, but
> >> the linker had some problems (full log attached):
> >>
> >> ...
> >> ld:
> >> drivers/staging/media/atomisp/pci/css_2401_system/hive_isp_css_2401_sy=
stem_generated/ia_css_isp_states.o:(.data+0x0):
> >> multiple definition of `ia_css_kernel_init_state';
> >> drivers/staging/media/atomisp/pci/css_2401_csi2p_system/hive_isp_css_2=
401_system_csi2p_generated/ia_css_isp_states.o:(.data+0x0):
> >> first defined here
> >> ... =20
> > Ok. That's because there are two "hive" variants. the building system
> > should use either one of them (but not both at the same time).
> >
> > I didn't get the error before because I was just building a module
> > (that speeds up the development). Such errors only happen on a full
> > build.
> >
> > Fixed.
> >
> > As I did a git rebase (in order to have something that we could
> > upstream later), you'll need to use this procedure to update:
> >
> > 	$ git remote update
> > 	$ git reset --hard origin/atomisp_v2
> >
> > There's no need to clean your last build. Just run:
> >
> > 	$ make -j4
> >
> > And it should build fine this time. =20
>=20
> Compiled and linked :-). We get some more output this time:

Good!

>=20
> [=C2=A0=C2=A0=C2=A0 9.120066] kernel: videodev: Linux video capture inter=
face: v2.00
>=20
> [=C2=A0=C2=A0=C2=A0 9.141554] kernel: atomisp_ov2680: module is from the =
staging=20
> directory, the quality is unknown, you have been warned.

Hmm.. your e-mailer is breaking long lines again  :-(

> [=C2=A0=C2=A0=C2=A0 9.175421] kernel: ov2680 i2c-OVTI2680:00: gmin: initi=
alizing=20
> atomisp module subdev data.PMIC ID 1
> [=C2=A0=C2=A0=C2=A0 9.178755] kernel: ov2680 i2c-OVTI2680:00: supply V1P2=
A not found,=20
> using dummy regulator
> [=C2=A0=C2=A0=C2=A0 9.189966] kernel: proc_thermal 0000:00:0b.0: enabling=
 device (0000=20
> -> 0002) =20
> [=C2=A0=C2=A0=C2=A0 9.212704] kernel: ov2680 i2c-OVTI2680:00: supply VPRO=
G4B not found,=20
> using dummy regulator
> [=C2=A0=C2=A0=C2=A0 9.235024] kernel: ov2680 i2c-OVTI2680:00: supply Regu=
lator1p8v not=20
> found, using dummy regulator

I'll check this.

> [=C2=A0=C2=A0=C2=A0 9.235057] kernel: proc_thermal 0000:00:0b.0: Creating=
 sysfs group=20
> for PROC_THERMAL_PCI
> [=C2=A0=C2=A0=C2=A0 9.238185] kernel: ov2680 i2c-OVTI2680:00: supply Regu=
lator2p8v not=20
> found, using dummy regulator
> [=C2=A0=C2=A0=C2=A0 9.337925] kernel: atomisp: module is from the staging=
 directory,=20
> the quality is unknown, you have been warned.
> [=C2=A0=C2=A0=C2=A0 9.404666] kernel: atomisp-isp2 0000:00:03.0: enabling=
 device (0000=20
> -> 0002) =20
> [=C2=A0=C2=A0=C2=A0 9.408680] kernel: atomisp-isp2 0000:00:03.0: ISP HPLL=
 frequency=20
> base =3D 1600 MHz
> [=C2=A0=C2=A0=C2=A0 9.412197] kernel: atomisp-isp2 0000:00:03.0: Unsuppor=
ted=20
> hw_revision 0x2010

This is related to firmware load stuff. The code use those macros:

	#define ATOMISP_HW_REVISION_MASK	0x0000ff00
	#define ATOMISP_HW_REVISION_SHIFT	8
	#define ATOMISP_HW_REVISION_ISP2300	0x00
	#define ATOMISP_HW_REVISION_ISP2400	0x10
	#define ATOMISP_HW_REVISION_ISP2401_LEGACY 0x11
	#define ATOMISP_HW_REVISION_ISP2401	0x20

	#define ATOMISP_HW_STEPPING_MASK	0x000000ff
	#define ATOMISP_HW_STEPPING_A0		0x00
	#define ATOMISP_HW_STEPPING_B0		0x10

According with the above, 0x2010 would mean ISP2401-B0.

The code itself check those macros in order to load the right firmware:

        if (isp->media_dev.hw_revision =3D=3D
            ((ATOMISP_HW_REVISION_ISP2401 << ATOMISP_HW_REVISION_SHIFT)
             | ATOMISP_HW_STEPPING_A0))
                fw_path =3D "shisp_2401a0_v21.bin";

        if (isp->media_dev.hw_revision =3D=3D
            ((ATOMISP_HW_REVISION_ISP2401_LEGACY << ATOMISP_HW_REVISION_SHI=
FT)
             | ATOMISP_HW_STEPPING_A0))
                fw_path =3D "shisp_2401a0_legacy_v21.bin";

        if (isp->media_dev.hw_revision =3D=3D
            ((ATOMISP_HW_REVISION_ISP2400 << ATOMISP_HW_REVISION_SHIFT)
             | ATOMISP_HW_STEPPING_B0))
                fw_path =3D "shisp_2400b0_v21.bin";

        if (!fw_path) {
                dev_err(isp->dev, "Unsupported hw_revision 0x%x\n",
                        isp->media_dev.hw_revision);
                return NULL;
        }

It sounds that we need to add:

        if (isp->media_dev.hw_revision =3D=3D
            ((ATOMISP_HW_REVISION_ISP2401 << ATOMISP_HW_REVISION_SHIFT)
             | ATOMISP_HW_STEPPING_B0))
                fw_path =3D "shisp_2401b0_v21.bin";

Eventually, other changes may be needed, depending on how different is
this B0 revision from A0.

Patch for it pushed. Please notice that it will seek for a firmware
named "shisp_2401b0_v21.bin".

This driver will also check if the firmware version is:

	"irci_ecr - master_20150911_0724"

As far as I know, the firmware is linked to the driver's code.=20
So, supporting a different firmware version will likely require
changes at the driver.

> [=C2=A0=C2=A0=C2=A0 9.416174] kernel: atomisp-isp2: probe of 0000:00:03.0=
 failed with=20
> error -2

That's because it didn't load the firmware.

Thanks,
Mauro
