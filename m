Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5110131D67A
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhBQIUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:20:21 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:36282 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbhBQIUU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:20:20 -0500
Received: by mail-oi1-f174.google.com with SMTP id k204so14167725oih.3;
        Wed, 17 Feb 2021 00:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IQ/7Ynw6UjxQWo4UNim1ZxExxF5E9QOAqwb5uDMav7Y=;
        b=DhGMuE1jyzWsq0R+1MNpNz4mAMdn9JgbQsigoy1KCIJe/LtKo2s18OQ3SfULR136C9
         cZ9q8M132e/AQ4rOyKjJ2UrbHSM4CxfSoCHFWetLHZaWD0v7BmP21FtJkLPS34XfvPDW
         RTw7U7TBJLPUM+2G/CFfC7L4EOjPNxkZ4BiQAbYiTCjLxgVqwjGyiFHYu5hsYRFnz8pP
         v1EOhYVSjsmOpe17V2XDgw3bF614Tvg7RDd6PRPGHRgzi5BL1VsrbuAIqrIpThHpm2WF
         gnuW6IpgsQ7+tq8p0nKBVKtNLyl5fFJzMNq0rA6d6WebRCGD3i6XUoIqqZctenCeUe50
         yHuQ==
X-Gm-Message-State: AOAM530OSrWYMC8XtVTl0b8u66oyp8S+BYZzdcHxGg4BasPQ0Cf4h3Sw
        7ltw1M9zDvLOawMF9bNnMMB8D7fg+Nhd75cH4CI=
X-Google-Smtp-Source: ABdhPJzf7b77gwzlj8rw7+OYcwIn25MD2agWKqzzrmr8L+oVXs0AVoNNUCJtmhm6rKvNq0tTSuPreYnrnWhQzNpsq70=
X-Received: by 2002:aca:d8c6:: with SMTP id p189mr5078143oig.54.1613549979250;
 Wed, 17 Feb 2021 00:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org> <20210216174146.106639-15-jacopo+renesas@jmondi.org>
In-Reply-To: <20210216174146.106639-15-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Feb 2021 09:19:28 +0100
Message-ID: <CAMuHMdWiGwcqkjpqfKrBDjuh6avNGY0t5rt7Pvfxdr17Da0ZCQ@mail.gmail.com>
Subject: Re: [PATCH 14/16] media: i2c: max9286: Initialize remotes when bound
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

On Tue, Feb 16, 2021 at 6:41 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> With the introduction of the .init() core subdev operation in the
> max9271 GMSL serializer, the max9286 deserializer needs to explicitly
> initialize the remote devices by calling the .init() subdev operation on
> each probed camera.
>
> Call the .init() subdev operation at remote bound time and toggle
> the reverse channel amplitude to compensate for the remote ends
> noise immunity threshold.

remote end's?
remote ends' ... thresholds?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
