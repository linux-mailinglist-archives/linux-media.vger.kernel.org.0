Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7816825B6E4
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 01:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgIBXAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 19:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbgIBW7o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 18:59:44 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E67C061244
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 15:59:44 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id n22so672096edt.4
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 15:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K6cGerCxO46Qm24iFA5aZEL6UdjUDW3jjNLe5Ls8bmw=;
        b=jGdZtAdc7CvPt+P2PuAbn91E6yyatAb+8jgjU+0k3SbWdjhBWYOEa+KKGF/DNvtW66
         en6JA8kGE7oWpnaCF9TivIQ7+3Wq0KMsx0qHCQo9Z0s+0Hp789sEBg4fQNaaLg2TRPun
         LHR6LIHcTsZo10OmpUpN2XpJpF5YaKSPfVhv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K6cGerCxO46Qm24iFA5aZEL6UdjUDW3jjNLe5Ls8bmw=;
        b=L0I6isI+PPPjmacWJl7CKCUFN2QTndWGWUUkX7x6mQPPtFyca0avh04baptnsxF363
         rwEOryIp/QgxFy+UeY8yvSWo+JBWnysnLoskwUmojst9S9uEFjrOYov5hYKRrwG6WZF9
         BOlinr95s+hTswegwDdMmBTXiF1S+DLw7JpB+fI5m7xnAGcEiNjAaMb9Sjx7CMux69BF
         Lz8CvFgTE8+lbEyMiTpEFRZ0E6oW9gFKDyi6zoSCTp5q0BB82cAO+3dVaU4KeQzTy632
         AyJg0isMFdnNFaGnELJj3t//yoOCFpYTrySnLq75MW5gmDGdshAqBpYYls/HVSbX9G2r
         5Ezw==
X-Gm-Message-State: AOAM532oS0qavIxcjyzvAxjwl0wsXXIlz5sEgKkF5Pu19yGb4caGGXvG
        uNtTDWMPoafR9OFLjqhciKxBP97QIN0Bkw==
X-Google-Smtp-Source: ABdhPJw/WrdRElDxZljCwPtTBIa/FQTpJ6Bci8obowrOP7CsREfimBw8NYrIDQhfoSzC8gJlq/2k1A==
X-Received: by 2002:a05:6402:b72:: with SMTP id cb18mr119010edb.299.1599087582442;
        Wed, 02 Sep 2020 15:59:42 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id y14sm1017095eje.10.2020.09.02.15.59.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 15:59:41 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id z4so1066595wrr.4
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 15:59:41 -0700 (PDT)
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr416596wrt.32.1599087580861;
 Wed, 02 Sep 2020 15:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <1597380295-6297-1-git-send-email-wuxy@bitland.com.cn>
 <1597380295-6297-5-git-send-email-wuxy@bitland.com.cn> <20200831174057.GO31019@paasikivi.fi.intel.com>
In-Reply-To: <20200831174057.GO31019@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 3 Sep 2020 00:59:20 +0200
X-Gmail-Original-Message-ID: <CAAFQd5ARYNVMjScuk5-w_z5Pt6jD=CPkCYG+rM2Znvt9j1Od6g@mail.gmail.com>
Message-ID: <CAAFQd5ARYNVMjScuk5-w_z5Pt6jD=CPkCYG+rM2Znvt9j1Od6g@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] media: i2c: gc5035: Add GC5035 image sensor driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Xingyu Wu <wuxy@bitland.com.cn>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "shawnx.tu" <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "dave.stevenson" <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Sj Huang <sj.huang@mediatek.com>,
        darfur_liu <darfur_liu@gcoreinc.com>,
        "hao.he7" <hao.he7@gmail.com>,
        =?UTF-8?B?5L2V5rWpQjAzMjA1?= <hao.he@bitland.com.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Mon, Aug 31, 2020 at 7:41 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Xingyu,
>
> Thanks for the update. I've got a few more comments below.
>
> Do you happen to have some insight on what the OTP data contains and what
> does the driver do with it?
>
> At least in principle the OTP data may be programmed for the customer so
> the same sensor could contain something else what the driver expects to
> find there.
>

Thanks for the review. For anything without my reply, assume fixed. :)

As far as I can see, the data is being read from an area that is
supposed to be reserved for Galaxycore, so I'd assume it doesn't
depend on the customer.

[snip]
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index da11036..aeaf594 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -712,6 +712,18 @@ config VIDEO_APTINA_PLL
> >  config VIDEO_SMIAPP_PLL
> >       tristate
> >
> > +config VIDEO_GC5035
> > +     tristate "Galaxycore GC5035 sensor support"
> > +     depends on I2C && VIDEO_V4L2
> > +     select MEDIA_CONTROLLER
> > +     select VIDEO_V4L2_SUBDEV_API
>
> Add:
>
>         V4L2_FWNODE
>         OF

This driver doesn't depend on OF. It uses the firmware-independent
property access API. (v4 I sent actually uses device_property_*()).

[snip]
> > +static int __gc5035_power_on(struct gc5035 *gc5035)
> > +{
> > +     struct device *dev = &gc5035->client->dev;
> > +     int i, ret;
> > +
> > +     ret = clk_prepare_enable(gc5035->xvclk);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to enable xvclk\n");
> > +             return ret;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(gc5035->reset_gpio, 1);
> > +
> > +     for (i = 0; i < GC5035_NUM_SUPPLIES; i++) {
> > +             ret = regulator_enable(gc5035->supplies[i].consumer);
> > +             if (ret) {
> > +                     dev_err(dev, "Failed to enable %s: %d\n",
> > +                             gc5035->supplies[i].supply, ret);
> > +                     goto disable_reg_clk;
>
> Please use regulator_bulk_enable() here, and regulator_bulk_disable()
> below.
>

This actually needs to have one of the regulators (iovdd) enabled
before the other ones, but regulator_bulk_enable() is async. In v4 I
used regulator_enable() for iovdd and regulator_bulk_enable() for the
other two for optimal sequencing.

Best regards,
Tomasz
