Return-Path: <linux-media+bounces-17163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FD1964C85
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 19:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7481F21DFD
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 17:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A899B1B7911;
	Thu, 29 Aug 2024 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hqhpzs60"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9451B78E8;
	Thu, 29 Aug 2024 17:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724950853; cv=none; b=iTqCEfx26FGvZLrXh2CKxiZn6xMNEA1ou9f8TAAByK2PI3B+IpdQrRz2cLBt62LJuirpuUCZ70OQT9qsl/hVjLqmS30APZSLZQC3+tFYs9tc8+fLrnfY2FZ9fzeZtUfxXKO6BfmOQOj4EX4Sus0kQWR7PzN37NlYPtAf1B0kWEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724950853; c=relaxed/simple;
	bh=/MdS2lronU3t1s9FxX1gp3QQpP2GD6vioGFr05Az4NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gj/5eMgkzWB6DLbku0iVi1awoNBSkrLqWsNSdxA9lkjZGb2ec8eB+kNjEf4mrT0I7zjguPG0zEWgBk1iwG0XCHi0LRTmU2S26nDI1lA26facPBro5czJL1QZZz5F+GMUOk1vv1iQMwqNKbmeGod3sTVC4X0b5kHhYY01MEMslok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hqhpzs60; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 730CC226;
	Thu, 29 Aug 2024 18:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724950780;
	bh=/MdS2lronU3t1s9FxX1gp3QQpP2GD6vioGFr05Az4NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hqhpzs6027r3z6rgQoN0w9/AHmkMfgxy5a8XOjc4yXlEeEyj5VTrQmSfvaLOA2e7l
	 f/Ud074kQOx9F+iMa2Lx19XAGcMLqSTl5k0uJGPEQQI8B0/Cqd8P2m5bBfsJGWQDLs
	 92g0LLN6hDcJJ3KN0S1zmL7YA+3OJs1digQ6C0KQ=
Date: Thu, 29 Aug 2024 20:00:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx290: Check for availability in
 probe()
Message-ID: <20240829170018.GB15799@pendragon.ideasonboard.com>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>
 <20240829131909.GD12951@pendragon.ideasonboard.com>
 <CAJpcXm59W-1OkDVC5NjLycR0FFOFVFQf0yfjCfsKztg4YUqtkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJpcXm59W-1OkDVC5NjLycR0FFOFVFQf0yfjCfsKztg4YUqtkQ@mail.gmail.com>

Hi Benjamin,

On Thu, Aug 29, 2024 at 05:36:48PM +0200, Benjamin Bara wrote:
> On Thu, 29 Aug 2024 at 15:19, Laurent Pinchart wrote:
> > On Wed, Aug 28, 2024 at 08:13:07PM +0200, Benjamin Bara wrote:
> > > Currently, the V4L2 subdevice is also created when the device is not
> > > available/connected. In this case, dmesg shows the following:
> > >
> > > [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> > > [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> > > [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> > > [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> > >
> > > which seems to come from imx290_ctrl_update() after the subdev init is
> > > finished.
> >
> > I think this should also be fixed. There should be no need to write
> > those registers at probe time. Would moving the
> > pm_runtime_mark_last_busy() and pm_runtime_put_autosuspend() calls to
> > just before imx290_subdev_init() help ?
> 
> I guess if I decrease the autosuspend delay (now 1s), it would work -
> but it feels like a hack to me. I would prefer to not call

Is decreading the autosuspend delay needed ? If you call
pm_runtime_put_autosuspend() before imx290_subdev_init(), will the
pm_runtime_get_if_in_use() call in imx290_set_ctrl() return a non-zero
value if the device hasn't been suspended yet due to the autosuspend
delay ? My understanding is that it shouldn't, unlike
pm_runtime_get_if_active().

> imx290_ctrl_update() at all during probe(). I guess the reason why it is
> done is to have sane ctrl values for link_freq, hblank and vblank.
> However, as they depend on the mode (which isn't known at that time), it
> (at least to me) doesn't make sense to just "assume" the first mode
> here.

The reason why the function is called at probe time is to centralize in
a single location all the code that computes ranges for the controls.
Otherwise, the logic would need to be duplicated in imx290_ctrl_init().
We could possibly split imx290_ctrl_update() in two functions, one that
computes the ranges and one that updates the controls, and call the
first one from imx290_ctrl_init().

> I would prefer to introduce a FREQ_INDEX_OFF with 0 here and use this as
> default, and use the ranges from the datasheet for {v,h}blank already
> when creating the controls. When the mode is decided, the blanks will be
> adapted to be in range.

That would violate the V4L2 API I'm afraid. Subdevs are supposed to have
a valid configuration at all times, including just after probe before
being configured by users.

> I can add an example in the next round, need to implement and test
> first.
> 
> > > However, as the errors are ignored, the subdev is initialized
> > > but simply does not work. From userspace perspective, there is no
> > > visible difference between a working and not-working subdevice (except
> > > when trying it out or watching for the error message).
> > >
> > > This commit adds a simple availability check before starting with the
> > > subdev initialization to error out instead.
> > >
> > > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > > ---
> > > Changes since v1:
> > > - define operating/standby mode and use it
> > > - read out the standby mode during probe and ensure it is standby
> > > ---
> > >  drivers/media/i2c/imx290.c | 17 +++++++++++++++--
> > >  1 file changed, 15 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 4150e6e4b9a6..2a869576600c 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -29,6 +29,8 @@
> > >  #include <media/v4l2-subdev.h>
> > >
> > >  #define IMX290_STANDBY                                       CCI_REG8(0x3000)
> > > +#define IMX290_STANDBY_OPERATING                     (0 << 0)
> > > +#define IMX290_STANDBY_STANDBY                               (1 << 0)
> >
> > The datasheet documents the STANDBY field as a single bit, but doesn't
> > mention an OPERATING value. I would match that, drop
> > IMX290_STANDBY_OPERATING and write
> 
> The imx290 datasheet from Arrow has it on page 35, but I can switch to
> your version if preferred :)
> 
> > #define IMX290_STANDBY_STANDBY                          BIT(0)
> >
> > >  #define IMX290_REGHOLD                                       CCI_REG8(0x3001)
> > >  #define IMX290_XMSTA                                 CCI_REG8(0x3002)
> > >  #define IMX290_ADBIT                                 CCI_REG8(0x3005)
> > > @@ -1016,7 +1018,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
> > >               return ret;
> > >       }
> > >
> > > -     cci_write(imx290->regmap, IMX290_STANDBY, 0x00, &ret);
> > > +     cci_write(imx291->regmap, IMX290_STANDBY, IMX290_STANDBY_OPERATING, &ret);
> >
> > This hunk would then be dropped.
> >
> > >
> > >       msleep(30);
> > >
> > > @@ -1029,7 +1031,7 @@ static int imx290_stop_streaming(struct imx290 *imx290)
> > >  {
> > >       int ret = 0;
> > >
> > > -     cci_write(imx290->regmap, IMX290_STANDBY, 0x01, &ret);
> > > +     cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_STANDBY, &ret);
> >
> > And this looks fine.
> >
> > The change isn't mentioned in the commit message though. I wouldn't ask
> > for a v3 just to split this, but as you need to address other issues, it
> > would be nice to have a separate patch in v3.
> 
> Yup, can do that :)
> 
> > >
> > >       msleep(30);
> > >
> > > @@ -1520,6 +1522,7 @@ static int imx290_probe(struct i2c_client *client)
> > >  {
> > >       struct device *dev = &client->dev;
> > >       struct imx290 *imx290;
> > > +     u64 val;
> > >       int ret;
> > >
> > >       imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
> > > @@ -1580,6 +1583,16 @@ static int imx290_probe(struct i2c_client *client)
> > >       pm_runtime_set_autosuspend_delay(dev, 1000);
> > >       pm_runtime_use_autosuspend(dev);
> > >
> > > +     /* Make sure the sensor is available before V4L2 subdev init. */
> > > +     ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> >
> > I still wish we had an ID register, but so be it.
> 
> When we implement a SW reset (to be sure that there was a reset in case
> a dummy regulator is used), we can probably come up with a mix of
> different default values of registers to go through, but not sure if
> this is really worth it...
> 
> > > +     if (ret)
> >
> > Maybe add
> >
> >                 ret = dev_err_probe(dev, -ENODEV, "Failed to detect sensor\n");
> >
> > or something similar ? Up to you.
> 
> Probably a good idea. I didn't print something here because cci_read()
> already does.
> 
> > > +             goto err_pm;
> > > +     if (val != IMX290_STANDBY_STANDBY) {
> >
> > I think this check could be dropped though. If the sensor isn't present
> > or doesn't respond to I2C reads for any other reason, cci_read() will
> > fail.
> 
> I added it because Sakari and Alex suggested to read back a value and
> compare it to an expectation. Would keep it therefore?

If we had an ID register that had a more discriminatory value I would
check its contents. In this case, as the goal is to detect if the device
is functional, I don't think the check adds much value, unless you think
we need to protect against an incorrect devices responding to the same
I2C address. I would prefer dropping this, but I don't mind keeping the
check too much.

> > > +             dev_err(dev, "Sensor is not in standby mode\n");
> > > +             ret = -ENODEV;
> > > +             goto err_pm;
> > > +     }
> > > +
> >
> > My last concern is about accessing hardware at probe time. There are
> > known cases where this is problematic. They can be split in two
> > categories, systems that exhibit unwanted side effects when powering the
> > sensor up, and systems where the sensor can't be accessed at probe time.
> >
> > The two issues I can think of in the first category is devices that have
> > a camera privacy light that could cause worries among users if it
> > flashes at boot time, and devices that agressively optimize boot time.
> >
> > In the second category, I know that some people use camera serdes
> > (FPD-Link, GMSL, ...) that are controlled by userspace. As they should
> > instead use kernel drivers for those components, upstream may not care
> > too much about this use case. Another issue I was told about was a
> > device booting in temperatures that were too low for the camera to
> > operate, which then needed half an hour to heat the device enclosure
> > before the sensor and serdes could be accessed. That's a bit extreme,
> > but it sounds like a valid use case to me.
> >
> > What do we do with those cases ? Detecting devices at probe time does
> > have value, so I think it should be a policy decision. We may want to
> > convey some of that information through DT properties (I'm not sure what
> > would be acceptable there though). In any case, that's quite a bit of
> > yak shaving, so I'm inclined to accept this series (or rather its next
> > version), given that quite a few other camera sensor drivers detect the
> > device at probe time. I would however like feedback on the problem to
> > try and find a good solution.
> 
> One of the rather "simpler" solutions that come to my mind (without
> adding something like a generic "disallow-regulator-during-probe" or
> similar DT property) is to check the current state of the used
> regulator(s) and keep it during the cam probe. If it is already active:
> fine, we can communicate and find out; if not: live with schroedinger's
> cam. Probably we should decide at one point in time if dead or alive.
> 
> If you think this sounds fine, I can modify the series to do that.

Hmmmm that's sounds a bit dangerous, and possibly racy. I think we can
add the check for now, and implement a more generic mechanism in a
second step. As discussed in a separate e-mail in the same thread, most
of the use cases I mentioned can be addressed by loading the driver as a
module. The only exception (at the moment) is the privacy light problem.
I'd like to address that more globally.

> > >       /* Initialize the V4L2 subdev. */
> > >       ret = imx290_subdev_init(imx290);
> > >       if (ret)
> > >

-- 
Regards,

Laurent Pinchart

