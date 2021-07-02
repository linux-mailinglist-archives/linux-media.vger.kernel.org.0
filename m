Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5663BA142
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 15:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232582AbhGBNdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 09:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbhGBNdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 09:33:31 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632B4C061762;
        Fri,  2 Jul 2021 06:30:59 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id h2so13271772edt.3;
        Fri, 02 Jul 2021 06:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TLPL1vwuoSurIn1Ke4+3XJSEMyvrxI7jqw6j1iy/If0=;
        b=CpCP4CL1+OGJCBDouYv0X21+BYXnktM13u1Rzi4vJ6YISSCdgISCyh+zfkTYrK8QzF
         YD8GFZ0mZc/WKKPTpYDc4EOOL0vn78bFwAI2bKvvjk9CRnQOVyOBlt5xkSxOxMEszoCU
         xZxvzIlZwEjgbqhb7e3nv5Rqq7zskft7QbEGGEXfN/NuC5WdUHm9BfOub51GgJMI6NpN
         r1RTVfMkd/rwrajpEDTRUHTlkJM5mXCwrSUsUdv95fFXn53sxWRW+waK6X4Nc3EqZD6f
         HxY1obYx8wiE+j5p4bg2RMH14e9SioNL53Ol2Qe5q+QNHvvsJRwgRRgIOMMyyGyWuA0i
         O3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TLPL1vwuoSurIn1Ke4+3XJSEMyvrxI7jqw6j1iy/If0=;
        b=j00esFCT7acHIsaa6zV7Yql7BjxAt9/hrN9MV6J6OtHixvLwMoLOaqACXwwUc6QL4t
         DxYTEON6tuH2OzDkmjs5UZwwCF9vT5pqMKCYIl7KleufA4Zj5sjF++ysMYg5slivwhS+
         4jYm7i258/cbyLZpYJ/1O6CQe4vVnyKhNi587fIFyvcIRwW5DmMM8c3ZiU32KllaQf4V
         kIbuD+WqoRZm1RQjI4bPVKEzNGxrSQFD7cJYUY+e0KNSFTb4Qo9S/P5xkxA4xaq72pk+
         +PyaZY3f2tZuz86xu48qyeazgLL+zof4KR3zkFwSHiTm6Hjwld8sCT8zziWJav2Zhfti
         sS/A==
X-Gm-Message-State: AOAM532RTur5kslfLhM95QBiEKXvkisfuyw1bUQ5uPg3MeA3D91jfdj6
        K8JEtG6vsbbqThuW/U78wRfGRPBzKU0w98K5hnQ=
X-Google-Smtp-Source: ABdhPJwIDHn33FNtfeYw5efdxrdIzFrxnJWYLZAnaxQC9V+Ht48b2EB/ZvFajhnCdRje/T2QhEt0tMootqGY4wHhyww=
X-Received: by 2002:aa7:d74b:: with SMTP id a11mr6863372eds.40.1625232657982;
 Fri, 02 Jul 2021 06:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210701215132.16317-1-viktor.prutyanov@phystech.edu> <20210701215132.16317-2-viktor.prutyanov@phystech.edu>
In-Reply-To: <20210701215132.16317-2-viktor.prutyanov@phystech.edu>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 2 Jul 2021 15:30:46 +0200
Message-ID: <CAFBinCBZXRrPakwvRLsbNbuYY6fcYysMs0+SPUmAhKpcYxrq0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: rc: meson-irblaster: document device tree bindings
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

On Thu, Jul 1, 2021 at 11:51 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
>
> This patch adds binding documentation for the IR transmitter
> available in Amlogic Meson SoCs.
This is an interesting piece of hardware where I've always wondered if
there is any device out there which supports this functionality.It
turns out that there is

[...]
> +description: |
> +  Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
> +  (blaster) controller onboard. It is capable of sending IR signals
> +  with arbitrary carrier frequency and duty cycle.
> +
> +properties:
> +  compatible:
> +    const: amlogic,meson-irblaster
if you feel like some registers or register values are specific to
A311D or T950D4 then please also add a SoC-specific compatible string
(for example: amlogic,meson-g12b-irblaster).
An example can be seen in
Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml

[...]
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
from my understanding there are two clock inputs to the hardware
dt-bindings should always describe the hardware, not what the driver
may (or may not) use.
based on that I think you should drop minItems (then minItems will
have the same value as maxItems)

[...]
> +  mod-clock:
> +    oneOf:
> +      - const: sysclk
> +      - const: xtal
Does this "mod-clock" depend on something external to the IR blaster hardware?
If not this should be handled inside the driver only.

From how I understand the register description in the datasheet
there's two clock inputs.
XTAL is internally divided further down with fixed dividers.
Then there's a configurable divider which is then used to generate the
IR signal.
If the sysclk (I assume that this is clk81 - or at least derived from
it) is "too fast" then the driver should just ignore that clock while
the dt-bindings should still describe it (see my comment above)

[...]
> +    meson-irblaster@ff80014c {
node names should be generic, see for example
Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
(spifc is the name Amlogic has given this IP, but since node names are
supposed to be generic we use spi@...)

However, I am not sure if an IR blaster would be described as
ir-blaster@... or simply ir@...

> +      compatible = "amlogic,meson-irblaster";
> +      reg = <0xff80014c 0x10>;
> +      interrupts = <0 198 IRQ_TYPE_EDGE_RISING>;
> +      clocks = <&clkc CLKID_CLK81 &xtal>;
[...]
> +      clocks = <&clkc CLKID_CLK81 &xtal>;
while this works I think the recommended format is:
    clocks = <&clkc CLKID_CLK81>, <&xtal>


Best regards,
Martin
