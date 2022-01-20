Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B321B494A83
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 10:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237469AbiATJOt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 04:14:49 -0500
Received: from mail-vk1-f176.google.com ([209.85.221.176]:41684 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359644AbiATJOr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 04:14:47 -0500
Received: by mail-vk1-f176.google.com with SMTP id n9so3180970vkq.8;
        Thu, 20 Jan 2022 01:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FYed4oykOu+z8FFFs3tPnhUXUrhEGjETr77TsDFO7y8=;
        b=Q4fDn0EIMGsfnX6dDdMqRj79U3E67LF8V9vXBmgXXflTqL66Sz/hIWD3Fljb2IRNsY
         6qRN82rfQpn5WhlMCfBZVa5X4PvgvRqdhsNjskohNNoxGNgwU3MeaMhcq/zr/zHkJ8m4
         h9vp/WmS3TgsbAPmQpFvwdHruonfaogs266wWmoJjGwAuaxf2WzINkBUXR9w5Z7YMlpR
         o/onRI8+kWKx6urUezkHs1w2ocJWqN2eoiHZy707rZZJrGc0wkRD02hWgIULIWpJaJJr
         xl2kgIt33y8LAchvrNIPoYFL1LRI1lSJ+VxOojRhoGErEgFhjUeMEzINdDiqDRIUKlGP
         Asjw==
X-Gm-Message-State: AOAM533jv4IWpkXKxag1Ff2HROUmXL4QHamD/HY+wo8zIZWbqSREuQCB
        X5Zh5oSsvQr3BICSdoUVG1sY5CNfL5gLUw==
X-Google-Smtp-Source: ABdhPJwFSV8MYzVQ9/K6ZsbQ9V8e6x59Syi1cvf3GEXN4epoFXdsxthSaV9Ij7kfD7jknS8UrwvU+w==
X-Received: by 2002:a05:6122:2186:: with SMTP id j6mr1467730vkd.41.1642670086365;
        Thu, 20 Jan 2022 01:14:46 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id k12sm438131vki.50.2022.01.20.01.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 01:14:45 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id p7so2410544uao.6;
        Thu, 20 Jan 2022 01:14:45 -0800 (PST)
X-Received: by 2002:a9f:3d89:: with SMTP id c9mr2447588uai.78.1642670085582;
 Thu, 20 Jan 2022 01:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20211216163439.139579-1-jacopo+renesas@jmondi.org> <20211216163439.139579-5-jacopo+renesas@jmondi.org>
In-Reply-To: <20211216163439.139579-5-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Jan 2022 10:14:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyXwDiTpLACKdyoimtia3KS8A94qD-Ryi=r=6pj79D1A@mail.gmail.com>
Message-ID: <CAMuHMdXyXwDiTpLACKdyoimtia3KS8A94qD-Ryi=r=6pj79D1A@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] arm64: dts: renesas: condor: Enable MAX9286
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Dec 16, 2021 at 5:34 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Enable the MAX9286 GMSL deserializers on Condor-V3H board.
>
> Connected cameras should be defined in a device-tree overlay or included
> after these definitions.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -6,6 +6,8 @@
>   * Copyright (C) 2018 Cogent Embedded, Inc.
>   */
>
> +#include <dt-bindings/gpio/gpio.h>

Already included below.

> +
>  /dts-v1/;
>  #include "r8a77980.dtsi"
>  #include <dt-bindings/gpio/gpio.h>

I can fix that while applying, but I'm interested in hearing the answer
to Kieran's question first.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
