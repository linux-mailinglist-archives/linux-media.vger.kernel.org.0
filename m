Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65F3F1258F
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 02:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfECAhb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 20:37:31 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46126 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfECAhb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 20:37:31 -0400
Received: by mail-pf1-f193.google.com with SMTP id j11so1949456pff.13
        for <linux-media@vger.kernel.org>; Thu, 02 May 2019 17:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QriSHcsqmeCKDqQEtX452fIX1SIDDw59Pjf6WY/pbis=;
        b=ivLlbLiyBPIL7OFNEa1kI/8bQOusUs+lWd/l1SEVtLtsiWmEYfuN4gYYKdTLp/8MYy
         rw8PRvpTe7pniozOaq3VvDnRDRSc0XBAzHQvgUNDyQbdVcLxnaBpwkpkcsLGuLWkFuuF
         w/nZjFgQq8nVrEPC0ubhDInZ8CXsxOYAbywkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=QriSHcsqmeCKDqQEtX452fIX1SIDDw59Pjf6WY/pbis=;
        b=dTffAa4+7Z25OdyowUiT+OrpQdJ4OnnUjkuAyRDBpiezQjSWSScAJ6H+bSHA890ZxJ
         jbMOdOkJBpeNrWJnLWEjmfqjACthuHhgFvjCMuo+FZ6YoSigSaDbbITQFIBEGsPlnhSR
         ejiHlUYswQIrCijD9kpnWH+3vRfe7ZFnxwsIwWJEbF9Iy46V5VWzx6b2GTTVpmnuzVgC
         5kDPaDznEhy7Q+Iwee5WYWtI2F0RuRmWNE8fJ6cI42mAmPCQ/HSspcoas32gT2SIPOWs
         X5hst0Ry6Qc5e66s2Z3FqVg5Q8PvIiZwbxTwdmNd2TN9S6hjL0yTkozAEXbdWIi2vCn4
         WrmQ==
X-Gm-Message-State: APjAAAV0ELckbeUFgi8tcWoSbwqrfjixpTfdv02NSSNToU1cDX1X9DWC
        UbJZDZrEV6CPh8vRGawXPF6GmCAEzsM=
X-Google-Smtp-Source: APXvYqyjyYtBBxZjX3AFsoJwaPv5cU8YzihZEwwjFbPI2doHhU5leHYsD4oGiifYWIr1dpgj0KMlMQ==
X-Received: by 2002:a63:8c7:: with SMTP id 190mr6875396pgi.447.1556843847796;
        Thu, 02 May 2019 17:37:27 -0700 (PDT)
Received: from chromium.org ([2620:0:1000:2039:dc9a:d621:ce08:b41a])
        by smtp.gmail.com with ESMTPSA id 132sm419115pfw.87.2019.05.02.17.37.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 17:37:26 -0700 (PDT)
Date:   Thu, 2 May 2019 17:37:24 -0700
From:   Drew Davenport <ddavenport@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     tfiga@chromium.org
Subject: Re: [RFC PATCH V1 1/4] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
Message-ID: <20190503003724.GA38276@chromium.org>
Mail-Followup-To: linux-media@vger.kernel.org, tfiga@chromium.org
References: <1552573116-21421-1-git-send-email-louis.kuo@mediatek.com>
 <1552573116-21421-2-git-send-email-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552573116-21421-2-git-send-email-louis.kuo@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 14, 2019 at 10:18:33PM +0800, Louis Kuo wrote:
> This patch adds Mediatek's sensor interface driver. Sensor interface driver
> is a MIPI-CSI2 host driver, namely, a HW camera interface controller.
> It support a widely adopted, simple, high-speed protocol primarily intended
> for point-to-point image and video transmission between cameras and host
> devices.
> 
> The mtk-isp directory will contain drivers for multiple IP blocks found in
> Mediatek ISP system. It will include ISP Pass 1 driver, sensor interface
> driver, DIP driver and face detection driver.

Hi Louis, I've done an initial review of this. Please see my comments
inline.

[snip]
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
> new file mode 100644
> index 0000000..3fab163
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
> @@ -0,0 +1,1246 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> + * See http://www.gnu.org/licenses/gpl-2.0.html for more details.
> + */
> +
> +#include <linux/types.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_platform.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +#include <linux/vmalloc.h>
> +#ifdef CONFIG_COMPAT
> +#include <linux/compat.h>
> +#endif
> +#include <linux/videodev2.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-async.h>
> +#include <media/media-entity.h>
> +#include "seninf_reg.h"
> +#include "seninf_drv_def.h"
> +
> +#define IS_4D1C (csi_info->port < CFG_CSI_PORT_0A)
> +#define IS_CDPHY_COMBO (csi_info->port == CFG_CSI_PORT_0A ||\
> +	csi_info->port == CFG_CSI_PORT_0B ||\
> +	csi_info->port == CFG_CSI_PORT_0)

Rewrite these as static inline functions that take an argument. Per the
kernel style guide, avoid macros that rely on local variables with a
certain name.

> +
> +static struct seninf_csi_info SENINF_CSI_INFO[CFG_CSI_PORT_MAX_NUM] = {
> +	{CFG_CSI_PORT_0,  SENINF_1},
> +	{CFG_CSI_PORT_1,  SENINF_3},
> +	{CFG_CSI_PORT_2,  SENINF_5},
> +	{CFG_CSI_PORT_0A, SENINF_1},
> +	{CFG_CSI_PORT_0B, SENINF_2},
> +};
> +
> +struct _seninf {
> +	struct v4l2_subdev subdev;
> +	struct device *dev;
> +	struct v4l2_fwnode_endpoint ep[2];
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_ctrl *test_pattern;

test_pattern is not accessed outside the ctrl ops, so there is no need
to store it here.

> +	struct media_pad pads[NUM_PADS];
> +	struct clk *cam_clk, *top_mux_clk;
> +	unsigned int port;
> +	int format;
> +	int dpcm;
> +	int mux_select;

This gets set in seninf_s_stream and seninf_link_setup but never read
from. Can it be removed?

> +	void __iomem *base_reg;
> +	void __iomem *rx_reg;
> +	unsigned char *seninf_hw;
> +	unsigned char *seninf_ctrl[SENINF_NUM];
> +	unsigned char *seninf_mux[SENINF_MUX_NUM];

Only the first mux is ever used. Should this be one address rather than
an array of addresses?

> +	unsigned char *csi2_rx[CFG_CSI_PORT_MAX_NUM];
> +	unsigned char *csi_rx_conf[SENINF_NUM];
> +};
> +
> +static int set_top_mux_ctrl(struct _seninf *priv,
> +			    unsigned int mux_idx, unsigned int seninf_src

This is only ever called with mux_idx = 0.

> +)
> +{
> +	void *pseninf = priv->seninf_hw;
> +
> +	seninf_write_reg(pseninf, SENINF_TOP_MUX_CTRL,
> +			 ((seninf_read_reg(pseninf, SENINF_TOP_MUX_CTRL) &
> +			 (~(0xF << (mux_idx * 4)))) | ((seninf_src & 0xF)
> +			 << (mux_idx * 4))));
> +
> +	return 0;
> +}
> +
> +static int __attribute__((unused))
> +	set_tg_mux_ctrl(struct _seninf *priv,
> +			unsigned int target_tg, unsigned int mux_src

This function is unused, so remove it.

> +)
> +{
> +	void *pseninf = priv->seninf_hw;
> +	int ret = 0;
> +
> +	seninf_write_reg(pseninf, SENINF_TOP_CAM_MUX_CTRL,
> +			 ((seninf_read_reg(pseninf,
> +			 SENINF_TOP_CAM_MUX_CTRL) &
> +			 (~(0xF << (target_tg * 4)))) | ((mux_src & 0xF)
> +			 << (target_tg * 4))));
> +
> +	return ret;
> +}
> +
> +static int set_mux_ctrl(struct _seninf *priv,
> +			unsigned int mux, unsigned int hs_pol,
> +			unsigned int vs_pol, unsigned int src_type_sel,
> +			unsigned int input_data_type, unsigned int pixel_mode

This function is only called with the same arguments for mux, hs_pol,
vs_pol, src_type_sel, and pixel_mode. Remove these arguments and
handling for unreachable code.

Also, the return value is always 0, so lets remove the return type too.

> +)
> +{
> +	void *pseninf = priv->seninf_mux[mux];
> +	unsigned int temp = 0;
> +	unsigned int temp1;
> +	unsigned int temp2;

Can these be named something more meaningful than temp?

> +	int ret = 0;
> +
> +	write_master(pseninf, SENINF1_MUX_CTRL,
> +		     (src_type_sel << 12), 0x0000F000);
> +	temp = (src_type_sel == TEST_MODEL) ? 0 : 1;
> +	write_master(pseninf, SENINF1_MUX_CTRL_EXT,
> +		     (temp << 0), 0x00000003);
> +
> +	switch (pixel_mode) {
> +	case 1: /* 2 Pixel */
> +		temp1 = 0 << 4;
> +		temp2 = 1 << 8;
> +		break;
> +	case 2: /* 4 Pixel */
> +		temp1 = 1 << 4;
> +		temp2 = 0 << 8;
> +		break;
> +	default: /* 1 Pixel */
> +		temp1 = 0 << 4;
> +		temp2 = 0 << 8;
> +	}
> +
> +	write_master(pseninf, SENINF1_MUX_CTRL_EXT, temp1, 0x00000010);
> +	write_master(pseninf, SENINF1_MUX_CTRL, temp2, 0x00000100);
> +
> +	if (input_data_type != JPEG_FMT)

It looks like input_data_type will only ever be in the range 0-3, per
the map_fmt function, thus we will never hit the branches where
input_data_type == JPEG_FMT. Please remove the code for unreachable
cases.

> +		write_master(pseninf, SENINF1_MUX_CTRL,
> +			     (2 << 28), 0x30000000);
> +	else
> +		write_master(pseninf, SENINF1_MUX_CTRL,
> +			     (0 << 28), 0x30000000);
> +
> +	if (src_type_sel == CSI2 || src_type_sel >= MIPI_SENSOR) {
> +		/* Need to use Default for New design */
> +		if (input_data_type != JPEG_FMT)
> +			write_master(pseninf, SENINF1_MUX_CTRL,
> +				     ((0x1B << 22) | (0x1F << 16)),
> +				     0x0FFF0000);
> +		else
> +			write_master(pseninf, SENINF1_MUX_CTRL,
> +				     ((0x18 << 22) | (0x1E << 16)),
> +				     0x0FFF0000);
> +	}
> +
> +	write_master(pseninf, SENINF1_MUX_CTRL,
> +		     ((hs_pol << 10) | (vs_pol << 9)), 0x00000600);
> +
> +	temp = seninf_read_reg(pseninf, SENINF1_MUX_CTRL);
> +	seninf_write_reg(pseninf, SENINF1_MUX_CTRL, temp | 0x3);
> +	seninf_write_reg(pseninf, SENINF1_MUX_CTRL, temp & 0xFFFFFFFC);
> +
> +	return ret;
> +}
> +
> +static int enable_mux(struct _seninf *priv, unsigned int mux)

This is only ever called with mux = 0.

> +{
> +	void *pseninf = priv->seninf_mux[mux];
> +
> +	write_master(pseninf, SENINF1_MUX_CTRL, (1 << 31), 0x80000000);
> +
> +	return 0;
> +}
> +
> +static struct seninf_csi_info *get_csi_info(struct _seninf *priv,
> +					    unsigned int mipi_port)
> +{
> +	int i;
> +
> +	for (i = 0; i < CFG_CSI_PORT_MAX_NUM; i++) {
> +		if (SENINF_CSI_INFO[i].port == mipi_port)
> +			return &SENINF_CSI_INFO[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static int set_csi_mipi(struct _seninf *priv,
> +			struct seninf_csi_mipi *pcsi_mipi)

This function is quite large (~500 lines). Can parts of it be extracted
into helper functions with descriptive names?

> +{
> +	struct seninf_csi_info *csi_info = pcsi_mipi->csi_info;
> +	void *seninf_base = priv->seninf_hw;
> +	void *pmipi_rx_base = priv->csi2_rx[CFG_CSI_PORT_0];
> +	void *pseninf = priv->seninf_ctrl[csi_info->seninf];
> +	void *pmipi_rx = priv->csi2_rx[csi_info->port];
> +	void *pmipi_rx_conf = priv->csi_rx_conf[csi_info->seninf];
> +	unsigned int cal_sel;
> +	unsigned int temp = 0;
> +	int status = 0;
> +	int i = 0;
> +	int ret = 0;
> +
> +	pr_debug("IS_4D1C %d csi_type %d port %d enable %d\n",
> +		 IS_4D1C, pcsi_mipi->csi_type, csi_info->port,
> +		 pcsi_mipi->enable);
> +
> +	switch (csi_info->port) {
> +	case CFG_CSI_PORT_1:
> +		cal_sel = 1;
> +		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI1,
> +			     ((0 << 0) | (2 << 8) |
> +			     (pcsi_mipi->enable << 31)), 0x80000701);

Here and in other places in this function, there are redundant
expressions that do a bitwise | with zero, or bitshift 0. These should
be cleaned up.

Also, is it possible to #define constants or enums for some of these
numbers, or at least document what they mean? Splitting this function
into smaller functions may help clarify what's going on as well.

> +		break;
> +	case CFG_CSI_PORT_2:
> +		cal_sel = 2;
> +		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI2,
> +			     ((0 << 0) | (2 << 8) |
> +			     (pcsi_mipi->enable << 31)), 0x80000701);
> +		break;
> +	case CFG_CSI_PORT_0:
> +		cal_sel = 0;
> +		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			     ((0 << 0) | (2 << 8) |
> +			     (pcsi_mipi->enable << 31)), 0x80000701);
> +		break;
> +	case CFG_CSI_PORT_0A:
> +	case CFG_CSI_PORT_0B:
> +		cal_sel = 0;
> +		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			     ((0 << 1) | (1 << 8) | (1 << 12) |
> +			     (pcsi_mipi->enable << 31)), 0x80003701);
> +		break;
> +	default:
> +		pr_err("unsupported CSI configuration\n");
> +		cal_sel = 0;
> +		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> +			     ((0 << 0) | (2 << 8) |
> +			     (pcsi_mipi->enable << 31)), 0x80000701);
> +	}
> +
> +	/* First Enable Sensor interface and select pad (0x1a04_0200) */
> +	write_master(pseninf, SENINF1_CTRL,
> +		     pcsi_mipi->enable << 0, 0x00000001);
> +	write_master(pseninf, SENINF1_CTRL,
> +		     pcsi_mipi->pad_sel << 28, 0x70000000);
> +
> +	if (pcsi_mipi->csi_type == CSI2_1_5G ||
> +	    pcsi_mipi->csi_type == CSI2_2_5G) {
> +		write_master(pseninf, SENINF1_CTRL, 0 << 12, 0x0000F000);
> +		write_master(pseninf, SENINF1_CTRL_EXT,
> +			     (pcsi_mipi->enable << 6) | (0 << 5), 0x00000060);
> +	}
> +	if (!pcsi_mipi->enable) {
> +		seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
> +				 seninf_read_reg(pseninf, SENINF1_CSI2_CTL) &
> +				 0xFFFFFFE0);
> +		/* Disable mipi BG */
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     (0 << 3) | (0 << 2), 0x0000000C);
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (0 << 3) | (0 << 2), 0x0000000C);
> +		return ret;
> +	}
> +
> +	if (pcsi_mipi->csi_type != CSI2_2_5G_CPHY) { /* Dphy */
> +		/* Set analog phy mode to DPHY */
> +		if (IS_CDPHY_COMBO)
> +			write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +				     (0 << 0), 0x00000001);
> +
> +		if (IS_4D1C) /* 4D1C: MIPIRX_ANALOG_A_BASE = 0x00001A42 */
> +			write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +				     (0 << 5) | (1 << 6) | (0 << 8) |
> +				     (1 << 9) | (1 << 11) | (1 << 12),
> +				     0x00001B60);
> +		else /* MIPIRX_ANALOG_BASE = 0x102 */
> +			write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +				     (0 << 5) | (0 << 6) | (1 << 8) |
> +				     (0 << 9) | (0 << 11) | (0 << 12),
> +				     0x00001B60);
> +
> +		if (IS_CDPHY_COMBO)
> +			write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +				     (0 << 0), 0x00000001);
> +
> +		/* Only 4d1c need set CSIB: MIPIRX_ANALOG_B_BASE = 0x00001242 */
> +		if (IS_4D1C)
> +			write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +				     (0 << 5) | (1 << 6) | (0 << 8) |
> +				     (1 << 9) | (0 << 11) | (1 << 12),
> +				     0x00001B60);
> +		else /* MIPIRX_ANALOG_BASE = 0x102 */
> +			write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +				     (0 << 6) | (1 << 8) | (1 << 9) |
> +				     (0 << 11) | (0 << 12),
> +				     0x00001B40);
> +
> +		/* Byte clock invert */
> +		write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +			     (1 << 0) | (1 << 1) | (1 << 2), 0x00000007);
> +		if (IS_4D1C)
> +			write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> +				     (1 << 0) | (1 << 1) | (1 << 2),
> +				     0x00000007);
> +
> +		/* Start ANA EQ tuning */
> +		if (IS_CDPHY_COMBO) {
> +			write_master(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +				     (1 << 4) | (1 << 6), 0x000000F0);
> +			write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +				     (1 << 20) | (1 << 22), 0x00F00000);
> +			write_master(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +				     (1 << 20) | (1 << 22), 0x00F00000);
> +
> +			if (IS_4D1C) { /* 4d1c */
> +				write_master(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> +					     (1 << 4) | (1 << 6), 0x000000F0);
> +				write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> +					     (1 << 20) | (1 << 22),
> +					     0x00F00000);
> +				write_master(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> +					     (1 << 20) | (1 << 22),
> +					     0x00F00000);
> +			}
> +		} else {
> +			write_master(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +				     (1 << 4) | (1 << 6) | (1 << 20) |
> +				     (1 << 22), 0x00F000F0);
> +			write_master(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
> +				     (1 << 4) | (1 << 6), 0x000000F0);
> +
> +			if (IS_4D1C) { /* 4d1c */
> +				write_master(pmipi_rx,
> +					     MIPI_RX_ANA18_CSI1B, (1 << 4) |
> +					     (1 << 6) | (1 << 20) |
> +					     (1 << 22), 0x00F000F0);
> +				write_master(pmipi_rx,
> +					     MIPI_RX_ANA1C_CSI1B, (1 << 4) |
> +					     (1 << 6), 0x000000F0);
> +			}
> +		}
> +
> +		/* End ANA EQ tuning */
> +		seninf_write_reg(pmipi_rx_base, MIPI_RX_ANA40_CSI0A, 0x90);
> +		write_master(pmipi_rx, MIPI_RX_ANA24_CSI0A,
> +			     (0x40 << 24), 0xFF000000);
> +		if (IS_4D1C)
> +			write_master(pmipi_rx, MIPI_RX_ANA24_CSI0B,
> +				     (0x40 << 24), 0xFF000000);
> +		write_master(pmipi_rx, MIPI_RX_WRAPPER80_CSI0A,
> +			     (0 << 16), 0x00030000);
> +		if (IS_4D1C)
> +			write_master(pmipi_rx, MIPI_RX_WRAPPER80_CSI0B,
> +				     (0 << 16), 0x00030000);
> +		/* ANA power on */
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     (1 << 3), 0x00000008);
> +		if (IS_4D1C)
> +			write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +				     (1 << 3), 0x00000008);
> +		usleep_range(20, 40);
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     (1 << 3), 0x00000008);
> +		if (IS_4D1C)
> +			write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +				     (1 << 2), 0x00000004);
> +		udelay(1);
> +#ifdef CSI2_SW_OFFSET_CAL

This is never defined. Should this block of code be removed?

> +		pr_debug("CSI offset calibration start\n");
> +		if (IS_CDPHY_COMBO) {
> +			write_master(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +				     (1 << 0), 0x00000001);
> +			write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +				     (1 << 0), 0x00000001);
> +			write_master(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +				     (1 << 0), 0x00000001);
> +
> +			if (IS_4D1C) {
> +				write_master(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> +					     (1 << 0), 0x00000001);
> +				write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> +					     (1 << 0), 0x00000001);
> +				write_master(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> +					     (1 << 0), 0x00000001);
> +			}
> +		} else {
> +			write_master(pmipi_rx, MIPI_RX_ANA18_CSI1A,
> +				     (1 << 0) | (1 << 16), 0x00010001);
> +			write_master(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
> +				     (1 << 0), 0x00000001);
> +			if (IS_4D1C) {
> +				write_master(pmipi_rx, MIPI_RX_ANA18_CSI1B,
> +					     (1 << 0) | (1 << 16), 0x00010001);
> +				write_master(pmipi_rx, MIPI_RX_ANA1C_CSI1B,
> +					     (1 << 0), 0x00000001);
> +			}
> +		}
> +		udelay(1);
> +
> +		i = 0;
> +		while (1) {
> +			status = seninf_read_reg(pmipi_rx, MIPI_RX_ANA48_CSI0A);
> +			if ((IS_CDPHY_COMBO) && (status & (1 << 0)) &&
> +			    (status & (1 << 3)) && (status & (1 << 5)))
> +				break;
> +			else if ((status & (1 << 3)) && (status & (1 << 4)) &&
> +				 (status & (1 << 5)))
> +				break;
> +
> +			pr_debug("CSIA offset calibration ongoing\n");
> +			i++;
> +			if (i > 100) {
> +				pr_debug("CSIA offset calibration timeout\n");
> +				break;
> +			}
> +			usleep_range(20, 40);
> +		}
> +		if (IS_4D1C) {
> +			i = 0;
> +			while (1) {
> +				status = seninf_read_reg(pmipi_rx,
> +							 MIPI_RX_ANA48_CSI0B);
> +				if ((IS_CDPHY_COMBO) && (status & (1 << 0)) &&
> +				    (status & (1 << 3)) && (status & (1 << 5)))
> +					break;
> +				else if ((status & (1 << 3)) && (status &
> +					 (1 << 4)) && (status & (1 << 5)))
> +					break;
> +
> +				pr_debug("CSIB offset calibration ongoing\n");
> +				i++;
> +				if (i > 100) {
> +					pr_debug("offset calibration timeout\n");
> +					break;
> +				}
> +				usleep_range(20, 40);
> +			}
> +		}
> +		pr_debug("CSI offset calibration end 0x%x, 0x%x\n",
> +			 seninf_read_reg(pmipi_rx, MIPI_RX_ANA48_CSI0A),
> +			 seninf_read_reg(pmipi_rx, MIPI_RX_ANA48_CSI0B));
> +#endif
> +		if (IS_4D1C) { /* 4d1c: MIPIRX_CONFIG_CSI_BASE = 0xC9000000; */
> +			write_master(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +				     (1 << 24) | (2 << 26) | (0 << 28) |
> +				     (3 << 30), 0xFF000000);
> +		} else { /* 2d1c: MIPIRX_CONFIG_CSI_BASE = 0xE4000000; */
> +			write_master(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
> +				     (0 << 24) | (1 << 26) | (2 << 28) |
> +				     (3 << 30), 0xFF000000);
> +		}
> +		pr_debug("pcsi_mipi->CSI2_IP %d, MIPI_RX_CON24_CSI0 0x%x\n",
> +			 csi_info->port,
> +			 seninf_read_reg(pmipi_rx_conf, MIPI_RX_CON24_CSI0));
> +		usleep_range(20, 40);
> +		/* D-PHY SW Delay Line calibration */
> +	} else { /* Cphy setting for CSI0 */
> +		/* Byte clock invert */
> +		write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
> +			     (1 << 0) | (1 << 2), 0x00000005);
> +		write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
> +			     (1 << 0) | (1 << 2), 0x00000005);
> +		/* EQ Power to Enhance Speed */
> +		write_master(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +			     (1 << 6) | (1 << 22), 0x00C000C0);
> +		write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +			     (1 << 6) | (1 << 22), 0x00C000C0);
> +		write_master(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +			     (1 << 6) | (1 << 22), 0x00C000C0);
> +		write_master(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> +			     (1 << 6) | (1 << 22), 0x00C000C0);
> +		write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> +			     (1 << 6) | (1 << 22), 0x00C000C0);
> +		write_master(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> +			     (1 << 6) | (1 << 22), 0x00C000C0);
> +
> +		/* CDR register setting */
> +
> +		*((int *)(priv->csi2_rx[csi_info->port] + 0x30)) = 0x06040404;
> +		*((int *)(priv->csi2_rx[csi_info->port] + 0x3c)) = 0x06040404;
> +		*((int *)(priv->csi2_rx[csi_info->port] + 0x34)) = 0x1;
> +		*((int *)(priv->csi2_rx[csi_info->port] + 0x28)) = 0x1;
> +
> +		*((int *)(priv->csi2_rx[csi_info->port] + 0x1030)) =
> +			0x06040404;
> +		*((int *)(priv->csi2_rx[csi_info->port] + 0x103c)) =
> +			0x06040404;
> +		*((int *)(priv->csi2_rx[csi_info->port] + 0x1034)) = 0x1;
> +		*((int *)(priv->csi2_rx[csi_info->port] + 0x1028)) = 0x1;
> +
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     (1 << 0) | (0 << 5) | (0 << 6) | (0 << 8) |
> +			     (0 << 9) | (0 < 11) | (0 < 12), 0x00001B61);
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (1 << 0) | (0 << 5) | (0 << 6) | (0 << 8) |
> +			     (0 << 9) | (0 < 11) | (0 < 12), 0x00001B61);
> +		/* Power on DPHY */
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     (1 << 3), 0x00000008);
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (1 << 3), 0x00000008);
> +		usleep_range(20, 40);
> +		/* Enable LPF */
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     (1 << 2), 0x00000004);
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (1 << 2), 0x00000004);
> +		udelay(1);
> +		/* Offset calibration */
> +		write_master(pmipi_rx, MIPI_RX_ANA18_CSI0A,
> +			     (1 << 0) | (1 << 16), 0x00010001);
> +		write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
> +			     (1 << 0) | (1 << 16), 0x00010001);
> +		write_master(pmipi_rx, MIPI_RX_ANA20_CSI0A,
> +			     (1 << 0) | (1 << 16), 0x00010001);
> +		write_master(pmipi_rx, MIPI_RX_ANA18_CSI0B,
> +			     (1 << 0) | (1 << 16), 0x00010001);
> +		write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
> +			     (1 << 0) | (1 << 16), 0x00010001);
> +		write_master(pmipi_rx, MIPI_RX_ANA20_CSI0B,
> +			     (1 << 0) | (1 << 16), 0x00010001);
> +		udelay(1);
> +
> +		i = 0;
> +		while (1) {
> +			status = seninf_read_reg(pmipi_rx,
> +						 MIPI_RX_ANA48_CSI0A);
> +			if ((status & 0x3f) == 0x3f)
> +				break;
> +			i++;
> +			if (i > 100) {
> +				pr_debug("CSIA offset calibration timeout\n");
> +				break;
> +			}
> +			usleep_range(20, 40);
> +		}
> +
> +		i = 0;
> +		while (1) {
> +			status = seninf_read_reg(pmipi_rx,
> +						 MIPI_RX_ANA48_CSI0B);
> +			if ((status & 0x3f) == 0x3f)
> +				break;
> +			i++;
> +			if (i > 100) {
> +				pr_debug("CSIB offset calibration timeout\n");
> +				break;
> +			}
> +			usleep_range(20, 40);
> +		}
> +	}
> +	/* End of CSI MIPI */
> +	/* DPCM Enable */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_DPCM,
> +			 1 << ((pcsi_mipi->dpcm == 0x2a)
> +			 ? 15 : ((pcsi_mipi->dpcm & 0xF) + 7)));

dpcm will only ever be 0 or 1, so this can be simplified.

> +
> +	pr_debug("CSI2-%d cnt:%d LaneNum:%d CSI2_EN:%d HeadOrder:%d dpcm:%d\n",
> +		 cal_sel, SENINF_SETTLE_DELAY,
> +		 (int)(pcsi_mipi->data_lane_num + 1), (int)pcsi_mipi->enable,
> +		 (int)pcsi_mipi->data_header_order, (int)pcsi_mipi->dpcm);
> +
> +	/* Settle delay */
> +	write_master(pseninf, SENINF1_CSI2_LNRD_TIMING,
> +		     (SENINF_SETTLE_DELAY << 8), 0x0000FF00);
> +	/* CSI2 control */
> +	if (pcsi_mipi->csi_type != CSI2_2_5G_CPHY) { /* DPhy */
> +		seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
> +				 (seninf_read_reg(pseninf, SENINF1_CSI2_CTL) |
> +				 (pcsi_mipi->data_header_order << 16) |
> +				 (pcsi_mipi->enable << 4) |
> +				 (((1 << (pcsi_mipi->data_lane_num + 1)) - 1)
> +				 )));
> +		write_master(pseninf, SENINF1_CSI2_RESYNC_MERGE_CTL,
> +			     (0 << 10) | (0 << 11) | (3 << 0), 0x00000C07);
> +		write_master(pseninf, SENINF1_CSI2_MODE,
> +			     (0 << 0) | (0 << 8), 0x000007FF);
> +		write_master(pseninf, SENINF1_CSI2_DPHY_SYNC,
> +			     (0xff00 << 0) | (0x001d << 16), 0xFFFFFFFF);
> +		seninf_write_reg(pseninf, SENINF1_CSI2_SPARE0,
> +				 seninf_read_reg(pseninf, SENINF1_CSI2_SPARE0)
> +				 & 0xFFFFFFFE);
> +	} else { /* CPhy */
> +		write_master(pseninf, SENINF1_CSI2_LNRD_TIMING,
> +			     (0 << 0), 0x000000FF);
> +		seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
> +				 (seninf_read_reg(pseninf, SENINF1_CSI2_CTL) |
> +				 pcsi_mipi->data_header_order << 16));
> +		temp = (pcsi_mipi->data_lane_num == SENSOR_MIPI_1_LANE) ? 1 :
> +			(pcsi_mipi->data_lane_num == SENSOR_MIPI_2_LANE) ? 2 :
> +			(pcsi_mipi->data_lane_num == SENSOR_MIPI_3_LANE) ?
> +			4 : 5;
> +		write_master(pseninf, SENINF1_CSI2_MODE,
> +			     (temp << 8), 0x00000700);
> +		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_1_LANE;
> +		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
> +			     (temp << 0), 0x00000001);
> +		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_2_LANE;
> +		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
> +			     (temp << 2), 0x00000004);
> +		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_3_LANE;
> +		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
> +			     (temp << 4), 0x00000010);
> +		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_4_LANE;
> +		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
> +			     (temp << 6), 0x00000040);
> +		write_master(pseninf, SENINF1_CSI2_MODE,
> +			     (0x2 << 0), 0x000000FF);
> +		write_master(pseninf, SENINF1_CSI2_RESYNC_MERGE_CTL,
> +			     (3 << 0) | (0 << 10) | (1 << 11), 0x00000C07);
> +		write_master(pseninf, SENINF1_SYNC_RESYNC_CTL,
> +			     (1 << 0), 0x00000007);
> +		write_master(pseninf, SENINF1_POST_DETECT_CTL,
> +			     (1 << 1), 0x00000002);
> +
> +		seninf_write_reg(pseninf, SENINF1_CSI2_SPARE0,
> +				 seninf_read_reg(pseninf, SENINF1_CSI2_SPARE0)
> +				 | 0x1);
> +	}
> +
> +	write_master(pseninf, SENINF1_CSI2_CTL, (0 << 27) | (0 << 7) |
> +		     (1 << 25), 0x0A000080);
> +	write_master(pseninf, SENINF1_CSI2_HS_TRAIL,
> +		     (SENINF_HS_TRAIL_PARAMETER << 0), 0x000000FF);
> +
> +	/* Set debug port to output packet number */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_DGB_SEL, 0x8000001A);
> +	/* Enable CSI2 IRQ mask */
> +	/* Turn on all interrupt */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_INT_EN, 0xFFFFFFFF);
> +	/* Write clear CSI2 IRQ */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_INT_STATUS, 0xFFFFFFFF);
> +	/* Enable CSI2 Extend IRQ mask */
> +	/* Turn on all interrupt */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_INT_EN_EXT, 0x0000001f);
> +
> +	write_master(pseninf, SENINF1_CTRL, (1 << 7), 0x00000080);
> +	udelay(1);
> +	write_master(pseninf, SENINF1_CTRL, (0 << 7), 0x00000080);
> +
> +	return ret;
> +}
> +
> +static int power_off(struct _seninf *priv, void *pcsi)

This only ever returns 0, so just make it a void function.

> +{
> +	int ret = 0;
> +	struct seninf_csi_mipi *pcsi_mipi = (struct seninf_csi_mipi *)pcsi;
> +	struct seninf_csi_info *csi_info = pcsi_mipi->csi_info;
> +	void *pmipi_rx = priv->csi2_rx[csi_info->port];
> +	void *pseninf = priv->seninf_ctrl[csi_info->seninf];
> +
> +	/* Disable CSI2(2.5G) first */
> +	seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
> +			 seninf_read_reg(pseninf, SENINF1_CSI2_CTL)
> +			 & 0xFFFFFFE0);
> +	/* Disable mipi BG */
> +	switch (csi_info->port) {
> +	case CFG_CSI_PORT_0A:
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     (0 << 3) | (0 << 2), 0x0000000C);
> +		break;
> +	case CFG_CSI_PORT_0B:
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (0 << 3) | (0 << 2), 0x0000000C);
> +		break;
> +	default:
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
> +			     (0 << 3) | (0 << 2), 0x0000000C);
> +		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
> +			     (0 << 3) | (0 << 2), 0x0000000C);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int map_fmt(struct _seninf *priv)
> +{
> +	int fmtidx = 0;

Can the FMT_XXX enum values be used here and below?

> +
> +	switch (priv->format) {
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		fmtidx = 0;
> +		priv->dpcm = 0;
> +		break;
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +		fmtidx = 1;
> +		priv->dpcm = 0;
> +		break;
> +	case MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8:
> +		fmtidx = 1;
> +		priv->dpcm = 1;
> +		break;
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		fmtidx = 2;
> +		priv->dpcm = 0;
> +		break;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_VYUY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +	case MEDIA_BUS_FMT_YVYU8_1X16:
> +		fmtidx = 3;
> +		priv->dpcm = 0;
> +		break;
> +	default:
> +		WARN(1, "CSI2: pixel format %08x unsupported!\n",
> +		     priv->format);
> +	}
> +	return fmtidx;
> +}
> +
> +static int seninf_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_pad_config *cfg,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
> +
> +	priv->format = fmt->format.code;
> +	pr_debug("priv->format 0x%x\n", priv->format);
> +
> +	return 0;
> +}
> +
> +static int seninf_s_stream(struct v4l2_subdev *sd, int on)
> +{
> +	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
> +	struct seninf_csi_mipi csi_mipi;
> +	struct seninf_csi_info *csi_info;
> +	unsigned int input_data_type = RAW_10BIT_FMT;
> +	unsigned int mux_select = 0;
> +	unsigned int pixel_mode = ONE_PIXEL_MODE;
> +	unsigned int port;
> +	unsigned int seninf_src;
> +	unsigned char sensor_hsync_polarity = SENSOR_CLOCK_POLARITY_LOW;
> +	unsigned char sensor_vsync_polarity = SENSOR_CLOCK_POLARITY_LOW;
> +	unsigned char sensor_packet_ecc_order = 1;
> +	unsigned char sensor_mipi_lane_num =
> +		priv->ep[priv->port].bus.mipi_csi2.num_data_lanes;
> +	unsigned int mipi_sensor_type = MIPI_OPHY_NCSI2;
> +	void *pseninf = priv->seninf_hw;
> +	int ret = 0;
> +
> +	priv->mux_select = mux_select;
> +	port = priv->port;
> +	csi_info = get_csi_info(priv, port);

get_csi_info can return NULL, so handle that here.

> +	seninf_src = csi_info->seninf;
> +
> +	pr_debug("seninf csi_info->seninf(%d) port(%d)\n",
> +		 csi_info->seninf, csi_info->port);
> +
> +	/* Configure Mipi */
> +	csi_mipi.enable = 1;

It looks like this is only ever set to 1. Can we remove it from the
struct?

> +	csi_mipi.data_header_order = sensor_packet_ecc_order;

Again, this is only ever set to 1.

> +	csi_mipi.data_lane_num = sensor_mipi_lane_num - 1;
> +	csi_mipi.csi_type = (mipi_sensor_type == MIPI_CPHY)
> +		? CSI2_2_5G_CPHY : CSI2_2_5G;

mipi_sensor_type is only ever set to MIPI_CPHY_NCSI2, so csi_type can
only ever be CSI_2_5G. Can we remove the csi_type member from the
struct, and any unreachable code?

> +	csi_mipi.csi_info = csi_info;
> +
> +	csi_mipi.pad_sel = PAD_10BIT;

It looks like this is only ever set to PAD_10BIT. Can we remove it from
the struct?

> +	csi_mipi.dpcm = 0;

No need to set this to 0, since it gets set two lines down.

> +	input_data_type = (unsigned int)map_fmt(priv);
> +	csi_mipi.dpcm = priv->dpcm;

priv->dpcm gets set in map_fmt, and then gets assigned to csi_mipi.dcpm
here. It isn't used anywhere else. So let's remove dpcm from the _seninf
struct and pass in &csi_mipi.dpcm as an out param.

> +
> +	if (on) {
> +		/* Configure timestamp */
> +		write_master(pseninf, SENINF1_CTRL, (1 << 0), 0x00000001);
> +		write_master(pseninf, SENINF1_CTRL_EXT, (1 << 6), 0x00000040);
> +		seninf_write_reg(pseninf, SENINF_TG1_TM_STP,
> +				 SENINF_TIMESTAMP_STEP);
> +
> +		set_csi_mipi(priv, (struct seninf_csi_mipi *)&csi_mipi);

Unnecessary cast.

> +
> +		enable_mux(priv, mux_select);
> +		set_mux_ctrl(priv, mux_select, sensor_hsync_polarity ? 0 : 1,
> +			     sensor_vsync_polarity ? 0 : 1,
> +			     MIPI_SENSOR, input_data_type, pixel_mode);
> +
> +		set_top_mux_ctrl(priv, mux_select, seninf_src);
> +		seninf_write_reg(pseninf, SENINF_TOP_CAM_MUX_CTRL, 0x0);
> +	} else {
> +		power_off(priv, &csi_mipi);
> +	}
> +
> +	return ret;
> +};
> +
> +static const struct v4l2_subdev_pad_ops seninf_subdev_pad_ops = {
> +	.set_fmt = seninf_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_video_ops seninf_subdev_video_ops = {
> +	.s_stream = seninf_s_stream,
> +};
> +
> +static struct v4l2_subdev_ops seninf_subdev_ops = {
> +	.video	= &seninf_subdev_video_ops,
> +	.pad	= &seninf_subdev_pad_ops,
> +};
> +
> +static int seninf_link_setup(struct media_entity *entity,
> +			     const struct media_pad *local,
> +			     const struct media_pad *remote, u32 flags)
> +{
> +	struct v4l2_subdev *sd;
> +	struct _seninf *priv;
> +
> +	sd = media_entity_to_v4l2_subdev(entity);
> +	priv = v4l2_get_subdevdata(sd);
> +	pr_debug("mtk_seninf: remote %d-%d, local %d-%d\n",
> +		 remote->entity->graph_obj.id, remote->index,
> +		 local->entity->graph_obj.id, local->index);
> +	pr_debug("local->flags %d flags %d\n", local->flags, flags);
> +
> +	if ((local->flags & MEDIA_PAD_FL_SOURCE) &&
> +	    (flags & MEDIA_LNK_FL_ENABLED)) {
> +		pr_debug("set cam mux %d\n", local->index);
> +		/* Select cam mux */
> +		priv->mux_select = local->index;

priv->mux_select never gets read from, and elsewhere the mux is
hardcoded to 0. Should this block be removed?

> +	}
> +
> +	if ((local->flags & MEDIA_PAD_FL_SINK) &&
> +	    (flags & MEDIA_LNK_FL_ENABLED)) {
> +		pr_debug("set port\n", local->index);
> +		/* Select port */
> +		priv->port = local->index;

priv->port is used to index into priv->ep, so let's make sure it is
within the correct range.

> +	}
> +
> +	return 0;
> +}
> +
> +static const struct media_entity_operations seninf_media_ops = {
> +	.link_setup = seninf_link_setup,
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> +static int seninf_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
> +	int ret = 0;
> +
> +	ret = pm_runtime_get_sync(priv->dev);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "Failed to pm_runtime_get_sync: %d\n", ret);
> +		return ret;
> +	}
> +
> +	clk_prepare_enable(priv->cam_clk);
> +	clk_prepare_enable(priv->top_mux_clk);
> +
> +	return ret;
> +}
> +
> +static int seninf_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
> +
> +	clk_disable_unprepare(priv->top_mux_clk);
> +	clk_disable_unprepare(priv->cam_clk);
> +	pm_runtime_put(priv->dev);
> +
> +	return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> +static const struct v4l2_subdev_internal_ops seninf_internal_ops = {
> +	.open = seninf_open,
> +	.close = seninf_close,
> +};
> +#endif
> +
> +static irqreturn_t seninf_irq(int irq, void *device_id)
> +{
> +	return IRQ_HANDLED;
> +}
> +
> +static int seninf_enable_test_pattern(struct _seninf *priv, u32 pattern)
> +{
> +	void *pseninf = priv->seninf_hw;
> +
> +	switch (pattern) {
> +	case TEST_DISABLED:
> +	case TEST_PATTERN_MODE:
> +		break;
> +	case TEST_DEBUG_MODE:
> +		/* Sensor Interface Control */
> +		pr_debug("SENINF_CSI2_CTL SENINF1:0x%x, 2:0x%x, 3:0x%x, 5:0x%x\n",
> +			 seninf_read_reg(pseninf, SENINF1_CSI2_CTL),
> +			 seninf_read_reg(pseninf, SENINF2_CSI2_CTL),
> +			 seninf_read_reg(pseninf, SENINF3_CSI2_CTL),
> +			 seninf_read_reg(pseninf, SENINF5_CSI2_CTL));
> +		/* Read width/height */
> +		/* Read interrupt status */
> +		pr_debug("SENINF1_IRQ:0x%x, 2:0x%x, 3:0x%x, 5:0x%x\n",
> +			 seninf_read_reg(pseninf, SENINF1_CSI2_INT_STATUS),
> +			 seninf_read_reg(pseninf, SENINF2_CSI2_INT_STATUS),
> +			 seninf_read_reg(pseninf, SENINF3_CSI2_INT_STATUS),
> +			 seninf_read_reg(pseninf, SENINF5_CSI2_INT_STATUS));
> +		/* Mux1 */
> +		pr_debug("SENINF1_MUX_CTRL:0x%x, INTSTA:0x%x, DEBUG_2(0x%x)\n",
> +			 seninf_read_reg(pseninf, SENINF1_MUX_CTRL),
> +			 seninf_read_reg(pseninf, SENINF1_MUX_INTSTA),
> +			 seninf_read_reg(pseninf, SENINF1_MUX_DEBUG_2));
> +		if (seninf_read_reg(pseninf, SENINF1_MUX_INTSTA) & 0x1) {
> +			seninf_write_reg(pseninf, SENINF1_MUX_INTSTA,
> +					 0xffffffff);
> +			udelay(SENINF_DRV_DEBUG_DELAY);
> +			pr_debug("overrun CTRL:%x INTSTA:%x DEBUG_2:%x\n",
> +				 seninf_read_reg(pseninf, SENINF1_MUX_CTRL),
> +				 seninf_read_reg(pseninf, SENINF1_MUX_INTSTA),
> +				 seninf_read_reg(pseninf, SENINF1_MUX_DEBUG_2));
> +		}
> +		break;
> +	default:
> +		dev_warn(priv->dev, "%s Unhandled testcase:%d\n",
> +			 __func__, pattern);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int seninf_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct _seninf *priv = container_of(ctrl->handler,
> +					     struct _seninf, ctrl_handler);
> +	int ret = 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:

The docs suggest that V4L2_CID_TEST_PATTERN control is used for
generating test patterns, but it looks like seninf_enable_test_pattern
is just reading and logging register values. 

> +		ret = seninf_enable_test_pattern(priv, ctrl->val);
> +		break;
> +	default:
> +		dev_warn(priv->dev, "%s Unhandled id:0x%x, val:0x%x\n",
> +			 __func__, ctrl->id, ctrl->val);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops seninf_ctrl_ops = {
> +	.s_ctrl = seninf_set_ctrl,
> +};
> +
> +static const char * const seninf_test_pattern_menu[] = {
> +	"Disabled",
> +	"test_pattern_mode",
> +	"test_debug_mode",
> +};
> +
> +static int seninf_initialize_controls(struct _seninf *priv)
> +{
> +	struct v4l2_ctrl_handler *handler;
> +	int ret = 0;

No need to initialize the return value.

> +
> +	handler = &priv->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(handler, 2);
> +	if (ret)
> +		return ret;
> +	priv->test_pattern =
> +	v4l2_ctrl_new_std_menu_items(handler, &seninf_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(seninf_test_pattern_menu) - 1,
> +				     0, 0, seninf_test_pattern_menu);
> +
> +	if (handler->error) {
> +		ret = handler->error;
> +		dev_err(priv->dev,
> +			"Failed to init controls(%d)\n", ret);
> +		goto err_free_handler;
> +	}
> +
> +	priv->subdev.ctrl_handler = handler;
> +	return 0;
> +
> +err_free_handler:
> +	v4l2_ctrl_handler_free(handler);
> +
> +	return ret;
> +}
> +
> +static int seninf_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct _seninf *priv;
> +	struct v4l2_subdev *sd;
> +	struct device_node *endpoint = NULL;
> +	struct device *dev = &pdev->dev;
> +	struct media_pad *pads;
> +	unsigned int irq_info[3];
> +	unsigned int irq;
> +	int i = 0;
> +	int ret = 0;
> +
> +	dev_dbg(dev, "seninf probe +\n");
> +	priv = devm_kzalloc(&pdev->dev, sizeof(struct _seninf), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	memset(priv, 0, sizeof(struct _seninf));
> +	priv->dev = &pdev->dev;
> +	sd = &priv->subdev;
> +	pads = priv->pads;
> +	/* Cam0 <reg 0> */
> +	/* Cam1 <reg 1> */
> +	for (i = 0; i < 2; i++) { /* Support upto two senosrs */

Maybe #define a constant such as MAX_SENSORS, and use this here and
elsewhere?

> +		endpoint = of_graph_get_endpoint_by_regs(dev->of_node, i, i);
> +		if (!endpoint) {
> +			dev_err(dev, "endpoint node not found\n");
> +			return -EINVAL;
> +		}
> +		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
> +						 &priv->ep[i]);
> +		of_node_put(endpoint);
> +
> +		if (ret < 0) {
> +			pr_err("parsing endpoint node failed\n");
> +			return ret;
> +		}
> +		if (priv->ep[i].bus_type != V4L2_MBUS_CSI2) {
> +			pr_err("invalid bus type, must be CSI2\n");
> +			return -EINVAL;
> +		}
> +		pr_debug("bus.mipi_csi2.num_data_lanes %d\n",
> +			 priv->ep[i].bus.mipi_csi2.num_data_lanes);
> +	}
> +	/* Get IRQ ID and request IRQ */
> +	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +
> +	if (irq) {
> +		/* Get IRQ Flag from device node */
> +		if (of_property_read_u32_array(pdev->dev.of_node,
> +					       "interrupts", irq_info,
> +					       ARRAY_SIZE(irq_info))) {
> +			dev_err(dev, "get irq flags from DTS fail!!\n");
> +			return -ENODEV;
> +		}
> +		ret = request_irq(irq, (irq_handler_t)seninf_irq,
> +				  irq_info[2], "SENINF", NULL);

Is the (irq_handler_t) cast needed here?

> +		if (ret) {
> +			dev_err(dev, "request_irq fail\n");
> +			return ret;
> +		}
> +		pr_debug("Seninf devnode:%s, irq=%d\n",
> +			 pdev->dev.of_node->name, irq);
> +	} else {
> +		pr_debug("No IRQ found!!\n");

Should an error be returned in this case? Also, consider changing the
check above to if (!irq) and return from there to reduce nesting.

> +		return ret;
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "base_reg");
> +	priv->base_reg = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->base_reg))
> +		return PTR_ERR(priv->base_reg);
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rx_reg");
> +	priv->rx_reg = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->rx_reg))
> +		return PTR_ERR(priv->rx_reg);
> +
> +	priv->csi2_rx[CFG_CSI_PORT_0]  = priv->rx_reg;
> +	priv->csi2_rx[CFG_CSI_PORT_0A] = priv->rx_reg;
> +	priv->csi2_rx[CFG_CSI_PORT_0B] = priv->rx_reg + 0x1000;
> +	priv->csi2_rx[CFG_CSI_PORT_1]  = priv->rx_reg + 0x2000;
> +	priv->csi2_rx[CFG_CSI_PORT_2]  = priv->rx_reg + 0x4000;
> +
> +	priv->seninf_hw = priv->base_reg;
> +	for (i = 0; i < SENINF_NUM; i++)
> +		priv->seninf_ctrl[i] =  priv->base_reg + 0x1000 * i;
> +	for (i = 0; i < SENINF_MUX_NUM; i++)
> +		priv->seninf_mux[i] =  priv->base_reg + 0x1000 * i;
> +	for (i = 0; i < SENINF_NUM; i++)
> +		priv->csi_rx_conf[i] =  priv->base_reg + 0x1000 * i;

These arrays all have the same values. Is it necessary to have three
arrays?

> +
> +	priv->cam_clk = devm_clk_get(dev, "CLK_CAM_SENINF");
> +	if (IS_ERR(priv->cam_clk)) {
> +		dev_err(dev, "Failed to get cam_clk\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->top_mux_clk = devm_clk_get(dev, "CLK_TOP_MUX_SENINF");
> +	if (IS_ERR(priv->top_mux_clk)) {
> +		dev_err(dev, "Failed to get top_mux_clk\n");
> +		return -EINVAL;
> +	}
> +
> +	v4l2_subdev_init(sd, &seninf_subdev_ops);
> +
> +	ret = seninf_initialize_controls(priv);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize controls\n");
> +		return ret;
> +	}
> +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> +	sd->internal_ops = &seninf_internal_ops;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +#endif
> +	priv->subdev.dev = &pdev->dev;
> +	snprintf(sd->name, V4L2_SUBDEV_NAME_SIZE, "%s.mipi-csi",
> +		 dev_name(&pdev->dev));
> +	v4l2_set_subdevdata(sd, priv);
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	sd->entity.ops = &seninf_media_ops;
> +	for (i = 0; i < 4; i++)
> +		pads[i].flags = MEDIA_PAD_FL_SINK;
> +	for (i = 4; i < NUM_PADS; i++)
> +		pads[i].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sd->entity, NUM_PADS, pads);
> +	if (ret < 0)
> +		goto err_free_handler;
> +#endif
> +	ret = v4l2_async_register_subdev(sd);
> +	if (ret < 0) {
> +		dev_err(dev, "v4l2 async register subdev failed\n");
> +		goto err_clean_entity;
> +	}
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +	dev_dbg(dev, "seninf probe -\n");
> +	return 0;
> +
> +err_clean_entity:
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	media_entity_cleanup(&sd->entity);
> +#endif
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> +
> +	return ret;
> +}
> +
> +static int seninf_pm_suspend(struct device *dev)
> +{
> +	pr_debug("seninf_runtime_suspend\n");
> +
> +	return 0;
> +}
> +
> +static int seninf_pm_resume(struct device *dev)
> +{
> +	pr_debug("seninf_runtime_resume\n");
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops runtime_pm_ops = {
> +	SET_RUNTIME_PM_OPS(seninf_pm_suspend,
> +			   seninf_pm_resume,
> +			   NULL)
> +};
> +
> +static int seninf_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *subdev = platform_get_drvdata(pdev);
> +	struct _seninf *priv = container_of(subdev, struct _seninf, subdev);
> +
> +	v4l2_async_unregister_subdev(&priv->subdev);
> +	pm_runtime_disable(priv->dev);

Should media_entity_cleanup and v4l2_ctrl_handler_free be called in this
function?

> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id mtk_seninf_of_match[] = {
> +	{.compatible = "mediatek,mt8183-seninf"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_seninf_of_match);
> +#endif
> +
> +static int seninf_suspend(struct platform_device *pdev, pm_message_t mesg)
> +{
> +	return 0;
> +}
> +
> +static int seninf_resume(struct platform_device *pdev)
> +{
> +	return 0;
> +}
> +
> +static struct platform_driver seninf_pdrv = {
> +	.probe	= seninf_probe,
> +	.remove	= seninf_remove,
> +	.suspend = seninf_suspend,
> +	.resume = seninf_resume,
> +	.driver	= {
> +		.name	= "seninf_0",
> +		.owner  = THIS_MODULE,
> +#ifdef CONFIG_OF
> +		.of_match_table = mtk_seninf_of_match,
> +#endif
> +		.pm  = &runtime_pm_ops,
> +	},
> +};
> +
> +static int __init mtk_seninf_init(void)
> +{
> +	int ret;
> +
> +	pr_debug("seninf Init\n");
> +	ret = platform_driver_register(&seninf_pdrv);
> +	if (ret) {
> +		pr_err("Failed to register platform driver\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit mtk_seninf_exit(void)
> +{
> +	pr_debug("seninf Exit\n");
> +	platform_driver_unregister(&seninf_pdrv);
> +}
> +
> +late_initcall(mtk_seninf_init);
> +module_exit(mtk_seninf_exit);
> +
> +MODULE_DESCRIPTION("MTK seninf driver");
> +MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("MTK:mtk_seninf");
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/seninf_drv_def.h b/drivers/media/platform/mtk-isp/isp_50/seninf/seninf_drv_def.h
> new file mode 100644
> index 0000000..6280ae4
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/seninf_drv_def.h
> @@ -0,0 +1,201 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2015 MediaTek Inc.
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __SENINF_DRV_DEF_H__
> +#define __SENINF_DRV_DEF_H__
> +
> +#if defined(SENINF_CLK_208M)
> +#define SENINF_TIMESTAMP_STEP     0x67
> +#define SENINF_SETTLE_DELAY       0x15
> +#define SENINF_HS_TRAIL_PARAMETER 0x8
> +#elif defined(SENINF_CLK_312M)
> +#define SENINF_TIMESTAMP_STEP     0x9b
> +#define SENINF_SETTLE_DELAY       0x20
> +#define SENINF_HS_TRAIL_PARAMETER 0xa
> +#else
> +#define SENINF_TIMESTAMP_STEP     0x67
> +#define SENINF_SETTLE_DELAY       0x15
> +#define SENINF_HS_TRAIL_PARAMETER 0x8
> +#endif
> +
> +#define SENINF_DRV_DEBUG_DELAY 1000
> +
> +#define SENSOR_CLOCK_POLARITY_HIGH     0
> +#define SENSOR_CLOCK_POLARITY_LOW      1
> +#define NUM_PADS	12
> +
> +enum {
> +	MIPI_OPHY_NCSI2 = 0,
> +	MIPI_OPHY_CSI2  = 1,
> +	MIPI_CPHY       = 2,
> +};
> +
> +struct sensor_vc_info_struct {
> +	unsigned short vc_num;
> +	unsigned short vc_pixel_num;
> +	unsigned short mode_select;   /* 0: auto mode, 1:direct mode  */
> +	unsigned short expo_ratio;   /* 1/1, 1/2, 1/4, 1/8 */
> +	unsigned short od_value;      /* OD Value */
> +	unsigned short RG_STATSMODE; /* 0: 16x16, 1:8x8, 2:4x4, 3:1x1*/
> +	unsigned short VC0_ID;
> +	unsigned short vc0_data_type;
> +	unsigned short VC0_SIZEH;
> +	unsigned short VC0_SIZEV;
> +	unsigned short VC1_ID;
> +	unsigned short vc1_data_type;
> +	unsigned short VC1_SIZEH;
> +	unsigned short VC1_SIZEV;
> +	unsigned short VC2_ID;
> +	unsigned short vc2_data_type;
> +	unsigned short VC2_SIZEH;
> +	unsigned short VC2_SIZEV;
> +	unsigned short VC3_ID;
> +	unsigned short vc3_data_type;
> +	unsigned short VC3_SIZEH;
> +	unsigned short VC3_SIZEV;
> +	unsigned short VC4_ID;
> +	unsigned short vc4_data_type;
> +	unsigned short VC4_SIZEH;
> +	unsigned short VC4_SIZEV;
> +	unsigned short VC5_ID;
> +	unsigned short vc5_data_type;
> +	unsigned short VC5_SIZEH;
> +	unsigned short VC5_SIZEV;
> +};
> +
> +enum {
> +	TEST_DISABLED = 0X0,
> +	TEST_PATTERN_MODE,
> +	TEST_DEBUG_MODE,
> +};
> +
> +enum {
> +	CFG_CSI_PORT_0 = 0x0,/* 4D1C */
> +	CFG_CSI_PORT_1,      /* 4D1C */
> +	CFG_CSI_PORT_2,      /* 4D1C */
> +	CFG_CSI_PORT_0A,     /* 2D1C */
> +	CFG_CSI_PORT_0B,     /* 2D1C */
> +	CFG_CSI_PORT_MAX_NUM,
> +	CFG_CSI_PORT_NONE    /*for non-MIPI sensor */
> +};
> +
> +enum {
> +	ONE_PIXEL_MODE  = 0x0,
> +	TWO_PIXEL_MODE  = 0x1,
> +	FOUR_PIXEL_MODE = 0x2,
> +};
> +
> +#define SENINF_CAM_MUX_MIN      SENINF_MUX1
> +#define SENINF_CAM_MUX_MAX      SENINF_MUX3
> +#define SENINF_CAMSV_MUX_MIN    SENINF_MUX3
> +#define SENINF_CAMSV_MUX_MAX    SENINF_MUX_NUM
> +
> +#define SENINF_PIXEL_MODE_CAM   TWO_PIXEL_MODE
> +#define SENINF_PIXEL_MODE_CAMSV FOUR_PIXEL_MODE
> +
> +#define SENINF_TIMESTAMP_CLK    1000
> +
> +enum {
> +	SENSOR_MIPI_1_LANE = 0,
> +	SENSOR_MIPI_2_LANE,
> +	SENSOR_MIPI_3_LANE,
> +	SENSOR_MIPI_4_LANE
> +};
> +
> +enum {
> +	SENINF_MUX1 = 0x0,
> +	SENINF_MUX2 = 0x1,
> +	SENINF_MUX3 = 0x2,
> +	SENINF_MUX4 = 0x3,
> +	SENINF_MUX5 = 0x4,
> +	SENINF_MUX6 = 0x5,
> +	SENINF_MUX_NUM,
> +	SENINF_MUX_ERROR = -1,
> +};
> +
> +enum {
> +	SENINF_1 = 0x0,
> +	SENINF_2 = 0x1,
> +	SENINF_3 = 0x2,
> +	SENINF_4 = 0x3,
> +	SENINF_5 = 0x4,
> +	SENINF_NUM,
> +};
> +
> +enum {
> +	PAD_10BIT       = 0x0,
> +	PAD_8BIT_7_0    = 0x3,
> +	PAD_8BIT_9_2    = 0x4,
> +};
> +
> +enum { /* 0:CSI2(2.5G), 3: parallel, 8:NCSI2(1.5G) */
> +	CSI2            = 0x0, /* 2.5G support */
> +	TEST_MODEL      = 0x1,
> +	CCIR656         = 0x2,
> +	PARALLEL_SENSOR = 0x3,
> +	SERIAL_SENSOR   = 0x4,
> +	HD_TV           = 0x5,
> +	EXT_CSI2_OUT1   = 0x6,
> +	EXT_CSI2_OUT2   = 0x7,
> +	MIPI_SENSOR     = 0x8,/* 1.5G support */
> +	VIRTUAL_CHANNEL_1  = 0x9,
> +	VIRTUAL_CHANNEL_2  = 0xA,
> +	VIRTUAL_CHANNEL_3  = 0xB,
> +	VIRTUAL_CHANNEL_4  = 0xC,
> +	VIRTUAL_CHANNEL_5  = 0xD,
> +	VIRTUAL_CHANNEL_6  = 0xE,
> +};
> +
> +enum { /* 0:CSI2(2.5G), 1:NCSI2(1.5G) */
> +	CSI2_1_5G           = 0x0, /* 1.5G support */
> +	CSI2_2_5G           = 0x1, /* 2.5G support*/
> +	CSI2_2_5G_CPHY      = 0x2, /* 2.5G support*/
> +};
> +
> +enum {
> +	RAW_8BIT_FMT        = 0x0,
> +	RAW_10BIT_FMT       = 0x1,
> +	RAW_12BIT_FMT       = 0x2,
> +	YUV422_FMT          = 0x3,
> +	RAW_14BIT_FMT       = 0x4,
> +	RGB565_MIPI_FMT     = 0x5,
> +	RGB888_MIPI_FMT     = 0x6,
> +	JPEG_FMT            = 0x7
> +};
> +
> +enum {
> +	CMD_SENINF_GET_SENINF_ADDR,
> +	CMD_SENINF_DEBUG_TASK,
> +	CMD_SENINF_DEBUG_TASK_CAMSV,
> +	CMD_SENINF_DEBUG_PIXEL_METER,
> +	CMD_SENINF_MAX
> +};
> +
> +/* MIPI sensor pad usage */
> +struct seninf_csi_info {
> +	unsigned int port;
> +	unsigned int         seninf;
> +};
> +
> +struct seninf_csi_mipi {
> +	unsigned int     enable;
> +	struct seninf_csi_info  *csi_info;
> +	unsigned int csi_type;
> +	unsigned int     data_lane_num;
> +	unsigned int     dpcm;
> +	unsigned int     data_header_order;
> +	unsigned int     pad_sel;
> +};
> +
> +#endif /*__SENINF_DRV_DEF_H__ */
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/seninf_reg.h b/drivers/media/platform/mtk-isp/isp_50/seninf/seninf_reg.h
> new file mode 100644
> index 0000000..7402630
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/seninf_reg.h
> @@ -0,0 +1,992 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2015 MediaTek Inc.
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _SENINF_REG_H_
> +#define _SENINF_REG_H_
> +
> +#define mt_reg_sync_writel(v, a) \
> +	do {	\
> +		__raw_writel((v), (void __force __iomem *)((a)));	\
> +		/* add memory barrier */ \
> +		mb();  \
> +	} while (0)
> +
> +#define seninf_read_reg(reg_base, reg_name) \
> +	((unsigned int)ioread32((reg_base) + (reg_name)))
> +#define seninf_write_reg(reg_base, reg_name, value) \
> +	mt_reg_sync_writel(value, (reg_base) + (reg_name))
> +#define write_master(reg_base, reg_name, value, mask)	\
> +	mt_reg_sync_writel(ioread32((reg_base) + (reg_name)) \
> +			   & (~(mask)) | (value), (reg_base) + (reg_name))

Can these be written as static inline functions?

> +
> +/* 0x11C80000..0x11C850AC */
> +#define MIPI_RX_ANA00_CSI0A           0x0000
> +#define MIPI_RX_ANA04_CSI0A           0x0004
> +#define MIPI_RX_ANA08_CSI0A           0x0008
> +#define MIPI_RX_ANA0C_CSI0A           0x000C
> +#define MIPI_RX_ANA10_CSI0A           0x0010
> +#define MIPI_RX_ANA14_CSI0A           0x0014
> +#define MIPI_RX_ANA18_CSI0A           0x0018
> +#define MIPI_RX_ANA1C_CSI0A           0x001C
> +#define MIPI_RX_ANA20_CSI0A           0x0020
> +#define MIPI_RX_ANA24_CSI0A           0x0024
> +#define MIPI_RX_ANA28_CSI0A           0x0028
> +#define MIPI_RX_ANA2C_CSI0A           0x002C
> +#define rsv_0030                      0x0030
> +#define MIPI_RX_ANA34_CSI0A           0x0034
> +#define MIPI_RX_ANA38_CSI0A           0x0038
> +#define rsv_003C                      0x003C
> +#define MIPI_RX_ANA40_CSI0A           0x0040
> +#define rsv_0044                      0x0044
> +#define MIPI_RX_ANA48_CSI0A           0x0048
> +#define rsv_004C_13                   0x004C
> +#define MIPI_RX_WRAPPER80_CSI0A       0x0080
> +#define MIPI_RX_WRAPPER84_CSI0A       0x0084
> +#define MIPI_RX_WRAPPER88_CSI0A       0x0088
> +#define MIPI_RX_WRAPPER8C_CSI0A       0x008C
> +#define MIPI_RX_WRAPPER90_CSI0A       0x0090
> +#define MIPI_RX_WRAPPER94_CSI0A       0x0094
> +#define MIPI_RX_WRAPPER98_CSI0A       0x0098
> +#define MIPI_RX_WRAPPER9C_CSI0A       0x009C
> +#define rsv_00A0                      0x00A0
> +#define MIPI_RX_ANAA4_CSI0A           0x00A4
> +#define MIPI_RX_ANAA8_CSI0A           0x00A8
> +#define rsv_00AC_981                  0x00AC
> +#define MIPI_RX_ANA00_CSI0B           0x1000
> +#define MIPI_RX_ANA04_CSI0B           0x1004
> +#define MIPI_RX_ANA08_CSI0B           0x1008
> +#define MIPI_RX_ANA0C_CSI0B           0x100C
> +#define MIPI_RX_ANA10_CSI0B           0x1010
> +#define MIPI_RX_ANA14_CSI0B           0x1014
> +#define MIPI_RX_ANA18_CSI0B           0x1018
> +#define MIPI_RX_ANA1C_CSI0B           0x101C
> +#define MIPI_RX_ANA20_CSI0B           0x1020
> +#define MIPI_RX_ANA24_CSI0B           0x1024
> +#define MIPI_RX_ANA28_CSI0B           0x1028
> +#define MIPI_RX_ANA2C_CSI0B           0x102C
> +#define rsv_1030                      0x1030
> +#define MIPI_RX_ANA34_CSI0B           0x1034
> +#define MIPI_RX_ANA38_CSI0B           0x1038
> +#define rsv_103C_3                    0x103C
> +#define MIPI_RX_ANA48_CSI0B           0x1048
> +#define rsv_104C_13                   0x104C
> +#define MIPI_RX_WRAPPER80_CSI0B       0x1080
> +#define MIPI_RX_WRAPPER84_CSI0B       0x1084
> +#define MIPI_RX_WRAPPER88_CSI0B       0x1088
> +#define MIPI_RX_WRAPPER8C_CSI0B       0x108C
> +#define MIPI_RX_WRAPPER90_CSI0B       0x1090
> +#define MIPI_RX_WRAPPER94_CSI0B       0x1094
> +#define MIPI_RX_WRAPPER98_CSI0B       0x1098
> +#define MIPI_RX_WRAPPER9C_CSI0B       0x109C
> +#define rsv_10A0                      0x10A0
> +#define MIPI_RX_ANAA4_CSI0B           0x10A4
> +#define MIPI_RX_ANAA8_CSI0B           0x10A8
> +#define rsv_10AC_981                  0x10AC
> +#define MIPI_RX_ANA00_CSI1A           0x2000
> +#define MIPI_RX_ANA04_CSI1A           0x2004
> +#define MIPI_RX_ANA08_CSI1A           0x2008
> +#define MIPI_RX_ANA0C_CSI1A           0x200C
> +#define MIPI_RX_ANA10_CSI1A           0x2010
> +#define rsv_2014                      0x2014
> +#define MIPI_RX_ANA18_CSI1A           0x2018
> +#define MIPI_RX_ANA1C_CSI1A           0x201C
> +#define rsv_2020                      0x2020
> +#define MIPI_RX_ANA24_CSI1A           0x2024
> +#define rsv_2028_8                    0x2028
> +#define MIPI_RX_ANA48_CSI1A           0x2048
> +#define rsv_204C_13                   0x204C
> +#define MIPI_RX_WRAPPER80_CSI1A       0x2080
> +#define MIPI_RX_WRAPPER84_CSI1A       0x2084
> +#define MIPI_RX_WRAPPER88_CSI1A       0x2088
> +#define MIPI_RX_WRAPPER8C_CSI1A       0x208C
> +#define MIPI_RX_WRAPPER90_CSI1A       0x2090
> +#define MIPI_RX_WRAPPER94_CSI1A       0x2094
> +#define MIPI_RX_WRAPPER98_CSI1A       0x2098
> +#define MIPI_RX_WRAPPER9C_CSI1A       0x209C
> +#define rsv_20A0                      0x20A0
> +#define MIPI_RX_ANAA4_CSI1A           0x20A4
> +#define MIPI_RX_ANAA8_CSI1A           0x20A8
> +#define rsv_20AC_981                  0x20AC
> +#define MIPI_RX_ANA00_CSI1B           0x3000
> +#define MIPI_RX_ANA04_CSI1B           0x3004
> +#define MIPI_RX_ANA08_CSI1B           0x3008
> +#define MIPI_RX_ANA0C_CSI1B           0x300C
> +#define MIPI_RX_ANA10_CSI1B           0x3010
> +#define rsv_3014                      0x3014
> +#define MIPI_RX_ANA18_CSI1B           0x3018
> +#define MIPI_RX_ANA1C_CSI1B           0x301C
> +#define rsv_3020                      0x3020
> +#define MIPI_RX_ANA24_CSI1B           0x3024
> +#define rsv_3028_8                    0x3028
> +#define MIPI_RX_ANA48_CSI1B           0x3048
> +#define rsv_304C_13                   0x304C
> +#define MIPI_RX_WRAPPER80_CSI1B       0x3080
> +#define MIPI_RX_WRAPPER84_CSI1B       0x3084
> +#define MIPI_RX_WRAPPER88_CSI1B       0x3088
> +#define MIPI_RX_WRAPPER8C_CSI1B       0x308C
> +#define MIPI_RX_WRAPPER90_CSI1B       0x3090
> +#define MIPI_RX_WRAPPER94_CSI1B       0x3094
> +#define MIPI_RX_WRAPPER98_CSI1B       0x3098
> +#define MIPI_RX_WRAPPER9C_CSI1B       0x309C
> +#define rsv_30A0                      0x30A0
> +#define MIPI_RX_ANAA4_CSI1B           0x30A4
> +#define MIPI_RX_ANAA8_CSI1B           0x30A8
> +#define rsv_30AC_981                  0x30AC
> +#define MIPI_RX_ANA00_CSI2A           0x4000
> +#define MIPI_RX_ANA04_CSI2A           0x4004
> +#define MIPI_RX_ANA08_CSI2A           0x4008
> +#define MIPI_RX_ANA0C_CSI2A           0x400C
> +#define MIPI_RX_ANA10_CSI2A           0x4010
> +#define rsv_4014                      0x4014
> +#define MIPI_RX_ANA18_CSI2A           0x4018
> +#define MIPI_RX_ANA1C_CSI2A           0x401C
> +#define rsv_4020                      0x4020
> +#define MIPI_RX_ANA24_CSI2A           0x4024
> +#define rsv_4028_8                    0x4028
> +#define MIPI_RX_ANA48_CSI2A           0x4048
> +#define rsv_404C_13                   0x404C
> +#define MIPI_RX_WRAPPER80_CSI2A       0x4080
> +#define MIPI_RX_WRAPPER84_CSI2A       0x4084
> +#define MIPI_RX_WRAPPER88_CSI2A       0x4088
> +#define MIPI_RX_WRAPPER8C_CSI2A       0x408C
> +#define MIPI_RX_WRAPPER90_CSI2A       0x4090
> +#define MIPI_RX_WRAPPER94_CSI2A       0x4094
> +#define MIPI_RX_WRAPPER98_CSI2A       0x4098
> +#define MIPI_RX_WRAPPER9C_CSI2A       0x409C
> +#define rsv_40A0                      0x40A0
> +#define MIPI_RX_ANAA4_CSI2A           0x40A4
> +#define MIPI_RX_ANAA8_CSI2A           0x40A8
> +#define rsv_40AC_981                  0x40AC
> +#define MIPI_RX_ANA00_CSI2B           0x5000
> +#define MIPI_RX_ANA04_CSI2B           0x5004
> +#define MIPI_RX_ANA08_CSI2B           0x5008
> +#define MIPI_RX_ANA0C_CSI2B           0x500C
> +#define MIPI_RX_ANA10_CSI2B           0x5010
> +#define rsv_5014                      0x5014
> +#define MIPI_RX_ANA18_CSI2B           0x5018
> +#define MIPI_RX_ANA1C_CSI2B           0x501C
> +#define rsv_5020                      0x5020
> +#define MIPI_RX_ANA24_CSI2B           0x5024
> +#define rsv_5028_8                    0x5028
> +#define MIPI_RX_ANA48_CSI2B           0x5048
> +#define rsv_504C_13                   0x504C
> +#define MIPI_RX_WRAPPER80_CSI2B       0x5080
> +#define MIPI_RX_WRAPPER84_CSI2B       0x5084
> +#define MIPI_RX_WRAPPER88_CSI2B       0x5088
> +#define MIPI_RX_WRAPPER8C_CSI2B       0x508C
> +#define MIPI_RX_WRAPPER90_CSI2B       0x5090
> +#define MIPI_RX_WRAPPER94_CSI2B       0x5094
> +#define MIPI_RX_WRAPPER98_CSI2B       0x5098
> +#define MIPI_RX_WRAPPER9C_CSI2B       0x509C
> +#define rsv_50A0                      0x50A0
> +#define MIPI_RX_ANAA4_CSI2B           0x50A4
> +#define MIPI_RX_ANAA8_CSI2B           0x50A8
> +#define rsv_50AC_20                   0x50AC
> +
> +/* 0x1A040000..0x1A047D40 */
> +#define SENINF_TOP_CTRL                        0x0000
> +#define SENINF_TOP_CMODEL_PAR                  0x0004
> +#define SENINF_TOP_MUX_CTRL                    0x0008
> +#define rsv_000C                               0x000C
> +#define SENINF_TOP_CAM_MUX_CTRL                0x0010
> +#define SENINF_TOP_N3D_A_CTL                   0x0014
> +#define SENINF_TOP_N3D_B_CTL                   0x0018
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI0         0x001C
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI1         0x0020
> +#define SENINF_TOP_PHY_SENINF_CTL_CSI2         0x0024
> +#define rsv_0028_54                            0x0028
> +#define SENINF_N3D_A_CTL                       0x0100
> +#define SENINF_N3D_A_POS                       0x0104
> +#define SENINF_N3D_A_TRIG                      0x0108
> +#define SENINF_N3D_A_INT                       0x010C
> +#define SENINF_N3D_A_CNT0                      0x0110
> +#define SENINF_N3D_A_CNT1                      0x0114
> +#define SENINF_N3D_A_DBG                       0x0118
> +#define SENINF_N3D_A_DIFF_THR                  0x011C
> +#define SENINF_N3D_A_DIFF_CNT                  0x0120
> +#define SENINF_N3D_A_DBG_1                     0x0124
> +#define SENINF_N3D_A_VALID_TG_CNT              0x0128
> +#define SENINF_N3D_A_SYNC_A_PERIOD             0x012C
> +#define SENINF_N3D_A_SYNC_B_PERIOD             0x0130
> +#define SENINF_N3D_A_SYNC_A_PULSE_LEN          0x0134
> +#define SENINF_N3D_A_SYNC_B_PULSE_LEN          0x0138
> +#define SENINF_N3D_A_SUB_CNT                   0x013C
> +#define SENINF_N3D_A_VSYNC_CNT                 0x0140
> +#define rsv_0144_47                            0x0144
> +#define SENINF1_CTRL                           0x0200
> +#define SENINF1_CTRL_EXT                       0x0204
> +#define SENINF1_ASYNC_CTRL                     0x0208
> +#define rsv_020C_253                           0x020C
> +#define SENINF_TG1_PH_CNT                      0x0600
> +#define SENINF_TG1_SEN_CK                      0x0604
> +#define SENINF_TG1_TM_CTL                      0x0608
> +#define SENINF_TG1_TM_SIZE                     0x060C
> +#define SENINF_TG1_TM_CLK                      0x0610
> +#define SENINF_TG1_TM_STP                      0x0614
> +#define rsv_0618_131                           0x0618
> +#define MIPI_RX_CON24_CSI0                     0x0824
> +#define MIPI_RX_CON28_CSI0                     0x0828
> +#define rsv_082C_2                             0x082C
> +#define MIPI_RX_CON34_CSI0                     0x0834
> +#define MIPI_RX_CON38_CSI0                     0x0838
> +#define MIPI_RX_CON3C_CSI0                     0x083C
> +#define rsv_0840_15                            0x0840
> +#define MIPI_RX_CON7C_CSI0                     0x087C
> +#define MIPI_RX_CON80_CSI0                     0x0880
> +#define MIPI_RX_CON84_CSI0                     0x0884
> +#define MIPI_RX_CON88_CSI0                     0x0888
> +#define MIPI_RX_CON8C_CSI0                     0x088C
> +#define MIPI_RX_CON90_CSI0                     0x0890
> +#define MIPI_RX_CON94_CSI0                     0x0894
> +#define MIPI_RX_CON98_CSI0                     0x0898
> +#define rsv_089C                               0x089C
> +#define MIPI_RX_CONA0_CSI0                     0x08A0
> +#define rsv_08A4_3                             0x08A4
> +#define MIPI_RX_CONB0_CSI0                     0x08B0
> +#define MIPI_RX_CONB4_CSI0                     0x08B4
> +#define MIPI_RX_CONB8_CSI0                     0x08B8
> +#define MIPI_RX_CONBC_CSI0                     0x08BC
> +#define MIPI_RX_CONC0_CSI0                     0x08C0
> +#define MIPI_RX_CONC4_CSI0                     0x08C4
> +#define MIPI_RX_CONC8_CSI0                     0x08C8
> +#define MIPI_RX_CONCC_CSI0                     0x08CC
> +#define MIPI_RX_COND0_CSI0                     0x08D0
> +#define rsv_08D4_75                            0x08D4
> +#define SENINF1_CSI2_CTL                       0x0A00
> +#define SENINF1_CSI2_LNRC_TIMING               0x0A04
> +#define SENINF1_CSI2_LNRD_TIMING               0x0A08
> +#define SENINF1_CSI2_DPCM                      0x0A0C
> +#define SENINF1_CSI2_INT_EN                    0x0A10
> +#define SENINF1_CSI2_INT_STATUS                0x0A14
> +#define SENINF1_CSI2_DGB_SEL                   0x0A18
> +#define SENINF1_CSI2_DBG_PORT                  0x0A1C
> +#define SENINF1_CSI2_SPARE0                    0x0A20
> +#define SENINF1_CSI2_SPARE1                    0x0A24
> +#define SENINF1_CSI2_LNRC_FSM                  0x0A28
> +#define SENINF1_CSI2_LNRD_FSM                  0x0A2C
> +#define SENINF1_CSI2_FRAME_LINE_NUM            0x0A30
> +#define SENINF1_CSI2_GENERIC_SHORT             0x0A34
> +#define SENINF1_CSI2_HSRX_DBG                  0x0A38
> +#define SENINF1_CSI2_DI                        0x0A3C
> +#define SENINF1_CSI2_HS_TRAIL                  0x0A40
> +#define SENINF1_CSI2_DI_CTRL                   0x0A44
> +#define rsv_0A48                               0x0A48
> +#define SENINF1_CSI2_DETECT_CON1               0x0A4C
> +#define SENINF1_CSI2_DETECT_CON2               0x0A50
> +#define SENINF1_CSI2_DETECT_CON3               0x0A54
> +#define SENINF1_CSI2_RLR0_CON0                 0x0A58
> +#define SENINF1_CSI2_RLR1_CON0                 0x0A5C
> +#define SENINF1_CSI2_RLR2_CON0                 0x0A60
> +#define SENINF1_CSI2_RLR_CON0                  0x0A64
> +#define SENINF1_CSI2_MUX_CON                   0x0A68
> +#define SENINF1_CSI2_DETECT_DBG0               0x0A6C
> +#define SENINF1_CSI2_DETECT_DBG1               0x0A70
> +#define SENINF1_CSI2_RESYNC_MERGE_CTL          0x0A74
> +#define SENINF1_CSI2_CTRL_TRIO_MUX             0x0A78
> +#define SENINF1_CSI2_CTRL_TRIO_CON             0x0A7C
> +#define SENINF1_FIX_ADDR_CPHY0_DBG             0x0A80
> +#define SENINF1_FIX_ADDR_CPHY1_DBG             0x0A84
> +#define SENINF1_FIX_ADDR_CPHY2_DBG             0x0A88
> +#define SENINF1_FIX_ADDR_DBG                   0x0A8C
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG0   0x0A90
> +#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG1   0x0A94
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG0   0x0A98
> +#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG1   0x0A9C
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG0   0x0AA0
> +#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG1   0x0AA4
> +#define SENINF1_SYNC_RESYNC_CTL                0x0AA8
> +#define SENINF1_POST_DETECT_CTL                0x0AAC
> +#define SENINF1_WIRE_STATE_DECODE_CONFIG       0x0AB0
> +#define SENINF1_CSI2_CPHY_LNRD_FSM             0x0AB4
> +#define SENINF1_FIX_ADDR_CPHY0_DBG0            0x0AB8
> +#define SENINF1_FIX_ADDR_CPHY0_DBG1            0x0ABC
> +#define SENINF1_FIX_ADDR_CPHY0_DBG2            0x0AC0
> +#define SENINF1_FIX_ADDR_CPHY1_DBG0            0x0AC4
> +#define SENINF1_FIX_ADDR_CPHY1_DBG1            0x0AC8
> +#define SENINF1_FIX_ADDR_CPHY1_DBG2            0x0ACC
> +#define SENINF1_FIX_ADDR_CPHY2_DBG0            0x0AD0
> +#define SENINF1_FIX_ADDR_CPHY2_DBG1            0x0AD4
> +#define SENINF1_FIX_ADDR_CPHY2_DBG2            0x0AD8
> +#define SENINF1_FIX_ADDR_DBG0                  0x0ADC
> +#define SENINF1_FIX_ADDR_DBG1                  0x0AE0
> +#define SENINF1_FIX_ADDR_DBG2                  0x0AE4
> +#define SENINF1_CSI2_MODE                      0x0AE8
> +#define rsv_0AEC                               0x0AEC
> +#define SENINF1_CSI2_DI_EXT                    0x0AF0
> +#define SENINF1_CSI2_DI_CTRL_EXT               0x0AF4
> +#define SENINF1_CSI2_CPHY_LOOPBACK             0x0AF8
> +#define rsv_0AFC                               0x0AFC
> +#define SENINF1_CSI2_PROGSEQ_0                 0x0B00
> +#define SENINF1_CSI2_PROGSEQ_1                 0x0B04
> +#define rsv_0B08_2                             0x0B08
> +#define SENINF1_CSI2_INT_EN_EXT                0x0B10
> +#define SENINF1_CSI2_INT_STATUS_EXT            0x0B14
> +#define SENINF1_CSI2_CPHY_FIX_POINT_RST        0x0B18
> +#define SENINF1_CSI2_RLR3_CON0                 0x0B1C
> +#define SENINF1_CSI2_DPHY_SYNC                 0x0B20
> +#define SENINF1_CSI2_DESKEW_SYNC               0x0B24
> +#define SENINF1_CSI2_DETECT_DBG2               0x0B28
> +#define rsv_0B2C                               0x0B2C
> +#define SENINF1_FIX_ADDR_CPHY3_DBG0            0x0B30
> +#define SENINF1_FIX_ADDR_CPHY3_DBG1            0x0B34
> +#define SENINF1_FIX_ADDR_CPHY3_DBG2            0x0B38
> +#define SENINF1_CSI2_DI_EXT_2                  0x0B3C
> +#define SENINF1_CSI2_DI_CTRL_EXT_2             0x0B40
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG0   0x0B44
> +#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG1   0x0B48
> +#define rsv_0B4C_109                           0x0B4C
> +#define SENINF1_MUX_CTRL                       0x0D00
> +#define SENINF1_MUX_INTEN                      0x0D04
> +#define SENINF1_MUX_INTSTA                     0x0D08
> +#define SENINF1_MUX_SIZE                       0x0D0C
> +#define SENINF1_MUX_DEBUG_1                    0x0D10
> +#define SENINF1_MUX_DEBUG_2                    0x0D14
> +#define SENINF1_MUX_DEBUG_3                    0x0D18
> +#define SENINF1_MUX_DEBUG_4                    0x0D1C
> +#define SENINF1_MUX_DEBUG_5                    0x0D20
> +#define SENINF1_MUX_DEBUG_6                    0x0D24
> +#define SENINF1_MUX_DEBUG_7                    0x0D28
> +#define SENINF1_MUX_SPARE                      0x0D2C
> +#define SENINF1_MUX_DATA                       0x0D30
> +#define SENINF1_MUX_DATA_CNT                   0x0D34
> +#define SENINF1_MUX_CROP                       0x0D38
> +#define SENINF1_MUX_CTRL_EXT                   0x0D3C
> +#define rsv_0D40_240                           0x0D40
> +#define SENINF_N3D_B_CTL                       0x1100
> +#define SENINF_N3D_B_POS                       0x1104
> +#define SENINF_N3D_B_TRIG                      0x1108
> +#define SENINF_N3D_B_INT                       0x110C
> +#define SENINF_N3D_B_CNT0                      0x1110
> +#define SENINF_N3D_B_CNT1                      0x1114
> +#define SENINF_N3D_B_DBG                       0x1118
> +#define SENINF_N3D_B_DIFF_THR                  0x111C
> +#define SENINF_N3D_B_DIFF_CNT                  0x1120
> +#define SENINF_N3D_B_DBG_1                     0x1124
> +#define SENINF_N3D_B_VALID_TG_CNT              0x1128
> +#define SENINF_N3D_B_SYNC_A_PERIOD             0x112C
> +#define SENINF_N3D_B_SYNC_B_PERIOD             0x1130
> +#define SENINF_N3D_B_SYNC_A_PULSE_LEN          0x1134
> +#define SENINF_N3D_B_SYNC_B_PULSE_LEN          0x1138
> +#define SENINF_N3D_B_SUB_CNT                   0x113C
> +#define SENINF_N3D_B_VSYNC_CNT                 0x1140
> +#define rsv_1144_47                            0x1144
> +#define SENINF2_CTRL                           0x1200
> +#define SENINF2_CTRL_EXT                       0x1204
> +#define SENINF2_ASYNC_CTRL                     0x1208
> +#define rsv_120C_253                           0x120C
> +#define SENINF_TG2_PH_CNT                      0x1600
> +#define SENINF_TG2_SEN_CK                      0x1604
> +#define SENINF_TG2_TM_CTL                      0x1608
> +#define SENINF_TG2_TM_SIZE                     0x160C
> +#define SENINF_TG2_TM_CLK                      0x1610
> +#define SENINF_TG2_TM_STP                      0x1614
> +#define rsv_1618_131                           0x1618
> +#define MIPI_RX_CON24_CSI1                     0x1824
> +#define MIPI_RX_CON28_CSI1                     0x1828
> +#define rsv_182C_2                             0x182C
> +#define MIPI_RX_CON34_CSI1                     0x1834
> +#define MIPI_RX_CON38_CSI1                     0x1838
> +#define MIPI_RX_CON3C_CSI1                     0x183C
> +#define rsv_1840_15                            0x1840
> +#define MIPI_RX_CON7C_CSI1                     0x187C
> +#define MIPI_RX_CON80_CSI1                     0x1880
> +#define MIPI_RX_CON84_CSI1                     0x1884
> +#define MIPI_RX_CON88_CSI1                     0x1888
> +#define MIPI_RX_CON8C_CSI1                     0x188C
> +#define MIPI_RX_CON90_CSI1                     0x1890
> +#define MIPI_RX_CON94_CSI1                     0x1894
> +#define MIPI_RX_CON98_CSI1                     0x1898
> +#define rsv_189C                               0x189C
> +#define MIPI_RX_CONA0_CSI1                     0x18A0
> +#define rsv_18A4_3                             0x18A4
> +#define MIPI_RX_CONB0_CSI1                     0x18B0
> +#define MIPI_RX_CONB4_CSI1                     0x18B4
> +#define MIPI_RX_CONB8_CSI1                     0x18B8
> +#define MIPI_RX_CONBC_CSI1                     0x18BC
> +#define MIPI_RX_CONC0_CSI1                     0x18C0
> +#define MIPI_RX_CONC4_CSI1                     0x18C4
> +#define MIPI_RX_CONC8_CSI1                     0x18C8
> +#define MIPI_RX_CONCC_CSI1                     0x18CC
> +#define MIPI_RX_COND0_CSI1                     0x18D0
> +#define rsv_18D4_75                            0x18D4
> +#define SENINF2_CSI2_CTL                       0x1A00
> +#define SENINF2_CSI2_LNRC_TIMING               0x1A04
> +#define SENINF2_CSI2_LNRD_TIMING               0x1A08
> +#define SENINF2_CSI2_DPCM                      0x1A0C
> +#define SENINF2_CSI2_INT_EN                    0x1A10
> +#define SENINF2_CSI2_INT_STATUS                0x1A14
> +#define SENINF2_CSI2_DGB_SEL                   0x1A18
> +#define SENINF2_CSI2_DBG_PORT                  0x1A1C
> +#define SENINF2_CSI2_SPARE0                    0x1A20
> +#define SENINF2_CSI2_SPARE1                    0x1A24
> +#define SENINF2_CSI2_LNRC_FSM                  0x1A28
> +#define SENINF2_CSI2_LNRD_FSM                  0x1A2C
> +#define SENINF2_CSI2_FRAME_LINE_NUM            0x1A30
> +#define SENINF2_CSI2_GENERIC_SHORT             0x1A34
> +#define SENINF2_CSI2_HSRX_DBG                  0x1A38
> +#define SENINF2_CSI2_DI                        0x1A3C
> +#define SENINF2_CSI2_HS_TRAIL                  0x1A40
> +#define SENINF2_CSI2_DI_CTRL                   0x1A44
> +#define rsv_1A48                               0x1A48
> +#define SENINF2_CSI2_DETECT_CON1               0x1A4C
> +#define SENINF2_CSI2_DETECT_CON2               0x1A50
> +#define SENINF2_CSI2_DETECT_CON3               0x1A54
> +#define SENINF2_CSI2_RLR0_CON0                 0x1A58
> +#define SENINF2_CSI2_RLR1_CON0                 0x1A5C
> +#define SENINF2_CSI2_RLR2_CON0                 0x1A60
> +#define SENINF2_CSI2_RLR_CON0                  0x1A64
> +#define SENINF2_CSI2_MUX_CON                   0x1A68
> +#define SENINF2_CSI2_DETECT_DBG0               0x1A6C
> +#define SENINF2_CSI2_DETECT_DBG1               0x1A70
> +#define SENINF2_CSI2_RESYNC_MERGE_CTL          0x1A74
> +#define SENINF2_CSI2_CTRL_TRIO_MUX             0x1A78
> +#define SENINF2_CSI2_CTRL_TRIO_CON             0x1A7C
> +#define SENINF2_FIX_ADDR_CPHY0_DBG             0x1A80
> +#define SENINF2_FIX_ADDR_CPHY1_DBG             0x1A84
> +#define SENINF2_FIX_ADDR_CPHY2_DBG             0x1A88
> +#define SENINF2_FIX_ADDR_DBG                   0x1A8C
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG0   0x1A90
> +#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG1   0x1A94
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG0   0x1A98
> +#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG1   0x1A9C
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG0   0x1AA0
> +#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG1   0x1AA4
> +#define SENINF2_SYNC_RESYNC_CTL                0x1AA8
> +#define SENINF2_POST_DETECT_CTL                0x1AAC
> +#define SENINF2_WIRE_STATE_DECODE_CONFIG       0x1AB0
> +#define SENINF2_CSI2_CPHY_LNRD_FSM             0x1AB4
> +#define SENINF2_FIX_ADDR_CPHY0_DBG0            0x1AB8
> +#define SENINF2_FIX_ADDR_CPHY0_DBG1            0x1ABC
> +#define SENINF2_FIX_ADDR_CPHY0_DBG2            0x1AC0
> +#define SENINF2_FIX_ADDR_CPHY1_DBG0            0x1AC4
> +#define SENINF2_FIX_ADDR_CPHY1_DBG1            0x1AC8
> +#define SENINF2_FIX_ADDR_CPHY1_DBG2            0x1ACC
> +#define SENINF2_FIX_ADDR_CPHY2_DBG0            0x1AD0
> +#define SENINF2_FIX_ADDR_CPHY2_DBG1            0x1AD4
> +#define SENINF2_FIX_ADDR_CPHY2_DBG2            0x1AD8
> +#define SENINF2_FIX_ADDR_DBG0                  0x1ADC
> +#define SENINF2_FIX_ADDR_DBG1                  0x1AE0
> +#define SENINF2_FIX_ADDR_DBG2                  0x1AE4
> +#define SENINF2_CSI2_MODE                      0x1AE8
> +#define rsv_1AEC                               0x1AEC
> +#define SENINF2_CSI2_DI_EXT                    0x1AF0
> +#define SENINF2_CSI2_DI_CTRL_EXT               0x1AF4
> +#define SENINF2_CSI2_CPHY_LOOPBACK             0x1AF8
> +#define rsv_1AFC                               0x1AFC
> +#define SENINF2_CSI2_PROGSEQ_0                 0x1B00
> +#define SENINF2_CSI2_PROGSEQ_1                 0x1B04
> +#define rsv_1B08_2                             0x1B08
> +#define SENINF2_CSI2_INT_EN_EXT                0x1B10
> +#define SENINF2_CSI2_INT_STATUS_EXT            0x1B14
> +#define SENINF2_CSI2_CPHY_FIX_POINT_RST        0x1B18
> +#define SENINF2_CSI2_RLR3_CON0                 0x1B1C
> +#define SENINF2_CSI2_DPHY_SYNC                 0x1B20
> +#define SENINF2_CSI2_DESKEW_SYNC               0x1B24
> +#define SENINF2_CSI2_DETECT_DBG2               0x1B28
> +#define rsv_1B2C                               0x1B2C
> +#define SENINF2_FIX_ADDR_CPHY3_DBG0            0x1B30
> +#define SENINF2_FIX_ADDR_CPHY3_DBG1            0x1B34
> +#define SENINF2_FIX_ADDR_CPHY3_DBG2            0x1B38
> +#define SENINF2_CSI2_DI_EXT_2                  0x1B3C
> +#define SENINF2_CSI2_DI_CTRL_EXT_2             0x1B40
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG0   0x1B44
> +#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG1   0x1B48
> +#define rsv_1B4C_109                           0x1B4C
> +#define SENINF2_MUX_CTRL                       0x1D00
> +#define SENINF2_MUX_INTEN                      0x1D04
> +#define SENINF2_MUX_INTSTA                     0x1D08
> +#define SENINF2_MUX_SIZE                       0x1D0C
> +#define SENINF2_MUX_DEBUG_1                    0x1D10
> +#define SENINF2_MUX_DEBUG_2                    0x1D14
> +#define SENINF2_MUX_DEBUG_3                    0x1D18
> +#define SENINF2_MUX_DEBUG_4                    0x1D1C
> +#define SENINF2_MUX_DEBUG_5                    0x1D20
> +#define SENINF2_MUX_DEBUG_6                    0x1D24
> +#define SENINF2_MUX_DEBUG_7                    0x1D28
> +#define SENINF2_MUX_SPARE                      0x1D2C
> +#define SENINF2_MUX_DATA                       0x1D30
> +#define SENINF2_MUX_DATA_CNT                   0x1D34
> +#define SENINF2_MUX_CROP                       0x1D38
> +#define SENINF2_MUX_CTRL_EXT                   0x1D3C
> +#define rsv_1D40_304                           0x1D40
> +#define SENINF3_CTRL                           0x2200
> +#define SENINF3_CTRL_EXT                       0x2204
> +#define SENINF3_ASYNC_CTRL                     0x2208
> +#define rsv_220C_253                           0x220C
> +#define SENINF_TG3_PH_CNT                      0x2600
> +#define SENINF_TG3_SEN_CK                      0x2604
> +#define SENINF_TG3_TM_CTL                      0x2608
> +#define SENINF_TG3_TM_SIZE                     0x260C
> +#define SENINF_TG3_TM_CLK                      0x2610
> +#define SENINF_TG3_TM_STP                      0x2614
> +#define rsv_2618_131                           0x2618
> +#define MIPI_RX_CON24_CSI2                     0x2824
> +#define MIPI_RX_CON28_CSI2                     0x2828
> +#define rsv_282C_2                             0x282C
> +#define MIPI_RX_CON34_CSI2                     0x2834
> +#define MIPI_RX_CON38_CSI2                     0x2838
> +#define MIPI_RX_CON3C_CSI2                     0x283C
> +#define rsv_2840_15                            0x2840
> +#define MIPI_RX_CON7C_CSI2                     0x287C
> +#define MIPI_RX_CON80_CSI2                     0x2880
> +#define MIPI_RX_CON84_CSI2                     0x2884
> +#define MIPI_RX_CON88_CSI2                     0x2888
> +#define MIPI_RX_CON8C_CSI2                     0x288C
> +#define MIPI_RX_CON90_CSI2                     0x2890
> +#define MIPI_RX_CON94_CSI2                     0x2894
> +#define MIPI_RX_CON98_CSI2                     0x2898
> +#define rsv_289C                               0x289C
> +#define MIPI_RX_CONA0_CSI2                     0x28A0
> +#define rsv_28A4_3                             0x28A4
> +#define MIPI_RX_CONB0_CSI2                     0x28B0
> +#define MIPI_RX_CONB4_CSI2                     0x28B4
> +#define MIPI_RX_CONB8_CSI2                     0x28B8
> +#define MIPI_RX_CONBC_CSI2                     0x28BC
> +#define MIPI_RX_CONC0_CSI2                     0x28C0
> +#define MIPI_RX_CONC4_CSI2                     0x28C4
> +#define MIPI_RX_CONC8_CSI2                     0x28C8
> +#define MIPI_RX_CONCC_CSI2                     0x28CC
> +#define MIPI_RX_COND0_CSI2                     0x28D0
> +#define rsv_28D4_75                            0x28D4
> +#define SENINF3_CSI2_CTL                       0x2A00
> +#define SENINF3_CSI2_LNRC_TIMING               0x2A04
> +#define SENINF3_CSI2_LNRD_TIMING               0x2A08
> +#define SENINF3_CSI2_DPCM                      0x2A0C
> +#define SENINF3_CSI2_INT_EN                    0x2A10
> +#define SENINF3_CSI2_INT_STATUS                0x2A14
> +#define SENINF3_CSI2_DGB_SEL                   0x2A18
> +#define SENINF3_CSI2_DBG_PORT                  0x2A1C
> +#define SENINF3_CSI2_SPARE0                    0x2A20
> +#define SENINF3_CSI2_SPARE1                    0x2A24
> +#define SENINF3_CSI2_LNRC_FSM                  0x2A28
> +#define SENINF3_CSI2_LNRD_FSM                  0x2A2C
> +#define SENINF3_CSI2_FRAME_LINE_NUM            0x2A30
> +#define SENINF3_CSI2_GENERIC_SHORT             0x2A34
> +#define SENINF3_CSI2_HSRX_DBG                  0x2A38
> +#define SENINF3_CSI2_DI                        0x2A3C
> +#define SENINF3_CSI2_HS_TRAIL                  0x2A40
> +#define SENINF3_CSI2_DI_CTRL                   0x2A44
> +#define rsv_2A48                               0x2A48
> +#define SENINF3_CSI2_DETECT_CON1               0x2A4C
> +#define SENINF3_CSI2_DETECT_CON2               0x2A50
> +#define SENINF3_CSI2_DETECT_CON3               0x2A54
> +#define SENINF3_CSI2_RLR0_CON0                 0x2A58
> +#define SENINF3_CSI2_RLR1_CON0                 0x2A5C
> +#define SENINF3_CSI2_RLR2_CON0                 0x2A60
> +#define SENINF3_CSI2_RLR_CON0                  0x2A64
> +#define SENINF3_CSI2_MUX_CON                   0x2A68
> +#define SENINF3_CSI2_DETECT_DBG0               0x2A6C
> +#define SENINF3_CSI2_DETECT_DBG1               0x2A70
> +#define SENINF3_CSI2_RESYNC_MERGE_CTL          0x2A74
> +#define SENINF3_CSI2_CTRL_TRIO_MUX             0x2A78
> +#define SENINF3_CSI2_CTRL_TRIO_CON             0x2A7C
> +#define SENINF3_FIX_ADDR_CPHY0_DBG             0x2A80
> +#define SENINF3_FIX_ADDR_CPHY1_DBG             0x2A84
> +#define SENINF3_FIX_ADDR_CPHY2_DBG             0x2A88
> +#define SENINF3_FIX_ADDR_DBG                   0x2A8C
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG0   0x2A90
> +#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG1   0x2A94
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG0   0x2A98
> +#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG1   0x2A9C
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG0   0x2AA0
> +#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG1   0x2AA4
> +#define SENINF3_SYNC_RESYNC_CTL                0x2AA8
> +#define SENINF3_POST_DETECT_CTL                0x2AAC
> +#define SENINF3_WIRE_STATE_DECODE_CONFIG       0x2AB0
> +#define SENINF3_CSI2_CPHY_LNRD_FSM             0x2AB4
> +#define SENINF3_FIX_ADDR_CPHY0_DBG0            0x2AB8
> +#define SENINF3_FIX_ADDR_CPHY0_DBG1            0x2ABC
> +#define SENINF3_FIX_ADDR_CPHY0_DBG2            0x2AC0
> +#define SENINF3_FIX_ADDR_CPHY1_DBG0            0x2AC4
> +#define SENINF3_FIX_ADDR_CPHY1_DBG1            0x2AC8
> +#define SENINF3_FIX_ADDR_CPHY1_DBG2            0x2ACC
> +#define SENINF3_FIX_ADDR_CPHY2_DBG0            0x2AD0
> +#define SENINF3_FIX_ADDR_CPHY2_DBG1            0x2AD4
> +#define SENINF3_FIX_ADDR_CPHY2_DBG2            0x2AD8
> +#define SENINF3_FIX_ADDR_DBG0                  0x2ADC
> +#define SENINF3_FIX_ADDR_DBG1                  0x2AE0
> +#define SENINF3_FIX_ADDR_DBG2                  0x2AE4
> +#define SENINF3_CSI2_MODE                      0x2AE8
> +#define rsv_2AEC                               0x2AEC
> +#define SENINF3_CSI2_DI_EXT                    0x2AF0
> +#define SENINF3_CSI2_DI_CTRL_EXT               0x2AF4
> +#define SENINF3_CSI2_CPHY_LOOPBACK             0x2AF8
> +#define rsv_2AFC                               0x2AFC
> +#define SENINF3_CSI2_PROGSEQ_0                 0x2B00
> +#define SENINF3_CSI2_PROGSEQ_1                 0x2B04
> +#define rsv_2B08_2                             0x2B08
> +#define SENINF3_CSI2_INT_EN_EXT                0x2B10
> +#define SENINF3_CSI2_INT_STATUS_EXT            0x2B14
> +#define SENINF3_CSI2_CPHY_FIX_POINT_RST        0x2B18
> +#define SENINF3_CSI2_RLR3_CON0                 0x2B1C
> +#define SENINF3_CSI2_DPHY_SYNC                 0x2B20
> +#define SENINF3_CSI2_DESKEW_SYNC               0x2B24
> +#define SENINF3_CSI2_DETECT_DBG2               0x2B28
> +#define rsv_2B2C                               0x2B2C
> +#define SENINF3_FIX_ADDR_CPHY3_DBG0            0x2B30
> +#define SENINF3_FIX_ADDR_CPHY3_DBG1            0x2B34
> +#define SENINF3_FIX_ADDR_CPHY3_DBG2            0x2B38
> +#define SENINF3_CSI2_DI_EXT_2                  0x2B3C
> +#define SENINF3_CSI2_DI_CTRL_EXT_2             0x2B40
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG0   0x2B44
> +#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG1   0x2B48
> +#define rsv_2B4C_109                           0x2B4C
> +#define SENINF3_MUX_CTRL                       0x2D00
> +#define SENINF3_MUX_INTEN                      0x2D04
> +#define SENINF3_MUX_INTSTA                     0x2D08
> +#define SENINF3_MUX_SIZE                       0x2D0C
> +#define SENINF3_MUX_DEBUG_1                    0x2D10
> +#define SENINF3_MUX_DEBUG_2                    0x2D14
> +#define SENINF3_MUX_DEBUG_3                    0x2D18
> +#define SENINF3_MUX_DEBUG_4                    0x2D1C
> +#define SENINF3_MUX_DEBUG_5                    0x2D20
> +#define SENINF3_MUX_DEBUG_6                    0x2D24
> +#define SENINF3_MUX_DEBUG_7                    0x2D28
> +#define SENINF3_MUX_SPARE                      0x2D2C
> +#define SENINF3_MUX_DATA                       0x2D30
> +#define SENINF3_MUX_DATA_CNT                   0x2D34
> +#define SENINF3_MUX_CROP                       0x2D38
> +#define SENINF3_MUX_CTRL_EXT                   0x2D3C
> +#define rsv_2D40_304                           0x2D40
> +#define SENINF4_CTRL                           0x3200
> +#define SENINF4_CTRL_EXT                       0x3204
> +#define SENINF4_ASYNC_CTRL                     0x3208
> +#define rsv_320C_253                           0x320C
> +#define SENINF_TG4_PH_CNT                      0x3600
> +#define SENINF_TG4_SEN_CK                      0x3604
> +#define SENINF_TG4_TM_CTL                      0x3608
> +#define SENINF_TG4_TM_SIZE                     0x360C
> +#define SENINF_TG4_TM_CLK                      0x3610
> +#define SENINF_TG4_TM_STP                      0x3614
> +#define rsv_3618_131                           0x3618
> +#define MIPI_RX_CON24_CSI3                     0x3824
> +#define MIPI_RX_CON28_CSI3                     0x3828
> +#define rsv_382C_2                             0x382C
> +#define MIPI_RX_CON34_CSI3                     0x3834
> +#define MIPI_RX_CON38_CSI3                     0x3838
> +#define MIPI_RX_CON3C_CSI3                     0x383C
> +#define rsv_3840_15                            0x3840
> +#define MIPI_RX_CON7C_CSI3                     0x387C
> +#define MIPI_RX_CON80_CSI3                     0x3880
> +#define MIPI_RX_CON84_CSI3                     0x3884
> +#define MIPI_RX_CON88_CSI3                     0x3888
> +#define MIPI_RX_CON8C_CSI3                     0x388C
> +#define MIPI_RX_CON90_CSI3                     0x3890
> +#define MIPI_RX_CON94_CSI3                     0x3894
> +#define MIPI_RX_CON98_CSI3                     0x3898
> +#define rsv_389C                               0x389C
> +#define MIPI_RX_CONA0_CSI3                     0x38A0
> +#define rsv_38A4_3                             0x38A4
> +#define MIPI_RX_CONB0_CSI3                     0x38B0
> +#define MIPI_RX_CONB4_CSI3                     0x38B4
> +#define MIPI_RX_CONB8_CSI3                     0x38B8
> +#define MIPI_RX_CONBC_CSI3                     0x38BC
> +#define MIPI_RX_CONC0_CSI3                     0x38C0
> +#define MIPI_RX_CONC4_CSI3                     0x38C4
> +#define MIPI_RX_CONC8_CSI3                     0x38C8
> +#define MIPI_RX_CONCC_CSI3                     0x38CC
> +#define MIPI_RX_COND0_CSI3                     0x38D0
> +#define rsv_38D4_75                            0x38D4
> +#define SENINF4_CSI2_CTL                       0x3A00
> +#define SENINF4_CSI2_LNRC_TIMING               0x3A04
> +#define SENINF4_CSI2_LNRD_TIMING               0x3A08
> +#define SENINF4_CSI2_DPCM                      0x3A0C
> +#define SENINF4_CSI2_INT_EN                    0x3A10
> +#define SENINF4_CSI2_INT_STATUS                0x3A14
> +#define SENINF4_CSI2_DGB_SEL                   0x3A18
> +#define SENINF4_CSI2_DBG_PORT                  0x3A1C
> +#define SENINF4_CSI2_SPARE0                    0x3A20
> +#define SENINF4_CSI2_SPARE1                    0x3A24
> +#define SENINF4_CSI2_LNRC_FSM                  0x3A28
> +#define SENINF4_CSI2_LNRD_FSM                  0x3A2C
> +#define SENINF4_CSI2_FRAME_LINE_NUM            0x3A30
> +#define SENINF4_CSI2_GENERIC_SHORT             0x3A34
> +#define SENINF4_CSI2_HSRX_DBG                  0x3A38
> +#define SENINF4_CSI2_DI                        0x3A3C
> +#define SENINF4_CSI2_HS_TRAIL                  0x3A40
> +#define SENINF4_CSI2_DI_CTRL                   0x3A44
> +#define rsv_3A48                               0x3A48
> +#define SENINF4_CSI2_DETECT_CON1               0x3A4C
> +#define SENINF4_CSI2_DETECT_CON2               0x3A50
> +#define SENINF4_CSI2_DETECT_CON3               0x3A54
> +#define SENINF4_CSI2_RLR0_CON0                 0x3A58
> +#define SENINF4_CSI2_RLR1_CON0                 0x3A5C
> +#define SENINF4_CSI2_RLR2_CON0                 0x3A60
> +#define SENINF4_CSI2_RLR_CON0                  0x3A64
> +#define SENINF4_CSI2_MUX_CON                   0x3A68
> +#define SENINF4_CSI2_DETECT_DBG0               0x3A6C
> +#define SENINF4_CSI2_DETECT_DBG1               0x3A70
> +#define SENINF4_CSI2_RESYNC_MERGE_CTL          0x3A74
> +#define SENINF4_CSI2_CTRL_TRIO_MUX             0x3A78
> +#define SENINF4_CSI2_CTRL_TRIO_CON             0x3A7C
> +#define SENINF4_FIX_ADDR_CPHY0_DBG             0x3A80
> +#define SENINF4_FIX_ADDR_CPHY1_DBG             0x3A84
> +#define SENINF4_FIX_ADDR_CPHY2_DBG             0x3A88
> +#define SENINF4_FIX_ADDR_DBG                   0x3A8C
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG0   0x3A90
> +#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG1   0x3A94
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG0   0x3A98
> +#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG1   0x3A9C
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG0   0x3AA0
> +#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG1   0x3AA4
> +#define SENINF4_SYNC_RESYNC_CTL                0x3AA8
> +#define SENINF4_POST_DETECT_CTL                0x3AAC
> +#define SENINF4_WIRE_STATE_DECODE_CONFIG       0x3AB0
> +#define SENINF4_CSI2_CPHY_LNRD_FSM             0x3AB4
> +#define SENINF4_FIX_ADDR_CPHY0_DBG0            0x3AB8
> +#define SENINF4_FIX_ADDR_CPHY0_DBG1            0x3ABC
> +#define SENINF4_FIX_ADDR_CPHY0_DBG2            0x3AC0
> +#define SENINF4_FIX_ADDR_CPHY1_DBG0            0x3AC4
> +#define SENINF4_FIX_ADDR_CPHY1_DBG1            0x3AC8
> +#define SENINF4_FIX_ADDR_CPHY1_DBG2            0x3ACC
> +#define SENINF4_FIX_ADDR_CPHY2_DBG0            0x3AD0
> +#define SENINF4_FIX_ADDR_CPHY2_DBG1            0x3AD4
> +#define SENINF4_FIX_ADDR_CPHY2_DBG2            0x3AD8
> +#define SENINF4_FIX_ADDR_DBG0                  0x3ADC
> +#define SENINF4_FIX_ADDR_DBG1                  0x3AE0
> +#define SENINF4_FIX_ADDR_DBG2                  0x3AE4
> +#define SENINF4_CSI2_MODE                      0x3AE8
> +#define rsv_3AEC                               0x3AEC
> +#define SENINF4_CSI2_DI_EXT                    0x3AF0
> +#define SENINF4_CSI2_DI_CTRL_EXT               0x3AF4
> +#define SENINF4_CSI2_CPHY_LOOPBACK             0x3AF8
> +#define rsv_3AFC                               0x3AFC
> +#define SENINF4_CSI2_PROGSEQ_0                 0x3B00
> +#define SENINF4_CSI2_PROGSEQ_1                 0x3B04
> +#define rsv_3B08_2                             0x3B08
> +#define SENINF4_CSI2_INT_EN_EXT                0x3B10
> +#define SENINF4_CSI2_INT_STATUS_EXT            0x3B14
> +#define SENINF4_CSI2_CPHY_FIX_POINT_RST        0x3B18
> +#define SENINF4_CSI2_RLR3_CON0                 0x3B1C
> +#define SENINF4_CSI2_DPHY_SYNC                 0x3B20
> +#define SENINF4_CSI2_DESKEW_SYNC               0x3B24
> +#define SENINF4_CSI2_DETECT_DBG2               0x3B28
> +#define rsv_3B2C                               0x3B2C
> +#define SENINF4_FIX_ADDR_CPHY3_DBG0            0x3B30
> +#define SENINF4_FIX_ADDR_CPHY3_DBG1            0x3B34
> +#define SENINF4_FIX_ADDR_CPHY3_DBG2            0x3B38
> +#define SENINF4_CSI2_DI_EXT_2                  0x3B3C
> +#define SENINF4_CSI2_DI_CTRL_EXT_2             0x3B40
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG0   0x3B44
> +#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG1   0x3B48
> +#define rsv_3B4C_109                           0x3B4C
> +#define SENINF4_MUX_CTRL                       0x3D00
> +#define SENINF4_MUX_INTEN                      0x3D04
> +#define SENINF4_MUX_INTSTA                     0x3D08
> +#define SENINF4_MUX_SIZE                       0x3D0C
> +#define SENINF4_MUX_DEBUG_1                    0x3D10
> +#define SENINF4_MUX_DEBUG_2                    0x3D14
> +#define SENINF4_MUX_DEBUG_3                    0x3D18
> +#define SENINF4_MUX_DEBUG_4                    0x3D1C
> +#define SENINF4_MUX_DEBUG_5                    0x3D20
> +#define SENINF4_MUX_DEBUG_6                    0x3D24
> +#define SENINF4_MUX_DEBUG_7                    0x3D28
> +#define SENINF4_MUX_SPARE                      0x3D2C
> +#define SENINF4_MUX_DATA                       0x3D30
> +#define SENINF4_MUX_DATA_CNT                   0x3D34
> +#define SENINF4_MUX_CROP                       0x3D38
> +#define SENINF4_MUX_CTRL_EXT                   0x3D3C
> +#define rsv_3D40_304                           0x3D40
> +#define SENINF5_CTRL                           0x4200
> +#define SENINF5_CTRL_EXT                       0x4204
> +#define SENINF5_ASYNC_CTRL                     0x4208
> +#define rsv_420C_253                           0x420C
> +#define SENINF_TG5_PH_CNT                      0x4600
> +#define SENINF_TG5_SEN_CK                      0x4604
> +#define SENINF_TG5_TM_CTL                      0x4608
> +#define SENINF_TG5_TM_SIZE                     0x460C
> +#define SENINF_TG5_TM_CLK                      0x4610
> +#define SENINF_TG5_TM_STP                      0x4614
> +#define rsv_4618_131                           0x4618
> +#define MIPI_RX_CON24_CSI4                     0x4824
> +#define MIPI_RX_CON28_CSI4                     0x4828
> +#define rsv_482C_2                             0x482C
> +#define MIPI_RX_CON34_CSI4                     0x4834
> +#define MIPI_RX_CON38_CSI4                     0x4838
> +#define MIPI_RX_CON3C_CSI4                     0x483C
> +#define rsv_4840_15                            0x4840
> +#define MIPI_RX_CON7C_CSI4                     0x487C
> +#define MIPI_RX_CON80_CSI4                     0x4880
> +#define MIPI_RX_CON84_CSI4                     0x4884
> +#define MIPI_RX_CON88_CSI4                     0x4888
> +#define MIPI_RX_CON8C_CSI4                     0x488C
> +#define MIPI_RX_CON90_CSI4                     0x4890
> +#define MIPI_RX_CON94_CSI4                     0x4894
> +#define MIPI_RX_CON98_CSI4                     0x4898
> +#define rsv_489C                               0x489C
> +#define MIPI_RX_CONA0_CSI4                     0x48A0
> +#define rsv_48A4_3                             0x48A4
> +#define MIPI_RX_CONB0_CSI4                     0x48B0
> +#define MIPI_RX_CONB4_CSI4                     0x48B4
> +#define MIPI_RX_CONB8_CSI4                     0x48B8
> +#define MIPI_RX_CONBC_CSI4                     0x48BC
> +#define MIPI_RX_CONC0_CSI4                     0x48C0
> +#define MIPI_RX_CONC4_CSI4                     0x48C4
> +#define MIPI_RX_CONC8_CSI4                     0x48C8
> +#define MIPI_RX_CONCC_CSI4                     0x48CC
> +#define MIPI_RX_COND0_CSI4                     0x48D0
> +#define rsv_48D4_75                            0x48D4
> +#define SENINF5_CSI2_CTL                       0x4A00
> +#define SENINF5_CSI2_LNRC_TIMING               0x4A04
> +#define SENINF5_CSI2_LNRD_TIMING               0x4A08
> +#define SENINF5_CSI2_DPCM                      0x4A0C
> +#define SENINF5_CSI2_INT_EN                    0x4A10
> +#define SENINF5_CSI2_INT_STATUS                0x4A14
> +#define SENINF5_CSI2_DGB_SEL                   0x4A18
> +#define SENINF5_CSI2_DBG_PORT                  0x4A1C
> +#define SENINF5_CSI2_SPARE0                    0x4A20
> +#define SENINF5_CSI2_SPARE1                    0x4A24
> +#define SENINF5_CSI2_LNRC_FSM                  0x4A28
> +#define SENINF5_CSI2_LNRD_FSM                  0x4A2C
> +#define SENINF5_CSI2_FRAME_LINE_NUM            0x4A30
> +#define SENINF5_CSI2_GENERIC_SHORT             0x4A34
> +#define SENINF5_CSI2_HSRX_DBG                  0x4A38
> +#define SENINF5_CSI2_DI                        0x4A3C
> +#define SENINF5_CSI2_HS_TRAIL                  0x4A40
> +#define SENINF5_CSI2_DI_CTRL                   0x4A44
> +#define rsv_4A48                               0x4A48
> +#define SENINF5_CSI2_DETECT_CON1               0x4A4C
> +#define SENINF5_CSI2_DETECT_CON2               0x4A50
> +#define SENINF5_CSI2_DETECT_CON3               0x4A54
> +#define SENINF5_CSI2_RLR0_CON0                 0x4A58
> +#define SENINF5_CSI2_RLR1_CON0                 0x4A5C
> +#define SENINF5_CSI2_RLR2_CON0                 0x4A60
> +#define SENINF5_CSI2_RLR_CON0                  0x4A64
> +#define SENINF5_CSI2_MUX_CON                   0x4A68
> +#define SENINF5_CSI2_DETECT_DBG0               0x4A6C
> +#define SENINF5_CSI2_DETECT_DBG1               0x4A70
> +#define SENINF5_CSI2_RESYNC_MERGE_CTL          0x4A74
> +#define SENINF5_CSI2_CTRL_TRIO_MUX             0x4A78
> +#define SENINF5_CSI2_CTRL_TRIO_CON             0x4A7C
> +#define SENINF5_FIX_ADDR_CPHY0_DBG             0x4A80
> +#define SENINF5_FIX_ADDR_CPHY1_DBG             0x4A84
> +#define SENINF5_FIX_ADDR_CPHY2_DBG             0x4A88
> +#define SENINF5_FIX_ADDR_DBG                   0x4A8C
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG0   0x4A90
> +#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG1   0x4A94
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG0   0x4A98
> +#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG1   0x4A9C
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG0   0x4AA0
> +#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG1   0x4AA4
> +#define SENINF5_SYNC_RESYNC_CTL                0x4AA8
> +#define SENINF5_POST_DETECT_CTL                0x4AAC
> +#define SENINF5_WIRE_STATE_DECODE_CONFIG       0x4AB0
> +#define SENINF5_CSI2_CPHY_LNRD_FSM             0x4AB4
> +#define SENINF5_FIX_ADDR_CPHY0_DBG0            0x4AB8
> +#define SENINF5_FIX_ADDR_CPHY0_DBG1            0x4ABC
> +#define SENINF5_FIX_ADDR_CPHY0_DBG2            0x4AC0
> +#define SENINF5_FIX_ADDR_CPHY1_DBG0            0x4AC4
> +#define SENINF5_FIX_ADDR_CPHY1_DBG1            0x4AC8
> +#define SENINF5_FIX_ADDR_CPHY1_DBG2            0x4ACC
> +#define SENINF5_FIX_ADDR_CPHY2_DBG0            0x4AD0
> +#define SENINF5_FIX_ADDR_CPHY2_DBG1            0x4AD4
> +#define SENINF5_FIX_ADDR_CPHY2_DBG2            0x4AD8
> +#define SENINF5_FIX_ADDR_DBG0                  0x4ADC
> +#define SENINF5_FIX_ADDR_DBG1                  0x4AE0
> +#define SENINF5_FIX_ADDR_DBG2                  0x4AE4
> +#define SENINF5_CSI2_MODE                      0x4AE8
> +#define rsv_4AEC                               0x4AEC
> +#define SENINF5_CSI2_DI_EXT                    0x4AF0
> +#define SENINF5_CSI2_DI_CTRL_EXT               0x4AF4
> +#define SENINF5_CSI2_CPHY_LOOPBACK             0x4AF8
> +#define rsv_4AFC                               0x4AFC
> +#define SENINF5_CSI2_PROGSEQ_0                 0x4B00
> +#define SENINF5_CSI2_PROGSEQ_1                 0x4B04
> +#define rsv_4B08_2                             0x4B08
> +#define SENINF5_CSI2_INT_EN_EXT                0x4B10
> +#define SENINF5_CSI2_INT_STATUS_EXT            0x4B14
> +#define SENINF5_CSI2_CPHY_FIX_POINT_RST        0x4B18
> +#define SENINF5_CSI2_RLR3_CON0                 0x4B1C
> +#define SENINF5_CSI2_DPHY_SYNC                 0x4B20
> +#define SENINF5_CSI2_DESKEW_SYNC               0x4B24
> +#define SENINF5_CSI2_DETECT_DBG2               0x4B28
> +#define rsv_4B2C                               0x4B2C
> +#define SENINF5_FIX_ADDR_CPHY3_DBG0            0x4B30
> +#define SENINF5_FIX_ADDR_CPHY3_DBG1            0x4B34
> +#define SENINF5_FIX_ADDR_CPHY3_DBG2            0x4B38
> +#define SENINF5_CSI2_DI_EXT_2                  0x4B3C
> +#define SENINF5_CSI2_DI_CTRL_EXT_2             0x4B40
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG0   0x4B44
> +#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG1   0x4B48
> +#define rsv_4B4C_109                           0x4B4C
> +#define SENINF5_MUX_CTRL                       0x4D00
> +#define SENINF5_MUX_INTEN                      0x4D04
> +#define SENINF5_MUX_INTSTA                     0x4D08
> +#define SENINF5_MUX_SIZE                       0x4D0C
> +#define SENINF5_MUX_DEBUG_1                    0x4D10
> +#define SENINF5_MUX_DEBUG_2                    0x4D14
> +#define SENINF5_MUX_DEBUG_3                    0x4D18
> +#define SENINF5_MUX_DEBUG_4                    0x4D1C
> +#define SENINF5_MUX_DEBUG_5                    0x4D20
> +#define SENINF5_MUX_DEBUG_6                    0x4D24
> +#define SENINF5_MUX_DEBUG_7                    0x4D28
> +#define SENINF5_MUX_SPARE                      0x4D2C
> +#define SENINF5_MUX_DATA                       0x4D30
> +#define SENINF5_MUX_DATA_CNT                   0x4D34
> +#define SENINF5_MUX_CROP                       0x4D38
> +#define SENINF5_MUX_CTRL_EXT                   0x4D3C
> +#define rsv_4D40_1008                          0x4D40
> +#define SENINF6_MUX_CTRL                       0x5D00
> +#define SENINF6_MUX_INTEN                      0x5D04
> +#define SENINF6_MUX_INTSTA                     0x5D08
> +#define SENINF6_MUX_SIZE                       0x5D0C
> +#define SENINF6_MUX_DEBUG_1                    0x5D10
> +#define SENINF6_MUX_DEBUG_2                    0x5D14
> +#define SENINF6_MUX_DEBUG_3                    0x5D18
> +#define SENINF6_MUX_DEBUG_4                    0x5D1C
> +#define SENINF6_MUX_DEBUG_5                    0x5D20
> +#define SENINF6_MUX_DEBUG_6                    0x5D24
> +#define SENINF6_MUX_DEBUG_7                    0x5D28
> +#define SENINF6_MUX_SPARE                      0x5D2C
> +#define SENINF6_MUX_DATA                       0x5D30
> +#define SENINF6_MUX_DATA_CNT                   0x5D34
> +#define SENINF6_MUX_CROP                       0x5D38
> +#define SENINF6_MUX_CTRL_EXT                   0x5D3C
> +#define rsv_5D40_1008                          0x5D40
> +#define SENINF7_MUX_CTRL                       0x6D00
> +#define SENINF7_MUX_INTEN                      0x6D04
> +#define SENINF7_MUX_INTSTA                     0x6D08
> +#define SENINF7_MUX_SIZE                       0x6D0C
> +#define SENINF7_MUX_DEBUG_1                    0x6D10
> +#define SENINF7_MUX_DEBUG_2                    0x6D14
> +#define SENINF7_MUX_DEBUG_3                    0x6D18
> +#define SENINF7_MUX_DEBUG_4                    0x6D1C
> +#define SENINF7_MUX_DEBUG_5                    0x6D20
> +#define SENINF7_MUX_DEBUG_6                    0x6D24
> +#define SENINF7_MUX_DEBUG_7                    0x6D28
> +#define SENINF7_MUX_SPARE                      0x6D2C
> +#define SENINF7_MUX_DATA                       0x6D30
> +#define SENINF7_MUX_DATA_CNT                   0x6D34
> +#define SENINF7_MUX_CROP                       0x6D38
> +#define SENINF7_MUX_CTRL_EXT                   0x6D3C
> +#define rsv_6D40_1008                          0x6D40
> +#define SENINF8_MUX_CTRL                       0x7D00
> +#define SENINF8_MUX_INTEN                      0x7D04
> +#define SENINF8_MUX_INTSTA                     0x7D08
> +#define SENINF8_MUX_SIZE                       0x7D0C
> +#define SENINF8_MUX_DEBUG_1                    0x7D10
> +#define SENINF8_MUX_DEBUG_2                    0x7D14
> +#define SENINF8_MUX_DEBUG_3                    0x7D18
> +#define SENINF8_MUX_DEBUG_4                    0x7D1C
> +#define SENINF8_MUX_DEBUG_5                    0x7D20
> +#define SENINF8_MUX_DEBUG_6                    0x7D24
> +#define SENINF8_MUX_DEBUG_7                    0x7D28
> +#define SENINF8_MUX_SPARE                      0x7D2C
> +#define SENINF8_MUX_DATA                       0x7D30
> +#define SENINF8_MUX_DATA_CNT                   0x7D34
> +#define SENINF8_MUX_CROP                       0x7D38
> +#define SENINF8_MUX_CTRL_EXT                   0x7D3C
> +#define rsv_7D40_20                            0x7D40

It would be nice to have more documentation for these.

> +
> +#endif /* _SENINF_REG_H_ */
