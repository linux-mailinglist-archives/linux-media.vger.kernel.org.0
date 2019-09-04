Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB56A88D5
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 21:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730606AbfIDOdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 10:33:37 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41766 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729809AbfIDOdh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 10:33:37 -0400
Received: by mail-pg1-f196.google.com with SMTP id x15so11354322pgg.8;
        Wed, 04 Sep 2019 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DpaNQCLmwaNZZZkIvK2MRxioLu52IkmkkbV6j6lsSTI=;
        b=QVcLTD8SqHO2544hfbjXafPfCHNEZpwx54u/NHKLL3RwoTLbeAc5WRg90T9BucvGkw
         Z6IpK1fqesAiVvv3WYnGo3XvW7mKItcdFtUy/Bp4QODeexrlOeBRRkhuUAJ4czq3jN8y
         kUi/Q+fstAnVpRXlUSj41qfGFraX2Q+7Uwt1dxioZzqKoFxtedfDSN6mQKlQi/hfTRDo
         1myS+X5K21ZpE2a7Y7RyqRgkt91gc7/cgp8ewkCxV9Ij1udkymmbeNNvTEVufv4hePUw
         pvh5MvLdiiq7aBb0LfsPF8Bryro3CI+4fNdhZMYLqTjXhialouq7RaUdyHuN+U7+3h5b
         plCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DpaNQCLmwaNZZZkIvK2MRxioLu52IkmkkbV6j6lsSTI=;
        b=DGpps6+9mddSCoyq1CugLG9N93zfPPwpXsAAQlGFY7lgWEMOMyn2KIHWCCjqaKtJTq
         Ec+gpRheMkwx/h+MYJ0sdk3E7aHrqJnzt6Dt26fgqRqAUlqX5PsVJCWPzYasLPCOFCxE
         PFoJ0/jZUi5VtmREi/bBeCUH8eene/gGuWPAgkhlY060r0QzHKj3edoU3eTmOo8gHWX3
         6S+hIU0XqR6uiwYzhZksRp9YAzr6f8lIMsMFrwDs/lD4vyQtHeiURrxEew/6KDwuNksG
         j/D0ENUL3EcCfpgNeIx9ZdNNRXkV9V16+mtU0gu8RYKCHKGalrSODVO1NGxWMXpkqCsr
         tMtg==
X-Gm-Message-State: APjAAAWW3mCCN5nl03XLSsEZ49hC2B4pvFeCp4rCA70Vz5Mi/XjwRCD2
        TegljLgG3aXYcGjtQRqpYcTo6qZe5lyz2R6AwHs=
X-Google-Smtp-Source: APXvYqwTWnlU/s16wk/kQ7qUIsYPs2aUc2xvVztrYy95Dh8DHJPMltqAbOUq+3863Pi6+Ky/QZPyvefYIbOZMFIRgQw=
X-Received: by 2002:a63:6eca:: with SMTP id j193mr34647329pgc.74.1567607616694;
 Wed, 04 Sep 2019 07:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190708100641.2702-1-dongchun.zhu@mediatek.com> <20190708100641.2702-3-dongchun.zhu@mediatek.com>
In-Reply-To: <20190708100641.2702-3-dongchun.zhu@mediatek.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Sep 2019 17:33:25 +0300
Message-ID: <CAHp75VcV_tFNMm=oRNVBtwn8orQGuokSgT6YDzNVpQ0vXw_Yag@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: dw9768: Add DW9768 VCM driver
To:     dongchun.zhu@mediatek.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        sj.huang@mediatek.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>, louis.kuo@mediatek.com,
        shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 8, 2019 at 5:13 PM <dongchun.zhu@mediatek.com> wrote:
>
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
>
> This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> and provides control to set the desired focus.
>
> The DW9807 is a 10 bit DAC from Dongwoon, designed for linear
> control of voice coil motor.

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + */

2019?

> +       if (!client->adapter)
> +               return -ENODEV;

Is it ever possible?

> +       w_buf = kzalloc(size, GFP_KERNEL);
> +       if (!w_buf)
> +               return -1;

Error code?

> +       do {
> +               ret = i2c_transfer(client->adapter, &msg, 1);

> +               if (ret != 1)
> +                       dev_err(&client->dev, "write fail, ret:%d, retry:%d\n",
> +                               ret, retry_cnt);

This is noise. And better to use positive condition.

> +               else
> +                       break;

> +               retry_cnt--;
> +       } while (retry_cnt != 0);
> +

} while (--retry_cnt);

> +       if (retry_cnt == 0)     {
> +               dev_err(&client->dev, "i2c write fail(%d)\n", ret);
> +               return -EIO;
> +       }

> +
> +       kfree(w_buf);
> +
> +       return 0;
> +}

> +static int dw9768_power_off(struct dw9768_device *dw9768_dev, bool standby)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&dw9768_dev->sd);
> +       int ret;
> +
> +       /*
> +        * Go to standby first as real power off my be denied by the hardware
> +        * (single power line control for both dw9768_dev and sensor).
> +        */
> +       if (standby) {
> +               dw9768_dev->standby = true;
> +               ret = dw9768_release(dw9768_dev);

> +               if (ret)

> +                       dev_err(&client->dev, "dw9768_release failed!\n");

Is it fatal or not?

> +       }

> +       ret = regulator_disable(dw9768_dev->analog_regulator);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

return regulator_disable(...);

> +}

> +               dev_err(dw9768_dev->sd.dev, "%s fail error: 0x%x\n",
> +                       __func__, hdl->error);

Non-informative message.

> +static int dw9768_probe(struct i2c_client *client)
> +{
> +       struct device *dev = &client->dev;
> +       struct dw9768_device *dw9768_dev;
> +       int rval;
> +
> +       dw9768_dev = devm_kzalloc(&client->dev, sizeof(*dw9768_dev),
> +                                 GFP_KERNEL);
> +       if (!dw9768_dev)
> +               return -ENOMEM;
> +
> +       dw9768_dev->analog_regulator = devm_regulator_get(dev, "afvdd");
> +       if (IS_ERR(dw9768_dev->analog_regulator)) {

> +               dev_err(dev, "cannot get analog regulator\n");

Would be noise in case of deferred probe.

> +               return PTR_ERR(dw9768_dev->analog_regulator);
> +       }

> +err_cleanup:
> +       mutex_destroy(&dw9768_dev->power_lock);
> +       dw9768_subdev_cleanup(dw9768_dev);

> +       dev_err(dev, "Probe failed: %d\n", rval);

Noise. Device core has this already.

> +       return rval;
> +}

> +static const struct i2c_device_id dw9768_id_table[] = {
> +       { DW9768_NAME, 0 },
> +       { { 0 } }

{} is enough.

> +};
> +MODULE_DEVICE_TABLE(i2c, dw9768_id_table);
> +
> +static const struct of_device_id dw9768_of_table[] = {
> +       { .compatible = "dongwoon,dw9768" },

> +       { { 0 } }

Ditto.

> +};

-- 
With Best Regards,
Andy Shevchenko
