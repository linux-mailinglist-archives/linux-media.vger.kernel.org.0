Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCD5BB3203
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2019 22:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbfIOUZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 16:25:19 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36154 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfIOUZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 16:25:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8FKPFxX079402;
        Sun, 15 Sep 2019 15:25:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568579115;
        bh=0rptD92equBw98T8Sc+eiyWQzCHT0BO9if74fByfdOQ=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=UYfD8YoEiGBb9T+JfNuv+rosreY/huYtUqrdqpUxdpwqIrJhVhHkh8Uf5rKWcs6ek
         TBg4SP/fDGM/TXvdBnys64I/u64nw7y+Wb8tVgqLwG1etQbcLSnEix1o6f1kTbC5r1
         3sd6FSrrPiz3LA40eFa8yQgOcKuPtrCmEMXAey00=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8FKPFE2092151
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 15 Sep 2019 15:25:15 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 15
 Sep 2019 15:25:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 15 Sep 2019 15:25:14 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x8FKPEbq097374;
        Sun, 15 Sep 2019 15:25:14 -0500
Date:   Sun, 15 Sep 2019 15:27:20 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 4/6] media: i2c: ov2659: Add optional powerdown gpio
 handling
Message-ID: <20190915202720.63saxa7fbifn3qf3@ti.com>
References: <20190912130007.4469-1-bparrot@ti.com>
 <20190912130007.4469-5-bparrot@ti.com>
 <CA+V-a8stmX2WmJEQRvvdOfHiFNgmEbtPTWtn+Fuq2h8SW4N3Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CA+V-a8stmX2WmJEQRvvdOfHiFNgmEbtPTWtn+Fuq2h8SW4N3Hw@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Lad, Prabhakar <prabhakar.csengg@gmail.com> wrote on Sat [2019-Sep-14 11:33:42 +0100]:
> Hi Benoit,
> 
> On Thu, Sep 12, 2019 at 1:58 PM Benoit Parrot <bparrot@ti.com> wrote:
> >
> > On some board it is possible that the sensor 'powerdown'
> > pin might be controlled with a gpio instead of being
> > tied to always powered.
> >
> > This patch add support to specify an optional gpio
> > which will be set at probe time and remained on.
> >
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/i2c/Kconfig  |  2 +-
> >  drivers/media/i2c/ov2659.c | 13 +++++++++++++
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 7eee1812bba3..315c1d8bdb7b 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -634,7 +634,7 @@ config VIDEO_OV2640
> >  config VIDEO_OV2659
> >         tristate "OmniVision OV2659 sensor support"
> >         depends on VIDEO_V4L2 && I2C
> > -       depends on MEDIA_CAMERA_SUPPORT
> > +       depends on MEDIA_CAMERA_SUPPORT && GPIOLIB
> >         select V4L2_FWNODE
> >         help
> >           This is a Video4Linux2 sensor driver for the OmniVision
> > diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> > index efbe6dc720e2..c64f73bef336 100644
> > --- a/drivers/media/i2c/ov2659.c
> > +++ b/drivers/media/i2c/ov2659.c
> > @@ -32,6 +32,8 @@
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_graph.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/videodev2.h>
> > @@ -232,6 +234,8 @@ struct ov2659 {
> >         struct sensor_register *format_ctrl_regs;
> >         struct ov2659_pll_ctrl pll;
> >         int streaming;
> > +       /* used to control the sensor powerdownN pin */
> > +       struct gpio_desc *pwrdn_gpio;
> >  };
> >
> >  static const struct sensor_register ov2659_init_regs[] = {
> > @@ -1391,6 +1395,7 @@ static int ov2659_probe(struct i2c_client *client)
> >         struct v4l2_subdev *sd;
> >         struct ov2659 *ov2659;
> >         struct clk *clk;
> > +       struct gpio_desc *gpio;
> 
> you don't need the local var here you can just assign it directly to pwrdn_gpio.

Ok.

> 
> >         int ret;
> >
> >         if (!pdata) {
> > @@ -1414,6 +1419,14 @@ static int ov2659_probe(struct i2c_client *client)
> >             ov2659->xvclk_frequency > 27000000)
> >                 return -EINVAL;
> >
> > +       /* Optional gpio don't fail if not present */
> > +       gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
> > +                                      GPIOD_OUT_HIGH);
> > +       if (IS_ERR(gpio))
> > +               return PTR_ERR(gpio);
> > +
> > +       ov2659->pwrdn_gpio = gpio;
> > +
> apart from assigning it you don't actually use it.
> 
> you will also have to read the reset gpio pin and implement
> ov2659_set_power() and
> call it in appropriate places/ s_power ?

Well I am not sure I want to go that far.
On most board I have the sensor is always powered as soon as the board gets
powered. Which is why we go through a S/W reset before starting a stream.

I didn't want to change the logic here too much.

I'll check this out a little more.

Benoit

> 
> Cheers,
> --Prabhakar Lad
