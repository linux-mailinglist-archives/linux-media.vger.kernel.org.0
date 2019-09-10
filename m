Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5EF8AEB66
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 15:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731373AbfIJNX5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 09:23:57 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35862 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfIJNX5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 09:23:57 -0400
Received: by mail-ed1-f67.google.com with SMTP id f2so10732818edw.3
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2019 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+PDMnoMOZ+kvJoFaPE97rZHpufI4c8A38UCrkXHFlJU=;
        b=AXUKjG+l//8seadMNLusLEBTu3rzNUbjG0SN5RIAmwZNBS2rvm7Y8KZmmNmfobq5Yg
         tWX/2NWRUbLAXG8k/1lfoNdUCk88UFpz6/hEZNALkYb+oSBOWIH5NrtNn/sAQ8mOnFJd
         dZAPS6RZBHXV+gjfPHQ5yX5PZBAgIq5/IV6Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+PDMnoMOZ+kvJoFaPE97rZHpufI4c8A38UCrkXHFlJU=;
        b=ej8y3pheUvUzjInhNCSIJzSssS4PmJ0R1cbeQBovkbohgYMj3/rsy4PHQGrhGvegp4
         sYTo+MJjIgrm05QFB4fpiXhw0+z26BqO3AmEQqaEjae2wXTTg7xInESsRmBEFb2R7r/f
         56g4A9qpTBs/N+ZV+0Z8Dt1T1/6UHJ2h3/uy5UwrjmP8M8WM9Zr+H+9GX3NyD3y6KWRU
         N2FZnUpQSeBNyD1kv+vvak+9K++e5mA7I07DCPO2VKDFHfbm4xZ/y8lkCWAQZanrsGG1
         Q4R6TU6GuzzVoTFlU7pGBV/W+JHLiByAapp1b3RFU7/Oejobt650pQ8LCQCKKz0+Nob3
         XvCg==
X-Gm-Message-State: APjAAAWB8ZCTbUw6orE0diiTFs6OL6FuNyDcd49aXLxFeb23LoJPbtgW
        mx6Xz51boW8kRyIiQ3zb/27pjP04iPkhow==
X-Google-Smtp-Source: APXvYqwzBdqmPFclpgzNX5anrivEXYVSQIv0DdmEEyGYNinhnsuBnlgX8+dOqXpjJsEhc+yaO481dA==
X-Received: by 2002:a50:a41c:: with SMTP id u28mr30566836edb.185.1568121832983;
        Tue, 10 Sep 2019 06:23:52 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id o22sm506129edc.13.2019.09.10.06.23.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2019 06:23:52 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id l11so20207198wrx.5
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2019 06:23:51 -0700 (PDT)
X-Received: by 2002:a5d:6585:: with SMTP id q5mr24858527wru.162.1568121830850;
 Tue, 10 Sep 2019 06:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190808092215.5608-1-dongchun.zhu@mediatek.com>
 <20190808092215.5608-3-dongchun.zhu@mediatek.com> <20190823100126.GB33937@chromium.org>
 <1568021243.21623.250.camel@mhfsdcap03>
In-Reply-To: <1568021243.21623.250.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 10 Sep 2019 22:23:39 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BUmTpVoZdZ1pLvD5fi4V0nLNokv+0GmbjZvjFQiVUSag@mail.gmail.com>
Message-ID: <CAAFQd5BUmTpVoZdZ1pLvD5fi4V0nLNokv+0GmbjZvjFQiVUSag@mail.gmail.com>
Subject: Re: [V1, 2/2] media: i2c: Add more sensor mode for ov8856 camera sensor
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>,
        shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Mon, Sep 9, 2019 at 6:27 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2019-08-23 at 19:01 +0900, Tomasz Figa wrote:
> > Hi Dongchun,
> >
> > On Thu, Aug 08, 2019 at 05:22:15PM +0800, dongchun.zhu@mediatek.com wrote:
[snip]
> > > +
> > >  /* vertical-timings from sensor */
> > >  #define OV8856_REG_VTS                     0x380e
> > >  #define OV8856_VTS_MAX                     0x7fff
> > > @@ -64,6 +80,14 @@
> > >
> > >  #define to_ov8856(_sd)                     container_of(_sd, struct ov8856, sd)
> > >
> > > +static const char * const ov8856_supply_names[] = {
> > > +   "dovdd",        /* Digital I/O power */
> > > +   "avdd",         /* Analog power */
> > > +   "dvdd",         /* Digital core power */
> > > +};
> > > +
> > > +#define OV8856_NUM_SUPPLIES ARRAY_SIZE(ov8856_supply_names)
> > > +
> > >  enum {
> > >     OV8856_LINK_FREQ_720MBPS,
> > >     OV8856_LINK_FREQ_360MBPS,
> > > @@ -316,6 +340,208 @@ static const struct ov8856_reg mode_3280x2464_regs[] = {
> > >     {0x5e00, 0x00}
> > >  };
> > >
> > > +static const struct ov8856_reg mode_3264x2448_regs[] = {
[snip]
> > > +};
> > > +
> >
> > It would be better if we could find the differences between the two arrays
> > and handle them incrementally.
> >
>
> This approach is not recommended.
>

Not recommended by whom? :) I myself recommend that approach.

I'm sorry, but I'm going to NACK this patch (including the
chromeos-4.19 tree), unless there is a very good technical reason not
to do it the way I'm suggesting. The other drivers do it that way and
I see no reason why this one should be an exception.

> For these two arrays, sensor input clock frequencies (19.2MHz, 24MHz)
> are different, corresponding to different PLL register setting.
>
> Besides, there are also some differences in image resolution and
> hts/vts, including 0x3614 register that reflecting sensor revision.
>

What would be the reason preventing us from handling that in driver code?

Note that I do _not_ mean just taking addresses and values that are
different and putting them to a separate array. What I'm asking for is
to handle the differences in a programmatic way - with dedicated code
in the driver setting appropriate registers.

[snip]

> > > +           fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > > +   else
> > > +           fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> > > +
> > >     fmt->field = V4L2_FIELD_NONE;
> > >  }
> > >
> > > @@ -850,6 +1333,17 @@ static int ov8856_start_streaming(struct ov8856 *ov8856)
> > >             return ret;
> > >     }
> > >
> > > +   /* update R3614 for 1B module */
> >
> > What's R3614?
> >
>
> R3614 is the register 0x3614, which reflects the sensor revision.
> For instance, it would be 0x20 for 1B module, while 0x60 for 2A module.
>

My point is - this comment doesn't mean anything for a person reading
it. The code below is actually more meaningful - you can see that the
clock settings register is written with a value for 1B.

> > > +   if (ov8856->is_1B_module) {
> > > +           ret = ov8856_write_reg(ov8856, OV8856_CLK_REG,
> > > +                                  OV8856_REG_VALUE_08BIT,
> > > +                                  OV8856_CLK_REG_1B_VAL);

Please define this value according to what it means, not a fixed
constant for 1B sensor revision.

> > > +           if (ret) {
> > > +                   dev_err(&client->dev, "failed to set R3614");
> > > +                   return ret;
> > > +           }
> > > +   }
> > > +
> > >     ret = __v4l2_ctrl_handler_setup(ov8856->sd.ctrl_handler);
> > >     if (ret)
> > >             return ret;
> > > @@ -882,6 +1376,8 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
> > >     if (ov8856->streaming == enable)
> > >             return 0;
> > >
> > > +   dev_dbg(&client->dev, "hardware version: (%d)\n", ov8856->is_1B_module);
> > > +
> > >     mutex_lock(&ov8856->mutex);
> > >     if (enable) {
> > >             ret = pm_runtime_get_sync(&client->dev);
> > > @@ -908,6 +1404,54 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
> > >     return ret;
> > >  }
> > >
> > > +/* Calculate the delay in us by clock rate and clock cycles */
> > > +static inline u32 ov8856_cal_delay(u32 cycles)
> > > +{
> > > +   return DIV_ROUND_UP(cycles, OV8856_XVCLK_FREQ / 1000 / 1000);
> > > +}
> > > +
> > > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > > +{
> > > +   int ret;
> > > +   u32 delay_us;
> > > +   struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > > +
> > > +   ret = clk_prepare_enable(ov8856->xvclk);
> > > +   if (ret < 0) {
> > > +           dev_err(&client->dev, "Failed to enable xvclk\n");
> > > +           return ret;
> > > +   }
> > > +
> > > +   gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> >
> > According to my datasheet, this sensor doesn't have a reset pin. The one I
> > can see there is XSHUTDN, which I would call "n_shutdn" here.
> >
>
> I would rename this pin in next release.
> BTW, how do you define "n_shutdn" or "shuutdn"?
> If GPIO is actively high, then "n_shutdn"?
>

If the GPIO is active-high (means shutdown on high) then it's just
"shutdn_gpio". However, the datasheet says it's active-low (means
shutdown on low), so that should be "n_shutdn_gpio".

> > > +
> > > +   ret = regulator_bulk_enable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> > > +   if (ret < 0) {
> > > +           dev_err(&client->dev, "Failed to enable regulators\n");
> > > +           goto disable_clk;
> > > +   }
> > > +
> > > +   gpiod_set_value_cansleep(ov8856->reset_gpio, 0);
> >
> > According to the datasheet, XSHUTDN should be 0 for shutdown and 1 for
> > running. Why is it the other way around here?
> >
>
> For GPIO, the definition of bit field of flags defined in DT seems
> reversed.
> This would be fixed in next release.
>
> > > +
> > > +   /* 8192 cycles prior to first SCCB transaction */
> > > +   delay_us = ov8856_cal_delay(8192);
> >
> > If we pass a constant to the function and the function itself only uses
> > constants inside, could we just define a constant delay instead?
> >
>
> This calculation refers to powering up sequence in datasheet.
> Did you mean using usleep_range() directly?

My point is, we can just

#define OV8856_SCCB_INIT_DELAY_US    (8192 * [...])

[...]

usleep_range(OV8856_SCCB_INIT_DELAY_US, OV8856_SCCB_INIT_DELAY_US + 200);

>
> > > +   usleep_range(delay_us  * 2, delay_us * 4);
> >
> > Normally one one just give some small delta here, like +/- 100 us.
> >
>
> Fixed in next release.
>
> > > +
> > > +   return 0;
> > > +
> > > +disable_clk:
> > > +   clk_disable_unprepare(ov8856->xvclk);
> > > +
> > > +   return ret;
> > > +}
> > > +
> > > +static void __ov8856_power_off(struct ov8856 *ov8856)
> > > +{
> > > +   clk_disable_unprepare(ov8856->xvclk);
> > > +   gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > > +
> > > +   regulator_bulk_disable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> > > +}
> > > +
> > >  static int __maybe_unused ov8856_suspend(struct device *dev)
> > >  {
> > >     struct i2c_client *client = to_i2c_client(dev);
> > > @@ -915,8 +1459,8 @@ static int __maybe_unused ov8856_suspend(struct device *dev)
> > >     struct ov8856 *ov8856 = to_ov8856(sd);
> > >
> > >     mutex_lock(&ov8856->mutex);
> > > -   if (ov8856->streaming)
> > > -           ov8856_stop_streaming(ov8856);
> > > +
> > > +   __ov8856_power_off(ov8856);
> >
> > This change is incorrect because it will power off even if the device was
> > already powered off, causing reference count mismatch. The original code
> > was okay.
> >
>
> Then do we need to power off sensor per power off sequence?
> I thought this function would be called by pm_runtime_put when power
> count is 0.
>

This is the system suspend callback, not runtime suspend callback.
It's only called when the system goes to sleep.

> > >
> > >     mutex_unlock(&ov8856->mutex);
> > >
> > > @@ -1089,6 +1633,20 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
> > >             return -ENXIO;
> > >     }
> > >
> > > +   /* set R3614 to distinguish harward versions */
> >
> > hardware
> >
>
> Sorry for the typo.
> Fixed in next release.
>

Also a similar comment for R3614, as above. It doesn't have any
meaning to someone without the datasheet in front of them. Please just
remove it.

Best regards,
Tomasz
