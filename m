Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5884181600
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 11:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgCKKjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 06:39:32 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42024 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgCKKjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 06:39:32 -0400
Received: by mail-ed1-f67.google.com with SMTP id n18so2232095edw.9
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 03:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DxijMBuiLsxw7t2g7CXkgOmSgK6hDMEET+2/cVCHNEY=;
        b=SIsS5H8UD/WV5ztOazlBsTFhkcLn+Sd6aqlxqzxFJswOvQwDJg8Oi97FHQh9V0BBah
         KPbNTo5AVaMBj0UWgqSLWBhCe7pEYpkwPCl8Dyihpl9nyTdpwsbwGMb74soIr9cx28e/
         scRiIsLRYPj6pzdtqAxx0x9wwUBnUETEb6+0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DxijMBuiLsxw7t2g7CXkgOmSgK6hDMEET+2/cVCHNEY=;
        b=f1h2CZS1x9yqtxi58aAppJaT2dRfFpoNQ2h1tSQYnjsg0nd3zTO9HIq0O1UDBNKvvO
         7raP44EOZ5KaS+yul9zMowVQIxqIEe8FMwrfOCwDKvm4avjVCjs9o0mB4wPXgK1QhVXm
         b9PwGy5E7QzMUuCWX41E1P9VG2JXWpYqE1yMtYX6MqgLR9AuCtd2l9ZEQNeH9MsZ5MSj
         5I0qoPC+cdSSt7kSumPPTCPLhadVtRmqsUkX7Bg4vJGWkkUzKipEx3ZU6gFS9L+CpJre
         upOY6oDV+MM7ME8jfywdBQvSAk1F9VupNG4+2yVsLliR5nXLO18xvcbUb6c4obP+3bNw
         dy2Q==
X-Gm-Message-State: ANhLgQ3eHhpQeCwz0Nv6oj9y0n59bLq2X1BT8hIlqlN8e0RG3pkLUoDn
        WohOn/y8gEtRO1Heb1gBhDIi6tfRW+A=
X-Google-Smtp-Source: ADFU+vttyBrrhVJ/Zolq+Ndp3C33YTKFGQuYIMnqZq+8A9C/mUa5DiCPdbNRXOXYVaRVxjtoREjkMw==
X-Received: by 2002:a17:906:6d53:: with SMTP id a19mr1003872ejt.343.1583923169843;
        Wed, 11 Mar 2020 03:39:29 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id l11sm2732116ejq.21.2020.03.11.03.39.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 03:39:28 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 6so1481508wmi.5
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 03:39:28 -0700 (PDT)
X-Received: by 2002:a7b:c3cf:: with SMTP id t15mr3055951wmj.183.1583923167823;
 Wed, 11 Mar 2020 03:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191220130800.61589-1-tfiga@chromium.org> <20191220151939.GA19828@paasikivi.fi.intel.com>
In-Reply-To: <20191220151939.GA19828@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 11 Mar 2020 19:39:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AvAk3D34VsC3kKqHZQY9=wHHttf6_R0orEcfWsiA2PHA@mail.gmail.com>
Message-ID: <CAAFQd5AvAk3D34VsC3kKqHZQY9=wHHttf6_R0orEcfWsiA2PHA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5695: Fix power on and off sequences
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sat, Dec 21, 2019 at 12:19 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz,
>
> On Fri, Dec 20, 2019 at 10:08:00PM +0900, Tomasz Figa wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> >
> > From the measured hardware signal, OV5695 reset pin goes high for a
> > short period of time during boot-up. From the sensor specification, the
> > reset pin is active low and the DT binding defines the pin as active
> > low, which means that the values set by the driver are inverted and thus
> > the value requested in probe ends up high.
> >
> > Fix it by changing probe to request the reset GPIO initialized to high,
> > which makes the initial state of the physical signal low.
> >
> > In addition, DOVDD rising must occur before DVDD rising from spec., but
> > regulator_bulk_enable() API enables all the regulators asynchronously.
> > Use an explicit loops of regulator_enable() instead.
> >
> > For power off sequence, it is required that DVDD falls first. Given the
> > bulk API does not give any guarantee about the order of regulators,
> > change the driver to use regulator_disable() instead.
> >
> > The sensor also requires a delay between reset high and first I2C
> > transaction, which was assumed to be 8192 XVCLK cycles, but 1ms is
> > recommended by the vendor. Fix this as well.
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > ---
> >  drivers/media/i2c/ov5695.c | 41 +++++++++++++++++++++-----------------
> >  1 file changed, 23 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> > index d6cd15bb699ac..8d0cc3893fcfc 100644
> > --- a/drivers/media/i2c/ov5695.c
> > +++ b/drivers/media/i2c/ov5695.c
> > @@ -971,16 +971,9 @@ static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
> >       return ret;
> >  }
> >
> > -/* Calculate the delay in us by clock rate and clock cycles */
> > -static inline u32 ov5695_cal_delay(u32 cycles)
> > -{
> > -     return DIV_ROUND_UP(cycles, OV5695_XVCLK_FREQ / 1000 / 1000);
> > -}
> > -
> >  static int __ov5695_power_on(struct ov5695 *ov5695)
> >  {
> > -     int ret;
> > -     u32 delay_us;
> > +     int i, ret;
> >       struct device *dev = &ov5695->client->dev;
> >
> >       ret = clk_prepare_enable(ov5695->xvclk);
> > @@ -991,21 +984,24 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
> >
> >       gpiod_set_value_cansleep(ov5695->reset_gpio, 1);
> >
> > -     ret = regulator_bulk_enable(OV5695_NUM_SUPPLIES, ov5695->supplies);
> > -     if (ret < 0) {
> > -             dev_err(dev, "Failed to enable regulators\n");
> > -             goto disable_clk;
> > +     for (i = 0; i < OV5695_NUM_SUPPLIES; i++) {
> > +             ret = regulator_enable(ov5695->supplies[i].consumer);
>
> The regulator voltage takes some time before it settles. If the hardware
> requires a particular order, then presumably there should be a small delay
> to ensure that. 1 ms should be plenty.

The regulator API guarantees that when regulator_enable() returns, the
voltage is stable. Regulator ramp up delays can be also configured via
DT to take care for per-platform variability.

>
> I also think it'd be necessary to add a comment here explaining the
> requirements for enabling regulators, as otherwise I expect someone to
> "fix" this sooner or later.

True. Let me add a comment.

>
> Same for powering off.
>

Same as above.

Best regards,
Tomasz
