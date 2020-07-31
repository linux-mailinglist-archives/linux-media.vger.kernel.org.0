Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E501523466D
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 15:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730217AbgGaNDU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 09:03:20 -0400
Received: from mga04.intel.com ([192.55.52.120]:42322 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727040AbgGaNDU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 09:03:20 -0400
IronPort-SDR: efZkN7KAXG8XqeWZsIGyVufBeI956XUCB55ocdlmwXKmhYJghItVZ7FbzZ7RX5dyRgt+VBUIGO
 6G4yxs7r+E2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="149235146"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="149235146"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 06:03:19 -0700
IronPort-SDR: 0+MGxVhfQmnXMcMZe4RRGMF0yf/k6XE1s79cFSjdPusCH2+rC3Qx1v51Wftf31OkEjGJspoveh
 XBxmXHIAPoGg==
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="313791688"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 06:03:17 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4B19320722; Fri, 31 Jul 2020 16:03:15 +0300 (EEST)
Date:   Fri, 31 Jul 2020 16:03:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: ov5640: Enable data pins on startup for
 DVP mode
Message-ID: <20200731130315.GO13316@paasikivi.fi.intel.com>
References: <1596187487-31403-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596187487-31403-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596187487-31403-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Fri, Jul 31, 2020 at 10:24:46AM +0100, Lad Prabhakar wrote:
> During testing this sensor on iW-RainboW-G21D-Qseven platform noticed the
> capture worked only for first run and for subsequent runs it failed.
> 
> This patch does the following in DVP mode:
> 1: Enables data lines on power up
> 2: Configures HVP lines on power up instead of configuring everytime on
>    stream ON/OFF
> 3: Disables MIPI interface.
> 4: Puts the sensor in power down mode during stream OFF.

Could you detail a little the underlying problem, the environment where it
can be reproduced and how the patch addresses it, please?

Are you using CSI-2 or the parallel interface, for instance?

> 
> Fixes: f22996db44e2d ("media: ov5640: add support of DVP parallel interface")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5640.c | 253 +++++++++++++++++++++------------------------
>  1 file changed, 120 insertions(+), 133 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 2fe4a7a..ac305a5 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -274,7 +274,7 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
>  /* YUV422 UYVY VGA@30fps */
>  static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
>  	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
> -	{0x3103, 0x03, 0, 0}, {0x3017, 0x00, 0, 0}, {0x3018, 0x00, 0, 0},
> +	{0x3103, 0x03, 0, 0},
>  	{0x3630, 0x36, 0, 0},
>  	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
>  	{0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
> @@ -1210,96 +1210,7 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
>  
>  static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>  {
> -	int ret;
> -	unsigned int flags = sensor->ep.bus.parallel.flags;
> -	u8 pclk_pol = 0;
> -	u8 hsync_pol = 0;
> -	u8 vsync_pol = 0;
> -
> -	/*
> -	 * Note about parallel port configuration.
> -	 *
> -	 * When configured in parallel mode, the OV5640 will
> -	 * output 10 bits data on DVP data lines [9:0].
> -	 * If only 8 bits data are wanted, the 8 bits data lines
> -	 * of the camera interface must be physically connected
> -	 * on the DVP data lines [9:2].
> -	 *
> -	 * Control lines polarity can be configured through
> -	 * devicetree endpoint control lines properties.
> -	 * If no endpoint control lines properties are set,
> -	 * polarity will be as below:
> -	 * - VSYNC:	active high
> -	 * - HREF:	active low
> -	 * - PCLK:	active low
> -	 */
> -
> -	if (on) {
> -		/*
> -		 * configure parallel port control lines polarity
> -		 *
> -		 * POLARITY CTRL0
> -		 * - [5]:	PCLK polarity (0: active low, 1: active high)
> -		 * - [1]:	HREF polarity (0: active low, 1: active high)
> -		 * - [0]:	VSYNC polarity (mismatch here between
> -		 *		datasheet and hardware, 0 is active high
> -		 *		and 1 is active low...)
> -		 */
> -		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> -			pclk_pol = 1;
> -		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> -			hsync_pol = 1;
> -		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> -			vsync_pol = 1;
> -
> -		ret = ov5640_write_reg(sensor,
> -				       OV5640_REG_POLARITY_CTRL00,
> -				       (pclk_pol << 5) |
> -				       (hsync_pol << 1) |
> -				       vsync_pol);
> -
> -		if (ret)
> -			return ret;
> -	}
> -
> -	/*
> -	 * powerdown MIPI TX/RX PHY & disable MIPI
> -	 *
> -	 * MIPI CONTROL 00
> -	 * 4:	 PWDN PHY TX
> -	 * 3:	 PWDN PHY RX
> -	 * 2:	 MIPI enable
> -	 */
> -	ret = ov5640_write_reg(sensor,
> -			       OV5640_REG_IO_MIPI_CTRL00, on ? 0x18 : 0);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * enable VSYNC/HREF/PCLK DVP control lines
> -	 * & D[9:6] DVP data lines
> -	 *
> -	 * PAD OUTPUT ENABLE 01
> -	 * - 6:		VSYNC output enable
> -	 * - 5:		HREF output enable
> -	 * - 4:		PCLK output enable
> -	 * - [3:0]:	D[9:6] output enable
> -	 */
> -	ret = ov5640_write_reg(sensor,
> -			       OV5640_REG_PAD_OUTPUT_ENABLE01,
> -			       on ? 0x7f : 0);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * enable D[5:0] DVP data lines
> -	 *
> -	 * PAD OUTPUT ENABLE 02
> -	 * - [7:2]:	D[5:0] output enable
> -	 */
> -	return ov5640_write_reg(sensor,
> -				OV5640_REG_PAD_OUTPUT_ENABLE02,
> -				on ? 0xfc : 0);
> +	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ? 0x2 : 0x42);
>  }
>  
>  static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
> @@ -2003,6 +1914,10 @@ static void ov5640_set_power_off(struct ov5640_dev *sensor)
>  
>  static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
>  {
> +	unsigned int flags = sensor->ep.bus.parallel.flags;
> +	u8 pclk_pol = 0;
> +	u8 hsync_pol = 0;
> +	u8 vsync_pol = 0;
>  	int ret = 0;
>  
>  	if (on) {
> @@ -2014,52 +1929,124 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
>  		if (ret)
>  			goto power_off;
>  
> -		/* We're done here for DVP bus, while CSI-2 needs setup. */
> -		if (sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
> -			return 0;
> +		/* CSI-2 setup. */
> +		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
> +			/*
> +			 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
> +			 *
> +			 * 0x300e = 0x40
> +			 * [7:5] = 010	: 2 data lanes mode (see FIXME note in
> +			 *		  "ov5640_set_stream_mipi()")
> +			 * [4] = 0	: Power up MIPI HS Tx
> +			 * [3] = 0	: Power up MIPI LS Rx
> +			 * [2] = 0	: MIPI interface disabled
> +			 */
> +			ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);

Please wrap lines over 80 if it can be reasonably one.

> +			if (ret)
> +				goto power_off;
>  
> -		/*
> -		 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
> -		 *
> -		 * 0x300e = 0x40
> -		 * [7:5] = 010	: 2 data lanes mode (see FIXME note in
> -		 *		  "ov5640_set_stream_mipi()")
> -		 * [4] = 0	: Power up MIPI HS Tx
> -		 * [3] = 0	: Power up MIPI LS Rx
> -		 * [2] = 0	: MIPI interface disabled
> -		 */
> -		ret = ov5640_write_reg(sensor,
> -				       OV5640_REG_IO_MIPI_CTRL00, 0x40);
> -		if (ret)
> -			goto power_off;
> +			/*
> +			 * Gate clock and set LP11 in 'no packets mode' (idle)
> +			 *
> +			 * 0x4800 = 0x24
> +			 * [5] = 1	: Gate clock when 'no packets'
> +			 * [2] = 1	: MIPI bus in LP11 when 'no packets'
> +			 */
> +			ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x24);
> +			if (ret)
> +				goto power_off;
>  
> -		/*
> -		 * Gate clock and set LP11 in 'no packets mode' (idle)
> -		 *
> -		 * 0x4800 = 0x24
> -		 * [5] = 1	: Gate clock when 'no packets'
> -		 * [2] = 1	: MIPI bus in LP11 when 'no packets'
> -		 */
> -		ret = ov5640_write_reg(sensor,
> -				       OV5640_REG_MIPI_CTRL00, 0x24);
> -		if (ret)
> -			goto power_off;
> +			/*
> +			 * Set data lanes and clock in LP11 when 'sleeping'
> +			 *
> +			 * 0x3019 = 0x70
> +			 * [6] = 1	: MIPI data lane 2 in LP11 when 'sleeping'
> +			 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
> +			 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
> +			 */
> +			ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x70);
> +			if (ret)
> +				goto power_off;
>  
> -		/*
> -		 * Set data lanes and clock in LP11 when 'sleeping'
> -		 *
> -		 * 0x3019 = 0x70
> -		 * [6] = 1	: MIPI data lane 2 in LP11 when 'sleeping'
> -		 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
> -		 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
> -		 */
> -		ret = ov5640_write_reg(sensor,
> -				       OV5640_REG_PAD_OUTPUT00, 0x70);
> -		if (ret)
> -			goto power_off;
> +			/* Give lanes some time to coax into LP11 state. */
> +			usleep_range(500, 1000);
> +		} else {
> +			/*
> +			 * Note about parallel port configuration.
> +			 *
> +			 * When configured in parallel mode, the OV5640 will
> +			 * output 10 bits data on DVP data lines [9:0].
> +			 * If only 8 bits data are wanted, the 8 bits data lines
> +			 * of the camera interface must be physically connected
> +			 * on the DVP data lines [9:2].
> +			 *
> +			 * Control lines polarity can be configured through
> +			 * devicetree endpoint control lines properties.
> +			 * If no endpoint control lines properties are set,
> +			 * polarity will be as below:
> +			 * - VSYNC:	active high
> +			 * - HREF:	active low
> +			 * - PCLK:	active low
> +			 */
> +			/*
> +			 * configure parallel port control lines polarity
> +			 *
> +			 * POLARITY CTRL0
> +			 * - [5]:	PCLK polarity (0: active low, 1: active high)
> +			 * - [1]:	HREF polarity (0: active low, 1: active high)
> +			 * - [0]:	VSYNC polarity (mismatch here between
> +			 *		datasheet and hardware, 0 is active high
> +			 *		and 1 is active low...)
> +			 */
> +			if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> +				pclk_pol = 1;
> +			if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> +				hsync_pol = 1;
> +			if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> +				vsync_pol = 1;
> +
> +			ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
> +					       (pclk_pol << 5) | (hsync_pol << 1) | vsync_pol);
> +
> +			if (ret)
> +				goto power_off;
> +
> +			/*
> +			 * powerdown MIPI TX/RX PHY & disable MIPI
> +			 *
> +			 * MIPI CONTROL 00
> +			 * 4:	 PWDN PHY TX
> +			 * 3:	 PWDN PHY RX
> +			 * 2:	 MIPI enable
> +			 */
> +			ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x18);
> +			if (ret)
> +				goto power_off;
> +
> +			/*
> +			 * enable VSYNC/HREF/PCLK DVP control lines
> +			 * & D[9:6] DVP data lines
> +			 *
> +			 * PAD OUTPUT ENABLE 01
> +			 * - 6:		VSYNC output enable
> +			 * - 5:		HREF output enable
> +			 * - 4:		PCLK output enable
> +			 * - [3:0]:	D[9:6] output enable
> +			 */
> +			ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x7f);
> +			if (ret)
> +				goto power_off;
>  
> -		/* Give lanes some time to coax into LP11 state. */
> -		usleep_range(500, 1000);
> +			/*
> +			 * enable D[5:0] DVP data lines
> +			 *
> +			 * PAD OUTPUT ENABLE 02
> +			 * - [7:2]:	D[5:0] output enable
> +			 */
> +			ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
> +			if (ret)
> +				goto power_off;
> +		}
>  
>  	} else {
>  		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {

-- 
Kind regards,

Sakari Ailus
