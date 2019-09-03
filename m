Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A23DA5FE8
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 05:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfICDuh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 23:50:37 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35080 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfICDuh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 23:50:37 -0400
Received: by mail-ed1-f65.google.com with SMTP id t50so17181585edd.2
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2019 20:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bERm9aosiUF/erxQGsOJQyA7y7i++Xkui77JsOdtACI=;
        b=eh39WEjYZ/TVREn6cDg0rilIJuu6Poeea3tHxjoQhPtzOhO5fXgh4Ass1e/NaK0Zyx
         OsYmSUUme3ZiGtHuUo7ytVrq6bDXgl/NEd0YeynBJaRLFJLtvnfoF9VynpwWhDBXhBbA
         2a6pKAMXImbYcaSI3SGsyXCZaV7ny8HRU+K5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bERm9aosiUF/erxQGsOJQyA7y7i++Xkui77JsOdtACI=;
        b=RnneDI5VM9leqoPFgeoiJmGAl7mm4oOP9hgSYRLAclPVmcaVfa6ufVDS4x4/PbOgYQ
         Caew6i3Pj35rPsJZKrvPwqtpCh/DSJoFAA1J6h4KQ+ZtlDEtAmORdRHW6LWB7+pLNw7m
         bq96qZ1764/2y90gIexJ/nMLgIvUvfpVEpBGWCmhTGpoJP3V8+cewljSjPMniQU/bWjs
         P3iSpo3hbOvk5bo9sH3xF631T1ahkFXKzRK33vOu4+u7U7RZGJ1rQjYq6aY0ySPR1JSb
         UFUYMZ6bLUHArc2F2o6WYgoyL5H8wFZcPM+z3sWja33844IGmdZri2ZJBs6FVqD7y42d
         MunQ==
X-Gm-Message-State: APjAAAU00FBBMnLoyL7XyF+I6RLAhJBa0jBPNCdsu9OBMT7CQs7zADhz
        1TPyK1yWJWQKAAE6EyDlpca8+QKfYvXnjQ==
X-Google-Smtp-Source: APXvYqyX3l9HnQwBYoIZPOBa66RCE2HNVSzYDZFvsPWIBuUbyAaFkLIIYnVcT2tFpztUZJhevnr4vA==
X-Received: by 2002:a05:6402:b29:: with SMTP id bo9mr1945117edb.10.1567482634884;
        Mon, 02 Sep 2019 20:50:34 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id n16sm1249799ejy.8.2019.09.02.20.50.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2019 20:50:33 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id 30so4818156wrk.11
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2019 20:50:32 -0700 (PDT)
X-Received: by 2002:adf:fc03:: with SMTP id i3mr33237705wrr.48.1567482631483;
 Mon, 02 Sep 2019 20:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190708100641.2702-1-dongchun.zhu@mediatek.com>
 <20190708100641.2702-3-dongchun.zhu@mediatek.com> <20190823081723.GA33937@chromium.org>
 <1567436507.21623.83.camel@mhfsdcap03>
In-Reply-To: <1567436507.21623.83.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 3 Sep 2019 12:50:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AWBFVF5Fh0OWpfkPid1wXYdi=MDdVukxaAKQg2dABnCA@mail.gmail.com>
Message-ID: <CAAFQd5AWBFVF5Fh0OWpfkPid1wXYdi=MDdVukxaAKQg2dABnCA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: dw9768: Add DW9768 VCM driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
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

On Tue, Sep 3, 2019 at 12:02 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2019-08-23 at 17:17 +0900, Tomasz Figa wrote:
> > Hi Dongchun,
> >
> > On Mon, Jul 08, 2019 at 06:06:41PM +0800, dongchun.zhu@mediatek.com wrote:
> > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > >
> > > This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> > > and provides control to set the desired focus.
> > >
> > > The DW9807 is a 10 bit DAC from Dongwoon, designed for linear
> > > control of voice coil motor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                |   1 +
> > >  drivers/media/i2c/Kconfig  |  10 +
> > >  drivers/media/i2c/Makefile |   1 +
> > >  drivers/media/i2c/dw9768.c | 458 +++++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 470 insertions(+)
> > >  create mode 100644 drivers/media/i2c/dw9768.c
> > >
> >
> > Thanks for the patch! Please see my comments inline.
> >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8f6ac93..17152d7 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -4877,6 +4877,7 @@ M:    Dongchun Zhu <dongchun.zhu@mediatek.com>
> > >  L: linux-media@vger.kernel.org
> > >  T: git git://linuxtv.org/media_tree.git
> > >  S: Maintained
> > > +F: drivers/media/i2c/dw9768.c
> > >  F: Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
> > >
> > >  DONGWOON DW9807 LENS VOICE COIL DRIVER
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 7793358..8ff6c95 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -1014,6 +1014,16 @@ config VIDEO_DW9714
> > >       capability. This is designed for linear control of
> > >       voice coil motors, controlled via I2C serial interface.
> > >
> > > +config VIDEO_DW9768
> > > +   tristate "DW9768 lens voice coil support"
> > > +   depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > +   depends on VIDEO_V4L2_SUBDEV_API
> > > +   help
> > > +     This is a driver for the DW9768 camera lens voice coil.
> > > +     DW9768 is a 10 bit DAC with 100mA output current sink
> > > +     capability. This is designed for linear control of
> > > +     voice coil motors, controlled via I2C serial interface.
> > > +
> > >  config VIDEO_DW9807_VCM
> > >     tristate "DW9807 lens voice coil support"
> > >     depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > index d8ad9da..944fbf6 100644
> > > --- a/drivers/media/i2c/Makefile
> > > +++ b/drivers/media/i2c/Makefile
> > > @@ -24,6 +24,7 @@ obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
> > >  obj-$(CONFIG_VIDEO_AD5820)  += ad5820.o
> > >  obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
> > >  obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
> > > +obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
> > >  obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
> > >  obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
> > >  obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
> > > diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> > > new file mode 100644
> > > index 0000000..f5b5591
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/dw9768.c
> > > @@ -0,0 +1,458 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2018 MediaTek Inc.
> > > + */
> > > +
> > > +#include <linux/delay.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-subdev.h>
> > > +
> > > +#define DW9768_VOLTAGE_ANALOG                      2800000
> >
> > This is a platform detail and should be defined in the platform data, for
> > example DTS on platforms using DT.
> >
>
> Thanks for your reminder.
> This would be fixed in next release.
>
> > > +#define DW9768_NAME                                "dw9768"
> >
> > The chip we seem to be using this driver for is called gt9769. Shouldn't we
> > call the driver the same?
> >
>
> It is also called DW9768 from camera module specification, which was
> initially confirmed with vendor.
>

Okay, thanks for clarifying.

Best regards,
Tomasz
