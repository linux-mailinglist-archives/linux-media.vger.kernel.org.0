Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667F031D670
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbhBQISU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:18:20 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:39986 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbhBQIST (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:18:19 -0500
Received: by mail-ot1-f54.google.com with SMTP id b8so6701889oti.7;
        Wed, 17 Feb 2021 00:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=slle50kgoNxJbklUkZhTyyJhtMMKbICkNQUByIjAzOU=;
        b=iK5NUiRbfWp5C3AnluH4PAKVYepg0gkT3GiKy3fDasZqIB06bL4mO57S8MivqPwuYg
         XQh91xSZSBeK6O1ZSA/LLXhHFA7uc/rhAjUKVaZTMjbOtWA9dKiPwSR/kdV6UcytA3zg
         5mGSznWb7AD2axI6WuW+jqxjO7r9ueVtqhHNBHDiinIpJ1GMIxjR8rQmpL7KSSWjUqPF
         m62R2ZL9VHgfEQU/mGQtPI8sBiJkJaT23sv9a18YbHtOVOG+/3gCKoJpaSjfqlRzVs6Y
         MixdIHT+QUa83eVoVkjfunOjTuty/YpN1ldscTjt77tbJ45OnW4dioKHey6RN15Xm11n
         VO+Q==
X-Gm-Message-State: AOAM533Q9rLpbS5BDv3j60pod9MCcoJp8DLZySUieB14kFn/5OYTIyr1
        pMP4x0KY9Ip9ckU/bYn88RYlBQRRAqbv/VT81Nw=
X-Google-Smtp-Source: ABdhPJy0Zsxob69r2ILVf8ZjCZjUznUmjxaT0KTXuVAzvgy2kE6lxQwrLRsNkKaeb9HIZoMOLqx8vtmR13O1ymChKwU=
X-Received: by 2002:a05:6830:148d:: with SMTP id s13mr17020227otq.250.1613549858180;
 Wed, 17 Feb 2021 00:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org> <20210216174146.106639-14-jacopo+renesas@jmondi.org>
In-Reply-To: <20210216174146.106639-14-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Feb 2021 09:17:27 +0100
Message-ID: <CAMuHMdUdeD880zM+cdduHDAZGuauHc_R6RveiCP8EYejfoOy_Q@mail.gmail.com>
Subject: Re: [PATCH 13/16] media: i2c: rdacm2x: Implement .init() subdev op
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
> The current probe() procedure of the RDACM20 and RDACM20 performs
> initialization of the serializer image sensors and increases the noise
> immunity threshold as last operation, which is then compensated by the
> remote deserializer by increasing the reverse channel signal amplitude
> once all remotes have bound.
>
> The probe routine is then run without noise immunity activated which
> in noisy environment conditions makes the probe sequence less reliable as
> the chips configuration requires a relevant amount of i2c transactions.
>
> Break chip initialization in two:
> - At probe time only configure the serializer's reverse channel with
>   noise immunity activated, to reduce the number of transactions

deactivated?

>   performed without noise immunity protection
> - Move the chips initialization to the .init() core subdev operation to
>   be invoked by the deserializer after the camera has probed and it has
>   increased the reverse channel amplitude
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
