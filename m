Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3284A3FB1DB
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 09:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbhH3HXQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 03:23:16 -0400
Received: from ni.piap.pl ([195.187.100.5]:47826 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233598AbhH3HXP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 03:23:15 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id D0617C3F3EF0;
        Mon, 30 Aug 2021 09:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl D0617C3F3EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1630308138; bh=SCGmbcYdJKVCBdyQvoAWHAybI7KZLG7qGpNVJpT7pe4=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=fxMGG3bvGjXIIsjmFahtwEw5lKnaA3vreNR+rqzLs9kcYPfnoqkNJKT3Wt5ZAKUQ8
         InVFMZyRibz4c8y6B/Rtg0xGDsxE7X9LVjBLan0l6nqAlVCvEJcEk746yPczP5NX1b
         rlWxkRaPia7VsXEtNlv0Ks6bpOguEJI4LeaBmzwA=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4] Driver for ON Semi AR0521 camera sensor
References: <m3im0s9rks.fsf@t19.piap.pl>
        <YR01VfIM5o1PmcWY@valkosipuli.retiisi.eu>
Sender: khalasa@piap.pl
Date:   Mon, 30 Aug 2021 09:22:17 +0200
In-Reply-To: <YR01VfIM5o1PmcWY@valkosipuli.retiisi.eu> (Sakari Ailus's message
        of "Wed, 18 Aug 2021 19:29:09 +0300")
Message-ID: <m3y28jwg5y.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, license restriction
X-KLMS-AntiPhishing: not scanned, license restriction
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, license restriction
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

thanks for looking at the patch.

Sakari Ailus <sakari.ailus@iki.fi> writes:

> Over 80, please wrap. The same applies to the rest of the driver.

Thought this limit was finally lifted, after all those years?
Didn't it waste everyone's screen space?

>> +#define be		cpu_to_be16
>
> I think you could as well use the original macro.

There are lots of it, and - especially with the 80-column restriction -
it would be much much less readable. The readability is important, yes?

>> +
>> +// regulator supplies
>
> Please use C comments outside SPDX tags. This comment is redundant
> though.

Thought // comments are now finally allowed (and encouraged when they
make sense)?

>> +static int debug;
>> +module_param(debug, int, 0644);
>> +MODULE_PARM_DESC(debug, "Debug level 0-3");
>
> Could you rely on dynamic debug instead?

I will look at it.

>> +static int ar0521_set_gains(struct ar0521_dev *sensor)
>> +{
>> +	int green =3D sensor->ctrls.gain->val;
>> +	int red =3D max(green + sensor->ctrls.red_balance->val, 0);
>> +	int blue =3D max(green + sensor->ctrls.blue_balance->val, 0);
>> +	unsigned int gain =3D min(red, min(green, blue));
>> +	unsigned int analog =3D min(gain, 64u); // range is 0 - 127
>> +	__be16 regs[5];
>> +
>> +	v4l2_dbg(2, debug, &sensor->sd, "%s()\n", __func__);
>> +
>> +	red   =3D min(red   - analog + 64, 511u);
>> +	green =3D min(green - analog + 64, 511u);
>> +	blue  =3D min(blue  - analog + 64, 511u);
>> +	regs[0] =3D be(AR0521_REG_GREEN1_GAIN);
>> +	regs[1] =3D be(green << 7 | analog);
>> +	regs[2] =3D be(blue  << 7 | analog);
>> +	regs[3] =3D be(red   << 7 | analog);
>> +	regs[4] =3D be(green << 7 | analog);
>
> I think I'd use u16 for red, green and blue. Shifting signed integers can
> result in undefined behaviour (MSB).

I think you mean signed ints could be negative. However, in this case, a
negative value would be a bug, shifted or not, and copied into u16 or
staying in ordinary int. Shifting a (non-negative and in range) signed
int is a defined behaviour, though.

Let's see if any of them can be negative.
G, R and B are originally non-negative (control ranges).
Gain is the minimum of them (and is unsigned) thus non-negative.
Analog is min(gain, 64) thus non-negative as well (range is 0 to 64).
(- analog + 64) is thus non-negative, and so are final R G B.

I could use some cast here, yes. However I don't think it would serve
a useful purpose - either the original value is valid and non-negative
(so the shift is not a problem) or it's negative and the u16 isn't going
to help.

> Could you simply print the frequency in Hz?

I could, but I consider it much less readable.
Compare 24 MHz with 24000000 Hz.
I can put stuff like this in my private branch, though.

>> +#define DIV 4
>
> What does DIV signify?

It's a divider in the PLL. IIRC it's fixed at 4 for 8-bit sensor mode
but would need to be changed to 5 and 6 in 10- and 12-bit modes (which
the driver doesn't support ATM).

>> +		// try to reduce the numbers a bit
>> +		for (cnt =3D 2; cnt * cnt < denom; cnt++)
>
> Braces would be nice here.

You mean (cnt * cnt) < denom?
Are you sure?

Or perhaps you mean the following?
>> +			while (num % cnt =3D=3D 0 && denom % cnt =3D=3D 0) {


>> +static int ar0521_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_st=
ate *sd_state,
>> +			  struct v4l2_subdev_format *format)
>> +{
>> +	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	if (format->pad)
>> +		return -EINVAL;
>
> The caller has already checked for this as I understand you have a single
> pad only (0).

I do. Didn't know it's already checked.

>> +static void ar0521_power_off(struct ar0521_dev *sensor)
>> +{
>> +	int i;
>
> unsigned int?

The variable goes negative eventually:

>> +	for (i =3D AR0521_NUM_SUPPLIES - 1; i >=3D 0; i--) {
                                          ^^^^^^^^^^^
>> +	if (on) {
>> +		if (!sensor->power_count++) {
>> +			int ret =3D ar0521_power_on(sensor);
>
> Could you instead use runtime PM? See e.g. the imx319 driver for an
> example.

Will have a look.

> Virtually all new sensor drivers use the blanking controls to configure t=
he
> frame rate. Could you do the same?

I do :-)
However, it apparently isn't as flexible as *frame_interval() -
I can't control the precise timings:
- the V4L2_CID_PIXEL_RATE is discrete and R/O (i.e. the application
  can't control it)
- even if I could somehow control pixel rate, frame interval is
  calculated as (width + h_blanking) * (height + v_blanking) /
  pixel_rate, which may be a bit coarse for precise video.
  With *frame_interval(), I compensate with per-frame "extra" delay
  (in single pixels, not whole H or V lines).

If the (userspace) application can control pixel rate and the "extra"
timing (well maybe pixel rate and the total number of pixels including
blanking and "extra") then I would be more than happy dropping
frame_interval().

I guess I could easily do that myself, if there is consensus about it.

E.g. V4L2_CID_PIXEL_RATE would not be forced R/O (and discrete) anymore
and I would invent a V4L2_CID_TOTAL_PIXELS or something.

The V4L2_CID_PIXEL_RATE issue may be somehow offset by the
V4L2_CID_LINK_FREQ, but the latter is "menu" type and thus not very
useful (am I to populate it with 250 values 1 MHz apart?).

Perhaps the receiver could publish it's input frequency range instead,
then the transmitter would set a fixed value? I don't know. And this
doesn't cover a case where the user needs a slower rate than max(tx, rx)
for some reason.

We should decide something about this, though.

>> +	sensor->extclk_freq =3D clk_get_rate(sensor->extclk);
>> +
>> +	if (sensor->extclk_freq < AR0521_EXTCLK_MIN ||
>> +	    sensor->extclk_freq > AR0521_EXTCLK_MAX) {
>
> This is obviously the frequency range the device supports, but what is
> assumed in the register lists? In other words, you should check for a
> specific frequency.

Not sure what do you mean. Nothing is assumed, AR0521_EXTCLK_RATE
(27 MHz) is requested first, and the resulting value (different than
27 MHz on my system) is checked to see if it's supported by the chip.
Then the actual value is used for calculations.

Now I wonder if the clock rate can change after the driver is
initialized (because some other driver wants a different clock and they
are shared somehow)?

>> +	dev_info(dev, "AR0521 driver initialized, master clock frequency: %s M=
Hz, %u MIPI data lanes\n",
>> +		 mhz(sensor->extclk_freq), nlanes);
>
> I'd use dev_dbg(), if anything.

I need some regular feedback from the driver here, but I can keep it in
my private trivial branch.

Thanks,
and looking forward for your comments.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
