Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC98F428CEA
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 14:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236541AbhJKMV5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 11 Oct 2021 08:21:57 -0400
Received: from ni.piap.pl ([195.187.100.5]:52996 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234762AbhJKMV4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 08:21:56 -0400
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
References: <m3fstfoexa.fsf@t19.piap.pl>
        <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
Date:   Mon, 11 Oct 2021 14:19:53 +0200
In-Reply-To: <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain> (Jacopo Mondi's
        message of "Sat, 9 Oct 2021 12:24:46 +0200")
Message-ID: <m3mtnflpna.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jacopo Mondi <jacopo@jmondi.org> writes:

>> The driver has been extensively tested in an i.MX6-based system.
>
> That's a give for code submitted for inclusions, right ? right ??? :)

Of course not :-)

Untested code is submitted - and merged - all the time.
For example, you can't test the code if you don't have access to the
respective hardware.

IMO this is right. The change should be applied if it's an overall
improvement (statistically), otherwise the development would stall.

It means someone has to fix possible fallout, sure. I've done such fixes
many times (as I have some quite unique hw), and I still think it's
right.

> Which frame sizes have you tested it with ? I know from the code the
> driver supports a single mode, but if you want to add these
> information to the commit message I would report it.

The driver is quite flexible, I was using mostly modes like 2560x1440
and 2560x1920, but not only these. p25 rather than p30, though.

>> +#define AR0521_EXTCLK_RATE	  (27 * 1000 * 1000)
>
> You try to set the external clock to this frequency, but your PLL code
> does not rely on this value being actually set, am I wrong ? So why
> would you try to change it in first place ?

Change from what?
This is used to clk_set_rate(sensor->extclk, AR0521_EXTCLK_RATE);
Do you want me to skip this step? What clock (if any) would I get then?

> Be consistent with comments starting with capital or lowercase
> letters. It's usually "start with capital letter, end with full stop."

I try to make them as good as I can, instead of blindly following
anything, but I will review the comments of course.

>> +#define AR0521_TOTAL_WIDTH_MIN	     2968u
>
> Isn't this TOTAL_WIDTH_MAX ?

No:
total_width = max(sensor->fmt.width + AR0521_WIDTH_BLANKING_MIN, AR0521_TOTAL_WIDTH_MIN);
But this needs verifying.

> You won't like this as it will require quite some changes, but we use
> lowercase letters for hexadecimal values.

Define "we" :-)
For me, uppercase hex digits are more visible. Perhaps because they are
full height? Sight problems maybe.

>> +#define   AR0521_REG_RESET_DEFAULTS		  0x0238
>
> By default BIT(5) is 0. Should this be 0x0218 ?

reset_lpf_enable
To prevent reset from POR glitch, enable digital low pass filter.

Why do think it should be 0?

>> +	struct v4l2_mbus_framefmt fmt;
>> +	struct v4l2_fract frame_interval, current_frame_interval;
>
> As a general rule one variable per line. Even more so in structures
> declaration.

Why?

>> +static int ar0521_write_regs(struct ar0521_dev *sensor, const __be16 *data, unsigned int count)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	struct i2c_msg msg;
>> +	int ret;
>> +
>> +	if (!pm_runtime_get_if_in_use(&client->dev))
>> +		return 0;
>
> Oh, in my previous email I commented looking at v4 probably, not v5.
>
> Anyway, I feel this check should really be in the caller.

There are multiple callers - the code would get more complicated which
is bad.

> Also, does this cause a power up/down sequence for every transaction ?

No. Why would it?
If I get this right (and the tests support it), this fragment would
return if not in use (= not powered up).

> You could write them one register at the time so that you could
[]
> at the expense of one transaction per register write (like you do when
> you write initial_reg[]). Sounds like a little price to pay for a
> nicer driver but I might be underestimating it (or being to concerned
> about the use of be() everywhere :)

Even on otherwise idle I2C bus this would add unnecessary latency.
I prefer to have a much faster code, even if using that be() macro
(which isn't ugly IMHO).
For example, at 100 kb/s, the most common rate, transferring the
pixel_timing_recommended[] only should normally take about 50 ms
(depends on the controller and if it adds any/long inter-byte delays).
With single transfers, instead of 16-bit per registers, you have to send
start, devsel, 16-bit address, 16-bit value and stop. This could easily
mean 150 ms total (much more with slow controller). Do we want to add
100 ms of latency only to get rid of the "ugly" macro? I don't think so.

On a busy bus (or e.g. "realtime"), the short writes would be
a disaster (and even with the long ones it isn't obvious).

> I had to add
>
> 	__be16 timings[] = {
> 		be(0x3002),	be(y),
> 		/* 0x3004 */	be(x),
> 		/* 0x3006 */	be(y + sensor->fmt.height - 1),
> 		/* 0x3008 */	be(x + sensor->fmt.width - 1),
> 		/* 0x300a */	be(sensor->total_height),
> 		/* Documented as 'twice the number of pixel clocks in one row' */
> 		/* 0x300c */	be(2 * sensor->total_width),
> 	};
> 	ar0521_write_regs(sensor, timings, ARRAY_SIZE(timings));
>
> To this function to be able to get images out from the sensor.

Interesting. I don't write them via 0x3002 but use 0x340 (the primary
ones) instead, in set_geometry(). But then, the total_width, perhaps
I calculate it incorrectly (the 2x factor) and thus it doesn't work in
certain modes. I don't remember why it's done the ways it is, will have
to look at it.
I understand what you use is 1920x1080p30, right?

> Also, be careful about register 0x300c which you don't seem to program
> at the moment.

I do, it's register 0x342.

> And it seems the integration time depends on this register value
>
>         - CIT = 0x3012
>         - LLPCK = 1/2 × reg_300C
>         - Integration Time = (CIT × LLPCK) / pix_clk
>
> Are you able to control exposure properly with your version ?

Definitely.

>> +static int ar0521_set_gains(struct ar0521_dev *sensor)
>> +{
>> +	int green = sensor->ctrls.gain->val;
>> +	int red = max(green + sensor->ctrls.red_balance->val, 0);
>> +	int blue = max(green + sensor->ctrls.blue_balance->val, 0);
>
> unsigned ?

The ctrls.* (R and B) can be negative. I'm not sure mixing types here
would be the right thing (I'd have to check with the C standard, and
anyone reading this later would probably need it as well).
With signed ints it's simply correct.

>> +	unsigned int gain = min(red, min(green, blue));
>> +	unsigned int analog = min(gain, 64u); // range is 0 - 127
>
> Nit: when possible declare variables in reverse xmas-tree order

Not very possible here, right? Unless you want to split into
declarations and calculations. Readability IMHO suffers.

>> +static int ar0521_write_mode(struct ar0521_dev *sensor)
>> +{
>> +	__be16 pll_regs[] = {
>> +		be(AR0521_REG_VT_PIX_CLK_DIV),
>> +		/* 0x300 */ be(4), // vt_pix_clk_div = number of bits / 2
>> +		/* 0x302 */ be(1), // vt_sys_clk_div
>> +		/* 0x304 */ be((sensor->pll_pre2 << 8) | sensor->pll_pre),
>> +		/* 0x306 */ be((sensor->pll_mult2 << 8) | sensor->pll_mult),
>> +		/* 0x308 */ be(8), // op_pix_clk_div = 2 * vt_pix_clk_div
>> +		/* 0x30A */ be(1)  // op_sys_clk_div
>> +	};
>> +	u32 num = sensor->current_frame_interval.numerator;
>> +	u32 denom = sensor->current_frame_interval.denominator;
>> +	int ret;
>> +
>> +	dev_dbg(&sensor->i2c_client->dev, "%s()\n", __func__);
>
> tracepoints debug are not that useful if they do not report what has
> been written, aren't they ?

This is only to see what the upper layer is doing. I have already
removed (moved to private commit) the I2C write debug routine. Out of
sight, out of mind :-(

> I comment here but that's mostly about the exposure control
> definition. You initialize it with a value of 1, which means 1 line of
> exposure which result in very dark images. I know userspace should be
> in control of this, but a more sensible default value should probably
> be used. Do you have a 'default' mode ? Could you set the default
> exposure to something a bit larger (I know it's hard to define what a
> sensible value could be, but 1 line is certainly very small)

What do you propose?
I'm using automatic exposure, the application reads the whole image and
decides.

>> +	ret = ar0521_write_reg(sensor, AR0521_REG_RESET, AR0521_REG_RESET_DEFAULTS | AR0521_REG_RESET_STREAM);

> This part I don't get. As far as I can see and can read, setting the
> AR0521_REG_RESET_STREAM bit in AR0521_REG_RESET_DEFAULTS as the effect
> of:
>
> Setting this bit places the sensor in streaming mode.
> Clearing this bit places the sensor in a low power mode. The result of clearing
> this bit depends upon the operating mode of the sensor. Entry and exit from
> streaming mode can also be controlled from the signal interface
>
> I would have expected to see this bit set/cleared at s_stream() time
> (I've done so and things work better, otherwise I get crippled
> images).

This is needed for operation with i.MX6 CSI. Apparently the i.MX6
doesn't like the low power state of the sensor, it needs the LP-11 (low
power with both LVDS lines high) on all data and clock lanes before
the stream is started.

When you disable streaming, the clock lanes are apparently in LP-11
state, however data lanes are LP-00.

>> +	ret = ar0521_write_reg(sensor, AR0521_REG_TEST_PATTERN_MODE, sensor->ctrls.test_pattern->val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_dbg(&sensor->i2c_client->dev,
>> +		"AR0521: %ux%u, total %ux%u, pixel clock %u MHz, %u (%u/%u) FPS\n",
>> +		sensor->fmt.width, sensor->fmt.height, sensor->total_width, sensor->total_height,
>> +		sensor->pix_clk, (num + denom / 2) / denom, num, denom);
>
> Empty line before return statements

Why?

>> +		// normal output on clock and data lanes
>> +		ret = ar0521_write_reg(sensor, AR0521_REG_HISPI_CONTROL_STATUS, 0);
>
> This register controls the HiSPI interface while my understanding is
> that everything is MIPI CSI-2 in the rest of the driver. Why is it
> here ? does it play any role in your setup ?

Yes, it also controls MIPI mode.

>> +	// start streaming (possibly with LP-11 on all lines)
>
> So you fall down here even in the case s_stream(0) ?
>
>> +	return ar0521_write_reg(sensor, AR0521_REG_RESET,
>> +				AR0521_REG_RESET_DEFAULTS |
>> +				AR0521_REG_RESET_RESTART |
>> +				AR0521_REG_RESET_STREAM);
>> +}

That's correct. It's the only way I have found.

> Before introducing 0x300c I got 30 FPS but the frame content was
> mangled (or completely black)

This could be due to the line_length_pck/line_length_pck_ (0x342/0x300C)
register. I will look at it.
TBH I've written this driver in 2017 (didn't have time for the whole
submission process back then, not that the situation changed much).
This means I will have to check the details.

>> +static int ar0521_set_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
>> +			  struct v4l2_subdev_format *format)
>> +{
>> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
>> +	int ret = 0;
>> +
>> +	dev_dbg(&sensor->i2c_client->dev, "%s(%u)\n", __func__, format->which);
>> +
>> +	ar0521_adj_fmt(&format->format);
>> +
>> +	mutex_lock(&sensor->lock);
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>> +		struct v4l2_mbus_framefmt *fmt;
>> +
>> +		fmt = v4l2_subdev_get_try_format(sd, sd_state, 0 /* pad */);
>> +		*fmt = format->format;
>> +	} else {
>> +		sensor->fmt = format->format;
>> +		ar0521_calc_mode(sensor);
>> +		ret = ar0521_write_mode(sensor);
>
> Do you need to do so ? the mode is programmed at s_stream() time,
> isn't it enough ? Same for the other call to write_mode() above or
> set_geometry() below.

I wonder if you can call set_fmt() etc. when the sensor is streaming.
Why not?

>> +	// manual gain
>> +	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 511, 1, 0);
>> +	ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_RED_BALANCE, -512, 511, 1, 0);
>> +	ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BLUE_BALANCE, -512, 511, 1, 0);
>
> Seems like you handle these together, should these be clusters ? Same
> for the blankings

An example maybe? A file, existing driver maybe?

>> +	// alternate for frame interval
>> +	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, AR0521_WIDTH_BLANKING_MIN, 4094, 1, AR0521_WIDTH_BLANKING_MIN);
>> +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, AR0521_HEIGHT_BLANKING_MIN, 4094, 2, AR0521_HEIGHT_BLANKING_MIN);
>
> How nicer would this be in 80-cols ? :)

Depends on one's display window :-)
I can change these ones I guess.

>> +static __be16 pixel_timing_recommended[] = {
>
> Have you got any idea what these do ? I have these registers not
> documented.

Unfortunately I know nothing about these.

>> +	// set MIPI test mode - disabled for now
>> +	ret = ar0521_write_reg(sensor, AR0521_REG_HISPI_TEST_MODE,
>> +			       ((0x40 << sensor->lane_count) - 0x40) | AR0521_REG_HISPI_TEST_MODE_LP11);
>
> As far as I can tell this write has no effect.

That's right :-)
It will have its effect later, when the AR0521_REG_HISPI_CONTROL_STATUS
is written.

> Define test mode to be applied to mipi/ccp interface if test_en is asserted
>
> and asfaict you never assert test_en

I do, it's called
AR0521_REG_HISPI_CONTROL_STATUS_FRAMER_TEST_MODE_ENABLE and it simply
won't work on i.MX6 without this.

>> +	if (ret)
>> +		goto off;
>> +
>> +	ret = ar0521_write_reg(sensor, AR0521_REG_ROW_SPEED, 0x110 | 4 / sensor->lane_count);
>
> I wasn't able to interpret this register right
>
> pc_speed
> Slows down the internal pixel clock frequency relative to the system
> clock frequency.  A programmed value of N gives a pixel clock period
> of N system clocks.  Only values 1, 2 and 4 are supported.
>
> Shouldn't this be part of the PLL calculation ?

Well, this doesn't seem to be part of the PLL, and it's constant (as
long as MIPI lane# is constant). Why do you think it belongs there?

You know, I try not to throw unnecessary traffic at I2C bus, too.

>> +static const struct v4l2_subdev_core_ops ar0521_core_ops = {
>> +	.log_status = v4l2_ctrl_subdev_log_status,
>> +	.s_power = ar0521_s_power,
>> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
>
> I easily get lost when it's about event, but they do not seem to be
> supported by the driver

TBH, I don't know. It's what other driver(s) do.

>> +static int __maybe_unused ar0521_suspend(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
>> +
>> +	if (sensor->streaming)
>> +		ar0521_set_stream(sensor, 0);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused ar0521_resume(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
>> +
>> +	if (sensor->streaming)
>> +		return ar0521_set_stream(sensor, 1);
>> +
>> +	return 0;
>> +}
>
> Shouldn't suspend/resume do what your s_power does instead of just
> stopping/starting the streaming ?

That's what imx219 driver does. TBH I don't know how is it all supposed
to work. The system I'm using this with has no real suspend/resume
capability. Sakari has suggested that I look at imx219 and so I did.

>> +	sensor->i2c_client = client;
>> +	sensor->fmt.code = MEDIA_BUS_FMT_SGRBG8_1X8;
>> +	sensor->fmt.width = AR0521_WIDTH_MAX;
>> +	sensor->fmt.height = AR0521_HEIGHT_MAX;
>> +	sensor->fmt.field = V4L2_FIELD_NONE;
>> +	sensor->frame_interval.numerator = 30;
>> +	sensor->frame_interval.denominator = 1;
>
> isn't this what adj_fmt() does ?

Partially, it is.

>> +static int ar0521_remove(struct i2c_client *client)
>> +{
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
>> +
>> +	v4l2_async_unregister_subdev(&sensor->sd);
>> +	media_entity_cleanup(&sensor->sd.entity);
>> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>> +	pm_runtime_disable(&client->dev);
>> +	pm_runtime_set_suspended(&client->dev);
>
> set_suspended() then disable maybe ?

Other drivers seem to do it the above way but I don't know the
difference.
-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
