Return-Path: <linux-media+bounces-17401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8BD968F17
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2871F2330A
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF76619CC0A;
	Mon,  2 Sep 2024 21:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfhFrYnY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F791A4E68;
	Mon,  2 Sep 2024 21:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725311078; cv=none; b=K3gpymUum/7J+yfiyLBMuloezoGixhIE7lolgPuy7v7qOwaDaMBhnRvFoNFVCGCm86ZvUOcjwUdtLh51MyJwcDE40tQERnIUOEAEOXMnoaoWnYV67qWmAbX7EovOMvfmBwzjteYwE7p8ybrsRup+OmzImAwwECyG0sB2/qyDM7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725311078; c=relaxed/simple;
	bh=gBmxgE+sOLguMo473UxGigLqAF6r7Z3UbMv4PCqEAto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2hZ/i8Hf3M3Ay0n3ZvAt7Z/Gb6kgvkLEJtfUMKp7TQs8avSypBp7UisCDcN9hwD07J6c3Xp5pAfShF0JcGWVehIHJkuK1ZCWHSd48N0wFs+PXLv+WoTstfyNSrJ8xFLdcDc8BkjO2ZYSs9q+inB+gM4CC90pn5YdyeyclTKRG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfhFrYnY; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f4f2868710so49682031fa.1;
        Mon, 02 Sep 2024 14:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725311075; x=1725915875; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iaa4yfP9dyt/jFBOP0VjuSa/3HoPAaWemqph45nQpQI=;
        b=gfhFrYnY3HRsVviL2cEs+XNvopP4H13xszALJMKpngdxctr77jUoj81uKIiK5JtJIX
         IiIMa8lCtu9YAc7Ivxz2VZDAGUHEG422TQevYOKFMg3pi9eIHSTeedwNZec6XoWjO1vs
         d+DyzsddhhZt4mG6O1b4vsYcU41Q5lU5ukW10Y3ZdTJ1DBbvhGGw3U99BEF4CorUvDtD
         B2cMGLibWmGU3u0VuAOmwyph8JeKz+Bys7NHyRHfdLYAesniGuQi5K7jqEogqHa36X+N
         XzCQgdVe6jGbGX/fbp6N/szLSivkmM9bu15BR4JdnZDUJIAZkjYrX3PvW6jCYfUVKADJ
         oQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725311075; x=1725915875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iaa4yfP9dyt/jFBOP0VjuSa/3HoPAaWemqph45nQpQI=;
        b=OYo5PN8XXJESdsJTg9P4JTTX8UFio+sRxrBB6f+nAFxhOh54TO//Hkvoy9MAgBo1Gy
         L+8TYizDASXdLQZ1MwXYG2ItqJ62NcQiE/Xusyl9C3YH1bl13scmAdRCjDEzNoKaL675
         ZT3brGW9aZUr/5jRVjIM8xXNqbBTGfnljBYIAobExvCDYx59UORPOzl3y/jIaQBibvDM
         /eBD0C0H089L8Pl6ReW8XwGbm4wJrqfQLg5y4N+nJ4njp9vv3AgEOU2XPJqlmHuPhnWT
         ozBbV4MRlcwB2+FiI5+ot7Ut24Egy9MzEe5CZMSwW549wNKi1K+mvQfhg09unIK174yE
         MIjw==
X-Forwarded-Encrypted: i=1; AJvYcCUByHa6CBwHjoUsxrbJ/1Smk5f/K8OZgu+Jz1dMbCPD5pqxCA1cG44UIVmAibvhAz5j6HD25CdVmBZoqG0=@vger.kernel.org, AJvYcCWOOychAxrZX6nhkaNSgI7rmtpPVJBdKuZytDjzk0oiFe000CrObZ5CTxWABeGjHPUFdVynF2V37yvfRK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YweYFZ0TwRHH6x+svjCJPeJotbDxiu154m87N+ZqRJIJZn1yn4S
	374YLjOU/3euqOsBNb788or1maKRGopZpliMiI9xil/dQwztH8Yd4lmLYgIlxVhCuYw4HUgm/e1
	u+ouGrhHCRVo/oWCXM2g/HkD7hwo=
X-Google-Smtp-Source: AGHT+IHOyniWOABi4Ke23la7Fr5mFkXmTKJKGBCIiyfr16BW9uPN+Bj4osLIVxuXhJHQUq0uB3BdpCqG2JbKIbYOT3Y=
X-Received: by 2002:a2e:4e19:0:b0:2f3:f4db:9119 with SMTP id
 38308e7fff4ca-2f64441eedemr6898831fa.22.1725311074199; Mon, 02 Sep 2024
 14:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-7-b32a12799fed@skidata.com> <CAPY8ntA8V+816=UwaDa7Y-8vccPNfOoLQUvkQbC6KAtDZ0QxKw@mail.gmail.com>
 <CAJpcXm7-g5xUsL9pf0Qek9WsCCvv2hD+Cn573t8-cP8KPHfz-A@mail.gmail.com> <20240902200416.GT1995@pendragon.ideasonboard.com>
In-Reply-To: <20240902200416.GT1995@pendragon.ideasonboard.com>
From: Benjamin Bara <bbara93@gmail.com>
Date: Mon, 2 Sep 2024 23:04:23 +0200
Message-ID: <CAJpcXm5P-V0OXEcW5h2X-Tzd34vSddON3xdCo2TzRt0K34wc-w@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] media: i2c: imx290: Implement a "privacy mode" for probe()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent!

On Mon, 2 Sept 2024 at 22:04, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Sep 02, 2024 at 09:49:33PM +0200, Benjamin Bara wrote:
> > On Mon, 2 Sept 2024 at 20:10, Dave Stevenson wrote:
> > > On Mon, 2 Sept 2024 at 16:59, <bbara93@gmail.com> wrote:
> > > >
> > > > From: Benjamin Bara <benjamin.bara@skidata.com>
> > > >
> > > > Currently, we have a trade-off between potentially enabling the privacy
> > > > LED and reading out the connection state of the sensor during probe().
> > > >
> > > > To have a somewhat defined policy for now, make a decision based on the
> > > > power supplies of the sensor. If they are enabled anyways, communicate
> > > > with the powered sensor for an availability check. Otherwise, create the
> > > > subdevice without knowing whether the sensor is connected or not.
> > >
> > > Almost all the camera modules used on Raspberry Pi have regulators
> > > controlled via a GPIO, but no privacy LED. The preference from us is
> > > very definitely to query the sensor during probe where possible to
> > > flag up any connectivity issues, and indeed I've had a number of
> > > support threads with imx290 where it's just not been connected but it
> > > probed fully and showed up in libcamera.
> > >
> > > How can I opt in to patch 6 checking basic I2C to the sensor during
> > > probe when I have a controllable regulator? (This is where the
> > > discussions over a dtbinding for privacy LEDs and not powering up
> > > sensors during probe comes in).
> >
> > When you want to probe only during boot time, you can use the
> > "regulator-boot-on" DT binding on your controllable regulator. This
> > enables the regulator while it is probed and disables it later if not
> > used (in comparison to "always-on"). Should also work for modules.
>
> This seems like a hack, I'm sorry :-( I think we should instead have a
> DT property standardized for camera sensors that tell whether or not
> there is a privacy LED, and skip the detection in that case.

No prob, I didn't really expect this to be final and fully understand
it. I'll simply drop it for the next round. I also think that the DT
binding "has-privacy-led" is the much cleaner solution and also aligns
with the HW description constraint.

Thanks & regards
Benjamin

> > Unfortunately, I don't have a clean solution (which also autosuspends)
> > for "any probe time". I think it is not possible to enable a regulator
> > from user space without having a consuming DT node. A somewhat clean
> > workaround might be CONFIG_REGULATOR_USERSPACE_CONSUMER, which gives you
> > the possibility to change the state of a regulator via sysfs (after
> > creating a DT node). This gives you the possibility to enable it any
> > time. However, the userspace-consumer driver gets the regulators
> > exclusive, which means you cannot add the sensor driver as consumer and
> > therefore cannot use the autosuspend feature of the imx290. Not really
> > "nice", but probably "feasible" if you have special constraints when you
> > are allowed to probe (e.g. the temperature as mentioned by Laurent). A
> > DT binding would be easier for this case.
> >
> > > > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > > > ---
> > > > Changes since v2:
> > > > - new
> > > > ---
> > > >  drivers/media/i2c/imx290.c | 82 ++++++++++++++++++++++++++++++++--------------
> > > >  1 file changed, 57 insertions(+), 25 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index 6b292bbb0856..338b2c5ea547 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -1354,6 +1354,17 @@ static void imx290_subdev_cleanup(struct imx290 *imx290)
> > > >   * Power management
> > > >   */
> > > >
> > > > +static bool is_imx290_power_on(struct imx290 *imx)
> > > > +{
> > > > +       unsigned int i;
> > > > +
> > > > +       for (i = 0; i < ARRAY_SIZE(imx->supplies); i++)
> > > > +               if (!regulator_is_enabled(imx->supplies[i].consumer))
> > > > +                       return false;
> > > > +
> > > > +       return true;
> > > > +}
> > > > +
> > > >  static int imx290_power_on(struct imx290 *imx290)
> > > >  {
> > > >         int ret;
> > > > @@ -1571,6 +1582,7 @@ static int imx290_probe(struct i2c_client *client)
> > > >  {
> > > >         struct device *dev = &client->dev;
> > > >         struct imx290 *imx290;
> > > > +       bool power_on;
> > > >         u64 val;
> > > >         int ret;
> > > >
> > > > @@ -1611,36 +1623,54 @@ static int imx290_probe(struct i2c_client *client)
> > > >                 return ret;
> > > >
> > > >         /*
> > > > -        * Enable power management. The driver supports runtime PM, but needs to
> > > > -        * work when runtime PM is disabled in the kernel. To that end, power
> > > > -        * the sensor on manually here.
> > > > +        * Privacy mode: if the regulators are not enabled, avoid enabling them.
> > > > +        * In case the regulators are enabled, we still want to make sure that
> > > > +        * the regulators know that they have another consumer, therefore run
> > > > +        * the powering sequence.
> > > >          */
> > > > -       ret = imx290_power_on(imx290);
> > > > -       if (ret < 0) {
> > > > -               dev_err(dev, "Could not power on the device\n");
> > > > -               return ret;
> > > > +       power_on = is_imx290_power_on(imx290);
> > > > +       dev_dbg(dev, "%s: power on: %d\n", __func__, power_on);
> > > > +       if (power_on) {
> > > > +               /*
> > > > +                * Enable power management. The driver supports runtime PM, but
> > > > +                * needs to work when runtime PM is disabled in the kernel. To
> > > > +                * that end, power the sensor on manually here.
> > > > +                */
> > > > +               ret = imx290_power_on(imx290);
> > > > +               if (ret < 0) {
> > > > +                       dev_err(dev, "Could not power on the device\n");
> > > > +                       return ret;
> > > > +               }
> > > > +
> > > > +               /*
> > > > +                * Enable runtime PM with autosuspend. As the device has been
> > > > +                * powered manually, mark it as active, and increase the usage
> > > > +                * count without resuming the device.
> > > > +                */
> > > > +               pm_runtime_set_active(dev);
> > > > +               pm_runtime_get_noresume(dev);
> > > >         }
> > > >
> > > > -       /*
> > > > -        * Enable runtime PM with autosuspend. As the device has been powered
> > > > -        * manually, mark it as active, and increase the usage count without
> > > > -        * resuming the device.
> > > > -        */
> > > > -       pm_runtime_set_active(dev);
> > > > -       pm_runtime_get_noresume(dev);
> > > >         pm_runtime_enable(dev);
> > > >         pm_runtime_set_autosuspend_delay(dev, 1000);
> > > >         pm_runtime_use_autosuspend(dev);
> > > >
> > > > -       /* Make sure the sensor is available before V4L2 subdev init. */
> > > > -       ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> > > > -       if (ret) {
> > > > -               ret = dev_err_probe(dev, -ENODEV, "Failed to detect sensor\n");
> > > > -               goto err_pm;
> > > > -       }
> > > > -       if (val != IMX290_STANDBY_STANDBY) {
> > > > -               ret = dev_err_probe(dev, -ENODEV, "Sensor is not in standby\n");
> > > > -               goto err_pm;
> > > > +       /*
> > > > +        * Make sure the sensor is available before V4L2 subdev init.
> > > > +        * This only works when the sensor is powered.
> > > > +        */
> > > > +       if (power_on) {
> > > > +               ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> > > > +               if (ret) {
> > > > +                       ret = dev_err_probe(dev, -ENODEV,
> > > > +                                           "Failed to detect sensor\n");
> > > > +                       goto err_pm;
> > > > +               }
> > > > +               if (val != IMX290_STANDBY_STANDBY) {
> > > > +                       ret = dev_err_probe(dev, -ENODEV,
> > > > +                                           "Sensor is not in standby\n");
> > > > +                       goto err_pm;
> > > > +               }
> > > >         }
> > > >
> > > >         /* Initialize the V4L2 subdev. */
> > > > @@ -1666,8 +1696,10 @@ static int imx290_probe(struct i2c_client *client)
> > > >          * Decrease the PM usage count. The device will get suspended after the
> > > >          * autosuspend delay, turning the power off.
> > > >          */
> > > > -       pm_runtime_mark_last_busy(dev);
> > > > -       pm_runtime_put_autosuspend(dev);
> > > > +       if (power_on) {
> > > > +               pm_runtime_mark_last_busy(dev);
> > > > +               pm_runtime_put_autosuspend(dev);
> > > > +       }
> > > >
> > > >         return 0;
> > > >
>
> --
> Regards,
>
> Laurent Pinchart

