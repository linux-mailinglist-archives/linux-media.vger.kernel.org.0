Return-Path: <linux-media+bounces-44312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B22BD4309
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 17:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A0DC500F60
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 15:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E34130EF94;
	Mon, 13 Oct 2025 15:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VjFW7j5w"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B2727AC21;
	Mon, 13 Oct 2025 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367812; cv=none; b=svzRhjVNuvV0ZotTfDdveNP3zkAIL5+paNA3Y0b1GbPP+zgAkd4wc8EuAYgs1yWzg7lqDZgXZH2d3CEg2aHyjA5mZfBxryVihl3598Q/X+SV0e77c8kCiCKgooCgPSfEbBlTIJh+LPDQv1t2gAPZs1e2rOmHDu8gLMIQOXkDivQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367812; c=relaxed/simple;
	bh=G1U4VjihWrTjR/0pZxBUsKlb85UKypAyhjdzAAp6raw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gelQIj3DkXveBk4SusBTREyszoWb6MSuqPt8NkYbbeiXP8e9L/sucq2l+/lozhzbkScOKZZG828AWOQtkofVdifRPaV8PE5wt17EZdKyCSpC/SxoFQ0j5dU3OueF5flm8RS5stGO+XDh+R+vbd6elRGQ8yL1QdGcS4eKDIoOHgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VjFW7j5w reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CACF557;
	Mon, 13 Oct 2025 17:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760367708;
	bh=G1U4VjihWrTjR/0pZxBUsKlb85UKypAyhjdzAAp6raw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VjFW7j5w3uImm2q1iWEwqGyFzq7DNfkTVBaq5lpyK2yHJ7aZC29Xfhr1ySWtwXTaA
	 WkHQ6VshkR+fiQpIVovTbGFpBwEMHuBVTocpv9nEkNKv8sOsKQAAdkX1fA4a8tva/n
	 KEgIrlSrlFZ6cr2flWju1lvfyogNPxedvXUY+v3Y=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org> <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org>
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
Date: Mon, 13 Oct 2025 16:03:23 +0100
Message-ID: <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Ricardo Ribalda (2025-10-13 15:14:50)
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
>=20
> This patch fixes this cocci report:
> ./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()

Ohhh nice. Is this new ? First I've come across it.



> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/imx335.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d=
38001508fb86d28 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *im=
x335)
>         imx335->reset_gpio =3D devm_gpiod_get_optional(imx335->dev, "rese=
t",
>                                                      GPIOD_OUT_HIGH);
>         if (IS_ERR(imx335->reset_gpio)) {
> -               dev_err(imx335->dev, "failed to get reset gpio %ld\n",
> -                       PTR_ERR(imx335->reset_gpio));
> +               dev_err(imx335->dev, "failed to get reset gpio %pe\n",
> +                       imx335->reset_gpio);

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>                 return PTR_ERR(imx335->reset_gpio);
>         }
> =20
>=20
> --=20
> 2.51.0.760.g7b8bcc2412-goog
>

