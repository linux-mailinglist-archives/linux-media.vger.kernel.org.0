Return-Path: <linux-media+bounces-36498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C956AF0AF5
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 07:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 697E74E2F79
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 05:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63761F4C8A;
	Wed,  2 Jul 2025 05:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ZnSOUMaF";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Kky3wToa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF491F463A;
	Wed,  2 Jul 2025 05:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751435450; cv=none; b=KLaWK8bNaplCqWTzkqvHcFej+ECRfylFPv4Bu6m8drlDR0uyq22gnHAJf19uuVcQt/DR0BH6UXZOcU4dzyHxDF2ib4q9qdJJvcB6enkXcp0oioGXUVIVNxqPWBn9RfBQcgMHcfY6EY/y2DMWWByJyW2jY7Qs3Tq2KnJn5CCBmBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751435450; c=relaxed/simple;
	bh=WhoXov5a+1nNeujaeUkS1XLjO9PxzgCVWUXNgWpuhXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aq11J4a2tnwhvKYN9MzpR694GZOYg/hlFDn4StfMc9akgQOMKO6QLJXxqPaWIlNwGwAZ9TyvfWcPFW1KjIIIOex63cMCEPQd/C5xI3r6eydv4AACc1FI57XAwq4Cp8YYBisU2nF6uZzSn3jhEXcjP+FVun41XHo82/SHkXGcWXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ZnSOUMaF; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Kky3wToa reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751435446; x=1782971446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0tclpTHrMHS60y1yV7zrGTgRYYhg83CK2pZGfbtKaU0=;
  b=ZnSOUMaFu5V53gdMxRU8873VDMBvv/ttA7IbY3R8+TGh+hdv6ZNl8p6s
   uV0SYu0sWHhA6ZOd+HvQB50diixc3+18LDP2CGFf+SZvxgKxXVU4tfyEU
   lW0TYiegKxx9QRkHfi8VCIv6qql4mEsCmfsmXpbCGI5aFgoudyssHvGwj
   ltcM3ZI/SsBwGSWeApWUhocig2L2STm8rFeLKltjTTRMTAY6jH745DfTV
   kYJA6lfvklzitwDoQhlgaOu+ogghjhYzcbqZrwQmOlkKOnGHE/01xh5Ol
   bOrvgBRCFpc1BDxzqOAJeFbReGUFivvOBBda4iIdz7gXi6F00cqCuRRo1
   A==;
X-CSE-ConnectionGUID: nJnSdhJ6SDu4fR+AA3tloA==
X-CSE-MsgGUID: Ggv87czwR1eRhnY8AKh4kA==
X-IronPort-AV: E=Sophos;i="6.16,281,1744063200"; 
   d="scan'208";a="44970666"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 02 Jul 2025 07:50:41 +0200
X-CheckPoint: {6864C8B1-31-497D558D-EBA6F5A1}
X-MAIL-CPID: 3D5640B5CBAC4465B93E5C7476A9BFE7_3
X-Control-Analysis: str=0001.0A006371.6864C8CA.001D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 619E41691FB;
	Wed,  2 Jul 2025 07:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751435437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0tclpTHrMHS60y1yV7zrGTgRYYhg83CK2pZGfbtKaU0=;
	b=Kky3wToanZl67QzaNmYjeL8TmnhGM+nbj2obC1m5EfYUhkF/OjZg6EIuRwA+gmUZgWpEgM
	LtunT9+y/whBgT4HMuhpgZNejNvWUkXNxaAUqxU7WSiFEtxJiE/qAUdolmO3VBoVTsQ1Sx
	97+Lm32lu6YJd4xZyKCLzLCQ12p4jafu+7UJSDG1IW9nbp7FYUB2ypaiJnRDDCdBowNlkb
	SyhUe+5WZgkktyXAmj19Zzc5g1/IC0UoiNNkezto0igItCNu/3G2jFLJnsaIht5FQb5Rp4
	ZmBPZjD9dbEJB3wc267UoPRq0VgBOmNwukjP11CYHnGW8WKkudUm+vnwq4tung==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Frank Li <Frank.Li@nxp.com>, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
 Jindong Yue <jindong.yue@nxp.com>
Subject: Re: [PATCH 4/7] phy: freescale: add imx93 MIPI CSI2 DPHY support
Date: Wed, 02 Jul 2025 07:50:34 +0200
Message-ID: <9474393.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250701-95_cam-v1-4-c5172bab387b@nxp.com>
References:
 <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
 <20250701-95_cam-v1-4-c5172bab387b@nxp.com>
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

thanks for the patch.

Am Mittwoch, 2. Juli 2025, 00:06:09 CEST schrieb Frank Li:
> Add driver i.MX93 MIPI DPHY controller, which is wrapper for Synosys MIPI
> CSI2 DPHY module.
>=20
> Base on
> https://github.com/nxp-imx/linux-imx/blob/lf-6.12.y/drivers/phy/freescale=
/phy-fsl-imx9-dphy-rx.c
>=20
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/phy/freescale/Kconfig                 |  10 +
>  drivers/phy/freescale/Makefile                |   1 +
>  drivers/phy/freescale/phy-fsl-imx93-dphy-rx.c | 306 ++++++++++++++++++++=
++++++
>  3 files changed, 317 insertions(+)
>=20
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> index 81f53564ee156..cb34e151e86c4 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -44,6 +44,16 @@ config PHY_FSL_IMX8QM_HSIO
>  	  Enable this to add support for the HSIO PHY as found on
>  	  i.MX8QM family of SOCs.
> =20
> +config PHY_FSL_IMX93_DPHY_RX
> +	tristate "Freescale i.MX9 DPHY Rx"
> +	depends on OF && HAS_IOMEM
> +	select GENERIC_PHY
> +	select GENERIC_PHY_MIPI_DPHY
> +	select REGMAP_MMIO
> +	help
> +	  Enable this to add support for the Synopsys DW DPHY Rx as found
> +	  on NXP's i.MX9 family.
> +
>  config PHY_FSL_SAMSUNG_HDMI_PHY
>  	tristate "Samsung HDMI PHY support"
>  	depends on OF && HAS_IOMEM && COMMON_CLK
> diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makef=
ile
> index 658eac7d0a622..8e122a07695f0 100644
> --- a/drivers/phy/freescale/Makefile
> +++ b/drivers/phy/freescale/Makefile
> @@ -4,5 +4,6 @@ obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+=3D phy-fsl-imx8qm-lvds=
=2Dphy.o
>  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+=3D phy-fsl-imx8-mipi-dphy.o
>  obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+=3D phy-fsl-imx8m-pcie.o
>  obj-$(CONFIG_PHY_FSL_IMX8QM_HSIO)	+=3D phy-fsl-imx8qm-hsio.o
> +obj-$(CONFIG_PHY_FSL_IMX93_DPHY_RX)	+=3D phy-fsl-imx93-dphy-rx.o
>  obj-$(CONFIG_PHY_FSL_LYNX_28G)		+=3D phy-fsl-lynx-28g.o
>  obj-$(CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY)	+=3D phy-fsl-samsung-hdmi.o
> diff --git a/drivers/phy/freescale/phy-fsl-imx93-dphy-rx.c b/drivers/phy/=
freescale/phy-fsl-imx93-dphy-rx.c
> new file mode 100644
> index 0000000000000..f5155ae68c50f
> --- /dev/null
> +++ b/drivers/phy/freescale/phy-fsl-imx93-dphy-rx.c
> @@ -0,0 +1,306 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/phy-mipi-dphy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define IMX93_BLK_CSI			0x48
> +#define   IMX93_BLK_CSI_CFGCLKFREQRANGE	GENMASK(5, 0)
> +#define   IMX93_BLK_CSI_HSFREQRANGE	GENMASK(14, 8)
> +
> +struct fsl_csi2_phy_drv_data {
> +	u32 max_lanes;
> +	u32 max_data_rate; /* Mbps */
> +};
> +
> +struct fsl_csi2_phy {
> +	struct device *dev;
> +	struct regmap *dphy_regmap;
> +	struct clk *cfg_clk;
> +
> +	const struct fsl_csi2_phy_drv_data *drv_data;
> +
> +	u16 hsfreqrange;
> +	u16 cfgclkfreqrange;
> +	u16 ddlfreq;
> +};
> +
> +struct dphy_mbps_hsfreqrange_map {
> +	u16 mbps;
> +	u16 hsfreqrange;
> +	u16 ddlfreq;
> +};
> +
> +/*
> + * Data rate to high speed frequency range map table
> + */
> +static const struct dphy_mbps_hsfreqrange_map hsfreqrange_table[] =3D {
> +	{ .mbps =3D 80,  .hsfreqrange =3D 0x00, .ddlfreq =3D 489 },
> +	{ .mbps =3D 90,  .hsfreqrange =3D 0x10, .ddlfreq =3D 489 },
> +	{ .mbps =3D 100, .hsfreqrange =3D 0x20, .ddlfreq =3D 489 },
> +	{ .mbps =3D 110, .hsfreqrange =3D 0x30, .ddlfreq =3D 489 },
> +	{ .mbps =3D 120, .hsfreqrange =3D 0x01, .ddlfreq =3D 489 },
> +	{ .mbps =3D 130, .hsfreqrange =3D 0x11, .ddlfreq =3D 489 },
> +	{ .mbps =3D 140, .hsfreqrange =3D 0x21, .ddlfreq =3D 489 },
> +	{ .mbps =3D 150, .hsfreqrange =3D 0x31, .ddlfreq =3D 489 },
> +	{ .mbps =3D 160, .hsfreqrange =3D 0x02, .ddlfreq =3D 489 },
> +	{ .mbps =3D 170, .hsfreqrange =3D 0x12, .ddlfreq =3D 489 },
> +	{ .mbps =3D 180, .hsfreqrange =3D 0x22, .ddlfreq =3D 489 },
> +	{ .mbps =3D 190, .hsfreqrange =3D 0x32, .ddlfreq =3D 489 },
> +	{ .mbps =3D 205, .hsfreqrange =3D 0x03, .ddlfreq =3D 489 },
> +	{ .mbps =3D 220, .hsfreqrange =3D 0x13, .ddlfreq =3D 489 },
> +	{ .mbps =3D 235, .hsfreqrange =3D 0x23, .ddlfreq =3D 489 },
> +	{ .mbps =3D 250, .hsfreqrange =3D 0x33, .ddlfreq =3D 489 },
> +	{ .mbps =3D 275, .hsfreqrange =3D 0x04, .ddlfreq =3D 489 },
> +	{ .mbps =3D 300, .hsfreqrange =3D 0x14, .ddlfreq =3D 489 },
> +	{ .mbps =3D 325, .hsfreqrange =3D 0x25, .ddlfreq =3D 489 },
> +	{ .mbps =3D 350, .hsfreqrange =3D 0x35, .ddlfreq =3D 489 },
> +	{ .mbps =3D 400, .hsfreqrange =3D 0x05, .ddlfreq =3D 489 },
> +	{ .mbps =3D 450, .hsfreqrange =3D 0x16, .ddlfreq =3D 489 },
> +	{ .mbps =3D 500, .hsfreqrange =3D 0x26, .ddlfreq =3D 489 },
> +	{ .mbps =3D 550, .hsfreqrange =3D 0x37, .ddlfreq =3D 489 },
> +	{ .mbps =3D 600, .hsfreqrange =3D 0x07, .ddlfreq =3D 489 },
> +	{ .mbps =3D 650, .hsfreqrange =3D 0x18, .ddlfreq =3D 489 },
> +	{ .mbps =3D 700, .hsfreqrange =3D 0x28, .ddlfreq =3D 489 },
> +	{ .mbps =3D 750, .hsfreqrange =3D 0x39, .ddlfreq =3D 489 },
> +	{ .mbps =3D 800, .hsfreqrange =3D 0x09, .ddlfreq =3D 489 },
> +	{ .mbps =3D 850, .hsfreqrange =3D 0x19, .ddlfreq =3D 489 },
> +	{ .mbps =3D 900, .hsfreqrange =3D 0x29, .ddlfreq =3D 489 },
> +	{ .mbps =3D 950, .hsfreqrange =3D 0x3a, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1000, .hsfreqrange =3D 0x0a, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1050, .hsfreqrange =3D 0x1a, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1100, .hsfreqrange =3D 0x2a, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1150, .hsfreqrange =3D 0x3b, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1200, .hsfreqrange =3D 0x0b, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1250, .hsfreqrange =3D 0x1b, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1300, .hsfreqrange =3D 0x2b, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1350, .hsfreqrange =3D 0x3c, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1400, .hsfreqrange =3D 0x0c, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1450, .hsfreqrange =3D 0x1c, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1500, .hsfreqrange =3D 0x2c, .ddlfreq =3D 489 },
> +	{ .mbps =3D 1550, .hsfreqrange =3D 0x3d, .ddlfreq =3D 303 },
> +	{ .mbps =3D 1600, .hsfreqrange =3D 0x0d, .ddlfreq =3D 313 },
> +	{ .mbps =3D 1650, .hsfreqrange =3D 0x1d, .ddlfreq =3D 323 },
> +	{ .mbps =3D 1700, .hsfreqrange =3D 0x2e, .ddlfreq =3D 333 },
> +	{ .mbps =3D 1750, .hsfreqrange =3D 0x3e, .ddlfreq =3D 342 },
> +	{ .mbps =3D 1800, .hsfreqrange =3D 0x0e, .ddlfreq =3D 352 },
> +	{ .mbps =3D 1850, .hsfreqrange =3D 0x1e, .ddlfreq =3D 362 },
> +	{ .mbps =3D 1900, .hsfreqrange =3D 0x1f, .ddlfreq =3D 372 },
> +	{ .mbps =3D 1950, .hsfreqrange =3D 0x3f, .ddlfreq =3D 381 },
> +	{ .mbps =3D 2000, .hsfreqrange =3D 0x0f, .ddlfreq =3D 391 },
> +	{ .mbps =3D 2050, .hsfreqrange =3D 0x40, .ddlfreq =3D 401 },
> +	{ .mbps =3D 2100, .hsfreqrange =3D 0x41, .ddlfreq =3D 411 },
> +	{ .mbps =3D 2150, .hsfreqrange =3D 0x42, .ddlfreq =3D 411 },
> +	{ .mbps =3D 2200, .hsfreqrange =3D 0x43, .ddlfreq =3D 411 },
> +	{ .mbps =3D 2250, .hsfreqrange =3D 0x44, .ddlfreq =3D 411 },
> +	{ .mbps =3D 2300, .hsfreqrange =3D 0x45, .ddlfreq =3D 411 },
> +	{ .mbps =3D 2350, .hsfreqrange =3D 0x46, .ddlfreq =3D 411 },
> +	{ .mbps =3D 2400, .hsfreqrange =3D 0x47, .ddlfreq =3D 411 },
> +	{ .mbps =3D 2450, .hsfreqrange =3D 0x48, .ddlfreq =3D 411 },
> +	{ .mbps =3D 2500, .hsfreqrange =3D 0x49, .ddlfreq =3D 411 },
> +	{ /* sentinel */ },
> +};
> +
> +static int fsl_csi2_phy_init(struct phy *phy)
> +{
> +	struct fsl_csi2_phy *priv =3D phy_get_drvdata(phy);
> +
> +	return pm_runtime_get_sync(priv->dev);
> +}
> +
> +static int fsl_csi2_phy_exit(struct phy *phy)
> +{
> +	struct fsl_csi2_phy *priv =3D phy_get_drvdata(phy);
> +
> +	return pm_runtime_put(priv->dev);
> +}
> +
> +static int fsl_csi2_phy_power_on(struct phy *phy)
> +{
> +	struct fsl_csi2_phy *priv =3D phy_get_drvdata(phy);
> +
> +	regmap_update_bits(priv->dphy_regmap, IMX93_BLK_CSI,
> +			   IMX93_BLK_CSI_CFGCLKFREQRANGE,
> +			   FIELD_PREP(IMX93_BLK_CSI_CFGCLKFREQRANGE, priv->cfgclkfreqrange));
> +
> +	regmap_update_bits(priv->dphy_regmap, IMX93_BLK_CSI,
> +			   IMX93_BLK_CSI_HSFREQRANGE,
> +			   FIELD_PREP(IMX93_BLK_CSI_HSFREQRANGE, priv->hsfreqrange));
> +
> +	return 0;
> +}
> +
> +static int set_freqrange_by_mpbs(struct fsl_csi2_phy *priv, u64 mbps)
> +{
> +	const struct dphy_mbps_hsfreqrange_map *prev_value =3D NULL;
> +	const struct dphy_mbps_hsfreqrange_map *value;
> +
> +	for (value =3D hsfreqrange_table; value->mbps; value++) {
> +		if (value->mbps >=3D mbps)
> +			break;
> +		prev_value =3D value;
> +	}
> +
> +	if (prev_value &&
> +	    ((mbps - prev_value->mbps) <=3D (value->mbps - mbps)))
> +		value =3D prev_value;
> +
> +	if (!value->mbps) {
> +		pr_err("Unsupported PHY speed (%llu Mbps)", mbps);
> +		return -ERANGE;
> +	}
> +
> +	priv->hsfreqrange =3D value->hsfreqrange;
> +	priv->ddlfreq =3D value->ddlfreq;

I'm wondering if it's worth storing a pointer to the table entry instead.

> +
> +	return 0;
> +}
> +
> +static int fsl_csi2_phy_configure(struct phy *phy, union phy_configure_o=
pts *opts)
> +{
> +	struct fsl_csi2_phy *priv =3D phy_get_drvdata(phy);
> +	const struct fsl_csi2_phy_drv_data *drv_data =3D priv->drv_data;
> +	struct phy_configure_opts_mipi_dphy *config =3D &opts->mipi_dphy;
> +	struct device *dev =3D priv->dev;
> +	u64 data_rate_mbps;
> +	int ret;
> +
> +	if (config->lanes > drv_data->max_lanes) {
> +		dev_err(dev, "The number of lanes has exceeded the maximum value\n");
> +		return -EINVAL;
> +	}
> +
> +	data_rate_mbps =3D div_u64(config->hs_clk_rate, 1000 * 1000);
> +	if (data_rate_mbps < 80 ||
> +	    data_rate_mbps > drv_data->max_data_rate) {
> +		dev_err(dev, "Out-of-bound lane rate %llu\n", data_rate_mbps);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "Number of lanes: %d, data rate=3D%llu(Mbps)\n",
> +		config->lanes, data_rate_mbps);
> +
> +	ret =3D set_freqrange_by_mpbs(priv, data_rate_mbps);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops fsl_csi2_phy_ops =3D {
> +	.init =3D fsl_csi2_phy_init,
> +	.exit =3D fsl_csi2_phy_exit,
> +	.power_on =3D fsl_csi2_phy_power_on,
> +	.configure =3D fsl_csi2_phy_configure,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static const struct fsl_csi2_phy_drv_data imx93_dphy_drvdata =3D {
> +	.max_lanes =3D 2,
> +	.max_data_rate =3D 1500,
> +};
> +
> +static int fsl_csi2_runtime_suspend(struct device *dev)
> +{
> +	struct fsl_csi2_phy *priv =3D dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(priv->cfg_clk);
> +
> +	return 0;
> +}
> +
> +static int fsl_csi2_runtime_resume(struct device *dev)
> +{
> +	struct fsl_csi2_phy *priv =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(priv->cfg_clk);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(fsl_csi2_pm_ops, fsl_csi2_runtime_suspe=
nd,
> +				 fsl_csi2_runtime_resume, NULL);
> +
> +static const struct of_device_id fsl_csi2_phy_of_match[] =3D {
> +	{ .compatible =3D "fsl,imx93-dphy-rx", .data =3D &imx93_dphy_drvdata},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, fsl_csi2_phy_of_match);
> +
> +static int fsl_csi2_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct phy_provider *phy_provider;
> +	struct fsl_csi2_phy *priv;
> +	unsigned long cfg_rate;
> +	struct phy *phy;
> +
> +	if (!dev->parent || !dev->parent->of_node)
> +		return -ENODEV;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D dev;
> +	priv->drv_data =3D of_device_get_match_data(dev);
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->dphy_regmap =3D syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(priv->dphy_regmap))
> +		dev_err_probe(dev, -ENODEV, "Failed to DPHY regmap\n");
> +
> +	priv->cfg_clk =3D devm_clk_get(dev, "cfg");
> +	if (IS_ERR(priv->cfg_clk))
> +		dev_err_probe(dev, PTR_ERR(priv->cfg_clk), "Failed to get DPHY config =
clock\n");
> +
> +	/* cfgclkfreqrange[5:0] =3D round[(cfg_clk(MHz) - 17) * 4] */

Please move this comment directly above the calculation below.

Best regards,
Alexander

> +	cfg_rate =3D clk_get_rate(priv->cfg_clk);
> +	if (!cfg_rate)
> +		dev_err_probe(dev, -EINVAL, "Failed to get PHY config clock rate\n");
> +
> +	priv->cfgclkfreqrange =3D (div_u64(cfg_rate, 1000 * 1000) - 17) * 4;
> +
> +	phy =3D devm_phy_create(dev, np, &fsl_csi2_phy_ops);
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, -ENODEV, "Failed to create PHY\n");
> +
> +	phy_set_drvdata(phy, priv);
> +
> +	pm_runtime_set_suspended(dev);
> +	devm_pm_runtime_enable(dev);
> +
> +	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static struct platform_driver fsl_csi2_phy_driver =3D {
> +	.probe	=3D fsl_csi2_phy_probe,
> +	.driver =3D {
> +		.name =3D "imx-mipi-dphy-rx",
> +		.pm =3D pm_ptr(&fsl_csi2_pm_ops),
> +		.of_match_table	=3D fsl_csi2_phy_of_match,
> +	}
> +};
> +module_platform_driver(fsl_csi2_phy_driver);
> +
> +MODULE_DESCRIPTION("i.MX9 Synopsys DesignWare MIPI DPHY Rx wrapper drive=
r");
> +MODULE_AUTHOR("NXP Semiconductor");
> +MODULE_LICENSE("GPL");
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



