Return-Path: <linux-media+bounces-15920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC05794A78B
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 14:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B11F1C208EB
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 12:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C44A1E6723;
	Wed,  7 Aug 2024 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="GbbKCIYn";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Bk45W/WI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1A11DD3A8;
	Wed,  7 Aug 2024 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723032734; cv=none; b=rCeEOmwVxz69d1Ep8HREgtsm4Siq0wSarzh5+j+I/Nuh9UbvxurpJHhqDAVko2IjpMCmRG5mOsMUE0HYFIXqMq0yRJrIyUqCdiTTYEEjBOKiao4Ef3dxEsU6ExjkzWRiohNnWMIdQMY1GOz98a/KDT+nHrwvj3dzJ0Te+fabwEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723032734; c=relaxed/simple;
	bh=l/3nZLu+xNS0CcyOIx8j8wwzgDjiRDNF58qVjpj6PBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RzQKhoPIAssG0EX9ZPQPxhcNSiGTdoW6FqS6sMIa7fdrPwUEIXWVjvMgzRFCCfbXSk4phqw2Vi60cFiGIIPs/s33IdmhFlKQcqkbutkFki0AU4NhERw+Ku+bNNeJlvJWAExFFbYwQ5ApvNo80q4f+yV2+mZpW8HHoMaDwE7LI6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=GbbKCIYn; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Bk45W/WI reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723032732; x=1754568732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LsmwXLKtO0ExCH30q3yjH8RO7FgjHLoES0MXf1jNMGo=;
  b=GbbKCIYnbDmp7FnzH9MAKMqiPP4j/aV/pHnenfypF7SR5H7jDod5jM18
   QGlniA9nocstTmMp1ISGKAwnATnj6rl8FrPegl1VZS9vhbizu4j0baeiX
   oYlUlwyzP0GMix9QfOh62xVkqeUn+l1Va7NAm9NViZBcyBwmhlT1YPdwp
   pYkNogvN1BRJlHDq4XuVTnO5nUculeZbuylmlnwwhdSyABocnfLLuKJ+9
   si7w2W3vuyewexYddazYSUUIumw9vBRuIew0g9pjcmflypQWnhimowtSt
   aPo9zArIn1dvzL8AlqsJuRfDOj6R1AiXWKg/zemSpt209gzKeh37FGMcF
   A==;
X-CSE-ConnectionGUID: RD6rdYvPSqW5hn4bEC8HFQ==
X-CSE-MsgGUID: BdjOos2sR0OceebcuCM9kA==
X-IronPort-AV: E=Sophos;i="6.09,269,1716242400"; 
   d="scan'208";a="38292614"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Aug 2024 14:12:09 +0200
X-CheckPoint: {66B36499-5-DD19D171-FBE73682}
X-MAIL-CPID: 38B2559BBA5143FFDD4FAF2F803F9190_5
X-Control-Analysis: str=0001.0A782F23.66B36499.00C6,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39174160EB8;
	Wed,  7 Aug 2024 14:12:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723032725;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LsmwXLKtO0ExCH30q3yjH8RO7FgjHLoES0MXf1jNMGo=;
	b=Bk45W/WI4u/GTcjZFKR/BU75hp7Q1jhcsD0w195gPY+LSi+7HuaJsq9JQibr0N+dBjtThu
	ypR1wzy2f3bUx7fqPS9Xoq5DyrNhwR8bkVFK4IHei424H5Ub/B3HEicEo0vtX5g0/RIJ0a
	i2lpIharue6vjswo5dCggn0dsvGo+HDdAe9fLbWKhMJf9OwtxQ2XPGC+Bo/wI4mdzGUmiv
	YSsYlgn56Ak7EIkTS+fiaDY8SYC76/R2VT8+uWCZif50v7PEh6BYvIpKh5FJzydHljBw7f
	1R/H518vwhrz3evawZWXl2Yyq+zIVtuIYOFUo3Pd6vAu4AW/MoSg1NgkPUz6Kw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benjamin Bara <bbara93@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>, arne.caspari@theimagingsource.com
Subject: Re: [PATCH 2/2] media: i2c: imx290: Check for availability in probe()
Date: Wed, 07 Aug 2024 14:12:04 +0200
Message-ID: <4588174.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAJpcXm6Ey9xMX2btO+xH3MF3z39hqP5ZjkOgEUcaNY822urJ5w@mail.gmail.com>
References: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com> <20240807094957.GE21319@pendragon.ideasonboard.com> <CAJpcXm6Ey9xMX2btO+xH3MF3z39hqP5ZjkOgEUcaNY822urJ5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Mittwoch, 7. August 2024, 13:07:24 CEST schrieb Benjamin Bara:
> On Wed, 7 Aug 2024 at 11:50, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Wed, Aug 07, 2024 at 10:47:39AM +0200, Benjamin Bara wrote:
> > > On Wed, 7 Aug 2024 at 10:33, Alexander Stein wrote:
> > > > Am Mittwoch, 7. August 2024, 10:10:28 CEST schrieb Benjamin Bara:
> > > > > Currently, the V4L2 subdevice is also created when the device is =
not
> > > > > available/connected. In this case, dmesg shows the following:
> > > > >
> > > > > [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> > > > > [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> > > > > [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> > > > > [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> > > > >
> > > > > which seems to come from imx290_ctrl_update() after the subdev in=
it is
> > > > > finished. However, as the errors are ignored, the subdev is initi=
alized
> > > > > but simply does not work. From userspace perspective, there is no
> > > > > visible difference between a working and not-working subdevice (e=
xcept
> > > > > when trying it out or watching for the error message).
> > > > >
> > > > > This commit adds a simple availability check before starting with=
 the
> > > > > subdev initialization to error out instead.
> > > >
> > > > There is already a patch reading the ID register at [1]. This also =
reads the
> > > > ID register. But I don't have any documentation regarding that regi=
ster,
> > > > neither address nor values definitions. If there is known informati=
on about
> > > > that I would prefer reading the ID and compare it to expected value=
s.
> > >
> > > Thanks for the link - it seems like Laurent has dropped the patch for
> > > the more recent kernel versions on their GitLab.
> >
> > It was a patch that I wrote as a test, and I decided not to upstream it
> > as it had limited value to me. The downside with reading registers at
> > probe time is that you have to power up the sensor. This can have
> > undesired side effects, such as flashing a privacy LED on at boot time
> > in devices that have one. There's also the increase in boot time due to
> > the power up sequence, which one may want to avoid.
> >
> > The imx290 driver already powers up the device unconditionally at probe
> > time, so reading the version register wouldn't be much of an issue I
> > suppose. I would be fine merging that patch.
> >
> > > This was also my initial intention, but similar to you, I don't have a
> > > docu describing this register, so I am not sure where the info is com=
ing
> > > from and if it really contains the identification/type info. Probably
> > > Laurent has more infos on that.
> >
> > That's a good question. I don't see a mention of that register in the
> > IMX290 datasheet I've found online
> > (https://static6.arrow.com/aropdfconversion/c0c7efde6571c768020a72f59b2=
26308b9669e45/sony_imx290lqr-c_datasheet.pdf).
> > Looking at the git history, the IMX290_CHIP_ID register macro was
> > introduced in an unrelated commit, without an explanation. I don't
> > recall where it comes from, but I don't think I've added it randomly. It
> > may have come from an out-of-tree driver.
>=20
> Thanks for the info!
>=20
> > I don't have an IMX290 plugged in at the moment, what's the value of the
> > register ?
>=20
> I currently have an imx462 available, which is not "officially supported"=
 yet,
> but basically an imx290 derivative. With your patch applied:
>=20
> [   10.424187] imx290 7-001a: chip ID 0x07d0

Okay, this is from a imx327lqr:

[   15.265086] imx290 3-001a: chip ID 0x07d0

Doesn't look like an ID register to me.

Best regards,
Alexabder

>=20
> >
> > > > [1] https://gitlab.com/ideasonboard/nxp/linux/-/commit/85ce725f1de7=
c16133bfb92b2ab0d3d84efcdb47
> > > >
> > > > > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > > > > ---
> > > > >  drivers/media/i2c/imx290.c | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx29=
0.c
> > > > > index 4150e6e4b9a6..a86076e42a36 100644
> > > > > --- a/drivers/media/i2c/imx290.c
> > > > > +++ b/drivers/media/i2c/imx290.c
> > > > > @@ -1580,6 +1580,11 @@ static int imx290_probe(struct i2c_client =
*client)
> > > > >       pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > >       pm_runtime_use_autosuspend(dev);
> > > > >
> > > > > +     /* Make sure the sensor is available before V4L2 subdev ini=
t. */
> > > > > +     ret =3D cci_read(imx290->regmap, IMX290_STANDBY, NULL, NULL=
);
> > > > > +     if (ret)
> > > > > +             goto err_pm;
> > > > > +
> > > > >       /* Initialize the V4L2 subdev. */
> > > > >       ret =3D imx290_subdev_init(imx290);
> > > > >       if (ret)
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



