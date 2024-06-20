Return-Path: <linux-media+bounces-13847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C2E910C1B
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 18:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 108CA1C235DF
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1751B1435;
	Thu, 20 Jun 2024 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JMsRyqOw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B17F1CD3D;
	Thu, 20 Jun 2024 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900609; cv=none; b=eBn3mdqLC3dlZ8Y3Sqeom0khpNwqlmkKzURkkcnpAs2lxDU06WgvOjaqHFVhz8CyJmd8nMMoaUE7wAbFykYQFLghoZmOzztQ+ksH7+5xky5v4EDKdggtdlQWRniznXNutBuS6MiK2lR11Y6f9IMhxysC0nOpUOhYG8A7JaCZBvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900609; c=relaxed/simple;
	bh=Bl6l3j8U+yJqqjRIpmPlB7boHCYr2kTULFWXF5Otkkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/MjLryOrISJeHjKmtN9nYbzxY+uybc/GCsSKa1mR5etwwva/1xl7w2cl2MKSJTNXVfIX1cVoLeOavkxSfv86RUnHH1/2DvQ5zmjkdpXX71zwhV+93X5/kw7iWTQekhpk8jIrL1Rb/mrVlQ+WlyAkbhNyRZZQbNC0Uw0OYaIMvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JMsRyqOw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C5B92B3;
	Thu, 20 Jun 2024 18:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718900586;
	bh=Bl6l3j8U+yJqqjRIpmPlB7boHCYr2kTULFWXF5Otkkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMsRyqOwJ4tOCBM2CIISwQt54DQOZyC/rygLGEN913Y/OoYXI9Fr8FflngbWanwke
	 mC362hglFeDvKJm2LxlXTWlQy+s5qtAU538snXZ4v85bgpf74J215ocJyvJHT08Pqm
	 N5ZszO5ouszBYxhwodjPdlMUJXhXdPeXXa3Z1vp8=
Date: Thu, 20 Jun 2024 19:23:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <20240620162226.GH30640@pendragon.ideasonboard.com>
References: <20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com>
 <20240620-rp1-cfe-v2-3-b8b48fdba3b3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240620-rp1-cfe-v2-3-b8b48fdba3b3@ideasonboard.com>

On Thu, Jun 20, 2024 at 02:07:52PM +0300, Tomi Valkeinen wrote:
> Add support for Raspberry Pi CFE. The CFE is a hardware block that
> contains:
> 
> - MIPI D-PHY
> - MIPI CSI-2 receiver
> - Front End ISP (FE)
> 
> The driver has been upported from the Raspberry Pi kernel commit
> 88a681df9623 ("ARM: dts: bcm2712-rpi: Add i2c<n>_pins labels").
> 
> Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  MAINTAINERS                                        |    8 +
>  drivers/media/platform/raspberrypi/Kconfig         |    1 +
>  drivers/media/platform/raspberrypi/Makefile        |    1 +
>  drivers/media/platform/raspberrypi/rp1-cfe/Kconfig |   14 +
>  .../media/platform/raspberrypi/rp1-cfe/Makefile    |    6 +
>  .../media/platform/raspberrypi/rp1-cfe/cfe-fmts.h  |  332 +++
>  .../media/platform/raspberrypi/rp1-cfe/cfe-trace.h |  196 ++
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   | 2526 ++++++++++++++++++++
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.h   |   43 +
>  drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |  583 +++++
>  drivers/media/platform/raspberrypi/rp1-cfe/csi2.h  |   89 +
>  drivers/media/platform/raspberrypi/rp1-cfe/dphy.c  |  175 ++
>  drivers/media/platform/raspberrypi/rp1-cfe/dphy.h  |   27 +
>  .../media/platform/raspberrypi/rp1-cfe/pisp-fe.c   |  581 +++++
>  .../media/platform/raspberrypi/rp1-cfe/pisp-fe.h   |   53 +
>  .../uapi/linux/media/raspberrypi/pisp_fe_config.h  |  273 +++
>  .../linux/media/raspberrypi/pisp_fe_statistics.h   |   64 +
>  17 files changed, 4972 insertions(+)

[snip]

> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/dphy.c b/drivers/media/platform/raspberrypi/rp1-cfe/dphy.c
> new file mode 100644
> index 000000000000..c9e4a94fb80c
> --- /dev/null
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/dphy.c
> @@ -0,0 +1,175 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * RP1 CSI-2 Driver
> + *
> + * Copyright (c) 2021-2024 Raspberry Pi Ltd.
> + * Copyright (c) 2023-2024 Ideas on Board Oy
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "dphy.h"
> +
> +#define dphy_dbg(fmt, arg...) dev_dbg(dphy->dev, fmt, ##arg)
> +#define dphy_err(fmt, arg...) dev_err(dphy->dev, fmt, ##arg)
> +
> +/* DW dphy Host registers */
> +#define DPHY_VERSION		0x000
> +#define DPHY_N_LANES		0x004
> +#define DPHY_RESETN		0x008
> +#define DPHY_PHY_SHUTDOWNZ	0x040
> +#define DPHY_PHY_RSTZ		0x044
> +#define DPHY_PHY_RX		0x048
> +#define	DPHY_PHY_STOPSTATE	0x04c
> +#define DPHY_PHY_TST_CTRL0	0x050
> +#define DPHY_PHY_TST_CTRL1	0x054
> +#define DPHY_PHY2_TST_CTRL0	0x058
> +#define DPHY_PHY2_TST_CTRL1	0x05c

Quoting drivers/media/platform/renesas/rcar-csi2.c:

/* V4H BASE registers */
#define V4H_N_LANES_REG                                 0x0004
#define V4H_CSI2_RESETN_REG                             0x0008
#define V4H_PHY_MODE_REG                                0x001c
#define V4H_PHY_SHUTDOWNZ_REG                           0x0040
#define V4H_DPHY_RSTZ_REG                               0x0044

Time for a common PHY driver ?

> +
> +/* DW dphy Host Transactions */
> +#define DPHY_HS_RX_CTRL_LANE0_OFFSET	0x44
> +#define DPHY_PLL_INPUT_DIV_OFFSET	0x17
> +#define DPHY_PLL_LOOP_DIV_OFFSET	0x18
> +#define DPHY_PLL_DIV_CTRL_OFFSET	0x19
> +
> +static u32 dw_csi2_host_read(struct dphy_data *dphy, u32 offset)
> +{
> +	return readl(dphy->base + offset);
> +}
> +
> +static void dw_csi2_host_write(struct dphy_data *dphy, u32 offset, u32 data)
> +{
> +	writel(data, dphy->base + offset);
> +}
> +
> +static void set_tstclr(struct dphy_data *dphy, u32 val)
> +{
> +	u32 ctrl0 = dw_csi2_host_read(dphy, DPHY_PHY_TST_CTRL0);
> +
> +	dw_csi2_host_write(dphy, DPHY_PHY_TST_CTRL0, (ctrl0 & ~1) | val);
> +}
> +
> +static void set_tstclk(struct dphy_data *dphy, u32 val)
> +{
> +	u32 ctrl0 = dw_csi2_host_read(dphy, DPHY_PHY_TST_CTRL0);
> +
> +	dw_csi2_host_write(dphy, DPHY_PHY_TST_CTRL0, (ctrl0 & ~2) | (val << 1));
> +}
> +
> +static uint8_t get_tstdout(struct dphy_data *dphy)
> +{
> +	u32 ctrl1 = dw_csi2_host_read(dphy, DPHY_PHY_TST_CTRL1);
> +
> +	return ((ctrl1 >> 8) & 0xff);
> +}
> +
> +static void set_testen(struct dphy_data *dphy, u32 val)
> +{
> +	u32 ctrl1 = dw_csi2_host_read(dphy, DPHY_PHY_TST_CTRL1);
> +
> +	dw_csi2_host_write(dphy, DPHY_PHY_TST_CTRL1,
> +			   (ctrl1 & ~(1 << 16)) | (val << 16));
> +}
> +
> +static void set_testdin(struct dphy_data *dphy, u32 val)
> +{
> +	u32 ctrl1 = dw_csi2_host_read(dphy, DPHY_PHY_TST_CTRL1);
> +
> +	dw_csi2_host_write(dphy, DPHY_PHY_TST_CTRL1, (ctrl1 & ~0xff) | val);
> +}
> +
> +static uint8_t dphy_transaction(struct dphy_data *dphy, u8 test_code,
> +				uint8_t test_data)
> +{
> +	/* See page 101 of the MIPI DPHY databook. */
> +	set_tstclk(dphy, 1);
> +	set_testen(dphy, 0);
> +	set_testdin(dphy, test_code);
> +	set_testen(dphy, 1);
> +	set_tstclk(dphy, 0);
> +	set_testen(dphy, 0);
> +	set_testdin(dphy, test_data);
> +	set_tstclk(dphy, 1);
> +	return get_tstdout(dphy);
> +}
> +
> +static void dphy_set_hsfreqrange(struct dphy_data *dphy, uint32_t mbps)
> +{
> +	/* See Table 5-1 on page 65 of dphy databook */
> +	static const u16 hsfreqrange_table[][2] = {
> +		{ 89, 0b000000 },   { 99, 0b010000 },	{ 109, 0b100000 },
> +		{ 129, 0b000001 },  { 139, 0b010001 },	{ 149, 0b100001 },
> +		{ 169, 0b000010 },  { 179, 0b010010 },	{ 199, 0b100010 },
> +		{ 219, 0b000011 },  { 239, 0b010011 },	{ 249, 0b100011 },
> +		{ 269, 0b000100 },  { 299, 0b010100 },	{ 329, 0b000101 },
> +		{ 359, 0b010101 },  { 399, 0b100101 },	{ 449, 0b000110 },
> +		{ 499, 0b010110 },  { 549, 0b000111 },	{ 599, 0b010111 },
> +		{ 649, 0b001000 },  { 699, 0b011000 },	{ 749, 0b001001 },
> +		{ 799, 0b011001 },  { 849, 0b101001 },	{ 899, 0b111001 },
> +		{ 949, 0b001010 },  { 999, 0b011010 },	{ 1049, 0b101010 },
> +		{ 1099, 0b111010 }, { 1149, 0b001011 }, { 1199, 0b011011 },
> +		{ 1249, 0b101011 }, { 1299, 0b111011 }, { 1349, 0b001100 },
> +		{ 1399, 0b011100 }, { 1449, 0b101100 }, { 1500, 0b111100 },
> +	};
> +	unsigned int i;
> +
> +	if (mbps < 80 || mbps > 1500)
> +		dphy_err("DPHY: Datarate %u Mbps out of range\n", mbps);
> +
> +	for (i = 0; i < ARRAY_SIZE(hsfreqrange_table) - 1; i++) {
> +		if (mbps <= hsfreqrange_table[i][0])
> +			break;
> +	}
> +
> +	dphy_transaction(dphy, DPHY_HS_RX_CTRL_LANE0_OFFSET,
> +			 hsfreqrange_table[i][1] << 1);
> +}
> +
> +static void dphy_init(struct dphy_data *dphy)
> +{
> +	dw_csi2_host_write(dphy, DPHY_PHY_RSTZ, 0);
> +	dw_csi2_host_write(dphy, DPHY_PHY_SHUTDOWNZ, 0);
> +	set_tstclk(dphy, 1);
> +	set_testen(dphy, 0);
> +	set_tstclr(dphy, 1);
> +	usleep_range(15, 20);
> +	set_tstclr(dphy, 0);
> +	usleep_range(15, 20);
> +
> +	dphy_set_hsfreqrange(dphy, dphy->dphy_rate);
> +
> +	usleep_range(5, 10);
> +	dw_csi2_host_write(dphy, DPHY_PHY_SHUTDOWNZ, 1);
> +	usleep_range(5, 10);
> +	dw_csi2_host_write(dphy, DPHY_PHY_RSTZ, 1);
> +}
> +
> +void dphy_start(struct dphy_data *dphy)
> +{
> +	dw_csi2_host_write(dphy, DPHY_N_LANES, (dphy->active_lanes - 1));
> +	dphy_init(dphy);
> +	dw_csi2_host_write(dphy, DPHY_RESETN, 0xffffffff);
> +	usleep_range(10, 50);
> +}
> +
> +void dphy_stop(struct dphy_data *dphy)
> +{
> +	/* Set only one lane (lane 0) as active (ON) */
> +	dw_csi2_host_write(dphy, DPHY_N_LANES, 0);
> +	dw_csi2_host_write(dphy, DPHY_RESETN, 0);
> +}
> +
> +void dphy_probe(struct dphy_data *dphy)
> +{
> +	u32 host_ver;
> +	u8 host_ver_major, host_ver_minor;
> +
> +	host_ver = dw_csi2_host_read(dphy, DPHY_VERSION);
> +	host_ver_major = (u8)((host_ver >> 24) - '0');
> +	host_ver_minor = (u8)((host_ver >> 16) - '0');
> +	host_ver_minor = host_ver_minor * 10;
> +	host_ver_minor += (u8)((host_ver >> 8) - '0');
> +
> +	dphy_dbg("DW dphy Host HW v%u.%u\n", host_ver_major, host_ver_minor);
> +}

[snip]

-- 
Regards,

Laurent Pinchart

