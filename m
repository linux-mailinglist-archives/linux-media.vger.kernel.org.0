Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72E5318028A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 16:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgCJPzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 11:55:32 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37025 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgCJPzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 11:55:31 -0400
Received: by mail-ot1-f65.google.com with SMTP id b3so13646748otp.4
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TgqmscoWWwUwE2N+wjkp7klbD8Llg5aD9QxcbbWM91M=;
        b=SbYgGqz6Iv/cF2Xk6HbsmaZYROCsChtMTCZqVrowfSBNRknWfl4l1M2KOEsbDuDViG
         gz35NNiTeGIUs6AKuQ85hd+LpOAnbrCsiqXjdX8KQqXe7sYPAN3+qsNvVCKZfIlRisfw
         d8FdhZRhYobG0/brLgrhPttDTXvZDKY2co3aN4RN+AwRGvicLAZZiSbWUv4cmlcMSEYV
         y3pCA+lmAWxqQ1Zt2ktlka8bQcuydF8d6bzmMRc/6QhsiRaYsUAFs5SzkAyLyKI8wrmc
         s1TDcwRI8TNmjAenvUK7oftIL/kYKvWncS50htb8hL0Me+hB5c2JE7d9rw/gD2+mtj4P
         5H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TgqmscoWWwUwE2N+wjkp7klbD8Llg5aD9QxcbbWM91M=;
        b=mNsy6ReH1P72hEQjFBVp5t8PkAdndpk+MrvBXAJeaSRtQmHoWdcQVPxl4mHt0ducYS
         pUzmX23LGoGBYrkOzh5453VyZaMLk54XiS6wMIoxz58/kUeGLBZtK5z5eyeduo7HIiz2
         +ik2W2vKw6WaX5iFz53RL9/1+4RtP0Pgy0QxECNBs6AnK9g0MlCM5S8C0+naCL7iKdiG
         RsaabqpZy4bS+QnGSSP2qmZQE9RsiorlfBrriq+qHjeNNECF3Q99br/b0z9Nzr5LL6Qg
         V1bUIZsvNJtMgP1tslRAYW1BbWTIShK7iuxT9LwQBmUbFPxZ+cTdFhd6JKnVkyHMwlje
         BeHA==
X-Gm-Message-State: ANhLgQ0a3U1r5xaBIo6ANnPthYTR2LxXYCyw7UxGG4Hih+r0sNPA7jpv
        U4JGwzGZv/HFHuWNlUv+Hkabz0WzYKC/PeNBAUlQdg==
X-Google-Smtp-Source: ADFU+vva3WOrofQsiULBwLdHFTnTgcGCFkvcJUnV+SV2B4eVtEQKOTmFmG4oUCa5cat2xXUgVCBlj6+tobSNOz5bcMI=
X-Received: by 2002:a9d:19e9:: with SMTP id k96mr17670341otk.68.1583855731083;
 Tue, 10 Mar 2020 08:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-3-robert.foss@linaro.org> <20200310142652.GK1922688@smile.fi.intel.com>
In-Reply-To: <20200310142652.GK1922688@smile.fi.intel.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 10 Mar 2020 16:55:20 +0100
Message-ID: <CAG3jFyu5S1H=r6pV92tc_a2LoCUnhb0mDbOegP2BCO8a5C1nVg@mail.gmail.com>
Subject: Re: [v1 2/3] media: ov8856: Add devicetree support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     ben.kao@intel.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, matthias.bgg@gmail.com, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Tue, 10 Mar 2020 at 15:26, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Mar 10, 2020 at 02:46:02PM +0100, Robert Foss wrote:
> > Add devicetree match table, and enable ov8856_probe()
> > to initialize power, clocks and reset pins.
>
> ...
>
> > +#define OV8856_NUM_SUPPLIES ARRAY_SIZE(ov8856_supply_names)
>
> Use ARRAY_SIZE() directly.

Ack.

>
> Have you seen Sakari's comments?
> Sakari, do I have d=C3=A9j=C4=85 vu or you indeed commented this driver?

Yes, I may have missed some part of it, so please tell me if I have.

There is a patchset floating around that implements a larger chunk of
functionality,
including a couple of new modes. This is based on that series.

>
> ...
>
> > +     gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
>
> > +     gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_HIGH);
>
> Yes, seems this one is inverted.
>
> ...
>
> > +{
> > +     gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> > +     regulator_bulk_disable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> > +     clk_disable_unprepare(ov8856->xvclk);
> > +}
> > +
> > +
>
> One blank line is enough.
>
> ...
>
> > +     ov8856->xvclk =3D devm_clk_get(&client->dev, "xvclk");
> > +     if (IS_ERR(ov8856->xvclk)) {
> > +             dev_err(&client->dev, "failed to get xvclk\n");
> > +             return -EINVAL;
> > +     }
>
> Previously it worked without clock provider, now you make a dependency.
>
> This won't work.

So the ideal behavior would be to only use the xclk if it is provided?
