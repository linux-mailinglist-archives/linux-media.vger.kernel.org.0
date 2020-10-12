Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D23828BCA8
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 17:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390203AbgJLPob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 11:44:31 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:41445 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390220AbgJLPob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 11:44:31 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1F9C660009;
        Mon, 12 Oct 2020 15:44:25 +0000 (UTC)
Date:   Mon, 12 Oct 2020 17:48:26 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hugues Fruchet <hugues.fruchet@st.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH v2] media: ov5640: fix support of BT656 bus mode
Message-ID: <20201012154826.yeowe5dheyedkqen@uno.localdomain>
References: <1602514303-22316-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1602514303-22316-1-git-send-email-hugues.fruchet@st.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Mon, Oct 12, 2020 at 04:51:43PM +0200, Hugues Fruchet wrote:
> Fix PCLK polarity not being taken into account.
> Add comments about BT656 register control.
> Remove useless ov5640_set_stream_bt656() function.
> Refine comments about MIPI IO register control.
>
> Fixes: 4039b03720f7 ("media: i2c: ov5640: Add support for BT656 mode")
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  drivers/media/i2c/ov5640.c | 77 +++++++++++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 8d0254d..c0ebf4c 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1216,20 +1216,6 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
>  			      BIT(1), on ? 0 : BIT(1));
>  }
>
> -static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> -{
> -	int ret;
> -
> -	ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> -			       on ? 0x1 : 0x00);
> -	if (ret)
> -		return ret;
> -
> -	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> -				OV5640_REG_SYS_CTRL0_SW_PWUP :
> -				OV5640_REG_SYS_CTRL0_SW_PWDN);
> -}
> -
>  static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>  {
>  	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> @@ -1994,6 +1980,7 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>  {
>  	unsigned int flags = sensor->ep.bus.parallel.flags;
> +	bool bt656 = sensor->ep.bus_type == V4L2_MBUS_BT656;
>  	u8 pclk_pol = 0;
>  	u8 hsync_pol = 0;
>  	u8 vsync_pol = 0;
> @@ -2001,6 +1988,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>
>  	if (!on) {
>  		/* Reset settings to their default values. */
> +		ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00, 0x00);
>  		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
>  		ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, 0x20);
>  		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x00);
> @@ -2024,23 +2012,51 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>  	 * - VSYNC:	active high
>  	 * - HREF:	active low
>  	 * - PCLK:	active low
> +	 *
> +	 * VSYNC & HREF are not configured if BT656 bus mode is selected
>  	 */
> +
>  	/*
> -	 * configure parallel port control lines polarity
> +	 * BT656 embedded synchronization configuration
>  	 *
> -	 * POLARITY CTRL0
> -	 * - [5]:	PCLK polarity (0: active low, 1: active high)
> -	 * - [1]:	HREF polarity (0: active low, 1: active high)
> -	 * - [0]:	VSYNC polarity (mismatch here between
> -	 *		datasheet and hardware, 0 is active high
> -	 *		and 1 is active low...)
> +	 * CCIR656 CTRL00
> +	 * - [7]:	SYNC code selection (0: auto generate sync code,
> +	 *		1: sync code from regs 0x4732-0x4735)
> +	 * - [6]:	f value in CCIR656 SYNC code when fixed f value
> +	 * - [5]:	Fixed f value
> +	 * - [4:3]:	Blank toggle data options (00: data=1'h040/1'h200,
> +	 *		01: data from regs 0x4736-0x4738, 10: always keep 0)
> +	 * - [1]:	Clip data disable
> +	 * - [0]:	CCIR656 mode enable
> +	 *
> +	 * Default CCIR656 SAV/EAV mode with default codes
> +	 * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
> +	 * - CCIR656 mode enable
> +	 * - auto generation of sync codes
> +	 * - blank toggle data 1'h040/1'h200
> +	 * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
>  	 */
> -	if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL) {
> +	ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> +			       bt656 ? 0x01 : 0x00);
> +	if (ret)
> +		return ret;

All good so far

> +
> +	if (on) {

But don't you have retained
        if (!on)
at the beginning of the function ?

I would reflow this as:

static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on) {
        if (!on) {
                ...
        }

        uint8_t polarities = 0;
        if (!bt656) {
                if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
        	        polarities |= BIT(1);
                if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
	                polarities |= BIT(0);
        }
        if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
	        polarities |= BIT(5);

	ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
                               polarities);
        if (ret)
                return ret;

        if (bt656) {
                write_reg(CCIR656);
        }

        ....

To make it more readable. What do you think ?

> +		/*
> +		 * configure parallel port control lines polarity
> +		 *
> +		 * POLARITY CTRL0
> +		 * - [5]:	PCLK polarity (0: active low, 1: active high)
> +		 * - [1]:	HREF polarity (0: active low, 1: active high)
> +		 * - [0]:	VSYNC polarity (mismatch here between
> +		 *		datasheet and hardware, 0 is active high
> +		 *		and 1 is active low...)
> +		 */
>  		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>  			pclk_pol = 1;
> -		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> +		if (!bt656 && flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>  			hsync_pol = 1;
> -		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> +		if (!bt656 && flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>  			vsync_pol = 1;
>
>  		ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
> @@ -2052,12 +2068,12 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>  	}
>

The part here below looks good!

>  	/*
> -	 * powerdown MIPI TX/RX PHY & disable MIPI
> +	 * powerdown MIPI TX/RX PHY & enable DVP
>  	 *
>  	 * MIPI CONTROL 00
> -	 * 4:	 PWDN PHY TX
> -	 * 3:	 PWDN PHY RX
> -	 * 2:	 MIPI enable
> +	 * [4] = 1	: Power down MIPI HS Tx
> +	 * [3] = 1	: Power down MIPI LS Rx
> +	 * [2] = 0	: DVP enable (MIPI disable)
>  	 */
>  	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x18);
>  	if (ret)
> @@ -2074,8 +2090,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>  	 * - [3:0]:	D[9:6] output enable
>  	 */
>  	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
> -			       sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
> -			       0x7f : 0x1f);
> +			       bt656 ? 0x1f : 0x7f);
>  	if (ret)
>  		return ret;
>
> @@ -2925,8 +2940,6 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>
>  		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
>  			ret = ov5640_set_stream_mipi(sensor, enable);
> -		else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
> -			ret = ov5640_set_stream_bt656(sensor, enable);
>  		else
>  			ret = ov5640_set_stream_dvp(sensor, enable);
>
> --
> 2.7.4
>
