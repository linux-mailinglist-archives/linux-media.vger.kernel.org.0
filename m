Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79FCA1BD080
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 01:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgD1XNo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 19:13:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:44694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbgD1XNo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 19:13:44 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72FD8206A1;
        Tue, 28 Apr 2020 23:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588115623;
        bh=X4Kxtaaht6HaBxe5A3v2ivqiE8aCcwXk2EAmItMMwDg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dKHDf77JREvM2VatD6QxM0Q9Yx+qb69Qn0O7k+kYzGkdW62KqvCSdOhpMKQLlM2wg
         +bCkI6ncVYmsJJqe2oIZKBTDf/Ve9POElXEveu8P4CXZce6DcZDENA1L5Hp8jg2UlK
         FaekW8Pep0zmV/9+X3muUxBuS+l3Y4LxrqfqQqWQ=
Date:   Wed, 29 Apr 2020 01:13:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200429011339.03af3c2a@coco.lan>
In-Reply-To: <d9ec5067-142c-66c9-c412-51ddf38e44f7@gmail.com>
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
        <20200427235027.15cd4e03@coco.lan>
        <d9ec5067-142c-66c9-c412-51ddf38e44f7@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 28 Apr 2020 19:59:28 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On 27.04.20 23:50, Mauro Carvalho Chehab wrote:
> > Em Mon, 27 Apr 2020 20:31:31 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu: =20
> >> On 26.04.20 18:50, Mauro Carvalho Chehab wrote: =20
> >>> No, you're looking at the wrong place. This should be at the system
> >>> board's BIOS, and not at something that the driver would load.
> >>>
> >>> Just run (as root):
> >>>
> >>> 	# dmidecode
> >>>
> >>> and check the name of your board. It should be similar to this:
> >>>
> >>> 	...
> >>> 	System Information
> >>> 	        Manufacturer: Intel Corporation
> >>> 	        Product Name: (something)
> >>>
> >>> The "(something)" is the board name. The atomisp driver will seek for
> >>> it. So, you need to patch the driver (using the example I gave) in
> >>> order for it to look at the right DMI_MATCH() table. Right now,
> >>> the driver knows only those:
> >>>
> >>> 	$ git grep DMI_MATCH drivers/staging/media/atomisp/
> >>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platfo=
rm.c:                       DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
> >>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platfo=
rm.c:                       DMI_MATCH(DMI_BOARD_NAME, "T100TA"),
> >>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platfo=
rm.c:                       DMI_MATCH(DMI_BOARD_NAME, "TABLET"),=09
> >>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platfo=
rm.c:                       DMI_MATCH(DMI_BOARD_VERSION, "MRD 7"),
> >>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platfo=
rm.c:                       DMI_MATCH(DMI_BOARD_NAME, "ST70408"),
> >>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platfo=
rm.c:                       DMI_MATCH(DMI_BOARD_NAME, "VTA0803"),
> >>>
> >>> Your asus board should likely use "ASUS", "_ASUS_" or something simil=
ar.
> >>> So, you should take a look on the patch I sent you and modify it to
> >>> match whatever name dmidecode printed.
> >>>
> >>> See for example this patch:
> >>>
> >>> 	https://www.spinics.net/lists/linux-media/msg126880.html
> >>>
> >>> If it finds the right table, it should end by calling gmin_subdev_add=
(),
> >>> with should use DTST table, also from the ACPI table inside the syste=
m's BIOS. =20
> >> Now I understood :-). I've made the modifications as you explained and
> >> indeed the errors regarding
> >>
> >> OVTI2680:00_CamClk
> >> OVTI2680:00_ClkSrc
> >> OVTI2680:00_CsiPort
> >> OVTI2680:00_CsiLanes
> >>
> >> are gone. =20
> > Great! Could you please submit the exact patch you applied? I'll place
> > it on my experimental tree: =20
>=20
> Here is the patch for the change I made:
>=20
> diff --git=20
> a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.=
c=20
> b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
> index eef7123a586f..081f9be6ec29 100644
> ---=20
> a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
> +++=20
> b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
> @@ -269,6 +269,15 @@ static struct gmin_cfg_var i8880_vars[] =3D {
>  =C2=A0=C2=A0=C2=A0=C2=A0 {},
>  =C2=A0};
>=20
> +static struct gmin_cfg_var asus_vars[] =3D {
> +=C2=A0=C2=A0=C2=A0 {"OVTI2680:00_CsiPort", "0"},
> +=C2=A0=C2=A0=C2=A0 {"OVTI2680:00_CsiLanes", "1"},
> +=C2=A0=C2=A0=C2=A0 {"OVTI2680:00_CsiFmt", "15"},
> +=C2=A0=C2=A0=C2=A0 {"OVTI2680:00_CsiBayer", "0"},
> +=C2=A0=C2=A0=C2=A0 {"OVTI2680:00_CamClk", "1"},
> +=C2=A0=C2=A0=C2=A0 {},
> +};
> +
>  =C2=A0static const struct dmi_system_id gmin_vars[] =3D {
>  =C2=A0=C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .ident =3D "BYT-T FFD8",
> @@ -306,6 +315,13 @@ static const struct dmi_system_id gmin_vars[] =3D {
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .driver_data =3D i8880_vars,
>  =C2=A0=C2=A0=C2=A0=C2=A0 },
> +=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .ident =3D "T101HA",
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .matches =3D {
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 DMI_MATCH(DMI_B=
OARD_NAME, "T101HA"),
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .driver_data =3D asus_vars,
> +=C2=A0=C2=A0=C2=A0 },
>  =C2=A0=C2=A0=C2=A0=C2=A0 {}
>  =C2=A0};

Thanks for testing it. Just applied this patch upstream, together with a
bunch of other cleanup patches.

> >> Now we have the following in dmesg:
> >>
> >> [=C2=A0=C2=A0=C2=A0 8.815960] kernel: mc: Linux media interface: v0.10
> >> [=C2=A0=C2=A0=C2=A0 8.858458] kernel: videodev: Linux video capture in=
terface: v2.00
> >> [=C2=A0=C2=A0=C2=A0 8.876864] kernel: input: Intel HID events as
> >> /devices/pci0000:00/INT33D5:00/input/input16
> >> [=C2=A0=C2=A0=C2=A0 8.887625] kernel: 8086228A:01: ttyS5 at MMIO 0x91a=
1f000 (irq =3D 40,
> >> base_baud =3D 2764800) is a 16550A
> >> [=C2=A0=C2=A0=C2=A0 8.894655] kernel: dw_dmac INTL9C60:01: DesignWare =
DMA Controller, 8
> >> channels
> >> [=C2=A0=C2=A0=C2=A0 8.929818] kernel: atomisp_ov2680: module is from t=
he staging
> >> directory, the quality is unknown, you have been warned.
> >> [=C2=A0=C2=A0=C2=A0 8.989630] kernel: ov2680 i2c-OVTI2680:00: gmin: in=
itializing
> >> atomisp module subdev data.PMIC ID 1
> >> [=C2=A0=C2=A0=C2=A0 8.989887] kernel: ov2680 i2c-OVTI2680:00: supply V=
1P8SX not found,
> >> using dummy regulator
> >> [=C2=A0=C2=A0=C2=A0 8.989954] kernel: ov2680 i2c-OVTI2680:00: supply V=
2P8SX not found,
> >> using dummy regulator =20
> > Did you apply this patch also?
> >
> > 	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=3Datomisp&i=
d=3D898564642042fdd136a16c3ee120a00061c13940
> >
> > I guess this would get rid of the two above warnings.
> > =20
> The patch was already applied when I did the test width the driver - the=
=20
> warnings are also present with it.

Ok. Yet, I found an issue on that patch. Just merged an improvement.

Could you please test it again?

>=20
> But if I read the code correctly this is expected, as we try to get=20
> those regulators in any case - only if we have an error on two of them=20
> we try the "Regulator1p8v" & "Regulator2p8v". As we do not see warnings=20
> for those two regulators I assume this worked.

No. It probably returned a valid "dummy" regulator. That's not what
we want.

There are still some things that could be missing for it to work
properly with ISP2401. I'm trying to do some cleanups in order to
be sure that everything needed for isp2401 will be there.

Thanks,
Mauro
