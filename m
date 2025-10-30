Return-Path: <linux-media+bounces-46022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69CCC21126
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 17:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C47523BF34C
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 15:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADEA312801;
	Thu, 30 Oct 2025 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MsWhve2o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33AE31197A;
	Thu, 30 Oct 2025 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839871; cv=none; b=pbTUu8eGT+novgs0nfhkT9UCS0vWXzanCmiWSP3Kk2nNQ70HKnHP0gxKXlSMcz5zVomfVublfAIdm4ogxEvv5iAY8kSS53NFe1ADE+LZaCKAUqqJkikVkePHHWK1CJSCVLQvjWmwnu01mmhQJKR4Sk6OwK2KfPsP6CDAoHqjQME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839871; c=relaxed/simple;
	bh=2WEw8wEmyFBkjxGO8IR7j2ZlLGW1gfb5WGiBxhe0OnU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Z9GCAA0xj8M9E6ELQYQmU0qVSi98Y168oKiV9RRlaM3Vh94CU/DKRoyvouWr67likzdHx9flw/y1Ca/WmlSjJEDQ2sfp8Tzh0rE3+6gBU1jeKZqj6Xr0jQX8Br3KfIenwuVRC5VJ78lZWsncQI9MIy5TagxyEbnCN9+46CCZRCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MsWhve2o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCD4416A8;
	Thu, 30 Oct 2025 16:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761839757;
	bh=2WEw8wEmyFBkjxGO8IR7j2ZlLGW1gfb5WGiBxhe0OnU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MsWhve2oLKSsYRv7IpzShtsjymUKLd+3YXckCIPN+id4/sC3E9YNZVVJ6+0IUUipX
	 tVWFHWXDWeA26xeQwj2Rqbu9rFUo+cBWAMZJRl+UGL2F+7XK/VECHIhsd5FDBIt/Km
	 1FnhWaqZuyG18/3ri3dfIKagSkTBg6JD4c2ynfm0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPVz0n0Vqi0xg8c=PS3vyFr9YzRC0PtFXyxw9G5yHohS4FKVbQ@mail.gmail.com>
References: <20251030115757.33695-1-clamor95@gmail.com> <20251030115757.33695-3-clamor95@gmail.com> <PN3P287MB182950EC8691183FBFC4EC098BFBA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM> <CAPVz0n0Vqi0xg8c=PS3vyFr9YzRC0PtFXyxw9G5yHohS4FKVbQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: add Sony IMX111 CMOS camera sensor driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, linux-media@vger.kernel.org <linux-media@vger.kernel.org>, devicetree@vger.kernel.org <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Tarang Raval <tarang.raval@siliconsignals.io>
Date: Thu, 30 Oct 2025 15:57:44 +0000
Message-ID: <176183986424.3742839.1867363151241824725@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Svyatoslav Ryhel (2025-10-30 15:13:31)
...
> >
> > > +static int imx111_initialize(struct imx111 *sensor)
> > > +{
> > > +=E2=80=82=E2=80=82=E2=80=82struct device *dev =3D regmap_get_device(=
sensor->regmap);
> > > +=E2=80=82=E2=80=82=E2=80=82int ret;
> >
> > ret =3D 0;
> >
>=20
> cci_write does not state that ret must be initiated.
>=20
> > > +
> > > +=E2=80=82=E2=80=82=E2=80=82/* Configure the PLL. */
> > > +=E2=80=82=E2=80=82=E2=80=82cci_write(sensor->regmap, IMX111_PRE_PLL_=
CLK_DIVIDER_PLL1,
> > > +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82  sensor->pll->pre_div, &ret);

You definitely need to initialise ret =3D 0 or this line above will
probably fail because cci_write uses 'ret' to decide to do anything or
not.

 - https://docs.kernel.org/driver-api/media/v4l2-cci.html

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
int cci_write(struct regmap *map, u32 reg, u64 val, int *err)

    Write a value to a single CCI register

Parameters

struct regmap *map
    Register map to write to

u32 reg
    Register address to write, use CCI_REG#() macros to encode reg width

u64 val
    Value to be written

int *err
    Optional pointer to store errors, if a previous error is set then
    the write will be skipped

Return

0 on success or a negative error code on failure.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D


So it should be initialised in a good state *or* you use NULL on
this first call and assign it - but init to ret =3D 0 is cleaner here I
think.

> > > +=E2=80=82=E2=80=82=E2=80=82cci_write(sensor->regmap, IMX111_PLL_MULT=
IPLIER_PLL1, sensor->pll->mult, &ret);
> > > +=E2=80=82=E2=80=82=E2=80=82cci_write(sensor->regmap, IMX111_POST_DIV=
IDER, IMX111_POST_DIVIDER_DIV1, &ret);
> > > +=E2=80=82=E2=80=82=E2=80=82cci_write(sensor->regmap, IMX111_PLL_SETT=
LING_TIME,
> > > +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82  to_settle_delay(sensor->pll->extclk_rate), &ret);
> > > +
> > > +=E2=80=82=E2=80=82=E2=80=82ret =3D cci_multi_reg_write(sensor->regma=
p, imx111_global_init,
> > > +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82  ARRAY_SIZE(imx111_global_=
init), NULL);
> >
> > You are overwriting the previous errors.
> >
> > please use ret |=3D

No - just continue with the same pattern:

	cci_multi_reg_write(sensor->regmap, imx111_global_init,
			=E2=80=82=E2=80=82  ARRAY_SIZE(imx111_global_init), &ret);

> >
> > > +=E2=80=82=E2=80=82=E2=80=82if (ret < 0) {
> > > +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82dev_err(dev, "Failed to initialize the sensor\n");
> > > +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82return ret;
> > > +=E2=80=82=E2=80=82=E2=80=82}
> > > +
> > > +=E2=80=82=E2=80=82=E2=80=82return 0;
> > > +}

