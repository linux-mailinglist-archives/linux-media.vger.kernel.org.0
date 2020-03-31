Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFD11997A2
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 15:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730947AbgCaNhh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 09:37:37 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39756 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730216AbgCaNhg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 09:37:36 -0400
Received: by mail-ot1-f66.google.com with SMTP id x11so22017498otp.6
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2020 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BPQgN4wp/xTiSdMQdV45T5G+Dpby0aslGWWXLQEqKs8=;
        b=f6egg8JB2oXmb5ZDcYSi37IoKdai/7O4iwDdS9tB5EdjG1fdejo+ualHWyXatNehYR
         MzuHVPjLmDt6I3mEnAV5vFbzaEDV3VPFLNpNOh9u1Y40GU1HMTPq3hWa6Ce+M6GQiG4b
         mneV32UAu3ydLOrO+Z4VV8rcPZmrygUm8uZsnmj/Te1Ef8SFeyqA5s845DdfJ+euHwLY
         NeaZljdmTifBJtQuuV/ekejxCON62UGXsMwWI8Sc7UbD5+iHUWdzyxY3T4ka19793baM
         Nl/S/m+Mys1Ba6C0/1gDd20aGwIa+3Sko7XR8PvXx54mJfhNJ4jofvoAtgq17f+5ntL1
         uQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPQgN4wp/xTiSdMQdV45T5G+Dpby0aslGWWXLQEqKs8=;
        b=gbani+5Swlnk0WsOv/sLaOCNI26ZpaS09WWzEIKqLnJTNG4YKQ4TlXzMwNSrCOPIWf
         mC1PUB3K2mmDM/naKtu9MzmQoO01e4z29+ywf3HcOJ4ONrCLXgSH3LBCSe3W+fy8EhRp
         C+ZhAXt6rCGbM46+8uhJyGYVdAAxGknQL/fME9xXYVIQr1NL+OutMCgKNlQB0wWMjNvm
         BZ1ncrEc5CwsSVnKGqPkX61H6L0+0Zn4xLKYxvXiSTwz7C9zrWWjBwNymb9nXP8nGFK/
         897ti3pZrQGBMAzXaMGzH5PAvVNWggnGNfA1FNJnx3QyX8g75sBEw5u5DN3gZ11D4mC2
         78sA==
X-Gm-Message-State: ANhLgQ2qJqB6a0iH73eoLzcVg5yBCydoav7tsL+AAZUFFH8KEUKQ2pn7
        JjjiT/xcvlhEFwI+7a/WSIzJ279dHZh1t8VpI2yLDA==
X-Google-Smtp-Source: ADFU+vt5IKuc9tkmr+ASuJda0bZuWGWC0a0b+1r6JL9yr89+s9e71Nso2ucKWJ4k0ClJnzYWXoG2EP313c1QbdzqZj8=
X-Received: by 2002:a9d:6c88:: with SMTP id c8mr12319517otr.272.1585661854175;
 Tue, 31 Mar 2020 06:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200313110350.10864-1-robert.foss@linaro.org>
 <20200313110350.10864-3-robert.foss@linaro.org> <CAOMZO5D9bmXt9_qGTXw+qUG6JDHfuNtx++fJPJtn+mj1Dzsbag@mail.gmail.com>
In-Reply-To: <CAOMZO5D9bmXt9_qGTXw+qUG6JDHfuNtx++fJPJtn+mj1Dzsbag@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 31 Mar 2020 15:37:22 +0200
Message-ID: <CAG3jFystdBKnosNQ0LeWQfHEtMgU4iGSr_XuS2XU3-902c31nQ@mail.gmail.com>
Subject: Re: [v2 2/3] media: ov8856: Add devicetree support
To:     Fabio Estevam <festevam@gmail.com>
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

On Thu, 26 Mar 2020 at 13:18, Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Fabio,
>
> On Fri, 13 Mar 2020 at 14:15, Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Robert,
> >
> > On Fri, Mar 13, 2020 at 8:04 AM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > > +{
> > > +       struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > > +       int ret;
> > > +
> > > +       ret = clk_prepare_enable(ov8856->xvclk);
> > > +       if (ret < 0) {
> > > +               dev_err(&client->dev, "failed to enable xvclk\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);
> >
> > The parameter of gpiod_set_value_cansleep() is typically 0 (inactive
> > state) or 1 (active state), so:
> >
> >  gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
>
> Ack

After testing this change, it breaks the driver during probing.
I had a quick look into GPIOD_OUT_HIGH & LOW definitions, and they
seem to never be 0 or 1.

https://elixir.bootlin.com/linux/latest/source/include/linux/gpio/consumer.h#L38

GPIOD_ASIS = 0,
GPIOD_IN = 1,
GPIOD_OUT_LOW = 3
GPIOD_OUT_HIGH = 7
