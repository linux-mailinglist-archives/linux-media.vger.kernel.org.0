Return-Path: <linux-media+bounces-41003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B4AB33CE3
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 789FA17D7E8
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 10:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643C32D3742;
	Mon, 25 Aug 2025 10:37:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B42C0F72
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 10:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756118277; cv=none; b=HVndQzuGqUYqvnbU0FXL8f7ofPi3LPr6vepplmwc7OyG0FuujAU2T0sHvaEGBY68uwfkhvqt3eg61ss5kViJ5PENwg+twR+3m0nBMLDVOsDWb54TdK3UfarvZs9+Ebpoqyuq/62qfgakH5wMrOn99t7MXcN4MmJy2aNuA05yeLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756118277; c=relaxed/simple;
	bh=e1nR2s50qhicERGHdK8MQ9XDEVOrB0MuAdclmZvHDGU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aXSmGScP85ooqulcIGCjNUuNZOjJ0BA39/px5xrgJ8+CPCQwoSUuVWJdL7CVSMm4ztd2RcaIBtHKhtrDUCVaV/JkYQHf23BKqtahnveC98DtGtyAjk4us+K3lFeam4G/Pta0QXpMCHnXHIY25E0fpl5PDW6P3YVbJ0aKpoVU1ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqUZi-0001ab-FF; Mon, 25 Aug 2025 12:37:18 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqUZe-0023HK-2d;
	Mon, 25 Aug 2025 12:37:14 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqUZe-000M78-2I;
	Mon, 25 Aug 2025 12:37:14 +0200
Message-ID: <c5d8d527ca6194b606b5627e51abbb82ab6dd76c.camel@pengutronix.de>
Subject: Re: [PATCH v10 07/13] media: rockchip: add driver for mipi csi-2
 receiver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
  Maxime Chevallier <maxime.chevallier@bootlin.com>, =?ISO-8859-1?Q?Th=E9o?=
 Lebrun <theo.lebrun@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Gerald Loacker
 <gerald.loacker@wolfvision.net>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>,  Sebastian Reichel
 <sebastian.reichel@collabora.com>, Collabora Kernel Team
 <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, Alexander
 Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob
 Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Date: Mon, 25 Aug 2025 12:37:14 +0200
In-Reply-To: <20240220-rk3568-vicap-v10-7-62d8a7b209b4@collabora.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
	 <20240220-rk3568-vicap-v10-7-62d8a7b209b4@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Di, 2025-08-19 at 01:25 +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>=20
> The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one
> input port and one output port. It receives the data with the help
> of an external MIPI PHY (C-PHY or D-PHY) and passes it to the
> Rockchip RK3568 Video Capture (VICAP) block.
>=20
> Add a V4L2 subdevice driver for this unit.
>=20
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  MAINTAINERS                                    |   1 +
>  drivers/media/platform/rockchip/Kconfig        |   1 +
>  drivers/media/platform/rockchip/Makefile       |   1 +
>  drivers/media/platform/rockchip/rkcsi/Kconfig  |  16 +
>  drivers/media/platform/rockchip/rkcsi/Makefile |   3 +
>  drivers/media/platform/rockchip/rkcsi/rkcsi.c  | 741 +++++++++++++++++++=
++++++
>  6 files changed, 763 insertions(+)
>=20
[...]
> diff --git a/drivers/media/platform/rockchip/rkcsi/rkcsi.c b/drivers/medi=
a/platform/rockchip/rkcsi/rkcsi.c
> new file mode 100644
> index 000000000000..5658ffb60769
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcsi/rkcsi.c
> @@ -0,0 +1,741 @@
[...]
> +static int rkcsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct rkcsi_device *csi_dev;
> +	int ret;
> +
> +	csi_dev =3D devm_kzalloc(dev, sizeof(*csi_dev), GFP_KERNEL);
> +	if (!csi_dev)
> +		return -ENOMEM;
> +	csi_dev->dev =3D dev;
> +	dev_set_drvdata(dev, csi_dev);
> +
> +	csi_dev->base_addr =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csi_dev->base_addr))
> +		return PTR_ERR(csi_dev->base_addr);
> +
> +	ret =3D devm_clk_bulk_get_all(dev, &csi_dev->clks);
> +	if (ret !=3D RKCSI_CLKS_MAX)
> +		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> +	csi_dev->clks_num =3D ret;
> +
> +	csi_dev->phy =3D devm_phy_get(dev, NULL);
> +	if (IS_ERR(csi_dev->phy))
> +		return dev_err_probe(dev, PTR_ERR(csi_dev->phy),
> +				     "failed to get MIPI CSI PHY\n");
> +
> +	csi_dev->reset =3D devm_reset_control_array_get_exclusive(dev);

Why array? rockchip,rk3568-mipi-csi bindings specify a single reset.

regards
Philipp

