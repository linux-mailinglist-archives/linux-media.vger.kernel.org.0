Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB0644296E
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 09:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhKBIdQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 2 Nov 2021 04:33:16 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:42876 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhKBIdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 04:33:15 -0400
Received: by mail-ua1-f46.google.com with SMTP id v20so36480633uaj.9;
        Tue, 02 Nov 2021 01:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xjyrUZBfnnMN1jrgawzUgDxAU+IxlfxhbvWTMJPKn0o=;
        b=cFmtITW2B1no7o3qqbHN7Pml2nxQ7VFryj2/gjpbrP6i7RJaRH6R3+q9RZ+sFzF80a
         qrqYqiBDoFUu6Ip5cqSIsZEIO8YAg2Cp4gb6MYoX9HXBJ1iXFoAKzdSty6Qz+DHrxWAj
         VYu1Fo/FoLI/vmRAopirlAP6mkpaqBbeeJS5Zw8t+xqAdGhuZ/j6FIe6RU+DCYhFicwd
         D/YpNkwgEWj+ol4rrq9yCFYvxh7nLa7TL3kgb3H/PbZRiCiWi59OUX6rhVXk4AKU0P3L
         jr7Z4vOT4fFo+WM3aJ2cT41pNRcLEXPCzW6761C1M8voF7ncs6mlQtUksIJzLv67P9HW
         LkRA==
X-Gm-Message-State: AOAM533DNwUE+b5fCUM61RozmmlsD7WHfYeAxwahdVKDGNCEoplQfjbR
        aOeQRmQshxCM0SYmoshI783SwHi5dBGEow==
X-Google-Smtp-Source: ABdhPJzAeMSRnF5bbSKBwd9uBCs1JLTqU8yAyq18qof8mkPpY+jR9m8csobxQMlWgLJkh09hxDs5bQ==
X-Received: by 2002:a67:314a:: with SMTP id x71mr13675641vsx.17.1635841840772;
        Tue, 02 Nov 2021 01:30:40 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a22sm2547478uaq.17.2021.11.02.01.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 01:30:40 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id u9so36476495uac.8;
        Tue, 02 Nov 2021 01:30:40 -0700 (PDT)
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr34917210uaj.89.1635841840143;
 Tue, 02 Nov 2021 01:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211101171949.1059566-1-kieran.bingham+renesas@ideasonboard.com>
 <YYAiihIejUuF+uu0@oden.dyn.berto.se> <163578888022.1097798.14100032684481849335@Monstersaurus>
In-Reply-To: <163578888022.1097798.14100032684481849335@Monstersaurus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Nov 2021 09:30:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhtGmL2iiGFbRY8CGC_xB5Mqboyt73WL2_h2feMYzziw@mail.gmail.com>
Message-ID: <CAMuHMdUhtGmL2iiGFbRY8CGC_xB5Mqboyt73WL2_h2feMYzziw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: max9286: Depend on VIDEO_V4L2
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Mon, Nov 1, 2021 at 6:48 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Quoting Niklas Söderlund (2021-11-01 17:23:22)
> > On 2021-11-01 17:19:49 +0000, Kieran Bingham wrote:
> > > The MAX9286 has not explicitly declared a dependency upon VIDEO_V4L2.
> > > While this dependency has likely always been met by configurations
> > > including it, the device does use V4L2 core, and should depend upon it.
> > >
> > > Add VIDEO_V4L2 as a dependency to match other drivers and prevent
> > > failures when compile testing.
> > >
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> > > @@ -468,7 +468,7 @@ config VIDEO_VPX3220
> > >
> > >  config VIDEO_MAX9286
> > >       tristate "Maxim MAX9286 GMSL deserializer support"
> > > -     depends on I2C && I2C_MUX
> > > +     depends on VIDEO_V4L2 && I2C && I2C_MUX
> >
> > I think the new 'depends on' shall be on a separate line. Reading this
> > is confusing as now the V4L2 is mixed with I2C while GPIO is still on a
> > separate line.
>
> Indeed, I'm happy to put it on a new line too, but so very many of the
> other users of VIDEO_V4L2 and I2C here in media/i2c/Kconfig use
>   depends on VIDEO_V4L2 && I2C
>
> So the difference is having the I2C_MUX ...

I2C_MUX already depends on I2C, so you can drop the latter dependency.

> There are only two other 'patterns' that have also added directly to the
> end of that:
>
>
> drivers/media/i2c/Kconfig:      depends on VIDEO_V4L2 && I2C && I2C_MUX
> drivers/media/i2c/Kconfig:      depends on VIDEO_V4L2 && I2C && GPIOLIB
> drivers/media/platform/Kconfig: depends on VIDEO_V4L2 && I2C && PM
>
> (Where the I2C_MUX is MAX9286) but it's not a very strong pattern, so
> splitting is still fine with me.

I would put it on a single line.

Unless you start adding COMPILE_TEST support, and the dependencies
can be split in hard (needed to build) and soft (needed to run)
dependencies.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
