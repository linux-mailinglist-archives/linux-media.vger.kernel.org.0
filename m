Return-Path: <linux-media+bounces-17396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1508968EA6
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 22:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2279E1C21EE9
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 20:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520DA19CC29;
	Mon,  2 Sep 2024 20:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i+qc1P/N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C741428E8;
	Mon,  2 Sep 2024 20:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725307492; cv=none; b=Ba++qyQgvuudCmys4xtGfIvQBkCInG9KOADqZ2Vfh8sKMBm956NKlYwwf/y5JetOnTYQEZaEiTw4xc8VfwfmQ4wlSMeLwPRGmXCTXr6rAYa3Hq7KgNYYQM/Jd8s9qrNSgAourDeK8wYSVslFXe+tI7vSla3nZwF0rHis9zOJC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725307492; c=relaxed/simple;
	bh=6lhWz/HJWsgVhkcr/5b4sSe3G9PLdRFXhG8/PBGghss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DF+1se52IfrJirt2uhLoj4kQxBbg1n2nvPsssM9c6MHWejT49J3N0LGGlxfH2FdmvbzhK4hjMWlUXCC1bWyFgP9Vzwd97BPnKl9iwMsgv26aeq6rpwBy1gRER46I8vl4h+eyjar4ZjuVE9lPmPWA4Salk/8FfEw3g0Kvx+XHOPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i+qc1P/N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E2244CE;
	Mon,  2 Sep 2024 22:03:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725307417;
	bh=6lhWz/HJWsgVhkcr/5b4sSe3G9PLdRFXhG8/PBGghss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+qc1P/NqJUdeyo4UIg8eurDGI7GPjB7nvScgZrUO3ytV0uQafCNwOlnMpNIM0yG7
	 XwwGhhLDRdpy5y8LR8OkVuU9w+5NyLcI7ArqSZ3htUWP5pHw4C1MK/jJG/e0ikYmYy
	 bFSw/pU3XJ/munm0C1Eof6/UWBE0YHALDp0Y4Cro=
Date: Mon, 2 Sep 2024 23:04:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v3 7/7] media: i2c: imx290: Implement a "privacy mode"
 for probe()
Message-ID: <20240902200416.GT1995@pendragon.ideasonboard.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-7-b32a12799fed@skidata.com>
 <CAPY8ntA8V+816=UwaDa7Y-8vccPNfOoLQUvkQbC6KAtDZ0QxKw@mail.gmail.com>
 <CAJpcXm7-g5xUsL9pf0Qek9WsCCvv2hD+Cn573t8-cP8KPHfz-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJpcXm7-g5xUsL9pf0Qek9WsCCvv2hD+Cn573t8-cP8KPHfz-A@mail.gmail.com>

On Mon, Sep 02, 2024 at 09:49:33PM +0200, Benjamin Bara wrote:
> On Mon, 2 Sept 2024 at 20:10, Dave Stevenson wrote:
> > On Mon, 2 Sept 2024 at 16:59, <bbara93@gmail.com> wrote:
> > >
> > > From: Benjamin Bara <benjamin.bara@skidata.com>
> > >
> > > Currently, we have a trade-off between potentially enabling the privacy
> > > LED and reading out the connection state of the sensor during probe().
> > >
> > > To have a somewhat defined policy for now, make a decision based on the
> > > power supplies of the sensor. If they are enabled anyways, communicate
> > > with the powered sensor for an availability check. Otherwise, create the
> > > subdevice without knowing whether the sensor is connected or not.
> >
> > Almost all the camera modules used on Raspberry Pi have regulators
> > controlled via a GPIO, but no privacy LED. The preference from us is
> > very definitely to query the sensor during probe where possible to
> > flag up any connectivity issues, and indeed I've had a number of
> > support threads with imx290 where it's just not been connected but it
> > probed fully and showed up in libcamera.
> >
> > How can I opt in to patch 6 checking basic I2C to the sensor during
> > probe when I have a controllable regulator? (This is where the
> > discussions over a dtbinding for privacy LEDs and not powering up
> > sensors during probe comes in).
> 
> When you want to probe only during boot time, you can use the
> "regulator-boot-on" DT binding on your controllable regulator. This
> enables the regulator while it is probed and disables it later if not
> used (in comparison to "always-on"). Should also work for modules.

This seems like a hack, I'm sorry :-( I think we should instead have a
DT property standardized for camera sensors that tell whether or not
there is a privacy LED, and skip the detection in that case.

> Unfortunately, I don't have a clean solution (which also autosuspends)
> for "any probe time". I think it is not possible to enable a regulator
> from user space without having a consuming DT node. A somewhat clean
> workaround might be CONFIG_REGULATOR_USERSPACE_CONSUMER, which gives you
> the possibility to change the state of a regulator via sysfs (after
> creating a DT node). This gives you the possibility to enable it any
> time. However, the userspace-consumer driver gets the regulators
> exclusive, which means you cannot add the sensor driver as consumer and
> therefore cannot use the autosuspend feature of the imx290. Not really
> "nice", but probably "feasible" if you have special constraints when you
> are allowed to probe (e.g. the temperature as mentioned by Laurent). A
> DT binding would be easier for this case.
> 
> > > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > > ---
> > > Changes since v2:
> > > - new
> > > ---
> > >  drivers/media/i2c/imx290.c | 82 ++++++++++++++++++++++++++++++++--------------
> > >  1 file changed, 57 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 6b292bbb0856..338b2c5ea547 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -1354,6 +1354,17 @@ static void imx290_subdev_cleanup(struct imx290 *imx290)
> > >   * Power management
> > >   */
> > >
> > > +static bool is_imx290_power_on(struct imx290 *imx)
> > > +{
> > > +       unsigned int i;
> > > +
> > > +       for (i = 0; i < ARRAY_SIZE(imx->supplies); i++)
> > > +               if (!regulator_is_enabled(imx->supplies[i].consumer))
> > > +                       return false;
> > > +
> > > +       return true;
> > > +}
> > > +
> > >  static int imx290_power_on(struct imx290 *imx290)
> > >  {
> > >         int ret;
> > > @@ -1571,6 +1582,7 @@ static int imx290_probe(struct i2c_client *client)
> > >  {
> > >         struct device *dev = &client->dev;
> > >         struct imx290 *imx290;
> > > +       bool power_on;
> > >         u64 val;
> > >         int ret;
> > >
> > > @@ -1611,36 +1623,54 @@ static int imx290_probe(struct i2c_client *client)
> > >                 return ret;
> > >
> > >         /*
> > > -        * Enable power management. The driver supports runtime PM, but needs to
> > > -        * work when runtime PM is disabled in the kernel. To that end, power
> > > -        * the sensor on manually here.
> > > +        * Privacy mode: if the regulators are not enabled, avoid enabling them.
> > > +        * In case the regulators are enabled, we still want to make sure that
> > > +        * the regulators know that they have another consumer, therefore run
> > > +        * the powering sequence.
> > >          */
> > > -       ret = imx290_power_on(imx290);
> > > -       if (ret < 0) {
> > > -               dev_err(dev, "Could not power on the device\n");
> > > -               return ret;
> > > +       power_on = is_imx290_power_on(imx290);
> > > +       dev_dbg(dev, "%s: power on: %d\n", __func__, power_on);
> > > +       if (power_on) {
> > > +               /*
> > > +                * Enable power management. The driver supports runtime PM, but
> > > +                * needs to work when runtime PM is disabled in the kernel. To
> > > +                * that end, power the sensor on manually here.
> > > +                */
> > > +               ret = imx290_power_on(imx290);
> > > +               if (ret < 0) {
> > > +                       dev_err(dev, "Could not power on the device\n");
> > > +                       return ret;
> > > +               }
> > > +
> > > +               /*
> > > +                * Enable runtime PM with autosuspend. As the device has been
> > > +                * powered manually, mark it as active, and increase the usage
> > > +                * count without resuming the device.
> > > +                */
> > > +               pm_runtime_set_active(dev);
> > > +               pm_runtime_get_noresume(dev);
> > >         }
> > >
> > > -       /*
> > > -        * Enable runtime PM with autosuspend. As the device has been powered
> > > -        * manually, mark it as active, and increase the usage count without
> > > -        * resuming the device.
> > > -        */
> > > -       pm_runtime_set_active(dev);
> > > -       pm_runtime_get_noresume(dev);
> > >         pm_runtime_enable(dev);
> > >         pm_runtime_set_autosuspend_delay(dev, 1000);
> > >         pm_runtime_use_autosuspend(dev);
> > >
> > > -       /* Make sure the sensor is available before V4L2 subdev init. */
> > > -       ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> > > -       if (ret) {
> > > -               ret = dev_err_probe(dev, -ENODEV, "Failed to detect sensor\n");
> > > -               goto err_pm;
> > > -       }
> > > -       if (val != IMX290_STANDBY_STANDBY) {
> > > -               ret = dev_err_probe(dev, -ENODEV, "Sensor is not in standby\n");
> > > -               goto err_pm;
> > > +       /*
> > > +        * Make sure the sensor is available before V4L2 subdev init.
> > > +        * This only works when the sensor is powered.
> > > +        */
> > > +       if (power_on) {
> > > +               ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> > > +               if (ret) {
> > > +                       ret = dev_err_probe(dev, -ENODEV,
> > > +                                           "Failed to detect sensor\n");
> > > +                       goto err_pm;
> > > +               }
> > > +               if (val != IMX290_STANDBY_STANDBY) {
> > > +                       ret = dev_err_probe(dev, -ENODEV,
> > > +                                           "Sensor is not in standby\n");
> > > +                       goto err_pm;
> > > +               }
> > >         }
> > >
> > >         /* Initialize the V4L2 subdev. */
> > > @@ -1666,8 +1696,10 @@ static int imx290_probe(struct i2c_client *client)
> > >          * Decrease the PM usage count. The device will get suspended after the
> > >          * autosuspend delay, turning the power off.
> > >          */
> > > -       pm_runtime_mark_last_busy(dev);
> > > -       pm_runtime_put_autosuspend(dev);
> > > +       if (power_on) {
> > > +               pm_runtime_mark_last_busy(dev);
> > > +               pm_runtime_put_autosuspend(dev);
> > > +       }
> > >
> > >         return 0;
> > >

-- 
Regards,

Laurent Pinchart

