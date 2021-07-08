Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B1C3C14C5
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 15:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbhGHOAz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 10:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbhGHOAz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 10:00:55 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B44C061574;
        Thu,  8 Jul 2021 06:58:13 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id bg14so9766502ejb.9;
        Thu, 08 Jul 2021 06:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X4qt0wVH0QhfISGoZ2TdbwDYVS2o7e6p+1hm7yDFUI8=;
        b=t46CYqZsKP1VChYxYyxWdTePbU+3tcjjPFIKITI/qu6a4WCXf0iwl+1ekVf97SwL0i
         bQpg9XTHhoIbJhuUVAUY+XTa9+JmesO2SMxHXB5orSBPhanbViKyXKPGDM2kC9Jn8tKB
         B7SQxrMO1jvQSmCnY9fY/Tfqa1+khEoKdPX0bncBV800FEVgO0SGjktc5raFwDHqgDVI
         X2ltMV9oDPeX/KZUNkIoYMFOmkmcyNMkAznMSm0p4DdrtHSiMLXAMtdocg+e7Py53tjP
         lMd1rEl77ICbR1o25+zBWT0uWIbCTzrzW0wnSJcBC1g+VNqY576e8kuhsIIOsk0V9EeG
         OxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X4qt0wVH0QhfISGoZ2TdbwDYVS2o7e6p+1hm7yDFUI8=;
        b=EVKsyygjcaWLoXnS+Recja+08igOrUuw38XzgTQ4D6DM4iC7fzu7vLBKcyfOgIrdE6
         o9IZ4yryDwOWX5S9VUH81BVoncaVw/ZP+5eOShicHpqj+JShIOqLkzEM0KnwyRElYt0E
         fRY+HlCMuv5LOeoCiDPaKXDQzqBHl/TFmycZ7dy3Vq2MPv3ujQTy1dNtemZfP3+NxYkw
         IG77Z08H4hhfN4AwM2Euf/uuYk5pAE7+ikIowrVyVQ1vnTPsY/XNJ1xkxYBzoiRJO4rL
         YkSkYnUvAp6h8LBPTgAq0oJiZatQj2eWRsAOszvf5BpwsR8EEfHcpSlqkEHlkAOvla+C
         6Tdw==
X-Gm-Message-State: AOAM531Blu+vdXxAmA3il7GDLjKj5abFuhY4gAWqzMdj/tu0koXKjDD/
        bxqY/q/TGh2eUtbwByaTQKANQ86D74+hcESYD2M=
X-Google-Smtp-Source: ABdhPJyxZtWy9FPRhxKZ7dds12JrOUCU9TNACLcbn4HSSc+y8H5c1evbH9NBOvDONR49j19SZ9UjcQJjNICLbQBTFrw=
X-Received: by 2002:a17:906:39c3:: with SMTP id i3mr30931439eje.527.1625752690494;
 Thu, 08 Jul 2021 06:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210707141323.20757-1-viktor.prutyanov@phystech.edu>
 <20210707141323.20757-2-viktor.prutyanov@phystech.edu> <CAFBinCDgQHA1vmunNBdER0BfiKt8XYZ+-VBs3c21+S3bYP7GZQ@mail.gmail.com>
 <20210708162051.13953369@192.168.1.3>
In-Reply-To: <20210708162051.13953369@192.168.1.3>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 8 Jul 2021 15:57:59 +0200
Message-ID: <CAFBinCDOcR5t=6m5X6LnuA+XT4v9nMQnDdD_moOqzf5ffWt+4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: rc: meson-irblaster: document device tree bindings
To:     Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
        jbrunet@baylibre.com, linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Viktor,

On Thu, Jul 8, 2021 at 3:20 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
[...]
> > > +  mod-clock:
> > > +    maxItems: 1
> > in the change-log for this patch you mentioned that mod-clock is
> > updated as well I think that mod-clock (as a whole property) should
> > only be added if it's an external input to the IR blaster IP block
>
> There are 2 clocks connected to blaster module, and mod-clock is just a
> selector between them. Meson IR blaster driver should choose one of the
> modulation clocks. If not through a property, then how to do it?
It depends on what the requirement for this clock is
I'll give you some examples as I am not sure about the inner workings
of the IR blaster - in hope that you'll be able to make a conclusion
for yourself.

drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c:
If Ethernet is configured into RGMII mode we need to configure a clock
tree (which consists of a mux to select between two different input
clocks, a fixed divider, a configurable divider and a gate).
The output clock rate must be 125MHz (or on SoCs which don't support
this directly then "as close as possible").
In this driver the clocks (and their hierarchy) are modelled using the
common clock framework so in the end we can conveniently use
clk_set_rate(dwmac->rgmii_tx_clk, 125 * 1000 * 1000)

drivers/mmc/host/meson-mx-sdio.c:
During initialization we need to inform the MMC subsystem of the
minimum and maximum supported clocks - this is done in
meson_mx_mmc_add_host().
The actual clock rate in the end depends on the SD/MMC card and it's
passed down to use from the MMC subsystem.
We then use clk_set_rate() in meson_mx_mmc_set_ios() to set the clock
rate closest to what has been requested by the MMC subsystem.
The IP block for this controller does not contain a mux but a
fixed-divider as well as a configurable divider - both are modelled
using the common clock framework.

Based on my understanding of the IR blaster description in the
datasheet that IP uses:
- fixed divider clock: xtal / 3
- fixed divider clock or a fixed rate clock (it's hard to tell as all
Amlogic boards I have use a 24MHz crystal): 1MHz (1uS)
- fixed divider clock or a fixed rate clock (it's hard to tell as all
Amlogic boards I have use a 24MHz crystal): 100kHz (10uS)
- clk81
- a mux to choose between the four above clocks
- a configurable divider (SLOW_CLOCK_DIV)
- possibly a gate clock (bit 0 of IR_BLASTER_CNTL0 called ENABLE)

If you only care about one specific clock setting (let's say the 1MHz/1uS).
Then you can either hard-code the values and register initialization
in the driver.
The mod-clock property is not needed in this case.

If the desired clock rate however changes (for example with the IR
protocol) you can model the fixed dividers, fixed rate/divider clocks
and mux using the common clock framework (similar to how it's done in
dwmac-meson8b.c).
Then you need to calculate the desired clock rate and finally use
clk_set_rate(irb->clock, desired_clk_rate_hz);
The mod-clock property is not needed in this case.


Best regards,
Martin
