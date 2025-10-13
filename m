Return-Path: <linux-media+bounces-44314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A2BD4B4C
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 18:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EFDED50106A
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 15:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48387311C06;
	Mon, 13 Oct 2025 15:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aeyfTa5F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F0F17F4F6;
	Mon, 13 Oct 2025 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760368188; cv=none; b=ferGwE28ObzBZLgD38rx0GbmOZDbnenGWUr3VV4Csm81yWw6PTALEgdR3fuNpDeGv6G6dyPcqnv3l0JAE9GI+IgY+d84a1DMgqLwNzs9QnxZkGwNSNMiyJxVpCDLUIeBLNPezN164fyNdpYVU+IXKhyfy+zF8wlRwI2abSeWFSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760368188; c=relaxed/simple;
	bh=Y379xZp+1KhRPabeW/pgpKjT5gLI/oVo+q8cDBOTzrQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=dUb//DjyQwy+acqbgcOrxUW0U3z/VRaHM/E9FYQShwRPzbI/d+mghkX4nx3euAuZBivmzKKprNhU1OODJUzKht6oV0BHI846BS0tcKY6gYNtvbGPSTFl7OLB2WBg9/i0FcBeI7aT/OFEVPeuBwIBRxYNH9LAuI8nnV4xxGCLrbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aeyfTa5F reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 397236F9;
	Mon, 13 Oct 2025 17:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760368084;
	bh=Y379xZp+1KhRPabeW/pgpKjT5gLI/oVo+q8cDBOTzrQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aeyfTa5FlqB5q7OnulXYtvlqHR+jvv5AmUNkhNNqYMwOn6iFQbzYr/1pz4qzp1CYA
	 ajr8+/orFnO/ICYAyCi4fUFHbsX/ZM9YaDtR6QYpGEiXl37KM6B6UoBj/GLsG1rPrG
	 O9bbHWhStOWys5g4y/pGkwVs+0ED8TtA2+Wcpr0Q=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251013-ptr_err-v1-12-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org> <20251013-ptr_err-v1-12-2c5efbd82952@chromium.org>
Subject: Re: [PATCH 12/32] media: i2c: max9286: Use %pe format specifier
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Date: Mon, 13 Oct 2025 16:09:39 +0100
Message-ID: <176036817953.559803.4575212780880501423@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Ricardo Ribalda (2025-10-13 15:14:52)
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
>=20
> This patch fixes this cocci report:
> ./i2c/max9286.c:755:7-14: WARNING: Consider using %pe to print PTR_ERR()
>=20
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/i2c/max9286.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 7c0961688d6173843f3ae846253d4a8669ae762b..e6e214f8294b83105be02f299=
66e1d3ed72f8dbe 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -751,8 +751,8 @@ static int max9286_v4l2_notifier_register(struct max9=
286_priv *priv)
>                 mas =3D v4l2_async_nf_add_fwnode(&priv->notifier, source-=
>fwnode,
>                                                struct max9286_asd);
>                 if (IS_ERR(mas)) {
> -                       dev_err(dev, "Failed to add subdev for source %u:=
 %ld",
> -                               i, PTR_ERR(mas));
> +                       dev_err(dev, "Failed to add subdev for source %u:=
 %pe",
> +                               i, mas);

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>                         v4l2_async_nf_cleanup(&priv->notifier);
>                         return PTR_ERR(mas);
>                 }
>=20
> --=20
> 2.51.0.760.g7b8bcc2412-goog
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

