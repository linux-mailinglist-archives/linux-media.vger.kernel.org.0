Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73AB31D64F
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhBQIJm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:09:42 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:46107 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbhBQIJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:09:20 -0500
Received: by mail-oi1-f180.google.com with SMTP id f3so14063796oiw.13;
        Wed, 17 Feb 2021 00:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0m2I2OwCW5JSeFBkeIlo2UykcMOLRIMmiN1PTHT+gTg=;
        b=nnx3JRlpJSRBdxMqnHoEOr2BjBGRTkluObEsHzRhyzqrJQ8tXnHOQdXKaSGOyGhsEw
         9G+3lBXaxTUVc+GNoHqxuHSavtjZPHlppPubDpEAkNlFQ1Bu/E6LpkyOahkUdwT0JGJm
         GI1OTbo6V4NRNSM4Tj7qj7PIFXvESyODNIeMLPv6GjBrx4xmO9qMqDANrHR87oPEAY7R
         SMaPDgXNJQAjrZPoRbJ1nij2gWkji4rXelv9sQd4vRCeVsvLGZneoIygRJHqCMSmlzUm
         94DCqH3JO4H9AM7fPF9MvOLaLPdeb6IGmiZwDdQqc6QWK59s4UwFYJmPy8rFZaedRFhh
         aVnA==
X-Gm-Message-State: AOAM530dBU6a3qrgayNg2ufhaawoJ1DvHGDstSqJFqN0l1WSlRKKpO4r
        Z4Hsej2ea/Q1iqgKI3dBzeGcxSv9AuCuONRAOqE=
X-Google-Smtp-Source: ABdhPJxHmJDaW15MWHLEmJ8V3Ek5HhIwGj93PV+H6B8ag6NwZrbFOxh77AXE76kXWjrnfJfuFEgxx+omr3ELD/53FrA=
X-Received: by 2002:aca:d8c6:: with SMTP id p189mr5057476oig.54.1613549319797;
 Wed, 17 Feb 2021 00:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org> <20210216174146.106639-12-jacopo+renesas@jmondi.org>
In-Reply-To: <20210216174146.106639-12-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Feb 2021 09:08:28 +0100
Message-ID: <CAMuHMdWtKwJm4e2p88eDDQLd8ey2sBzQy5Lk0fLxPpBaxCaexw@mail.gmail.com>
Subject: Re: [PATCH 11/16] media: i2c: max9286: Cache channel amplitude
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
> Cache the current channel amplitude in a driver variable
> to skip updating it if the new requested value is the same

newly

> as the currently configured one.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
