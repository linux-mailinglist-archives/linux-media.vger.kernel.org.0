Return-Path: <linux-media+bounces-4165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 813EE83B335
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 21:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1320B1F23382
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 20:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEC31350F4;
	Wed, 24 Jan 2024 20:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/lDnsnr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830B9134744;
	Wed, 24 Jan 2024 20:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706129331; cv=none; b=B8NQtjJK6tiU07aQi+2sdvpqdveq/CxORpe5r1NZJ2sTQy3o11fp3cYf8ZsXMvTvyRVLLE7p0TFvP9vUXLPBvGz3CJCzAa0P4tAN7B6lpaBbAK3z9ayD0b5OD00T97MlY3YW/CWUxmM8cgw23nQO0Jx+3IH+KzqEhoxShiTzC8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706129331; c=relaxed/simple;
	bh=Pu2WnJULiZ3SHOQa+Ls5gMiBM9GGmreLuufDrBDDCxY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Uf08sUOzJ4pW1qMkV9Ht2FU/CAPzzNkaah2flzseZHvvcbYmnnWdjk72RHaqqlbM6KfOz3+4LajtJRsLRe6dpHmXLFHtNdh0KAez+9rDWcKZyc1Uc8ybJAzy7Py9n0za/nLqse4q0THJyytfRhyaDFuuJWrArxu42diouFWWcGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/lDnsnr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15F6C433C7;
	Wed, 24 Jan 2024 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706129330;
	bh=Pu2WnJULiZ3SHOQa+Ls5gMiBM9GGmreLuufDrBDDCxY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=l/lDnsnrKGyL4NokUGCsi1Dqf3sT2rJfYHrXct9Zr7T2d5xHZklzHnHzME7Eh9v0M
	 3BHNHwvIlFu/Unu8C2lQmm46LAVa2hT+wPbd81/wdHD4gh0hnjgoy4w56q3WJv2xfH
	 q7HOrUFDXOuWYrd0wxS6m7yDHyE5reYUHX7ovIqmjpCfP5d5adU7uQf1Qb8gRaJ5Yj
	 KlycmGGIsCESbhnKmb3TeMBdTK7Sss/DnCDlxbAgi/doD/hQ6yUzeMMuz6UHu1+MmX
	 rlClWFvh0p71trdnWXIZXqg0HnqytUqUTGRYk+FmHqO43y8xd7c5SwvuKUnIhqYvGR
	 3O7Y9BSLwS89w==
Message-ID: <cae77ff909448cd7eb88716696d24091.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <TYCPR01MB1126908A3DCEE35723E102993867B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com> <20240123115821.292787-5-biju.das.jz@bp.renesas.com> <Za-u9VO2OuY6vhT8@kekkonen.localdomain> <20240123153550.GT10679@pendragon.ideasonboard.com> <TYCPR01MB112691B281C74CAD8EB14433E86742@TYCPR01MB11269.jpnprd01.prod.outlook.com> <20240123221011.GA16581@pendragon.ideasonboard.com> <TYCPR01MB1126908A3DCEE35723E102993867B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure clk handling
From: Stephen Boyd <sboyd@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org <linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>, linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 24 Jan 2024 12:48:48 -0800
User-Agent: alot/0.10

Quoting Biju Das (2024-01-24 06:01:30)
> > > > > > CSI2nMCT0_VDLN(csi2->lanes)); @@
> > > > > > -386,11 +389,40 @@ static void
> > > > > > rzg2l_csi2_mipi_link_enable(struct
> > > > rzg2l_csi2 *csi2)
> > > > > >       rzg2l_csi2_write(csi2, CSI2nDTEL, 0xf778ff0f);
> > > > > >       rzg2l_csi2_write(csi2, CSI2nDTEH, 0x00ffff1f);
> > > > > >
> > > > > > +     clk_disable_unprepare(csi2->vclk);
> > > > > > +     for (count =3D 0; count < 5; count++) {
> > > > > > +             if (!(__clk_is_enabled(csi2->vclk)))

__clk_is_enabled() is a clk provider API. You shouldn't be using it in
consumer drivers.

> > > > > > +                     break;
> > > > > > +             usleep_range(10, 20);
> > > > > > +     }
> > > > > > +
> > > > > > +     if (count =3D=3D 5) {
> > > > > > +             dev_err(csi2->dev, "Timeout, not able to turn OFF
> > vclk\n");
> > > > > > +             return -ETIMEDOUT;
> > > > > > +     }
> > > > >
> > > > > It'd be nice to have a CCF function to do this. Either way, you
> > > > > can use read_poll_timeout().
> > > >
> > > > I would have sworn that clk_disable_unprepare() is synchronous, and
> > > > would have sworn even stronger for clk_prepare_enable(). What's
> > > > going on here, is there really a delay ? It sounds like a bug in the
> > clock driver.
> > >
> > > At the moment we are not checking clock status when we turn off a
> > > clock However, for clock ON we are checking the status while turning =
it
> > ON.
> > > We need to fix the driver for clk_disable_unprepare().
> >=20
> > Does that mean that the check below clk_prepare_enable() could be remov=
ed
> > already ?
>=20
> Yes, that is correct I will remove in the next version as clk_prepare_ena=
ble() is
> synchronous as it checks the status to make sure it is turned ON.
>=20
> >=20
> > Regarding clock disable, it isn't clear if the API guarantees synchrono=
us
> > calls. I'd recommend asking the clock maintainers. If it doesn't, then =
the
> > clock driver isn't wrong (and may lead to faster operation in most case=
s),
> > but I think synchronizing the clock disable by waiting for the clock to=
 be
> > actually disabled should be implemented as a helper in CCF.
>=20
> +clk.
>=20
> Hi Stephen and all,
>=20
> Can you please shed some light on this?
>=20

clk_disable() is reference counted. The call to clk_disable() may do
nothing besides decrement a count and return. Per the documentation in
clk.h it means that the consumer is no longer using the clk. The clk
could be turned off later, or not at all.

It seems like the clk driver has a bug. Make the clk driver synchronize
the disable with enable please.

