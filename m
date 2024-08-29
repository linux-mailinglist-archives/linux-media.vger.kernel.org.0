Return-Path: <linux-media+bounces-17149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D12964A2E
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 17:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A23A1C23733
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 15:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA441B373E;
	Thu, 29 Aug 2024 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPjNXPIb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1781A255C;
	Thu, 29 Aug 2024 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945824; cv=none; b=gVCLtQ3rEQ93l/5NxMuzetSFwGFIixhlbo4IqBHB1rrUKUkKJjQ1KlWM2WGYDdhnowCNRLGZbylkRbFrBDqJuhO8mjjjxiCIzKTCOQ1m+5UqRbyXhqJuMhGKZnX/6WKUF6WB1FrM3LurOrQIrFn49NeFWYli4pn3Gjq2eejWSXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945824; c=relaxed/simple;
	bh=jOsNQakbu5V1tse1MKl3+Shpx/461ZZyIke5XeJjmpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAiPPh3dxOBOvVhPaRBqALGwH0HmvTKSwEskdSmBhsR7A939VNc9Y/OeSi0ILMBQYg21r9bIhrKfndSHRFADvTaHe4EgfrgPURNo9BuO+Pco5GwJuyuQnQ3OuhGLIx5Kw5IHLb0BwilIwVF/gx9Alr3bwweIiw9vbq7byJ0ub+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPjNXPIb; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so1072867a12.0;
        Thu, 29 Aug 2024 08:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724945820; x=1725550620; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HhtNjLcCQrcVScv0UIV+0ZLUCmD91biXT3qe4LiPGKE=;
        b=dPjNXPIbU9sA1BrlWdZj2jeG1azMSJ8kxQR5cOZ7DtOeStIjHfAx0HQNcZGKujjlYr
         dBV9xuM0sTl2DOBe6nfZPQGBXWh4+cMNFSXElQ3QuecOrLe5BRD6Pe3CiAEuMysUFtKE
         LeI2CHuYdtKeXiPIvIX51c3rivJ0sByeyGkibklgB3f2UIU+Z40q20iJAv9vWBfXahcS
         p2nzn6bFKPUs60tAFesHGj6jZOhlh+bzD5T68skcU0yxPKlv3hjxsJxeeiN/OyQXmzCv
         RPxXjfZ+fSMhcl5MidhxHI7uc8k4SpxCOsnEeTgsP9xQadbWuAuiWEuHMaqZ9zETevuj
         Dq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945820; x=1725550620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhtNjLcCQrcVScv0UIV+0ZLUCmD91biXT3qe4LiPGKE=;
        b=oHHEfdy+3Hi5RCm+NuLiGb0qh75AINZjBveUrqLeJVA9erzzz/PJCgG4FO1RYWrzo/
         IYqCNP51+nbvs8Kke0vCAgDiEKybE6PADHHfZ4A/wPzploiz8eVI2MmbC7Mcv9FusDug
         bOcZJ7ky0cLq/n16PKeof1J/yRUKUPmdxz8FF3bd+n3wEK/A5Kd7RlnjEk40FwRzGpy2
         Qk0j1zZVj/sv7q+Bt7cnLGrX1OtVw9Zy2PSrTetnfP4EUbkU56xaRYCIkdueCfvN6FQ3
         f9FLa1OPTNWJ3LqkOqQ2y4B9Hl/2sMVyMJwNfohYTp+PdV+YdjzzGIgUpqvw7Efe4ta3
         uOSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUadL0b3Ma80uVI/TGSBPeafHhL+lHHyyhKXQIsCfY2DVpCgiMT0u+o18anj9ZrcO1kzA9Z7yRllycxXHI=@vger.kernel.org, AJvYcCVyIxsA44kMmE95o8yF9O7oVPIb9ZuDgjSzjQ/+Ob6TEz9xRXxl2DRUg0wGS5BfD1/G+4KdpoD8a48D+/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCIpIeh0d0HPaWUs9uHzAAm7ipPcjZPIxjLPblUGBL8XYtwrGx
	hvm7Pa4szVpRfXhS5j40GW4RPObdT679hyDzCaKD8qJxUiP8xYwCbXSFhc/4+I6vmvr6WqR8YVJ
	AziUXaBiMS8X6+iyszgufSbqZ3qg=
X-Google-Smtp-Source: AGHT+IHlYdLHhIYbxPnQgodDmn4V2CpYplXercptDW0MEF5I68HZ7H4aRKYcPocfFmq/69Qt/2XBLloJgWaBD0iBnDc=
X-Received: by 2002:a05:6402:2550:b0:5be:da7c:6176 with SMTP id
 4fb4d7f45d1cf-5c21ed3dfd7mr2759235a12.10.1724945819901; Thu, 29 Aug 2024
 08:36:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com> <20240829131909.GD12951@pendragon.ideasonboard.com>
In-Reply-To: <20240829131909.GD12951@pendragon.ideasonboard.com>
From: Benjamin Bara <bbara93@gmail.com>
Date: Thu, 29 Aug 2024 17:36:48 +0200
Message-ID: <CAJpcXm59W-1OkDVC5NjLycR0FFOFVFQf0yfjCfsKztg4YUqtkQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx290: Check for availability in probe()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

thank you for the feedback!

On Thu, 29 Aug 2024 at 15:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Benjamin,
>
> Thank you for the patch.
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
> > finished.
>
> I think this should also be fixed. There should be no need to write
> those registers at probe time. Would moving the
> pm_runtime_mark_last_busy() and pm_runtime_put_autosuspend() calls to
> just before imx290_subdev_init() help ?

I guess if I decrease the autosuspend delay (now 1s), it would work -
but it feels like a hack to me. I would prefer to not call
imx290_ctrl_update() at all during probe(). I guess the reason why it is
done is to have sane ctrl values for link_freq, hblank and vblank.
However, as they depend on the mode (which isn't known at that time), it
(at least to me) doesn't make sense to just "assume" the first mode
here.

I would prefer to introduce a FREQ_INDEX_OFF with 0 here and use this as
default, and use the ranges from the datasheet for {v,h}blank already
when creating the controls. When the mode is decided, the blanks will be
adapted to be in range.

I can add an example in the next round, need to implement and test
first.

> > However, as the errors are ignored, the subdev is initialized
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
>
> The datasheet documents the STANDBY field as a single bit, but doesn't
> mention an OPERATING value. I would match that, drop
> IMX290_STANDBY_OPERATING and write

The imx290 datasheet from Arrow has it on page 35, but I can switch to
your version if preferred :)

> #define IMX290_STANDBY_STANDBY                          BIT(0)
>
> >  #define IMX290_REGHOLD                                       CCI_REG8(0x3001)
> >  #define IMX290_XMSTA                                 CCI_REG8(0x3002)
> >  #define IMX290_ADBIT                                 CCI_REG8(0x3005)
> > @@ -1016,7 +1018,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
> >               return ret;
> >       }
> >
> > -     cci_write(imx290->regmap, IMX290_STANDBY, 0x00, &ret);
> > +     cci_write(imx291->regmap, IMX290_STANDBY, IMX290_STANDBY_OPERATING, &ret);
>
> This hunk would then be dropped.
>
> >
> >       msleep(30);
> >
> > @@ -1029,7 +1031,7 @@ static int imx290_stop_streaming(struct imx290 *imx290)
> >  {
> >       int ret = 0;
> >
> > -     cci_write(imx290->regmap, IMX290_STANDBY, 0x01, &ret);
> > +     cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_STANDBY, &ret);
>
> And this looks fine.
>
> The change isn't mentioned in the commit message though. I wouldn't ask
> for a v3 just to split this, but as you need to address other issues, it
> would be nice to have a separate patch in v3.

Yup, can do that :)

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
>
> I still wish we had an ID register, but so be it.

When we implement a SW reset (to be sure that there was a reset in case
a dummy regulator is used), we can probably come up with a mix of
different default values of registers to go through, but not sure if
this is really worth it...

> > +     if (ret)
>
> Maybe add
>
>                 ret = dev_err_probe(dev, -ENODEV, "Failed to detect sensor\n");
>
> or something similar ? Up to you.

Probably a good idea. I didn't print something here because cci_read()
already does.

> > +             goto err_pm;
> > +     if (val != IMX290_STANDBY_STANDBY) {
>
> I think this check could be dropped though. If the sensor isn't present
> or doesn't respond to I2C reads for any other reason, cci_read() will
> fail.

I added it because Sakari and Alex suggested to read back a value and
compare it to an expectation. Would keep it therefore?

> > +             dev_err(dev, "Sensor is not in standby mode\n");
> > +             ret = -ENODEV;
> > +             goto err_pm;
> > +     }
> > +
>
> My last concern is about accessing hardware at probe time. There are
> known cases where this is problematic. They can be split in two
> categories, systems that exhibit unwanted side effects when powering the
> sensor up, and systems where the sensor can't be accessed at probe time.
>
> The two issues I can think of in the first category is devices that have
> a camera privacy light that could cause worries among users if it
> flashes at boot time, and devices that agressively optimize boot time.
>
> In the second category, I know that some people use camera serdes
> (FPD-Link, GMSL, ...) that are controlled by userspace. As they should
> instead use kernel drivers for those components, upstream may not care
> too much about this use case. Another issue I was told about was a
> device booting in temperatures that were too low for the camera to
> operate, which then needed half an hour to heat the device enclosure
> before the sensor and serdes could be accessed. That's a bit extreme,
> but it sounds like a valid use case to me.
>
> What do we do with those cases ? Detecting devices at probe time does
> have value, so I think it should be a policy decision. We may want to
> convey some of that information through DT properties (I'm not sure what
> would be acceptable there though). In any case, that's quite a bit of
> yak shaving, so I'm inclined to accept this series (or rather its next
> version), given that quite a few other camera sensor drivers detect the
> device at probe time. I would however like feedback on the problem to
> try and find a good solution.

One of the rather "simpler" solutions that come to my mind (without
adding something like a generic "disallow-regulator-during-probe" or
similar DT property) is to check the current state of the used
regulator(s) and keep it during the cam probe. If it is already active:
fine, we can communicate and find out; if not: live with schroedinger's
cam. Probably we should decide at one point in time if dead or alive.

If you think this sounds fine, I can modify the series to do that.

> >       /* Initialize the V4L2 subdev. */
> >       ret = imx290_subdev_init(imx290);
> >       if (ret)
> >
--
Kind regards
Benjamin

