Return-Path: <linux-media+bounces-38503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6DB12B8F
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 19:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F15C53B4011
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 17:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A581F287247;
	Sat, 26 Jul 2025 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kojCstoE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747552030A;
	Sat, 26 Jul 2025 17:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753549867; cv=none; b=rdV+FFB7+XmuxlBM0yBXvh3QUewzMXoGovRRtPj86l4n9MvYZadFba+Zl3zXtah/5tXjC/Tg1nUkFJU7zaZPgfR7P6PYTaxCWahuQs0wPd92eHD7dRXS/GYl1eR2QllV1WztNG2jS8jIP5XqFkiAhGA7J0UeZKWBQp9fCo7TY60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753549867; c=relaxed/simple;
	bh=pFMOrccg41HjE55/iV3fdWMoGK7ESg+Ni1DsurkdBfs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lkmw0RhgJq4hxRZbuuodXclGoxDw+PkytE8YiSFyT4u/sctBALIxdqnLY4I8gg3Kgv8U8T5vQVYr3otn3NLutgU8ozGe94fxfEW9BTrSaEvXawGy9mMkFax0U2cIn9TFemn2y9WKKbAJ5HAXDLKp3Qftr/VvsxQMHjNe7fFHSIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kojCstoE reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A489D4A4;
	Sat, 26 Jul 2025 19:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753549813;
	bh=pFMOrccg41HjE55/iV3fdWMoGK7ESg+Ni1DsurkdBfs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kojCstoEKXNU6sZt+edT1cIYUmuaGwHKdT32Xo1ZaQltBduoNY2nCVPj/zhSOsL3p
	 Z/YuXiSwCZQTWiGZtj5n+R22TD7W1tMA88NGMMiqNtOI0ShVyLeiyo1i6kzDDrnJzw
	 a4N6KokTpI1ObIw5tHioSvdaU8CtlmEVoZvnRBEM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN3P287MB3519055FE42890F5F577B51BFF58A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250724104711.18764-1-hardevsinh.palaniya@siliconsignals.io> <20250724104711.18764-3-hardevsinh.palaniya@siliconsignals.io> <aIKi1BkNzNvsf5Tr@smile.fi.intel.com> <PN3P287MB35190A4AEE4C8D98142E7B6AFF59A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM> <175345442477.2567018.13588829522231689027@ping.linuxembedded.co.uk> <PN3P287MB3519055FE42890F5F577B51BFF58A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v5 2/2] media: i2c: add ov2735 image sensor driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com <laurent.pinchart@ideasonboard.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org <linux-media@vger.kernel.org>,
	devicetree@vger.kernel.org <"d evicetree"@vger.kernel.org>,
	linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Date: Sat, 26 Jul 2025 18:10:50 +0100
Message-ID: <175354985094.1609430.13921131213777523371@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Hardevsinh Palaniya (2025-07-26 07:06:05)
> > Quoting Hardevsinh Palaniya (2025-07-25 06:55:23)
> > <snip>
> > > > > +static int ov2735_page_access(struct ov2735 *ov2735,
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD u32 reg, void *val, int *err, bool is_read)
> > > > > +{
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD u8 page =3D (reg >> CCI_REG=
_PRIVATE_SHIFT) & 0xff;
> > > >
> > > > ' & 0xff' part is redundant.
> > > >
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD u32 addr =3D reg & ~CCI_REG=
_PRIVATE_MASK;
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD int ret =3D 0;
> > > >
> > > > How is this assignment being used?
> > > >
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD if (err && *err)
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD return *err;
> > > > > +
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD mutex_lock(&ov2735->page_lo=
ck);
> > > > > +
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD /* Perform page access befo=
re read/write */
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD if (ov2735->current_page !=
=3D page) {
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD ret =3D cci_write(ov2735->cci=
, OV2735_REG_PAGE_SELECT, page, err);
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD if (ret)
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD goto err_mutex_unlock;
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD ov2735->current_page =3D page;
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD }
> > > > > +
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD if (is_read)
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD ret =3D cci_read(ov2735->cci,=
 addr, (u64 *)val, err);
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD else
> > > > > +=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD ret =3D cci_write(ov2735->cci=
, addr, *(u64 *)val, err);
> > > >
> > > > Do you really need this castings?
> > >
> > > Do you really think this casting is unnecessary?
> > >
> >=20
> > Yes? Well quite probably - I haven't checked myself yet but ..
> >=20
> >=20
> > > Please check the definitions of cci_read/write
> > >
> > > without this, we can't even build the driver.
> >=20
> > How about ... changing the function prototype of ov2735_page_access ?
>=20
> Of course, changing the function prototype would work.
>=20
> My intention is to keep a single ov2735_page_access() function that can
> handle both read and write operations. The cci_read() function expects=20
> a u64 *, whereas cci_write() expects a u64 value. To support both cases
> within one function, I=E2=80=99ve used a void *val and cast it appropriat=
ely=20
> depending on the operation.
>=20
> If we were to remove the casting, we would need to split this into two
> separate functions, one for read and one for write, even though the only =

> difference between them would be a single line. I=E2=80=99d prefer to avo=
id that
> redundancy and keep the code compact.=20
>=20
> Let me know if you see a better way to handle this without duplicating
> the logic.=20

ov2735_page_access() {
	if (ov2735->page !=3D page)
		cci_write(PAGE, page)
	ov2735->page =3D page;
}

oc2735_read() {
	ov2735_page_access();
	cci_read()
}

ov2735_write() {
	ov2735_page_access();
	cci_write()
}

>=20
> Best Regards,
> Hardev

