Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92BA117FFB9
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 15:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgCJODe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 10:03:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34865 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgCJODe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 10:03:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id u12so10064736ljo.2;
        Tue, 10 Mar 2020 07:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ifhb6WixgJc6nnbKnnyQJ5Lzp6hUyVHScR9nCG2Gpbs=;
        b=u/Co4rThARQN6d7BB1WsDIguEHyOZRCEDSZ0aRzABmG4KiGoaSXNCxJ58kdF8RglmZ
         gUnmXg+cCZPlIcy4f7UEKRTBY7kdnb3tx26a30cChFyc+0UooSQdco73Ea02bzTBSO8O
         in29jyjpDTvoX8UYVBipDQUTb9Y6gMpRm2hD8BbIWsLyHqSXtZ0qUkTSOKIzI6PN7Qyx
         9LgqsrUYKEoiBPLBabe7csVgtNEvCdfHfnowfQn+zzUqDW/3AWI8rdEhkj7Hvwys5CGI
         /OHIfDVPS1k+NrLNmhYuEci+squRepbPr1LlncIJb+KxKdbTn4ecJv8+hqK+J321emRy
         S3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ifhb6WixgJc6nnbKnnyQJ5Lzp6hUyVHScR9nCG2Gpbs=;
        b=rYgPFG+j0QNV3OqAKkJl7OJPAHTVUe7dvOYJ4CdFnn9Gzhpk1/crSN9JiLqc5w/ODT
         4kPtlwnOyqk5EvDa1S14HFjcYg9Vv2815v+Tfu0Aq0/ay03RlZfDCuCK7TLkfoxZDFRl
         NktgSGW5sdVikV3F4Wgh+fvAtv61Z2G9dFSxTD/rlr5/AQCOyI1EzcwLWqgrWZX1mdE/
         0xuE1NsTfqog4IvYzZ3rlT9hRA42JodesIiBPkFxjyqMj/+y91mHFSdK9rBwVRR6RgNk
         Cz8nLVWU+HMv9488sHl9aJ83pOL/vUMkCdEUchYph1VWb01eYtTe/ffdO9cLgM31fbpq
         D2JQ==
X-Gm-Message-State: ANhLgQ0xEns1acN85wIKVg5+iMEKdFeHR4dX1uhpnm71wDOPAj+i06AN
        QCL0gwGDHxd7jMfhVF25b4tVqExirs4gAO0hJxM=
X-Google-Smtp-Source: ADFU+vsNLzcIjQvDxrS1HICTwW6HgMn3cbq+aL6cnnKZeK97nAmGn2kplnEXtqTHoWwA5L+xcBE8jylw4kWIQlYByr4=
X-Received: by 2002:a2e:86d0:: with SMTP id n16mr12557218ljj.117.1583849010466;
 Tue, 10 Mar 2020 07:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200310134603.30260-1-robert.foss@linaro.org> <20200310134603.30260-3-robert.foss@linaro.org>
In-Reply-To: <20200310134603.30260-3-robert.foss@linaro.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 10 Mar 2020 11:03:21 -0300
Message-ID: <CAOMZO5D7N6FfPMiycGun-eui-G-tbp15stwRWBWs4L98JHFfGA@mail.gmail.com>
Subject: Re: [v1 2/3] media: ov8856: Add devicetree support
To:     Robert Foss <robert.foss@linaro.org>
Cc:     ben.kao@intel.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan.Cameron@huawei.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 10, 2020 at 10:47 AM Robert Foss <robert.foss@linaro.org> wrote:

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
> +       gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> +
> +       ret = regulator_bulk_enable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to enable regulators\n");
> +               goto disable_clk;
> +       }
> +
> +       gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_HIGH);

To power it up you probably only need:

gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, 0);

And use reset-gpios as active low in your device tree. Assuming the
reset-gpios is active low like other OmniVision sensors.

> +
> +       usleep_range(1500, 1800);
> +
> +       return 0;
> +
> +disable_clk:
> +       clk_disable_unprepare(ov8856->xvclk);
> +
> +       return ret;
> +}
> +
> +static void __ov8856_power_off(struct ov8856 *ov8856)
> +{
> +       gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> +       regulator_bulk_disable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> +       clk_disable_unprepare(ov8856->xvclk);
> +}
> +
> +

Unneede extra blank line.

>         v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
> +       ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> +       if (IS_ERR(ov8856->xvclk)) {
> +               dev_err(&client->dev, "failed to get xvclk\n");
> +               return -EINVAL;

You should better return the real error insteald
PTR_ERR(ov8856->xvclk). This way defer probe could work.

> +       }
> +
> +       ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to set xvclk rate (24MHz)\n");
> +               return ret;
> +       }
> +
> +       ov8856->n_shutdn_gpio = devm_gpiod_get(&client->dev, "reset",
> +                                              GPIOD_OUT_LOW);
> +       if (IS_ERR(ov8856->n_shutdn_gpio)) {
> +               dev_err(&client->dev, "failed to get reset-gpios\n");
> +               return -EINVAL;

Please return the real error.
