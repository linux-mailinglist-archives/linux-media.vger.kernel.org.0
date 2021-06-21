Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8890B3AE2E5
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 07:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhFUFzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 01:55:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:57072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229837AbhFUFzq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 01:55:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 765176113C;
        Mon, 21 Jun 2021 05:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624254813;
        bh=oHn9vLyQFjLL+PNJb+s571o2xnhvwHG0yilY6LZWmuY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s9r0J2xjgaLq+fczzvS8DtDEeme7Ha3Fw9HLlOg161bMu4q1spEHDobAIsb5e89ze
         kZnxbBpWPhytimCG73bAWkM2zLn5SZhm5VSW9K9O0ogIQnSzeFRZy1IYRgD+1c8Q9B
         fMwH5HN92wNsBBEAGlQCdzaMRgW4Ju2mbm/pF3IMyr8ENAIZ+4OXxY48k5pi61FBON
         HpxP0Tw+7cNYlQq4oOrHrt/DdmMgxDY0Z4ijt2iF+GDeIIX9itSlS8YTxSBIUmVSb8
         kdR/lpVr3Hh29i0R50/uRhWTDSEkPXTyohdGoaXdr8Ad7TlE0SCYaDqta/fkdKB910
         mYN8SNxdLFIRA==
Date:   Mon, 21 Jun 2021 11:23:29 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Nelson Costa <Nelson.Costa@synopsys.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH 5/9] phy: dwc: Add Synopsys DesignWare HDMI RX PHYs e405
 and e406 Driver
Message-ID: <YNApWS7tNGdWbyCm@vkoul-mobl>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
 <ac32f8d433860c5be612b393023329f967e2c058.1622631488.git.nelson.costa@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac32f8d433860c5be612b393023329f967e2c058.1622631488.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02-06-21, 13:24, Nelson Costa wrote:

> +# Makefile for the PHY drivers.
> +#
> +
> +phy-dw-hdmi-e40x-y			:= phy-dw-hdmi-e40x-core.o
> +phy-dw-hdmi-e40x-y			+= phy-dw-hdmi-e405.o
> +phy-dw-hdmi-e40x-y			+= phy-dw-hdmi-e406.o

why not:
phy-dw-hdmi-e40x-y                   :=  phy-dw-hdmi-e40x-core.o phy-dw-hdmi-e405.o phy-dw-hdmi-e406.o ?

> +obj-$(CONFIG_VIDEO_DWC_HDMI_PHY_E40X)	+= phy-dw-hdmi-e40x.o
> diff --git a/drivers/phy/dwc/phy-dw-hdmi-e405.c b/drivers/phy/dwc/phy-dw-hdmi-e405.c
> new file mode 100644
> index 0000000..5078a86
> --- /dev/null
> +++ b/drivers/phy/dwc/phy-dw-hdmi-e405.c
> @@ -0,0 +1,497 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 - present Synopsys, Inc. and/or its affiliates.
> + * Synopsys DesignWare HDMI PHY e405

2018 - 2021 ?

> +/* PHY e405 mpll configuration */
> +static const struct dw_phy_mpll_config dw_phy_e405_mpll_cfg[] = {
> +	{ 0x27, 0x1B94 },

Lowercase please

> +	{ 0x28, 0x16D2 },
> +	{ 0x29, 0x12D9 },
> +	{ 0x2A, 0x3249 },
> +	{ 0x2B, 0x3653 },
> +	{ 0x2C, 0x3436 },
> +	{ 0x2D, 0x124D },
> +	{ 0x2E, 0x0001 },
> +	{ 0xCE, 0x0505 },
> +	{ 0xCF, 0x0505 },
> +	{ 0xD0, 0x0000 },
> +	{ 0x00, 0x0000 },
> +};
> +
> +/* PHY e405 equalization functions */
> +static int dw_phy_eq_test(struct dw_phy_dev *dw_dev,
> +			  u16 *fat_bit_mask, int *min_max_length)

Please align this to preceding line open brace (checkpatch with --strict would warn you about this)

> +{
> +	u16 main_fsm_status, val;
> +	unsigned int i;
> +
> +	for (i = 0; i < DW_PHY_EQ_WAIT_TIME_START; i++) {
> +		main_fsm_status = dw_phy_read(dw_dev, DW_PHY_MAINFSM_STATUS1);
> +		if (main_fsm_status & DW_PHY_CLOCK_STABLE)
> +			break;
> +		mdelay(DW_PHY_EQ_SLEEP_TIME_CDR);
> +	}
> +
> +	if (i == DW_PHY_EQ_WAIT_TIME_START) {
> +		dev_dbg(dw_dev->dev, "PHY start conditions not achieved\n");

not error?

> +		return -ETIMEDOUT;
> +	}
> +
> +	if (main_fsm_status & DW_PHY_PLL_RATE_BIT1) {
> +		dev_dbg(dw_dev->dev, "invalid pll rate\n");

error?

> +		return -EINVAL;
> +	}
> +
> +	val = dw_phy_read(dw_dev, DW_PHY_CDR_CTRL_CNT) &
> +		DW_PHY_HDMI_MHL_MODE_MASK;

can be single line

> +static void dw_phy_eq_init_vars(struct dw_phy_eq_ch *ch)
> +{
> +	ch->acc = 0;
> +	ch->acq = 0;
> +	ch->last_acq = 0;
> +	ch->valid_long_setting = 0;
> +	ch->valid_short_setting = 0;

memset() ?

> +static bool dw_phy_eq_acquire_early_cnt(struct dw_phy_dev *dw_dev,
> +					u16 setting, u16 acq,
> +					struct dw_phy_eq_ch *ch0,
> +					struct dw_phy_eq_ch *ch1,
> +					struct dw_phy_eq_ch *ch2)
> +{
> +	u16 lock_vector = 0x1 << setting;
> +	unsigned int i;
> +
> +	ch0->out_bound_acq = 0;
> +	ch1->out_bound_acq = 0;
> +	ch2->out_bound_acq = 0;
> +	ch0->acq = 0;
> +	ch1->acq = 0;
> +	ch2->acq = 0;
> +
> +	dw_phy_eq_equal_setting(dw_dev, lock_vector);
> +	dw_phy_eq_auto_calib(dw_dev);
> +
> +	mdelay(DW_PHY_EQ_SLEEP_TIME_CDR);
> +	if (!dw_phy_tmds_valid(dw_dev))
> +		dev_dbg(dw_dev->dev, "TMDS is NOT valid\n");
> +
> +	ch0->read_acq = dw_phy_read(dw_dev, DW_PHY_CH0_EQ_STATUS3);
> +	ch1->read_acq = dw_phy_read(dw_dev, DW_PHY_CH1_EQ_STATUS3);
> +	ch2->read_acq = dw_phy_read(dw_dev, DW_PHY_CH2_EQ_STATUS3);
> +
> +	ch0->acq += ch0->read_acq;
> +	ch1->acq += ch1->read_acq;
> +	ch2->acq += ch2->read_acq;
> +
> +	ch0->upper_bound_acq = ch0->read_acq + DW_PHY_EQ_BOUNDSPREAD;
> +	ch0->lower_bound_acq = ch0->read_acq - DW_PHY_EQ_BOUNDSPREAD;
> +	ch1->upper_bound_acq = ch1->read_acq + DW_PHY_EQ_BOUNDSPREAD;
> +	ch1->lower_bound_acq = ch1->read_acq - DW_PHY_EQ_BOUNDSPREAD;
> +	ch2->upper_bound_acq = ch2->read_acq + DW_PHY_EQ_BOUNDSPREAD;
> +	ch2->lower_bound_acq = ch2->read_acq - DW_PHY_EQ_BOUNDSPREAD;
> +
> +	for (i = 1; i < acq; i++) {

why do we start from 1 here..?

> +static const struct dw_phy_mpll_config dw_phy_e406_mpll_cfg[] = {
> +	{ 0x27, 0x1C94 },
> +	{ 0x28, 0x3713 },
> +	{ 0x29, 0x24DA },
> +	{ 0x2A, 0x5492 },
> +	{ 0x2B, 0x4B0D },
> +	{ 0x2C, 0x4760 },
> +	{ 0x2D, 0x008C },
> +	{ 0x2E, 0x0010 },
> +	{ 0x00, 0x0000 },

lower case here too please

> +static void dw_phy_eq_init_vars(struct dw_phy_eq_ch *ch)
> +{
> +	ch->acc = 0;
> +	ch->acq = 0;
> +	ch->last_acq = 0;
> +	ch->valid_long_setting = 0;
> +	ch->valid_short_setting = 0;
> +	ch->best_setting = DW_PHY_EQ_SHORT_CABLE_SETTING;
> +}

duplicate, it would make sense to create a common lib of such functions
and use them across these files

> +static int dw_phy_set_data(struct dw_phy_dev *dw_dev)
> +{
> +	const struct dw_hdmi_phy_data *of_data;
> +
> +	of_data = of_device_get_match_data(dw_dev->dev);
> +
> +	if (of_data) {
> +		dw_dev->phy_data = (struct dw_hdmi_phy_data *)of_data;
> +	} else if (dw_dev->config->version == dw_phy_e405_data.version) {
> +		dw_dev->phy_data = &dw_phy_e405_data;
> +	} else if (dw_dev->config->version == dw_phy_e406_data.version) {
> +		dw_dev->phy_data = &dw_phy_e406_data;

Driver supports only of, where will these else cases get triggered?

-- 
~Vinod
