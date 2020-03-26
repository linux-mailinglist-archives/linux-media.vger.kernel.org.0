Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC72A193E70
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 12:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgCZL4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 07:56:51 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39450 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgCZL4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 07:56:51 -0400
Received: by mail-ot1-f65.google.com with SMTP id x11so5478138otp.6
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 04:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=08y2skilNEOT4bzHTJTKfLYQDttNHHaXwzBrM3l9i0Q=;
        b=dJrM2iNZtLM4xzUOQakfgBH6BrslLPki7yCI/zmRJk81wY3whBCrNIp/Cv2T1KeTyV
         Dipghi72ID6l2DkfHcuD5kCRDJ3AGrQMI9IhEmSuTwDkFtii8SMoTF17vwVCGDL4XeI7
         p+FZFAMs8o8vxi+DUwzHMdRhOvOhlRsHpPtj8zhSJ69Tpsz/tuyMjlTgCdUh2nBTsCbJ
         lKS4FyKi61ZLVQp0Ng0xb+2Zixj6S+jemGJ58hkj7Q/6kHOKeiH8TvRpfjPPaRP7ypCP
         KO9N6EBS6M8kankO8Xzfl6a0HD3gEKAJhkytOe7YSo5CxXmu0XiQEuuCZdSqQKJdLQ1+
         5ynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=08y2skilNEOT4bzHTJTKfLYQDttNHHaXwzBrM3l9i0Q=;
        b=ffgzSh3W0nNRfb9q3uUSGJOvPpRUxAHM4rrFsck0GbgThs4/vyZTVh+ikCgi9SzAoJ
         nY9yl1qcZFWGCF3SnmGEUDadJjnl38pVEfRKX9ZHG9COn19Gcx1JJ+srzIhPf8vk2kVg
         +KeQxsgdNjFQdn6ePt+Eb1laFnHVQ1vk/3ls097J0RxCo48y0rDmiyOw23mz9SpIJFg1
         0JQwnT+by1S5qga5hhFCf5blbjk53pmtHOSJMpexWP2gJyH4a01T5uH013OCoT1LFxKL
         RLb4Nrggr2xaRcpb8ySSOWJCXwgqVmsxgzoAOjdMyvh0yabFDnaKqIMKh4jWOd7s0v9u
         wkHA==
X-Gm-Message-State: ANhLgQ1jDuYJMeNjDY7MCcMFnxIiImEhjqUQGG3uGmC657S9qkgTuPuX
        jyvotlc7aG9WYNCyTZngc5C9J8dsFDzMGv421sqzQg==
X-Google-Smtp-Source: ADFU+vtZ951rF9Pe1PQCmPcRvBusAbZvzsIhMkHMSpSrFf3GcmrMJYTcDuOyMXRjXOrOY86o2HZAMZ5iB1cF/I0Vr0o=
X-Received: by 2002:a9d:6c88:: with SMTP id c8mr5616850otr.272.1585223808543;
 Thu, 26 Mar 2020 04:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200313110350.10864-1-robert.foss@linaro.org>
 <20200313110350.10864-3-robert.foss@linaro.org> <20200313121746.GC5730@valkosipuli.retiisi.org.uk>
In-Reply-To: <20200313121746.GC5730@valkosipuli.retiisi.org.uk>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 Mar 2020 12:56:37 +0100
Message-ID: <CAG3jFytpx8_+DKhUVZnUFeMYK82Z1hFWcEnbyD0=4a8p3ojteg@mail.gmail.com>
Subject: Re: [v2 2/3] media: ov8856: Add devicetree support
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Sakari,

On Fri, 13 Mar 2020 at 13:18, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Robert,
>
> On Fri, Mar 13, 2020 at 12:03:49PM +0100, Robert Foss wrote:
> > Add devicetree match table, and enable ov8856_probe()
> > to initialize power, clocks and reset pins.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >
> > - Changes since v1:
> >   * Fabio: Change n_shutdown_gpio name to reset_gpio
> >   * Fabio: Invert reset_gpio due to GPIO_ACTIVE_HIGH -> GPIO_ACTIVE_LOW change
> >   * Fabio: Remove empty line
> >   * Fabio: Remove real error from devm_gpiod_get() failures
> >   * Andy & Sakari: Make XVCLK optional since to not break ACPI
> >   * Sakari: ARRAY_SIZE() directly instead of through OV8856_NUM_SUPPLIES
> >   * Sakari: Use XVCLK rate as provided by DT
> >
> >  drivers/media/i2c/ov8856.c | 109 ++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 107 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> > index 8655842af275..db61eed223e8 100644
> > --- a/drivers/media/i2c/ov8856.c
> > +++ b/drivers/media/i2c/ov8856.c
> > @@ -3,10 +3,13 @@
> >
> >  #include <asm/unaligned.h>
> >  #include <linux/acpi.h>
> > +#include <linux/clk.h>
> >  #include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fwnode.h>
> > @@ -19,6 +22,8 @@
> >  #define OV8856_LINK_FREQ_180MHZ              180000000ULL
> >  #define OV8856_SCLK                  144000000ULL
> >  #define OV8856_MCLK                  19200000
> > +#define OV8856_XVCLK_19_2            19200000
>
> Please use a single macro to refer to 19,2 MHz clock.

Alright, I'll combine the two into a macro for both.

>
> > +#define OV8856_XVCLK_24                      24000000
>
> This doesn't seem to be needed

As long as we don't set the clock to 24Mhz we don't.
I'm assuming that you're saying that the 24Mhz clock rate isn't needed
for the modes used currently.

Removing this macro in v3.

>
> >  #define OV8856_DATA_LANES            4
> >  #define OV8856_RGB_DEPTH             10
> >
> > @@ -64,6 +69,12 @@
> >
> >  #define to_ov8856(_sd)                       container_of(_sd, struct ov8856, sd)
> >
> > +static const char * const ov8856_supply_names[] = {
> > +     "dovdd",        /* Digital I/O power */
> > +     "avdd",         /* Analog power */
> > +     "dvdd",         /* Digital core power */
> > +};
> > +
> >  enum {
> >       OV8856_LINK_FREQ_720MBPS,
> >       OV8856_LINK_FREQ_360MBPS,
> > @@ -566,6 +577,10 @@ struct ov8856 {
> >       struct media_pad pad;
> >       struct v4l2_ctrl_handler ctrl_handler;
> >
> > +     struct clk              *xvclk;
> > +     struct gpio_desc        *reset_gpio;
> > +     struct regulator_bulk_data supplies[ARRAY_SIZE(ov8856_supply_names)];
> > +
> >       /* V4L2 Controls */
> >       struct v4l2_ctrl *link_freq;
> >       struct v4l2_ctrl *pixel_rate;
> > @@ -908,6 +923,46 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
> >       return ret;
> >  }
> >
> > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > +{
> > +     struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > +     int ret;
> > +
> > +     ret = clk_prepare_enable(ov8856->xvclk);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to enable xvclk\n");
> > +             return ret;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);
> > +
> > +     ret = regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
> > +                                 ov8856->supplies);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to enable regulators\n");
> > +             goto disable_clk;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_LOW);
> > +
> > +     usleep_range(1500, 1800);
>
> I think you could omit the delay on ACPI based systems. Or just bail out
> early in that case.

I'll add a check for reset_gpio being NULL, and skip the sleep for that case.

>
> > +
> > +     return 0;
> > +
> > +disable_clk:
>
> How about the GPIO here?

Ack

>
> > +     clk_disable_unprepare(ov8856->xvclk);
> > +
> > +     return ret;
> > +}
> > +
> > +static void __ov8856_power_off(struct ov8856 *ov8856)
> > +{
> > +     gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);
> > +     regulator_bulk_disable(ARRAY_SIZE(ov8856_supply_names),
> > +                            ov8856->supplies);
> > +     clk_disable_unprepare(ov8856->xvclk);
> > +}
>
> You'll need to call the two in the driver's suspend and resume functions.

Ack

>
> > +
> >  static int __maybe_unused ov8856_suspend(struct device *dev)
> >  {
> >       struct i2c_client *client = to_i2c_client(dev);
> > @@ -1175,7 +1230,7 @@ static int ov8856_remove(struct i2c_client *client)
> >  static int ov8856_probe(struct i2c_client *client)
> >  {
> >       struct ov8856 *ov8856;
> > -     int ret;
> > +     int i, ret;
>
> unsigned int?

Ack

>
> >
> >       ret = ov8856_check_hwcfg(&client->dev);
> >       if (ret) {
> > @@ -1189,10 +1244,50 @@ static int ov8856_probe(struct i2c_client *client)
> >               return -ENOMEM;
> >
> >       v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
> > +     ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> > +     if (PTR_ERR(ov8856->xvclk) == -ENOENT) {
> > +             dev_info(&client->dev, "xvclk clock not defined, continuing...\n");
>
> How about dev_dbg()?

Ack.

>
> > +             ov8856->xvclk = NULL;
> > +     } else if (IS_ERR(ov8856->xvclk)) {
> > +             dev_err(&client->dev, "could not get xvclk clock (%ld)\n",
> > +                     PTR_ERR(ov8856->xvclk));
> > +             return PTR_ERR(ov8856->xvclk);
> > +     }
> > +
> > +     ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
>
> This should either come from platform data, or perhaps it'd be even better
> to get the clock rate and use assigned-clock-rates. I guess that's
> preferred nowadays.

I'm a bit unsure about what this would look like.

Are you thinking something like the way ext_clk is used in smiapp_core.c?
I went ahead and implemented support for retrieving and storing
'clock-rates' during the ov8856_check_hwcfg() call, and then setting
the rate to the configured rate during probing.

>
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to set xvclk rate (24MHz)\n");
> > +             return ret;
> > +     }
> > +
> > +     ov8856->reset_gpio = devm_gpiod_get(&client->dev, "reset",
> > +                                            GPIOD_OUT_HIGH);
>
> Indentation.

Ack.

>
> What if no gpio is defined?

As per Andys comments, I'll switch to the optional version of devm_gpiod_get().

>
> > +     if (IS_ERR(ov8856->reset_gpio)) {
> > +             dev_err(&client->dev, "failed to get reset-gpios\n");
> > +             return PTR_ERR(ov8856->reset_gpio);
> > +     }
> > +
> > +     for (i = 0; i < ARRAY_SIZE(ov8856_supply_names); i++)
> > +             ov8856->supplies[i].supply = ov8856_supply_names[i];
> > +
> > +     ret = devm_regulator_bulk_get(&client->dev,
> > +                                   ARRAY_SIZE(ov8856_supply_names),
> > +                                   ov8856->supplies);
>
> What happens if there are no regulators?

Like Andy mentioned, we should be alright, since
devm_regulator_bulk_get() creates dummy regulators if one isn't found.

>
> > +     if (ret) {
> > +             dev_warn(&client->dev, "failed to get regulators\n");
> > +             return ret;
> > +     }
> > +
> > +     ret = __ov8856_power_on(ov8856);
> > +     if (ret) {
> > +             dev_warn(&client->dev, "failed to power on\n");
> > +             return ret;
> > +     }
> > +
> >       ret = ov8856_identify_module(ov8856);
> >       if (ret) {
> >               dev_err(&client->dev, "failed to find sensor: %d", ret);
> > -             return ret;
> > +             goto probe_power_off;
> >       }
> >
> >       mutex_init(&ov8856->mutex);
> > @@ -1238,6 +1333,9 @@ static int ov8856_probe(struct i2c_client *client)
> >       v4l2_ctrl_handler_free(ov8856->sd.ctrl_handler);
> >       mutex_destroy(&ov8856->mutex);
> >
> > +probe_power_off:
> > +     __ov8856_power_off(ov8856);
> > +
>
> Also remember to power off the device in remove().
>

Ack

> >       return ret;
> >  }
> >
> > @@ -1254,11 +1352,18 @@ static const struct acpi_device_id ov8856_acpi_ids[] = {
> >  MODULE_DEVICE_TABLE(acpi, ov8856_acpi_ids);
> >  #endif
> >
> > +static const struct of_device_id ov8856_of_match[] = {
> > +     { .compatible = "ovti,ov8856" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ov8856_of_match);
> > +
> >  static struct i2c_driver ov8856_i2c_driver = {
> >       .driver = {
> >               .name = "ov8856",
> >               .pm = &ov8856_pm_ops,
> >               .acpi_match_table = ACPI_PTR(ov8856_acpi_ids),
> > +             .of_match_table = ov8856_of_match,
> >       },
> >       .probe_new = ov8856_probe,
> >       .remove = ov8856_remove,
>
> --
> Regards,
>
> Sakari Ailus
