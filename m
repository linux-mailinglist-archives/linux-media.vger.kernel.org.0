Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF5D424FC5
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 11:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240438AbhJGJNK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 7 Oct 2021 05:13:10 -0400
Received: from ni.piap.pl ([195.187.100.5]:34414 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232629AbhJGJNI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Oct 2021 05:13:08 -0400
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
References: <m3fstfoexa.fsf@t19.piap.pl>
        <YV3YkXAKxiLmPYwL@valkosipuli.retiisi.eu>
Date:   Thu, 07 Oct 2021 11:11:09 +0200
In-Reply-To: <YV3YkXAKxiLmPYwL@valkosipuli.retiisi.eu> (Sakari Ailus's message
        of "Wed, 6 Oct 2021 20:10:41 +0300")
Message-ID: <m3zgrlkxn6.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for your input.

> Where's the corresponding DT binding patch? Ideally it would be part of the
> same set.

Well I've sent it a moment before this one. Will make them a set next
time.

>> +#define AR0521_WIDTH_BLANKING_MIN     572u
>> +#define AR0521_HEIGHT_BLANKING_MIN     28u // must be even
>
> Please use /* */ for comments. The SPDX tag is an exception.

As far as I know, this is no longer the case, the C99 comments are now
permitted and maybe even encouraged. Or was I dreaming?

checkpatch doesn't protest either.

> Please wrap your lines at 80 or earlier, unless a sound reason exists to do
> otherwise.

This limitation appears to be lifted as well, after all those years.
Is there a specific reason to still use it here? Yes, lines longer than
80 chars make the code much more readable (for my eyes, at least).
Yes, I know there is some "soft" limit, and I trim lines when it makes
them better in my opinion.

>> +static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
>> +	int ret;
>> +
>> +	// v4l2_ctrl_lock() locks our own mutex
>> +
>> +	dev_dbg(&sensor->i2c_client->dev, "%s(0x%X)\n", __func__, ctrl->id);
>
> Please make sure the sensor is powered on before accessing it. See e.g.
> imx219_set_ctrl() how to do this.

I do, the lower-level IO function ar0521_write_regs() checks for this.
However, I identified a case when pm_runtime_* isn't available
(CONFIG_*), so I will post corrected patch.

> Please drop the s_power callback and rely on runtime PM.

Ok

> Please drop *frame_interval() callbacks. See
> https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html for an
> explanation.
>
> Let me know if you have questions.

I already wrote about this, you must have missed it:

...However, it apparently isn't as flexible as *frame_interval() -
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

I look forward for your comments,
-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
