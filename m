Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726211C246B
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 12:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgEBKAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 06:00:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbgEBKAv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 06:00:51 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF1DF208DB;
        Sat,  2 May 2020 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588413650;
        bh=7K6wUBHRZVrN8jjr1HcvKgZOTYea2LyUh61XFCwwtTE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pqwJJKHE0ltGjYlTQbz+unXlMmXF/0A55dXbBeCkoZTzkZYzasnaeUhRqTw4MqjPf
         LFjSSava74w/V5Hj/J6HlM6K88FtHiv8l+ixQvzFVL+IVfG86OyFcraBUjvncshB1s
         rfgc5voOxaKFpcpDMT7tAXWg8jnHoajQU7dZr/lI=
Date:   Sat, 2 May 2020 12:00:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200502120046.29918306@coco.lan>
In-Reply-To: <0241bafc-d392-3848-852a-b9ebca1664a0@gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
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
        <20200502101542.2972010a@ASUS>
        <0241bafc-d392-3848-852a-b9ebca1664a0@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 2 May 2020 11:20:04 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On 02.05.20 10:15, Patrik Gfeller wrote:
> > On Fri, 1 May 2020 21:30:23 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > =20
> >> Em Fri, 1 May 2020 19:31:05 +0200
> >> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >> =20
> >>> On Fri, 1 May 2020 11:38:12 +0200
> >>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >>>
> >>> [...]=20
> >>> =20
> >>>> Hmm.. your e-mailer is breaking long lines again  :-(   =20
> >>> Ok - then the configuration option I used is not reliable. I've now s=
witched to Claws Mail; I hope this resolves the problem. =20
> >> Yeah, that's what I use here. I actually manually break my lines
> >> when I'm closed to the 80 column, as most people do on mailing
> >> lists (some people read those upstream MLs with emacs).
> >> =20
> Sorry - I use my old mailer for this message - as I suddenly do not see
> sent messages anymore
> in claws and can this not follow up on my last sent mail. I'll try to
> fix this and use claws again.
>=20
> >>>>    =20
> >>>>> [=C2=A0=C2=A0=C2=A0 9.175421] kernel: ov2680 i2c-OVTI2680:00: gmin:=
 initializing atomisp module subdev data.PMIC ID 1
> >>>>> [=C2=A0=C2=A0=C2=A0 9.178755] kernel: ov2680 i2c-OVTI2680:00: suppl=
y V1P2A not
> >>>>> found, using dummy regulator [=C2=A0=C2=A0=C2=A0 9.189966] kernel: =
proc_thermal
> >>>>> 0000:00:0b.0: enabling device (0000 -> 0002)   =20
> >>>>> [=C2=A0=C2=A0=C2=A0 9.212704] kernel: ov2680 i2c-OVTI2680:00: suppl=
y VPROG4B not
> >>>>> found, using dummy regulator
> >>>>> [=C2=A0=C2=A0=C2=A0 9.235024] kernel: ov2680 i2c-OVTI2680:00: suppl=
y Regulator1p8v
> >>>>> not found, using dummy regulator     =20
> >>>> I'll check this.
> >>>>    =20
> >>>>> [=C2=A0=C2=A0=C2=A0 9.235057] kernel: proc_thermal 0000:00:0b.0: Cr=
eating sysfs
> >>>>> group for PROC_THERMAL_PCI =20
> >>>> [...]
> >>>>
> >>>> It sounds that we need to add:
> >>>>
> >>>>         if (isp->media_dev.hw_revision =3D=3D
> >>>>             ((ATOMISP_HW_REVISION_ISP2401 <<
> >>>> ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0))
> >>>>                 fw_path =3D "shisp_2401b0_v21.bin";
> >>>>
> >>>> Eventually, other changes may be needed, depending on how different =
is
> >>>> this B0 revision from A0.
> >>>>
> >>>> Patch for it pushed. Please notice that it will seek for a firmware
> >>>> named "shisp_2401b0_v21.bin".   =20
> >>> Unfortunately I was not able to find "shisp_2401b0_v21.bin";  =20
> >> Yeah, I also searched for it. Was unable to find it. I suspect that the
> >> B0 version could be newer than the atomisp driver that got merged.
> >> =20
> >>> so I changed the values in the code and tried with "shisp_2401a0_v21.=
bin, irci_master_20140707_0622". =20
> >> Yeah, I suspect that this is the next best thing.
> >> =20
> >>> I contacted Intel to see if they are willing to provide the newer fir=
mware. Alan Cox mentioned in a commit message, that the drivers can be extr=
acted from an "upgrade kit":
> >>>
> >>>    "... The firmware files will usually be found in /etc/firmware on =
an Android
> >>>    device but can also be extracted from the upgrade kit if you've ma=
naged
> >>>    to lose them somehow. ..."
> >>>
> >>> But I did not yet figure out what this kit is. =20
> >> The firmware should be there somewhere at the BSP for Android
> >> (for hardware that came originally with it). It should also be
> >> present on Windows and other OSes that support, although the
> >> version could be different.
> >> =20
> >>> There is also an open support request with Intel to get some hardware=
/firmware documentation. But this will be difficult (as expected by you and=
 Laurent) - their process only supports requests from companies that sign a=
n NDA. But I opened a ticket as well to see if there's a way to get access =
to their developer network someway, or if it is possible that they send onl=
y the documents required.  =20
> >> Yeah, I suspect that they would open this only for companies
> >> with signed NDAs.
> >> =20
> >>> I also sent an Mail to the original authors of the drivers at Intel. =
Two of them no longer work there (mail was rejected), but one went trough. =
Let's see... =20
> >> Ok. Btw, there is a driver for Atomisp on an yocto tree:
> >>
> >> 	https://github.com/intel-aero/meta-intel-aero.git
> >>
> >> It got removed back in 2018, but if you checkout this changeset:
> >>
> >> 	Merge: db1df368eb58 08f476112708
> >> 	Author: Lucas De Marchi <lucas.demarchi@intel.com>
> >> 	Date:   Tue Apr 4 11:51:42 2017 -0700
> >>
> >> 	    Merge pull request #70 from zehortigoza/jam
> >>      =20
> > Cool, the code might give additional information. I've also send a
> > request regarding the firmware and HW documentation to the author and
> > the engineers that signed the patch. The firmware in the patch has a
> > different version string and the size is surprisingly a few MB bigger
> > than the one I used for the first experiment. I'll give that one a try
> > as well.
> > =20
> >> You would be able to see it. Unfortunately, the driver there
> >> also came with shisp_2401a0_v21.bin.
> >>
> >> The driver there forces this specific version, disabling the=20
> >> firmware version checking:
> >>
> >> recipes-kernel/linux/linux-yocto/0013-temp-atomisp-support.patch:+ccfl=
ags-y +=3D -DATOMISP_POSTFIX=3D\"css2401a0_v21\" -DATOMISP_FWNAME=3D\"shisp=
_2401a0_v21.bin\" -DISP2401 -DISP2401_NEW_INPUT_SYSTEM
> >>
> >> I also found a firmware for some other Asus Transformer device:
> >>
> >> 	https://github.com/jfwells/linux-asus-t100ta/tree/master/webcam/firmw=
are
> >> =20
> > It looks a this firmware is for the 2400 variant; I could also not
> > extract the irci version string. Thus I'll not try them for the moment
> > to perform experiments. =20
>=20
> I've a problem with the build; I've pulled the latest changes from the
> repository - and at least some
> of your changes are lost. I also checked via the web page and there I
> can also not see them
> anymore:
>=20
> https://git.linuxtv.org/mchehab/experimental.git/tree/drivers/staging/med=
ia/atomisp/atomisp_v4l2.c?h=3Datomisp_v2
>=20
> const struct firmware *
> atomisp_load_firmware(struct atomisp_device *isp)
> {
> =C2=A0=C2=A0=C2=A0 const struct firmware *fw;
> =C2=A0=C2=A0=C2=A0 int rc;
> =C2=A0=C2=A0=C2=A0 char *fw_path =3D NULL;
>=20
> =C2=A0=C2=A0=C2=A0 if (skip_fwload)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return NULL;
>=20
> =C2=A0=C2=A0=C2=A0 if (isp->media_dev.hw_revision =3D=3D
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ((ATOMISP_HW_REVISION_ISP2401 << AT=
OMISP_HW_REVISION_SHIFT)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 | ATOMISP_HW_STEPPING_A0))
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 fw_path =3D "shisp_2401a0_v21.bin";
>=20
> =C2=A0=C2=A0=C2=A0 if (isp->media_dev.hw_revision =3D=3D
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ((ATOMISP_HW_REVISION_ISP2401_LEGAC=
Y << ATOMISP_HW_REVISION_SHIFT)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 | ATOMISP_HW_STEPPING_A0))
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 fw_path =3D "shisp_2401a0_legacy_v2=
1.bin";
>=20
> =C2=A0=C2=A0=C2=A0 if (isp->media_dev.hw_revision =3D=3D
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ((ATOMISP_HW_REVISION_ISP2400 << AT=
OMISP_HW_REVISION_SHIFT)
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 | ATOMISP_HW_STEPPING_B0))
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 fw_path =3D "shisp_2400b0_v21.bin";
>=20
> =C2=A0=C2=A0=C2=A0 if (!fw_path) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 dev_err(isp->dev, "Unsupported hw_r=
evision 0x%x\n",
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 isp->media_dev.h=
w_revision);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return NULL;
> =C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0 rc =3D request_firmware(&fw, fw_path, isp->dev);
> =C2=A0=C2=A0=C2=A0 if (rc) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 dev_err(isp->dev,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "atomisp: Error =
%d while requesting firmware %s\n",
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 rc, fw_path);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return NULL;
> =C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0 return fw;
> }
>=20
> It also does not build properly anymore (uses the old API again). Do you
> know what
> I'm doing wrong here?

My fault, sorry. There were something wrong on my .git/config, making
it to push a wrong branch to my experimental tree. Just did a forced
push. You should be able to build the atomisp driver there again.

Just be sure to do something like:

	$ git remote update && git reset --HARD origin/atomisp_v2

(This will get rid of any other patch or changes you might have
 applied)

Regards,
Mauro
