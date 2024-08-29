Return-Path: <linux-media+bounces-17096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 215BF963D15
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB85B2831B8
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 07:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39D7184549;
	Thu, 29 Aug 2024 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArxujC8U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727364C70;
	Thu, 29 Aug 2024 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916791; cv=none; b=UWtKJ5b4yQTVK/XCe33Pp1KcY0LHg3JvRj4Suh4A7sGD11WDOmhyUvCLQMKJqRGcXvrUlQD6i7sJRMMeFq7CkxUkzEUpO0vfY5xuT6jQBAsemAwuhx+KWHVYoJWn78WqHWSUjD8vfz+G17Wz6XPgcDVSna7JA/B2qbmjqq9bIVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916791; c=relaxed/simple;
	bh=DNe7bW1awUzROXNZ2syZJ9t/+1lJM8MBDvyjmrihFbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cN5FKLikEv2nUjGlaxWlGzdUMAnsjuSO2t7a46G2WgBmndLOOkIMzYOXeTM8us0iqPy0/7EPEBFWNa1w0ffnQaIv0fLIqy5HkIMPGdN+4OdPVxbaMFHppLysXQ0Y+sgAfI3PglGDuLPaOhCjGp+Xn81NW4dFelOJJWHJMqJz/F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArxujC8U; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c0a9f2b967so298943a12.2;
        Thu, 29 Aug 2024 00:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724916788; x=1725521588; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eO9MvSIcSf2me8q8Zept+6x5Tk0M3qHopcP6SPDZkCY=;
        b=ArxujC8UXn+4vcemWeMvEB7UGX7L756sBCX3RSQZSi8Kb6f+iTM/ovP2q300ge/Z+J
         qUWtVI6cO56ASGffCtfLGecV0Ssb7QErU4z08ao2cEZ1vUz1UX9n8b4FMwjKUVroLGop
         ThSVFfHcx9vuHs0Hfg8hu3vH8WblQVJk8ZGi892hqeiymoO3rlI5nZvfhgLDeQ7ujx++
         boqOYqHUPi6Lg2ykIJeDk/OtOHfbeVvcXLrWAR55h0dm2Dw6xa16zXSt17pb7JlYBYvA
         N69IOv5mHSWRQHXp1o/P5sWxeklicF85piJFKTDZHXpMURYsnjRcT8nNYra93Phd66/y
         wk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724916788; x=1725521588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eO9MvSIcSf2me8q8Zept+6x5Tk0M3qHopcP6SPDZkCY=;
        b=PC6ZOHIHFHJnaPTTlUBU6xqm0eSInvx0ERBH0Ako1jnFh1TPIIwVyR8+1kWBdso4Vi
         IwHM2dmX/2i3tHKXlEOLflq8Q4N7Vv+WzZ/oXMYxPAu1ZK5iYM3bxB7frMMj/acCsL83
         kf2F+CINW3IMxDDrbZ8qMbcw2Gw2xXykbS+Qp2dpjoprSUe0I7xp82ueF6lnoZeTFLDY
         1jsZsCGD8h9ZFQeH31ptMpKdPRs0Hin5sR1f0rRNAAsU58nlAy6LSkusJr6SzS43sGot
         EMWUhqEzILpy0Pv+QB03vhJ320dZYJKLZ5QDGPgkTD1/ZbPRdwwPKLQjz2jY3nP4qgV7
         uVHw==
X-Forwarded-Encrypted: i=1; AJvYcCU4OLRxCeXXIXqs9BpZ54HtzdfYYUHW87SchLi2zZ5P8Du3TLzXDSQsmDigjJC/UheGWDVfVh3Y2Hwqvps=@vger.kernel.org, AJvYcCVkx3nOPOV/60r5xRONHVNUzF1B1yjz1YPSWZdWzlnGcD4JhxcEmzhA0vhBnpdqZVWyk2K3WmCJF+N9fno=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzuzQg+qJbAcF7OwMGrtGi8MJe5CAmfgTDfqnUaTviCEmZnXA7
	Z4x6G9VElcRgIxaSnaHTSj6x90pAmezIIAgd7AL8coDhY6RgX8DuQgsumFbg7pZIuZ1MujsU1PJ
	osMkQtP6s7XtssMAHJacuxxyfLRo=
X-Google-Smtp-Source: AGHT+IE4bR3U3z0Oa6dNi+4FeoDXEo9T6MSe3SDZyQPxLtqjlLbJ8q2H5mB0fEXKSX5e7UBnYm0rL3YqeJ/hD6z1SbA=
X-Received: by 2002:a05:6402:2353:b0:5be:cd72:3757 with SMTP id
 4fb4d7f45d1cf-5c21ed566eemr1528527a12.20.1724916787259; Thu, 29 Aug 2024
 00:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com> <ZtAdvtkjr0XNbvmu@kekkonen.localdomain>
In-Reply-To: <ZtAdvtkjr0XNbvmu@kekkonen.localdomain>
From: Benjamin Bara <bbara93@gmail.com>
Date: Thu, 29 Aug 2024 09:32:55 +0200
Message-ID: <CAJpcXm6O8gfDnuevjh2iEXZpt7BE0OWqVH+2YfKaOZKxatOHqQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx290: Check for availability in probe()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

On Thu, 29 Aug 2024 at 09:05, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> Hi Benjamin,
>
> On Wed, Aug 28, 2024 at 08:13:07PM +0200, Benjamin Bara wrote:
> > Currently, the V4L2 subdevice is also created when the device is not
> > available/connected. In this case, dmesg shows the following:
> >
> > [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> > [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> > [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> > [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> >
> > which seems to come from imx290_ctrl_update() after the subdev init is
> > finished. However, as the errors are ignored, the subdev is initialized
> > but simply does not work. From userspace perspective, there is no
> > visible difference between a working and not-working subdevice (except
> > when trying it out or watching for the error message).
> >
> > This commit adds a simple availability check before starting with the
> > subdev initialization to error out instead.
> >
> > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > ---
> > Changes since v1:
> > - define operating/standby mode and use it
> > - read out the standby mode during probe and ensure it is standby
> > ---
> >  drivers/media/i2c/imx290.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 4150e6e4b9a6..2a869576600c 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -29,6 +29,8 @@
> >  #include <media/v4l2-subdev.h>
> >
> >  #define IMX290_STANDBY                                       CCI_REG8(0x3000)
> > +#define IMX290_STANDBY_OPERATING                     (0 << 0)
> > +#define IMX290_STANDBY_STANDBY                               (1 << 0)
> >  #define IMX290_REGHOLD                                       CCI_REG8(0x3001)
> >  #define IMX290_XMSTA                                 CCI_REG8(0x3002)
> >  #define IMX290_ADBIT                                 CCI_REG8(0x3005)
> > @@ -1016,7 +1018,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
> >               return ret;
> >       }
> >
> > -     cci_write(imx290->regmap, IMX290_STANDBY, 0x00, &ret);
> > +     cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_OPERATING, &ret);
>
> Please run
>
>         ./scripts/checkpatch.pl --strict --max-line-length=80
>
> the next time. I'll wrap the line this time.

Sorry. I added the strict max-line check to my .gitconfig.
"b4 prep --check" now warns me.

> >
> >       msleep(30);
> >
> > @@ -1029,7 +1031,7 @@ static int imx290_stop_streaming(struct imx290 *imx290)
> >  {
> >       int ret = 0;
> >
> > -     cci_write(imx290->regmap, IMX290_STANDBY, 0x01, &ret);
> > +     cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_STANDBY, &ret);
> >
> >       msleep(30);
> >
> > @@ -1520,6 +1522,7 @@ static int imx290_probe(struct i2c_client *client)
> >  {
> >       struct device *dev = &client->dev;
> >       struct imx290 *imx290;
> > +     u64 val;
> >       int ret;
> >
> >       imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
> > @@ -1580,6 +1583,16 @@ static int imx290_probe(struct i2c_client *client)
> >       pm_runtime_set_autosuspend_delay(dev, 1000);
> >       pm_runtime_use_autosuspend(dev);
> >
> > +     /* Make sure the sensor is available before V4L2 subdev init. */
> > +     ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
> > +     if (ret)
> > +             goto err_pm;
> > +     if (val != IMX290_STANDBY_STANDBY) {
> > +             dev_err(dev, "Sensor is not in standby mode\n");
> > +             ret = -ENODEV;
> > +             goto err_pm;
> > +     }
> > +
> >       /* Initialize the V4L2 subdev. */
> >       ret = imx290_subdev_init(imx290);
> >       if (ret)
> >
>
> --
> Kind regards,
>
> Sakari Ailus

thx & regards
Benjamin

