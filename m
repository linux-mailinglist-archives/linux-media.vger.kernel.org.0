Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6FD29CD02
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 12:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729904AbfHZKEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 06:04:05 -0400
Received: from mga07.intel.com ([134.134.136.100]:59758 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726669AbfHZKEF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 06:04:05 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 03:04:04 -0700
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; 
   d="scan'208";a="179830764"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 03:04:02 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1C9FB20B47; Mon, 26 Aug 2019 13:03:30 +0300 (EEST)
Date:   Mon, 26 Aug 2019 13:03:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>, devicetree@vger.kernel.org,
        graphics@pengutronix.de, linux-media@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 2/2] media: tc358746: add Toshiba TC358746 Parallel to
 CSI-2 bridge driver
Message-ID: <20190826100330.GO31967@paasikivi.fi.intel.com>
References: <20190619152838.25079-1-m.felsch@pengutronix.de>
 <20190619152838.25079-3-m.felsch@pengutronix.de>
 <20190625122719.xcl3gxxs4gpuvetf@paasikivi.fi.intel.com>
 <20190729104044.svemh7jvt2kiyn36@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729104044.svemh7jvt2kiyn36@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Mon, Jul 29, 2019 at 12:40:44PM +0200, Marco Felsch wrote:

...

> > > +#define I2C_MAX_XFER_SIZE	(512 + 2)
> > > +#define TC358746_MAX_FIFO_SIZE	512
> > > +#define TC358746_DEF_LINK_FREQ	0
> > > +
> > > +#define TC358746_LINEINIT_MIN_US	110
> > > +#define TC358746_TWAKEUP_MIN_US		1200
> > > +#define TC358746_LPTXTIME_MIN_NS	55
> > > +#define TC358746_TCLKZERO_MIN_NS	305
> > > +#define TC358746_TCLKTRAIL_MIN_NS	65
> > > +#define TC358746_TCLKPOST_MIN_NS	65
> > > +#define TC358746_THSZERO_MIN_NS		150
> > > +#define TC358746_THSTRAIL_MIN_NS	65
> > > +#define TC358746_THSPREPARE_MIN_NS	45
> > > +
> > > +static const struct v4l2_mbus_framefmt tc358746_def_fmt = {
> > > +	.width		= 640,
> > > +	.height		= 480,
> > > +	.code		= MEDIA_BUS_FMT_UYVY8_2X8,
> > > +	.field		= V4L2_FIELD_NONE,
> > > +	.colorspace	= V4L2_COLORSPACE_DEFAULT,
> > > +	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> > > +	.quantization	= V4L2_QUANTIZATION_DEFAULT,
> > > +	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> > > +};
> > > +
> > > +struct tc358746_csi_param {
> > > +	unsigned char speed_range;
> > > +	unsigned int  unit_clk_hz;
> > > +	unsigned char unit_clk_mul;
> > > +	unsigned int speed_per_lane; /* bps / lane */
> > > +	unsigned short lane_num;
> > > +	bool is_continuous_clk;
> > > +
> > > +	/* CSI2-TX Parameters */
> > > +	u32 lineinitcnt;
> > > +	u32 lptxtimecnt;
> > > +	u32 twakeupcnt;
> > > +	u32 tclk_preparecnt;
> > > +	u32 tclk_zerocnt;
> > > +	u32 tclk_trailcnt;
> > > +	u32 tclk_postcnt;
> > > +	u32 ths_preparecnt;
> > > +	u32 ths_zerocnt;
> > > +	u32 ths_trailcnt;
> > > +
> > > +	unsigned int csi_hs_lp_hs_ps;
> > > +};
> > 
> > Would it be possible to use struct phy_configure_opts_mipi_dphy and perhaps
> > phy_mipi_dphy_get_default_config() as well? The result of the latter will
> > surely be different though, but still expected to be valid.
> 
> I've checked the struct phy_configure_opts_mipi_dphy and have a few
> points to think about:
> 1) The values I need here are counter values. The struct you mentioned
>    uses time based values. This is good but needs a retranslation into
>    the count values.
> 2) The tclk_zerocnt and tclk_zerocnt has a other meaning here:
>      tclk_zerocnt = ckl_prepare + clk_zero > 300ns
>      ths_zerocnt  =  hs_prepare +  hs_zero > 145ns + 10 * ui
> 
> I can use the struct phy_configure_opts_mipi_dphy but then the
> meaning are not the same..
> 
> If I should use the phy_mipi_dphy_get_default_config() helper I had to
> reconstruct the whole logic. Currently the driver is based on the
> following behaviour:
>   - the fw (DT in our case) defines possible link frequencies and data
>     lane numbers
>   - based on that information I calculate possible counter values to
>     confirm the mipi-spec
>   - now the user specifies a format and I try to serve the request by
>     - adjusting the fifo-size
>       if not possible
>       - use other link frequency setting and retry adjusting fifo_size
>       if till not possible
>       - begin to reduce the resultion
> 
> Imagine it that way: I configure the dphy side and adjust the parallel
> side.
> 
> Now phy_mipi_dphy_get_default_config() uses the format bpp and the
> pixel_clk to calculate the exact default config. Those configs must be
> converted to the counter values. This wouldn't be a big deal but the
> excel-sheet I used to calculate the timings adds some "random"
> undocumented constants. So it would not be just a conversion from a
> time-val to a counter-val. After that we need to verify the
> parallel-input settings against the dphy-settings and do proper
> fifo/picture-soze adjustments.

Does the parallel interface configuration really affect the CSI-2 timings,
apart from the data rate? There are many valid CSI-2 timing configurations
as what's needed in general is to stay within a range instead of using an
exact value for a given parameter.

Cc'ing Maxime.

> 
> I would keep my approach beacause of the "random" undocumented constants
> and the other meaning of the struct phy_configure_opts_mipi_dphy
> members. Maybe I can convert it later if I have more time to verify that
> the "random" undocumented constants aren't important and can be dropped.
> Also I checked a few other Toshiba TC convert chips and it seems that
> all off them uses the same DPHY. So maybe we should split out the
> phy-part to share it.

This would be quite favourable, indeed.

> 
> > > +
> > > +enum tc358746_csi_direction {
> > > +	TC358746_CSI_RX, /* CSI-in -> Parallel-out */
> > > +	TC358746_CSI_TX  /* Parallel-in -> CSI-out */
> > > +};
> > > +
> > > +struct tc358746_state {
> > > +	struct v4l2_subdev sd;
> > > +	struct i2c_client *i2c_client;
> > > +	struct gpio_desc *reset_gpio;
> > > +
> > > +	/*
> > > +	 * Generic
> > > +	 */
> > > +	struct media_pad pads[2];
> > > +	struct mutex confctl_mutex;
> > > +	struct v4l2_mbus_framefmt fmt;
> > > +	struct v4l2_ctrl_handler hdl;
> > > +	bool fmt_changed;
> > > +	bool test;
> > > +
> > > +	/*
> > > +	 * Chip Clocks
> > > +	 */
> > > +	struct clk  *refclk;
> > > +	/* internal pll */
> > > +	unsigned int pllinclk_hz;
> > > +	u16 pll_prd;
> > > +	u16 pll_fbd;
> > > +
> > > +	/*
> > > +	 * Video Buffer
> > > +	 */
> > > +	u16 vb_fifo; /* The FIFO size is 511x32 */
> > > +
> > > +	/* currently only TC358746_CSI_TX supported */
> > > +	enum tc358746_csi_direction csi_dir;
> > > +
> > > +	/*
> > > +	 * CSI TX
> > > +	 */
> > > +	struct v4l2_ctrl	  *link_freq;
> > > +	struct tc358746_csi_param *link_freq_settings;
> > > +	u64			  *link_frequencies;
> > > +	unsigned int		   link_frequencies_num;
> > > +
> > > +	/*
> > > +	 * Parallel input
> > > +	 */
> > > +	struct v4l2_ctrl *sensor_pclk_ctrl;
> > > +	struct v4l2_ctrl *sensor_hblank_ctrl;
> > > +	unsigned int pclk;
> > > +	unsigned int hblank;
> > > +};
> > > +
> > > +struct tc358746_mbus_fmt {
> > > +	u32 code;
> > > +	u8 bus_width;
> > > +	u8 bpp;		 /* total bpp */
> > > +	u8 pdformat;	 /* peripheral data format */
> > > +	u8 pdataf;	 /* parallel data format option */
> > > +	u8 ppp;		 /* pclk per pixel */
> > > +	bool csitx_only; /* format only in csi-tx mode supported */
> > > +};
> > > +
> > > +/* TODO: Add other formats as required */
> > > +static const struct tc358746_mbus_fmt tc358746_formats[] = {
> > > +	{
> > > +		.code = MEDIA_BUS_FMT_UYVY8_2X8,
> > 
> > Note that on CSI-2 V4L2 uses the one pixel / sample variants. I.e. this
> > would be MEDIA_BUS_FMT_UYVY8_1X16.
> 
> Sorry but I didn't get you. The format you mentioned is...
> 
> > > +		.bus_width = 8,
> > > +		.bpp = 16,
> > > +		.pdformat = DATAFMT_PDFMT_YCBCRFMT_422_8_BIT,
> > > +		.pdataf = CONFCTL_PDATAF_MODE0,
> > > +		.ppp = 2,
> > > +	}, {
> > > +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> 
> here.

You can support both MEDIA_BUS_FMT_UYVY8_1X16 and MEDIA_BUS_FMT_UYVY8_2X8
on the parallel interface, but on CSI-2 they're both called
MEDIA_BUS_FMT_UYVY8_1X16.

...

> > > +static int tc358746_s_power(struct v4l2_subdev *sd, int on)
> > > +{
> > > +	struct tc358746_state *state = to_state(sd);
> > > +
> > > +	/*
> > > +	 * REF_01:
> > > +	 * Softreset don't reset configuration registers content but is needed
> > 
> > "doesn't"
> > 
> > > +	 * during power-on to trigger a csi LP-11 state change and during
> > > +	 * power-off to disable the csi-module.
> > > +	 */
> > > +	tc358746_sreset(sd);
> > > +
> > > +	if (state->fmt_changed) {
> > > +		tc358746_set_buffers(sd);
> > > +		tc358746_set_csi(sd);
> > > +		tc358746_set_csi_color_space(sd);
> > > +
> > > +		/* as recommend in REF_01 */
> > > +		tc358746_sleep_mode(sd, 1);
> > > +		tc358746_set_pll(sd);
> > > +		tc358746_sleep_mode(sd, 0);
> > > +
> > > +		state->fmt_changed = false;
> > > +	}
> > > +
> > > +	tc358746_enable_csi_lanes(sd, on);
> > > +	tc358746_enable_csi_module(sd, on);
> > > +	tc358746_sleep_mode(sd, !on);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int tc358746_s_stream(struct v4l2_subdev *sd, int enable)
> > > +{
> > > +	tc358746_enable_stream(sd, enable);
> > 
> > Could you use tc358746_enable_stream() directly as the s_stream op?
> 
> Of course, added it for naming consistency since the enable_stream() is
> a internal function and I didn't wanted to mix those.

Please; it improves readability.

> 
> > Note that you need to call the upstream sub-device's s_stream op from here
> > as well.
> 
> I tought this is done by the host driver trough iterating over the whole
> graph?

The driver starting the pipeline is only expected to call s_stream on the
next sub-device in the pipeline.

...

> > > +static int tc358746_apply_fw(struct tc358746_state *state)
> > > +{
> > > +	struct v4l2_subdev *sd = &state->sd;
> > > +	struct tc358746_csi_param *csi_setting;
> > > +	int err, i;
> > 
> > unsigned int i
> 
> Yes.
> 
> > > +
> > > +	for (i = 0; i < state->link_frequencies_num; i++) {
> > > +		csi_setting = &state->link_freq_settings[i];
> > > +
> > > +		err = tc358746_calculate_csi_txtimings(state, csi_setting);
> > > +		if (err) {
> > > +			v4l2_err(sd, "Failed to calc csi-tx tminings\n");
> > > +			return err;
> > > +		}
> > > +	}
> > > +
> > > +	/*
> > > +	 * Set it to the hw default value. The correct value will be set during
> > > +	 * set_fmt(), since it depends on the pclk and and the resulution.
> > > +	 */
> > > +	state->vb_fifo = 1;
> > > +
> > > +	err = clk_prepare_enable(state->refclk);
> > > +	if (err) {
> > > +		v4l2_err(sd, "Failed to enable clock\n");
> > > +		return err;
> > > +	}
> > 
> > Is there a need to keep the clock running even if the device is not
> > streaming? Please consider adding runtime PM support. That's not strictly
> > needed for the patch to be merged though IMO.
> 
> Thats a good point. The Chip can act as clk-provider fo rother devices.
> So I would probably say yes.

If this is the case, wouldn't it be appropriate to take that into account
in DT bindings? If there's no need for that clock, then this chip could be
powered off. If the support for that is impelemented later on, then there's
a small risk of breaking systems where declaring those clocks was
forgotten.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
