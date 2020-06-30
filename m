Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891A920F6FE
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 16:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732518AbgF3OUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 10:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgF3OUP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 10:20:15 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A26FC061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 07:20:15 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id b15so16394975edy.7
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 07:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K7kro9hNrZw4yDhFcFBRDmY6tQ/XNr6sZDxWZvaTmI4=;
        b=fbb+OAM/VHLXp9op4ixkqVNNxAQ+AO+wFy6+opDXTqYBpCyfnzhufpwAHCNZvaj8kg
         DJ+6uWN0mKRJ7bqj+Iv1hbIadPkNcXf/a7lA0O6qm5p1gS9JwHijs7FGKG/tUF1c/eG8
         7/dTNgZH+T8g7F1BjSSVshO7eeBQASWyG+Vd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K7kro9hNrZw4yDhFcFBRDmY6tQ/XNr6sZDxWZvaTmI4=;
        b=kFXCVdcSxPBZEj4/CKb2m0HDKUsvl9s3oHUBkyPzSrhA/miuo4eK+sDm5Y/HLinUV+
         flfZi7GK5SgkMuNrjlethxu2qMIoZvQPPHUx64KLFIo8GGIBmxkMLgl0hSl0Gbqz3syJ
         PSCzZiAZSfmkpVsSvt85bukgGOyqckdKIT7D9dZSzVWEJT+Hl6Ru+gxvUziHLABbtm4D
         e2eB2G2cDJA+pvC+iYLLXLUxJegpdWWNK2cru5//+DXRbah10IeVfKTmOQGk9oy1llye
         NUFdiv4WZGXlhV1cpEhximVzMSk58hdD8J7/D1Goey1hmaPYPqUK0184lA32n/ekIOXU
         M5zQ==
X-Gm-Message-State: AOAM531/SuMgbVcdaAYmY+cP6QCahtukAGEyGiB3SWDyUoK8pMKLEFOx
        meUfKnFDEMIzjzfUf1h3TLRMfDp8mto=
X-Google-Smtp-Source: ABdhPJyUP2FLENZSvXDK+X0JaAE9trhXWHqCNmEGheo/YdFDGIvOmxcBH8YnfWbhjKURz0+O/8bQuw==
X-Received: by 2002:a50:d80f:: with SMTP id o15mr23692260edj.156.1593526813950;
        Tue, 30 Jun 2020 07:20:13 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id u13sm2184847ejx.3.2020.06.30.07.20.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:20:12 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id o8so18994499wmh.4
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 07:20:11 -0700 (PDT)
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr22251088wmk.11.1593526811079;
 Tue, 30 Jun 2020 07:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com> <20200630095430.GF16711@paasikivi.fi.intel.com>
In-Reply-To: <20200630095430.GF16711@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 30 Jun 2020 16:19:59 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
Message-ID: <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 30, 2020 at 11:54 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dongchun,
>
> Thanks for the update.
>
> On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for OV02A10 image sensor.
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   13 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1067 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov02a10.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 378c961..a6a2f8b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12566,6 +12566,7 @@ L:    linux-media@vger.kernel.org
> >  S:   Maintained
> >  T:   git git://linuxtv.org/media_tree.git
> >  F:   Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > +F:   drivers/media/i2c/ov02a10.c
> >
> >  OMNIVISION OV13858 SENSOR DRIVER
> >  M:   Sakari Ailus <sakari.ailus@linux.intel.com>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index da11036..65519cf 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -812,6 +812,19 @@ config VIDEO_IMX355
> >         To compile this driver as a module, choose M here: the
> >         module will be called imx355.
> >
> > +config VIDEO_OV02A10
> > +     tristate "OmniVision OV02A10 sensor support"
> > +     depends on I2C && VIDEO_V4L2
> > +     select MEDIA_CONTROLLER
> > +     select VIDEO_V4L2_SUBDEV_API
> > +     select V4L2_FWNODE
> > +     help
> > +       This is a Video4Linux2 sensor driver for the OmniVision
> > +       OV02A10 camera.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called ov02a10.
> > +
> >  config VIDEO_OV2640
> >       tristate "OmniVision OV2640 sensor support"
> >       depends on VIDEO_V4L2 && I2C
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 993acab..384e676 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
> >  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
> >  obj-$(CONFIG_VIDEO_UPD64031A) += upd64031a.o
> >  obj-$(CONFIG_VIDEO_UPD64083) += upd64083.o
> > +obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
> >  obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
> >  obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
> >  obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
> > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > new file mode 100644
> > index 0000000..f7fd329
> > --- /dev/null
> > +++ b/drivers/media/i2c/ov02a10.c
>
> ...
>
> > +     ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>
>
> Shouldn't this be GPIOD_OUT_HIGH? That's the state it'll be after powering
> the sensor off the first time. Alternatively make reset signal high in
> runtime suspend callback.

We might want to keep the signals low when the regulators are powered
down, to reduce the leakage.

Best regards,
Tomasz
