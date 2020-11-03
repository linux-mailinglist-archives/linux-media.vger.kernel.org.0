Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC812A4D67
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 18:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbgKCRpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 12:45:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgKCRpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 12:45:02 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D05EC0617A6
        for <linux-media@vger.kernel.org>; Tue,  3 Nov 2020 09:45:02 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ka0MX-0001oE-DP; Tue, 03 Nov 2020 18:44:53 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ka0MW-0001kC-8h; Tue, 03 Nov 2020 18:44:52 +0100
Date:   Tue, 3 Nov 2020 18:44:52 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>, devicetree@vger.kernel.org,
        graphics@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: tc358746: add Toshiba TC358746 Parallel to
 CSI-2 bridge driver
Message-ID: <20201103174452.nv43tpdwrivzmwbo@pengutronix.de>
References: <20190619152838.25079-1-m.felsch@pengutronix.de>
 <20190619152838.25079-3-m.felsch@pengutronix.de>
 <20190625122719.xcl3gxxs4gpuvetf@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190625122719.xcl3gxxs4gpuvetf@paasikivi.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:25:43 up 354 days,  6:44, 379 users,  load average: 0.07, 0.06,
 0.07
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 19-06-25 15:27, Sakari Ailus wrote:
> Hi Marco,
> 
> Thanks for the set.
> 
> Looks quite good to me in general; a few minor comments below.

sorry for my very long absence here. The project got stuck but is now
back on track :)

> On Wed, Jun 19, 2019 at 05:28:38PM +0200, Marco Felsch wrote:

> > +config VIDEO_TC358746
> > +	tristate "Toshiba TC358746 parallel-CSI2 bridge"
> > +	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API && MEDIA_CONTROLLER
> > +	select V4L2_FWNODE
> > +	help
> > +	  Support for the Toshiba TC358746 PARALLEL to MIPI CSI-2 bridge.
> > +	  The bridge can work in both directions but currenty only the
> 
> "currently"

Okay.

> > +MODULE_DESCRIPTION("Toshiba TC358746 Parallel to CSI-2 bridge driver");
> > +MODULE_AUTHOR("Marco Felsch <kernel@pengutronix.de>");
> > +MODULE_LICENSE("GPL v2");
> 
> These are usually placed at the end.

I will place these lines at the end.

> 
> > +
> > +#define I2C_MAX_XFER_SIZE	(512 + 2)
> > +#define TC358746_MAX_FIFO_SIZE	512
> > +#define TC358746_DEF_LINK_FREQ	0
> > +
> > +#define TC358746_LINEINIT_MIN_US	110
> > +#define TC358746_TWAKEUP_MIN_US		1200
> > +#define TC358746_LPTXTIME_MIN_NS	55
> > +#define TC358746_TCLKZERO_MIN_NS	305
> > +#define TC358746_TCLKTRAIL_MIN_NS	65
> > +#define TC358746_TCLKPOST_MIN_NS	65
> > +#define TC358746_THSZERO_MIN_NS		150
> > +#define TC358746_THSTRAIL_MIN_NS	65
> > +#define TC358746_THSPREPARE_MIN_NS	45
> > +
> > +static const struct v4l2_mbus_framefmt tc358746_def_fmt = {
> > +	.width		= 640,
> > +	.height		= 480,
> > +	.code		= MEDIA_BUS_FMT_UYVY8_2X8,
> > +	.field		= V4L2_FIELD_NONE,
> > +	.colorspace	= V4L2_COLORSPACE_DEFAULT,
> > +	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> > +	.quantization	= V4L2_QUANTIZATION_DEFAULT,
> > +	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> > +};
> > +
> > +struct tc358746_csi_param {
> > +	unsigned char speed_range;
> > +	unsigned int  unit_clk_hz;
> > +	unsigned char unit_clk_mul;
> > +	unsigned int speed_per_lane; /* bps / lane */
> > +	unsigned short lane_num;
> > +	bool is_continuous_clk;
> > +
> > +	/* CSI2-TX Parameters */
> > +	u32 lineinitcnt;
> > +	u32 lptxtimecnt;
> > +	u32 twakeupcnt;
> > +	u32 tclk_preparecnt;
> > +	u32 tclk_zerocnt;
> > +	u32 tclk_trailcnt;
> > +	u32 tclk_postcnt;
> > +	u32 ths_preparecnt;
> > +	u32 ths_zerocnt;
> > +	u32 ths_trailcnt;
> > +
> > +	unsigned int csi_hs_lp_hs_ps;
> > +};
> 
> Would it be possible to use struct phy_configure_opts_mipi_dphy and perhaps
> phy_mipi_dphy_get_default_config() as well?

Mh.. the meaning is nearly the same since it is a dphy but I would keep
it because:
I extracted the values from the excel sheet provided by Toshiba and
it _can be_ the case that they added a few workarounds for the
limits to the formulas since they do not match 100% with the limits
set by phy_mipi_dphy_get_default_config().

Since those var's represeting regvals too the worst case would be to add
conversion code (struct phy_configure_opts_mipi_dphy to regval) and
slightly timing adaption calculation for the setting to meet the
requirement from Toshiba.

> The result of the latter will surely be different though, but still
> expected to be valid.
>
> > +
> > +enum tc358746_csi_direction {
> > +	TC358746_CSI_RX, /* CSI-in -> Parallel-out */
> > +	TC358746_CSI_TX  /* Parallel-in -> CSI-out */
> > +};
> > +
> > +struct tc358746_state {
> > +	struct v4l2_subdev sd;
> > +	struct i2c_client *i2c_client;
> > +	struct gpio_desc *reset_gpio;
> > +
> > +	/*
> > +	 * Generic
> > +	 */
> > +	struct media_pad pads[2];
> > +	struct mutex confctl_mutex;
> > +	struct v4l2_mbus_framefmt fmt;
> > +	struct v4l2_ctrl_handler hdl;
> > +	bool fmt_changed;
> > +	bool test;
> > +
> > +	/*
> > +	 * Chip Clocks
> > +	 */
> > +	struct clk  *refclk;
> > +	/* internal pll */
> > +	unsigned int pllinclk_hz;
> > +	u16 pll_prd;
> > +	u16 pll_fbd;
> > +
> > +	/*
> > +	 * Video Buffer
> > +	 */
> > +	u16 vb_fifo; /* The FIFO size is 511x32 */
> > +
> > +	/* currently only TC358746_CSI_TX supported */
> > +	enum tc358746_csi_direction csi_dir;
> > +
> > +	/*
> > +	 * CSI TX
> > +	 */
> > +	struct v4l2_ctrl	  *link_freq;
> > +	struct tc358746_csi_param *link_freq_settings;
> > +	u64			  *link_frequencies;
> > +	unsigned int		   link_frequencies_num;
> > +
> > +	/*
> > +	 * Parallel input
> > +	 */
> > +	struct v4l2_ctrl *sensor_pclk_ctrl;
> > +	struct v4l2_ctrl *sensor_hblank_ctrl;
> > +	unsigned int pclk;
> > +	unsigned int hblank;
> > +};
> > +
> > +struct tc358746_mbus_fmt {
> > +	u32 code;
> > +	u8 bus_width;
> > +	u8 bpp;		 /* total bpp */
> > +	u8 pdformat;	 /* peripheral data format */
> > +	u8 pdataf;	 /* parallel data format option */
> > +	u8 ppp;		 /* pclk per pixel */
> > +	bool csitx_only; /* format only in csi-tx mode supported */
> > +};
> > +
> > +/* TODO: Add other formats as required */
> > +static const struct tc358746_mbus_fmt tc358746_formats[] = {
> > +	{
> > +		.code = MEDIA_BUS_FMT_UYVY8_2X8,
> 
> Note that on CSI-2 V4L2 uses the one pixel / sample variants. I.e. this
> would be MEDIA_BUS_FMT_UYVY8_1X16.

Thanks for the hint I need to (re-)check this.

> > +		.bus_width = 8,
> > +		.bpp = 16,
> > +		.pdformat = DATAFMT_PDFMT_YCBCRFMT_422_8_BIT,
> > +		.pdataf = CONFCTL_PDATAF_MODE0,
> > +		.ppp = 2,
> > +	}, {
> > +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> > +		.bus_width = 16,
> > +		.bpp = 16,
> > +		.pdformat = DATAFMT_PDFMT_YCBCRFMT_422_8_BIT,
> > +		.pdataf = CONFCTL_PDATAF_MODE1,
> > +		.ppp = 1,
> > +	}, {
> > +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> > +		.bus_width = 16,
> > +		.bpp = 16,
> > +		.pdformat = DATAFMT_PDFMT_YCBCRFMT_422_8_BIT,
> > +		.pdataf = CONFCTL_PDATAF_MODE2,
> > +		.ppp = 1,
> > +	}, {
> > +		.code = MEDIA_BUS_FMT_UYVY10_2X10,
> > +		.bus_width = 10,
> > +		.bpp = 20,
> > +		.pdformat = DATAFMT_PDFMT_YCBCRFMT_422_10_BIT,
> > +		.pdataf = CONFCTL_PDATAF_MODE0, /* don't care */
> > +		.ppp = 2,
> > +	}, {
> > +		/* in datasheet listed as YUV444 */
> > +		.code = MEDIA_BUS_FMT_GBR888_1X24,
> > +		.bus_width = 24,
> > +		.bpp = 24,
> > +		.pdformat = DATAFMT_PDFMT_YCBCRFMT_444,
> > +		.pdataf = CONFCTL_PDATAF_MODE0, /* don't care */
> > +		.ppp = 2,
> > +		.csitx_only = true,
> > +	},
> > +};

...

> > +static void i2c_wr(struct v4l2_subdev *sd, u16 reg, u8 *values, u32 n)
> > +{
> > +	struct tc358746_state *state = to_state(sd);
> > +	struct i2c_client *client = state->i2c_client;
> > +	int err;
> > +	struct i2c_msg msg;
> > +	u8 data[I2C_MAX_XFER_SIZE];
> > +
> > +	if ((2 + n) > I2C_MAX_XFER_SIZE) {
> > +		n = I2C_MAX_XFER_SIZE - 2;
> > +		v4l2_warn(sd, "i2c wr reg=%04x: len=%d is too big!\n",
> > +			  reg, 2 + n);
> > +	}
> > +
> > +	msg.addr = client->addr;
> > +	msg.buf = data;
> > +	msg.len = 2 + n;
> > +	msg.flags = 0;
> > +
> > +	data[0] = reg >> 8;
> > +	data[1] = reg & 0xff;
> > +
> > +	switch (n) {
> > +	case 1:
> > +		data[2 + 0] = values[0];
> > +		break;
> > +	case 2:
> > +		data[2 + 0] = values[1];
> > +		data[2 + 1] = values[0];
> > +		break;
> > +	case 4:
> > +		data[2 + 0] = values[1];
> > +		data[2 + 1] = values[0];
> > +		data[2 + 2] = values[3];
> > +		data[2 + 3] = values[2];
> > +		break;
> > +	default:
> > +		v4l2_info(sd, "unsupported I2C write %d bytes from address 0x%04x\n",
> > +			  n, reg);
> 
> You'd need to return here. Perhaps WARN_ON(1) instead of v4l2_info(), as
> this would presumably be a driver bug.

Okay.

> > +
> > +static void tc358746_enable_csi_lanes(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct tc358746_state *state = to_state(sd);
> > +	struct tc358746_csi_param *csi_setting =
> > +		tc358746_g_cur_csi_settings(state);
> > +	unsigned int lanes = csi_setting->lane_num;
> > +	u32 val = 0;
> > +
> > +	if (lanes < 1 || !enable)
> > +		i2c_wr32(sd, CLW_CNTRL, CLW_CNTRL_CLW_LANEDISABLE_MASK);
> > +	if (lanes < 1 || !enable)
> > +		i2c_wr32(sd, D0W_CNTRL, D0W_CNTRL_D0W_LANEDISABLE_MASK);
> 
> Please put the two in the same basic block; no need for two conditions that
> are the same.

Okay, there is also a of by one.

> > +	if (lanes < 2 || !enable)
> > +		i2c_wr32(sd, D1W_CNTRL, D1W_CNTRL_D1W_LANEDISABLE_MASK);
> > +	if (lanes < 3 || !enable)
> > +		i2c_wr32(sd, D2W_CNTRL, D2W_CNTRL_D2W_LANEDISABLE_MASK);
> > +	if (lanes < 4 || !enable)
> > +		i2c_wr32(sd, D3W_CNTRL, D2W_CNTRL_D3W_LANEDISABLE_MASK);
> > +
> > +	if (lanes > 0 && enable)
> 
> Isn't lanes always greater than 0?

You're right.

> > +		val |= HSTXVREGEN_CLM_HSTXVREGEN_MASK |
> > +			HSTXVREGEN_D0M_HSTXVREGEN_MASK;
> > +	if (lanes > 1 && enable)
> > +		val |= HSTXVREGEN_D1M_HSTXVREGEN_MASK;
> > +	if (lanes > 2 && enable)
> > +		val |= HSTXVREGEN_D2M_HSTXVREGEN_MASK;
> > +	if (lanes > 3 && enable)
> > +		val |= HSTXVREGEN_D3M_HSTXVREGEN_MASK;
> > +
> > +	i2c_wr32(sd, HSTXVREGEN, val);
> > +}
> > +
> > +static void tc358746_set_csi(struct v4l2_subdev *sd)
> > +{
> > +	struct tc358746_state *state = to_state(sd);
> > +	struct tc358746_csi_param *csi_setting =
> > +		tc358746_g_cur_csi_settings(state);
> > +	bool en_continuous_clk = csi_setting->is_continuous_clk;
> > +	u32 val;
> > +
> > +	val = TCLK_HEADERCNT_TCLK_ZEROCNT_SET(csi_setting->tclk_zerocnt) |
> > +	      TCLK_HEADERCNT_TCLK_PREPARECNT_SET(csi_setting->tclk_preparecnt);
> > +	i2c_wr32(sd, TCLK_HEADERCNT, val);
> > +	val = THS_HEADERCNT_THS_ZEROCNT_SET(csi_setting->ths_zerocnt) |
> > +	      THS_HEADERCNT_THS_PREPARECNT_SET(csi_setting->ths_preparecnt);
> > +	i2c_wr32(sd, THS_HEADERCNT, val);
> > +	i2c_wr32(sd, TWAKEUP, csi_setting->twakeupcnt);
> > +	i2c_wr32(sd, TCLK_POSTCNT, csi_setting->tclk_postcnt);
> > +	i2c_wr32(sd, THS_TRAILCNT, csi_setting->ths_trailcnt);
> > +	i2c_wr32(sd, LINEINITCNT, csi_setting->lineinitcnt);
> > +	i2c_wr32(sd, LPTXTIMECNT, csi_setting->lptxtimecnt);
> > +	i2c_wr32(sd, TCLK_TRAILCNT, csi_setting->tclk_trailcnt);
> > +	i2c_wr32(sd, TXOPTIONCNTRL,
> > +		 en_continuous_clk ? TXOPTIONCNTRL_CONTCLKMODE_MASK : 0);
> > +
> > +	if (state->test)
> > +		tc38764_debug_pattern_80(sd);
> > +
> > +	tc358746_dump_csi(sd, csi_setting);
> > +}
> > +
> > +static void tc358746_enable_csi_module(struct v4l2_subdev *sd, int enable)
> > +{
> > +	struct tc358746_state *state = to_state(sd);
> > +	struct tc358746_csi_param *csi_setting =
> > +		tc358746_g_cur_csi_settings(state);
> > +	unsigned int lanes = csi_setting->lane_num;
> > +	u32 val;
> > +
> > +	if (!enable)
> > +		return;
> > +
> > +	i2c_wr32(sd, STARTCNTRL, STARTCNTRL_START_MASK);
> > +	i2c_wr32(sd, CSI_START, CSI_START_STRT_MASK);
> > +
> > +	val = CSI_CONTROL_NOL_1_MASK;
> > +	if (lanes == 2)
> > +		val = CSI_CONTROL_NOL_2_MASK;
> > +	else if (lanes == 3)
> > +		val = CSI_CONTROL_NOL_3_MASK;
> > +	else if (lanes == 4)
> > +		val = CSI_CONTROL_NOL_4_MASK;
> > +
> > +	val |= CSI_CONTROL_CSI_MODE_MASK | CSI_CONTROL_TXHSMD_MASK;
> > +	tc358746_wr_csi_control(sd, val);
> > +}
> > +
> > +static void tc358746_set_buffers(struct v4l2_subdev *sd)
> > +{
> > +	struct tc358746_state *state = to_state(sd);
> > +	const struct tc358746_mbus_fmt *tc358746_mbusfmt =
> > +		tc358746_get_format(state->fmt.code);
> > +	unsigned int byte_per_line =
> > +		(state->fmt.width * tc358746_mbusfmt->bpp) / 8;
> > +
> > +	i2c_wr16(sd, FIFOCTL, state->vb_fifo);
> > +	i2c_wr16(sd, WORDCNT, byte_per_line);
> > +	v4l2_dbg(1, debug, sd, "FIFOCTL 0x%02x: WORDCNT 0x%02x\n",
> > +		state->vb_fifo, byte_per_line);
> > +}
> > +
> > +/* --------------- CORE OPS --------------- */
> > +
> > +static int tc358746_log_status(struct v4l2_subdev *sd)
> > +{
> > +	struct tc358746_state *state = to_state(sd);
> > +	uint16_t sysctl = i2c_rd16(sd, SYSCTL);
> > +
> > +	v4l2_info(sd, "-----Chip status-----\n");
> > +	v4l2_info(sd, "Chip ID: 0x%02lx\n",
> > +		  (i2c_rd16(sd, CHIPID) & CHIPID_CHIPID_MASK) >> 8);
> > +	v4l2_info(sd, "Chip revision: 0x%02lx\n",
> > +		  i2c_rd16(sd, CHIPID) & CHIPID_REVID_MASK);
> > +	v4l2_info(sd, "Sleep mode: %s\n", sysctl & SYSCTL_SLEEP_MASK ?
> > +		  "on" : "off");
> > +
> > +	v4l2_info(sd, "-----CSI-TX status-----\n");
> > +	v4l2_info(sd, "Waiting for particular sync signal: %s\n",
> > +			(i2c_rd16(sd, CSI_STATUS) & CSI_STATUS_S_WSYNC_MASK) ?
> > +			"yes" : "no");
> > +	v4l2_info(sd, "Transmit mode: %s\n",
> > +			(i2c_rd16(sd, CSI_STATUS) & CSI_STATUS_S_TXACT_MASK) ?
> > +			"yes" : "no");
> > +	v4l2_info(sd, "Stopped: %s\n",
> > +			(i2c_rd16(sd, CSI_STATUS) & CSI_STATUS_S_HLT_MASK) ?
> > +			"yes" : "no");
> > +	v4l2_info(sd, "Color space: %s\n",
> > +			state->fmt.code == MEDIA_BUS_FMT_UYVY8_2X8 ?
> > +			"YCbCr 422 8-bit" : "Unsupported");
> > +
> > +	return 0;
> > +}
> > +
> > +#ifdef CONFIG_VIDEO_ADV_DEBUG
> > +static void tc358746_print_register_map(struct v4l2_subdev *sd)
> > +{
> > +	v4l2_info(sd, "0x0000-0x0050: Global Register\n");
> > +	v4l2_info(sd, "0x0056-0x0070: Rx Control Registers\n");
> > +	v4l2_info(sd, "0x0080-0x00F8: Rx Status Registers\n");
> > +	v4l2_info(sd, "0x0100-0x0150: Tx D-PHY Register\n");
> > +	v4l2_info(sd, "0x0204-0x0238: Tx PPI Register\n");
> > +	v4l2_info(sd, "0x040c-0x0518: Tx Control Register\n");
> > +}
> > +
> > +static int tc358746_get_reg_size(u16 address)
> > +{
> > +	if (address <= 0x00ff)
> > +		return 2;
> > +	else if ((address >= 0x0100) && (address <= 0x05FF))
> > +		return 4;
> > +	else
> > +		return 1;
> > +}
> > +
> > +static int tc358746_g_register(struct v4l2_subdev *sd,
> > +			       struct v4l2_dbg_register *reg)
> > +{
> > +	if (reg->reg > 0xffff) {
> > +		tc358746_print_register_map(sd);
> > +		return -EINVAL;
> > +	}
> > +
> > +	reg->size = tc358746_get_reg_size(reg->reg);
> > +
> > +	reg->val = i2c_rdreg(sd, reg->reg, reg->size);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tc358746_s_register(struct v4l2_subdev *sd,
> > +			       const struct v4l2_dbg_register *reg)
> > +{
> > +	if (reg->reg > 0xffff) {
> > +		tc358746_print_register_map(sd);
> > +		return -EINVAL;
> > +	}
> > +
> > +	i2c_wrreg(sd, (u16)reg->reg, reg->val,
> > +			tc358746_get_reg_size(reg->reg));
> > +
> > +	return 0;
> > +}
> > +#endif
> > +
> > +/* --------------- video ops --------------- */
> > +
> > +static int tc358746_s_power(struct v4l2_subdev *sd, int on)
> > +{
> > +	struct tc358746_state *state = to_state(sd);
> > +
> > +	/*
> > +	 * REF_01:
> > +	 * Softreset don't reset configuration registers content but is needed
> 
> "doesn't"

Okay.

...

> > +static int tc358746_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +	tc358746_enable_stream(sd, enable);
> 
> Could you use tc358746_enable_stream() directly as the s_stream op?

Of course!

> Note that you need to call the upstream sub-device's s_stream op from here
> as well.

Yes I missed that thanks for the hint. Currently I' asking myself why it
worked without.

...

> > +/* --------------- PROBE / REMOVE --------------- */
> > +
> > +static int tc358746_set_lane_settings(struct tc358746_state *state,
> > +				      struct v4l2_fwnode_endpoint *fw)
> > +{
> > +	struct v4l2_subdev *sd = &state->sd;
> > +	int i;
> 
> unsigned int ?

Yes.

...

> > +static int tc358746_apply_fw(struct tc358746_state *state)
> > +{
> > +	struct v4l2_subdev *sd = &state->sd;
> > +	struct tc358746_csi_param *csi_setting;
> > +	int err, i;
> 
> unsigned int i

Yes.

> > +
> > +	for (i = 0; i < state->link_frequencies_num; i++) {
> > +		csi_setting = &state->link_freq_settings[i];
> > +
> > +		err = tc358746_calculate_csi_txtimings(state, csi_setting);
> > +		if (err) {
> > +			v4l2_err(sd, "Failed to calc csi-tx tminings\n");
> > +			return err;
> > +		}
> > +	}
> > +
> > +	/*
> > +	 * Set it to the hw default value. The correct value will be set during
> > +	 * set_fmt(), since it depends on the pclk and and the resulution.
> > +	 */
> > +	state->vb_fifo = 1;
> > +
> > +	err = clk_prepare_enable(state->refclk);
> > +	if (err) {
> > +		v4l2_err(sd, "Failed to enable clock\n");
> > +		return err;
> > +	}
> 
> Is there a need to keep the clock running even if the device is not
> streaming? Please consider adding runtime PM support. That's not strictly
> needed for the patch to be merged though IMO.

It should be disabled at least at remove, which I missed ...
Thanks for covering that. According you question, I think it should be
possible to add runtime PM. I have also pending patches adding this
device as clock provider. In that case it should be untouched till
runtime PM is supported for the device.

> > +
> > +	if (state->reset_gpio)
> > +		tc358746_gpio_reset(state);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tc358746_probe_fw(struct tc358746_state *state)
> > +{
> > +	struct device *dev = &state->i2c_client->dev;
> > +	struct v4l2_subdev *sd = &state->sd;
> > +	struct v4l2_fwnode_endpoint endpoint = {
> > +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > +	};
> > +	struct fwnode_handle *fw_node;
> > +	unsigned int refclk, pllinclk;
> > +	unsigned char pll_prediv;
> > +	int ret = -EINVAL;
> 
> ret is always assigned elsewhere; no need to initialise.

Yes.

> > +
> > +	/* Parse all clocks */
> > +	state->refclk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(state->refclk)) {
> > +		if (PTR_ERR(state->refclk) != -EPROBE_DEFER)
> > +			v4l2_err(sd, "failed to get refclk: %ld\n",
> > +				PTR_ERR(state->refclk));
> > +		return PTR_ERR(state->refclk);
> > +	}
> > +
> > +	refclk = clk_get_rate(state->refclk);
> > +	if (refclk < 6000000 || refclk > 40000000) {
> > +		v4l2_err(sd, "Invalid refclk %u, valid range: 6-40 MHz\n",
> > +			 refclk);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * The PLL input clock is obtained by dividing refclk by pll_prd.
> > +	 * It must be between 4 MHz and 40 MHz, lower frequency is better.
> > +	 */
> > +	pll_prediv = DIV_ROUND_CLOSEST(refclk, 4000000);
> > +	if (pll_prediv < 1 || pll_prediv > 16) {
> > +		v4l2_err(sd, "Invalid pll pre-divider value: %d\n", pll_prediv);
> > +		return -EINVAL;
> > +	}
> > +	state->pll_prd = pll_prediv;
> > +
> > +	pllinclk = DIV_ROUND_CLOSEST(refclk, pll_prediv);
> > +	if (pllinclk < 4000000 || pllinclk > 40000000) {
> > +		v4l2_err(sd, "Invalid pll input clock: %d Hz\n", pllinclk);
> > +		return -EINVAL;
> > +	}
> > +	state->pllinclk_hz = pllinclk;
> > +
> > +	/* Now parse the fw-node */
> > +	fwnode_graph_for_each_endpoint(dev_fwnode(dev), fw_node) {
> > +		struct fwnode_endpoint fw_ep;
> > +
> > +		ret = fwnode_graph_parse_endpoint(fw_node, &fw_ep);
> > +		if (ret)
> > +			return -EINVAL;
> > +
> > +		/* Get downstream endpoint */
> > +		if (fw_ep.port == 1)
> > +			break;
> 
> You could use fwnode_graph_get_endpoint_by_id() instead of the loop.

You're right I will change that.

...

> > +static int tc358746_async_register(struct v4l2_subdev *sd)
> > +{
> > +	unsigned int port = 0;
> > +
> > +	return v4l2_async_register_fwnode_subdev(
> > +		sd, sizeof(struct v4l2_async_subdev), &port, 1,
> > +		tc358746_parse_endpoint);
> 
> Please move this to the caller instead.

Okay.

> > +
> > +}
> > +
> > +static const char * const tc358764_test_pattern_menu[] = {
> > +	"Disabled",
> > +	"80 Pixel Color Bars",
> > +};
> > +
> > +static int tc358746_probe(struct i2c_client *client)
> > +{
> > +	struct tc358746_state *state;
> > +	struct v4l2_subdev *sd;
> > +	int err;
> > +
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> > +		return -EIO;
> > +
> > +	state = devm_kzalloc(&client->dev, sizeof(*state), GFP_KERNEL);
> > +	if (!state)
> > +		return -ENOMEM;
> > +
> > +	state->i2c_client = client;
> 
> You can use v4l2_get_subdevdata() to obtain the I²C client; no need to
> store it separately.

Yep I know now ^^

> > +	sd = &state->sd;
> > +	v4l2_i2c_subdev_init(sd, client, &tc358746_ops);
> > +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +
> > +	err = tc358746_probe_fw(state);
> > +	if (err)
> > +		return err;
> > +
> > +	err = tc358746_apply_fw(state);
> > +	if (err)
> > +		return err;
> > +
> > +	if (((i2c_rd16(sd, CHIPID) & CHIPID_CHIPID_MASK) >> 8) != 0x44) {
> > +		v4l2_info(sd, "not a TC358746 on address 0x%x\n",
> > +			  client->addr << 1);
> > +		err = -ENODEV;
> > +		goto err_clk;
> > +	}
> > +
> > +	v4l2_ctrl_handler_init(&state->hdl, 2);
> > +
> > +	v4l2_ctrl_new_std_menu_items(&state->hdl,
> > +			&tc358764_ctrl_ops, V4L2_CID_TEST_PATTERN,
> > +			ARRAY_SIZE(tc358764_test_pattern_menu) - 1, 0, 0,
> > +			tc358764_test_pattern_menu);
> > +
> > +	state->link_freq =
> > +		v4l2_ctrl_new_int_menu(&state->hdl, &tc358764_ctrl_ops,
> > +				       V4L2_CID_LINK_FREQ,
> > +				       state->link_frequencies_num - 1,
> > +				       TC358746_DEF_LINK_FREQ,
> > +				       state->link_frequencies);
> > +
> > +
> > +	sd->ctrl_handler = &state->hdl;
> > +	if (state->hdl.error) {
> > +		err = state->hdl.error;
> > +		goto err_hdl;
> > +	}
> > +
> > +	state->pads[0].flags = MEDIA_PAD_FL_SINK;
> > +	state->pads[1].flags = MEDIA_PAD_FL_SOURCE;
> > +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> > +	sd->entity.ops = &tc358746_entity_ops;
> > +	err = media_entity_pads_init(&sd->entity, 2, state->pads);
> > +	if (err < 0)
> > +		goto err_hdl;
> > +
> > +	mutex_init(&state->confctl_mutex);
> > +
> > +	state->fmt = tc358746_def_fmt;
> > +
> > +	/* Apply default settings */
> > +	tc358746_sreset(sd);
> > +	tc358746_set_buffers(sd);
> > +	tc358746_set_csi(sd);
> > +	tc358746_set_csi_color_space(sd);
> > +	tc358746_sleep_mode(sd, 1);
> > +	tc358746_set_pll(sd);
> > +	tc358746_enable_stream(sd, 0);
> > +
> > +	err = tc358746_async_register(sd);
> > +	if (err < 0)
> > +		goto err_mutex;
> > +
> > +	v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
> > +		  client->addr << 1, client->adapter->name);
> > +
> > +	return 0;
> > +
> > +err_mutex:
> > +	mutex_destroy(&state->confctl_mutex);
> > +err_hdl:
> > +	media_entity_cleanup(&sd->entity);
> > +	v4l2_ctrl_handler_free(&state->hdl);
> > +err_clk:
> > +	clk_disable_unprepare(state->refclk);
> > +
> > +	return err;
> > +}
> > +
> > +static int tc358746_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct tc358746_state *state = to_state(sd);
> > +
> > +	v4l2_async_unregister_subdev(sd);
> > +	v4l2_device_unregister_subdev(sd);
> > +	mutex_destroy(&state->confctl_mutex);
> > +	media_entity_cleanup(&sd->entity);
> > +	v4l2_ctrl_handler_free(&state->hdl);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id __maybe_unused tc358746_of_match[] = {
> > +	{ .compatible = "toshiba,tc358746" },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, tc358746_of_match);
> > +
> > +static struct i2c_driver tc358746_driver = {
> > +	.driver = {
> > +		.name = "tc358746",
> > +		.of_match_table = of_match_ptr(tc358746_of_match),
> 
> No need for of_patch_ptr() here.

Okay.

Thanks for the review :)

Regards,
  Marco
