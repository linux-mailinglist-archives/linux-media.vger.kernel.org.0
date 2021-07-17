Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36043CC5FF
	for <lists+linux-media@lfdr.de>; Sat, 17 Jul 2021 21:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235272AbhGQUAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Jul 2021 16:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234719AbhGQUAs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Jul 2021 16:00:48 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B33FC061762;
        Sat, 17 Jul 2021 12:57:50 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id qb4so20682927ejc.11;
        Sat, 17 Jul 2021 12:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+ea6pzYYKo4cDkWfiwOdkV2qxIy9/iS07XWyARv99s=;
        b=k9zzhV7x3XfY4+B54dcuottDDUQN6dTRIhvvcrHRAyUaZ0y+GICSAlFzINZI39/EAa
         uYFJ0b/lAZPxBKRxKJUSlsz0w9oXldeDiuWxHB3sMc0a+JDfrOJQiH5p/DFn2M/4ffiC
         beyVRYaaNbVLHmrPE2DkmJaTFZgoReyXGvxAnwmDOM80V64PKJDsw4MwBYPc12bgOPGH
         xqQjhgq5C69moph3jkZmaKgbtkE/MWdyUe23wpqAQTvidhx6HeWOZW1jTJsoB0H9MAk+
         KXoKpphPeZgeNyzIpRvex3tdxNbNTVXdLqdvsOZX6ez09DPrU2Sg8cQ6438yolxsif1r
         uWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+ea6pzYYKo4cDkWfiwOdkV2qxIy9/iS07XWyARv99s=;
        b=t0sqPT8G6fuqLlNvMNg8VvOiYTVaaO10uXIUuW1TSi2XsT4g4gp5jjuok+PTkq1C66
         RJV9BckP6nqTl3DtnAIgp/Z5vAjf47lb3u43Tu1QzwsAjXEsRTWj+H7h9PTGD8PGm2uA
         /uSaYYFwJOnQBTPb5JfxVpjMTSLrtX7UqSYTVgbzT/Ej+/UHKx2ivYGB7yMbJENxDa9K
         EEnBfIrs9mAsyjl1X+PgtPy8g78LnsTegfz2D5TCyec6LfJQ6EHKgGO3A/uxdu61iRqv
         5RpQkDCRouKeeaisQPbtGndqOT3obt2P301pxG3u00PdwV/bCQFZpXS7zyEDLhTS5Foi
         m8bA==
X-Gm-Message-State: AOAM531REpy9fkjhcr/yyg6eOxQP5wyZ+MYcT/IJDfK9fQVJyFsVGSIV
        55YO6tYX2YENkmwmcq1ttEuttudceeksFMqjpMI=
X-Google-Smtp-Source: ABdhPJwvlh8H0pbtNu2RZ2q6pYC+ejnHlQkxWG1NPp1Le9NscIfMxDFiahPNGNWS13bCEbL9N4GHrAMy4iuAXbUO6M8=
X-Received: by 2002:a17:907:9719:: with SMTP id jg25mr11832158ejc.362.1626551868953;
 Sat, 17 Jul 2021 12:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210716144508.6058-1-viktor.prutyanov@phystech.edu> <20210716144508.6058-2-viktor.prutyanov@phystech.edu>
In-Reply-To: <20210716144508.6058-2-viktor.prutyanov@phystech.edu>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 17 Jul 2021 21:57:37 +0200
Message-ID: <CAFBinCBpxcHHDs2cr+V4gDVk48G3+T7V-Lde2CkY6xvVrqixmA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] media: rc: meson-ir-tx: document device tree bindings
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

On Fri, Jul 16, 2021 at 4:45 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
[...]
> +  amlogic,fifo-threshold:
> +    description: TX FIFO threshold
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 127
I tried to make sense of this property but I don't understand it yet
(even after reading the second patch in this series).
A "FIFO" (in my own words) is some physical property of the IR
transmitter in these Amlogic SoCs.
So for one specific SoC there can only be one FIFO size, not a range (0..127).

What about a value of 0: my understanding is that this means that
there's no FIFO. Will this hardware still work in that case?

From reading the driver code it seems to me that the FIFO size is 128.
The driver can use fewer FIFO entries if it wants, but this must not
affect the dt-bindings (as these describe the hardware - they don't
"configure" the driver).
If you look at arch/arm64/boot/dts/amlogic/meson-g12.dtsi you'll find
toddr_a, toddr_b and toddr_c there:
All three of them use identical circuitry internally, except that
toddr_a has a bigger FIFO size than the other two. Using a FIFO size
of 256 for toddr_a is not correct as it's an improper description of
the toddr_a hardware (that said, the driver can still decide that it
only wants to use 256 FIFO entries).


Best regards,
Martin
