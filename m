Return-Path: <linux-media+bounces-36499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ABCAF0B3B
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 08:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31910188162A
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 06:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96502204C07;
	Wed,  2 Jul 2025 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="WxpjwqwV";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WuZNgWC+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A402AE8B;
	Wed,  2 Jul 2025 06:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751436292; cv=none; b=QzVX7fe4TJbftCofTEXB4lGJsSo+oPuDLTDYhyHQnJgw9MpLNCAK6s4sv3NrvpvWWcpnRO6J6tp4Uozgsca+pHsysxMVgU+JGi9BoRChFbZ7gMU1LNTRsuf7pYsgXAHQbuSfJ7B/Si0F7RGg3D+c9VJRs4Pdw0ix2JbBnraomts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751436292; c=relaxed/simple;
	bh=iE1Qa1O08zgGUQ9U8bAu8ZmpGhAjpYnRD4GKgrhOZIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mcx9jDtdD96qY5xYOHWmkGA8+Kf2d9xIsjZSgzTNDXP9pm5/4I0bYETy7HEoxK8NTwKt0QQrxEw7tC310I0ihWtRWBTxT/3HB+2kal7sZl7A4DIaiR+XhokFgsm9Cez4W2oxIPWS1j3NphiVrEY5EUwpX1ol6kTiAKPhm96YBYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=WxpjwqwV; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=WuZNgWC+ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751436287; x=1782972287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OV53IEWwEDTTRlXpkVnoptAVZCHi+93GwOV4TIoYshE=;
  b=WxpjwqwVtj3Doq1HYdOHrUnO0a575osTZbeUM5vRrA90TrReTNROkD6L
   Y0nTMApYmmsiNH2C+evaOB/lCGryKjU6/oYBFSs9S224vhpT8Ag9ciqvD
   7js6aJGVqxaN/CzNfsvf7bl3mz0MeaL4qZqTOTO7D5AJVXzYdRPW5aX8X
   onuAnp99caIMq/w1ojKQaIpIrGvbtJaeEIUmAXg2YNjv50h8iEGpxAlS5
   CzyAPkdM6Z6mQxhSJDrIH0fqYfxPt2GUwEzlZH1O1cqtWfNfbszTHh80E
   RSVzb2DjzhF1Oab1Nh3iNBBjqbYih03KtlhPObr3nSne+xvXZm9XP0Rr1
   w==;
X-CSE-ConnectionGUID: TvOF+xKyTAeg8Rv0qAeQHQ==
X-CSE-MsgGUID: 70meUJAaR/ue0Skw6iZVJw==
X-IronPort-AV: E=Sophos;i="6.16,281,1744063200"; 
   d="scan'208";a="44971237"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 02 Jul 2025 08:04:43 +0200
X-CheckPoint: {6864CBFB-22-B6FA1C9B-ED1A9D03}
X-MAIL-CPID: 32F67E8275DB11609814F9C71730DEFE_2
X-Control-Analysis: str=0001.0A006372.6864CC30.001B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 647C5160F80;
	Wed,  2 Jul 2025 08:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751436279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OV53IEWwEDTTRlXpkVnoptAVZCHi+93GwOV4TIoYshE=;
	b=WuZNgWC+ClDiyDuIvCSRSoLyGzQEJ6recOBDQnecvKNcdXI3sM1eqfH3w/b6qk9m5bg7J9
	MBWwSPJZ/FT/0ClkCPD2Po++834BypHXcly8mvX1b/lBECwOaVKZLli27RdvYzFjfKWKz5
	sgBYI0qTTsqTXXZ65MhhcyLydny/6mu/N0Z0e66uno9vy6F7h7AjLx4COzHWTjxWGsCSiu
	nKMOPIC4irf/T8mA/6Tq4xUSzRLC20vAz2+TndaynJuoW4dG5xVivmnWHCaSrZp7nSZwN5
	k9guGOA1eNSJ2MJkkON2EXZLvDb9Tfx9djfXnMBX/h/V45s6xMpd3vq12U1TsA==
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
 Frank Li <Frank.Li@nxp.com>, "Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject:
 Re: [PATCH 5/7] media: nxp: add DesignWare MIPI CSI2 controller driver
Date: Wed, 02 Jul 2025 08:04:36 +0200
Message-ID: <1933947.CQOukoFCf9@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250701-95_cam-v1-5-c5172bab387b@nxp.com>
References:
 <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
 <20250701-95_cam-v1-5-c5172bab387b@nxp.com>
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

Am Mittwoch, 2. Juli 2025, 00:06:10 CEST schrieb Frank Li:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>=20
> Add V4L2 subdev driver for DesignWare MIPI CSI2 controller.
>=20
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  MAINTAINERS                                |    1 +
>  drivers/media/platform/nxp/Kconfig         |   11 +
>  drivers/media/platform/nxp/Makefile        |    1 +
>  drivers/media/platform/nxp/dwc-mipi-csi2.c | 1675 ++++++++++++++++++++++=
++++++
>  4 files changed, 1688 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e208c91f1405f..f67db23cb9d6f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15022,6 +15022,7 @@ F:	Documentation/devicetree/bindings/media/nxp,im=
x-mipi-csi2.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
>  F:	Documentation/devicetree/bindings/media/snps,dw-mipi-csi2-v150.yaml
> +F:	drivers/media/platform/nxp/dwc-mipi-csi2.c
>  F:	drivers/media/platform/nxp/imx-mipi-csis.c
>  F:	drivers/media/platform/nxp/imx-parallel-csi.c
>  F:	drivers/media/platform/nxp/imx7-media-csi.c
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/=
nxp/Kconfig
> index 5df6f97d16f29..b7a4aed706443 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -4,6 +4,17 @@
> =20
>  comment "NXP media platform drivers"
> =20
> +config VIDEO_DWC_MIPI_CSIS
> +	tristate "DesignWare Cores MIPI CSI-2 receiver found on i.MX93"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  Video4Linux2 sub-device driver for the DesignWare Cores MIPI
> +	  CSI-2 receiver used on i.MX93.
> +
>  config VIDEO_IMX7_CSI
>  	tristate "NXP CSI Bridge driver"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform=
/nxp/Makefile
> index 9a9b2a1d6886c..a0a025c169aca 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -4,6 +4,7 @@ obj-y +=3D dw100/
>  obj-y +=3D imx-jpeg/
>  obj-y +=3D imx8-isi/
> =20
> +obj-$(CONFIG_VIDEO_DWC_MIPI_CSIS) +=3D dwc-mipi-csi2.o
>  obj-$(CONFIG_VIDEO_IMX7_CSI) +=3D imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) +=3D imx8mq-mipi-csi2.o
>  obj-$(CONFIG_VIDEO_IMX_PARALLEL_CSI) +=3D imx-parallel-csi.o
> diff --git a/drivers/media/platform/nxp/dwc-mipi-csi2.c b/drivers/media/p=
latform/nxp/dwc-mipi-csi2.c
> new file mode 100644
> index 0000000000000..cd57c06b95848
> --- /dev/null
> +++ b/drivers/media/platform/nxp/dwc-mipi-csi2.c
> @@ -0,0 +1,1675 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/errno.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* MIPI CSI-2 Host Controller Registers Define */
> +
> +/* Core Version */
> +#define CSI2RX_VERSION					0x0
> +
> +/* Number of Lanes */
> +#define CSI2RX_N_LANES					0x4
> +#define   CSI2RX_N_LANES_N_LANES(x)			FIELD_PREP(GENMASK(2, 0), (x) - 1)
> +
> +/* Logic Reset */
> +#define CSI2RX_HOST_RESETN				0x8
> +#define   CSI2RX_HOST_RESETN_ENABLE			BIT(0)
> +
> +/* Main Interrupt Status */
> +#define CSI2RX_INT_ST_MAIN				0xc
> +#define   CSI2RX_INT_ST_MAIN_FATAL_ERR_PHY		BIT(0)
> +#define   CSI2RX_INT_ST_MAIN_FATAL_ERR_PKT		BIT(1)
> +#define   CSI2RX_INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL	BIT(2)
> +#define   CSI2RX_INT_ST_MAIN_FATAL_ERR_SEQ_FRAME	BIT(3)
> +#define   CSI2RX_INT_ST_MAIN_FATAL_ERR_CRC_FRAME	BIT(4)
> +#define   CSI2RX_INT_ST_MAIN_FATAL_ERR_PLD_CRC		BIT(5)
> +#define   CSI2RX_INT_ST_MAIN_ERR_DID			BIT(6)
> +#define   CSI2RX_INT_ST_MAIN_ERR_ECC			BIT(7)
> +#define   CSI2RX_INT_ST_MAIN_ERR_PHY			BIT(16)
> +#define   CSI2RX_INT_ST_MAIN_FATAL_ERR_IPI		BIT(18)
> +
> +/* Data monitor */
> +#define CSI2RX_DATA_IDS_1_DT				0x10
> +#define   CSI2RX_DATA_IDS_1_DT_DATA_ID0(x)		FIELD_PREP(GENMASK(5, 0), (x=
))
> +#define   CSI2RX_DATA_IDS_1_DT_DATA_ID1(x)		FIELD_PREP(GENMASK(13, 8), (=
x))
> +#define   CSI2RX_DATA_IDS_1_DT_DATA_ID2(x)		FIELD_PREP(GENMASK(21, 16), =
(x))
> +#define   CSI2RX_DATA_IDS_1_DT_DATA_ID3(x)		FIELD_PREP(GENMASK(29, 24), =
(x))
> +
> +#define CSI2RX_DATA_IDS_2_DT				0x14
> +#define   CSI2RX_DATA_IDS_2_DT_DATA_ID4(x)		FIELD_PREP(GENMASK(5, 0), (x=
))
> +#define   CSI2RX_DATA_IDS_2_DT_DATA_ID5(x)		FIELD_PREP(GENMASK(13, 8), (=
x))
> +#define   CSI2RX_DATA_IDS_2_DT_DATA_ID6(x)		FIELD_PREP(GENMASK(21, 16), =
(x))
> +#define   CSI2RX_DATA_IDS_2_DT_DATA_ID7(x)		FIELD_PREP(GENMASK(29, 24), =
(x))
> +
> +#define CSI2RX_DATA_IDS_1_VC				0x30
> +#define   CSI2RX_DATA_IDS_1_VC_DATA_ID0(x)		FIELD_PREP(GENMASK(3, 0), (x=
))
> +#define   CSI2RX_DATA_IDS_1_VC_DATA_ID1(x)		FIELD_PREP(GENMASK(11, 8), (=
x))
> +#define   CSI2RX_DATA_IDS_1_VC_DATA_ID2(x)		FIELD_PREP(GENMASK(19, 16), =
(x))
> +#define   CSI2RX_DATA_IDS_1_VC_DATA_ID3(x)		FIELD_PREP(GENMASK(27, 24), =
(x))
> +
> +#define CSI2RX_DATA_IDS_2_VC				0x34
> +#define   CSI2RX_DATA_IDS_2_VC_DATA_ID4(x)		FIELD_PREP(GENMASK(3, 0), (x=
))
> +#define   CSI2RX_DATA_IDS_2_VC_DATA_ID5(x)		FIELD_PREP(GENMASK(11, 8), (=
x))
> +#define   CSI2RX_DATA_IDS_2_VC_DATA_ID6(x)		FIELD_PREP(GENMASK(19, 16), =
(x))
> +#define   CSI2RX_DATA_IDS_2_VC_DATA_ID7(x)		FIELD_PREP(GENMASK(27, 24), =
(x))
> +
> +/* PHY Shutdown */
> +#define CSI2RX_DPHY_SHUTDOWNZ				0x40
> +#define   CSI2RX_DPHY_SHUTDOWNZ_ENABLE			BIT(0)
> +
> +/* DPHY Reset */
> +#define CSI2RX_DPHY_RSTZ				0x44
> +#define   CSI2RX_DPHY_RSTZ_ENABLE			BIT(0)
> +
> +/* RX PHY Status */
> +#define CSI2RX_DPHY_RX_STATUS				0x48
> +#define   CSI2RX_DPHY_RX_STATUS_DATA_LANE0_ULP		BIT(0)
> +#define   CSI2RX_DPHY_RX_STATUS_DATA_LANE1_ULP		BIT(1)
> +#define   CSI2RX_DPHY_RX_STATUS_CLK_LANE_ULP		BIT(16)
> +#define   CSI2RX_DPHY_RX_STATUS_CLK_LANE_HS		BIT(17)
> +
> +/* STOP STATE PHY Status */
> +#define CSI2RX_DPHY_STOPSTATE				0x4c
> +#define   CSI2RX_DPHY_STOPSTATE_DATA_LANE0		BIT(0)
> +#define   CSI2RX_DPHY_STOPSTATE_DATA_LANE1		BIT(1)
> +#define   CSI2RX_DPHY_STOPSTATE_DATA_LANE2		BIT(2)
> +#define   CSI2RX_DPHY_STOPSTATE_DATA_LANE3		BIT(3)
> +#define   CSI2RX_DPHY_STOPSTATE_CLK_LANE		BIT(16)
> +
> +/* DPHY Test and Control Interface 1 */
> +#define CSI2RX_DPHY_TEST_CTRL0				0x50
> +#define   CSI2RX_DPHY_TEST_CTRL0_TEST_CLR		BIT(0)
> +#define   CSI2RX_DPHY_TEST_CTRL0_TEST_CLKEN		BIT(1)
> +
> +/* DPHY Test and Control Interface 2 */
> +#define CSI2RX_DPHY_TEST_CTRL1				0x54
> +#define   CSI2RX_DPHY_TEST_CTRL1_TEST_DIN(x)		FIELD_PREP(GENMASK(7, 0), =
(x))
> +#define   CSI2RX_DPHY_TEST_CTRL1_TEST_DOUT(x)		FIELD_GET(GENMASK(15, 8),=
 (x))
> +#define   CSI2RX_DPHY_TEST_CTRL1_TEST_EN			BIT(16)
> +
> +/* Pattern Generator vertical Resolution */
> +#define CSI2RX_PPI_PG_PATTERN_VRES			0x60
> +#define   CSI2RX_PPI_PG_PATTERN_VRES_VRES(x)		FIELD_PREP(GENMASK(15, 0),=
 (x))
> +
> +/* Pattern Generator horizontal Resolution */
> +#define CSI2RX_PPI_PG_PATTERN_HRES			0x64
> +#define   CSI2RX_PPI_PG_PATTERN_HRES_HRES(x)		FIELD_PREP(GENMASK(15, 0),=
 (x))
> +
> +/* Pattern Generator */
> +#define CSI2RX_PPI_PG_CONFIG				0x68
> +#define   CSI2RX_PPI_PG_CONFIG_PG_MODE(x)		FIELD_PREP(1, (x))
> +#define   CSI2RX_PPI_PG_CONFIG_DATA_TYPE(x)		FIELD_PREP(GENMASK(13, 8), =
(x))
> +#define   CSI2RX_PPI_PG_CONFIG_VIR_CHAN(x)		FIELD_PREP(GENMASK(15, 14), =
(x))
> +#define   CSI2RX_PPI_PG_CONFIG_VIR_CHAN_EX(x)		FIELD_PREP(GENMASK(17, 16=
), (x))
> +#define   CSI2RX_PPI_PG_CONFIG_VIR_CHAN_EX_2_EN		BIT(18)
> +
> +/* Pattern Generator Enable */
> +#define CSI2RX_PPI_PG_ENABLE				0x6c
> +#define   CSI2RX_PPI_PG_ENABLE_EN			BIT(0)
> +
> +/* Pattern Generator Status */
> +#define CSI2RX_PPI_PG_STATUS				0x70
> +#define   CSI2RX_PPI_PG_STATUS_ACTIVE			BIT(0)
> +
> +/* IPI Mode */
> +#define CSI2RX_IPI_MODE					0x80
> +#define   CSI2RX_IPI_MODE_CONTROLLER			BIT(1)
> +#define   CSI2RX_IPI_MODE_COLOR_MODE16			BIT(8)
> +#define   CSI2RX_IPI_MODE_CUT_THROUGH			BIT(16)
> +#define   CSI2RX_IPI_MODE_ENABLE			BIT(24)
> +
> +/* IPI Virtual Channel */
> +#define CSI2RX_IPI_VCID					0x84
> +#define   CSI2RX_IPI_VCID_VC(x)				FIELD_PREP(GENMASK(1, 0), (x))
> +#define   CSI2RX_IPI_VCID_VC_0_1(x)			FIELD_PREP(GENMASK(3, 2), (x))
> +#define   CSI2RX_IPI_VCID_VC_2				BIT(4)
> +
> +/* IPI Data Type */
> +#define CSI2RX_IPI_DATA_TYPE				0x88
> +#define   CSI2RX_IPI_DATA_TYPE_DT(x)			FIELD_PREP(GENMASK(5, 0), (x))
> +#define   CSI2RX_IPI_DATA_TYPE_EMB_DATA_EN		BIT(8)
> +
> +/* IPI Flush Memory */
> +#define CSI2RX_IPI_MEM_FLUSH				0x8c
> +#define   CSI2RX_IPI_MEM_FLUSH_AUTO			BIT(8)
> +
> +/* IPI HSA */
> +#define CSI2RX_IPI_HSA_TIME				0x90
> +#define   CSI2RX_IPI_HSA_TIME_VAL(x)			FIELD_PREP(GENMASK(11, 0), (x))
> +
> +/* IPI HBP */
> +#define CSI2RX_IPI_HBP_TIME				0x94
> +#define   CSI2RX_IPI_HBP_TIME_VAL(x)			FIELD_PREP(GENMASK(11, 0), (x))
> +
> +/* IPI HSD */
> +#define CSI2RX_IPI_HSD_TIME				0x98
> +#define   CSI2RX_IPI_HSD_TIME_VAL(x)			FIELD_PREP(GENMASK(11, 0), (x))
> +
> +/* IPI HLINE */
> +#define CSI2RX_IPI_HLINE_TIME				0x9C
> +#define   CSI2RX_IPI_HLINE_TIME_VAL(x)			FIELD_PREP(GENMASK(14, 0), (x))
> +
> +/* IPI Soft Reset */
> +#define CSI2RX_IPI_SOFTRSTN				0xa0
> +
> +/* IPI Advanced Features */
> +#define CSI2RX_IPI_ADV_FEATURES				0xac
> +#define   CSI2RX_IPI_ADV_FEATURES_DT_OVER_WRITE_EN	BIT(0)
> +#define   CSI2RX_IPI_ADV_FEATURES_DT_OVER_WRITE(x)	FIELD_PREP(GENMASK(13=
, 8), (x))
> +#define   CSI2RX_IPI_ADV_FEATURES_LINE_EVENT_SEL	BIT(16)
> +#define   CSI2RX_IPI_ADV_FEATURES_SYNC_VIDEO_PKT	BIT(17)
> +#define   CSI2RX_IPI_ADV_FEATURES_SYNC_LS_PKT		BIT(18)
> +#define   CSI2RX_IPI_ADV_FEATURES_SYNC_NULL_PKT		BIT(19)
> +#define   CSI2RX_IPI_ADV_FEATURES_SYNC_BLANKING_PKT	BIT(20)
> +#define   CSI2RX_IPI_ADV_FEATURES_SYNC_EMBEDDED_PKT	BIT(21)
> +#define   CSI2RX_IPI_ADV_FEATURES_SYNC_EVENT_MODE	BIT(24)
> +
> +/* IPI VSA */
> +#define CSI2RX_IPI_VSA_LINES				0xb0
> +#define   CSI2RX_IPI_VSA_LINES_VAL(x)			FIELD_PREP(GENMASK(9, 0), (x))
> +
> +/* IPI VBP */
> +#define CSI2RX_IPI_VBP_LINES				0xb4
> +#define   CSI2RX_IPI_VBP_LINES_VAL(x)			FIELD_PREP(GENMASK(9, 0), (x))
> +
> +/* IPI VFP */
> +#define CSI2RX_IPI_VFP_LINES				0xb8
> +#define   CSI2RX_IPI_VFP_LINES_VAL(x)			FIELD_PREP(GENMASK(9, 0), (x))
> +
> +/* IPI VACTIVE */
> +#define CSI2RX_IPI_VACTIVE_LINES			0xbc
> +#define   CSI2RX_IPI_VACTIVE_LINES_VAL(x)		FIELD_PREP(GENMASK(13, 0), (x=
))
> +
> +/* Fatal Interruption Caused by PHY */
> +#define CSI2RX_INT_ST_DPHY_FATAL			0xe0
> +#define   CSI2RX_INT_ST_DPHY_FATAL_ERR_SOT_LANE0	BIT(0)
> +#define   CSI2RX_INT_ST_DPHY_FATAL_ERR_SOT_LANE1	BIT(1)
> +
> +/* Mask for Fatal Interruption Caused by PHY */
> +#define CSI2RX_INT_MSK_DPHY_FATAL			0xe4
> +#define   CSI2RX_INT_MSK_DPHY_FATAL_ERR_SOT_LANE0	BIT(0)
> +#define   CSI2RX_INT_MSK_DPHY_FATAL_ERR_SOT_LANE1	BIT(1)
> +
> +/* Force for Fatal Interruption Caused by PHY */
> +#define CSI2RX_INT_FORCE_DPHY_FATAL			0xe8
> +
> +/* Fatal Interruption Caused During Packet Construction */
> +#define CSI2RX_INT_ST_PKT_FATAL				0xf0
> +#define   CSI2RX_INT_ST_PKT_FATAL_ERR_ECC		BIT(0)
> +#define   CSI2RX_INT_ST_PKT_FATAL_ERR_PAYLOAD		BIT(1)
> +
> +/* Mask for Fatal Interruption Caused During Packet Construction */
> +#define CSI2RX_INT_MSK_PKT_FATAL			0xf4
> +#define   CSI2RX_INT_MSK_PKT_FATAL_ERR_ECC		BIT(0)
> +#define   CSI2RX_INT_MSK_PKT_FATAL_ERR_PAYLOAD		BIT(1)
> +
> +/* Force for Fatal Interruption Caused During Packet Construction */
> +#define CSI2RX_INT_FORCE_PKT_FATAL			0xf8
> +
> +/* Interruption Caused by PHY */
> +#define CSI2RX_INT_ST_DPHY				0x110
> +#define   CSI2RX_INT_ST_DPHY_ERR_SOT_LANE0		BIT(0)
> +#define   CSI2RX_INT_ST_DPHY_ERR_SOT_LANE1		BIT(1)
> +#define   CSI2RX_INT_ST_DPHY_ERR_ESC_LANE0		BIT(16)
> +#define   CSI2RX_INT_ST_DPHY_ERR_ESC_LANE1		BIT(17)
> +
> +/* Mask for Interruption Caused by PHY */
> +#define CSI2RX_INT_MSK_DPHY				0x114
> +#define   CSI2RX_INT_MSK_DPHY_SOT_ERR_LANE0		BIT(0)
> +#define   CSI2RX_INT_MSK_DPHY_SOT_ERR_LANE1		BIT(1)
> +#define   CSI2RX_INT_MSK_DPHY_ESC_ERR_LANE0		BIT(16)
> +#define   CSI2RX_INT_MSK_DPHY_ESC_ERR_LANE1		BIT(17)
> +
> +/* Force for Interruption Caused by PHY */
> +#define CSI2RX_INT_FORCE_DPHY				0x118
> +
> +/* Fatal Interruption Caused by IPI Interface */
> +#define CSI2RX_INT_ST_IPI_FATAL				0x140
> +#define   CSI2RX_INT_ST_IPI_FATAL_ERR_IFFIFO_UNDERFLOW	BIT(0)
> +#define   CSI2RX_INT_ST_IPI_FATAL_ERR_IFFIFO_OVERFLOW	BIT(1)
> +#define   CSI2RX_INT_ST_IPI_FATAL_ERR_FRAME_SYNC	BIT(2)
> +#define   CSI2RX_INT_ST_IPI_FATAL_ERR_FIFO_NOT_EMPTY	BIT(3)
> +#define   CSI2RX_INT_ST_IPI_FATAL_ERR_HLINE_TIME	BIT(4)
> +#define   CSI2RX_INT_ST_IPI_FATAL_ERR_FIFO_OVERFLOW	BIT(5)
> +#define   CSI2RX_INT_ST_IPI_FATAL_ERR_PD_FIFO_OVERFLOW	BIT(6)
> +
> +/* Mask for Fatal Interruption Caused by IPI Interface */
> +#define CSI2RX_INT_MSK_IPI_FATAL			0x144
> +#define   CSI2RX_INT_MSK_IPI_FATAL_ERR_IFFIFO_UNDERFLOW	BIT(0)
> +#define   CSI2RX_INT_MSK_IPI_FATAL_ERR_IFFIFO_OVERFLOW	BIT(1)
> +#define   CSI2RX_INT_MSK_IPI_FATAL_ERR_FRAME_SYNC	BIT(2)
> +#define   CSI2RX_INT_MSK_IPI_FATAL_ERR_FIFO_NOT_EMPTY	BIT(3)
> +#define   CSI2RX_INT_MSK_IPI_FATAL_ERR_HLINE_TIME	BIT(4)
> +#define   CSI2RX_INT_MSK_IPI_FATAL_ERR_FIFO_OVERFLOW	BIT(5)
> +#define   CSI2RX_INT_MSK_IPI_FATAL_ERR_PD_FIFO_OVERFLOW	BIT(6)
> +
> +/* Force for Fatal Interruption Caused by IPI Interface */
> +#define CSI2RX_INT_FORCE_IPI_FATAL			0x148
> +
> +/* Data De-Scrambling */
> +#define CSI2RX_SCRAMBLING				0x300
> +
> +/* De-scrambler Seed for Lane 1 */
> +#define CSI2RX_SCRAMBLING_SEED1				0x304
> +
> +/* De-scrambler Seed for Lane 2 */
> +#define CSI2RX_SCRAMBLING_SEED2				0x308
> +
> +#define DWC_CSI2RX_PAD_SINK				0
> +#define DWC_CSI2RX_PAD_SOURCE				1
> +#define DWC_CSI2RX_PADS_NUM				2
> +
> +#define DWC_CSI2RX_DEF_MBUS_CODE			MEDIA_BUS_FMT_UYVY8_1X16
> +#define DWC_CSI2RX_DEF_PIX_WIDTH			1920U
> +#define DWC_CSI2RX_DEF_PIX_HEIGHT			1080U
> +#define DWC_CSI2RX_MAX_PIX_WIDTH			0xffff
> +#define DWC_CSI2RX_MAX_PIX_HEIGHT			0xffff
> +
> +struct dwc_csi_event {
> +	u32 mask;
> +	const char * const name;
> +	unsigned int counter;
> +};
> +
> +static const struct dwc_csi_event dwc_events[] =3D {
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_IPI, "IPI Interface Fatal Error" },
> +	{ CSI2RX_INT_ST_MAIN_ERR_PHY, "PHY Error" },
> +	{ CSI2RX_INT_ST_MAIN_ERR_ECC, "Header Single Bit Error" },
> +	{ CSI2RX_INT_ST_MAIN_ERR_DID, "Data ID Error" },
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_PLD_CRC, "Payload CRC Fatal Error" },
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_CRC_FRAME, "Frame CRC Fatal Error" },
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_SEQ_FRAME, "Frame Sequence Fatal Error" =
},
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL, "Frame Boundaries Fatal Er=
ror" },
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_PKT, "Packet Construction Fatal Error" },
> +	{ CSI2RX_INT_ST_MAIN_FATAL_ERR_PHY, "PHY Fatal Error" },
> +};
> +
> +#define DWC_NUM_EVENTS		ARRAY_SIZE(dwc_events)
> +#define DWC_EVENT_MASK		0x500ff
> +
> +struct dwc_csi_pix_format {
> +	u32 code;
> +	u32 output;
> +	u32 data_type;
> +	u8 width;
> +};
> +
> +struct dwc_csi_device {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct phy *phy;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +	struct v4l2_subdev sd;
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_subdev *source_sd;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct media_pad pads[DWC_CSI2RX_PADS_NUM];
> +	u16 remote_pad;
> +
> +	struct v4l2_mbus_config_mipi_csi2 bus;
> +	u32 cfgclkfreqrange;
> +	u32 hsfreqrange;
> +	u64 enabled_streams;
> +
> +	/* Use driver mutex lock for the ctrl lock */
> +	struct mutex lock;
> +
> +	struct dwc_csi_event events[DWC_NUM_EVENTS];
> +	const struct dwc_csi_pix_format *csi_fmt;
> +
> +	/* Used for pattern generator */
> +	bool pg_enable;
> +	enum {
> +		PATTERN_DISABLED,
> +		PATTERN_VERTICAL,
> +		PATTERN_HORIZONTAL,
> +	} pg_pattern;
> +};
> +
> +/* List of supported pixel formats for the subdev */
> +static const struct dwc_csi_pix_format dwc_csi_formats[] =3D {
> +	/* YUV formats */
> +	{
> +		.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> +		.output =3D MEDIA_BUS_FMT_UYVY8_1X16,
> +		.data_type =3D MIPI_CSI2_DT_YUV422_8B,
> +		.width =3D 16,
> +	},
> +	/* RGB formats */
> +	{
> +		.code =3D MEDIA_BUS_FMT_RGB565_1X16,
> +		.output =3D MEDIA_BUS_FMT_RGB565_1X16,
> +		.data_type =3D MIPI_CSI2_DT_RGB565,
> +		.width =3D 16,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_BGR888_1X24,
> +		.output =3D MEDIA_BUS_FMT_RGB888_1X24,
> +		.data_type =3D MIPI_CSI2_DT_RGB888,
> +		.width =3D 24,
> +	},
> +	/* RAW (Bayer and greyscale) formats. */
> +	{
> +		.code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.output =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
> +		.width =3D 8,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.output =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
> +		.width =3D 8,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.output =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
> +		.width =3D 8,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.output =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
> +		.width =3D 8,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_Y8_1X8,
> +		.output =3D MEDIA_BUS_FMT_Y8_1X8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
> +		.width =3D 8,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.output =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
> +		.width =3D 10,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.output =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
> +		.width =3D 10,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.output =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
> +		.width =3D 10,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.output =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
> +		.width =3D 10,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_Y10_1X10,
> +		.output =3D MEDIA_BUS_FMT_Y10_1X10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
> +		.width =3D 10,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.output =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
> +		.width =3D 12,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.output =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
> +		.width =3D 12,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.output =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
> +		.width =3D 12,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.output =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
> +		.width =3D 12,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_Y12_1X12,
> +		.output =3D MEDIA_BUS_FMT_Y12_1X12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
> +		.width =3D 12,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.output =3D MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
> +		.width =3D 14,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.output =3D MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
> +		.width =3D 14,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.output =3D MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
> +		.width =3D 14,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.output =3D MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
> +		.width =3D 14,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.output =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> +		.data_type =3D MIPI_CSI2_DT_RAW16,
> +		.width =3D 16,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.output =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> +		.data_type =3D MIPI_CSI2_DT_RAW16,
> +		.width =3D 16,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.output =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> +		.data_type =3D MIPI_CSI2_DT_RAW16,
> +		.width =3D 16,
> +	}, {
> +		.code =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.output =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> +		.data_type =3D MIPI_CSI2_DT_RAW16,
> +		.width =3D 16,
> +	}
> +};
> +
> +static const struct v4l2_mbus_framefmt dwc_csi_default_fmt =3D {
> +	.code =3D DWC_CSI2RX_DEF_MBUS_CODE,
> +	.width =3D DWC_CSI2RX_DEF_PIX_WIDTH,
> +	.height =3D DWC_CSI2RX_DEF_PIX_HEIGHT,
> +	.field =3D V4L2_FIELD_NONE,
> +	.colorspace =3D V4L2_COLORSPACE_SMPTE170M,
> +	.xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
> +	.quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> +};
> +
> +static const struct dwc_csi_pix_format *find_csi_format(u32 code)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(dwc_csi_formats); i++)
> +		if (code =3D=3D dwc_csi_formats[i].code)
> +			return &dwc_csi_formats[i];
> +
> +	return &dwc_csi_formats[0];
> +}
> +
> +static inline void dwc_csi_write(struct dwc_csi_device *csidev, unsigned=
 int offset, u32 val)
> +{
> +	writel(val, csidev->regs + offset);
> +}
> +
> +static inline u32 dwc_csi_read(struct dwc_csi_device *csidev, unsigned i=
nt offset)
> +{
> +	return readl(csidev->regs + offset);
> +}

Please don't add simple wrappers around writel/readl. Instead consider
using regmap-mmio. This also adds the possibility to have register access
tracing.

> +
> +/*
> + * DWC MIPI CSI-2 Host Controller Hardware operation
> + */
> +static int dwc_csi_device_pg_enable(struct dwc_csi_device *csidev)
> +{
> +	const struct dwc_csi_pix_format *csi_fmt =3D csidev->csi_fmt;
> +	struct v4l2_subdev *sd =3D &csidev->sd;
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
> +	u32 val;
> +
> +	if (!csidev->pg_enable)
> +		return 0;
> +
> +	if (!csi_fmt) {
> +		dev_err(csidev->dev, "CSI pixel format is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	if (csi_fmt->data_type !=3D MIPI_CSI2_DT_RGB888) {
> +		dev_err(csidev->dev, "Pattern generator only support RGB888\n");

s/support/supports/

> +		return -EINVAL;
> +	}
> +
> +	state =3D v4l2_subdev_lock_and_get_active_state(sd);
> +	/* Pattern generator create data stream only according to stream 0 */

s/create/creates/

> +	fmt =3D v4l2_subdev_state_get_format(state, DWC_CSI2RX_PAD_SINK, 0);
> +
> +	val =3D CSI2RX_PPI_PG_PATTERN_HRES_HRES(fmt->width);
> +	dwc_csi_write(csidev, CSI2RX_PPI_PG_PATTERN_HRES, val);
> +
> +	val =3D CSI2RX_PPI_PG_PATTERN_VRES_VRES(fmt->height);
> +	dwc_csi_write(csidev, CSI2RX_PPI_PG_PATTERN_VRES, val);
> +
> +	val =3D CSI2RX_PPI_PG_CONFIG_DATA_TYPE(csi_fmt->data_type);
> +	val |=3D CSI2RX_PPI_PG_CONFIG_VIR_CHAN(0);
> +	val |=3D CSI2RX_PPI_PG_CONFIG_PG_MODE(csidev->pg_pattern);
> +	dwc_csi_write(csidev, CSI2RX_PPI_PG_CONFIG, val);
> +
> +	/*
> +	 * Select line start packets to construct vertical
> +	 * timing information for IPI interface
> +	 */
> +	val =3D CSI2RX_IPI_ADV_FEATURES_SYNC_EVENT_MODE;
> +	val |=3D CSI2RX_IPI_ADV_FEATURES_SYNC_LS_PKT;
> +	val |=3D CSI2RX_IPI_ADV_FEATURES_LINE_EVENT_SEL;
> +	dwc_csi_write(csidev, CSI2RX_IPI_ADV_FEATURES, val);
> +
> +	val =3D CSI2RX_PPI_PG_ENABLE_EN;
> +	dwc_csi_write(csidev, CSI2RX_PPI_PG_ENABLE, val);
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	return 0;
> +}
> +
> +static void dwc_csi_device_pg_disable(struct dwc_csi_device *csidev)
> +{
> +	dwc_csi_write(csidev, CSI2RX_PPI_PG_ENABLE, 0);
> +}
> +
> +static void dwc_csi_ipi_enable(struct dwc_csi_device *csidev)
> +{
> +	u32 val;
> +
> +	/* Memory is automatically flushed at each Frame Start */
> +	val =3D CSI2RX_IPI_MEM_FLUSH_AUTO;
> +	dwc_csi_write(csidev, CSI2RX_IPI_MEM_FLUSH, val);
> +
> +	/* Enable IPI */
> +	val =3D dwc_csi_read(csidev, CSI2RX_IPI_MODE);
> +	val |=3D CSI2RX_IPI_MODE_ENABLE;
> +	dwc_csi_write(csidev, CSI2RX_IPI_MODE, val);
> +}
> +
> +static void dwc_csi_ipi_disable(struct dwc_csi_device *csidev)
> +{
> +	dwc_csi_write(csidev, CSI2RX_IPI_MODE, 0);
> +}
> +
> +static void dwc_csi_device_ipi_config(struct dwc_csi_device *csidev)
> +{
> +	const struct dwc_csi_pix_format *csi_fmt =3D csidev->csi_fmt;
> +	u32 val;
> +
> +	/* Do IPI soft reset */
> +	dwc_csi_write(csidev, CSI2RX_IPI_SOFTRSTN, 0x0);
> +	dwc_csi_write(csidev, CSI2RX_IPI_SOFTRSTN, 0x1);

Use dwc_csi_device_reset()

> +
> +	/* Select virtual channel and data type to be processed by IPI */
> +	val =3D CSI2RX_IPI_DATA_TYPE_DT(csi_fmt->data_type);
> +	dwc_csi_write(csidev, CSI2RX_IPI_DATA_TYPE, val);
> +
> +	/* Set virtual channel 0 as default */
> +	val  =3D CSI2RX_IPI_VCID_VC(0);
> +	dwc_csi_write(csidev, CSI2RX_IPI_VCID, val);
> +
> +	/*
> +	 * Select IPI camera timing mode and allow the pixel stream
> +	 * to be non-continuous when pixel interface FIFO is empty
> +	 */
> +	val =3D dwc_csi_read(csidev, CSI2RX_IPI_MODE);
> +	val &=3D ~CSI2RX_IPI_MODE_CONTROLLER;
> +	val &=3D ~CSI2RX_IPI_MODE_COLOR_MODE16;

So this enables 48 Bit interface, instead of 16 Bit. What does that
mean given that IPI is an internal IP block?

> +	val |=3D CSI2RX_IPI_MODE_CUT_THROUGH;
> +	dwc_csi_write(csidev, CSI2RX_IPI_MODE, val);
> +}
> +
> +static void dwc_csi_device_reset(struct dwc_csi_device *csidev)
> +{
> +	/* Reset mipi csi host, active low */
> +	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 0);
> +	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 1);
> +}
> +
> +static void dwc_csi_device_startup(struct dwc_csi_device *csidev)
> +{
> +	/* Release DWC_mipi_csi2_host from reset */
> +	dwc_csi_device_reset(csidev);
> +
> +	phy_init(csidev->phy);
> +
> +	phy_reset(csidev->phy);
> +}
> +
> +static int dwc_csi_get_dphy_configuration(struct dwc_csi_device *csidev,
> +					  union phy_configure_opts *opts)
> +{
> +	struct phy_configure_opts_mipi_dphy *cfg =3D &opts->mipi_dphy;
> +	struct v4l2_subdev *source =3D csidev->source_sd;
> +	s64 link_freq;
> +
> +	link_freq =3D v4l2_get_link_freq(source->ctrl_handler,
> +				       csidev->csi_fmt->width,
> +				       csidev->bus.num_data_lanes * 2);
> +	if (link_freq < 0) {
> +		dev_err(csidev->dev, "Unable to obtain link frequency: %d\n",
> +			(int)link_freq);
> +		return link_freq;
> +	}
> +
> +	memset(cfg, 0x0, sizeof(*cfg));
> +	cfg->hs_clk_rate =3D link_freq * 2;
> +	cfg->lanes =3D csidev->bus.num_data_lanes;
> +
> +	return 0;
> +}
> +
> +static void dwc_csi_dphy_prep(struct dwc_csi_device *csidev)
> +{
> +	u32 val;
> +
> +	/* Release synopsis DPHY test codes from reset */
> +	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x0);
> +	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x0);
> +
> +	val =3D dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
> +	val &=3D ~CSI2RX_DPHY_TEST_CTRL0_TEST_CLR;
> +	dwc_csi_write(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
> +
> +	/*
> +	 * ndelay is not necessary have MMIO operation, need dummy read to make
> +	 * sure above write reach target.
> +	 */
> +	dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
> +	/* Wait for at least 15ns */
> +	ndelay(15);

What does the comment mean? You are reading that register twice, see below.
If you write to that register, you may need to wait 15ns before reading bac=
k.
But reading back, waiting and reading back, doesn't make sense to me.

> +
> +	val =3D dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
> +	val |=3D CSI2RX_DPHY_TEST_CTRL0_TEST_CLR;
> +	dwc_csi_write(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
> +}
> +
> +static void dwc_csi_dphy_release_reset(struct dwc_csi_device *csidev)
> +{
> +	/* Release PHY from reset */
> +	dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x1);
> +	/*
> +	 * ndelay is not necessary have MMIO operation, need dummy read to make
> +	 * sure above write reach target.
> +	 */
> +	dwc_csi_read(csidev, CSI2RX_DPHY_SHUTDOWNZ);
> +	ndelay(5);
> +	dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x1);
> +	dwc_csi_read(csidev, CSI2RX_DPHY_RSTZ);
> +	ndelay(5);
> +}
> +
> +static int dwc_csi_device_init(struct dwc_csi_device *csidev)
> +{
> +	struct device *dev =3D csidev->dev;
> +	union phy_configure_opts opts;
> +	u32 phy_stopstate;
> +	u32 val;
> +	int ret;
> +
> +	ret =3D dwc_csi_get_dphy_configuration(csidev, &opts);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D phy_set_mode(csidev->phy, PHY_MODE_MIPI_DPHY);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D phy_configure(csidev->phy, &opts);
> +	if (ret)
> +		return ret;
> +
> +	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 0);
> +	dwc_csi_dphy_prep(csidev);
> +	dwc_csi_write(csidev, CSI2RX_N_LANES, CSI2RX_N_LANES_N_LANES(opts.mipi_=
dphy.lanes));
> +	ret =3D phy_power_on(csidev->phy);
> +	dwc_csi_dphy_release_reset(csidev);
> +	dwc_csi_write(csidev, CSI2RX_HOST_RESETN, 0x1);
> +
> +	if (ret)
> +		return ret;
> +
> +	/* Check if lanes are in stop state */
> +	phy_stopstate =3D CSI2RX_DPHY_STOPSTATE_CLK_LANE;
> +	phy_stopstate |=3D GENMASK(csidev->bus.num_data_lanes - 1, 0);
> +	ret =3D readl_poll_timeout(csidev->regs + CSI2RX_DPHY_STOPSTATE,
> +				 val, (val & phy_stopstate) !=3D phy_stopstate,
> +				 10, 10000);
> +	if (ret) {
> +		dev_err(dev, "Lanes are not in stop state(%#x)\n", val);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void dwc_csi_device_hs_rx_start(struct dwc_csi_device *csidev)
> +{
> +	dwc_csi_ipi_enable(csidev);
> +}
> +
> +static int dwc_csi_device_hs_rx_stop(struct dwc_csi_device *csidev)
> +{
> +	struct device *dev =3D csidev->dev;
> +	u32 val;
> +
> +	phy_power_off(csidev->phy);
> +	phy_exit(csidev->phy);
> +	dwc_csi_ipi_disable(csidev);
> +
> +	/* Check clock lanes are not in High Speed Mode */
> +	val =3D dwc_csi_read(csidev, CSI2RX_DPHY_RX_STATUS);
> +	if (val & CSI2RX_DPHY_RX_STATUS_CLK_LANE_HS) {
> +		dev_err(dev, "Clock lanes are still in HS mode\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void dwc_csi_device_enable_interrupts(struct dwc_csi_device *csid=
ev, bool on)
> +{
> +	/* Define errors to be enabled */
> +	dwc_csi_write(csidev, CSI2RX_INT_MSK_DPHY_FATAL, on ? 0x3 : 0);
> +	dwc_csi_write(csidev, CSI2RX_INT_MSK_PKT_FATAL, on ? 0x3 : 0);
> +	dwc_csi_write(csidev, CSI2RX_INT_MSK_DPHY, on ? 0x30003 : 0);
> +	dwc_csi_write(csidev, CSI2RX_INT_MSK_IPI_FATAL, on ? 0x7f : 0);
> +}
> +
> +static void dwc_csi_clear_counters(struct dwc_csi_device *csidev)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < DWC_NUM_EVENTS; ++i)
> +		csidev->events[i].counter =3D 0;
> +}
> +
> +static void dwc_csi_log_counters(struct dwc_csi_device *csidev)
> +{
> +	unsigned int i;
> +	int counter;
> +
> +	for (i =3D 0; i < DWC_NUM_EVENTS; ++i) {
> +		counter =3D csidev->events[i].counter;
> +		if (counter > 0)
> +			dev_info(csidev->dev, "%s events: %d\n",
> +				 csidev->events[i].name,
> +				 counter);
> +	}
> +}
> +
> +static void dwc_csi_dump_regs(struct dwc_csi_device *csidev)
> +{
> +#define DWC_MIPI_CSIS_DEBUG_REG(name)		{name, #name}
> +	static const struct {
> +		u32 offset;
> +		const char * const name;
> +	} registers[] =3D {
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_VERSION),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_N_LANES),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_HOST_RESETN),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_MAIN),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DATA_IDS_1_DT),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DATA_IDS_2_DT),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DATA_IDS_1_VC),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DATA_IDS_2_VC),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_SHUTDOWNZ),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_RSTZ),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_RX_STATUS),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_STOPSTATE),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_TEST_CTRL0),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_TEST_CTRL1),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_PATTERN_VRES),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_PATTERN_HRES),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_CONFIG),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_ENABLE),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_STATUS),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_MODE),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_VCID),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_DATA_TYPE),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_MEM_FLUSH),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_SOFTRSTN),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_ADV_FEATURES),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_DPHY_FATAL),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_PKT_FATAL),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_DPHY_FATAL),
> +		DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_IPI_FATAL),
> +	};
> +
> +	unsigned int i;
> +	u32 cfg;
> +
> +	dev_dbg(csidev->dev, "--- REGISTERS ---\n");
> +
> +	for (i =3D 0; i < ARRAY_SIZE(registers); i++) {
> +		cfg =3D dwc_csi_read(csidev, registers[i].offset);
> +		dev_dbg(csidev->dev, "%14s[0x%02x]: 0x%08x\n",
> +			registers[i].name, registers[i].offset, cfg);
> +	}
> +}
> +
> +/*
> + * V4L2 subdev operations
> + */
> +
> +static inline struct dwc_csi_device *
> +sd_to_dwc_csi_device(struct v4l2_subdev *sdev)
> +{
> +	return container_of(sdev, struct dwc_csi_device, sd);
> +}
> +
> +static int __dwc_csi_subdev_set_routing(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> +		return -EINVAL;
> +
> +	ret =3D v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +						&dwc_csi_default_fmt);
> +}
> +
> +static int dwc_csi_subdev_init_state(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *sd_state)
> +{
> +	struct v4l2_subdev_route routes[] =3D {
> +		{
> +			.sink_pad =3D DWC_CSI2RX_PAD_SINK,
> +			.sink_stream =3D 0,
> +			.source_pad =3D DWC_CSI2RX_PAD_SOURCE,
> +			.source_stream =3D 0,
> +			.flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +
> +	struct v4l2_subdev_krouting routing =3D {
> +		.num_routes =3D ARRAY_SIZE(routes),
> +		.routes =3D routes,
> +	};
> +
> +	return __dwc_csi_subdev_set_routing(sd, sd_state, &routing);
> +}
> +
> +static int dwc_csi_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> +					 struct v4l2_subdev_state *sd_state,
> +					 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	/*
> +	 * The CSIS can't transcode in any way, the source format is identical
> +	 * to the sink format.
> +	 */
> +	if (code->pad =3D=3D DWC_CSI2RX_PAD_SOURCE) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		fmt =3D v4l2_subdev_state_get_format(sd_state, code->pad,
> +						   code->stream);
> +		code->code =3D fmt->code;
> +		return 0;
> +	}
> +
> +	if (code->index >=3D ARRAY_SIZE(dwc_csi_formats))
> +		return -EINVAL;
> +
> +	code->code =3D dwc_csi_formats[code->index].code;
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_subdev_set_fmt(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_format *sdformat)
> +{
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	struct dwc_csi_pix_format const *csi_fmt;
> +	struct v4l2_mbus_framefmt *fmt;
> +	unsigned int align;
> +
> +	/*
> +	 * The CSIS can't transcode in any way, the source format can't be
> +	 * modified.
> +	 */
> +	if (sdformat->pad =3D=3D DWC_CSI2RX_PAD_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +
> +	/*
> +	 * Validate the media bus code and clamp and align the size.
> +	 *
> +	 * The total number of bits per line must be a multiple of 8. We thus
> +	 * need to align the width for formats that are not multiples of 8
> +	 * bits.
> +	 */
> +	csi_fmt =3D find_csi_format(sdformat->format.code);
> +
> +	switch (csi_fmt->width % 8) {
> +	case 0:
> +		align =3D 0;
> +		break;
> +	case 4:
> +		align =3D 1;
> +		break;
> +	case 2:
> +	case 6:
> +		align =3D 2;
> +		break;
> +	default:
> +		/* 1, 3, 5, 7 */
> +		align =3D 3;
> +		break;
> +	}
> +
> +	v4l_bound_align_image(&sdformat->format.width, 1,
> +			      DWC_CSI2RX_MAX_PIX_WIDTH, align,
> +			      &sdformat->format.height, 1,
> +			      DWC_CSI2RX_MAX_PIX_HEIGHT, 0, 0);
> +
> +	fmt =3D v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> +					   sdformat->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt =3D sdformat->format;
> +
> +	/* Set default code if user set an invalid value */
> +	fmt->code =3D csi_fmt->code;
> +
> +	/* Propagate the format from sink stream to source stream */
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat=
=2D>pad,
> +							   sdformat->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt =3D sdformat->format;
> +	/* The format on the source pad might change due to unpacking. */
> +	fmt->code =3D csi_fmt->output;
> +
> +	/* Store the CSIS format descriptor for active formats. */
> +	if (sdformat->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> +		csidev->csi_fmt =3D csi_fmt;
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_get_frame_desc(struct v4l2_subdev *sd, unsigned int p=
ad,
> +				  struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_subdev_state *state;
> +	int ret;
> +
> +	if (pad !=3D DWC_CSI2RX_PAD_SOURCE)
> +		return -EINVAL;
> +
> +	memset(fd, 0, sizeof(*fd));
> +
> +	ret =3D v4l2_subdev_call(csidev->source_sd, pad, get_frame_desc,
> +			       csidev->remote_pad, &source_fd);
> +	if (ret < 0) {
> +		dev_info(csidev->dev,
> +			 "Remote sub-device on pad %d should implement .get_frame_desc! Forci=
ng VC =3D 0 and DT =3D %x\n",
> +			 pad, csidev->csi_fmt->data_type);

Is this dev_info or dev_warn? Maybe Laurent or other V4L folks can give
some hints.

> +		fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +		fd->num_entries =3D 1;
> +		fd->entry[0].pixelcode =3D csidev->csi_fmt->code;
> +		fd->entry[0].bus.csi2.vc =3D 0;
> +		fd->entry[0].bus.csi2.dt =3D csidev->csi_fmt->data_type;
> +
> +		return 0;
> +	}
> +
> +	fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +
> +	state =3D v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc_entry *entry =3D NULL;
> +		unsigned int i;
> +
> +		if (route->source_pad !=3D pad)
> +			continue;
> +
> +		for (i =3D 0; i < source_fd.num_entries; ++i) {
> +			if (source_fd.entry[i].stream =3D=3D route->sink_stream) {
> +				entry =3D &source_fd.entry[i];
> +				break;
> +			}
> +		}
> +
> +		if (!entry) {
> +			dev_err(csidev->dev,
> +				"Failed to find stream from source frames desc\n");
> +			ret =3D -EPIPE;
> +			goto out_unlock;
> +		}
> +
> +		fd->entry[fd->num_entries].stream =3D route->source_stream;
> +		fd->entry[fd->num_entries].flags =3D entry->flags;
> +		fd->entry[fd->num_entries].length =3D entry->length;
> +		fd->entry[fd->num_entries].pixelcode =3D entry->pixelcode;
> +		fd->entry[fd->num_entries].bus.csi2.vc =3D entry->bus.csi2.vc;
> +		fd->entry[fd->num_entries].bus.csi2.dt =3D entry->bus.csi2.dt;
> +
> +		fd->num_entries++;
> +	}
> +
> +out_unlock:
> +	v4l2_subdev_unlock_state(state);
> +	return ret;
> +}
> +
> +static int dwc_csi_set_routing(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       enum v4l2_subdev_format_whence which,
> +			       struct v4l2_subdev_krouting *routing)
> +{
> +	if (which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> +	    media_entity_is_streaming(&sd->entity))
> +		return -EBUSY;
> +
> +	return __dwc_csi_subdev_set_routing(sd, state, routing);
> +}
> +
> +static int dwc_csi_start_stream(struct dwc_csi_device *csidev)
> +{
> +	int ret;
> +
> +	dwc_csi_device_startup(csidev);
> +
> +	ret =3D dwc_csi_device_init(csidev);
> +	if (ret)
> +		return ret;
> +
> +	dwc_csi_device_ipi_config(csidev);
> +
> +	ret =3D dwc_csi_device_pg_enable(csidev);
> +	if (ret)
> +		return ret;
> +
> +	dwc_csi_device_hs_rx_start(csidev);
> +
> +	dwc_csi_device_enable_interrupts(csidev, true);
> +
> +	return 0;
> +}
> +
> +static void dwc_csi_stop_stream(struct dwc_csi_device *csidev)
> +{
> +	dwc_csi_device_enable_interrupts(csidev, false);
> +	dwc_csi_device_hs_rx_stop(csidev);
> +	dwc_csi_device_pg_disable(csidev);
> +}
> +
> +static int dwc_csi_enable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	u64 sink_streams;
> +	int ret;
> +
> +	if (!csidev->source_sd) {
> +		dev_err(csidev->dev, "Sensor don't link with CSIS pad\n");

s/don't/doesn't/

> +		return -EPIPE;
> +	}
> +
> +	if (!csidev->enabled_streams) {
> +		ret =3D pm_runtime_resume_and_get(csidev->dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D v4l2_ctrl_handler_setup(&csidev->ctrl_handler);
> +		if (ret < 0)
> +			goto err_runtime_put;
> +
> +		dwc_csi_clear_counters(csidev);
> +
> +		ret =3D dwc_csi_start_stream(csidev);
> +		if (ret < 0)
> +			goto err_runtime_put;
> +
> +		dwc_csi_dump_regs(csidev);
> +		dwc_csi_log_counters(csidev);

Are you sure you want to dump all the registers every time you start
a stream?

> +	}
> +
> +	sink_streams =3D v4l2_subdev_state_xlate_streams(state, DWC_CSI2RX_PAD_=
SOURCE,
> +						       DWC_CSI2RX_PAD_SINK,
> +						       &streams_mask);
> +
> +	dev_dbg(csidev->dev, "remote sd: %s pad: %u, sink_stream:0x%llx\n",
> +		csidev->source_sd->name, csidev->remote_pad, sink_streams);
> +
> +	ret =3D v4l2_subdev_enable_streams(csidev->source_sd, csidev->remote_pa=
d,
> +					 sink_streams);
> +	if (ret)
> +		return ret;
> +
> +	csidev->enabled_streams |=3D streams_mask;
> +
> +	return 0;
> +
> +err_runtime_put:
> +	pm_runtime_put(csidev->dev);
> +	return ret;
> +}
> +
> +static int dwc_csi_disable_streams(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state, u32 pad,
> +				   u64 streams_mask)
> +{
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams =3D v4l2_subdev_state_xlate_streams(state, DWC_CSI2RX_PAD_=
SOURCE,
> +						       DWC_CSI2RX_PAD_SINK,
> +						       &streams_mask);
> +
> +	ret =3D v4l2_subdev_disable_streams(csidev->source_sd, csidev->remote_p=
ad,
> +					  sink_streams);
> +	if (ret)
> +		return ret;
> +
> +	csidev->enabled_streams &=3D ~streams_mask;
> +
> +	if (!csidev->enabled_streams) {
> +		dwc_csi_stop_stream(csidev);
> +		dwc_csi_log_counters(csidev);
> +		pm_runtime_put(csidev->dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_subdev_log_status(struct v4l2_subdev *sd)
> +{
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +
> +	dwc_csi_log_counters(csidev);
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_core_ops dwc_csi_subdev_core_ops =3D {
> +	.log_status =3D dwc_csi_subdev_log_status,
> +	.subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_pad_ops dwc_csi_subdev_pad_ops =3D {
> +	.enum_mbus_code	=3D dwc_csi_subdev_enum_mbus_code,
> +	.get_fmt =3D v4l2_subdev_get_fmt,
> +	.set_fmt =3D dwc_csi_subdev_set_fmt,
> +	.get_frame_desc =3D dwc_csi_get_frame_desc,
> +	.set_routing =3D dwc_csi_set_routing,
> +	.enable_streams =3D dwc_csi_enable_streams,
> +	.disable_streams =3D dwc_csi_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops dwc_csi_subdev_ops =3D {
> +	.core  =3D &dwc_csi_subdev_core_ops,
> +	.pad   =3D &dwc_csi_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops dwc_csi_internal_ops =3D {
> +	.init_state =3D dwc_csi_subdev_init_state,
> +};
> +
> +/*
> + * Media entity operations
> + */
> +
> +static int dwc_csi_link_setup(struct media_entity *entity,
> +			      const struct media_pad *local_pad,
> +			      const struct media_pad *remote_pad, u32 flags)
> +{
> +	struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(entity);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +	struct v4l2_subdev *remote_sd;
> +
> +	dev_dbg(csidev->dev, "link setup %s -> %s", remote_pad->entity->name,
> +		local_pad->entity->name);
> +
> +	/* We only care about the link to the source. */
> +	if (!(local_pad->flags & MEDIA_PAD_FL_SINK))
> +		return 0;
> +
> +	remote_sd =3D media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	if (flags & MEDIA_LNK_FL_ENABLED) {
> +		if (csidev->source_sd)
> +			return -EBUSY;
> +
> +		csidev->source_sd =3D remote_sd;
> +		csidev->remote_pad =3D remote_pad->index;
> +	} else {
> +		csidev->source_sd =3D NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_link_validate(struct media_link *link)
> +{
> +	struct media_pad *sink_pad =3D link->sink;
> +	struct v4l2_subdev *sink_sd;
> +	struct dwc_csi_device *csidev;
> +
> +	sink_sd =3D media_entity_to_v4l2_subdev(sink_pad->entity);
> +	csidev =3D sd_to_dwc_csi_device(sink_sd);
> +
> +	dev_dbg(csidev->dev, "entity name:%s pad index=3D%d\n",
> +		sink_sd->name, sink_pad->index);
> +
> +	/*
> +	 * Skip link validate when pattern enabled since the source
> +	 * data will be from CSI pattern generator, not sensor.
> +	 */
> +	if (csidev->pg_enable && sink_pad->index =3D=3D DWC_CSI2RX_PAD_SINK)
> +		return 0;
> +
> +	return v4l2_subdev_link_validate(link);
> +}
> +
> +static const struct media_entity_operations dwc_csi_entity_ops =3D {
> +	.link_setup	=3D dwc_csi_link_setup,
> +	.link_validate	=3D dwc_csi_link_validate,
> +	.get_fwnode_pad =3D v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +/*
> + * Async subdev notifier
> + */
> +
> +static inline struct dwc_csi_device *
> +notifier_to_dwc_csi_device(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct dwc_csi_device, notifier);
> +}
> +
> +static int dwc_csi_notify_bound(struct v4l2_async_notifier *notifier,
> +				struct v4l2_subdev *sd,
> +				struct v4l2_async_connection *asd)
> +{
> +	struct dwc_csi_device *csidev =3D notifier_to_dwc_csi_device(notifier);
> +	struct media_pad *sink =3D &csidev->sd.entity.pads[DWC_CSI2RX_PAD_SINK];
> +
> +	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
> +}
> +
> +static const struct v4l2_async_notifier_operations dwc_csi_notify_ops =
=3D {
> +	.bound =3D dwc_csi_notify_bound,
> +};
> +
> +static int dwc_csi_async_register(struct dwc_csi_device *csidev)
> +{
> +	struct v4l2_fwnode_endpoint vep =3D {
> +		.bus_type =3D V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct v4l2_async_connection *asd;
> +	struct fwnode_handle *ep;
> +	unsigned int i;
> +	int ret;
> +
> +	v4l2_async_subdev_nf_init(&csidev->notifier, &csidev->sd);
> +
> +	ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(csidev->dev), 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	ret =3D v4l2_fwnode_endpoint_parse(ep, &vep);
> +	if (ret)
> +		goto err_parse;
> +
> +	for (i =3D 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> +		if (vep.bus.mipi_csi2.data_lanes[i] !=3D i + 1) {
> +			dev_err(csidev->dev,
> +				"data lanes reordering is not supported");
> +			ret =3D -EINVAL;
> +			goto err_parse;
> +		}
> +	}
> +
> +	csidev->bus =3D vep.bus.mipi_csi2;
> +
> +	dev_dbg(csidev->dev, "data lanes: %d\n", csidev->bus.num_data_lanes);
> +	dev_dbg(csidev->dev, "flags: 0x%08x\n", csidev->bus.flags);
> +
> +	asd =3D v4l2_async_nf_add_fwnode_remote(&csidev->notifier, ep,
> +					      struct v4l2_async_connection);
> +	if (IS_ERR(asd)) {
> +		ret =3D PTR_ERR(asd);
> +		goto err_parse;
> +	}
> +
> +	fwnode_handle_put(ep);
> +
> +	csidev->notifier.ops =3D &dwc_csi_notify_ops;
> +
> +	ret =3D v4l2_async_nf_register(&csidev->notifier);
> +	if (ret)
> +		goto err_notifier_clean;
> +
> +	ret =3D v4l2_async_register_subdev(&csidev->sd);
> +	if (ret)
> +		goto err_unreg_notifier;
> +
> +	return ret;
> +
> +err_unreg_notifier:
> +	v4l2_async_nf_unregister(&csidev->notifier);
> +err_notifier_clean:
> +	v4l2_async_nf_cleanup(&csidev->notifier);
> +err_parse:
> +	fwnode_handle_put(ep);
> +	return ret;
> +}
> +
> +/*
> + * Pattern Generator Controller operations
> + */
> +
> +static const char * const test_pattern_menu[] =3D {
> +	"Disabled",
> +	"Vertical Color Bars",
> +	"Horizontal Color Bars",
> +};
> +
> +static inline struct dwc_csi_device *ctrl_to_csidev(struct v4l2_ctrl *ct=
rl)
> +{
> +	return container_of(ctrl->handler, struct dwc_csi_device, ctrl_handler);
> +}
> +
> +static int dwc_csi_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct dwc_csi_device *csidev  =3D ctrl_to_csidev(ctrl);
> +	int ret =3D 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		/* Pattern index start from 0 */
> +		csidev->pg_pattern =3D ctrl->val - 1;

ctrl->val is s32 which not supposed to wrap. IIRC this is undefined behavio=
r.
Just set pg_pattern if strl->val is non-zero.
You only active test pattern when stream is started. Does it make sense to
allow setting this control only while streaming is disabled?

Thanks, I'll give it a try soon.

Best regards
Alexander

> +		csidev->pg_enable =3D (ctrl->val) ? true : false;
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops dwc_csi_ctrl_ops =3D {
> +	.s_ctrl =3D dwc_csi_s_ctrl,
> +};
> +
> +static int dwc_csi_controls_init(struct dwc_csi_device *csidev)
> +{
> +	struct v4l2_ctrl_handler *handler =3D &csidev->ctrl_handler;
> +	int ret;
> +
> +	v4l2_ctrl_handler_init(handler, 1);
> +
> +	/* Use driver mutex lock for the ctrl lock */
> +	handler->lock =3D &csidev->lock;
> +
> +	v4l2_ctrl_new_std_menu_items(handler, &dwc_csi_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(test_pattern_menu) - 1,
> +				     0, 0, test_pattern_menu);
> +
> +	if (handler->error) {
> +		ret =3D handler->error;
> +		v4l2_ctrl_handler_free(handler);
> +		return ret;
> +	}
> +
> +	csidev->sd.ctrl_handler =3D handler;
> +	return 0;
> +}
> +
> +static void dwc_csi_controls_cleanup(void *data)
> +{
> +	struct dwc_csi_device *csidev =3D data;
> +
> +	v4l2_ctrl_handler_free(&csidev->ctrl_handler);
> +}
> +
> +/*
> + * Suspend/resume
> + */
> +
> +static int dwc_csi_system_suspend(struct device *dev)
> +{
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int dwc_csi_system_resume(struct device *dev)
> +{
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "force resume %s failed!\n", dev_name(dev));
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_runtime_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +
> +	clk_bulk_disable_unprepare(csidev->num_clks, csidev->clks);
> +
> +	return 0;
> +}
> +
> +static int dwc_csi_runtime_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +
> +	return clk_bulk_prepare_enable(csidev->num_clks, csidev->clks);
> +}
> +
> +static const struct dev_pm_ops dwc_csi_device_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(dwc_csi_system_suspend, dwc_csi_system_resume)
> +	SET_RUNTIME_PM_OPS(dwc_csi_runtime_suspend, dwc_csi_runtime_resume, NUL=
L)
> +};
> +
> +static irqreturn_t dwc_csi_irq_handler(int irq, void *priv)
> +{
> +	struct dwc_csi_device *csidev =3D priv;
> +	u32 status;
> +	int i;
> +
> +	/* Hardware auto clean after read */
> +	status =3D dwc_csi_read(csidev, CSI2RX_INT_ST_MAIN);
> +
> +	if (status & DWC_EVENT_MASK) {
> +		for (i =3D 0; i < DWC_NUM_EVENTS; ++i) {
> +			struct dwc_csi_event *event =3D &csidev->events[i];
> +
> +			if (status & event->mask)
> +				event->counter++;
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static inline void dwc_csi_param_init(struct dwc_csi_device *csidev)
> +{
> +	csidev->csi_fmt =3D &dwc_csi_formats[0];
> +}
> +
> +static int dwc_csi_subdev_init(struct dwc_csi_device *csidev)
> +{
> +	struct v4l2_subdev *sd =3D &csidev->sd;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &dwc_csi_subdev_ops);
> +	sd->owner =3D THIS_MODULE;
> +	snprintf(sd->name, sizeof(sd->name), "csidev-%s", dev_name(csidev->dev)=
);
> +	sd->internal_ops =3D &dwc_csi_internal_ops;
> +
> +	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> +		     V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
> +	sd->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops =3D &dwc_csi_entity_ops;
> +
> +	sd->dev =3D csidev->dev;
> +
> +	csidev->pads[DWC_CSI2RX_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
> +	csidev->pads[DWC_CSI2RX_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
> +
> +	ret =3D media_entity_pads_init(&csidev->sd.entity, DWC_CSI2RX_PADS_NUM,
> +				     csidev->pads);
> +	if (ret) {
> +		dev_err(csidev->dev, "Failed to init pads\n");
> +		return ret;
> +	}
> +
> +	ret =3D v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		media_entity_cleanup(&sd->entity);
> +
> +	return ret;
> +}
> +
> +static void dwc_csi_subdev_cleanup(void *data)
> +{
> +	struct dwc_csi_device *csidev =3D data;
> +
> +	v4l2_subdev_cleanup(&csidev->sd);
> +	media_entity_cleanup(&csidev->sd.entity);
> +}
> +
> +static int dwc_csi_device_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct dwc_csi_device *csidev;
> +	int irq;
> +	int ret;
> +
> +	csidev =3D devm_kzalloc(dev, sizeof(*csidev), GFP_KERNEL);
> +	if (!csidev)
> +		return -ENOMEM;
> +
> +	mutex_init(&csidev->lock);
> +
> +	csidev->dev =3D dev;
> +	memcpy(csidev->events, dwc_events, sizeof(dwc_events));
> +
> +	csidev->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csidev->regs)) {
> +		dev_err(dev, "Failed to get DWC csi2 register map\n");
> +		return PTR_ERR(csidev->regs);
> +	}
> +
> +	csidev->phy =3D devm_phy_get(dev, "rx");
> +	if (IS_ERR(csidev->phy))
> +		return dev_err_probe(dev, PTR_ERR(csidev->phy),
> +				     "Failed to get DPHY Rx\n");
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "Failed to get IRQ\n");
> +
> +	ret =3D devm_request_irq(dev, irq, dwc_csi_irq_handler, 0,
> +			       dev_name(dev), csidev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	csidev->num_clks =3D devm_clk_bulk_get_all(dev, &csidev->clks);
> +
> +	dwc_csi_param_init(csidev);
> +
> +	ret =3D dwc_csi_subdev_init(csidev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to initialize subdev\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, dwc_csi_subdev_cleanup, csidev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dwc_csi_controls_init(csidev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize controls\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, dwc_csi_controls_cleanup, csidev);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, &csidev->sd);
> +
> +	ret =3D dwc_csi_async_register(csidev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Async register failed\n");
> +
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +
> +static void dwc_csi_device_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd =3D platform_get_drvdata(pdev);
> +	struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> +
> +	v4l2_async_nf_unregister(&csidev->notifier);
> +	v4l2_async_nf_cleanup(&csidev->notifier);
> +	v4l2_async_unregister_subdev(&csidev->sd);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	fwnode_handle_put(csidev->sd.fwnode);
> +	mutex_destroy(&csidev->lock);
> +
> +	pm_runtime_set_suspended(&pdev->dev);
> +}
> +
> +static const struct of_device_id dwc_csi_device_of_match[] =3D {
> +	{ .compatible =3D "snps,dw-mipi-csi2-v150" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, dwc_csi_device_of_match);
> +
> +static struct platform_driver dwc_csi_device_driver =3D {
> +	.driver =3D {
> +		.owner          =3D THIS_MODULE,
> +		.name           =3D "dwc-mipi-csi2",
> +		.of_match_table =3D dwc_csi_device_of_match,
> +		.pm             =3D &dwc_csi_device_pm_ops,
> +	},
> +	.probe  =3D dwc_csi_device_probe,
> +	.remove =3D dwc_csi_device_remove,
> +};
> +
> +module_platform_driver(dwc_csi_device_driver);
> +
> +MODULE_DESCRIPTION("DesignWare Core MIPI CSI2 driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform: dwc-mipi-csi2");
> +MODULE_AUTHOR("NXP Semiconductor, Inc.");
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



