Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC8DAD64F
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 12:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388163AbfIIKGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 06:06:41 -0400
Received: from mga11.intel.com ([192.55.52.93]:31238 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729534AbfIIKGl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 06:06:41 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Sep 2019 03:06:40 -0700
X-IronPort-AV: E=Sophos;i="5.64,484,1559545200"; 
   d="scan'208";a="183773601"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Sep 2019 03:06:36 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 34ECF20CEF; Mon,  9 Sep 2019 13:06:34 +0300 (EEST)
Date:   Mon, 9 Sep 2019 13:06:34 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com,
        ben.kao@intel.com
Subject: Re: [V1, 2/2] media: i2c: Add more sensor mode for ov8856 camera
 sensor
Message-ID: <20190909100633.GB5781@paasikivi.fi.intel.com>
References: <20190808092215.5608-1-dongchun.zhu@mediatek.com>
 <20190808092215.5608-3-dongchun.zhu@mediatek.com>
 <20190808135310.GC917@valkosipuli.retiisi.org.uk>
 <1568018775.21623.221.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568018775.21623.221.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Mon, Sep 09, 2019 at 04:46:15PM +0800, Dongchun Zhu wrote:
> Hi Sakari,
> 
> On Thu, 2019-08-08 at 16:53 +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> > 
> > Thanks for the patch.
> > 
> > On Thu, Aug 08, 2019 at 05:22:15PM +0800, dongchun.zhu@mediatek.com wrote:
> > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > 
> > > This patch mainly adds two more sensor modes for OV8856 image sensor.
> > > The OV8856 driver currently supports output format: 10-bit Raw,
> > > the resolution of 1632*1224 and 3264*2448, and the bayer order of BGGR.
> > > The hardware version also differs in some OTP regiser,
> > > as well as PLL register setting.
> > > 
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  drivers/media/i2c/ov8856.c | 624 ++++++++++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 621 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> > > index cd347d6..e0610b6 100644
> > > --- a/drivers/media/i2c/ov8856.c
> > > +++ b/drivers/media/i2c/ov8856.c
> > > @@ -1,12 +1,15 @@
> > >  // SPDX-License-Identifier: GPL-2.0
> > >  // Copyright (c) 2019 Intel Corporation.
> > >  
> > > +#include <linux/clk.h>
> > >  #include <asm/unaligned.h>
> > >  #include <linux/acpi.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/module.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/regulator/consumer.h>
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-device.h>
> > >  #include <media/v4l2-fwnode.h>
> > > @@ -19,6 +22,7 @@
> > >  #define OV8856_LINK_FREQ_180MHZ		180000000ULL
> > >  #define OV8856_SCLK			144000000ULL
> > >  #define OV8856_MCLK			19200000
> > > +#define OV8856_XVCLK_FREQ		24000000
> > 
> > The driver currenctly uses, perhaps misleadingly, OV8856_MCLK for this
> > purpose. You could rename the existing MCLK as XVCLK.
> > 
> 
> OV8856_MCLK would be replaced by OV8856_XVCLK in next release.
> 
> > This also means the driver needs to differentiate configurations for 24 and
> > 19,2 MHz which it currently does not do. I think it may make sense to make
> > this a separate patch from the rest.
> > 
> 
> From datasheet, OV8856 could support input clock XVCLK range 6-27MHz.
> But the typical frequency is 24MHz.
> That's the value we now provide.

You'll still need to check for it in the driver, to avoid breaking existing
systems that use another frequency.

...

> > > @@ -566,6 +1018,10 @@ struct ov8856 {
> > >  	struct media_pad pad;
> > >  	struct v4l2_ctrl_handler ctrl_handler;
> > >  
> > > +	struct clk		*xvclk;
> > > +	struct gpio_desc	*reset_gpio;
> > > +	struct regulator_bulk_data supplies[OV8856_NUM_SUPPLIES];
> > > +
> > >  	/* V4L2 Controls */
> > >  	struct v4l2_ctrl *link_freq;
> > >  	struct v4l2_ctrl *pixel_rate;
> > > @@ -576,6 +1032,9 @@ struct ov8856 {
> > >  	/* Current mode */
> > >  	const struct ov8856_mode *cur_mode;
> > >  
> > > +	/* module hardware version */
> > > +	bool is_1B_module;
> > 
> > What other hardware versions are there, and what are the differences?
> > 
> 
> According to OV, there are two MP hardware versions (i.e., 1B and 2A)
> for OV8856.
> There is one difference between 1B and 2A module - which is 0x3614
> register.

Could you document the difference in a comment, and also how the B1 variant
is told apart from the 2A one?

> 
> > > +
> > >  	/* To serialize asynchronus callbacks */
> > >  	struct mutex mutex;
> > >  
> > > @@ -696,6 +1155,24 @@ static int ov8856_test_pattern(struct ov8856 *ov8856, u32 pattern)
> > >  				OV8856_REG_VALUE_08BIT, pattern);
> > >  }
> > >  
> > > +static int ov8856_update_otp_reg(struct ov8856 *ov8856)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
> > > +			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = ov8856_write_reg(ov8856, OV8856_OTP_REG_ONE,
> > > +			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STANDBY);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return ov8856_write_reg(ov8856, OV8856_OTP_REG_TWO,
> > > +				OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
> > > +}
> > 
> > What does this do?
> > 
> 
> R700f is OTP register, the register value corresponds different hardware
> version.
> Mainly including:
> 01: 2A: EMI improvement
> 02: 1B: remove some mask for cost; initial setting cannot share with 1A

If you're accessing EEPROM here, please tell that.

Do you really need to start streaming to do that? Please add comments to
what do these steps actually achieve.

> 
> To identify sensor chip version, the following steps needs to be done
> before reading out R700f.
> R0100 write 0x01.
> R3d84 write 0x00
> R3d81 write 0x01
> 
> To make more clear, ov8856_update_otp_reg() would be renamed to
> ov8856_check_revision() in next release.

Sounds good to me.

> 
> > > +
> > >  static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
> > >  {
> > >  	struct ov8856 *ov8856 = container_of(ctrl->handler,
> > > @@ -825,7 +1302,13 @@ static void ov8856_update_pad_format(const struct ov8856_mode *mode,
> > >  {
> > >  	fmt->width = mode->width;
> > >  	fmt->height = mode->height;
> > > -	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> > > +
> > > +	/* Bayer Order is determined by image resolution */
> > 
> > Ouch. 
> > 
> > This rather looks like a side effect of vertical cropping. How about
> > either cropping one line above or below, to keep the same Bayer order?
> > 
> > The driver is based on register lists that heavily restricts the
> > possibilities of configuring the sensor. The alternative, should more
> > free-form configuration be enabled, would be to expose the cropping
> > capability to the user --- as well as binning.
> > 
> 
> Oh, this is quite a long story.
> From datasheet, the  Bayer Order should be BGGR, and the whole active
> pixel array should be 3264x2448.
> In fact, I am a little confused about why there exits another image size
> (3280x2464).
> Or maybe this is one old sensor version.
> 
> +Cc: Ben.
> Ben, could help introduce some background at that time?
> 
> 
> > > +	if (fmt->width == 3264 || fmt->width == 1632)
> > > +		fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > > +	else
> > > +		fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> > > +
> > >  	fmt->field = V4L2_FIELD_NONE;
> > >  }
> > >  
> > > @@ -850,6 +1333,17 @@ static int ov8856_start_streaming(struct ov8856 *ov8856)
> > >  		return ret;
> > >  	}
> > >  
> > > +	/* update R3614 for 1B module */
> > > +	if (ov8856->is_1B_module) {
> > > +		ret = ov8856_write_reg(ov8856, OV8856_CLK_REG,
> > > +				       OV8856_REG_VALUE_08BIT,
> > > +				       OV8856_CLK_REG_1B_VAL);
> > > +		if (ret) {
> > > +			dev_err(&client->dev, "failed to set R3614");
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > >  	ret = __v4l2_ctrl_handler_setup(ov8856->sd.ctrl_handler);
> > >  	if (ret)
> > >  		return ret;
> > > @@ -882,6 +1376,8 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
> > >  	if (ov8856->streaming == enable)
> > >  		return 0;
> > >  
> > > +	dev_dbg(&client->dev, "hardware version: (%d)\n", ov8856->is_1B_module);
> > > +
> > >  	mutex_lock(&ov8856->mutex);
> > >  	if (enable) {
> > >  		ret = pm_runtime_get_sync(&client->dev);
> > > @@ -908,6 +1404,54 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
> > >  	return ret;
> > >  }
> > >  
> > > +/* Calculate the delay in us by clock rate and clock cycles */
> > > +static inline u32 ov8856_cal_delay(u32 cycles)
> > > +{
> > > +	return DIV_ROUND_UP(cycles, OV8856_XVCLK_FREQ / 1000 / 1000);
> > 
> > The frequency is rounded down. As it is used to calculate a delay needed,
> > rounding up should be done for the frequency, too.
> > 
> 
> It seems that OV8856_XVCLK_FREQ / 1000 / 1000 is a rounded-down value.
> But Note that here OV8856_XVCLK_FREQ is 24MHz.
> So OV8856_XVCLK_FREQ / 1000 / 1000 is exactly an integer value.

This breaks already on the frequency already supported by the driver (19,2
MHz).

...

> > > +
> > > +	return 0;
> > > +
> > > +disable_clk:
> > > +	clk_disable_unprepare(ov8856->xvclk);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void __ov8856_power_off(struct ov8856 *ov8856)
> > > +{
> > > +	clk_disable_unprepare(ov8856->xvclk);
> > > +	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > > +
> > > +	regulator_bulk_disable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> > > +}
> > > +
> > >  static int __maybe_unused ov8856_suspend(struct device *dev)
> > >  {
> > >  	struct i2c_client *client = to_i2c_client(dev);
> > > @@ -915,8 +1459,8 @@ static int __maybe_unused ov8856_suspend(struct device *dev)
> > >  	struct ov8856 *ov8856 = to_ov8856(sd);
> > >  
> > >  	mutex_lock(&ov8856->mutex);
> > > -	if (ov8856->streaming)
> > > -		ov8856_stop_streaming(ov8856);
> > 
> > This seems like an unrelated change.
> > 
> 
> Sorry, there is one concerns.
> For set_stream(0), it seems that pm_runtime_put would be called after
> ov8856_stop_streaming.
> I wonder that whether ov8856_stop_streaming is called twice when device
> suspended.

If you think that's the case, please fix it in a separate patch.

...

> > > +
> > > +	for (i = 0; i < OV8856_NUM_SUPPLIES; i++)
> > > +		ov8856->supplies[i].supply = ov8856_supply_names[i];
> > > +
> > > +	return devm_regulator_bulk_get(&client->dev,
> > > +				       OV8856_NUM_SUPPLIES,
> > > +				       ov8856->supplies);
> > 
> > Remember to put the regulators, too.
> > 
> 
> Thanks for reminder.
> ov8856_power_off would call regulator_bulk_disable.

I missed you were using the devm_ variant. No need to put the regulators
(but disable you'll still need).

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
