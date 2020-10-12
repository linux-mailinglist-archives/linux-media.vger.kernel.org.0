Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4455528BAE2
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 16:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgJLObx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 10:31:53 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:40898 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389066AbgJLObx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 10:31:53 -0400
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id A04C83B3523
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 14:24:04 +0000 (UTC)
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id BFF7E20000F;
        Mon, 12 Oct 2020 14:23:40 +0000 (UTC)
Date:   Mon, 12 Oct 2020 16:27:40 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain VOLMAT <alain.volmat@st.com>
Subject: Re: [PATCH] media: ov5640: fix support of BT656 bus mode
Message-ID: <20201012142740.at5dogcofr7r43pj@uno.localdomain>
References: <1602080692-6383-1-git-send-email-hugues.fruchet@st.com>
 <20201012133538.2k6jpn6k2py7h2ym@uno.localdomain>
 <8c89da85-ccb9-4515-3995-27fe8e00c3cd@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8c89da85-ccb9-4515-3995-27fe8e00c3cd@st.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues

On Mon, Oct 12, 2020 at 02:12:09PM +0000, Hugues FRUCHET wrote:
> Hi Jacopo,
>
> Thanks for reviewing, comments below
>
> On 10/12/20 3:35 PM, Jacopo Mondi wrote:
> > Hi Hugues,
> >
> > On Wed, Oct 07, 2020 at 04:24:52PM +0200, Hugues Fruchet wrote:

> >
> > As per the comment from Sakari in another patch, 'Fixes' (capital 'F')
> > usually comes before Signed-off/Reviewed-by tags
> I understand the "F" upper case, but I don't understand the "comes
> before Signed-off", my signed-off is inserted after this line.
>

So, this is not stated explicitly in submitting-patches.rst, but as
per all the other tags attached to a patch, they're usually placed
after the commit message

in this case:

Fix PCLK polarity not being taken into account.
Fix ov5640_write_reg()return value unchecked at power off.
Reformat code to keep register access below the register description.
Remove useless ov5640_set_stream_bt656() function.

Fixes: 4039b03720f7 ("media: i2c: ov5640: Add support for BT656 mode")
Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>

> >
> >>
> >> Fix PCLK polarity not being taken into account.
>
> This one fixes a real bug.
>

I don't think I've contested this

> >> Fix ov5640_write_reg()return value unchecked at power off.
> >
> > Am I wrong or you broke out this part to a separate patch ?
> > As commented there, I don't think it's a good idea.
> >
> > Are you planning to send a v2 of this patch ?
> The patches was sent at same time, so it's normal that they are designed
> in same way, I'll send a v2 with this "reset to default at power off
> without check" strategy.
>

I was wondering if you were planning to send a v2 with the part that
changed the power-off path removed as I would have reviewed that one
instead of this, that's all.


> >
> > Thanks
> >    j
> >
> >> Reformat code to keep register access below the register description.
> >> Remove useless ov5640_set_stream_bt656() function.
> >>
> >> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> >> ---
> >>   drivers/media/i2c/ov5640.c | 95 +++++++++++++++++++++++++---------------------
> >>   1 file changed, 51 insertions(+), 44 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> >> index 8d0254d..1b20db7 100644
> >> --- a/drivers/media/i2c/ov5640.c
> >> +++ b/drivers/media/i2c/ov5640.c
> >> @@ -1216,20 +1216,6 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
> >>   			      BIT(1), on ? 0 : BIT(1));
> >>   }
> >>
> >> -static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> >> -{
> >> -	int ret;
> >> -
> >> -	ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> >> -			       on ? 0x1 : 0x00);
> >> -	if (ret)
> >> -		return ret;
> >> -
> >> -	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> >> -				OV5640_REG_SYS_CTRL0_SW_PWUP :
> >> -				OV5640_REG_SYS_CTRL0_SW_PWDN);
> >> -}
> >> -
> >>   static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
> >>   {
> >>   	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> >> @@ -1994,20 +1980,12 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
> >>   static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
> >>   {
> >>   	unsigned int flags = sensor->ep.bus.parallel.flags;
> >> +	bool bt656 = sensor->ep.bus_type == V4L2_MBUS_BT656;
> >>   	u8 pclk_pol = 0;
> >>   	u8 hsync_pol = 0;
> >>   	u8 vsync_pol = 0;
> >>   	int ret;
> >>
> >> -	if (!on) {
> >> -		/* Reset settings to their default values. */
> >> -		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
> >> -		ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, 0x20);
> >> -		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x00);
> >> -		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0x00);
> >> -		return 0;
> >> -	}
> >> -
> >>   	/*
> >>   	 * Note about parallel port configuration.
> >>   	 *
> >> @@ -2024,27 +2002,57 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
> >>   	 * - VSYNC:	active high
> >>   	 * - HREF:	active low
> >>   	 * - PCLK:	active low
> >> +	 *
> >> +	 * VSYNC & HREF are not configured if BT656 bus mode is selected
> >>   	 */
> >> +
> >>   	/*
> >> -	 * configure parallel port control lines polarity
> >> +	 * BT656 embedded synchronization configuration
> >> +	 *
> >> +	 * CCIR656 CTRL00
> >> +	 * - [7]:	SYNC code selection (0: auto generate sync code,
> >> +	 *		1: sync code from regs 0x4732-0x4735)
> >> +	 * - [6]:	f value in CCIR656 SYNC code when fixed f value
> >> +	 * - [5]:	Fixed f value
> >> +	 * - [4:3]:	Blank toggle data options (00: data=1'h040/1'h200,
> >> +	 *		01: data from regs 0x4736-0x4738, 10: always keep 0)
> >> +	 * - [1]:	Clip data disable
> >> +	 * - [0]:	CCIR656 mode enable
> >>   	 *
> >> -	 * POLARITY CTRL0
> >> -	 * - [5]:	PCLK polarity (0: active low, 1: active high)
> >> -	 * - [1]:	HREF polarity (0: active low, 1: active high)
> >> -	 * - [0]:	VSYNC polarity (mismatch here between
> >> -	 *		datasheet and hardware, 0 is active high
> >> -	 *		and 1 is active low...)
> >> +	 * Default CCIR656 SAV/EAV mode with default codes
> >> +	 * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
> >> +	 * - CCIR656 mode enable
> >> +	 * - auto generation of sync codes
> >> +	 * - blank toggle data 1'h040/1'h200
> >> +	 * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
> >>   	 */
> >> -	if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL) {
> >> +	ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> >> +			       on && bt656 ? 0x01 : 0x00);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	if (on) {
> >> +		/*
> >> +		 * configure parallel port control lines polarity
> >> +		 *
> >> +		 * POLARITY CTRL0
> >> +		 * - [5]:	PCLK polarity (0: active low, 1: active high)
> >> +		 * - [1]:	HREF polarity (0: active low, 1: active high)
> >> +		 * - [0]:	VSYNC polarity (mismatch here between
> >> +		 *		datasheet and hardware, 0 is active high
> >> +		 *		and 1 is active low...)
> >> +		 */
> >>   		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> >>   			pclk_pol = 1;
> >> -		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> >> +		if (!bt656 && flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> >>   			hsync_pol = 1;
> >> -		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> >> +		if (!bt656 && flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> >>   			vsync_pol = 1;
> >>
> >> -		ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
> >> -				       (pclk_pol << 5) | (hsync_pol << 1) |
> >> +		ret = ov5640_write_reg(sensor,
> >> +				       OV5640_REG_POLARITY_CTRL00,
> >> +				       (pclk_pol << 5) |
> >> +				       (hsync_pol << 1) |
> >>   				       vsync_pol);
> >>
> >>   		if (ret)
> >> @@ -2052,12 +2060,12 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
> >>   	}
> >>
> >>   	/*
> >> -	 * powerdown MIPI TX/RX PHY & disable MIPI
> >> +	 * powerdown MIPI TX/RX PHY & enable DVP
> >>   	 *
> >>   	 * MIPI CONTROL 00
> >> -	 * 4:	 PWDN PHY TX
> >> -	 * 3:	 PWDN PHY RX
> >> -	 * 2:	 MIPI enable
> >> +	 * [4] = 1	: Power down MIPI HS Tx
> >> +	 * [3] = 1	: Power down MIPI LS Rx
> >> +	 * [2] = 0	: DVP enable (MIPI disable)
> >>   	 */
> >>   	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x18);
> >>   	if (ret)
> >> @@ -2074,8 +2082,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
> >>   	 * - [3:0]:	D[9:6] output enable
> >>   	 */
> >>   	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
> >> -			       sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
> >> -			       0x7f : 0x1f);
> >> +			       on ? (bt656 ? 0x1f : 0x7f) : 0x00);
> >>   	if (ret)
> >>   		return ret;
> >>
> >> @@ -2085,7 +2092,9 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
> >>   	 * PAD OUTPUT ENABLE 02
> >>   	 * - [7:2]:	D[5:0] output enable
> >>   	 */
> >> -	return ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02, 0xfc);
> >> +	return ov5640_write_reg(sensor,
> >> +				OV5640_REG_PAD_OUTPUT_ENABLE02,
> >> +				on ? 0xfc : 0);
> >>   }
> >>
> >>   static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
> >> @@ -2925,8 +2934,6 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
> >>
> >>   		if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
> >>   			ret = ov5640_set_stream_mipi(sensor, enable);
> >> -		else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
> >> -			ret = ov5640_set_stream_bt656(sensor, enable);
> >>   		else
> >>   			ret = ov5640_set_stream_dvp(sensor, enable);
> >>
> >> --
> >> 2.7.4
> >>
