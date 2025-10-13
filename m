Return-Path: <linux-media+bounces-44313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0DABD441D
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 17:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 806694F39B9
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 15:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D0630FF10;
	Mon, 13 Oct 2025 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="viLGahIb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9636530FC2A;
	Mon, 13 Oct 2025 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367975; cv=none; b=gBlJX+2wU8gQ70E8INGHE9b1ovZtoue7G+kSvVf2AhW2PGvcLRinf0wPhjTGJ0nBbSa59pmhfuhFcffXyEvSBBxl8DqIHkp5AEC0BAd8ZeugPKR7vxI62gH3IFM9Y/JlTn1RuMvJB9oWiIDIp3Syq0QXgcH3CGq1jUk9S0cCYKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367975; c=relaxed/simple;
	bh=zLWz2/BSyPXQ3vTst8yMHEaEq8pmupENdTBFxCKDzEg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=PIZyKZGowcBgkqK0m83moeBHDI1kziK0MUet9eeSfaxn3e9q1XR73NvUifNU5jUNWxPuEOVZO3fAsOH2QLFxkQDjX6a/ImCpRy9rdI5Cho9CnrukiABg6z2aUWbzKq7mwylhxSi0l4jvazhI8AfjeLKkkS1vBQdTN/0xjb2IXwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=viLGahIb reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB298591;
	Mon, 13 Oct 2025 17:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760367871;
	bh=zLWz2/BSyPXQ3vTst8yMHEaEq8pmupENdTBFxCKDzEg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=viLGahIbZthyCLMAb5Q5ZtaBMZkMDtPYkjQnNt4BGXr3kCk6FZC0gS1GKwumhUicR
	 BYsQHLF5amVqGRqabVARV2v75mdvMnwHu7EW0MVgDFtPVmSAtJFbpVm51vS2je4ZeO
	 1YejZz1t5DiCb7NVIuFxV+6hn7QR/g2G0AhePn2Y=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org> <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org> <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
Subject: Re: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Julien Massot <julien.massot@collabora.com>,
	Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Martin Kepplinger <"mar tink"@posteo.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Yong Zhi <yong.zhi@intel.com>, Yunfei Dong <yunfei.dong@mediatek.com>
Date: Mon, 13 Oct 2025 16:06:06 +0100
Message-ID: <176036796637.559803.10680601174419752160@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Kieran Bingham (2025-10-13 16:03:23)
> Quoting Ricardo Ribalda (2025-10-13 15:14:50)
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR().
> >=20
> > This patch fixes this cocci report:
> > ./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()
>=20
> Ohhh nice. Is this new ? First I've come across it.
>=20
>=20
>=20
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/imx335.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c=
4d38001508fb86d28 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *=
imx335)
> >         imx335->reset_gpio =3D devm_gpiod_get_optional(imx335->dev, "re=
set",
> >                                                      GPIOD_OUT_HIGH);
> >         if (IS_ERR(imx335->reset_gpio)) {
> > -               dev_err(imx335->dev, "failed to get reset gpio %ld\n",
> > -                       PTR_ERR(imx335->reset_gpio));
> > +               dev_err(imx335->dev, "failed to get reset gpio %pe\n",
> > +                       imx335->reset_gpio);
>=20
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>=20

I see imx335->inclk is checked with PTR_ERR below too - but isn't
currently printed, so I think it's out of scope for this series - but
probably worth using the new helper to report that failure too in the
future.

I'll see if there's some error handling clean up to be done on top
later.

> >                 return PTR_ERR(imx335->reset_gpio);
> >         }
> > =20
> >=20
> > --=20
> > 2.51.0.760.g7b8bcc2412-goog
> >

