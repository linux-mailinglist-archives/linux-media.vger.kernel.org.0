Return-Path: <linux-media+bounces-17390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DED29968E8C
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B01A1C21EAF
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 19:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2831C62B3;
	Mon,  2 Sep 2024 19:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YD6NeOaS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0435B13CFB7;
	Mon,  2 Sep 2024 19:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725306588; cv=none; b=jq7Z1/Q92zg9i+TCHQlH80kTQmXIKUWv+QWHpzVY9zAVcM0QM45vab7T6AZ8elZGMmRm9iIoXmomLZDbdocDLqcoQJClQUNJLAY/udfzlcSrhOezYrKFZO7+7q/nlqbcrq2xOSxcEPveYDZqBLov8nB2HHWzHD35DEaQKeQ3NLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725306588; c=relaxed/simple;
	bh=0z3bsFy1sNSQRuMLmIEqFxmvYqo8xhG+2K7GosnDZCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lByrXEVdYI9BrHnIu+CpSrGB0n8WvsMf3p9R5h6pcnpAKJlQ7/42gDKZMRo1JXifj2+NZw8BsLSUSQjrE81CJPLBU8jBpeWEpEez4KLPdC3+Q4mrh0EaAfSx0SIQY4hHjw76Un+J0vEdmwL8DpclbKsl6vNpHUWgHLqjVcHnrLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YD6NeOaS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374bd059b12so1486814f8f.1;
        Mon, 02 Sep 2024 12:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725306585; x=1725911385; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYSdL/C+uyef9/A6fR9NkjECsQB+oNbs2aIRuVtuSjo=;
        b=YD6NeOaSQI+kgkewiLdRcnNv0bgRXFAnl7mfJzSeMHxuiso+EcewFeRqmXFgSZ8tUB
         pWdwQE7jbTh3+4Nt2E0l1P9ELyfXvC5jHPQWqM5ADG5p98huh7PktBA4ZPaJ27K4edyR
         4/vqJTjDu04ctN5O7BOfsa63tinStTPAFgJv+SNYFkaLDqABQHKaRig1EGfAzFqifAkU
         yOnBDUIJWTv7YF5GT96sRhUlDJQlpAh1qurPJkALgbI97WVihrzokoXg3Ku6Afdr05o1
         jLoui9APcBRWDEBITDfgmJctOpe0x+0hUz7m/EXmlmWdTT9KUfenPicwvoGf8eOljj5Z
         YCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725306585; x=1725911385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYSdL/C+uyef9/A6fR9NkjECsQB+oNbs2aIRuVtuSjo=;
        b=YN3MsaF8pCXXfX/YQrtr8bpWg7cgdtvIq1snPCc7LI4PtuH2wg8PPH1vxF2O5BOkr4
         HBa6g32zVJh/2umjSxlWtZQE+GknRQdgEcWsqPuPXmv3/8rHDfN+gcMNqbjYmqeK/eNg
         pkQXI5xN76llXO8j2h3VtYHLaHVY9EAdLOCNxQmlX+yjdjHrk5a/sw8e+VxpyOsoeFIs
         AR5XqVs+U+kOqbJEQfqpHywN46qwPmcqm1YAnvdLRGwpTKw1xR7+J4//OKF8jpjcL5H9
         FQBXOzuBn73UiH88cwSh78H07trPv6xEZ9AgPhu1ImeFz0rNX9ZXZfsNAOD11ilXAm72
         B0Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVW8uJUzUEb4AqdUchcQdX3ctx0O42ls/MuPg1IDbQiMHaMMQAitPz/dycsXltgwSWidXqrmto8B0q3CSE=@vger.kernel.org, AJvYcCWlCac109dNoK+zUsizhKh9KmpA1TdCvApU7OViwzct0Ul6ZeD544OsZDlhfs0af83ox9d85h2Pkph8a9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjeyFwVxL2GZqjdwTKBFGTVglr0ZmbEvz756ct4x+YyrdDuGQL
	qbK0nt0YcTOD0Jh56qrLbLj+YFGsUJvhjhM0x+Rnz/tkpH6GS1rEPczevn/M/wnDiYvxKbFPEh6
	wJrEDOLGOyHR4OIyfYlCVXkua9yU=
X-Google-Smtp-Source: AGHT+IH/3P8v5i9yYCFw1hwp9gHXeZHtmj18Tf9HNr83B7mLAwxAvB016Ay0DjWGqq+Oaz3mdPNFjt1ZKnuL/BEMDHg=
X-Received: by 2002:adf:a3d5:0:b0:374:ca43:cda5 with SMTP id
 ffacd0b85a97d-374ca43cfb2mr2706396f8f.0.1725306584696; Mon, 02 Sep 2024
 12:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-7-b32a12799fed@skidata.com> <CAPY8ntA8V+816=UwaDa7Y-8vccPNfOoLQUvkQbC6KAtDZ0QxKw@mail.gmail.com>
In-Reply-To: <CAPY8ntA8V+816=UwaDa7Y-8vccPNfOoLQUvkQbC6KAtDZ0QxKw@mail.gmail.com>
From: Benjamin Bara <bbara93@gmail.com>
Date: Mon, 2 Sep 2024 21:49:33 +0200
Message-ID: <CAJpcXm7-g5xUsL9pf0Qek9WsCCvv2hD+Cn573t8-cP8KPHfz-A@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] media: i2c: imx290: Implement a "privacy mode" for probe()
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dave!

On Mon, 2 Sept 2024 at 20:10, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
> On Mon, 2 Sept 2024 at 16:59, <bbara93@gmail.com> wrote:
> >
> > From: Benjamin Bara <benjamin.bara@skidata.com>
> >
> > Currently, we have a trade-off between potentially enabling the privacy
> > LED and reading out the connection state of the sensor during probe().
> >
> > To have a somewhat defined policy for now, make a decision based on the
> > power supplies of the sensor. If they are enabled anyways, communicate
> > with the powered sensor for an availability check. Otherwise, create the
> > subdevice without knowing whether the sensor is connected or not.
>
> Almost all the camera modules used on Raspberry Pi have regulators
> controlled via a GPIO, but no privacy LED. The preference from us is
> very definitely to query the sensor during probe where possible to
> flag up any connectivity issues, and indeed I've had a number of
> support threads with imx290 where it's just not been connected but it
> probed fully and showed up in libcamera.
>
> How can I opt in to patch 6 checking basic I2C to the sensor during
> probe when I have a controllable regulator? (This is where the
> discussions over a dtbinding for privacy LEDs and not powering up
> sensors during probe comes in).

When you want to probe only during boot time, you can use the
"regulator-boot-on" DT binding on your controllable regulator. This
enables the regulator while it is probed and disables it later if not
used (in comparison to "always-on"). Should also work for modules.

Unfortunately, I don't have a clean solution (which also autosuspends)
for "any probe time". I think it is not possible to enable a regulator
from user space without having a consuming DT node. A somewhat clean
workaround might be CONFIG_REGULATOR_USERSPACE_CONSUMER, which gives you
the possibility to change the state of a regulator via sysfs (after
creating a DT node). This gives you the possibility to enable it any
time. However, the userspace-consumer driver gets the regulators
exclusive, which means you cannot add the sensor driver as consumer and
therefore cannot use the autosuspend feature of the imx290. Not really
"nice", but probably "feasible" if you have special constraints when you
are allowed to probe (e.g. the temperature as mentioned by Laurent). A
DT binding would be easier for this case.

Kind regards
Benjamin

> Thanks
>   Dave
> > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > ---
> > Changes since v2:
> > - new
> > ---
> >  drivers/media/i2c/imx290.c | 82 ++++++++++++++++++++++++++++++++--------------
> >  1 file changed, 57 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 6b292bbb0856..338b2c5ea547 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -1354,6 +1354,17 @@ static void imx290_subdev_cleanup(struct imx290 *imx290)
> >   * Power management
> >   */
> >
> > +static bool is_imx290_power_on(struct imx290 *imx)
> > +{
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(imx->supplies); i++)
> > +               if (!regulator_is_enabled(imx->supplies[i].consumer))
> > +                       return false;
> > +
> > +       return true;
> > +}
> > +
> >  static int imx290_power_on(struct imx290 *imx290)
> >  {
> >         int ret;
> > @@ -1571,6 +1582,7 @@ static int imx290_probe(struct i2c_client *client)
> >  {
> >         struct device *dev = &client->dev;
> >         struct imx290 *imx290;
> > +       bool power_on;
> >         u64 val;
> >         int ret;
> >
> > @@ -1611,36 +1623,54 @@ static int imx290_probe(struct i2c_client *client)
> >                 return ret;
> >
> >         /*
> > -        * Enable power management. The driver supports runtime PM, but needs to
> > -        * work when runtime PM is disabled in the kernel. To that end, power
> > -        * the sensor on manually here.
> > +        * Privacy mode: if the regulators are not enabled, avoid enabling them.
> > +        * In case the regulators are enabled, we still want to make sure that
> > +        * the regulators know that they have another consumer, therefore run
> > +        * the powering sequence.
> >          */
> > -       ret = imx290_power_on(imx290);
> > -       if (ret < 0) {
> > -               dev_err(dev, "Could not power on the device\n");
> > -               return ret;
> > +       power_on = is_imx290_power_on(imx290);
> > +       dev_dbg(dev, "%s: power on: %d\n", __func__, power_on);
> > +       if (power_on) {
> > +               /*
> > +                * Enable power management. The driver supports runtime PM, but
> > +                * needs to work when runtime PM is disabled in the kernel. To
> > +                * that end, power the sensor on manually here.
> > +                */
> > +               ret = imx290_power_on(imx290);
> > +               if (ret < 0) {
> > +                       dev_err(dev, "Could not power on the device\n");
> > +                       return ret;
> > +               }
> > +
> > +               /*
> > +                * Enable runtime PM with autosuspend. As the device has been
> > +                * powered manually, mark it as active, and increase the usage
> > +                * count without resuming the device.
> > +                */
> > +               pm_runtime_set_active(dev);
> > +               pm_runtime_get_noresume(dev);
> >         }
> >
> > -       /*
> > -        * Enable runtime PM with autosuspend. As the device has been powered
> > -        * manually, mark it as active, and increase the usage count without
> > -        * resuming the device.
> > -        */
> > -       pm_runtime_set_active(dev);
> > -       pm_runtime_get_noresume(dev);
> >         pm_runtime_enable(dev);
> >         pm_runtime_set_autosuspend_delay(dev, 1000);
> >         pm_runtime_use_autosuspend(dev);
> >
> > -       /* Make sure the sensor is available before V4L2 subdev init. */
> > -       ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> > -       if (ret) {
> > -               ret = dev_err_probe(dev, -ENODEV, "Failed to detect sensor\n");
> > -               goto err_pm;
> > -       }
> > -       if (val != IMX290_STANDBY_STANDBY) {
> > -               ret = dev_err_probe(dev, -ENODEV, "Sensor is not in standby\n");
> > -               goto err_pm;
> > +       /*
> > +        * Make sure the sensor is available before V4L2 subdev init.
> > +        * This only works when the sensor is powered.
> > +        */
> > +       if (power_on) {
> > +               ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> > +               if (ret) {
> > +                       ret = dev_err_probe(dev, -ENODEV,
> > +                                           "Failed to detect sensor\n");
> > +                       goto err_pm;
> > +               }
> > +               if (val != IMX290_STANDBY_STANDBY) {
> > +                       ret = dev_err_probe(dev, -ENODEV,
> > +                                           "Sensor is not in standby\n");
> > +                       goto err_pm;
> > +               }
> >         }
> >
> >         /* Initialize the V4L2 subdev. */
> > @@ -1666,8 +1696,10 @@ static int imx290_probe(struct i2c_client *client)
> >          * Decrease the PM usage count. The device will get suspended after the
> >          * autosuspend delay, turning the power off.
> >          */
> > -       pm_runtime_mark_last_busy(dev);
> > -       pm_runtime_put_autosuspend(dev);
> > +       if (power_on) {
> > +               pm_runtime_mark_last_busy(dev);
> > +               pm_runtime_put_autosuspend(dev);
> > +       }
> >
> >         return 0;
> >
> >
> > --
> > 2.46.0
> >
> >

