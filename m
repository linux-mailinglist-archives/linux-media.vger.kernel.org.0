Return-Path: <linux-media+bounces-14455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420EB91DB5D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 11:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 654871C21FFF
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 09:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02F9126F1E;
	Mon,  1 Jul 2024 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Q7Fqk7QW";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mAX4YK/w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA64E8563E;
	Mon,  1 Jul 2024 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719825917; cv=none; b=LZ+f2PuDAJ2cS964+pXBxFSrxFCsgo6qXNZbpaPIlorbgX2rC+Fn06M6kgad8lP1B68ru3lWd0tBwlNuhS+xA2Ubi2Wxv/0KO82bb20kDQrALfatKyDrEFBROKT5hry5B9bqSD55mNjU/lCNYe6ZpFlF2+yZ8h7aj42Qoi+s7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719825917; c=relaxed/simple;
	bh=VV9SwltVYVFql6inyT6pQLEZTIqeCrqzxsBxS3sDd3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OLslx5qVFD/uCkuR+w32+jySm08AxeJWde3oW+pdr4JasH+2+Hb5FTnepLUMsGuTRd/hvXNJKW69LEOwSMeCD5TeMdFGDMQ9v+oe7Q3dcxrqVuJHvlulOlHjnAal0AHf2cQgLeeLOZi2PzGoliVsrUisPsJsTRRNWoVWk5EZi9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Q7Fqk7QW; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=mAX4YK/w reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1719825912; x=1751361912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dDZuFRYkIMJtffF3deXofOptNFEm8m+prXmmckxDt6c=;
  b=Q7Fqk7QWf38mz0lEq2jd+7plmIqqCQBZUDW/EjgdRrbiey+FgoVAh0Ho
   Da0JOMd2saYFY1GvP6Lsuc3PTqd9uPhZZ5BDrMkG7mwuVDiBPJG7eLLlJ
   t2zzBzls6yFvHvsbvNO69URZ9Qr/NDwoklizMhIJ7ECcW3jNGxIQ8BtKA
   +hEWPSQ+/DS9dT8cIgfw5WzYdKTYlXxLtSgWKgUsRDNdobhkFsBVzWJcJ
   M+Gjux6MummSKIE1CuxojG8czKrlINVixNdtkv4jJFq4bctcBvMYIS8ir
   c5tnCm0Gd23Gzpt7Q49SBrKtSOU4FiQrJRN8zTtbnrXrvmtoroUV3b7Zv
   A==;
X-CSE-ConnectionGUID: cUHqbVrrT+i/NU/gJnl8Fw==
X-CSE-MsgGUID: ue+FEtZnQjC0Aop4QI517w==
X-IronPort-AV: E=Sophos;i="6.09,175,1716242400"; 
   d="scan'208";a="37672921"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2024 11:25:03 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9ED70163B7F;
	Mon,  1 Jul 2024 11:24:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1719825899;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dDZuFRYkIMJtffF3deXofOptNFEm8m+prXmmckxDt6c=;
	b=mAX4YK/wXrb5X3txeV5z4nA0WlcnDYX5clWFMyxPSTIM08lamTOXcy5WgZwnVpmC6wpwgZ
	FCfdDNMKHreMCVMY5c9d21Uasd3IhsETs6M2RscVR8FJnlRUcBTIITVI09PaO4fODNxQa0
	DPfgatpY+ALZyeSqDK62lYGauIm4ziwSYg03RTYvYAs1rostqHCpoSYrenjiUAM97210iQ
	TFD48MOxOJwnpOgk7l5LVllln79jy0/om/LU17sAMnKuSVekQ147AZbnh423xv7bcoQBeY
	JbCM9G/H9hs7KbcDyfKazkBWc3u6acYNbmYUINysLaOBjSHeO+VCdr7mhfYYlQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Spencer Hill <shill@d3engineering.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Spencer Hill <shill@d3engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for Sony IMX728
Date: Mon, 01 Jul 2024 11:25:01 +0200
Message-ID: <5802879.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240628-imx728-driver-v2-2-80efa6774286@d3engineering.com>
References: <20240628-imx728-driver-v2-0-80efa6774286@d3engineering.com> <20240628-imx728-driver-v2-2-80efa6774286@d3engineering.com>
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

Am Freitag, 28. Juni 2024, 23:17:01 CEST schrieb Spencer Hill:
> Add a driver for the Sony IMX728 image sensor.
>=20
> Signed-off-by: Spencer Hill <shill@d3engineering.com>
> ---
>  drivers/media/i2c/Kconfig  |   11 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx728.c | 4660 ++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 4672 insertions(+)
>=20
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index c6d3ee472d81..46b6463c558a 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -233,6 +233,17 @@ config VIDEO_IMX415
>           To compile this driver as a module, choose M here: the
>           module will be called imx415.
>=20
> +config VIDEO_IMX728
> +       tristate "Sony IMX728 sensor support"
> +       depends on OF_GPIO
> +       select V4L2_CCI_I2C
> +       help
> +         This is a Video4Linux2 sensor driver for the Sony
> +         IMX728 camera.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called imx728.
> +
>  config VIDEO_MAX9271_LIB
>         tristate
>=20
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index dfbe6448b549..1188420ee1b4 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o
>  obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o
>  obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
>  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
> +obj-$(CONFIG_VIDEO_IMX728) +=3D imx728.o
>  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
>  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
>  obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o
> diff --git a/drivers/media/i2c/imx728.c b/drivers/media/i2c/imx728.c
> new file mode 100644
> index 000000000000..190f54aaf4e9
> --- /dev/null
> +++ b/drivers/media/i2c/imx728.c
> @@ -0,0 +1,4660 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Sony IMX728 CMOS Image Sensor Driver
> + *
> + * Copyright (c) 2024 Define Design Deploy Corp
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/types.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/v4l2-mediabus.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-cci.h>
> +
> +#define IMX728_FRAMERATE_MAX           30

Bindings state the framerate is up to 45 fps, to this should be
set accordingly.

> +#define IMX728_FRAMERATE_DEFAULT       30
> +#define IMX728_FRAMERATE_MIN           10
> +
> +#define IMX728_PIXEL_ARRAY_WIDTH       3857
> +#define IMX728_PIXEL_ARRAY_HEIGHT      2177
> +#define IMX728_PIXEL_ARRAY_MARGIN_TOP  9
> +#define IMX728_PIXEL_ARRAY_MARGIN_LEFT 8
> +#define IMX728_PIXEL_ARRAY_RECORDING_WIDTH     3840
> +#define IMX728_PIXEL_ARRAY_RECORDING_HEIGHT    2160
> +
> +#define IMX728_PIXEL_RATE              248832000
> +#define IMX728_LINK_FREQ               800000000
> +
> +#define IMX728_EXPOSURE_DEFAULT                10000
> +
> +#define IMX728_PM_IDLE_TIMEOUT         1000
> +
> +#define IMX728_REG_STATE       CCI_REG8(0x2CAC)
> +#define IMX728_REG_PG_00       CCI_REG16_LE(0x1A2A)
> +#define IMX728_REG_PG_01       CCI_REG24_LE(0x1A30)
> +#define IMX728_REG_PG_02       CCI_REG24_LE(0x1A38)
> +#define IMX728_REG_PG_03       CCI_REG8(0xB58F)
> +#define IMX728_REG_PG_04       CCI_REG8(0xB6C5)
> +#define IMX728_REG_PG_05       CCI_REG16_LE(0x1A2C)
> +#define IMX728_REG_PG_06       CCI_REG8(0xB58E)
> +#define IMX728_REG_PG_07       CCI_REG8(0xB6C4)
> +#define IMX728_REG_EXPOSURE_00 CCI_REG32_LE(0x98DC)
> +#define IMX728_REG_EXPOSURE_01 CCI_REG32_LE(0x98E4)
> +#define IMX728_REG_EXPOSURE_02 CCI_REG32_LE(0x98EC)
> +#define IMX728_REG_AGAIN_00    CCI_REG32_LE(0x98F8)
> +#define IMX728_REG_AGAIN_01    CCI_REG32_LE(0x98FC)
> +#define IMX728_REG_AGAIN_02    CCI_REG32_LE(0x9900)
> +#define IMX728_REG_AGAIN_03    CCI_REG32_LE(0x9904)
> +#define IMX728_REG_AGAIN_04    CCI_REG32_LE(0x9908)
> +#define IMX728_REG_FLIP                CCI_REG8(0x9651)
> +#define IMX728_REG_HFLIP       CCI_REG8(0xB67C)
> +#define IMX728_REG_VFLIP       CCI_REG8(0xB67D)
> +#define IMX728_REG_VMINOR      CCI_REG8(0x6000)
> +#define IMX728_REG_VMAJOR      CCI_REG8(0x6002)
> +#define IMX728_REG_RESET_0     CCI_REG8(0xB661)
> +#define IMX728_REG_RESET_1     CCI_REG8(0x95C5)
> +#define IMX728_REG_INCK_0      CCI_REG8(0x1B20)
> +#define IMX728_REG_INCK_1      CCI_REG8(0x1B1C)
> +#define IMX728_REG_SLEEP       CCI_REG8(0x1B05)
> +#define IMX728_REG_REGMAP      CCI_REG8(0xFFFF)
> +#define IMX728_REG_HDR_00      CCI_REG32_LE(0x9C60)
> +#define IMX728_REG_HDR_01      CCI_REG32_LE(0x9C6C)
> +#define IMX728_REG_HDR_02      CCI_REG32_LE(0x9C64)
> +#define IMX728_REG_HDR_03      CCI_REG32_LE(0x9C70)
> +#define IMX728_REG_HDR_04      CCI_REG16_LE(0x9C68)
> +#define IMX728_REG_HDR_05      CCI_REG16_LE(0x9C74)
> +#define IMX728_REG_HDR_06      CCI_REG16_LE(0x9C6A)
> +#define IMX728_REG_HDR_07      CCI_REG16_LE(0x9C76)
> +#define IMX728_REG_AE_MODE     CCI_REG8(0x98AC)
> +#define IMX728_REG_AWBMODE     CCI_REG8(0xA248)
> +#define IMX728_REG_AWB_EN      CCI_REG8(0x1808)
> +#define IMX728_REG_UNIT_00     CCI_REG8(0x98E0)
> +#define IMX728_REG_UNIT_01     CCI_REG8(0x98E8)
> +#define IMX728_REG_UNIT_02     CCI_REG8(0x98F0)
> +#define IMX728_REG_MD_00       CCI_REG8(0x1708)
> +#define IMX728_REG_MD_01       CCI_REG8(0x1709)
> +#define IMX728_REG_MD_02       CCI_REG8(0x170A)
> +#define IMX728_REG_MD_03       CCI_REG8(0x1B40)
> +#define IMX728_REG_MODE_SEL    CCI_REG16_LE(0x9728)
> +#define IMX728_REG_OUT_MODE    CCI_REG8(0xEC7E)
> +#define IMX728_REG_OB_0                CCI_REG16_LE(0xEC12)
> +#define IMX728_REG_OB_1                CCI_REG8(0xEC14)
> +#define IMX728_REG_SKEW                CCI_REG8(0x1761)
> +#define IMX728_REG_SUBP_0      CCI_REG8(0x9714)
> +#define IMX728_REG_SUBP_1      CCI_REG8(0xB684)
> +#define IMX728_REG_STREAM_00   CCI_REG8(0x9789)
> +#define IMX728_REG_STREAM_01   CCI_REG8(0x95C1)
> +#define IMX728_REG_STREAM_02   CCI_REG8(0x1B04)

Can you sort them by register address?

> +#define IMX728_REG_CTRL_POINT_X(i) CCI_REG32(0xA198 + (i) * 8)
> +#define IMX728_REG_CTRL_POINT_Y(i) (IMX728_REG_CTRL_POINT_X(i) + 4)

>[snip]

Best regards,
Alexander

> --
> 2.43.0
>=20
> Please be aware that this email includes email addresses outside of the o=
rganization.
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



