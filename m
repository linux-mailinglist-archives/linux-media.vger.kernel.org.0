Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05D1F1847C2
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 14:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgCMNPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 09:15:46 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40962 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgCMNPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 09:15:46 -0400
Received: by mail-lf1-f65.google.com with SMTP id q10so7822168lfo.8;
        Fri, 13 Mar 2020 06:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KIlDjbCvX/lL3/UnPy9wEqymHeVXohWQ8Y8B1yC6PRM=;
        b=KzAls5VPN5rgeewhLttE0V+ho/T3Ym0N8W6508ZiquWU0EYsOUdidva2DssKJ4lYxn
         uHXqUJDkB86E2t5r/eB9iGlGisYdIMLmBQiH9MPnfYOmEDVnllOVfQLj9HF709kiHpnp
         cwU1mUkswFKeNpF3GtRHEYFOlpNkR2g1mgkD2dORECKUvUHKGYiLIRo6j++y873uepg7
         jaerNMJFJshhCNfgPdd2sD5V+MMOfB4oM7iQax4TYMZN9TQHwN9KxGIUJHtaOGJEmqTg
         oipHY3FV1tu/xMXCFIhIZ57QRrzeaB7TMzVGFXmdex3iWpZ6c3VDdxKiIXzNYMUC+Ad3
         q5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KIlDjbCvX/lL3/UnPy9wEqymHeVXohWQ8Y8B1yC6PRM=;
        b=SnjqDp86+FZAmAp0xTcYDN+BUZWqFba29Oc8MOxb31udC4pYRAQo1eKPq/Irt9hSdM
         ourFXHZ/0jQR0xhg1GJZVrZPa3xE95SXeT+uKCpYD/qXAN0KJcrySfWE2dA0weNJnSzP
         jB2k73IhpoIcQowKyQ7tVuoSB9rxjHBnJTuuznEK4xOAbukhXyPxlCouGUkPCdwW7XnA
         6VG/JRuhUhSHSzobGCIwzzIQoNDyV0YkpqOQz+qmVX8tc7CPWGrPXRq0pI1p3UYdBDm9
         CfNzEoaZxUYcWEJ8H8x5AlZ4qyBVP8PE/sK1BHgJ3prKY90dgOU07MTEVdk2MQabwnXr
         eUkw==
X-Gm-Message-State: ANhLgQ3JA3o0VINVtw5bIqmu82Ib+y/10n4geJb/zgWSN9IS0JLNw0VP
        H3OAg3fbIgP9HTSuS4OEiG0LsA+Q2is+2LjnMHE=
X-Google-Smtp-Source: ADFU+vu3syumX09pf4wOKGU3FAmPDFh1VT9bOFZcHAgG0CF2SaVacKKBMemJsFE1v+otRGv8dY21fvqrZd57AKGk+4w=
X-Received: by 2002:a05:6512:1054:: with SMTP id c20mr8394251lfb.69.1584105343706;
 Fri, 13 Mar 2020 06:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200313110350.10864-1-robert.foss@linaro.org> <20200313110350.10864-3-robert.foss@linaro.org>
In-Reply-To: <20200313110350.10864-3-robert.foss@linaro.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 13 Mar 2020 10:15:31 -0300
Message-ID: <CAOMZO5D9bmXt9_qGTXw+qUG6JDHfuNtx++fJPJtn+mj1Dzsbag@mail.gmail.com>
Subject: Re: [v2 2/3] media: ov8856: Add devicetree support
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
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

Hi Robert,

On Fri, Mar 13, 2020 at 8:04 AM Robert Foss <robert.foss@linaro.org> wrote:

> +static int __ov8856_power_on(struct ov8856 *ov8856)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> +       int ret;
> +
> +       ret = clk_prepare_enable(ov8856->xvclk);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to enable xvclk\n");
> +               return ret;
> +       }
> +
> +       gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);

The parameter of gpiod_set_value_cansleep() is typically 0 (inactive
state) or 1 (active state), so:

 gpiod_set_value_cansleep(ov8856->reset_gpio, 1);

> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
> +                                   ov8856->supplies);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to enable regulators\n");
> +               goto disable_clk;
> +       }
> +
> +       gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_LOW);

and here it should be:

gpiod_set_value_cansleep(ov8856->reset_gpio, 0);

Also, don't you need a reset period between the two?
