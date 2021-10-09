Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BDB427843
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 11:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbhJIJJB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 05:09:01 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:38369 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbhJIJJA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Oct 2021 05:09:00 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 101E2C0003;
        Sat,  9 Oct 2021 09:07:00 +0000 (UTC)
Date:   Sat, 9 Oct 2021 11:07:49 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
Message-ID: <20211009090749.hujuwamgkjw2tfcx@uno.localdomain>
References: <m3fstfoexa.fsf@t19.piap.pl>
 <YV3YkXAKxiLmPYwL@valkosipuli.retiisi.eu>
 <m3zgrlkxn6.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3zgrlkxn6.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

   I've been testing this driver in the last few days, thanks for your
effort in upstreaming it!

I'll separately comment on what I had to change to have it working for
my use case, but let me continue the discussion from where it was left
pending here to add my 2 cents.

On Thu, Oct 07, 2021 at 11:11:09AM +0200, Krzysztof Hałasa wrote:
> Hi Sakari,
>
> Thanks for your input.
>
> > Where's the corresponding DT binding patch? Ideally it would be part of the
> > same set.
>
> Well I've sent it a moment before this one. Will make them a set next
> time.
>
> >> +#define AR0521_WIDTH_BLANKING_MIN     572u
> >> +#define AR0521_HEIGHT_BLANKING_MIN     28u // must be even
> >
> > Please use /* */ for comments. The SPDX tag is an exception.
>
> As far as I know, this is no longer the case, the C99 comments are now
> permitted and maybe even encouraged. Or was I dreaming?
>
> checkpatch doesn't protest either.

To my understanding the C99 standard added support for the //
commenting style and tollerate them, but they're still from C++ and I
see very few places where they're used in the kernel, and per as far I
know they're still not allowed by the coding style
https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting

Looking at how you used comments in the driver I think you could get
rid of most // comments easily, the register tables might be an
exception but I would really try to remove them from there as well.


>
> > Please wrap your lines at 80 or earlier, unless a sound reason exists to do
> > otherwise.
>
> This limitation appears to be lifted as well, after all those years.
> Is there a specific reason to still use it here? Yes, lines longer than
> 80 chars make the code much more readable (for my eyes, at least).
> Yes, I know there is some "soft" limit, and I trim lines when it makes
> them better in my opinion.
>

In my personal opinion lifting that restriction caused more pain than
anything, as different subsystem are now imposing different
requirements. Here everything has been so far pretty strict about
going over 80-cols, but I think there are situation where it makes
sense in example

static int a_very_long_function_name(struct a_long_struct_name with_a_long_list_of_args)
{

}

Would read bad if written

static int
a_very_long_function_name(
        struct a_long_struct_name with_a_long_list_of_args)
{

}

but here you have multiple cases where it would be very easy to stay
in the 80 cols limit

	ret = ar0521_write_regs(sensor, pixel_timing_recommended, ARRAY_SIZE(pixel_timing_recommended));
	if (ret)
		goto off;


should be

	ret = ar0521_write_regs(sensor, pixel_timing_recommended,
                                ARRAY_SIZE(pixel_timing_recommended));
	if (ret)
		goto off;

The register tables again could easily be shrinked in 80 cols (also
because you have them in two different styles).

My suggestion is: aim to 80 cols whenever possible, if it forces you
to do things like the above shown function declaration you can go a
little over that

As reported here
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144
if you go over 100 you should ask yourself what are you doing :)

> >> +static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
> >> +{
> >> +	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> >> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> >> +	int ret;
> >> +
> >> +	// v4l2_ctrl_lock() locks our own mutex
> >> +
> >> +	dev_dbg(&sensor->i2c_client->dev, "%s(0x%X)\n", __func__, ctrl->id);
> >
> > Please make sure the sensor is powered on before accessing it. See e.g.
> > imx219_set_ctrl() how to do this.
>
> I do, the lower-level IO function ar0521_write_regs() checks for this.

yes it returns immediately

        if (!sensor->power_count)
		return 0;

But I would rather move to runtime_pm and

         if (!pm_runtime_get_if_in_use(&client->dev))
                    return 0;

at the very beginning of s_ctrl and call __v4l2_ctrl_handler_setup()
at s_stream() time to apply the cached controls values before
streaming starts

> However, I identified a case when pm_runtime_* isn't available
> (CONFIG_*), so I will post corrected patch.
>
> > Please drop the s_power callback and rely on runtime PM.
>
> Ok
>
> > Please drop *frame_interval() callbacks. See
> > https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html for an
> > explanation.
> >
> > Let me know if you have questions.
>
> I already wrote about this, you must have missed it:
>
> ...However, it apparently isn't as flexible as *frame_interval() -
> I can't control the precise timings:
> - the V4L2_CID_PIXEL_RATE is discrete and R/O (i.e. the application
>   can't control it)
> - even if I could somehow control pixel rate, frame interval is
>   calculated as (width + h_blanking) * (height + v_blanking) /
>   pixel_rate, which may be a bit coarse for precise video.
>   With *frame_interval(), I compensate with per-frame "extra" delay
>   (in single pixels, not whole H or V lines).
>
> If the (userspace) application can control pixel rate and the "extra"
> timing (well maybe pixel rate and the total number of pixels including
> blanking and "extra") then I would be more than happy dropping
> frame_interval().
>
> I guess I could easily do that myself, if there is consensus about it.
>
> E.g. V4L2_CID_PIXEL_RATE would not be forced R/O (and discrete) anymore
> and I would invent a V4L2_CID_TOTAL_PIXELS or something.
>
> The V4L2_CID_PIXEL_RATE issue may be somehow offset by the
> V4L2_CID_LINK_FREQ, but the latter is "menu" type and thus not very
> useful (am I to populate it with 250 values 1 MHz apart?).
>
> Perhaps the receiver could publish it's input frequency range instead,
> then the transmitter would set a fixed value? I don't know. And this
> doesn't cover a case where the user needs a slower rate than max(tx, rx)
> for some reason.
>
> We should decide something about this, though.

The sensor frame rate is configured by userspace by changing the
blankings through the V4L2_CID_[VH]BLANK.

You are right the current definition is akward to work with, as there
is no way to set the 'total pixels' like you have suggested, but it's
rather userspace that knowing the desired total sizes has to compute
the blankings by subtracting the visible sizes (plus the mandatory min
blanking sizes).

Thanks
   j

>
> I look forward for your comments,
> --
> Krzysztof "Chris" Hałasa
>
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
