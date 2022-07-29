Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66A4A58531B
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 17:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237075AbiG2Pwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 11:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbiG2Pwe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 11:52:34 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BC38735E
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 08:52:33 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id mf4so9272634ejc.3
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 08:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0Iv3IbUj8NfSoCWl+tYVDpug79IdYKzvJVHVZ+KxSAA=;
        b=FODAkIwiRfjV5+wiD5i6VGa3pyF+borC0/I3b57xlTp9sRk/uQc4Ht16O9GItdiqhD
         HGPtQxWK0oiFTLvDb86rfjBBUN/9IYUtHWeEuSnh6cEQu277eG2ZRau5ug6/IqJwf7Hx
         FVrKHNovRLZSyGzqpHWCFFn/+7nH9cZ/37wTr+76WVo67dDM3Tial8uoFPamzUx+keAd
         +8ej0mPvm3jo/GTLhjn5DCl+qR23stepME64sWpaqfZERS2YT5krQVpaGv8YryGAfybK
         tJ+q/htc04YRqq36idngu5IV+oRmlWC9EWCzUfjvMy7yuIPWHggswIKK8UKSE/qX4dfx
         vTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0Iv3IbUj8NfSoCWl+tYVDpug79IdYKzvJVHVZ+KxSAA=;
        b=5l3bThdKwHVLrEG6oru/6g0ST4dZloRpCJe9af8Ozl9OQjdf55rW6ImkVq5RetJr5x
         WkJRIspg69XJ1OyTE/dF7mAZenDRwJSdK3qh78fBCgV4/zYM8nV6FxuXQjNC009R1nNw
         cq0VzDMxCUjEeEP3SR8pq14HJG62/CYKx95/OKzii8bsHoEKh5HVKhHZtBGlRRyKcchi
         XhrRzgqHrzh1aReR6sw+nq/akU9C4dqE5q1BxgU9V+H1a4f1A2m2pxkVUBdFanEtnnPX
         MIW+iSS33bZbA1iCU1vBj/qYxrfV63YIHzCIe4vTTGeY+MhaOjmhDeSxyVe7KPgK4YuW
         4sZQ==
X-Gm-Message-State: AJIora/r9r+y66YoJrMhKjTQRCl8Drgohq+L0+2pE9ccUm4JWvKD+XCp
        /r5lt8N0K7DUpKiepjDSKvW0cMr25Skus+nqLWaX4TY0Rcw=
X-Google-Smtp-Source: AGRyM1tH+EyJ6k3Dkn1COi1GvpQ2Wb96oh/4HElFk7NF4EFOIVfWbZh+mhBmrYuIfB9tp3sI40Fx3TSmigWkuc8uRcI=
X-Received: by 2002:a17:907:c06:b0:701:eb60:ded with SMTP id
 ga6-20020a1709070c0600b00701eb600dedmr3488859ejc.178.1659109951533; Fri, 29
 Jul 2022 08:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114050.2400475-1-hljunggr@cisco.com> <20220728114050.2400475-5-hljunggr@cisco.com>
In-Reply-To: <20220728114050.2400475-5-hljunggr@cisco.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 29 Jul 2022 17:51:54 +0200
Message-ID: <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
To:     Erling Ljunggren <hljunggr@cisco.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jonathan Selnes <jonathansb1@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 28, 2022 at 1:53 PM Erling Ljunggren <hljunggr@cisco.com> wrote:
>
> From: Jonathan Selnes <jonathansb1@gmail.com>
>
> Support reading and writing the EDID EEPROM through the
> v4l2 API.
>
> Signed-off-by: Jonathan Selnes <jonathansb1@gmail.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>

Wondering if the last two people don't do any development, otherwise
Co-developed-by would be appreciated.

...

>  obj-$(CONFIG_VIDEO_HI556) += hi556.o
>  obj-$(CONFIG_VIDEO_HI846) += hi846.o
>  obj-$(CONFIG_VIDEO_HI847) += hi847.o
> +obj-$(CONFIG_VIDEO_CAT24C208) += cat24c208.o

Perhaps more sorted?

>  obj-$(CONFIG_VIDEO_I2C) += video-i2c.o
>  obj-$(CONFIG_VIDEO_IMX208) += imx208.o
>  obj-$(CONFIG_VIDEO_IMX214) += imx214.o

...

> +/*
> + * cat24c208 - HDMI i2c controlled EEPROM from ON Semiconductor or Catalyst Semiconductor

Here...

> + * cat24c208.c - Support for i2c based DDC EEPROM

...and here and in general putting filename into the file is not a
good idea in the long term. For example, this can be expanded in the
future to support more EDID EEPROMs, and if we want to rename, this
adds an additional burden.

> + * Copyright (C) 2021-2022 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + */

...

> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>

> +#include <linux/of_device.h>

Why? Who is the user of this?
Perhaps you meant mod_devicetable.h, which is currently missed?

> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/videodev2.h>

> +#include <linux/kernel.h>

Perhaps keep it ordered?

...

> +/*
> + * From the datasheet:

Maybe  add an URL to the Datasheet?

> + * The write cycle time is the time from a valid stop condition of a write
> + * sequence to the end of the internal program/erase cycle. During the write
> + * cycle, the bus interface circuits are disabled, SDA is allowed to remain
> + * high, and the device does not respond to its slave address.
> + */
> +#define WRITE_CYCLE_TIME_US    5000

...

> +       struct i2c_client *dev_client = state->i2c_clients[0];
> +       struct i2c_client *data_client = state->i2c_clients[1];
> +       struct i2c_client *seg_client = state->i2c_clients[2];

Why not have those clients named accordingly in the data struct,
instead of indexing them?

...

> +       if (seg)
> +               err = i2c_transfer(dev_client->adapter, msg, ARRAY_SIZE(msg));
> +       else
> +               err = i2c_transfer(dev_client->adapter, &msg[1], 1);
> +       if (err < 0)
> +               dev_err(&dev_client->dev, "Writing to 0x%x failed (segment %d)\n",
> +                       data_client->addr, seg);

> +       usleep_range(WRITE_CYCLE_TIME_US, 2 * WRITE_CYCLE_TIME_US);

Sleep even in case of error? Is it required?
(Same Q per other similar places)

> +       return err < 0 ? err : 0;

Hence here...

...

> +       if (err < 0)
> +               dev_err(&dev_client->dev, "Reading of EDID failed\n");
> +       return err < 0 ? err : 0;

...and here we can avoid a duplication test for error code being set, right?
(Same suggestion per other similar cases)

...

> +       static const u8 header_pattern[] = {
> +               0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00

Keeping a comma at the end is good anyway.

> +       };

...

> +       state = kzalloc(sizeof(*state), GFP_KERNEL);
> +       if (!state)
> +               return -ENOMEM;

devm_kzalloc() ?

...

> +               blocks = 1 + state->edid[126];

Magic index.

...

> +               .of_match_table = of_match_ptr(cat24c208_of_match),

of_match_ptr() brings more harm than help.

-- 
With Best Regards,
Andy Shevchenko
