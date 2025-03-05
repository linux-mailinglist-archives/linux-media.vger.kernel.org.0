Return-Path: <linux-media+bounces-27615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9FBA4FE74
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F135C7A7E13
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A272245016;
	Wed,  5 Mar 2025 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F3qXpfqX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3481DC9AA;
	Wed,  5 Mar 2025 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741177021; cv=none; b=CTzxkNpT06qwiB1PQ1rokWoLIQDVJfwW9zFO3c1rUIQsEeCbBIEq3SrSxDDJcXends0dDsWAVqwrE/IJhWfJTQYf6lrBhSNiVT39D77+S+kIzEVPRW9P2d7EKjq13uKtLwGWAklC4E7C2xVx3o6iXrgFFyr5rlkwnoduVucUC7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741177021; c=relaxed/simple;
	bh=AIsTcl/z/wbI9CQAPm2/hrIV+cSeU1yrt7eLjKLN+P0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=BnLu3xuzfx5iQw56rC/WpcjEbCY5VvgP1/+C84NOFBxFkJ9jT0LyGjtEQnpMO5ofwC8s4Wsmq3H1+z1xD4oPVwENKuGWVe5ec5DZdpSBPAq8SWKKwhuhJU0XS76GrwRzOIhXXMka0p5J510AOt1yjsalNNWaOClDezPM4rg9Lqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F3qXpfqX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72DA5605;
	Wed,  5 Mar 2025 13:15:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741176925;
	bh=AIsTcl/z/wbI9CQAPm2/hrIV+cSeU1yrt7eLjKLN+P0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=F3qXpfqXn95rATZloQ1EVBgYwsHcuA85rEQdcEaj2owY9GEV68jy2/Pj2Q5POpkcs
	 JJZR61XcySz3zt+S9m0GVJH+3aiuourmLjKlfFa2xhzvBhwHLYvCcx8qR/zkZAnV2D
	 gdC112k6G3phZd16/xaE30O3ceEhM5MmstzDNwzo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Z8g6nWDe2cjumixt@kekkonen.localdomain>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com> <20250305051442.3716817-5-shravan.chippa@microchip.com> <174116732611.2914008.9738053002324304147@ping.linuxembedded.co.uk> <PH0PR11MB5611988F18EF02394E983AA881CB2@PH0PR11MB5611.namprd11.prod.outlook.com> <174117154242.2914008.10875320688605396953@ping.linuxembedded.co.uk> <Z8g6nWDe2cjumixt@kekkonen.localdomain>
Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p resolutions
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Shravan.Chippa@microchip.com, mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com, Praveen.Kumar@microchip.com
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 05 Mar 2025 12:16:55 +0000
Message-ID: <174117701537.2914008.10570966567213022443@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Sakari Ailus (2025-03-05 11:50:53)
> Hi Kieran, Shravan,
>=20
> On Wed, Mar 05, 2025 at 10:45:42AM +0000, Kieran Bingham wrote:
> > Quoting Shravan.Chippa@microchip.com (2025-03-05 10:22:12)
> > > Hi Kieran
> > >=20
> > > > -----Original Message-----
> > > > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > > Sent: Wednesday, March 5, 2025 3:05 PM
> > > > To: mchehab@kernel.org; sakari.ailus@linux.intel.com; shravan Chipp=
a -
> > > > I35088 <Shravan.Chippa@microchip.com>
> > > > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Cono=
r Dooley
> > > > - M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > > > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > > > I30718 <Praveen.Kumar@microchip.com>; shravan Chippa - I35088
> > > > <Shravan.Chippa@microchip.com>
> > > > Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p =
and 480p
> > > > resolutions
> > > >=20
> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you k=
now the
> > > > content is safe
> > > >=20
> > > > Quoting shravan kumar (2025-03-05 05:14:42)
> > > > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > > > >
> > > > > Added support for 1280x720@30 and 640x480@30 resolutions
> > > > >
> > > > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > > > ---
> > > > >  drivers/media/i2c/imx334.c | 66
> > > > > ++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 66 insertions(+)
> > > > >
> > > > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx33=
4.c
> > > > > index a7c0bd38c9b8..8cd1eecd0143 100644
> > > > > --- a/drivers/media/i2c/imx334.c
> > > > > +++ b/drivers/media/i2c/imx334.c
> > > > > @@ -314,6 +314,46 @@ static const struct imx334_reg
> > > > common_mode_regs[] =3D {
> > > > >         {0x3002, 0x00},
> > > > >  };
> > > > >
> > > > > +/* Sensor mode registers for 640x480@30fps */ static const struct
> > > > > +imx334_reg mode_640x480_regs[] =3D {
> > > > > +       {0x302c, 0x70},
> > > > > +       {0x302d, 0x06},
> > > >=20
> > > > These two are a single 16 bit register HTRIMMING_START =3D 1648
> > > >=20
> > > > > +       {0x302e, 0x80},
> > > > > +       {0x302f, 0x02},
> > > >=20
> > > > These two are a single 16 bit register HNUM =3D 640
> > > >=20
> > > > > +       {0x3074, 0x48},
> > > > > +       {0x3075, 0x07},
> > > >=20
> > > > These two are a single 16 bit (well, 12 bit value) AREA3_ST_ADR_1 =
=3D 1864
> > > >=20
> > > > > +       {0x308e, 0x49},
> > > > > +       {0x308f, 0x07},
> > > >=20
> > > > These two are a single 16 bit register AREA3_ST_ADR_2 =3D 1865
> > > >=20
> > > > > +       {0x3076, 0xe0},
> > > > > +       {0x3077, 0x01},
> > > >=20
> > > > These two are a single 16 bit register AREA3_WIDTH_1 =3D 480
> > > >=20
> > > > > +       {0x3090, 0xe0},
> > > > > +       {0x3091, 0x01},
> > > >=20
> > > > These two are a single 16 bit register AREA3_WIDTH_2 =3D 480
> > > >=20
> > > > > +       {0x3308, 0xe0},
> > > > > +       {0x3309, 0x01},
> > > >=20
> > > > These two are a single 16 bit register Y_OUT_SIZE
> > > >=20
> > > > Don't you think
> > > >         { Y_OUT_SIZE, 480 },
> > > >=20
> > > > Is so much more readable and easier to comprehend and maintain?
> > > >=20
> > > >=20
> > > > > +       {0x30d8, 0x30},
> > > > > +       {0x30d9, 0x0b},
> > > >=20
> > > > These two are a single 16 bit register UNREAD_ED_ADR =3D 2864
> > > >=20
> > > > > +};
> > > >=20
> > > > I'm still sad that we can all know the names of all these registers=
 and yet this
> > > > is writing new tables of hex values.
> > >=20
> > > Do you want me use call like bellow API with register names:
> > > CCI_REG16_LE(0x30d8);
> > > cci_write();
> > > cci_multi_reg_write();
> > > devm_cci_regmap_init_i2c();
> > =20
> >=20
> > Yes please, I would want that very much. I'm not very good at reading
> > and storing hex values in my head! That's why I broke down the above
> > registers to strings and decimal values.
>=20
> I agree, it'd be good to do these while changing the driver now. I think =
it
> could be done after adding the new modes, now that the patches already
> exist.

That's ok with me! Either way I'm happy to see the drivers are getting
cleaned up!

>=20
> >=20
> >=20
> > The discussions at
> > https://lore.kernel.org/all/PH0PR11MB5611FD22CF6E12F7226FA9C081E12@PH0P=
R11MB5611.namprd11.prod.outlook.com/
> > reports the full datasheet, and I stated:
> >=20
> >=20
> > > > > This is an enormous amount of duplicated data that could be facto=
red
> > > > > out.
> > > > >
> > > > > These are also /very/ common against the existing mode register
> > > > > tables too.
> > > > >
> > > > > I think several things need to happen in this driver:
> > > > >
> > > > >  1. It should be converted to use the CCI helpers.
> > > > >  2. Whereever identifiable, the register names should be used
> > > > > instead of
> > > > >     just the addresses.
> > > > >  3. The common factors of these tables should be de-duplicated.
> > > > >
> > > > > In your additions you only have differences in the following
> > > > > registers from those entire tables:
> >=20
> > You replied with
> >=20
> > > >
> > > > I will try to optimize camera resolution array register value usage=
 by
> > > > writing common register array values.
> >=20
> > which you have done (point 3), and is great progress in the series.
> >=20
> > Further down in the thread I stated:
> >=20
> >=20
> > > > >  4. And ideally - the differences which determine the modes should
> > > > > be
> > > > >     factored out to calculations so that we are not writing out
> > > > > large
> > > > >     tables just to write a parameterised frame size.
> > > > >
> > > > >
> > > > > I would beleive that at least steps 1 and 3 would be achievable, 2
> > > > > and 4 would depend upon access to the datasheet.
> > > > >
> >=20
> >=20
> > I still believe steps 1 is important to this development. You have done
> > step 3 I think. And now both step 2 and (later) step 4 are possible as =
we
> > have the datasheet.
>=20
> In this case the datasheet doesn't appear to be documenting the PLL.

:-(

But at least we will have enough to handle all the vmax/and cropping
more directly.

--
Kieran


>=20
> --=20
> Regards,
>=20
> Sakari Ailus

