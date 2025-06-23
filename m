Return-Path: <linux-media+bounces-35599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8EDAE3BB6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF7F61884423
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C583721CA02;
	Mon, 23 Jun 2025 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="L86h1ro2"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC11BB663;
	Mon, 23 Jun 2025 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673135; cv=none; b=Lv2KkVPW+vN/B8ltHY1DUztU/geiNAJqdcswuFsdSHX8Xo8plX94t/JfrovGopa2mFMmJHk1kjKhkDRvGpyDfN+NZejym2YoJTIOEJWt64b4N+NsmDnUenjV8SXez3vpLH/Ik5MNF8F97Gzk/W7lT13E/EN1wuMCEiDXs4evjp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673135; c=relaxed/simple;
	bh=vr/v7+HNQA9PBO0CTD04rUzWOcoal2+aqe6MzSRZyaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hbwjEjoMcDo8kWNV01BgbX55KvWBmNP3tZjFuPWeTZhdO8MQQ8brXH1MaGIc8SwPIQftMm3beYyUogNn6tD/lE/KhOJEZo80sENPQEqXfHOPgncII+WQjTKML+PW3wNcqzjBAV19fz6vkgWhHjrgvHETadrZtGjl8bhqr6Rr920=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=L86h1ro2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CwBZWncXMFHUNfKxRF00wCCVLbZJy1TDoDay/M48Z+I=; b=L86h1ro29XqjaL+eCgRkkXLern
	75+0ic4ZPZQA9jgsZHU+m6s6A2g1sjBn8ch86nVuI/mPsm+t10x6oPsYBhqLPIQIrNtzVhkQykPlD
	GS6K5lvxSgSfYFgxVCGxHbCyZJr9sJG8cHlMxOsXGWp3xZSWPA+YRD0J0ug3eUzpFk8RG8q4SVWqQ
	TOR2KrK1AeFq1O+2IjRT6Sxz8JfV9KsVPDxIse6QRLv8ohmlIyxP9kaPKQw4t3nnlQoZnyzyHIkQL
	h6O0JmWJF9FZOYiJ72bt6fz7XaHXYoqvT90EPSJ6+HRhkGFcR9xFgmumcVFR0doDchPrQUOcr2uVj
	k3uVs64Q==;
Received: from [185.15.108.45] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uTe3H-00084G-Br; Mon, 23 Jun 2025 12:05:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Date: Mon, 23 Jun 2025 12:05:22 +0200
Message-ID: <13788127.uLZWGnKmhe@phil>
In-Reply-To: <aFj4kAXEhrR4Wbnz@kekkonen.localdomain>
References:
 <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
 <aFj4kAXEhrR4Wbnz@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Montag, 23. Juni 2025, 08:47:44 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Sakari Ailus:
> Hi Olivier,
>=20
> On Fri, Jun 20, 2025 at 05:21:31PM +0200, Olivier Benjamin wrote:
> > This series adds support for the Pine64 PinePhone Pro's rear and front
> > cameras in Device Tree.
> > This is based on some of Ondrej Jirman's patches hosted in his tree at
> > https://codeberg.org/megi/linux, but I have also fully reviewed and
> > re-written the code from the RK3399 datasheet, the PinePhone Pro
> > schematic, and the IMX258-0AQH5 software reference manual.
> >=20
> > I have tested these changes on my PinePhone Pro and am able to take
> > photos from both cameras using libcamera's cam.
> >=20
> > This series has raised a question about the proper label name for the
> > front/user camera and rear/world camera for phones.
> > This series is using "ucam" and "wcam", which is used in a few other
> > Rockship DTBs:
> >  - arch/arm64/boot/dts/rockchip/px30-evb.dts
> >  - rk3399-gru-scarlet.dtsi
> >=20
> > Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
>=20
> Thanks for the patches.
>=20
> I've picked the first two in the set, presumably the rest will be merged
> via another tree?

correct, and with the first two being applied, I can now also safely pick
the other two :-)

Thanks a lot
Heiko




