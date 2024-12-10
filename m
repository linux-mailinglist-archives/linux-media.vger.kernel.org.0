Return-Path: <linux-media+bounces-23073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2889EB6A2
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 17:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8FF7283319
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 16:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5355922FE02;
	Tue, 10 Dec 2024 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aibDPMIx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCEC1A3BA1;
	Tue, 10 Dec 2024 16:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733848697; cv=none; b=aDJlaAfAINFChCpQrJyOJEp0vUuzBeiPYtw5yJZBf8Fg6uv1IFBUk7VVwlYU0y2oS4eDWPJzmdd7dWL8rJjDVF16CyA8/AQhDv7Z2cu9dks38EABMwIvgQXa4g0k8+3wIc+aglFtRaUfr1rfE4xNFQyC741cqd+mn16m1c4b2xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733848697; c=relaxed/simple;
	bh=S6odGauf/jHo99c+66rKUMowW3K0dJ0QPDh0BxBDfXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/XEUDZI9NZPaqKKP6qGia57vHn+2cTN7GNw/O732xh++rriqXr4nGqCI5JEWE6//mj1j2fnR6MTFDkNM0g/20S7ErfmSeqZclfCl+crjVdAvPozMhi7vHmsKOlXCR9kHa74YBUoJ30lr8HoTQ7Wp4lzW7WRBT5t38ApPK8QuEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aibDPMIx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-141-199.net.vodafone.it [5.90.141.199])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2CFD352;
	Tue, 10 Dec 2024 17:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733848176;
	bh=S6odGauf/jHo99c+66rKUMowW3K0dJ0QPDh0BxBDfXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aibDPMIx9Z1B8J68+G+9MOARJdqvvy+jrVOZgSjoHTSaIrCcAtWZo3Z3S5iU9E6i/
	 WE8FA5ZrR/ELb8GhVSLwEAYxwbyYq5wmWWiS5XuEiWTIte+DvsSfnrVKDpp8Yp6FjQ
	 2iZz0U+OEfmkuVS33zSNBxxpZ5QF/fCE2D4qI0mM=
Date: Tue, 10 Dec 2024 17:29:59 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: keke.li@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v4 02/10] media: platform: Add c3 mipi csi2 driver
Message-ID: <dt7sj27tj2syrsmscu6cejastnpppeicee54ytyju6dyy65nan@evjdokbuw3ma>
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
 <20241205-c3isp-v4-2-cb1868be0105@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-c3isp-v4-2-cb1868be0105@amlogic.com>

Hi Keke

On Thu, Dec 05, 2024 at 05:04:28PM +0800, Keke Li via B4 Relay wrote:
> From: Keke Li <keke.li@amlogic.com>
>
> This driver is used to receive mipi data from image sensor.

It's usually nice to have a bit more descriptive commit message.

Something like:

Add a driver for the CSI-2 receiver unit found on .. SoC.

Create a drivers/media/platform/c3 directory to host the driver
and the forthcoming support for the Amlogic [precise name here] C3
ISP.

>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  MAINTAINERS                                        |   7 +
>  drivers/media/platform/amlogic/Kconfig             |   1 +
>  drivers/media/platform/amlogic/Makefile            |   2 +
>  drivers/media/platform/amlogic/c3/Kconfig          |   3 +
>  drivers/media/platform/amlogic/c3/Makefile         |   3 +
>  .../media/platform/amlogic/c3/mipi-csi2/Kconfig    |  16 +
>  .../media/platform/amlogic/c3/mipi-csi2/Makefile   |   3 +
>  .../platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c   | 900 +++++++++++++++++++++
>  8 files changed, 935 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 21f855fe468b..9b405a694881 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1224,6 +1224,13 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
>  F:	drivers/perf/amlogic/
>  F:	include/soc/amlogic/
>
> +AMLOGIC MIPI CSI2 DRIVER
> +M:	Keke Li <keke.li@amlogic.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml

Possibily moved to the previous patch, not a big deal though

> +F:	drivers/media/platform/amlogic/c3/mipi-csi2/
> +
>  AMLOGIC RTC DRIVER
>  M:	Yiting Deng <yiting.deng@amlogic.com>
>  M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
> index 5014957404e9..458acf3d5fa8 100644
> --- a/drivers/media/platform/amlogic/Kconfig
> +++ b/drivers/media/platform/amlogic/Kconfig
> @@ -2,4 +2,5 @@
>
>  comment "Amlogic media platform drivers"
>
> +source "drivers/media/platform/amlogic/c3/Kconfig"
>  source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
> index d3cdb8fa4ddb..c744afcd1b9e 100644
> --- a/drivers/media/platform/amlogic/Makefile
> +++ b/drivers/media/platform/amlogic/Makefile
> @@ -1,2 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-y += c3/
>  obj-y += meson-ge2d/
> diff --git a/drivers/media/platform/amlogic/c3/Kconfig b/drivers/media/platform/amlogic/c3/Kconfig
> new file mode 100644
> index 000000000000..098d458747b8
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/c3/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +source "drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig"
> diff --git a/drivers/media/platform/amlogic/c3/Makefile b/drivers/media/platform/amlogic/c3/Makefile
> new file mode 100644
> index 000000000000..a468fb782f94
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/c3/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-y += mipi-csi2/
> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig b/drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig
> new file mode 100644
> index 000000000000..0d7b2e203273
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_C3_MIPI_CSI2
> +	tristate "Amlogic C3 MIPI CSI-2 receiver"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	depends on OF
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  Video4Linux2 driver for Amlogic C3 MIPI CSI-2 receiver.
> +	  C3 MIPI CSI-2 receiver is used to receive MIPI data from
> +	  image sensor.
> +
> +	  To compile this driver as a module choose m here.
> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/Makefile b/drivers/media/platform/amlogic/c3/mipi-csi2/Makefile
> new file mode 100644
> index 000000000000..cc08fc722bfd
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_VIDEO_C3_MIPI_CSI2) += c3-mipi-csi2.o
> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> new file mode 100644
> index 000000000000..861fccc4ca9e
> --- /dev/null
> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> @@ -0,0 +1,900 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <media/v4l2-async.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* C3 CSI-2 submodule definition */
> +enum {
> +	SUBMD_APHY,
> +	SUBMD_DPHY,
> +	SUBMD_HOST,
> +};
> +
> +#define CSI2_SUBMD_MASK                  GENMASK(17, 16)
> +#define CSI2_SUBMD_SHIFT                 16
> +#define CSI2_SUBMD(x)                    (((x) & (CSI2_SUBMD_MASK)) >> (CSI2_SUBMD_SHIFT))
> +#define CSI2_REG_ADDR_MASK               GENMASK(15, 0)
> +#define CSI2_REG_ADDR(x)                 ((x) & (CSI2_REG_ADDR_MASK))
> +#define CSI2_REG_A(x)                    ((SUBMD_APHY << CSI2_SUBMD_SHIFT) | (x))
> +#define CSI2_REG_D(x)                    ((SUBMD_DPHY << CSI2_SUBMD_SHIFT) | (x))
> +#define CSI2_REG_H(x)                    ((SUBMD_HOST << CSI2_SUBMD_SHIFT) | (x))
> +
> +#define MIPI_CSI2_CLOCK_NUM_MAX                  3
> +#define MIPI_CSI2_SUBDEV_NAME                    "c3-mipi-csi2"
> +
> +/* C3 CSI-2 APHY register */
> +#define CSI_PHY_CNTL0                            CSI2_REG_A(0x44)
> +#define CSI_PHY_CNTL0_HS_LP_BIAS_EN              BIT(10)
> +#define CSI_PHY_CNTL0_HS_RX_TRIM_11              (11 << 11)
> +#define CSI_PHY_CNTL0_LP_LOW_VTH_2               (2 << 16)
> +#define CSI_PHY_CNTL0_LP_HIGH_VTH_4              (4 << 20)
> +#define CSI_PHY_CNTL0_DATA_LANE0_HS_DIG_EN       BIT(24)
> +#define CSI_PHY_CNTL0_DATA_LANE1_HS_DIG_EN       BIT(25)
> +#define CSI_PHY_CNTL0_CLK0_LANE_HS_DIG_EN        BIT(26)
> +#define CSI_PHY_CNTL0_DATA_LANE2_HS_DIG_EN       BIT(27)
> +#define CSI_PHY_CNTL0_DATA_LANE3_HS_DIG_EN       BIT(28)
> +
> +#define CSI_PHY_CNTL1                            CSI2_REG_A(0x48)
> +#define CSI_PHY_CNTL1_HS_EQ_CAP_SMALL            (2 << 16)
> +#define CSI_PHY_CNTL1_HS_EQ_CAP_BIG              (3 << 16)
> +#define CSI_PHY_CNTL1_HS_EQ_RES_MIN              (3 << 18)
> +#define CSI_PHY_CNTL1_HS_EQ_RES_MED              (2 << 18)
> +#define CSI_PHY_CNTL1_HS_EQ_RES_MAX              BIT(18)
> +#define CSI_PHY_CNTL1_CLK_CHN_EQ_MAX_GAIN        BIT(20)
> +#define CSI_PHY_CNTL1_DATA_CHN_EQ_MAX_GAIN       BIT(21)
> +#define CSI_PHY_CNTL1_COM_BG_EN                  BIT(24)
> +#define CSI_PHY_CNTL1_HS_SYNC_EN                 BIT(25)
> +
> +/* C3 CSI-2 DPHY register */
> +#define MIPI_PHY_CTRL	                         CSI2_REG_D(0x00)
> +#define MIPI_PHY_CTRL_DATA_LANE0_EN              (0 << 0)
> +#define MIPI_PHY_CTRL_DATA_LANE0_DIS             BIT(0)
> +#define MIPI_PHY_CTRL_DATA_LANE1_EN              (0 << 1)
> +#define MIPI_PHY_CTRL_DATA_LANE1_DIS             BIT(1)
> +#define MIPI_PHY_CTRL_DATA_LANE2_EN              (0 << 2)
> +#define MIPI_PHY_CTRL_DATA_LANE2_DIS             BIT(2)
> +#define MIPI_PHY_CTRL_DATA_LANE3_EN              (0 << 3)
> +#define MIPI_PHY_CTRL_DATA_LANE3_DIS             BIT(3)
> +#define MIPI_PHY_CTRL_CLOCK_LANE_EN              (0 << 4)
> +#define MIPI_PHY_CTRL_CLOCK_LANE_DIS             BIT(4)
> +
> +#define MIPI_PHY_CLK_LANE_CTRL	                 CSI2_REG_D(0x04)
> +#define MIPI_PHY_CLK_LANE_CTRL_FORCE_ULPS_ENTER  BIT(0)
> +#define MIPI_PHY_CLK_LANE_CTRL_FORCE_ULPS_EXIT   BIT(1)
> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS      (0 << 3)
> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_2    BIT(3)
> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_4    (2 << 3)
> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_8    (3 << 3)
> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_16   (4 << 3)
> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_EN      BIT(6)
> +#define MIPI_PHY_CLK_LANE_CTRL_LPEN_DIS          BIT(7)
> +#define MIPI_PHY_CLK_LANE_CTRL_END_EN            BIT(8)
> +#define MIPI_PHY_CLK_LANE_CTRL_HS_RX_EN          BIT(9)
> +
> +#define MIPI_PHY_DATA_LANE_CTRL1                 CSI2_REG_D(0x0c)
> +#define MIPI_PHY_DATA_LANE_CTRL1_INSERT_ERRESC   BIT(0)
> +#define MIPI_PHY_DATA_LANE_CTRL1_HS_SYNC_CHK_EN  BIT(1)
> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_MASK       GENMASK(6, 2)
> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_ALL_EN     (0x1f << 2)
> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_DELAY_MASK GENMASK(9, 7)
> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_DELAY_3    (3 << 7)
> +
> +#define MIPI_PHY_TCLK_MISS	                 CSI2_REG_D(0x10)
> +#define MIPI_PHY_TCLK_MISS_CYCLES_MASK           GENMASK(7, 0)
> +#define MIPI_PHY_TCLK_MISS_CYCLES_9              (9 << 0)
> +
> +#define MIPI_PHY_TCLK_SETTLE	                 CSI2_REG_D(0x14)
> +#define MIPI_PHY_TCLK_SETTLE_CYCLES_MASK         GENMASK(7, 0)
> +#define MIPI_PHY_TCLK_SETTLE_CYCLES_31           (31 << 0)
> +
> +#define MIPI_PHY_THS_EXIT	                 CSI2_REG_D(0x18)
> +#define MIPI_PHY_THS_EXIT_CYCLES_MASK            GENMASK(7, 0)
> +#define MIPI_PHY_THS_EXIT_CYCLES_8               (8 << 0)
> +
> +#define MIPI_PHY_THS_SKIP	                 CSI2_REG_D(0x1c)
> +#define MIPI_PHY_THS_SKIP_CYCLES_MASK            GENMASK(7, 0)
> +#define MIPI_PHY_THS_SKIP_CYCLES_10              (10 << 0)
> +
> +#define MIPI_PHY_THS_SETTLE	                 CSI2_REG_D(0x20)
> +#define MIPI_PHY_THS_SETTLE_CYCLES_MASK          GENMASK(7, 0)
> +
> +#define MIPI_PHY_TINIT	                         CSI2_REG_D(0x24)
> +#define MIPI_PHY_TINIT_CYCLES_MASK               GENMASK(31, 0)
> +#define MIPI_PHY_TINIT_CYCLES_20000              (20000 << 0)
> +
> +#define MIPI_PHY_TULPS_C	                 CSI2_REG_D(0x28)
> +#define MIPI_PHY_TULPS_C_CYCLES_MASK             GENMASK(31, 0)
> +#define MIPI_PHY_TULPS_C_CYCLES_4096             (4096 << 0)
> +
> +#define MIPI_PHY_TULPS_S	                 CSI2_REG_D(0x2c)
> +#define MIPI_PHY_TULPS_S_CYCLES_MASK             GENMASK(31, 0)
> +#define MIPI_PHY_TULPS_S_CYCLES_256              (256 << 0)
> +
> +#define MIPI_PHY_TMBIAS                          CSI2_REG_D(0x30)
> +#define MIPI_PHY_TMBIAS_CYCLES_MASK              GENMASK(31, 0)
> +#define MIPI_PHY_TMBIAS_CYCLES_256               (256 << 0)
> +
> +#define MIPI_PHY_TLP_EN_W                        CSI2_REG_D(0x34)
> +#define MIPI_PHY_TLP_EN_W_CYCLES_MASK            GENMASK(31, 0)
> +#define MIPI_PHY_TLP_EN_W_CYCLES_12              (12 << 0)
> +
> +#define MIPI_PHY_TLPOK	                         CSI2_REG_D(0x38)
> +#define MIPI_PHY_TLPOK_CYCLES_MASK               GENMASK(31, 0)
> +#define MIPI_PHY_TLPOK_CYCLES_256                (256 << 0)
> +
> +#define MIPI_PHY_TWD_INIT	                 CSI2_REG_D(0x3c)
> +#define MIPI_PHY_TWD_INIT_DOG_MASK               GENMASK(31, 0)
> +#define MIPI_PHY_TWD_INIT_DOG_0X400000           (0x400000 << 0)
> +
> +#define MIPI_PHY_TWD_HS                          CSI2_REG_D(0x40)
> +#define MIPI_PHY_TWD_HS_DOG_MASK                 GENMASK(31, 0)
> +#define MIPI_PHY_TWD_HS_DOG_0X400000             (0x400000 << 0)
> +
> +#define MIPI_PHY_MUX_CTRL0	                 CSI2_REG_D(0x284)
> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_MASK        GENMASK(3, 0)
> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE0       (0 << 0)
> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE1       BIT(0)
> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE2       (2 << 0)
> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE3       (3 << 0)
> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_MASK        GENMASK(7, 4)
> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE0       (0 << 4)
> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE1       BIT(4)
> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE2       (2 << 4)
> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE3       (3 << 4)
> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_MASK        GENMASK(11, 8)
> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE0       (0 << 8)
> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE1       BIT(8)
> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE2       (2 << 8)
> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE3       (3 << 8)
> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_MASK        GENMASK(14, 12)
> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE0       (0 << 12)
> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE1       BIT(12)
> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE2       (2 << 12)
> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE3       (3 << 12)
> +
> +#define MIPI_PHY_MUX_CTRL1	                 CSI2_REG_D(0x288)
> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_MASK        GENMASK(3, 0)
> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN0       (0 << 0)
> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN1       BIT(0)
> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN2       (2 << 0)
> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN3       (3 << 0)
> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_MASK        GENMASK(7, 4)
> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN0       (0 << 4)
> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN1       BIT(4)
> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN2       (2 << 4)
> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN3       (3 << 4)
> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_MASK        GENMASK(11, 8)
> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN0       (0 << 8)
> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN1       BIT(8)
> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN2       (2 << 8)
> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN3       (3 << 8)
> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_MASK        GENMASK(14, 12)
> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN0       (0 << 12)
> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN1       BIT(12)
> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN2       (2 << 12)
> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN3       (3 << 12)
> +
> +/* C3 CSI-2 HOST register */
> +#define CSI2_HOST_N_LANES                        CSI2_REG_H(0x04)
> +#define CSI2_HOST_N_LANES_MASK                   GENMASK(1, 0)
> +#define CSI2_HOST_N_LANES_1                      (0 << 0)
> +#define CSI2_HOST_N_LANES_2                      BIT(0)
> +#define CSI2_HOST_N_LANES_3                      (2 << 0)
> +#define CSI2_HOST_N_LANES_4                      (3 << 0)
> +
> +#define CSI2_HOST_CSI2_RESETN                    CSI2_REG_H(0x10)
> +#define CSI2_HOST_CSI2_RESETN_MASK               BIT(0)
> +#define CSI2_HOST_CSI2_RESETN_ACTIVE             (0 << 0)
> +#define CSI2_HOST_CSI2_RESETN_EXIT               BIT(0)
> +
> +#define MIPI_CSI2_MAX_WIDTH                      2888
> +#define MIPI_CSI2_MIN_WIDTH                      160
> +#define MIPI_CSI2_MAX_HEIGHT                     2240
> +#define MIPI_CSI2_MIN_HEIGHT                     120
> +#define MIPI_CSI2_DEFAULT_WIDTH                  1920
> +#define MIPI_CSI2_DEFAULT_HEIGHT                 1080
> +#define MIPI_CSI2_DEFAULT_FMT                    MEDIA_BUS_FMT_SRGGB10_1X10

All the above are indentend with spaces and not tabs, I'm surprised
checkpatch.pl doesn't complain. If it's fine with the tool, it's fine
with me as well :)

> +
> +/* C3 CSI-2 pad list */
> +enum {
> +	MIPI_CSI2_PAD_SINK,
> +	MIPI_CSI2_PAD_SRC,
> +	MIPI_CSI2_PAD_MAX
> +};
> +
> +/*
> + * struct csi_info - MIPI CSI2 information
> + *
> + * @clocks: array of MIPI CSI2 clock names
> + * @clock_rates: array of MIPI CSI2 clock rate
> + * @clock_num: actual clock number
> + */
> +struct csi_info {
> +	char *clocks[MIPI_CSI2_CLOCK_NUM_MAX];
> +	u32 clock_rates[MIPI_CSI2_CLOCK_NUM_MAX];
> +	u32 clock_num;
> +};
> +
> +/*
> + * struct csi_device - MIPI CSI2 platform device
> + *
> + * @dev: pointer to the struct device
> + * @aphy: MIPI CSI2 aphy register address
> + * @dphy: MIPI CSI2 dphy register address
> + * @host: MIPI CSI2 host register address
> + * @clks: array of MIPI CSI2 clocks
> + * @sd: MIPI CSI2 sub-device
> + * @pads: MIPI CSI2 sub-device pads
> + * @notifier: notifier to register on the v4l2-async API
> + * @src_sd: source sub-device
> + * @bus: MIPI CSI2 bus information
> + * @src_sd_pad: source sub-device pad
> + * @info: version-specific MIPI CSI2 information
> + */
> +struct csi_device {
> +	struct device *dev;
> +	void __iomem *aphy;
> +	void __iomem *dphy;
> +	void __iomem *host;
> +	struct clk_bulk_data clks[MIPI_CSI2_CLOCK_NUM_MAX];
> +
> +	struct v4l2_subdev sd;
> +	struct media_pad pads[MIPI_CSI2_PAD_MAX];
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_subdev *src_sd;
> +	struct v4l2_mbus_config_mipi_csi2 bus;
> +
> +	u16 src_sd_pad;
> +	const struct csi_info *info;
> +};
> +
> +static const u32 c3_mipi_csi_formats[] = {
> +	MEDIA_BUS_FMT_SBGGR10_1X10,
> +	MEDIA_BUS_FMT_SGBRG10_1X10,
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +	MEDIA_BUS_FMT_SRGGB10_1X10,
> +	MEDIA_BUS_FMT_SBGGR12_1X12,
> +	MEDIA_BUS_FMT_SGBRG12_1X12,
> +	MEDIA_BUS_FMT_SGRBG12_1X12,
> +	MEDIA_BUS_FMT_SRGGB12_1X12,
> +};
> +
> +/* Hardware configuration */
> +
> +static void c3_mipi_csi_write(struct csi_device *csi, u32 reg, u32 val)
> +{
> +	void __iomem *addr;
> +
> +	switch (CSI2_SUBMD(reg)) {
> +	case SUBMD_APHY:
> +		addr = csi->aphy + CSI2_REG_ADDR(reg);
> +		break;
> +	case SUBMD_DPHY:
> +		addr = csi->dphy + CSI2_REG_ADDR(reg);
> +		break;
> +	case SUBMD_HOST:
> +		addr = csi->host + CSI2_REG_ADDR(reg);
> +		break;
> +	default:
> +		dev_err(csi->dev, "Invalid sub-module: %lu\n", CSI2_SUBMD(reg));
> +		return;
> +	}
> +
> +	writel(val, addr);
> +}
> +
> +static void c3_mipi_csi_cfg_aphy(struct csi_device *csi)
> +{
> +	c3_mipi_csi_write(csi, CSI_PHY_CNTL0,
> +			  CSI_PHY_CNTL0_HS_LP_BIAS_EN |
> +			  CSI_PHY_CNTL0_HS_RX_TRIM_11 |
> +			  CSI_PHY_CNTL0_LP_LOW_VTH_2 |
> +			  CSI_PHY_CNTL0_LP_HIGH_VTH_4 |
> +			  CSI_PHY_CNTL0_DATA_LANE0_HS_DIG_EN |
> +			  CSI_PHY_CNTL0_DATA_LANE1_HS_DIG_EN |
> +			  CSI_PHY_CNTL0_CLK0_LANE_HS_DIG_EN |
> +			  CSI_PHY_CNTL0_DATA_LANE2_HS_DIG_EN |
> +			  CSI_PHY_CNTL0_DATA_LANE3_HS_DIG_EN);
> +
> +	c3_mipi_csi_write(csi, CSI_PHY_CNTL1,
> +			  CSI_PHY_CNTL1_HS_EQ_CAP_SMALL |
> +			  CSI_PHY_CNTL1_HS_EQ_RES_MED |
> +			  CSI_PHY_CNTL1_CLK_CHN_EQ_MAX_GAIN |
> +			  CSI_PHY_CNTL1_DATA_CHN_EQ_MAX_GAIN |
> +			  CSI_PHY_CNTL1_COM_BG_EN |
> +			  CSI_PHY_CNTL1_HS_SYNC_EN);
> +}
> +
> +static void c3_mipi_csi_cfg_dphy(struct csi_device *csi, s64 rate)
> +{
> +	u32 val;
> +	u32 settle;
> +
> +	/* Calculate the high speed settle */
> +	val = DIV_ROUND_UP(1000000000, rate);
> +	settle = (16 * val + 230) / 10;
> +
> +	c3_mipi_csi_write(csi, MIPI_PHY_CLK_LANE_CTRL,
> +			  MIPI_PHY_CLK_LANE_CTRL_HS_RX_EN |
> +			  MIPI_PHY_CLK_LANE_CTRL_END_EN |
> +			  MIPI_PHY_CLK_LANE_CTRL_LPEN_DIS |
> +			  MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_EN |
> +			  MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_8);
> +
> +	c3_mipi_csi_write(csi, MIPI_PHY_TCLK_MISS, MIPI_PHY_TCLK_MISS_CYCLES_9);
> +	c3_mipi_csi_write(csi, MIPI_PHY_TCLK_SETTLE, MIPI_PHY_TCLK_SETTLE_CYCLES_31);
> +	c3_mipi_csi_write(csi, MIPI_PHY_THS_EXIT, MIPI_PHY_THS_EXIT_CYCLES_8);
> +	c3_mipi_csi_write(csi, MIPI_PHY_THS_SKIP, MIPI_PHY_THS_SKIP_CYCLES_10);
> +	c3_mipi_csi_write(csi, MIPI_PHY_THS_SETTLE, settle);
> +	c3_mipi_csi_write(csi, MIPI_PHY_TINIT, MIPI_PHY_TINIT_CYCLES_20000);
> +	c3_mipi_csi_write(csi, MIPI_PHY_TMBIAS, MIPI_PHY_TMBIAS_CYCLES_256);
> +	c3_mipi_csi_write(csi, MIPI_PHY_TULPS_C, MIPI_PHY_TULPS_C_CYCLES_4096);
> +	c3_mipi_csi_write(csi, MIPI_PHY_TULPS_S, MIPI_PHY_TULPS_S_CYCLES_256);
> +	c3_mipi_csi_write(csi, MIPI_PHY_TLP_EN_W, MIPI_PHY_TLP_EN_W_CYCLES_12);
> +	c3_mipi_csi_write(csi, MIPI_PHY_TLPOK, MIPI_PHY_TLPOK_CYCLES_256);
> +	c3_mipi_csi_write(csi, MIPI_PHY_TWD_INIT, MIPI_PHY_TWD_INIT_DOG_0X400000);
> +	c3_mipi_csi_write(csi, MIPI_PHY_TWD_HS, MIPI_PHY_TWD_HS_DOG_0X400000);
> +
> +	c3_mipi_csi_write(csi, MIPI_PHY_DATA_LANE_CTRL1,
> +			  MIPI_PHY_DATA_LANE_CTRL1_INSERT_ERRESC |
> +			  MIPI_PHY_DATA_LANE_CTRL1_HS_SYNC_CHK_EN |
> +			  MIPI_PHY_DATA_LANE_CTRL1_PIPE_ALL_EN |
> +			  MIPI_PHY_DATA_LANE_CTRL1_PIPE_DELAY_3);
> +
> +	/* Set the order of lanes */
> +	c3_mipi_csi_write(csi, MIPI_PHY_MUX_CTRL0,
> +			  MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE3 |
> +			  MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE2 |
> +			  MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE1 |
> +			  MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE0);
> +
> +	c3_mipi_csi_write(csi, MIPI_PHY_MUX_CTRL1,
> +			  MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN3 |
> +			  MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN2 |
> +			  MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN1 |
> +			  MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN0);
> +
> +	/* Enable digital data and clock lanes */
> +	c3_mipi_csi_write(csi, MIPI_PHY_CTRL,
> +			  MIPI_PHY_CTRL_DATA_LANE0_EN |
> +			  MIPI_PHY_CTRL_DATA_LANE1_EN |
> +			  MIPI_PHY_CTRL_DATA_LANE2_EN |
> +			  MIPI_PHY_CTRL_DATA_LANE3_EN |
> +			  MIPI_PHY_CTRL_CLOCK_LANE_EN);
> +}
> +
> +static void c3_mipi_csi_cfg_host(struct csi_device *csi)
> +{
> +	/* Reset CSI-2 controller output */
> +	c3_mipi_csi_write(csi, CSI2_HOST_CSI2_RESETN, CSI2_HOST_CSI2_RESETN_ACTIVE);
> +	c3_mipi_csi_write(csi, CSI2_HOST_CSI2_RESETN, CSI2_HOST_CSI2_RESETN_EXIT);
> +
> +	/* Set data lane number */
> +	c3_mipi_csi_write(csi, CSI2_HOST_N_LANES, csi->bus.num_data_lanes - 1);
> +}
> +
> +static int c3_mipi_csi_start_stream(struct csi_device *csi)
> +{
> +	s64 link_freq;
> +	s64 lane_rate;
> +
> +	link_freq = v4l2_get_link_freq(csi->src_sd->ctrl_handler, 0, 0);
> +	if (link_freq < 0) {
> +		dev_err(csi->dev, "Unable to obtain link frequency: %lld\n", link_freq);
> +		return link_freq;
> +	}
> +
> +	lane_rate = link_freq * 2;
> +	if (lane_rate > 1500000000) {
> +		dev_err(csi->dev, "Invalid lane rate: %lld\n", lane_rate);
> +		return -EINVAL;
> +	}
> +
> +	c3_mipi_csi_cfg_aphy(csi);
> +	c3_mipi_csi_cfg_dphy(csi, lane_rate);
> +	c3_mipi_csi_cfg_host(csi);
> +
> +	return 0;
> +}
> +
> +static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state,
> +				      u32 pad, u64 streams_mask)
> +{
> +	struct csi_device *csi = v4l2_get_subdevdata(sd);
> +	u64 sink_streams;
> +	int ret;
> +
> +	pm_runtime_resume_and_get(csi->dev);
> +
> +	c3_mipi_csi_start_stream(csi);
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       MIPI_CSI2_PAD_SINK,
> +						       &streams_mask);
> +	ret = v4l2_subdev_enable_streams(csi->src_sd,
> +					 csi->src_sd_pad,
> +					 sink_streams);

You don't need this (and I think it works "by chance" because it returns 0).
This function helps translate streams according
to a routing table, and this driver doesn't support routing. It means
it only knows about a single stream sent by the remote subdevice (the
image sensor in this case) from its single pad.

I think you can simply forward the call to the remote subdevice by
calling enable_streams replacing sink_streams with 0.

> +	if (ret) {
> +		pm_runtime_put(csi->dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int c3_mipi_csi_disable_streams(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *state,
> +				       u32 pad, u64 streams_mask)
> +{
> +	struct csi_device *csi = v4l2_get_subdevdata(sd);
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       MIPI_CSI2_PAD_SINK,
> +						       &streams_mask);
> +	ret = v4l2_subdev_disable_streams(csi->src_sd,
> +					  csi->src_sd_pad,
> +					  sink_streams);
> +	if (ret)
> +		dev_err(csi->dev, "Failed to disable %s\n", csi->src_sd->name);
> +
> +	pm_runtime_put(csi->dev);
> +
> +	return ret;
> +}
> +
> +static int c3_mipi_csi_cfg_routing(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   struct v4l2_subdev_krouting *routing)
> +{
> +	static const struct v4l2_mbus_framefmt format = {
> +		.width = MIPI_CSI2_DEFAULT_WIDTH,
> +		.height = MIPI_CSI2_DEFAULT_HEIGHT,
> +		.code = MIPI_CSI2_DEFAULT_FMT,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_RAW,
> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +		.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> +		.xfer_func = V4L2_XFER_FUNC_NONE,
> +	};
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}


I still think you don't need routing at all.

This driver doesn't enable V4L2_SUBDEV_FL_STREAMS, so the
g_routing/s_routing operations are disallowed by the core:
https://elixir.bootlin.com/linux/v6.12.4/source/drivers/media/v4l2-core/v4l2-subdev.c#L964

> +
> +static int c3_mipi_csi_init_routing(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route routes;
> +	struct v4l2_subdev_krouting routing;
> +
> +	routes.sink_pad = MIPI_CSI2_PAD_SINK;
> +	routes.sink_stream = 0;
> +	routes.source_pad = MIPI_CSI2_PAD_SRC;
> +	routes.source_stream = 0;
> +	routes.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
> +
> +	routing.num_routes = 1;
> +	routing.routes = &routes;
> +
> +	return c3_mipi_csi_cfg_routing(sd, state, &routing);
> +}
> +
> +static int c3_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state,
> +				      struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	switch (code->pad) {
> +	case MIPI_CSI2_PAD_SINK:
> +		if (code->index >= ARRAY_SIZE(c3_mipi_csi_formats))
> +			return -EINVAL;
> +
> +		code->code = c3_mipi_csi_formats[code->index];
> +		break;
> +	case MIPI_CSI2_PAD_SRC:
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index)
> +			return -EINVAL;
> +
> +		fmt = v4l2_subdev_state_get_format(state, code->pad);
> +		code->code = fmt->code;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int c3_mipi_csi_set_fmt(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state,
> +			       struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt;
> +	unsigned int i;
> +
> +	if (format->pad != MIPI_CSI2_PAD_SINK)
> +		return v4l2_subdev_get_fmt(sd, state, format);
> +
> +	fmt = v4l2_subdev_state_get_format(state, format->pad);
> +
> +	for (i = 0; i < ARRAY_SIZE(c3_mipi_csi_formats); i++) {
> +		if (format->format.code == c3_mipi_csi_formats[i]) {
> +			fmt->code = c3_mipi_csi_formats[i];
> +			break;
> +		}
> +	}
> +
> +	if (i == ARRAY_SIZE(c3_mipi_csi_formats))
> +		fmt->code = c3_mipi_csi_formats[0];
> +
> +	fmt->width = clamp_t(u32, format->format.width,
> +			     MIPI_CSI2_MIN_WIDTH, MIPI_CSI2_MAX_WIDTH);
> +	fmt->height = clamp_t(u32, format->format.height,
> +			      MIPI_CSI2_MIN_HEIGHT, MIPI_CSI2_MAX_HEIGHT);
> +	fmt->colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> +	fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +
> +	format->format = *fmt;
> +
> +	/* Synchronize the format to source pad */
> +	fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SRC);
> +	*fmt = format->format;
> +
> +	return 0;
> +}
> +
> +static int c3_mipi_csi_init_state(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *sink_fmt;
> +	struct v4l2_mbus_framefmt *src_fmt;
> +
> +	sink_fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SINK);
> +	src_fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SRC);
> +
> +	sink_fmt->width = MIPI_CSI2_DEFAULT_WIDTH;
> +	sink_fmt->height = MIPI_CSI2_DEFAULT_HEIGHT;
> +	sink_fmt->field = V4L2_FIELD_NONE;
> +	sink_fmt->code = MIPI_CSI2_DEFAULT_FMT;
> +	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
> +	sink_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> +	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +
> +	*src_fmt = *sink_fmt;
> +
> +	return c3_mipi_csi_init_routing(sd, state);
> +}
> +
> +static const struct v4l2_subdev_pad_ops c3_mipi_csi_pad_ops = {
> +	.enum_mbus_code = c3_mipi_csi_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = c3_mipi_csi_set_fmt,
> +	.enable_streams = c3_mipi_csi_enable_streams,
> +	.disable_streams = c3_mipi_csi_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops c3_mipi_csi_subdev_ops = {
> +	.pad = &c3_mipi_csi_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops c3_mipi_csi_internal_ops = {
> +	.init_state = c3_mipi_csi_init_state,
> +};
> +
> +/* Media entity operations */
> +static const struct media_entity_operations c3_mipi_csi_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +/* PM runtime */
> +
> +static int c3_mipi_csi_runtime_suspend(struct device *dev)
> +{
> +	struct csi_device *csi = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(csi->info->clock_num, csi->clks);
> +
> +	return 0;
> +}
> +
> +static int c3_mipi_csi_runtime_resume(struct device *dev)
> +{
> +	struct csi_device *csi = dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(csi->info->clock_num, csi->clks);
> +}
> +
> +static const struct dev_pm_ops c3_mipi_csi_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +			    pm_runtime_force_resume)
> +	RUNTIME_PM_OPS(c3_mipi_csi_runtime_suspend,
> +		       c3_mipi_csi_runtime_resume, NULL)
> +};
> +
> +/* Probe/remove & platform driver */
> +
> +static int c3_mipi_csi_subdev_init(struct csi_device *csi)
> +{
> +	struct v4l2_subdev *sd = &csi->sd;
> +	int ret;
> +
> +	v4l2_subdev_init(sd, &c3_mipi_csi_subdev_ops);
> +	sd->owner = THIS_MODULE;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->internal_ops = &c3_mipi_csi_internal_ops;
> +	snprintf(sd->name, sizeof(sd->name), "%s", MIPI_CSI2_SUBDEV_NAME);
> +
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops = &c3_mipi_csi_entity_ops;
> +
> +	sd->dev = csi->dev;
> +	v4l2_set_subdevdata(sd, csi);
> +
> +	csi->pads[MIPI_CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	csi->pads[MIPI_CSI2_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sd->entity, MIPI_CSI2_PAD_MAX, csi->pads);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret) {
> +		media_entity_cleanup(&sd->entity);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void c3_mipi_csi_subdev_deinit(struct csi_device *csi)
> +{
> +	v4l2_subdev_cleanup(&csi->sd);
> +	media_entity_cleanup(&csi->sd.entity);
> +}
> +
> +/* Subdev notifier register */
> +static int c3_mipi_csi_notify_bound(struct v4l2_async_notifier *notifier,
> +				    struct v4l2_subdev *sd,
> +				    struct v4l2_async_connection *asc)
> +{
> +	struct csi_device *csi = v4l2_get_subdevdata(notifier->sd);
> +	struct media_pad *sink = &csi->sd.entity.pads[MIPI_CSI2_PAD_SINK];
> +	int ret;
> +
> +	ret = media_entity_get_fwnode_pad(&sd->entity,
> +					  sd->fwnode, MEDIA_PAD_FL_SOURCE);
> +	if (ret < 0) {
> +		dev_err(csi->dev, "Failed to find pad for %s\n", sd->name);
> +		return ret;
> +	}
> +
> +	csi->src_sd = sd;
> +	csi->src_sd_pad = ret;
> +
> +	return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
> +					       MEDIA_LNK_FL_IMMUTABLE);
> +}
> +
> +static const struct v4l2_async_notifier_operations c3_mipi_csi_notify_ops = {
> +	.bound = c3_mipi_csi_notify_bound,
> +};
> +
> +static int c3_mipi_csi_async_register(struct csi_device *csi)
> +{
> +	struct v4l2_fwnode_endpoint vep = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct v4l2_async_connection *asc;
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	v4l2_async_subdev_nf_init(&csi->notifier, &csi->sd);
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	if (ret)
> +		goto err_put_handle;
> +
> +	csi->bus = vep.bus.mipi_csi2;
> +	if (csi->bus.num_data_lanes < 1 || csi->bus.num_data_lanes > 4) {
> +		dev_err(csi->dev, "Unsupported data lanes number\n");
> +		goto err_put_handle;
> +	}
> +
> +	asc = v4l2_async_nf_add_fwnode_remote(&csi->notifier, ep,
> +					      struct v4l2_async_connection);
> +	if (IS_ERR(asc)) {
> +		ret = PTR_ERR(asc);
> +		goto err_put_handle;
> +	}
> +
> +	csi->notifier.ops = &c3_mipi_csi_notify_ops;
> +	ret = v4l2_async_nf_register(&csi->notifier);
> +	if (ret)
> +		goto err_cleanup_nf;
> +
> +	ret = v4l2_async_register_subdev(&csi->sd);
> +	if (ret)
> +		goto err_unregister_nf;
> +
> +	fwnode_handle_put(ep);
> +
> +	return 0;
> +
> +err_unregister_nf:
> +	v4l2_async_nf_unregister(&csi->notifier);
> +err_cleanup_nf:
> +	v4l2_async_nf_cleanup(&csi->notifier);
> +err_put_handle:
> +	fwnode_handle_put(ep);
> +	return ret;
> +}
> +
> +static void c3_mipi_csi_async_unregister(struct csi_device *csi)
> +{
> +	v4l2_async_unregister_subdev(&csi->sd);
> +	v4l2_async_nf_unregister(&csi->notifier);
> +	v4l2_async_nf_cleanup(&csi->notifier);
> +}
> +
> +static int c3_mipi_csi_ioremap_resource(struct csi_device *csi)
> +{
> +	struct device *dev = csi->dev;
> +	struct platform_device *pdev = to_platform_device(dev);
> +
> +	csi->aphy = devm_platform_ioremap_resource_byname(pdev, "aphy");
> +	if (IS_ERR(csi->aphy))
> +		return PTR_ERR(csi->aphy);
> +
> +	csi->dphy = devm_platform_ioremap_resource_byname(pdev, "dphy");
> +	if (IS_ERR(csi->dphy))
> +		return PTR_ERR(csi->dphy);
> +
> +	csi->host = devm_platform_ioremap_resource_byname(pdev, "host");
> +	if (IS_ERR(csi->host))
> +		return PTR_ERR(csi->host);
> +
> +	return 0;
> +}
> +
> +static int c3_mipi_csi_configure_clocks(struct csi_device *csi)
> +{
> +	const struct csi_info *info = csi->info;
> +	int ret;
> +	u32 i;
> +
> +	for (i = 0; i < info->clock_num; i++)
> +		csi->clks[i].id = info->clocks[i];
> +
> +	ret = devm_clk_bulk_get(csi->dev, info->clock_num, csi->clks);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < info->clock_num; i++) {
> +		if (!info->clock_rates[i])
> +			continue;

Empty line maybe

> +		ret = clk_set_rate(csi->clks[i].clk, info->clock_rates[i]);
> +		if (ret) {
> +			dev_err(csi->dev, "Failed to set %s rate %u\n", info->clocks[i],
> +				info->clock_rates[i]);

should you devm_clk_bulk_release() ?

> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int c3_mipi_csi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct csi_device *csi;
> +	int ret;
> +
> +	csi = devm_kzalloc(dev, sizeof(*csi), GFP_KERNEL);
> +	if (!csi)
> +		return -ENOMEM;
> +
> +	csi->info = of_device_get_match_data(dev);
> +	csi->dev = dev;
> +
> +	ret = c3_mipi_csi_ioremap_resource(csi);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to ioremap resource\n");
> +
> +	ret = c3_mipi_csi_configure_clocks(csi);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to configure clocks\n");
> +
> +	platform_set_drvdata(pdev, csi);
> +
> +	pm_runtime_enable(dev);
> +
> +	ret = c3_mipi_csi_subdev_init(csi);
> +	if (ret)
> +		goto err_disable_runtime_pm;
> +
> +	ret = c3_mipi_csi_async_register(csi);
> +	if (ret)
> +		goto err_deinit_subdev;
> +
> +	return 0;
> +
> +err_deinit_subdev:
> +	c3_mipi_csi_subdev_deinit(csi);
> +err_disable_runtime_pm:
> +	pm_runtime_disable(dev);
> +	return ret;
> +};
> +
> +static void c3_mipi_csi_remove(struct platform_device *pdev)
> +{
> +	struct csi_device *csi = platform_get_drvdata(pdev);
> +
> +	c3_mipi_csi_async_unregister(csi);
> +	c3_mipi_csi_subdev_deinit(csi);
> +
> +	pm_runtime_disable(&pdev->dev);
> +};
> +
> +static const struct csi_info c3_mipi_csi_info = {
> +	.clocks = {"vapb", "phy0"},
> +	.clock_rates = {0, 200000000},
> +	.clock_num = 2
> +};
> +
> +static const struct of_device_id c3_mipi_csi_of_match[] = {
> +	{ .compatible = "amlogic,c3-mipi-csi2",

Kind of a weird indent. What about

	{
                .compatible = "amlogic,c3-mipi-csi2",
	        .data = &c3_mipi_csi_info,
        },

Nice overall, remove the last remaining bits about routing and next
version is good to go in my opinion.

Thanks
  j



> +	  .data = &c3_mipi_csi_info,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, c3_mipi_csi_of_match);
> +
> +static struct platform_driver c3_mipi_csi_driver = {
> +	.probe = c3_mipi_csi_probe,
> +	.remove = c3_mipi_csi_remove,
> +	.driver = {
> +		.name = "c3-mipi-csi2",
> +		.of_match_table = c3_mipi_csi_of_match,
> +		.pm = pm_ptr(&c3_mipi_csi_pm_ops),
> +	},
> +};
> +
> +module_platform_driver(c3_mipi_csi_driver);
> +
> +MODULE_AUTHOR("Keke Li <keke.li@amlogic.com>");
> +MODULE_DESCRIPTION("Amlogic C3 MIPI CSI-2 receiver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.47.0
>
>
>

