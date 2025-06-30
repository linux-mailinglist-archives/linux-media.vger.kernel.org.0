Return-Path: <linux-media+bounces-36264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 904C1AED90B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 11:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 460AD1894D0A
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A4D24A052;
	Mon, 30 Jun 2025 09:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="OKbbifEZ"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FF9248F4B;
	Mon, 30 Jun 2025 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277023; cv=none; b=cfe9n0ru9b6L+liJmsBHR8dno99Sx5G42Z/ItTtX+VXoChhAacSACVqkfaikL8erTtEOhazjw/nSQmNqFjwozPhL2O6jdOoCu2xFMCjdGv9OLecqDvjV5r8gZvO9MATSWR+OwfGNdBFwP+TTU2s9cetNh4acHlc0sIBNvj7W5zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277023; c=relaxed/simple;
	bh=OlR9PO94f1hpbZsfLLpaoTmAlbcl6nqpnsyTcK20dmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jlpwIFFvwRcb/i6JyEhlQGTyif1THPWbm0FvcKk34KF0VrxeWfNSurpXkFZvHhJByYq8BjHS8FRvadHrXMwZoSeIBVUL2bt9c4YW4NGXsZyQexOxINQM5t0BzX/0OCojsCdbTOM4/2m4mMVp5jZxoRym5OCdsCDB67jof9cQewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=OKbbifEZ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=fdCzhVsNXpe5AUC2cbbE/8xzVg3QlWI9Hb+MzbVyv/U=; b=OKbbifEZUNsRrPyg/milb2gP6P
	Lo2KatzmVJ+9ENyCsgIIQ5f4iQPQ1FOk5hemSdMqb+pbAsqtHLlUqf6VAhM1MOqOWy/GeDHNBy5xf
	ZIUEYXZdhdvfFeM4fDtf4+9FWUkluhSmHBG1yhA7ridYmCy63fgzTmHa5FGFfxJyWeUxaIuYM9Oot
	F4FbPP8wwK1npthTkVx3BkLHcVhJUZ5YpYbqPSDxHm7As9nAoXivSp4o6DHeFxxndUy/THVqBI3KW
	jbAN4pP3/DaJxjgM+nz6G3CaOhLIKUKEWuxejLgRMmHfNUVpXjeKtrK4f/3HCHy7Cm4Wb2Ua3XUKy
	s0DXQP7g==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWB9Q-0006dy-Kw; Mon, 30 Jun 2025 11:50:12 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Nicholas Roth <nicholas@rothemail.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
 ~diederik/pine64-discuss@lists.sr.ht, Dragan Simic <dsimic@manjaro.org>,
 Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH v4 0/4] Describe the cameras in the PinePhone Pro dts
Date: Mon, 30 Jun 2025 11:50:11 +0200
Message-ID: <7067942.rnE6jSC6OK@diego>
In-Reply-To: <aFknh7weIKoGKajQ@kekkonen.localdomain>
References:
 <20250620-camera-v4-0-0201a8ed5fae@bootlin.com> <13788127.uLZWGnKmhe@phil>
 <aFknh7weIKoGKajQ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 23. Juni 2025, 12:08:07 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Sakari Ailus:
> Hi Heiko,
>=20
> On Mon, Jun 23, 2025 at 12:05:22PM +0200, Heiko Stuebner wrote:
> > Hi,
> >=20
> > Am Montag, 23. Juni 2025, 08:47:44 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Sakari Ailus:
> > > Hi Olivier,
> > >=20
> > > On Fri, Jun 20, 2025 at 05:21:31PM +0200, Olivier Benjamin wrote:
> > > > This series adds support for the Pine64 PinePhone Pro's rear and fr=
ont
> > > > cameras in Device Tree.
> > > > This is based on some of Ondrej Jirman's patches hosted in his tree=
 at
> > > > https://codeberg.org/megi/linux, but I have also fully reviewed and
> > > > re-written the code from the RK3399 datasheet, the PinePhone Pro
> > > > schematic, and the IMX258-0AQH5 software reference manual.
> > > >=20
> > > > I have tested these changes on my PinePhone Pro and am able to take
> > > > photos from both cameras using libcamera's cam.
> > > >=20
> > > > This series has raised a question about the proper label name for t=
he
> > > > front/user camera and rear/world camera for phones.
> > > > This series is using "ucam" and "wcam", which is used in a few other
> > > > Rockship DTBs:
> > > >  - arch/arm64/boot/dts/rockchip/px30-evb.dts
> > > >  - rk3399-gru-scarlet.dtsi
> > > >=20
> > > > Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> > >=20
> > > Thanks for the patches.
> > >=20
> > > I've picked the first two in the set, presumably the rest will be mer=
ged
> > > via another tree?
> >=20
> > correct, and with the first two being applied, I can now also safely pi=
ck
> > the other two :-)
>=20
> Once in my tree, they'll next end up to the media committers' tree and
> after some time you should be able to find them in linux-next. This proce=
ss
> will take some time. Just FYI.

thanks for the heads up :-) .

So I'll give that a bit more time for the bindings to appear.

Thanks
Heiko




