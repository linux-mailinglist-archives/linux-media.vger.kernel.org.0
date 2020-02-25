Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71D4E16F29A
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 23:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgBYWbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 17:31:35 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:40174 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727227AbgBYWbf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 17:31:35 -0500
Received: by mail-qk1-f194.google.com with SMTP id b7so795730qkl.7
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2020 14:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ubIf9KgBPhrMTZsMsrUhZaH8of9jm8OARnjdieWkpqc=;
        b=hs/vGgUCZVANL6eNCkLfJBo/qB12HTrQoO0o4CSqsNYd1mNNI++5+bKjXeqTs5xnQD
         wwbKyv7ZRGKb+239Ns0Gxt+UF6dkL65yZKwif9okP8yXphOteGoIMFj6FuV8Ba0wwbrZ
         qCma7HQRyeTGvlCCeb1ATWwmQLvPX4BxZtzMUZm6BeJQ0TJXZFqmN+dTRdc0jxS2gKHh
         tsiVv+o/5f98tK41gyL6uCHDS2+ItS0gaWSW7ibsAyxerOYiE12YbWXnDgom4yyAdicW
         0CbcZLmBkPFj6MCwOvDY4f7JPD7YtoTuGMQxLMOQ3sB4mFvJ4f0+poQLUMv4Mc0LCjAI
         in7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ubIf9KgBPhrMTZsMsrUhZaH8of9jm8OARnjdieWkpqc=;
        b=LcfyWvxfWP0z0ttWB2UQoez3uZ8IYteftIW5fSbhWAJXLvWyX3gtvD+Li1IB0BP8iO
         SvssQWmzsvXlBPrARppNDHjGJt0uiG2L4ARdkvWt7frRM8o3QbCqowOG26V/uSa6orEP
         WL9MVqbmmU0YDWoBvOHegKFfbAyqZD10LFKO7vgFhqUR3nIncorWcd5LLCVaYpq4jt0F
         9Rwa+ebIfg9Gg43/qC0z98wJzmyV+GGhm6EHG7tYOzINgawdbyFsoVhqa6MG4cbWln9r
         SshSxENY+zjNwizSgYzEXdqK/a8imMEht3y2oqRvCTThhiHKhlgJ/bFLAW2NEBbS7eVS
         R63w==
X-Gm-Message-State: APjAAAXDdNm/xFXZR4yYd2NAb8U5im0G3DsbsZsHNP5AbGSxdrvkpcNI
        2jA+J29r9XuRo91P8N0kQ7a5wIT51KmjE1upI2c=
X-Google-Smtp-Source: APXvYqzkR2qPJK3/WqlQIrK1EzcZfNxVH52ieLkz9bas5Q9ZI+sIujlCIzdVX0l43BSPhAgNPfi4Ofu//GGZe+eNjvc=
X-Received: by 2002:a37:b86:: with SMTP id 128mr1376039qkl.159.1582669894087;
 Tue, 25 Feb 2020 14:31:34 -0800 (PST)
MIME-Version: 1.0
References: <CAA85sZu_5=mP2zn2h_8aY+n=UM+fXOKgym9yNAvwxcc+6R_-jA@mail.gmail.com>
 <20200225075117.GI5379@paasikivi.fi.intel.com> <CAA85sZvCxyi9n0dmCfb3q4EwnMu1dp6vsh3eHWyAeZ2aX+J0Pw@mail.gmail.com>
 <20200225100824.GM5379@paasikivi.fi.intel.com>
In-Reply-To: <20200225100824.GM5379@paasikivi.fi.intel.com>
From:   Ian Kumlien <ian.kumlien@gmail.com>
Date:   Tue, 25 Feb 2020 23:31:01 +0100
Message-ID: <CAA85sZtkQVGzQq65EiBYnFmVOWUnzYD1k+7Whv6e7-20yegWRg@mail.gmail.com>
Subject: Re: [RFC] Buildfailure due to mising "select REGMAP_I2C"
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     hverkuil-cisco@xs4all.nl, petrcvekcz@gmail.com,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        leonl@leopardimaging.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 25, 2020 at 11:08 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Tue, Feb 25, 2020 at 08:56:34AM +0100, Ian Kumlien wrote:
> > On Tue, Feb 25, 2020 at 8:51 AM Sakari Ailus

[... 8< ..]

> > Yep, like this one:
>
> Yes, like that one.

Anything more you need from me? or is this it? ;)

> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index c68e002d26ea..1d1170de8c98 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -238,6 +238,7 @@ config VIDEO_ADV7604
> >         tristate "Analog Devices ADV7604 decoder"
> >         depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
> >         depends on GPIOLIB || COMPILE_TEST
> > +       select REGMAP_I2C
> >         select HDMI
> >         select V4L2_FWNODE
> >         help
> > @@ -379,6 +380,7 @@ config VIDEO_TVP5150
> >         tristate "Texas Instruments TVP5150 video decoder"
> >         depends on VIDEO_V4L2 && I2C
> >         select V4L2_FWNODE
> > +       select REGMAP_I2C
> >         help
> >           Support for the Texas Instruments TVP5150 video decoder.
> >
> > @@ -584,6 +586,7 @@ config VIDEO_IMX214
> >         tristate "Sony IMX214 sensor support"
> >         depends on GPIOLIB && I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> >         depends on V4L2_FWNODE
> > +       select REGMAP_I2C
> >         help
> >           This is a Video4Linux2 sensor driver for the Sony
> >           IMX214 camera.
> > @@ -612,6 +615,7 @@ config VIDEO_IMX274
> >  config VIDEO_IMX290
> >         tristate "Sony IMX290 sensor support"
> >         depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > +       select REGMAP_I2C
> >         select V4L2_FWNODE
> >         help
> >           This is a Video4Linux2 sensor driver for the Sony
> > @@ -804,6 +808,7 @@ config VIDEO_OV7670
> >  config VIDEO_OV7740
> >         tristate "OmniVision OV7740 sensor support"
> >         depends on I2C && VIDEO_V4L2
> > +       select REGMAP_I2C
> >         help
> >           This is a Video4Linux2 sensor driver for the OmniVision
> >           OV7740 VGA camera sensor.
>
> --
> Sakari Ailus
