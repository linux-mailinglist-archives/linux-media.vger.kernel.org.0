Return-Path: <linux-media+bounces-27601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8811FA4FCA7
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9345D174313
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4353241662;
	Wed,  5 Mar 2025 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iHhzk0V3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED1B2405F9;
	Wed,  5 Mar 2025 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171549; cv=none; b=Qf0L+QL1kmmQ2ofcJjB0gMHJx21TCHtn/y1C5fYGc6P03KW7k2GWbzbc6UjXk9QLTM9LnDbxxL+EFnxA+khzJG4ciCle+SAwsXWATTkSGSBcYCoeFfuG7BVKbfaL9t68XRlLKchQACSLIVGGoyNBKMgnnpxZ7y0BrmQ1NNL0MrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171549; c=relaxed/simple;
	bh=pqY7ngG+xfP4DHF0WbzMRjcJ1/r2Sw4WTQJ3GP7+qoo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZfAnyyBWx3rJhkzDcatRDvpzMQG6b+d2eFkeMSO6iwZ42jleJmp9yRsTp/DEZfPQnYXmA5qSLD/53pduqtR+ZyTQcy8y7vxoS5AXKu574sMBiJWM1Jg+Bh4dqAjeF+aWw8qqzeCb3tZBgIayZOxpTK67MbP0GycQK5ubu6XVvzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iHhzk0V3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8564A605;
	Wed,  5 Mar 2025 11:44:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741171452;
	bh=pqY7ngG+xfP4DHF0WbzMRjcJ1/r2Sw4WTQJ3GP7+qoo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iHhzk0V32A+vQ0dwDNonxx8aQ3zBTFRER6gLYPhpMrnctpv4gwTEP5vqGUmYX0xfa
	 ijAuq3X6/b+lwp3hBgfRWA78wGJ4e5aQC8k7s79CpVqBWAajGBq9jiLApac6u4cWKV
	 lV96cTrWO3204IZG7IcK5pNdofEVShx1tdxAV4Wg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PH0PR11MB5611988F18EF02394E983AA881CB2@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com> <20250305051442.3716817-5-shravan.chippa@microchip.com> <174116732611.2914008.9738053002324304147@ping.linuxembedded.co.uk> <PH0PR11MB5611988F18EF02394E983AA881CB2@PH0PR11MB5611.namprd11.prod.outlook.com>
Subject: RE: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p resolutions
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com, Praveen.Kumar@microchip.com
To: Shravan.Chippa@microchip.com, mchehab@kernel.org, sakari.ailus@linux.intel.com
Date: Wed, 05 Mar 2025 10:45:42 +0000
Message-ID: <174117154242.2914008.10875320688605396953@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Shravan.Chippa@microchip.com (2025-03-05 10:22:12)
> Hi Kieran
>=20
> > -----Original Message-----
> > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Sent: Wednesday, March 5, 2025 3:05 PM
> > To: mchehab@kernel.org; sakari.ailus@linux.intel.com; shravan Chippa -
> > I35088 <Shravan.Chippa@microchip.com>
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Do=
oley
> > - M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > I30718 <Praveen.Kumar@microchip.com>; shravan Chippa - I35088
> > <Shravan.Chippa@microchip.com>
> > Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and =
480p
> > resolutions
> >=20
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the
> > content is safe
> >=20
> > Quoting shravan kumar (2025-03-05 05:14:42)
> > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > >
> > > Added support for 1280x720@30 and 640x480@30 resolutions
> > >
> > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > ---
> > >  drivers/media/i2c/imx334.c | 66
> > > ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 66 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > index a7c0bd38c9b8..8cd1eecd0143 100644
> > > --- a/drivers/media/i2c/imx334.c
> > > +++ b/drivers/media/i2c/imx334.c
> > > @@ -314,6 +314,46 @@ static const struct imx334_reg
> > common_mode_regs[] =3D {
> > >         {0x3002, 0x00},
> > >  };
> > >
> > > +/* Sensor mode registers for 640x480@30fps */ static const struct
> > > +imx334_reg mode_640x480_regs[] =3D {
> > > +       {0x302c, 0x70},
> > > +       {0x302d, 0x06},
> >=20
> > These two are a single 16 bit register HTRIMMING_START =3D 1648
> >=20
> > > +       {0x302e, 0x80},
> > > +       {0x302f, 0x02},
> >=20
> > These two are a single 16 bit register HNUM =3D 640
> >=20
> > > +       {0x3074, 0x48},
> > > +       {0x3075, 0x07},
> >=20
> > These two are a single 16 bit (well, 12 bit value) AREA3_ST_ADR_1 =3D 1=
864
> >=20
> > > +       {0x308e, 0x49},
> > > +       {0x308f, 0x07},
> >=20
> > These two are a single 16 bit register AREA3_ST_ADR_2 =3D 1865
> >=20
> > > +       {0x3076, 0xe0},
> > > +       {0x3077, 0x01},
> >=20
> > These two are a single 16 bit register AREA3_WIDTH_1 =3D 480
> >=20
> > > +       {0x3090, 0xe0},
> > > +       {0x3091, 0x01},
> >=20
> > These two are a single 16 bit register AREA3_WIDTH_2 =3D 480
> >=20
> > > +       {0x3308, 0xe0},
> > > +       {0x3309, 0x01},
> >=20
> > These two are a single 16 bit register Y_OUT_SIZE
> >=20
> > Don't you think
> >         { Y_OUT_SIZE, 480 },
> >=20
> > Is so much more readable and easier to comprehend and maintain?
> >=20
> >=20
> > > +       {0x30d8, 0x30},
> > > +       {0x30d9, 0x0b},
> >=20
> > These two are a single 16 bit register UNREAD_ED_ADR =3D 2864
> >=20
> > > +};
> >=20
> > I'm still sad that we can all know the names of all these registers and=
 yet this
> > is writing new tables of hex values.
>=20
> Do you want me use call like bellow API with register names:
> CCI_REG16_LE(0x30d8);
> cci_write();
> cci_multi_reg_write();
> devm_cci_regmap_init_i2c();
=20

Yes please, I would want that very much. I'm not very good at reading
and storing hex values in my head! That's why I broke down the above
registers to strings and decimal values.


The discussions at
https://lore.kernel.org/all/PH0PR11MB5611FD22CF6E12F7226FA9C081E12@PH0PR11M=
B5611.namprd11.prod.outlook.com/
reports the full datasheet, and I stated:


> > > This is an enormous amount of duplicated data that could be factored
> > > out.
> > >
> > > These are also /very/ common against the existing mode register
> > > tables too.
> > >
> > > I think several things need to happen in this driver:
> > >
> > >  1. It should be converted to use the CCI helpers.
> > >  2. Whereever identifiable, the register names should be used
> > > instead of
> > >     just the addresses.
> > >  3. The common factors of these tables should be de-duplicated.
> > >
> > > In your additions you only have differences in the following
> > > registers from those entire tables:

You replied with

> >
> > I will try to optimize camera resolution array register value usage by
> > writing common register array values.

which you have done (point 3), and is great progress in the series.

Further down in the thread I stated:


> > >  4. And ideally - the differences which determine the modes should
> > > be
> > >     factored out to calculations so that we are not writing out
> > > large
> > >     tables just to write a parameterised frame size.
> > >
> > >
> > > I would beleive that at least steps 1 and 3 would be achievable, 2
> > > and 4 would depend upon access to the datasheet.
> > >


I still believe steps 1 is important to this development. You have done
step 3 I think. And now both step 2 and (later) step 4 are possible as we
have the datasheet.

--
Kieran


>=20
> Thanks,
> Shravan
> >=20
> >=20
> > --
> > Kieran
> >=20
> >=20
> > > +
> > > +/* Sensor mode registers for 1280x720@30fps */ static const struct
> > > +imx334_reg mode_1280x720_regs[] =3D {
> > > +       {0x302c, 0x30},
> > > +       {0x302d, 0x05},
> > > +       {0x302e, 0x00},
> > > +       {0x302f, 0x05},
> > > +       {0x3074, 0x84},
> > > +       {0x3075, 0x03},
> > > +       {0x308e, 0x85},
> > > +       {0x308f, 0x03},
> > > +       {0x3076, 0xd0},
> > > +       {0x3077, 0x02},
> > > +       {0x3090, 0xd0},
> > > +       {0x3091, 0x02},
> > > +       {0x3308, 0xd0},
> > > +       {0x3309, 0x02},
> > > +       {0x30d8, 0x30},
> > > +       {0x30d9, 0x0b},
> > > +};
> > > +
> > >  /* Sensor mode registers for 1920x1080@30fps */  static const struct
> > > imx334_reg mode_1920x1080_regs[] =3D {
> > >         {0x302c, 0xf0},
> > > @@ -433,6 +473,32 @@ static const struct imx334_mode
> > supported_modes[] =3D {
> > >                         .num_of_regs =3D ARRAY_SIZE(mode_1920x1080_re=
gs),
> > >                         .regs =3D mode_1920x1080_regs,
> > >                 },
> > > +       }, {
> > > +               .width =3D 1280,
> > > +               .height =3D 720,
> > > +               .hblank =3D 2480,
> > > +               .vblank =3D 1170,
> > > +               .vblank_min =3D 45,
> > > +               .vblank_max =3D 132840,
> > > +               .pclk =3D 297000000,
> > > +               .link_freq_idx =3D 1,
> > > +               .reg_list =3D {
> > > +                       .num_of_regs =3D ARRAY_SIZE(mode_1280x720_reg=
s),
> > > +                       .regs =3D mode_1280x720_regs,
> > > +               },
> > > +       }, {
> > > +               .width =3D 640,
> > > +               .height =3D 480,
> > > +               .hblank =3D 2480,
> > > +               .vblank =3D 1170,
> > > +               .vblank_min =3D 45,
> > > +               .vblank_max =3D 132840,
> > > +               .pclk =3D 297000000,
> > > +               .link_freq_idx =3D 1,
> > > +               .reg_list =3D {
> > > +                       .num_of_regs =3D ARRAY_SIZE(mode_640x480_regs=
),
> > > +                       .regs =3D mode_640x480_regs,
> > > +               },
> > >         },
> > >  };
> > >
> > > --
> > > 2.34.1
> > >

