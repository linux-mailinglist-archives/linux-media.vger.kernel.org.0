Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74FA531D64A
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbhBQII5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:08:57 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:47066 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbhBQIIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:08:44 -0500
Received: by mail-oi1-f169.google.com with SMTP id f3so14062600oiw.13;
        Wed, 17 Feb 2021 00:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yKvcCaIh14FZjuT3BnlyvNFLaqnatVeX7Lan1VcBW+k=;
        b=K31f3nmvxP9bMjRPTTSzgdSv5KydDTHM4+8KjJ6PTFARv+NXNw924S0/tyKoyALAJE
         QtKO6lpGxX27JkrH5EqpZyV/BnES8CB8w+AfEvPAyraUX/c5YWi9yJ4QxKRU5lkM2lZy
         tncdqEKH+skdYnnAKkQPSxQlYiQUuotGwoObhE+hakLhI0OdWOnAqhwhbUDRUGznW9s+
         Xiba6fdPXn1m46fV/vxrN05P3FB1qGte9CSIXkkQEdjrSBkjkGR+v0FCnyX1aP/VU6KU
         Uh6sUKnShzSjwQjRlJxMgVMQBeM0WxnkticBAIPqNgl8gwKb2xvnciNYkDVoqMUAg0GY
         gy9Q==
X-Gm-Message-State: AOAM531QcQi9JW4bw3f6vR0i1PKKkqoEkQKjbBYQxfJ468waIFHn3Ujd
        bROFazEvvsNg5fSzVuZVvRkIKrkJy+U8ha4TWq8=
X-Google-Smtp-Source: ABdhPJxQlbv0a4XilTt53winmn24q6WqYj2NfsXNHTgTwmm/zZitLqqDZgxJFJYvr9Zc+6jgyfurufz35KtJv5VhfgI=
X-Received: by 2002:aca:744:: with SMTP id 65mr4860931oih.153.1613549284169;
 Wed, 17 Feb 2021 00:08:04 -0800 (PST)
MIME-Version: 1.0
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org> <20210216174146.106639-11-jacopo+renesas@jmondi.org>
In-Reply-To: <20210216174146.106639-11-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Feb 2021 09:07:53 +0100
Message-ID: <CAMuHMdWUKhvT2o-=7yQgR5nZkehO0m+MNXnM4Bss98afczi1DA@mail.gmail.com>
Subject: Re: [PATCH 10/16] media: i2c: max9286: Rename reverse_channel_mv
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
> Rename the reverse_channel_mv variable to init_rev_chan_mv as
> the next patches will cache the reverse channel amplitude in

patch?

> a new driver variable.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
