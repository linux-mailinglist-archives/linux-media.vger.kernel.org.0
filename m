Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E518325AB3F
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 14:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgIBMic (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 08:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgIBMib (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 08:38:31 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02D9C061244
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 05:38:30 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id w1so4746614edr.3
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t3qYc2zJNg0FAofaOlnrSHg3j0Es/PFZqbZlp5eYzeo=;
        b=OG9uscYYRkC/LHCVfNlrRKTpe4pHFmvEfgYIH2AtEftlQB2si8LY1cgMyXPxQs9HuY
         7yJV4TNLo4AyWcd7o88djryRDb/quiVyupDYFPvk74Q1546/hqQVdQ+DNgK6oK+aJ6fF
         LVIGrOw+hftqCThrUSRhBnfAGbDp46SqJ0J9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t3qYc2zJNg0FAofaOlnrSHg3j0Es/PFZqbZlp5eYzeo=;
        b=cjbqC+EPHOyDXYFVAvxBFc40PQJZkoB+V0MnHF6xAfQn3EBerpH/yc+LZFJNVt2wNO
         2HWy2XHDI1QBP5tb5gkR8ChhevMYyte3qq/8daqM6cz5tmuvN6uaBREmm3Bx4qWkY1yL
         +3JtgpWv1Jobylgai8umj2ucOYlTn3f4AZmHxX6crY1gA3jnWgKKhVhQW/LtPUi1GJSE
         hvSDZSbGuFNbx9PEwbklx/FRcbRaP7GQALTsXx4KKWkyeWWTvEidxwzjjqfQbkYYHN4h
         a+9XgoC/B7wTPsnqSqi7NTXhix3vaCBOzwP6R/zCYrx+Xb3/YfPqfx/zIu5RUOgDMEOy
         I7LA==
X-Gm-Message-State: AOAM532zC95YpI7X5zGyk7Hp++aj8j6LPBdVWpM+MqAPfaAh3swYjAuy
        e8UnYgt0YZGaz/wUqDD7g4RDsgPzbhUrTg==
X-Google-Smtp-Source: ABdhPJyAQYLriGzFlOO9JIltLpqpLHuEElD6wIei2fE0JYLUoK9W1iK2vwHdG4NqU2nJhG+9ct1bWA==
X-Received: by 2002:aa7:d4d2:: with SMTP id t18mr2364321edr.55.1599050309293;
        Wed, 02 Sep 2020 05:38:29 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id bc18sm3858923edb.66.2020.09.02.05.38.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 05:38:28 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id l9so4367528wme.3
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 05:38:28 -0700 (PDT)
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr456259wme.127.1599050307551;
 Wed, 02 Sep 2020 05:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200703080404.29770-1-dongchun.zhu@mediatek.com>
 <20200703080404.29770-3-dongchun.zhu@mediatek.com> <20200902053535.GC2264887@google.com>
In-Reply-To: <20200902053535.GC2264887@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 2 Sep 2020 14:38:04 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AyBb7XT3fz1e6_fAer=QT=L_h-QPhp+ngQb0pHCkY49Q@mail.gmail.com>
Message-ID: <CAAFQd5AyBb7XT3fz1e6_fAer=QT=L_h-QPhp+ngQb0pHCkY49Q@mail.gmail.com>
Subject: Re: [PATCH V10 2/2] media: i2c: dw9768: Add DW9768 VCM driver
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Wed, Sep 2, 2020 at 7:35 AM Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> On (20/07/03 16:04), Dongchun Zhu wrote:
> [..]
> > +static int dw9768_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev = &client->dev;
> > +     struct dw9768 *dw9768;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     dw9768 = devm_kzalloc(dev, sizeof(*dw9768), GFP_KERNEL);
> > +     if (!dw9768)
> > +             return -ENOMEM;
> > +
> > +     /* Initialize subdev */
> > +     v4l2_i2c_subdev_init(&dw9768->sd, client, &dw9768_ops);
> > +
> [..]
> > +     dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> > +
> > +     pm_runtime_enable(dev);
> > +     if (!pm_runtime_enabled(dev)) {
> > +             ret = dw9768_runtime_resume(dev);
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to power on: %d\n", ret);
> > +                     goto err_clean_entity;
> > +             }
> > +     }
> > +
> > +     ret = v4l2_async_register_subdev(&dw9768->sd);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> > +             goto err_power_off;
> > +     }
>
> I would expect to see a slightly different order here: first set
> everything up, then expose the device to PM subsystem.
>

Thanks for chiming in. However, the code above is correct. Runtime PM
callbacks don't usually rely on the availability of any
userspace-facing components, while the opposite is true - when the
device is registered to the userspace, it must have all the
initialization aspects completed and that includes initialization of
runtime PM.

> [..]
> > +static int dw9768_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +     struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > +
> > +     v4l2_async_unregister_subdev(&dw9768->sd);
> > +     v4l2_ctrl_handler_free(&dw9768->ctrls);
> > +     media_entity_cleanup(&dw9768->sd.entity);
> > +     pm_runtime_disable(&client->dev);
> > +     if (!pm_runtime_status_suspended(&client->dev))
> > +             dw9768_runtime_suspend(&client->dev);
> > +     pm_runtime_set_suspended(&client->dev);
>
> Ditto. Shall we first disable PM (so that we won't get any unexpected
> PM callbacks) and then destroy the device?

Ditto. +/- the opposite order

Best regards,
Tomasz
