Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A9E14CF93
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 18:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgA2RXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 12:23:42 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6871 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgA2RXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 12:23:42 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e31bf680000>; Wed, 29 Jan 2020 09:22:49 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 Jan 2020 09:23:39 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 Jan 2020 09:23:39 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jan
 2020 17:23:39 +0000
Subject: Re: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver
 for Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <20200129111340.GF2479935@ulmo>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <070f9a4c-1919-f3f6-fef3-ed0a84cf5776@nvidia.com>
Date:   Wed, 29 Jan 2020 09:23:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200129111340.GF2479935@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580318569; bh=i+qPq/TKLj0q5fJnnAt18nu9gOGsznLZis1BzthEvQA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=UIpl8+o6N0D9zgUb93UePd9TbP9q3xr2gYwn2hPCpkBBEvhzBzwz62nfB4rlNMdTL
         T0gjVTzmrgrR/DwaoJXQY7nwc1B1hiCXsQPhuZTCVcifTC1lFYQp8o1ZbYcH15GtyN
         EaAcsaW5Zieynp+EYROTj5RXfbfKdFjn84lM482ycAb8buvr+tuEvwgYZMlmVYvxKa
         gOpXqsESGDGyTKjYJXRS0y64LVuvWkTCizysrdeEzaTC6yyV3y8W1wi85LqM6dw1VN
         5VpoMz87LmGlXlywto0233tEdMUuZtbYleIsO8In69FZBJUAIaoVsfHsOtPksOl0Zw
         /lkbMD7IzZu6w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/29/20 3:13 AM, Thierry Reding wrote:
> On Tue, Jan 28, 2020 at 10:23:20AM -0800, Sowjanya Komatineni wrote:
>> diff --git a/drivers/staging/media/tegra/csi.h b/drivers/staging/media/tegra/csi.h
> [...]
>> +struct tegra_csi_soc_data {
> I'd just leave out the _data suffix since it's not useful.
>
>> +	const struct tegra_csi_fops *csi_fops;
>> +	unsigned int cil_max_clk_hz;
>> +	unsigned int num_tpg_channels;
>> +};
>> +
>> +/**
>> + * struct tegra_csi_device - NVIDIA Tegra CSI device structure
>> + * @dev: device struct
>> + * @client: host1x_client struct
>> + *
>> + * @iomem: register base
>> + * @csi_clk: clock for CSI
>> + * @cilab_clk: clock for CIL AB
>> + * @cilcd_clk: clock for CIL CD
>> + * @cilef_clk: clock for CIL EF
>> + * @tpg_clk: clock for internal CSI TPG logic
>> + *
>> + * @soc_data: pointer to SoC data structure
>> + * @fops: csi operations
>> + *
>> + * @channels: list of CSI channels
>> + */
>> +struct tegra_csi_device {
>> +	struct device *dev;
>> +	struct host1x_client client;
>> +
>> +	void __iomem *iomem;
>> +	struct clk *csi_clk;
>> +	struct clk *cilab_clk;
>> +	struct clk *cilcd_clk;
>> +	struct clk *cilef_clk;
>> +	struct clk *tpg_clk;
>> +	atomic_t clk_refcnt;
>> +
>> +	const struct tegra_csi_soc_data *soc_data;
> Same here. No need for the _data suffix, it's just an extra 5 characters
> that you have to potentially repeat a lot but doesn't add anything.
>
>> +	const struct tegra_csi_fops *fops;
>> +
>> +	struct list_head csi_chans;
>> +};
>> +
>> +void tegra_csi_error_status(struct v4l2_subdev *subdev);
>> +
>> +#endif
>> diff --git a/drivers/staging/media/tegra/csi2_fops.c b/drivers/staging/media/tegra/csi2_fops.c
>> new file mode 100644
>> index 000000000000..5f2f7bd3ae50
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/csi2_fops.c
>> @@ -0,0 +1,335 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk/tegra.h>
>> +#include <linux/delay.h>
>> +
>> +#include "vi2_registers.h"
>> +#include "mc_common.h"
>> +#include "csi2_fops.h"
>> +#include "csi.h"
>> +
>> +/* CSI block registers offset */
>> +#define TEGRA210_CSI_PORT_OFFSET		0x34
>> +/* CSI CIL parition registers offset */
>> +#define TEGRA210_CSI_CIL_OFFSET			0x0f4
>> +/* CSI TPG registers offset */
>> +#define TEGRA210_CSI_TPG_OFFSET			0x18c
>> +
>> +#define CSI_PP_OFFSET(block)	((block) * 0x800)
>> +
>> +static void csi_write(struct tegra_csi_channel *chan, u8 block,
>> +		      unsigned int addr, u32 val)
>> +{
>> +	void __iomem *csi_pp_base;
>> +
>> +	csi_pp_base = chan->csi->iomem + CSI_PP_OFFSET(block);
>> +	writel(val, csi_pp_base + addr);
>> +}
>> +
>> +/* Pixel parser registers accessors */
>> +static void pp_write(struct tegra_csi_port *port, u32 addr, u32 val)
>> +{
>> +	writel(val, port->pixel_parser + addr);
>> +}
>> +
>> +static u32 pp_read(struct tegra_csi_port *port, u32 addr)
>> +{
>> +	return readl(port->pixel_parser + addr);
>> +}
>> +
>> +/* CSI CIL A/B port registers accessors */
>> +static void cil_write(struct tegra_csi_port *port, u8 port_id,
>> +		      u32 addr, u32 val)
>> +{
>> +	if (port_id & PORT_B)
>> +		writel(val, port->cilb + addr);
>> +	else
>> +		writel(val, port->cila + addr);
>> +}
>> +
>> +static u32 cil_read(struct tegra_csi_port *port, u8 port_id,
>> +		    u32 addr)
>> +{
>> +	if (port_id & PORT_B)
>> +		return readl(port->cilb + addr);
>> +	else
>> +		return readl(port->cila + addr);
>> +}
>> +
>> +/* Test pattern generator registers accessor */
>> +static void tpg_write(struct tegra_csi_port *port, unsigned int addr, u32 val)
>> +{
>> +	writel(val, port->tpg + addr);
>> +}
> These register accessors all look a bit convoluted to me. For example,
> the cil_write()/cil_read() take a port ID in order to select between
> port->cila and port->cilb register banks. But then during ->hw_init()
> you need to go and assign port->cila and port->cilb using a CIL base
> and a port offset from that base.
>
> So it sounds like this could be done much easier by doing something
> like:
>
> 	static u32 cil_read(struct tegra_csi_port *port, u8 port_id, u32 addr)
> 	{
> 		unsigned int offset = port_id * TEGRA210_CSI_PORT_OFFSET;
>
> 		return readl(port->cila + TEGRA210_CSI_CIL_OFFSET + offset);
> 	}
>
> Obviously there'd be no need for port->cilb in that case and port->cila
> could just be port->cil. Furthermore, since you have the prefixes here
> it sounds like these will be different for other generations, so perhaps
> they can be parameterized as part of the SoC-specific structure?
>
> Another thing that I find confusing is that we have a structure called
> tegra_csi_port, but in order to access registers within it we also need
> to pass a port ID. So it sounds like whatever tegra_csi_port represents
> isn't really a port.
>
> Do you have any ideas on how to simplify this? It's not a terribly big
> deal, so feel free to leave it like this for now. I can take a look at
> simplifying later on if it keeps bugging me.

Will update cil_write/read to use cila port and compute for cilb based 
on port id.

in csi2_hw_init, all corresponding PP/CILA/CILB/TPG register base offset 
computation based on CSI port id can all be moved into the corresponding 
pp/cil/csi/tpg_read/write. We can also move framefmt into csi_channel as 
get rid of csi_port.

>> +static int csi2_start_streaming(struct tegra_csi_channel *csi_chan,
>> +				u8 pg_mode, int enable)
>> +{
>> +	struct tegra_csi_device *csi = csi_chan->csi;
>> +	unsigned int port_num = csi_chan->csi_port_num;
>> +	unsigned int block = port_num >> 1;
>> +	struct tegra_csi_port *port = csi_chan->ports;
>> +	unsigned int cil_max_freq = csi->soc_data->cil_max_clk_hz;
>> +	struct clk *cil_clk;
>> +	int ret;
>> +
>> +	if (block == CSI_CIL_AB)
>> +		cil_clk = csi->cilab_clk;
>> +	else if (block == CSI_CIL_CD)
>> +		cil_clk = csi->cilcd_clk;
>> +	else
>> +		cil_clk = csi->cilef_clk;
>> +
>> +	if (enable) {
>> +		ret = clk_set_rate(cil_clk, cil_max_freq);
>> +		if (ret)
>> +			dev_err(csi->dev,
>> +				"failed to set cil clk rate, err: %d\n", ret);
> Perhaps dev_warn() since it's not a fatal error? Also, maybe spell out
> "clock" in error messages (and perhaps s/cil/CIL/). I also personally
> prefer the style of error messages to be:
>
> 	"failed to ...: %d\n"
>
> i.e. without that ", err" in there. We use that style very widely, which
> has the advantage of making the log look very consistent.
Will update
>> +
>> +		/* enable CIL clock on first open */
>> +		if (atomic_add_return(1, &csi->clk_refcnt) == 1) {
>> +			ret = clk_prepare_enable(cil_clk);
>> +			if (ret) {
>> +				dev_err(csi->dev,
>> +					"failed to enable cil clk, err: %d\n",
>> +					ret);
>> +				return ret;
>> +			}
>> +		}
>> +
>> +		/*
>> +		 * On Tegra210, TPG internal logic uses PLLD out along with
>> +		 * the CIL clock.
>> +		 * So, enable TPG clock during TPG mode streaming.
>> +		 */
>> +		if (pg_mode) {
>> +			ret = clk_set_rate(csi->tpg_clk, TEGRA210_TPG_CLOCK);
>> +			if (ret)
>> +				dev_err(csi->dev,
>> +					"failed to set tpg clk rate\n");
>> +
>> +			ret = clk_prepare_enable(csi->tpg_clk);
>> +			if (ret) {
>> +				dev_err(csi->dev,
>> +					"failed to enable tpg clk, err: %d\n",
>> +					ret);
>> +				return ret;
>> +			}
>> +		}
>> +
>> +		csi_write(csi_chan, block, TEGRA_CSI_CLKEN_OVERRIDE, 0);
>> +
>> +		/* clean up status */
>> +		pp_write(port, TEGRA_CSI_PIXEL_PARSER_STATUS, 0xFFFFFFFF);
>> +		cil_write(port, port_num, TEGRA_CSI_CIL_STATUS, 0xFFFFFFFF);
>> +		cil_write(port, port_num, TEGRA_CSI_CILX_STATUS, 0xFFFFFFFF);
>> +		cil_write(port, port_num, TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
>> +
>> +		/* CIL PHY registers setup */
>> +		cil_write(port, port_num, TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
>> +		cil_write(port, port_num, TEGRA_CSI_CIL_PHY_CONTROL, 0xA);
>> +
>> +		/*
>> +		 * The CSI unit provides for connection of up to six cameras in
>> +		 * the system and is organized as three identical instances of
>> +		 * two MIPI support blocks, each with a separate 4-lane
>> +		 * interface that can be configured as a single camera with 4
>> +		 * lanes or as a dual camera with 2 lanes available for each
>> +		 * camera.
>> +		 */
>> +		if (port->lanes == 4) {
>> +			cil_write(port, port_num, TEGRA_CSI_CIL_PAD_CONFIG0,
>> +				  BRICK_CLOCK_A_4X);
>> +
>> +			cil_write(port, (port_num + 1),
> No need for parentheses around "port_num + 1" here and below.
>
>> +				  TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
>> +
>> +			cil_write(port, (port_num + 1),
>> +				  TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
>> +
>> +			cil_write(port, (port_num + 1),
>> +				  TEGRA_CSI_CIL_PHY_CONTROL, 0xA);
>> +
>> +			csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMAND,
>> +				  CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_ENABLE);
>> +		} else {
>> +			u32 val = ((port_num & 1) == PORT_A) ?
>> +				  CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_NOP :
>> +				  CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_NOP;
>> +			csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMAND,
>> +				  val);
>> +		}
>> +
>> +		/* CSI pixel parser registers setup */
>> +		pp_write(port, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +			 (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +			 CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_RST);
>> +		pp_write(port, TEGRA_CSI_PIXEL_PARSER_INTERRUPT_MASK, 0x0);
>> +		pp_write(port, TEGRA_CSI_PIXEL_STREAM_CONTROL0,
>> +			 CSI_PP_PACKET_HEADER_SENT |
>> +			 CSI_PP_DATA_IDENTIFIER_ENABLE |
>> +			 CSI_PP_WORD_COUNT_SELECT_HEADER |
>> +			 CSI_PP_CRC_CHECK_ENABLE |  CSI_PP_WC_CHECK |
>> +			 CSI_PP_OUTPUT_FORMAT_STORE |
>> +			 CSI_PP_HEADER_EC_DISABLE | CSI_PPA_PAD_FRAME_NOPAD |
>> +			 (port_num & 1));
>> +		pp_write(port, TEGRA_CSI_PIXEL_STREAM_CONTROL1,
>> +			 (0x1 << CSI_PP_TOP_FIELD_FRAME_OFFSET) |
>> +			 (0x1 << CSI_PP_TOP_FIELD_FRAME_MASK_OFFSET));
>> +		pp_write(port, TEGRA_CSI_PIXEL_STREAM_GAP,
>> +			 0x14 << PP_FRAME_MIN_GAP_OFFSET);
>> +		pp_write(port, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME, 0x0);
>> +		pp_write(port, TEGRA_CSI_INPUT_STREAM_CONTROL,
>> +			 (0x3f << CSI_SKIP_PACKET_THRESHOLD_OFFSET) |
>> +			 (port->lanes - 1));
>> +
>> +		/* TPG setup */
>> +		if (pg_mode) {
>> +			tpg_write(port, TEGRA_CSI_PATTERN_GENERATOR_CTRL,
>> +				  ((pg_mode - 1) << PG_MODE_OFFSET) |
>> +				  PG_ENABLE);
>> +			tpg_write(port, TEGRA_CSI_PG_PHASE, 0x0);
>> +			tpg_write(port, TEGRA_CSI_PG_RED_FREQ,
>> +				  (0x10 << PG_RED_VERT_INIT_FREQ_OFFSET) |
>> +				  (0x10 << PG_RED_HOR_INIT_FREQ_OFFSET));
>> +			tpg_write(port, TEGRA_CSI_PG_RED_FREQ_RATE, 0x0);
>> +			tpg_write(port, TEGRA_CSI_PG_GREEN_FREQ,
>> +				  (0x10 << PG_GREEN_VERT_INIT_FREQ_OFFSET) |
>> +				  (0x10 << PG_GREEN_HOR_INIT_FREQ_OFFSET));
>> +			tpg_write(port, TEGRA_CSI_PG_GREEN_FREQ_RATE, 0x0);
>> +			tpg_write(port, TEGRA_CSI_PG_BLUE_FREQ,
>> +				  (0x10 << PG_BLUE_VERT_INIT_FREQ_OFFSET) |
>> +				  (0x10 << PG_BLUE_HOR_INIT_FREQ_OFFSET));
>> +			tpg_write(port, TEGRA_CSI_PG_BLUE_FREQ_RATE, 0x0);
>> +		}
>> +
>> +		pp_write(port, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +			 (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +			 CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_ENABLE);
>> +	} else {
>> +		u32 val = pp_read(port, TEGRA_CSI_PIXEL_PARSER_STATUS);
>> +
>> +		dev_dbg(csi->dev, "TEGRA_CSI_PIXEL_PARSER_STATUS 0x%08x\n",
>> +			val);
> Are these still useful? I notice that you don't have debug output for
> the case where enable == true.

Before stopping stream, dumping PP/CIL status register which helps to 
see PP/CIL errors that can occur during the stream.

We don't need this during enable as we start with clearing off all 
errors and any PP/CIL errors happen during the stream gets set till we 
clear them.

>> +
>> +		val = cil_read(port, port_num, TEGRA_CSI_CIL_STATUS);
>> +		dev_dbg(csi->dev, "TEGRA_CSI_CIL_STATUS 0x%08x\n", val);
>> +
>> +		val = cil_read(port, port_num, TEGRA_CSI_CILX_STATUS);
>> +		dev_dbg(csi->dev, "TEGRA_CSI_CILX_STATUS 0x%08x\n", val);
>> +
>> +		pp_write(port, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +			 (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +			 CSI_PP_DISABLE);
>> +
>> +		if (pg_mode) {
>> +			tpg_write(port, TEGRA_CSI_PATTERN_GENERATOR_CTRL,
>> +				  ((pg_mode - 1) << PG_MODE_OFFSET) |
>> +				  PG_DISABLE);
>> +			clk_disable_unprepare(csi->tpg_clk);
>> +		}
>> +
>> +		if (port->lanes == 4) {
>> +			csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMAND,
>> +				  CSI_A_PHY_CIL_DISABLE |
>> +				  CSI_B_PHY_CIL_DISABLE);
>> +
>> +		} else {
>> +			u32 val = ((port_num & 1) == PORT_A) ?
>> +				  CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_NOP :
>> +				  CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
>> +			csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMAND,
>> +				  val);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int csi2_hw_init(struct tegra_csi_device *csi)
>> +{
>> +	struct tegra_csi_channel *csi_chan;
>> +	struct tegra_csi_port *port;
>> +	u8 portno;
>> +	int ret;
>> +
>> +	csi->cilab_clk = devm_clk_get(csi->dev, "cilab");
>> +	if (IS_ERR(csi->cilab_clk)) {
>> +		dev_err(csi->dev, "Failed to get cilab clock\n");
> Maybe output the error code here? The important thing here is to make
> error messages consistent, which can simplify analysis of the kernel log
> later on.
WIll fix all error messages.
>> +		return PTR_ERR(csi->cilab_clk);
>> +	}
>> +
>> +	csi->cilcd_clk = devm_clk_get(csi->dev, "cilcd");
>> +	if (IS_ERR(csi->cilcd_clk)) {
>> +		dev_err(csi->dev, "Failed to get cilcd clock\n");
>> +		return PTR_ERR(csi->cilcd_clk);
>> +	}
>> +
>> +	csi->cilef_clk = devm_clk_get(csi->dev, "cile");
>> +	if (IS_ERR(csi->cilef_clk)) {
>> +		dev_err(csi->dev, "Failed to get cile clock\n");
>> +		return PTR_ERR(csi->cilef_clk);
>> +	}
>> +
>> +	csi->tpg_clk = devm_clk_get(csi->dev, "csi_tpg");
>> +	if (IS_ERR(csi->tpg_clk)) {
>> +		dev_err(csi->dev, "Failed to get csi_tpg clock\n");
>> +		return PTR_ERR(csi->tpg_clk);
>> +	}
>> +
>> +	csi->csi_clk = devm_clk_get(csi->dev, "csi");
>> +	if (IS_ERR(csi->csi_clk)) {
>> +		dev_err(csi->dev, "Failed to get csi clock\n");
>> +		return PTR_ERR(csi->csi_clk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(csi->csi_clk);
>> +	if (ret) {
>> +		dev_err(csi->dev, "Failed to enable csi clk, err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	list_for_each_entry(csi_chan, &csi->csi_chans, list) {
>> +		void __iomem *csi_pp_base;
>> +
>> +		port = csi_chan->ports;
>> +		portno = csi_chan->csi_port_num;
>> +		csi_pp_base = csi->iomem + CSI_PP_OFFSET(portno >> 1);
>> +		port->pixel_parser = csi_pp_base +
>> +				     (portno % CSI_PORTS_PER_BRICK) *
>> +				     TEGRA210_CSI_PORT_OFFSET;
>> +		port->cila = csi_pp_base + TEGRA210_CSI_CIL_OFFSET;
>> +		port->cilb = port->cila + TEGRA210_CSI_PORT_OFFSET;
>> +		port->tpg = port->pixel_parser + TEGRA210_CSI_TPG_OFFSET;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +const struct tegra_csi_fops csi2_fops = {
>> +	.hw_init = csi2_hw_init,
>> +	.csi_start_streaming = csi2_start_streaming,
>> +	.csi_err_status = csi2_error_status,
>> +};
>> +EXPORT_SYMBOL(csi2_fops);
>> diff --git a/drivers/staging/media/tegra/csi2_fops.h b/drivers/staging/media/tegra/csi2_fops.h
>> new file mode 100644
>> index 000000000000..cf22a28ceb1f
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/csi2_fops.h
>> @@ -0,0 +1,15 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __CSI2_H__
>> +#define __CSI2_H__
>> +
>> +#define	TEGRA210_TPG_CLOCK		594000000
>> +#define	TEGRA210_CSI_CIL_CLK_MAX	102000000
>> +#define TEGRA210_CSI_BRICKS_MAX		3
>> +
>> +extern const struct tegra_csi_fops csi2_fops;
>> +
>> +#endif
>> diff --git a/drivers/staging/media/tegra/host1x-video.c b/drivers/staging/media/tegra/host1x-video.c
>> new file mode 100644
>> index 000000000000..740806121e6b
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/host1x-video.c
>> @@ -0,0 +1,120 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/host1x.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "host1x-video.h"
>> +
>> +static int host1x_video_probe(struct host1x_device *dev)
>> +{
>> +	struct tegra_camera *cam;
>> +	int ret;
>> +
>> +	cam = devm_kzalloc(&dev->dev, sizeof(*cam), GFP_KERNEL);
>> +	if (!cam)
>> +		return -ENOMEM;
>> +
>> +	cam->dev = get_device(&dev->dev);
>> +	cam->media_dev.dev = cam->dev;
>> +	strscpy(cam->media_dev.model, "NVIDIA Tegra Video Input Device",
>> +		sizeof(cam->media_dev.model));
>> +	cam->media_dev.hw_revision = 3;
> Where does this come from?
>
>> +
>> +	media_device_init(&cam->media_dev);
>> +	ret = media_device_register(&cam->media_dev);
>> +	if (ret < 0) {
>> +		dev_err(cam->dev, "failed to register media device: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	cam->v4l2_dev.mdev = &cam->media_dev;
>> +	ret = v4l2_device_register(cam->dev, &cam->v4l2_dev);
>> +	if (ret < 0) {
>> +		dev_err(cam->dev, "V4L2 device registration failed: %d\n", ret);
>> +		goto register_error;
>> +	}
>> +
>> +	dev_set_drvdata(&dev->dev, cam);
>> +
>> +	ret = host1x_device_init(dev);
>> +	if (ret < 0)
>> +		goto dev_exit;
>> +
>> +	return 0;
>> +
>> +dev_exit:
>> +	host1x_device_exit(dev);
> There should be no need to call host1x_device_exit() when
> host1x_device_init() failed because the latter already takes care of
> undoing whatever it did already.
>
host1x_device_init can fail if any of its client ops init fails.

So, calling host1x_device_exit here to undo the things done in other 
successful client init ops.

>> +	v4l2_device_unregister(&cam->v4l2_dev);
>> +register_error:
>> +	media_device_unregister(&cam->media_dev);
>> +	media_device_cleanup(&cam->media_dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int host1x_video_remove(struct host1x_device *dev)
>> +{
>> +	struct tegra_camera *cam = dev_get_drvdata(&dev->dev);
>> +
>> +	host1x_device_exit(dev);
>> +	v4l2_device_unregister(&cam->v4l2_dev);
>> +	media_device_unregister(&cam->media_dev);
>> +	media_device_cleanup(&cam->media_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id host1x_video_subdevs[] = {
>> +	{ .compatible = "nvidia,tegra210-csi", },
>> +	{ .compatible = "nvidia,tegra210-vi", },
>> +	{ }
>> +};
>> +
>> +static struct host1x_driver host1x_video_driver = {
>> +	.driver = {
>> +		.name = "host1x_video",
> We typically use - instead of _ in names. This helps making access to
> sysfs or debugfs consistent across drivers.
Will change
>> +	},
>> +	.probe = host1x_video_probe,
>> +	.remove = host1x_video_remove,
>> +	.subdevs = host1x_video_subdevs,
>> +};
>> +
>> +static struct platform_driver * const drivers[] = {
>> +	&tegra_csi_driver,
>> +	&tegra_vi_driver,
>> +};
>> +
>> +static int __init host1x_video_init(void)
>> +{
>> +	int err;
>> +
>> +	err = host1x_driver_register(&host1x_video_driver);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	err = platform_register_drivers(drivers, ARRAY_SIZE(drivers));
>> +	if (err < 0)
>> +		goto unregister_host1x;
>> +
>> +	return 0;
>> +
>> +unregister_host1x:
>> +	host1x_driver_unregister(&host1x_video_driver);
>> +	return err;
>> +}
>> +module_init(host1x_video_init);
>> +
>> +static void __exit host1x_video_exit(void)
>> +{
>> +	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
>> +	host1x_driver_unregister(&host1x_video_driver);
>> +}
>> +module_exit(host1x_video_exit);
>> +
>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra Host1x Video driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/staging/media/tegra/host1x-video.h b/drivers/staging/media/tegra/host1x-video.h
>> new file mode 100644
>> index 000000000000..84d28e6f4362
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/host1x-video.h
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef HOST1X_VIDEO_H
>> +#define HOST1X_VIDEO_H 1
>> +
>> +#include <linux/host1x.h>
>> +
>> +#include <media/media-device.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#include "tegra-vi.h"
>> +#include "csi.h"
>> +
>> +struct tegra_camera {
> Nit: "camera" seems like a suboptimal choice because usually VI will
> consume data from multiple cameras. Maybe something like "tegra_video"
> would be a better name?
Will change
>
>> +	struct v4l2_device v4l2_dev;
>> +	struct media_device media_dev;
>> +	struct device *dev;
>> +	struct tegra_vi *vi;
>> +	struct tegra_csi_device *csi;
>> +};
>> +
>> +extern struct platform_driver tegra_vi_driver;
>> +extern struct platform_driver tegra_csi_driver;
>> +
>> +#endif /* HOST1X_VIDEO_H */
> [...]
>> diff --git a/drivers/staging/media/tegra/tegra-channel.c b/drivers/staging/media/tegra/tegra-channel.c
>> new file mode 100644
>> index 000000000000..7561f6fb8748
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-channel.c
>> @@ -0,0 +1,628 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/atomic.h>
>> +#include <linux/bitmap.h>
>> +#include <linux/clk.h>
>> +#include <linux/host1x.h>
>> +#include <linux/kthread.h>
>> +#include <linux/lcm.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-fh.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include <soc/tegra/pmc.h>
>> +
>> +#include "mc_common.h"
>> +#include "tegra-vi.h"
>> +#include "host1x-video.h"
>> +
>> +#define MAX_CID_CONTROLS		1
>> +
>> +static const char *const vi_pattern_strings[] = {
>> +	"Black/White Direct Mode",
>> +	"Color Patch Mode",
>> +};
>> +
>> +static int vi_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct tegra_channel *chan = container_of(ctrl->handler,
>> +						  struct tegra_channel,
>> +						  ctrl_handler);
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_TEST_PATTERN:
>> +		chan->vi->pg_mode = ctrl->val + 1;
>> +		dev_info(chan->vi->dev, "TPG mode is set to %s\n",
>> +			 vi_pattern_strings[ctrl->val]);
> dev_dbg()?
>
>> +		break;
>> +
>> +	default:
>> +		dev_err(chan->vi->dev, "Invalid Tegra video control\n");
> That potentially allows an attacker to DoS by flooding the kernel log.
> Isn't the -EINVAL below already going to provide enough information to
> the caller? If we really want this, perhaps turn it into a dev_dbg() or
> even better yet, a rate-limited dev_dbg().
>
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> [...]
>> diff --git a/drivers/staging/media/tegra/vi2_fops.c b/drivers/staging/media/tegra/vi2_fops.c
> [...]
>> +const struct tegra_vi_fops vi2_fops = {
>> +	.vi_stride_align = vi2_stride_align,
>> +	.vi_start_streaming = vi2_channel_start_streaming,
>> +	.vi_stop_streaming = vi2_channel_stop_streaming,
>> +};
>> +EXPORT_SYMBOL(vi2_fops);
> There should be no need to export this, unless you want to build this as
> a separate module, which I don't think is a good idea.
Will remove export.
>> diff --git a/drivers/staging/media/tegra/vi2_fops.h b/drivers/staging/media/tegra/vi2_fops.h
>> new file mode 100644
>> index 000000000000..dcbd3ad4b642
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/vi2_fops.h
>> @@ -0,0 +1,15 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __T210_VI_H__
>> +#define __T210_VI_H__
>> +
>> +#define	TEGRA210_CLOCK_VI_MAX			460000000
>> +
>> +#define	TEGRA_VI_CSI_BASE(x)			(0x100 + (x) * 0x100)
>> +
>> +extern const struct tegra_vi_fops vi2_fops;
>> +
>> +#endif
> I've been wondering about this. So far we've got two pairs of Tegra210
> specific files: vi2_fops.[ch] and csi2_fops.[ch]. Is there any reason
> why we couldn't merge those two files into a single file, say,
> tegra210.c?
>
> I don't think a header file would be really necessary in that case since
> only the tegra210.c file would use any of the definitions in that header
> and we coul simply put the "extern" definitions into some central
> location to make them available to the main driver.
>
> These files aren't terribly huge, so merging them should result in still
> fairly manageable chunks.

Yes, we can use single file for all Tegra210 CSI and VI fops.

Will change in v2.

>> diff --git a/drivers/staging/media/tegra/vi2_formats.h b/drivers/staging/media/tegra/vi2_formats.h
>> new file mode 100644
>> index 000000000000..416960b1c1f2
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/vi2_formats.h
>> @@ -0,0 +1,119 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __VI2_FORMATS_H_
>> +#define __VI2_FORMATS_H_
>> +
>> +#include "tegra-core.h"
>> +
>> +/*
>> + * These go into the TEGRA_VI_CSI_n_IMAGE_DEF registers bits 23:16
>> + * Output pixel memory format for the VI channel.
>> + */
>> +enum tegra_image_format {
>> +	TEGRA_IMAGE_FORMAT_T_L8 = 16,
>> +
>> +	TEGRA_IMAGE_FORMAT_T_R16_I = 32,
>> +	TEGRA_IMAGE_FORMAT_T_B5G6R5,
>> +	TEGRA_IMAGE_FORMAT_T_R5G6B5,
>> +	TEGRA_IMAGE_FORMAT_T_A1B5G5R5,
>> +	TEGRA_IMAGE_FORMAT_T_A1R5G5B5,
>> +	TEGRA_IMAGE_FORMAT_T_B5G5R5A1,
>> +	TEGRA_IMAGE_FORMAT_T_R5G5B5A1,
>> +	TEGRA_IMAGE_FORMAT_T_A4B4G4R4,
>> +	TEGRA_IMAGE_FORMAT_T_A4R4G4B4,
>> +	TEGRA_IMAGE_FORMAT_T_B4G4R4A4,
>> +	TEGRA_IMAGE_FORMAT_T_R4G4B4A4,
>> +
>> +	TEGRA_IMAGE_FORMAT_T_A8B8G8R8 = 64,
>> +	TEGRA_IMAGE_FORMAT_T_A8R8G8B8,
>> +	TEGRA_IMAGE_FORMAT_T_B8G8R8A8,
>> +	TEGRA_IMAGE_FORMAT_T_R8G8B8A8,
>> +	TEGRA_IMAGE_FORMAT_T_A2B10G10R10,
>> +	TEGRA_IMAGE_FORMAT_T_A2R10G10B10,
>> +	TEGRA_IMAGE_FORMAT_T_B10G10R10A2,
>> +	TEGRA_IMAGE_FORMAT_T_R10G10B10A2,
>> +
>> +	TEGRA_IMAGE_FORMAT_T_A8Y8U8V8 = 193,
>> +	TEGRA_IMAGE_FORMAT_T_V8U8Y8A8,
>> +
>> +	TEGRA_IMAGE_FORMAT_T_A2Y10U10V10 = 197,
>> +	TEGRA_IMAGE_FORMAT_T_V10U10Y10A2,
>> +	TEGRA_IMAGE_FORMAT_T_Y8_U8__Y8_V8,
>> +	TEGRA_IMAGE_FORMAT_T_Y8_V8__Y8_U8,
>> +	TEGRA_IMAGE_FORMAT_T_U8_Y8__V8_Y8,
>> +	TEGRA_IMAGE_FORMAT_T_V8_Y8__U8_Y8,
>> +
>> +	TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N444 = 224,
>> +	TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N444,
>> +	TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N444,
>> +	TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N422,
>> +	TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N422,
>> +	TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N422,
>> +	TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N420,
>> +	TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N420,
>> +	TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N420,
>> +	TEGRA_IMAGE_FORMAT_T_X2LC10LB10LA10,
>> +	TEGRA_IMAGE_FORMAT_T_A2R6R6R6R6R6,
>> +};
>> +
>> +static const struct tegra_video_format vi2_video_formats[] = {
>> +	/* RAW 8 */
>> +	TEGRA_VIDEO_FORMAT(RAW8, 8, SRGGB8_1X8, 1, 1, T_L8,
>> +			   RAW8, SRGGB8, "RGRG.. GBGB.."),
>> +	TEGRA_VIDEO_FORMAT(RAW8, 8, SGRBG8_1X8, 1, 1, T_L8,
>> +			   RAW8, SGRBG8, "GRGR.. BGBG.."),
>> +	TEGRA_VIDEO_FORMAT(RAW8, 8, SGBRG8_1X8, 1, 1, T_L8,
>> +			   RAW8, SGBRG8, "GBGB.. RGRG.."),
>> +	TEGRA_VIDEO_FORMAT(RAW8, 8, SBGGR8_1X8, 1, 1, T_L8,
>> +			   RAW8, SBGGR8, "BGBG.. GRGR.."),
>> +
>> +	/* RAW 10 */
>> +	TEGRA_VIDEO_FORMAT(RAW10, 10, SRGGB10_1X10, 2, 1, T_R16_I,
>> +			   RAW10, SRGGB10, "RGRG.. GBGB.."),
>> +	TEGRA_VIDEO_FORMAT(RAW10, 10, SGRBG10_1X10, 2, 1, T_R16_I,
>> +			   RAW10, SGRBG10, "GRGR.. BGBG.."),
>> +	TEGRA_VIDEO_FORMAT(RAW10, 10, SGBRG10_1X10, 2, 1, T_R16_I,
>> +			   RAW10, SGBRG10, "GBGB.. RGRG.."),
>> +	TEGRA_VIDEO_FORMAT(RAW10, 10, SBGGR10_1X10, 2, 1, T_R16_I,
>> +			   RAW10, SBGGR10, "BGBG.. GRGR.."),
>> +
>> +	/* RAW 12 */
>> +	TEGRA_VIDEO_FORMAT(RAW12, 12, SRGGB12_1X12, 2, 1, T_R16_I,
>> +			   RAW12, SRGGB12, "RGRG.. GBGB.."),
>> +	TEGRA_VIDEO_FORMAT(RAW12, 12, SGRBG12_1X12, 2, 1, T_R16_I,
>> +			   RAW12, SGRBG12, "GRGR.. BGBG.."),
>> +	TEGRA_VIDEO_FORMAT(RAW12, 12, SGBRG12_1X12, 2, 1, T_R16_I,
>> +			   RAW12, SGBRG12, "GBGB.. RGRG.."),
>> +	TEGRA_VIDEO_FORMAT(RAW12, 12, SBGGR12_1X12, 2, 1, T_R16_I,
>> +			   RAW12, SBGGR12, "BGBG.. GRGR.."),
>> +
>> +	/* RGB888 */
>> +	TEGRA_VIDEO_FORMAT(RGB888, 24, RGB888_1X24, 4, 1, T_A8R8G8B8,
>> +			   RGB888, ABGR32, "BGRA-8-8-8-8"),
>> +	TEGRA_VIDEO_FORMAT(RGB888, 24, RGB888_1X32_PADHI, 4, 1, T_A8B8G8R8,
>> +			   RGB888, RGB32, "RGB-8-8-8-8"),
>> +
>> +	/* YUV422 */
>> +	TEGRA_VIDEO_FORMAT(YUV422, 16, UYVY8_1X16, 2, 1, T_U8_Y8__V8_Y8,
>> +			   YUV422_8, UYVY, "YUV 4:2:2"),
>> +	TEGRA_VIDEO_FORMAT(YUV422, 16, VYUY8_1X16, 2, 1, T_V8_Y8__U8_Y8,
>> +			   YUV422_8, VYUY, "YUV 4:2:2"),
>> +	TEGRA_VIDEO_FORMAT(YUV422, 16, YUYV8_1X16, 2, 1, T_Y8_U8__Y8_V8,
>> +			   YUV422_8, YUYV, "YUV 4:2:2"),
>> +	TEGRA_VIDEO_FORMAT(YUV422, 16, YVYU8_1X16, 2, 1, T_Y8_V8__Y8_U8,
>> +			   YUV422_8, YVYU, "YUV 4:2:2"),
>> +	TEGRA_VIDEO_FORMAT(YUV422, 16, UYVY8_1X16, 1, 1, T_Y8__V8U8_N422,
>> +			   YUV422_8, NV16, "NV16"),
>> +	TEGRA_VIDEO_FORMAT(YUV422, 16, UYVY8_2X8, 2, 1, T_U8_Y8__V8_Y8,
>> +			   YUV422_8, UYVY, "YUV 4:2:2 UYVY"),
>> +	TEGRA_VIDEO_FORMAT(YUV422, 16, VYUY8_2X8, 2, 1, T_V8_Y8__U8_Y8,
>> +			   YUV422_8, VYUY, "YUV 4:2:2 VYUY"),
>> +	TEGRA_VIDEO_FORMAT(YUV422, 16, YUYV8_2X8, 2, 1, T_Y8_U8__Y8_V8,
>> +			   YUV422_8, YUYV, "YUV 4:2:2 YUYV"),
>> +	TEGRA_VIDEO_FORMAT(YUV422, 16, YVYU8_2X8, 2, 1, T_Y8_V8__Y8_U8,
>> +			   YUV422_8, YVYU, "YUV 4:2:2 YVYU"),
>> +};
> Does this table perhaps also belong in tegra210.c?

vi2_formats.h is for Tegra210 specific video formats.

Yes we can merge csi fops, vi fops, Tegra210 specific video formats all 
into single file.

Will update in v2.

>
>> +#endif
>> diff --git a/drivers/staging/media/tegra/vi2_registers.h b/drivers/staging/media/tegra/vi2_registers.h
>> new file mode 100644
>> index 000000000000..c54a6a3aa1c4
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/vi2_registers.h
>> @@ -0,0 +1,194 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __REGISTERS_H__
>> +#define __REGISTERS_H__
>> +
>> +#define	TEGRA_CLOCK_VI_MAX				793600000
>> +#define	TEGRA210_SURFACE_ALIGNMENT			64
>> +#define TEGRA210_MAX_CHANNELS				6
>> +
>> +/* Tegra210 VI registers */
> If these are Tegra210-specific, are they accessed outside of Tegra210-
> specific code? If not, they may be better located in that new tegra210.c
> source file as well. That way it becomes a lot easier to distinguish
> between generic, perhaps parameterized, core code and the SoC generation
> specific code.
>
> Thierry

Yes they are T210 specific and not accessed outside of T210 code. Will 
move them to new single file.

