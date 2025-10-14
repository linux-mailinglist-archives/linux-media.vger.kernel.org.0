Return-Path: <linux-media+bounces-44334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DDFBD73D0
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 06:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3FDB18A6A4F
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 04:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0C630ACF4;
	Tue, 14 Oct 2025 04:24:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413E930AAC8;
	Tue, 14 Oct 2025 04:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415898; cv=none; b=dE6NsryDXIM3K6XMWXWQcrqPiIRtcXYUnwaveLuM/RpJWozuC+MRVE0rr3fE90KIQag12k+fxDMwUvFhBcoZoPMOHo5IwqqB2y7rfB65mdUTbv4hTpdMnnV95I1CqKsan0gWlOudHyA+qsz/Wo7wi+oHGUCE1aMsdCQXu0kVA7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415898; c=relaxed/simple;
	bh=NkEIvHvSMBdftwCCgim71nKU1aLS5jLHCWC9aM4TShQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KfujT17SU1ghYIEVNdTGfm3YfXDJmdD8n6OV+ijf5Duzmbw6ih1iknFUDxyX+p9zkUMUViof3QjxzgP2dUpWqM4nvllV9NY2DbkoNN9GdSqac8DWw0Ab8xqTpiAVbhMZdbkGgAO0cNYsb4OxQiKif4ai8gSpvgjlgtYqDwJj6os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 13FA2C3EEAC9;
	Tue, 14 Oct 2025 06:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 13FA2C3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,  Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Hans Verkuil <hverkuil@kernel.org>,  Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,  Leon Luo <leonl@leopardimaging.com>,
  Kieran Bingham <kieran.bingham@ideasonboard.com>,  Jacopo Mondi
 <jacopo+renesas@jmondi.org>,  Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,  Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>,  Niklas =?utf-8?Q?S=C3=B6der?=
 =?utf-8?Q?lund?=
 <niklas.soderlund+renesas@ragnatech.se>,  Julien Massot
 <julien.massot@collabora.com>,  Jacopo Mondi <jacopo@jmondi.org>,  Daniel
 Scally <djrscally@gmail.com>,  Dave Stevenson
 <dave.stevenson@raspberrypi.com>,  Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>,  Sylvain Petinot
 <sylvain.petinot@foss.st.com>,  Yong Zhi <yong.zhi@intel.com>,  Bingbu Cao
 <bingbu.cao@intel.com>,  Tianshu Qiu <tian.shu.qiu@intel.com>,  Tiffany
 Lin <tiffany.lin@mediatek.com>,  Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>,  Yunfei Dong <yunfei.dong@mediatek.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Rui Miguel Silva
 <rmfrfs@gmail.com>,  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Martin Kepplinger <martink@posteo.de>,  Purism Kernel Team
 <kernel@puri.sm>,  Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Dafna
 Hirschfeld <dafna@fastmail.com>,  Heiko Stuebner <heiko@sntech.de>,
  Sylwester Nawrocki <s.nawrocki@samsung.com>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Alim Akhtar <alim.akhtar@samsung.com>,  Yemike
 Abhilash Chandra <y-abhilashchandra@ti.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  linux-input@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-media@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  imx@lists.linux.dev,
  linux-renesas-soc@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-samsung-soc@vger.kernel.org,  linux-staging@lists.linux.dev
Subject: Re: [PATCH 05/32] media: ar0521: Use %pe format specifier
In-Reply-To: <20251013-ptr_err-v1-5-2c5efbd82952@chromium.org> (Ricardo
	Ribalda's message of "Mon, 13 Oct 2025 14:14:45 +0000")
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
	<20251013-ptr_err-v1-5-2c5efbd82952@chromium.org>
Sender: khalasa@piap.pl
Date: Tue, 14 Oct 2025 06:24:43 +0200
Message-ID: <m3ldlertys.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ricardo Ribalda <ribalda@chromium.org> writes:

> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR()
>
> This patch fixes this cocci report:
> ./i2c/ar0521.c:1113:31-38: WARNING: Consider using %pe to print PTR_ERR()
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks,
Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -1109,8 +1109,8 @@ static int ar0521_probe(struct i2c_client *client)
>                                                 ar0521_supply_names[cnt]);
>
>                 if (IS_ERR(supply)) {
> -                       dev_info(dev, "no %s regulator found: %li\n",
> -                                ar0521_supply_names[cnt], PTR_ERR(supply=
));
> +                       dev_info(dev, "no %s regulator found: %pe\n",
> +                                ar0521_supply_names[cnt], supply);
>                         return PTR_ERR(supply);
>                 }
>                 sensor->supplies[cnt] =3D supply;

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

