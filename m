Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC8E20E0E6
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 23:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388123AbgF2Uup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 16:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731431AbgF2TNe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:13:34 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9B7C008618
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 03:29:57 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id h28so12393326edz.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 03:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PhguteWn+BNL2rOz+hmBG6LMc95B72qiCMa6M5a1mog=;
        b=GryIZOgwWXWQdlINYt+x/02V6RsfowLZwhA3TrXCr0kgs/XolUBKkiYBVjZIeZVq6U
         B0A+U5FpFXsT10NBtK+1s80jnmBYvKFrjgCI6zXkQLKW1c9oDO0LQ4FLIsfYd0rfHVAx
         jfAXF26rS6rgbwq+ioEFJHVIJaG2W8rmmHqW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PhguteWn+BNL2rOz+hmBG6LMc95B72qiCMa6M5a1mog=;
        b=V9JveaevMUvloezjIdx2xzEOcvASD2RW3EjOxPPwK4BcI8UJxnXdYpzQ6YHK7mdQL8
         pAU4MFIY1HZvKoG+eatxE0ry2ZKKBpl80pN9VkZYwW/ZYVYaa4gOtvx8LG2HCBghCQT6
         0eeTgQ7ViSOZ8ItNk6SZf4noLI5hmgWWgsMOiIkvrarntYtepyPJHz2Ijan1o5djRUcl
         4+8lzvJ6gkSuk/PwHp6VCcGASrfBxaZqarD3EmF1rbudI5nlkah9sahHbvghRS6BnmR0
         CadJYvT1PXX1VvzUCnktGYyuw15lR70Px2PbvXQw6Bborh0+CA5zb2TnVw0wNk3Jz5JX
         S2AQ==
X-Gm-Message-State: AOAM532texPwNwgPjVPNBQ0pNw6PXH8RvvTyaJOb3kFu0Ptt3bxlVmmx
        oRq1+px4wrIaACHGfw6Q8w4QjhHH5SJSIA==
X-Google-Smtp-Source: ABdhPJwxQQ5X3IsNw5mp896b98SgGEfOn/VBsmNfXtwwPScBWDnj7ovAIgKJJ40W3thX/1XzD2Yf9Q==
X-Received: by 2002:aa7:c341:: with SMTP id j1mr17505669edr.197.1593426595821;
        Mon, 29 Jun 2020 03:29:55 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id p14sm2127658edr.23.2020.06.29.03.29.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 03:29:55 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id s10so15950125wrw.12
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 03:29:55 -0700 (PDT)
X-Received: by 2002:adf:80e6:: with SMTP id 93mr15866385wrl.17.1593426145911;
 Mon, 29 Jun 2020 03:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-3-dongchun.zhu@mediatek.com> <20200618191026.GA73379@chromium.org>
 <1592639284.8804.712.camel@mhfsdcap03> <20200622152350.GB260716@chromium.org> <1593412218.17166.3.camel@mhfsdcap03>
In-Reply-To: <1593412218.17166.3.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 29 Jun 2020 12:22:14 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Bi+Dh85Wz5q4RMGQvKw3aHFWWgypKsNukg_MwF4_ceCw@mail.gmail.com>
Message-ID: <CAAFQd5Bi+Dh85Wz5q4RMGQvKw3aHFWWgypKsNukg_MwF4_ceCw@mail.gmail.com>
Subject: Re: [PATCH V10 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 29, 2020 at 8:30 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> Thanks for the review.
>
> On Mon, 2020-06-22 at 15:23 +0000, Tomasz Figa wrote:
> > On Sat, Jun 20, 2020 at 03:48:04PM +0800, Dongchun Zhu wrote:
> > > Hi Tomasz,
> > >
> > > Thanks for the review.
> > >
> > > On Thu, 2020-06-18 at 19:10 +0000, Tomasz Figa wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Mon, Jun 15, 2020 at 08:29:37PM +0800, Dongchun Zhu wrote:
> > > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  MAINTAINERS                 |    1 +
> > > > >  drivers/media/i2c/Kconfig   |   13 +
> > > > >  drivers/media/i2c/Makefile  |    1 +
> > > > >  drivers/media/i2c/ov02a10.c | 1042 +++++++++++++++++++++++++++++++++++++++++++
> > > > >  4 files changed, 1057 insertions(+)
> > > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > > >
> > > >
> > > > Thank you for the patch. Please see my comments inline.
> > > >
> > > > [snip]
> > > > > +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> > > > > +                          struct v4l2_subdev_pad_config *cfg,
> > > > > +                          struct v4l2_subdev_format *fmt)
> > > > > +{
> > > > > +       struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > > +       struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > > > +
> > > > > +       mutex_lock(&ov02a10->mutex);
> > > > > +
> > > > > +       if (ov02a10->streaming) {
> > > > > +               mutex_unlock(&ov02a10->mutex);
> > > > > +               return -EBUSY;
> > > > > +       }
> > > > > +
> > > > > +       /* Only one sensor mode supported */
> > > > > +       mbus_fmt->code = ov02a10->fmt.code;
> > > > > +       ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > > > +       ov02a10->fmt = fmt->format;
> > > > > +
> > > > > +       if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > > > > +               *v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> > > >
> > > > If fmt->which is V4L2_SUBDEV_FORMAT_TRY, the internal driver state must not
> > > > be affected. It also should not depend on whether the sensor is streaming
> > > > or not. Basically it should be considered a special "candidate" format,
> > > > which isn't programmed to the hardware, but just stored aside.
> > > >
> > >
> > > Hmm. Maybe we shall use FORMAT_TRY like this:
> > > struct v4l2_mbus_framefmt *frame_fmt;
> > > ...
> > > if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > >     frame_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
> > > else
> > >     frame_fmt = &ov02a10->fmt;
> > >
> > > *frame_fmt = *mbus_fmt;
> > >
> > > (Remove 'ov02a10->fmt = fmt->format;' above)
> > >
> >
> > Yes, I guess that should work. Also the ov02a10->streaming condition
> > shouldn't be checked if fmt->which is V4L2_SUBDEV_FORMAT_TRY).
> >
>
> Maybe we shall use more strict condition to check streaming state:
> 'if (ov02a10->streaming)' --> 'if (ov02a10->streaming && fmt->which ==
> V4L2_SUBDEV_FORMAT_ACTIVE)'

Yes, that should work.

Best regards,
Tomasz
