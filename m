Return-Path: <linux-media+bounces-27614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52811A4FE45
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 690BA188E8D3
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F78B24293B;
	Wed,  5 Mar 2025 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ixRsScHh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B07B2AD2D;
	Wed,  5 Mar 2025 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741176597; cv=none; b=O14U5Y41fnCrUaARD+jn/PnrirOpUH/ypGS0sSCIZBhoMYjLUrYSMSnEfzK3jTa3VtNiWjlzncWz1s+7y9PtMGjoJ2ikNHkT9F+SgN6RTT8Nr+cNwNo78EY8vm4S7u02W3gmSe9xFL/YeZkUBrOwgKEs9xokwAytAt6J2ii2ymI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741176597; c=relaxed/simple;
	bh=6gd3+fI4lj/ZIzPh+LjoQlQsVnXsh9BQTT8BcfKjR2A=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GReyHnYzaBkPY9mbZbvnPl2mXhDfTHC6+POSZffZX/rp+n/JN74rBCkxjARKdYyOAk0wb5rPcpXIR8nUNbsMX/+N7B6r0oHKComGdrYTcSDMiWv2ahcIIJyy49g3TUZkXD/7I2hKC+cJPEJEjc6w3ktGglUqUbz/uJ6FaGM7Rvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ixRsScHh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECE7C605;
	Wed,  5 Mar 2025 13:08:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741176501;
	bh=6gd3+fI4lj/ZIzPh+LjoQlQsVnXsh9BQTT8BcfKjR2A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ixRsScHhTdyDTJbOdzFtOEVypDCRFsg4FZSfm9YriceS3wBX6zHlqvaZtGdlO3FZu
	 hiLZjyOqrUUd3Zgbss409KB1EvXQ+0yy7p8l+DJkK5Hup6DPd61rR+7QIjIMCLSCiY
	 I8mF+aTI6jKAZasiXY+RHb15PK+bYmmWDW6b0f3E=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN3P287MB18296B77503988C14591C67E8BCB2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com> <20250305051442.3716817-5-shravan.chippa@microchip.com> <174116732611.2914008.9738053002324304147@ping.linuxembedded.co.uk> <PH0PR11MB5611988F18EF02394E983AA881CB2@PH0PR11MB5611.namprd11.prod.outlook.com> <PN3P287MB182928F331D4494E423BA3158BCB2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM> <174117178677.2914008.11448984679927360944@ping.linuxembedded.co.uk> <PN3P287MB18296B77503988C14591C67E8BCB2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p resolutions
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org <linux-media@vger.kernel.org>, linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Valentina.FernandezAlanis@microchip.com <valentina.fernandezalanis@microchip.com>, Praveen.Kumar@microchip.com <praveen.kumar@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>, shravan kumar <Shravan.Chippa@microchip.com>
Date: Wed, 05 Mar 2025 12:09:50 +0000
Message-ID: <174117659047.2914008.10640330234349833814@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Tarang Raval (2025-03-05 11:30:57)
> > Quoting Tarang Raval (2025-03-05 10:40:18)
> > > Hi Kieran, Shravan
> > >
> > > > > -----Original Message-----
> > > > > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > > > Sent: Wednesday, March 5, 2025 3:05 PM
> > > > > To: mchehab@kernel.org; sakari.ailus@linux.intel.com; shravan Chi=
ppa -
> > > > > I35088 <Shravan.Chippa@microchip.com>
> > > > > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Co=
nor Dooley
> > > > > - M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis=
 -
> > > > > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > > > > I30718 <Praveen.Kumar@microchip.com>; shravan Chippa - I35088
> > > > > <Shravan.Chippa@microchip.com>
> > > > > Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720=
p and 480p
> > > > > resolutions
> > > > >
> > > > > EXTERNAL EMAIL: Do not click links or open attachments unless you=
 know the
> > > > > content is safe
> > > > >
> > > > > Quoting shravan kumar (2025-03-05 05:14:42)
> > > > > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > > > > >
> > > > > > Added support for 1280x720@30 and 640x480@30 resolutions
> > > > > >
> > > > > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > > > > ---
> > > > > >=EF=BF=BD drivers/media/i2c/imx334.c | 66
> > > > > > ++++++++++++++++++++++++++++++++++++++
> > > > > >=EF=BF=BD 1 file changed, 66 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx=
334.c
> > > > > > index a7c0bd38c9b8..8cd1eecd0143 100644
> > > > > > --- a/drivers/media/i2c/imx334.c
> > > > > > +++ b/drivers/media/i2c/imx334.c
> > > > > > @@ -314,6 +314,46 @@ static const struct imx334_reg
> > > > > > common_mode_regs[] =3D {
> > > > > >=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD {0x3002, 0x00},
> > > > > >=EF=BF=BD };
> > > > > >
> > > > > > +/* Sensor mode registers for 640x480@30fps */ static const str=
uct
> > > > > > +imx334_reg mode_640x480_regs[] =3D {
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x302c=
, 0x70},
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x302d=
, 0x06},
> > > > >
> > > > > These two are a single 16 bit register HTRIMMING_START =3D 1648
> > > > >
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x302e=
, 0x80},
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x302f=
, 0x02},
> > > > >
> > > > > These two are a single 16 bit register HNUM =3D 640
> > > > >
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x3074=
, 0x48},
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x3075=
, 0x07},
> > > > >
> > > > > These two are a single 16 bit (well, 12 bit value) AREA3_ST_ADR_1=
 =3D 1864
> > > > >
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x308e=
, 0x49},
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x308f=
, 0x07},
> > > > >
> > > > > These two are a single 16 bit register AREA3_ST_ADR_2 =3D 1865
> > > > >
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x3076=
, 0xe0},
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x3077=
, 0x01},
> > > > >
> > > > > These two are a single 16 bit register AREA3_WIDTH_1 =3D 480
> > > > >
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x3090=
, 0xe0},
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x3091=
, 0x01},
> > > > >
> > > > > These two are a single 16 bit register AREA3_WIDTH_2 =3D 480
> > > > >
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x3308=
, 0xe0},
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x3309=
, 0x01},
> > > > >
> > > > > These two are a single 16 bit register Y_OUT_SIZE
> > > > >
> > > > > Don't you think
> > > > >=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD { Y_OUT_SIZE, 480 },
> > > > >
> > > > > Is so much more readable and easier to comprehend and maintain?
> > > > >
> > > > >
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x30d8=
, 0x30},
> > > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD {0x30d9=
, 0x0b},
> > > > >
> > > > > These two are a single 16 bit register UNREAD_ED_ADR =3D 2864
> > > > >
> > > > > > +};
> > > > >
> > > > > I'm still sad that we can all know the names of all these registe=
rs and yet this
> > > > > is writing new tables of hex values.
> > > >
> > > > Do you want me use call like bellow API with register names:
> > > > CCI_REG16_LE(0x30d8);
> > > > cci_write();
> > > > cci_multi_reg_write();
> > > > devm_cci_regmap_init_i2c();
> > >
> > > I have made a patch series for this sensor driver's improvement, in w=
hich
> > > I added the V4L2 CCI helper.
> > >
> >=20
> > Has it been posted yet ?
>=20
> Not yet.
>=20
> As mentioned below, I am waiting for this patch series to be applied.
>=20
> Best Regards,
> Tarang
>=20
> > > I am just waiting for this patch series to be applied so I can send my
> > > changes on top of it.
> >=20
> > If the conversion will happen after I'm fine with that - but it will
> > need to be tested by someone with the hardware. Changing to CCI regs can
> > have impacts that are hard to catch unless you really check and re-test
> > the driver - so Shravan is best placed if he is actively working on the
> > sensor.
> >
> > Personally - I would like to see the CCI conversion happen *first* and
> > then Shravan's changes go on top of that ! It would be /far/ more
> > reviewable and readable that way.
> >=20
> > (And we'd have more confidence that Shravan will have tested the full
> > CCI implementation on that version).

Well, knowing that there is already work in place to improve the
readability of the driver - I'm fine seeing these patches merged first -
Shravan - will you be able to test Tarang's work on top ?

--
Kieran


> >
> > --
> > Kieran

