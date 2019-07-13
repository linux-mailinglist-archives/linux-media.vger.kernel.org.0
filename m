Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 169AE67C5D
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2019 00:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbfGMW6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jul 2019 18:58:47 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:38006 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbfGMW6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jul 2019 18:58:47 -0400
Received: by mail-ua1-f65.google.com with SMTP id j2so5381412uaq.5
        for <linux-media@vger.kernel.org>; Sat, 13 Jul 2019 15:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C521pemh84hQDpPKGvZwcyDQbmvvEOy9KjEBffRDfy8=;
        b=tMVaEtsma6gM3qxAeq2DWlq9ccipMteWpzx1QSsbtJxp1KQsgpUK1O3Xm3rUL7U5d6
         7HIlcZjebo4lVO1eu7C9v7gvyXfkALLm01JlnyVN1tom+hEFpiwojkqysbG+gMY8eAFU
         19eHob+krzEh4d+U1Rt3N+ZUqIK0qMaXE6YwJAClmNlCZvYNRPxV/qsRQUnAPU3nqWd5
         tL6X3DfIXabcYmh0gJ8H2oOt2n0UMY5pkjVBuG/IN7GzDV502O1UVmZehdQQIDupVzto
         9in+iY7dMAO36YkrkXzPqfuQtXMBScjUQpLZBG7jDuXub8zkFyZa4zLDdSnd322Pjcq0
         8L1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C521pemh84hQDpPKGvZwcyDQbmvvEOy9KjEBffRDfy8=;
        b=gLaFdLZKQnk/qDkYNkJ9XsXHgCfBGlCanUmZ9YME1k9ed2Wv/ihgCg6oh6NqbXs+CY
         JnGHtHICBU41WRebxGXgr54nZpDVvTh7I1NNSyPkIPAkA3a9UD8y8f4eRuoFTwyBv6Za
         9oawWl1DEwQylcTTlARN9u0yMcDwt1WB5GRAtcbbLsJ5Nzb4ljGPkccpDWXqNLzBFqAY
         dFKjlZNRKuEdoq0DyTC6lxCElJilmNQZZJY/jmqu1eWdsjG8AdNLFG1dftMixM32DBWE
         m+CYigu9NENf5JKFzEUCGwi18cd/ZZsHwY65hXJJ2KNG3HKAvLNBSd235oUwFrnXiL70
         MCRw==
X-Gm-Message-State: APjAAAXQAxzyljUxqzRhU1cVgslWs5WSTVFET45bLAeH4Wbkhc29woeB
        BI4+pb4NPlnrz1v1QKuZPC7iib6t/fQMe+EQo3k=
X-Google-Smtp-Source: APXvYqy9iyOxbGuuKGCYA7P9x4/jCssoGs1MvrDafxGacYP2yXkE8lKvX3eDFZmQr3u0yULaYS1miZoz7xW6gN4q6+4=
X-Received: by 2002:ab0:2a49:: with SMTP id p9mr12794749uar.0.1563058726092;
 Sat, 13 Jul 2019 15:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <59042b09-7651-be1d-347f-0dc4aa02a91b@gmx.co.uk>
 <5fe66d5d-0624-323f-3bf8-56134ca85eca@gmx.co.uk> <f47f8759-8113-812a-b17a-4be09665369e@gmx.co.uk>
 <2648434.ut0pN6mfR1@phil> <2d52b787-187c-5638-660c-33d51a07770c@gmx.co.uk>
In-Reply-To: <2d52b787-187c-5638-660c-33d51a07770c@gmx.co.uk>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 13 Jul 2019 19:58:38 -0300
Message-ID: <CAAEAJfAeZaT5wd4k8Lkf6T3G7LpK5LmOOG2ZbVJAQ6Xb7Wtdcw@mail.gmail.com>
Subject: Re: [REGRESSION] Xorg segfaults on Asus Chromebook CP101 with Linux
 v5.2 (was Asus C101P Chromeboot fails to boot with Linux 5.2)
To:     Alex Dewar <alex.dewar@gmx.co.uk>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 13 Jul 2019 at 13:43, Alex Dewar <alex.dewar@gmx.co.uk> wrote:
>
> On 13/07/2019 16:17, Heiko Stuebner wrote:
> > Hi,
> >
> > Am Samstag, 13. Juli 2019, 13:38:45 CEST schrieb Alex Dewar:
> >> I initially thought my machine was failing to boot entirely, but it
> >> turns out it was just failing to start the display manager. I managed to
> >> escape to a tty by hammering the keyboard a bit.
> >>
> >> I suspect the culprit is the rockchip_vpu driver (in staging/media),
> >> which has been renamed to hantro in this merge window. When I run startx
> >> from a terminal, X fails to start and Xorg segfaults (log here:
> >> http://users.sussex.ac.uk/~ad374/xorg.log). X seems to work without any
> >> issues in v5.1.
> >
> > 5.2 also has support for Panfrost (Mali-Midgard GPUs) but I'm not
> > sure if it already can support X11 yet and your X11 log mentions
> > libglamoregl in the segfault stack trace.
> >
> > Apart from it bisect that Greg suggested you could also just try
> > blacklisting either panfrost or vpu kernel modules
> > /etc/udev/somewhere . This would prevent them from loading
> >
> > Hope that helps
> > Heiko
> >
> >
>
> Hi Heiko,
>
> Thanks for this. I blacklisted the panfrost driver and X magically
> started working again.
>
> I'll try to do a bisect later to find the offending commit though.
>
> In related news, it also seems that the sound and wifi drivers aren't
> working either in 5.2 (although I need to do a bit more testing to
> confirm the latter).
>

Adding myself and Tomeu.

Perhaps we need to disable Panfrost from defconfig from now?

Regards,
Eze
