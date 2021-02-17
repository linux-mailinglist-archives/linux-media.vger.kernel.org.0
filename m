Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60B931D643
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbhBQIHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:07:45 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:41731 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231883AbhBQIHZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:07:25 -0500
Received: by mail-oi1-f182.google.com with SMTP id v193so14106738oie.8;
        Wed, 17 Feb 2021 00:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o6A4tdaKh5y2j4m9oXG0FiniGXLjw0wwg2ak9qpEZb0=;
        b=AR5BV5l6Pb9UnavBX+SaCB+I26Zc3/2C6Sm2WrHOHcnXTxOwzTONxejETLxNTpoSsD
         vSGTCrfT/9gz+yALY6MgQrGEQ7rt6hhWgbkxHEHHvK0mais/hRlagS2naoaOZosueLIb
         f4PI2ieSX70BNjVpJF2iFKH/8Sfk0kLjZ2xr8ucPNlCrUbnZfGR+m4BPUx/w+i9SOeLd
         MyGXEMBn4myw4NgtWyuIjhypoeaf+o/ScI12a2k1MjjMtX++/q3N8s0TDmoJrfSPONlb
         WSaFnfmkW1FdZXK26uj+TVMKzw7zFckQBSxnQf2YMgJ6UhySCPykCP5Q2g9wU+OlFUTx
         Gn0A==
X-Gm-Message-State: AOAM533PFob99QE2Wuc6FNax/GnxGA4XPry+JlOpYAbWOpZJd2CZNrBO
        lvFV413JB0JEMIBBmYhtzNkXl4bFq5lPlFhjkBw=
X-Google-Smtp-Source: ABdhPJywMV7acX5qz1G997cfR1R7vSZD5sxPbhFkJgwGWh77jEPv5pM4Xu9FulQERCbcaSBj6IzzjHNrdlcGRxQIqXM=
X-Received: by 2002:aca:d908:: with SMTP id q8mr2352692oig.148.1613549199859;
 Wed, 17 Feb 2021 00:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org> <20210216174146.106639-10-jacopo+renesas@jmondi.org>
In-Reply-To: <20210216174146.106639-10-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Feb 2021 09:06:28 +0100
Message-ID: <CAMuHMdXqr_hZb0YuQ4U8doBUBqaSzjgMtU_8XB80Vg0gKd=2qw@mail.gmail.com>
Subject: Re: [PATCH 09/16] media: i2c: rdacm21: Re-work OV10640 initialization
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Feb 16, 2021 at 6:41 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> The OV10640 image sensor reset and powerdown on signals are controlled

Drop the "on"?

> by the embedded OV490 ISP. The current reset procedure does not respect
> the 1 millisecond power-up delay and releases the reset signal before
> the powerdown one.
>
> Fix the OV10640 power up sequence by releasing the powerdown signal,
> waiting the mandatory 1 millisecond power up delay and then releasing

"powerdown" vs. "power-up" vs. "power up"?

> the reset signal. The reset delay is not characterized in the chip
> manual if not as "255 XVCLK + initialization". Wait for at least 3
> milliseconds to guarantee the SCCB bus is available.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
