Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5606825A584
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 08:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIBGZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 02:25:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:44066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgIBGZX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 02:25:23 -0400
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4384207EA;
        Wed,  2 Sep 2020 06:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599027922;
        bh=OJSpVQ5c8EF99vvALEkF5NCOboYU11I4INM1qljBWAk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cx7V3lN0x/HJn8KyFIInMt5KfkyaJCTldKREtwcqUlfsZvC6DVn1jss0trGfjrR4L
         v35JrKSKPDZ5kRg51D2bplQkOUUEu50JpIzclruONxWogIYddV+3uNatU9Xky1Kvf0
         nwPVPCx3YD7AnovHok7owct+V5+ZBhc33Ez3GXzo=
Received: by mail-ej1-f45.google.com with SMTP id nw23so5001068ejb.4;
        Tue, 01 Sep 2020 23:25:21 -0700 (PDT)
X-Gm-Message-State: AOAM533bPaodKwUxVfRXkymCeJ1ZzI4U4ulEN7tCtoGPL7IV+F5/hkqy
        FkbU/6qons1MbzK/NFxA4WzsPFtbUCvvHFoFC98=
X-Google-Smtp-Source: ABdhPJyiySgzLF6YcdaOO3ZsW9BLeguC234fHAFv7x9K7DmVJH5VctW7LNW5MlD4LKdDfgXG0WPH27dKjVqXE8SyjSo=
X-Received: by 2002:a17:906:9356:: with SMTP id p22mr4697123ejw.119.1599027920394;
 Tue, 01 Sep 2020 23:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200828160053.6064-1-krzk@kernel.org> <20200828160053.6064-3-krzk@kernel.org>
 <20200831090859.GF31019@paasikivi.fi.intel.com>
In-Reply-To: <20200831090859.GF31019@paasikivi.fi.intel.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 2 Sep 2020 08:25:09 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe6+vBfnTUXq4DdSmk3e-xaaCEZabD3u=LOaKH773Kc1w@mail.gmail.com>
Message-ID: <CAJKOXPe6+vBfnTUXq4DdSmk3e-xaaCEZabD3u=LOaKH773Kc1w@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: imx258: Get clock from device properties and
 enable it
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Yeh, Andy" <andy.yeh@intel.com>,
        "Chiang, Alan" <alanx.chiang@intel.com>,
        "Chen, Jason" <jasonx.z.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 31 Aug 2020 at 11:09, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Krzysztof,
>
> Thanks for the patchset.
>
> On Fri, Aug 28, 2020 at 06:00:53PM +0200, Krzysztof Kozlowski wrote:
> > The IMX258 sensor driver checked in device properties for a
> > clock-frequency property which actually does not mean that the clock is
> > really running such frequency or is it even enabled.
> >
> > Get the provided clock and check it frequency.  If none is provided,
> > fall back to old property.
> >
> > Enable the clock when accessing the IMX258 registers and when streaming
> > starts.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  drivers/media/i2c/imx258.c | 107 ++++++++++++++++++++++++++++++-------
> >  1 file changed, 87 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > index c20bac9b00ec..4d763dcabb1d 100644
> > --- a/drivers/media/i2c/imx258.c
> > +++ b/drivers/media/i2c/imx258.c
> > @@ -2,6 +2,7 @@
> >  // Copyright (C) 2018 Intel Corporation
> >
> >  #include <linux/acpi.h>
> > +#include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> > @@ -68,6 +69,9 @@
> >  #define REG_CONFIG_MIRROR_FLIP               0x03
> >  #define REG_CONFIG_FLIP_TEST_PATTERN 0x02
> >
> > +/* Input clock frequency in Hz */
> > +#define IMX258_INPUT_CLOCK_FREQ              19200000
> > +
> >  struct imx258_reg {
> >       u16 address;
> >       u8 val;
> > @@ -610,6 +614,8 @@ struct imx258 {
> >
> >       /* Streaming on/off */
> >       bool streaming;
> > +
> > +     struct clk *clk;
> >  };
> >
> >  static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
> > @@ -747,6 +753,12 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
> >       if (pm_runtime_get_if_in_use(&client->dev) == 0)
> >               return 0;
> >
> > +     ret = clk_prepare_enable(imx258->clk);
> > +     if (ret) {
> > +             dev_err(&client->dev, "failed to enable clock\n");
> > +             goto out;
> > +     }
> > +
> >       switch (ctrl->id) {
> >       case V4L2_CID_ANALOGUE_GAIN:
> >               ret = imx258_write_reg(imx258, IMX258_REG_ANALOG_GAIN,
> > @@ -779,6 +791,8 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
> >               break;
> >       }
> >
> > +out:
> > +     clk_disable_unprepare(imx258->clk);
> >       pm_runtime_put(&client->dev);
> >
> >       return ret;
> > @@ -972,10 +986,40 @@ static int imx258_stop_streaming(struct imx258 *imx258)
> >       return 0;
> >  }
> >
> > +static int imx258_power_on(struct imx258 *imx258)
> > +{
> > +     struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
> > +     int ret;
> > +
> > +     ret = pm_runtime_get_sync(&client->dev);
> > +     if (ret < 0)
> > +             goto err;
>
> Please continue to use runtime PM directly, and move the clock control to
> runtime PM callbacks (apart from probe and remove).

Runtime PM comes with its own overhead and using it for just toggling
clock is slightly waste of cycle but if this is preferred I can do it.

Best regards,
Krzysztof
