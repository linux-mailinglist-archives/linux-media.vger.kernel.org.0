Return-Path: <linux-media+bounces-16219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 382FD9505D2
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 15:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAA94281A05
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 13:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC81019ADAD;
	Tue, 13 Aug 2024 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AoMEQtvE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05B11E4A4
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554117; cv=none; b=M7FnpW4WHw0lEnRK1zGTsTMdXxWcxK4AOelELMQwMK/KsrEoZJg43fOljm86nxWsiJa1Dqn46XT/v/fCNQjc6SVSxop62BeRZikLN1hZV6zzjkL8ui02HXutNYlpJhQmG956SUQJ6H0wBVW9NpGEhX9Kf29vAGlHN5v6LoGGlyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554117; c=relaxed/simple;
	bh=OW9ZXqxEkr9RUH5IYYordISjGdWv1zhb8JCl6eodq94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iB1TIz6KleT/uCnSP+F+EWMX7ZUqNVnSpCdURXV+PWGh6mt7NRG/GcHx0CT7xwipfnFNrZYlcllA+NjI5SB3JKHdv4at8SFt6bLjFbrBaSq9X00X0Gi9rv9W6vG4ICaEUXF+VEbEOvus7EX8hHI47v0KpZDcaZkm2sKAHNbcTYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AoMEQtvE; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bb85e90ad5so4668865a12.3
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723554114; x=1724158914; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZ3qkhG6IpTE9k1+4JdfEiuc6iwsZmU2tud2hbQlnTM=;
        b=AoMEQtvEvHVwjfsLIBsWOGJ5uFyh1Npe9nLi47CXUpccrcL2rweiiHmUiZ4XIRChwp
         bB4IBRfWwzoXhpSIW5b/cPkmDpIiN3qQ54cdTHc7ViaIOce1+sTGBWk8CFz01iV0w/9Q
         BLNjAzDtJ+Efd2WwC5EgjhuWtzgz/3ZMO/sHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554114; x=1724158914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZ3qkhG6IpTE9k1+4JdfEiuc6iwsZmU2tud2hbQlnTM=;
        b=JeO0py6q2cYeZcyc02Uir1Tcyhki5NKV/qCDKJhSM/kZNk+LY9NCAhmLMOG1Gi4xI7
         7ARDec43L6mUhaRYla38uLW6bjtN8Eu/W5UXAR2B1smye6OV4xc8h/pp8EE3kGXb0S5o
         OkMJ/EZKWDjhwhbFYEHa1bAHvTdetQ64jMp6CRIRUy8c25PhYt/fhCHpWevhuLzCeM9W
         LfmUxZA0Zg/AZc/OV0ufXZ0LRQ1f/2TN6ijZZHox6Xwy5eOyd9CF6Kguw5NEY/EXdKve
         5ZBCax9FlhxV4QXeQd54vSAAIgtNWIPmx/sMYNZHuPxiw+7SOpbv7wT7dPqV7ojfgpbR
         9Y+g==
X-Forwarded-Encrypted: i=1; AJvYcCX3RP+N/Xl5KMN/WpbakdE1YCX+d3TBP06VNS9vCrCVYA3Xf5danES/5yO8rbYqgbRf6etpSjpVxHv7tp4NDYjnUDdO5Zc67ng2Y0I=
X-Gm-Message-State: AOJu0Yw1G2b7ydYaq0UL8WLfJ3xYxjqMFZ6WuDUTC9Z950MyiegOlqFo
	zZKvgqPYYiOMiU13QikNY8mbcKku2skF3MgXmQEj+ZPRQIIY+n3TBAniaeWhcUo9xsHuCqv79N1
	q7Q==
X-Google-Smtp-Source: AGHT+IH71IgT20jKJsDeV+2//tTVW13XVJ0OjCfG049JHfkJJH2pIN3J9es12e2VSvTp6eIetrvJXA==
X-Received: by 2002:a17:907:724f:b0:a80:7c30:a82a with SMTP id a640c23a62f3a-a80ed2d71ebmr272624866b.69.1723554113785;
        Tue, 13 Aug 2024 06:01:53 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411aee8sm67716366b.138.2024.08.13.06.01.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 06:01:52 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7a975fb47eso85018266b.3
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 06:01:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSO4k4PLt50viaShg6zsCrV0uO/XHkoL6aRpC624H/+ybtgnEiO9gsQFra0G0i2HtRh6lL5bHMFVvRHlBwyjYku1t3OdfWLbEwFrE=
X-Received: by 2002:a17:907:d2d9:b0:a7a:ae85:f245 with SMTP id
 a640c23a62f3a-a80ed258d19mr244135166b.38.1723554111718; Tue, 13 Aug 2024
 06:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
 <20240813-smatch-clock-v1-1-664c84295b1c@chromium.org> <ce0ed949-5e57-4193-8190-9e4aa9cb62be@stanley.mountain>
In-Reply-To: <ce0ed949-5e57-4193-8190-9e4aa9cb62be@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 15:01:37 +0200
X-Gmail-Original-Message-ID: <CANiDSCu6BUdJt1sjmbOq2s4KU1JUN9D+HfnvSG6OqMhD-dKekw@mail.gmail.com>
Message-ID: <CANiDSCu6BUdJt1sjmbOq2s4KU1JUN9D+HfnvSG6OqMhD-dKekw@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: ar0521: Refactor ar0521_power_off()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Tue, 13 Aug 2024 at 14:54, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Tue, Aug 13, 2024 at 12:13:48PM +0000, Ricardo Ribalda wrote:
> > Factor out all the power off logic, except the clk_disable_unprepare(),
> > to a new function __ar0521_power_off().
> >
> > This allows ar0521_power_on() to explicitly clean-out the clock during
> > the error-path.
> >
> > The following smatch warning is fixed:
> > drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 912.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
>
> It's better to just ignore false positives...  The problem here is that
> Smatch can't track that to_ar0521_dev(dev_get_drvdata(dev))->sensor is the same
> as sensor.  What I could do is say that "this frees *something* unknown" so
> let's silence the warning."
>
> The problem is that check_unwind.c is not very granular.  It just marks things
> as allocated and freed.  I could make it more granular so the free and the
> alloc have to match.  Or we could match based on the type.  This frees a
> "struct ar0521_dev" so mark all those as freed in the caller.
>
> >  drivers/media/i2c/ar0521.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > index 09331cf95c62..2c528db31ba6 100644
> > --- a/drivers/media/i2c/ar0521.c
> > +++ b/drivers/media/i2c/ar0521.c
> > @@ -835,7 +835,7 @@ static const struct initial_reg {
> >            be(0x0707)), /* 3F44: couple k factor 2 */
> >  };
> >
> > -static int ar0521_power_off(struct device *dev)
> > +static void __ar0521_power_off(struct device *dev)
> >  {
> >       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >       struct ar0521_dev *sensor = to_ar0521_dev(sd);
> > @@ -850,6 +850,16 @@ static int ar0521_power_off(struct device *dev)
> >               if (sensor->supplies[i])
> >                       regulator_disable(sensor->supplies[i]);
> >       }
> > +}
> > +
> > +static int ar0521_power_off(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +     struct ar0521_dev *sensor = to_ar0521_dev(sd);
> > +
> > +     clk_disable_unprepare(sensor->extclk);
> > +     __ar0521_power_off(dev);
>
> You had intended to remove the clk_disable_unprepare() from __ar0521_power_off()
> but forgot so these are double unprepares.

Ups, thanks for catching it :)

Will send as v2, unless you fix it in smatch first ;P

Regards!

>
> regards,
> dan carpenter
>
> > +
> >       return 0;
> >  }
> >
> > @@ -908,7 +918,8 @@ static int ar0521_power_on(struct device *dev)
> >
> >       return 0;
> >  off:
> > -     ar0521_power_off(dev);
> > +     clk_disable_unprepare(sensor->extclk);
> > +     __ar0521_power_off(dev);
> >       return ret;
> >  }
> >
> >
> > --
> > 2.46.0.76.ge559c4bf1a-goog
> >



-- 
Ricardo Ribalda

