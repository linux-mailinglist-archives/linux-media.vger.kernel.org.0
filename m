Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5526963783E
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 12:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiKXL6a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 06:58:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiKXL63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 06:58:29 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5692ECB972
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 03:58:25 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id q13so709966ild.3
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 03:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3OcOKLBkavhNW4KYy1hfo9fa8x/O5MBbapatWejvVZ0=;
        b=VUOMDJARVPimx/Aq4HJiarNMiq61PPL6+4OTq/Pguz1det2yayWmkYe0th4FR0aSCK
         SzkhnOsyF04sA+07lo5ueIsqNu4ue3Xlms6J3x9YrRX4h1MBOLRCqqmLtXs6tkzdwfw1
         Z278nX3dBBFaqhbO6PTR2BhiY8pYpDbo5ke8wjv5RPkroUPMj8eokGEyPLHN+mvG/aCW
         dRI+9ZdDjA+BzEU3Y6xRNDrbavVlVbJfBZIuxYFHbDtLuYDHrSS+uiTwJpUAeoyMjr9X
         podCYZCU3xFGPnbXrgAtv3WlZtiqJT9PunhZ28rZo/gKtmF545kNbBipLLhaBSaIgrpi
         TxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OcOKLBkavhNW4KYy1hfo9fa8x/O5MBbapatWejvVZ0=;
        b=CGKXerguTaTUZ2SSXcgaXD9D/Bd1TeDajJ9ZlJBMEu9BLdE6MaYfQ9NYAXuoVMN+Nj
         dgSIDzsuhhgYkLyP1icQTOl3kfbj9f1xweFJNqhUjH6hn8KZuEK3WPMnb+8lKGV5X1Jv
         HvLdKwTseC5jP1/qZLqvV43qD/wxkmx97X+1/AOMPCkFfgQ5XRbgda7qjoFRreGMBHvc
         qVV/wimJvIRhzrzXSOo1/5PdYWbJJSanf1zVSzqhnsuWXM1O68tE1J+ZZ9AmosZ0Kxdn
         XDMiWsUt64/hIGbdUgZTdBUUDNo1G0X84BzdOkMff1hK+fII00x9Vb2+Og0F1PQ/bY44
         +y6A==
X-Gm-Message-State: ANoB5pk7PS/vXzGaxxqyyXP7cj2cdha997uZ5CB4y0LOkCYvprLD3SK5
        d02fVO1V7xeqq/JguCk1GnYGJnCT9VBS2SBo86mzUg==
X-Google-Smtp-Source: AA0mqf5HzPxwTSlXEkLPQ/HLgvn2b60CfiAFs/2id3qDhIiHixPDY+pW2uyQsciqRS3dCHp+DmIEGqDqM+zKxyjEmGs=
X-Received: by 2002:a92:2c0e:0:b0:302:e042:9ddd with SMTP id
 t14-20020a922c0e000000b00302e0429dddmr3466683ile.292.1669291105111; Thu, 24
 Nov 2022 03:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20221005152018.3783890-1-dave.stevenson@raspberrypi.com>
 <20221005152018.3783890-3-dave.stevenson@raspberrypi.com> <834648869.0ifERbkFSE@steina-w>
In-Reply-To: <834648869.0ifERbkFSE@steina-w>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 24 Nov 2022 11:58:08 +0000
Message-ID: <CAPY8ntA0oq4qYu1gJszEf3WpRLywn-+8V5=Y36jzboTa69-=Tw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: ov9282: Add support for regulators.
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander

Thanks for the review.

Sakari has already picked this up and included it in a pull to Mauro for 6.2.
https://www.spinics.net/lists/linux-media/msg222346.html

On Thu, 24 Nov 2022 at 09:31, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hello Dave,
>
> Am Mittwoch, 5. Oktober 2022, 17:20:18 CET schrieb Dave Stevenson:
> > The sensor takes 3 supply rails - AVDD, DVDD, and DOVDD.
> >
> > Add hooks into the regulator framework for each of these
> > regulators.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 38 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 2e0b315801e5..699fc5b753b4 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> >
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-fwnode.h>
> > @@ -55,6 +56,14 @@
> >  #define OV9282_REG_MIN               0x00
> >  #define OV9282_REG_MAX               0xfffff
> >
> > +static const char * const ov9282_supply_names[] = {
> > +     "avdd",         /* Analog power */
> > +     "dovdd",        /* Digital I/O power */
> > +     "dvdd",         /* Digital core power */
> > +};
> > +
> > +#define OV9282_NUM_SUPPLIES ARRAY_SIZE(ov9282_supply_names)
> > +
> >  /**
> >   * struct ov9282_reg - ov9282 sensor register
> >   * @address: Register address
> > @@ -128,6 +137,7 @@ struct ov9282 {
> >       struct media_pad pad;
> >       struct gpio_desc *reset_gpio;
> >       struct clk *inclk;
> > +     struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
>
> Please add documentation for supplies.

Is it the place for the driver to document the supplies beyond the
comments in ov9282_supply_names with regard to which sensor rail they
relate to?
Some drivers include the typical values for each supply, but those are
technically inaccurate as each will have a min and max value.

Anyone interfacing with a sensor is going to have the datasheet for it
and should be referring to that for the characteristics of supply
rails. Duplicating some of that in the driver seems redundant, and has
the potential to be incorrect.

> >       struct v4l2_ctrl_handler ctrl_handler;
> >       struct v4l2_ctrl *link_freq_ctrl;
> >       struct v4l2_ctrl *pclk_ctrl;
> > @@ -767,6 +777,18 @@ static int ov9282_detect(struct ov9282 *ov9282)
> >       return 0;
> >  }
> >
> > +static int ov9282_configure_regulators(struct ov9282 *ov9282)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i = 0; i < OV9282_NUM_SUPPLIES; i++)
> > +             ov9282->supplies[i].supply = ov9282_supply_names[i];
> > +
> > +     return devm_regulator_bulk_get(ov9282->dev,
> > +                                    OV9282_NUM_SUPPLIES,
> > +                                    ov9282->supplies);
> > +}
> > +
> >  /**
> >   * ov9282_parse_hw_config() - Parse HW configuration and check if supported
> > * @ov9282: pointer to ov9282 device
> > @@ -803,6 +825,12 @@ static int ov9282_parse_hw_config(struct ov9282
> > *ov9282) return PTR_ERR(ov9282->inclk);
> >       }
> >
> > +     ret = ov9282_configure_regulators(ov9282);
> > +     if (ret) {
> > +             dev_err(ov9282->dev, "Failed to get power regulators\n");
>
> dev_err_probe seems sensible here.

That would have been good - sorry. I must get into the habit of
remembering to use dev_err_probe.

  Dave

> > +             return ret;
> > +     }
> > +
> >       rate = clk_get_rate(ov9282->inclk);
> >       if (rate != OV9282_INCLK_RATE) {
> >               dev_err(ov9282->dev, "inclk frequency mismatch");
> > @@ -874,6 +902,12 @@ static int ov9282_power_on(struct device *dev)
> >       struct ov9282 *ov9282 = to_ov9282(sd);
> >       int ret;
> >
> > +     ret = regulator_bulk_enable(OV9282_NUM_SUPPLIES, ov9282->supplies);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to enable regulators\n");
> > +             return ret;
> > +     }
> > +
> >       usleep_range(400, 600);
> >
> >       gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
> > @@ -891,6 +925,8 @@ static int ov9282_power_on(struct device *dev)
> >  error_reset:
> >       gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> >
> > +     regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
> > +
> >       return ret;
> >  }
> >
> > @@ -909,6 +945,8 @@ static int ov9282_power_off(struct device *dev)
> >
> >       clk_disable_unprepare(ov9282->inclk);
> >
> > +     regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
> > +
> >       return 0;
> >  }
>
> Despite the nits above
> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
