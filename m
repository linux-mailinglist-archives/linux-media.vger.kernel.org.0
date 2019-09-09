Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96AF0AD5A4
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 11:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbfIIJ1f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 05:27:35 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:14101 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727039AbfIIJ1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 05:27:35 -0400
X-UUID: 9fde3f78a99e47109c6e794ac42913fc-20190909
X-UUID: 9fde3f78a99e47109c6e794ac42913fc-20190909
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1469843493; Mon, 09 Sep 2019 17:27:26 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 9 Sep
 2019 17:27:23 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Sep 2019 17:27:23 +0800
Message-ID: <1568021243.21623.250.camel@mhfsdcap03>
Subject: Re: [V1, 2/2] media: i2c: Add more sensor mode for ov8856 camera
 sensor
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>
Date:   Mon, 9 Sep 2019 17:27:23 +0800
In-Reply-To: <20190823100126.GB33937@chromium.org>
References: <20190808092215.5608-1-dongchun.zhu@mediatek.com>
         <20190808092215.5608-3-dongchun.zhu@mediatek.com>
         <20190823100126.GB33937@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: C101645FC6010ADACA24136EE257BF4E873FFFDCD9736CBD53C7475A863EB0172000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Fri, 2019-08-23 at 19:01 +0900, Tomasz Figa wrote:
> Hi Dongchun,
> 
> On Thu, Aug 08, 2019 at 05:22:15PM +0800, dongchun.zhu@mediatek.com wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > 
> > This patch mainly adds two more sensor modes for OV8856 image sensor.
> > The OV8856 driver currently supports output format: 10-bit Raw,
> > the resolution of 1632*1224 and 3264*2448, and the bayer order of BGGR.
> > The hardware version also differs in some OTP regiser,
> > as well as PLL register setting.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  drivers/media/i2c/ov8856.c | 624 ++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 621 insertions(+), 3 deletions(-)
> > 
> 
> Thanks for the patch! Please see my comments inline.
> 
> > diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> > index cd347d6..e0610b6 100644
> > --- a/drivers/media/i2c/ov8856.c
> > +++ b/drivers/media/i2c/ov8856.c
> > @@ -1,12 +1,15 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  // Copyright (c) 2019 Intel Corporation.
> >  
> > +#include <linux/clk.h>
> >  #include <asm/unaligned.h>
> >  #include <linux/acpi.h>
> >  #include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fwnode.h>
> > @@ -19,6 +22,7 @@
> >  #define OV8856_LINK_FREQ_180MHZ		180000000ULL
> >  #define OV8856_SCLK			144000000ULL
> >  #define OV8856_MCLK			19200000
> > +#define OV8856_XVCLK_FREQ		24000000
> >  #define OV8856_DATA_LANES		4
> >  #define OV8856_RGB_DEPTH		10
> >  
> > @@ -29,6 +33,18 @@
> >  #define OV8856_MODE_STANDBY		0x00
> >  #define OV8856_MODE_STREAMING		0x01
> >  
> > +/* define 1B module */
> > +#define OV8856_1B_MODULE		0x02
> > +
> > +/* otp sram register */
> > +#define OV8856_OTP_REG			0x700f
> 
> This isn't a register. I believe the OTP read-out buffer is at 0x7000 and
> 0xf is the offset of the byte in the OTP that means the module revision.
> 

Agreed.
I would rename this macro.

> > +#define OV8856_OTP_REG_ONE		0x3d84
> > +#define OV8856_OTP_REG_TWO		0x3d81
> 
> These registers are definitely not "ONE" and "TWO". Please use proper
> names as per the datasheet.
> 

Fixed in next release.

> > +
> > +/* clock register */
> > +#define OV8856_CLK_REG			0x3614
> > +#define OV8856_CLK_REG_1B_VAL		0x20
> 
> Same here. These don't look like the real names of the register and bit
> field.
> 

Fixed in next release.

> > +
> >  /* vertical-timings from sensor */
> >  #define OV8856_REG_VTS			0x380e
> >  #define OV8856_VTS_MAX			0x7fff
> > @@ -64,6 +80,14 @@
> >  
> >  #define to_ov8856(_sd)			container_of(_sd, struct ov8856, sd)
> >  
> > +static const char * const ov8856_supply_names[] = {
> > +	"dovdd",	/* Digital I/O power */
> > +	"avdd",		/* Analog power */
> > +	"dvdd",		/* Digital core power */
> > +};
> > +
> > +#define OV8856_NUM_SUPPLIES ARRAY_SIZE(ov8856_supply_names)
> > +
> >  enum {
> >  	OV8856_LINK_FREQ_720MBPS,
> >  	OV8856_LINK_FREQ_360MBPS,
> > @@ -316,6 +340,208 @@ static const struct ov8856_reg mode_3280x2464_regs[] = {
> >  	{0x5e00, 0x00}
> >  };
> >  
> > +static const struct ov8856_reg mode_3264x2448_regs[] = {
> > +	{0x0103, 0x01},
> > +	{0x0302, 0x3c},
> > +	{0x0303, 0x01},
> > +	{0x031e, 0x0c},
> > +	{0x3000, 0x00},
> > +	{0x300e, 0x00},
> > +	{0x3010, 0x00},
> > +	{0x3015, 0x84},
> > +	{0x3018, 0x72},
> > +	{0x3021, 0x23},
> > +	{0x3033, 0x24},
> > +	{0x3500, 0x00},
> > +	{0x3501, 0x9a},
> > +	{0x3502, 0x20},
> > +	{0x3503, 0x08},
> > +	{0x3505, 0x83},
> > +	{0x3508, 0x01},
> > +	{0x3509, 0x80},
> > +	{0x350c, 0x00},
> > +	{0x350d, 0x80},
> > +	{0x350e, 0x04},
> > +	{0x350f, 0x00},
> > +	{0x3510, 0x00},
> > +	{0x3511, 0x02},
> > +	{0x3512, 0x00},
> > +	{0x3600, 0x72},
> > +	{0x3601, 0x40},
> > +	{0x3602, 0x30},
> > +	{0x3610, 0xc5},
> > +	{0x3611, 0x58},
> > +	{0x3612, 0x5c},
> > +	{0x3613, 0xca},
> > +	{0x3614, 0x60},
> > +	{0x3628, 0xff},
> > +	{0x3629, 0xff},
> > +	{0x362a, 0xff},
> > +	{0x3633, 0x10},
> > +	{0x3634, 0x10},
> > +	{0x3635, 0x10},
> > +	{0x3636, 0x10},
> > +	{0x3663, 0x08},
> > +	{0x3669, 0x34},
> > +	{0x366d, 0x00},
> > +	{0x366e, 0x10},
> > +	{0x3706, 0x86},
> > +	{0x370b, 0x7e},
> > +	{0x3714, 0x23},
> > +	{0x3730, 0x12},
> > +	{0x3733, 0x10},
> > +	{0x3764, 0x00},
> > +	{0x3765, 0x00},
> > +	{0x3769, 0x62},
> > +	{0x376a, 0x2a},
> > +	{0x376b, 0x30},
> > +	{0x3780, 0x00},
> > +	{0x3781, 0x24},
> > +	{0x3782, 0x00},
> > +	{0x3783, 0x23},
> > +	{0x3798, 0x2f},
> > +	{0x37a1, 0x60},
> > +	{0x37a8, 0x6a},
> > +	{0x37ab, 0x3f},
> > +	{0x37c2, 0x04},
> > +	{0x37c3, 0xf1},
> > +	{0x37c9, 0x80},
> > +	{0x37cb, 0x16},
> > +	{0x37cc, 0x16},
> > +	{0x37cd, 0x16},
> > +	{0x37ce, 0x16},
> > +	{0x3800, 0x00},
> > +	{0x3801, 0x00},
> > +	{0x3802, 0x00},
> > +	{0x3803, 0x0c},
> > +	{0x3804, 0x0c},
> > +	{0x3805, 0xdf},
> > +	{0x3806, 0x09},
> > +	{0x3807, 0xa3},
> > +	{0x3808, 0x0c},
> > +	{0x3809, 0xc0},
> > +	{0x380a, 0x09},
> > +	{0x380b, 0x90},
> > +	{0x380c, 0x07},
> > +	{0x380d, 0x8c},
> > +	{0x380e, 0x09},
> > +	{0x380f, 0xb2},
> > +	{0x3810, 0x00},
> > +	{0x3811, 0x04},
> > +	{0x3812, 0x00},
> > +	{0x3813, 0x02},
> > +	{0x3814, 0x01},
> > +	{0x3815, 0x01},
> > +	{0x3816, 0x00},
> > +	{0x3817, 0x00},
> > +	{0x3818, 0x00},
> > +	{0x3819, 0x00},
> > +	{0x3820, 0x80},
> > +	{0x3821, 0x46},
> > +	{0x382a, 0x01},
> > +	{0x382b, 0x01},
> > +	{0x3830, 0x06},
> > +	{0x3836, 0x02},
> > +	{0x3862, 0x04},
> > +	{0x3863, 0x08},
> > +	{0x3cc0, 0x33},
> > +	{0x3d85, 0x17},
> > +	{0x3d8c, 0x73},
> > +	{0x3d8d, 0xde},
> > +	{0x4001, 0xe0},
> > +	{0x4003, 0x40},
> > +	{0x4008, 0x00},
> > +	{0x4009, 0x0b},
> > +	{0x400a, 0x00},
> > +	{0x400b, 0x84},
> > +	{0x400f, 0x80},
> > +	{0x4010, 0xf0},
> > +	{0x4011, 0xff},
> > +	{0x4012, 0x02},
> > +	{0x4013, 0x01},
> > +	{0x4014, 0x01},
> > +	{0x4015, 0x01},
> > +	{0x4042, 0x00},
> > +	{0x4043, 0x80},
> > +	{0x4044, 0x00},
> > +	{0x4045, 0x80},
> > +	{0x4046, 0x00},
> > +	{0x4047, 0x80},
> > +	{0x4048, 0x00},
> > +	{0x4049, 0x80},
> > +	{0x4041, 0x03},
> > +	{0x404c, 0x20},
> > +	{0x404d, 0x00},
> > +	{0x404e, 0x20},
> > +	{0x4203, 0x80},
> > +	{0x4307, 0x30},
> > +	{0x4317, 0x00},
> > +	{0x4502, 0x50},
> > +	{0x4503, 0x08},
> > +	{0x4601, 0x80},
> > +	{0x4800, 0x44},
> > +	{0x4816, 0x53},
> > +	{0x481b, 0x50},
> > +	{0x481f, 0x27},
> > +	{0x4823, 0x3c},
> > +	{0x482b, 0x00},
> > +	{0x4831, 0x66},
> > +	{0x4837, 0x16},
> > +	{0x483c, 0x0f},
> > +	{0x484b, 0x05},
> > +	{0x5000, 0x77},
> > +	{0x5001, 0x0a},
> > +	{0x5003, 0xc8},
> > +	{0x5004, 0x04},
> > +	{0x5006, 0x00},
> > +	{0x5007, 0x00},
> > +	{0x502e, 0x03},
> > +	{0x5030, 0x41},
> > +	{0x5780, 0x14},
> > +	{0x5781, 0x0f},
> > +	{0x5782, 0x44},
> > +	{0x5783, 0x02},
> > +	{0x5784, 0x01},
> > +	{0x5785, 0x01},
> > +	{0x5786, 0x00},
> > +	{0x5787, 0x04},
> > +	{0x5788, 0x02},
> > +	{0x5789, 0x0f},
> > +	{0x578a, 0xfd},
> > +	{0x578b, 0xf5},
> > +	{0x578c, 0xf5},
> > +	{0x578d, 0x03},
> > +	{0x578e, 0x08},
> > +	{0x578f, 0x0c},
> > +	{0x5790, 0x08},
> > +	{0x5791, 0x04},
> > +	{0x5792, 0x00},
> > +	{0x5793, 0x52},
> > +	{0x5794, 0xa3},
> > +	{0x5795, 0x02},
> > +	{0x5796, 0x20},
> > +	{0x5797, 0x20},
> > +	{0x5798, 0xd5},
> > +	{0x5799, 0xd5},
> > +	{0x579a, 0x00},
> > +	{0x579b, 0x50},
> > +	{0x579c, 0x00},
> > +	{0x579d, 0x2c},
> > +	{0x579e, 0x0c},
> > +	{0x579f, 0x40},
> > +	{0x57a0, 0x09},
> > +	{0x57a1, 0x40},
> > +	{0x59f8, 0x3d},
> > +	{0x5a08, 0x02},
> > +	{0x5b00, 0x02},
> > +	{0x5b01, 0x10},
> > +	{0x5b02, 0x03},
> > +	{0x5b03, 0xcf},
> > +	{0x5b05, 0x6c},
> > +	{0x5e00, 0x00},
> > +	{0x5e10, 0xfc}
> > +};
> > +
> 
> It would be better if we could find the differences between the two arrays
> and handle them incrementally.
> 

This approach is not recommended.

For these two arrays, sensor input clock frequencies (19.2MHz, 24MHz)
are different, corresponding to different PLL register setting.

Besides, there are also some differences in image resolution and
hts/vts, including 0x3614 register that reflecting sensor revision.


> [snip]
> 
> > +static int ov8856_update_otp_reg(struct ov8856 *ov8856)
> > +{
> > +	int ret;
> > +
> > +	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
> > +			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ov8856_write_reg(ov8856, OV8856_OTP_REG_ONE,
> > +			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STANDBY);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ov8856_write_reg(ov8856, OV8856_OTP_REG_TWO,
> > +				OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
> 
> Hmm, this doesn't sound right. The OTP register doesn't have anything to do
> with streaming. Also we should stop streaming at the end.
> 

Sorry for the confusion.
We would rename ov8856_update_otp_reg function.

> > +}
> > +
> >  static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >  	struct ov8856 *ov8856 = container_of(ctrl->handler,
> > @@ -825,7 +1302,13 @@ static void ov8856_update_pad_format(const struct ov8856_mode *mode,
> >  {
> >  	fmt->width = mode->width;
> >  	fmt->height = mode->height;
> > -	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> > +
> > +	/* Bayer Order is determined by image resolution */
> > +	if (fmt->width == 3264 || fmt->width == 1632)
> 
> Could we instead set the bayer order in the mode struct?
> 

I would have a try...

> > +		fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > +	else
> > +		fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> > +
> >  	fmt->field = V4L2_FIELD_NONE;
> >  }
> >  
> > @@ -850,6 +1333,17 @@ static int ov8856_start_streaming(struct ov8856 *ov8856)
> >  		return ret;
> >  	}
> >  
> > +	/* update R3614 for 1B module */
> 
> What's R3614?
> 

R3614 is the register 0x3614, which reflects the sensor revision.
For instance, it would be 0x20 for 1B module, while 0x60 for 2A module.

> > +	if (ov8856->is_1B_module) {
> > +		ret = ov8856_write_reg(ov8856, OV8856_CLK_REG,
> > +				       OV8856_REG_VALUE_08BIT,
> > +				       OV8856_CLK_REG_1B_VAL);
> > +		if (ret) {
> > +			dev_err(&client->dev, "failed to set R3614");
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	ret = __v4l2_ctrl_handler_setup(ov8856->sd.ctrl_handler);
> >  	if (ret)
> >  		return ret;
> > @@ -882,6 +1376,8 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
> >  	if (ov8856->streaming == enable)
> >  		return 0;
> >  
> > +	dev_dbg(&client->dev, "hardware version: (%d)\n", ov8856->is_1B_module);
> > +
> >  	mutex_lock(&ov8856->mutex);
> >  	if (enable) {
> >  		ret = pm_runtime_get_sync(&client->dev);
> > @@ -908,6 +1404,54 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
> >  	return ret;
> >  }
> >  
> > +/* Calculate the delay in us by clock rate and clock cycles */
> > +static inline u32 ov8856_cal_delay(u32 cycles)
> > +{
> > +	return DIV_ROUND_UP(cycles, OV8856_XVCLK_FREQ / 1000 / 1000);
> > +}
> > +
> > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > +{
> > +	int ret;
> > +	u32 delay_us;
> > +	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > +
> > +	ret = clk_prepare_enable(ov8856->xvclk);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to enable xvclk\n");
> > +		return ret;
> > +	}
> > +
> > +	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> 
> According to my datasheet, this sensor doesn't have a reset pin. The one I
> can see there is XSHUTDN, which I would call "n_shutdn" here.
> 

I would rename this pin in next release.
BTW, how do you define "n_shutdn" or "shuutdn"?
If GPIO is actively high, then "n_shutdn"?

> > +
> > +	ret = regulator_bulk_enable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to enable regulators\n");
> > +		goto disable_clk;
> > +	}
> > +
> > +	gpiod_set_value_cansleep(ov8856->reset_gpio, 0);
> 
> According to the datasheet, XSHUTDN should be 0 for shutdown and 1 for
> running. Why is it the other way around here?
> 

For GPIO, the definition of bit field of flags defined in DT seems
reversed.
This would be fixed in next release.

> > +
> > +	/* 8192 cycles prior to first SCCB transaction */
> > +	delay_us = ov8856_cal_delay(8192);
> 
> If we pass a constant to the function and the function itself only uses
> constants inside, could we just define a constant delay instead?
> 

This calculation refers to powering up sequence in datasheet.
Did you mean using usleep_range() directly?

> > +	usleep_range(delay_us  * 2, delay_us * 4);
> 
> Normally one one just give some small delta here, like +/- 100 us.
> 

Fixed in next release.

> > +
> > +	return 0;
> > +
> > +disable_clk:
> > +	clk_disable_unprepare(ov8856->xvclk);
> > +
> > +	return ret;
> > +}
> > +
> > +static void __ov8856_power_off(struct ov8856 *ov8856)
> > +{
> > +	clk_disable_unprepare(ov8856->xvclk);
> > +	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > +
> > +	regulator_bulk_disable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> > +}
> > +
> >  static int __maybe_unused ov8856_suspend(struct device *dev)
> >  {
> >  	struct i2c_client *client = to_i2c_client(dev);
> > @@ -915,8 +1459,8 @@ static int __maybe_unused ov8856_suspend(struct device *dev)
> >  	struct ov8856 *ov8856 = to_ov8856(sd);
> >  
> >  	mutex_lock(&ov8856->mutex);
> > -	if (ov8856->streaming)
> > -		ov8856_stop_streaming(ov8856);
> > +
> > +	__ov8856_power_off(ov8856);
> 
> This change is incorrect because it will power off even if the device was
> already powered off, causing reference count mismatch. The original code
> was okay.
> 

Then do we need to power off sensor per power off sequence?
I thought this function would be called by pm_runtime_put when power
count is 0.

> >  
> >  	mutex_unlock(&ov8856->mutex);
> >  
> > @@ -1089,6 +1633,20 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
> >  		return -ENXIO;
> >  	}
> >  
> > +	/* set R3614 to distinguish harward versions */
> 
> hardware
> 

Sorry for the typo.
Fixed in next release.

> > +	ret = ov8856_update_otp_reg(ov8856);
> > +	if (ret) {
> > +		dev_err(&client->dev, "failed to set otp register");
> > +		return ret;
> > +	}
> > +
> > +	ret = ov8856_read_reg(ov8856, OV8856_OTP_REG,
> > +			      OV8856_REG_VALUE_08BIT, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ov8856->is_1B_module = (val == OV8856_1B_MODULE) ? 1 : 0;
> 
> I'd rename ov8856_update_otp_reg() to ov8856_check_revision() and move the
> few lines above to that function too.
> 

Fixed in next release.

> > +
> >  	return 0;
> >  }
> >  
> > @@ -1164,11 +1722,27 @@ static int ov8856_remove(struct i2c_client *client)
> >  	media_entity_cleanup(&sd->entity);
> >  	v4l2_ctrl_handler_free(sd->ctrl_handler);
> >  	pm_runtime_disable(&client->dev);
> > +	if (!pm_runtime_status_suspended(&client->dev))
> > +		__ov8856_power_off(ov8856);
> > +	pm_runtime_set_suspended(&client->dev);
> >  	mutex_destroy(&ov8856->mutex);
> >  
> >  	return 0;
> >  }
> >  
> > +static int ov8856_configure_regulators(struct ov8856 *ov8856)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > +	int i;
> > +
> > +	for (i = 0; i < OV8856_NUM_SUPPLIES; i++)
> > +		ov8856->supplies[i].supply = ov8856_supply_names[i];
> > +
> > +	return devm_regulator_bulk_get(&client->dev,
> > +				       OV8856_NUM_SUPPLIES,
> > +				       ov8856->supplies);
> > +}
> 
> There is not much value in having a dedicated function just to call one
> more function. Could you move back to the caller?
> 

Fixed in next release.

> > +
> >  static int ov8856_probe(struct i2c_client *client)
> >  {
> >  	struct ov8856 *ov8856;
> > @@ -1186,6 +1760,40 @@ static int ov8856_probe(struct i2c_client *client)
> >  		return -ENOMEM;
> >  
> >  	v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
> > +
> > +	ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> > +	if (IS_ERR(ov8856->xvclk)) {
> > +		dev_err(&client->dev, "Failed to get xvclk\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_FREQ);
> 
> We should get the frequency from the DT bindings.
> 

Fixed in next release.

> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "Failed to set xvclk rate (24MHz)\n");
> > +		return ret;
> > +	}
> > +	if (clk_get_rate(ov8856->xvclk) != OV8856_XVCLK_FREQ)
> > +		dev_warn(&client->dev,
> > +			 "xvclk mismatched, modes are based on 24MHz\n");
> > +
> > +	ov8856->reset_gpio = devm_gpiod_get(&client->dev,
> > +					    "reset",
> > +					    GPIOD_OUT_LOW);
> > +	if (IS_ERR(ov8856->reset_gpio)) {
> > +		dev_err(&client->dev, "Failed to get reset-gpios\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = ov8856_configure_regulators(ov8856);
> > +	if (ret) {
> > +		dev_err(&client->dev, "Failed to get power regulators\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = __ov8856_power_on(ov8856);
> > +	if (ret)
> > +		goto probe_error_v4l2_ctrl_handler_free;
> > +
> >  	ret = ov8856_identify_module(ov8856);
> >  	if (ret) {
> >  		dev_err(&client->dev, "failed to find sensor: %d", ret);
> > @@ -1251,11 +1859,21 @@ static const struct acpi_device_id ov8856_acpi_ids[] = {
> >  MODULE_DEVICE_TABLE(acpi, ov8856_acpi_ids);
> >  #endif
> >  
> > +#if IS_ENABLED(CONFIG_OF)
> > +static const struct of_device_id ov8856_of_match[] = {
> > +	{ .compatible = "ovti,ov8856" },
> > +	{},
> > +};
> > +
> 
> nit: Unnecessary blank line.
> 

Fixed in next release.

> Best regards,
> Tomasz


