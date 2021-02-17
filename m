Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10C231D67D
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbhBQIUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:20:51 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:39271 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhBQIUr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:20:47 -0500
Received: by mail-ot1-f51.google.com with SMTP id d7so11331657otq.6;
        Wed, 17 Feb 2021 00:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ODAFomA7HrrIMo0Cmhejdld+UvrDf30s1jNkKVd5CU=;
        b=RDUh6pwOTIATokav8UyPvWee0izB5BPXT1W0UVLhqrJNeQtFGDW0A7rxOhnjJ56z+Q
         hNSK8QQnN70vRcJG+3PW/JNblaRfy8BmdKmfA/PtM/p6Kq4xcu2JKVps0Tw9sw8mRYhs
         jelg9Rl5YeD7XoRoxXeG03G4bx5hH0jlf9FrXA71RZnMQ+GwjdaCpCWs1RVypyxyUnsq
         Y9MD8N7WkuNXk85pjrtBQ67b2nK0Bam+q7Bjg/YWrr1QCZho3tpQ6f9N4xZNYi/GIJF8
         w/LMcD9mltyfGxVEMo3+ML3UF1B5EyC6TRD8tn45dHGwLle/i6pGUCcAtjIEDt+G7hBN
         XJUQ==
X-Gm-Message-State: AOAM531EKUq27VLL0yM8+QPAFAaMWbi/2PS/m1UG6QO/3pHI8rQNCk58
        Q7C4S8Aqfokeaeso9SPTfSVP8Eq57pgaNi5+G6muFpJR
X-Google-Smtp-Source: ABdhPJyKAN8M9BY1vd31PkK+F20XiPWL71kNEe+u3mzd11kEbWs0TTXPDHTkICbzdt6VeP2fLbMZwvCNXrCWRoQxnts=
X-Received: by 2002:a05:6830:119:: with SMTP id i25mr17019987otp.107.1613550006189;
 Wed, 17 Feb 2021 00:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org> <20210216174146.106639-17-jacopo+renesas@jmondi.org>
In-Reply-To: <20210216174146.106639-17-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Feb 2021 09:19:55 +0100
Message-ID: <CAMuHMdUENPfboGf86Bq_uGMS79vgzGn404_vY0pQSXJ3pwo4eA@mail.gmail.com>
Subject: Re: [PATCH 16/16] media: i2c: gmsl: Use 339Kbps I2C bit-rate
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
> With the camera modules initialization routines now running with
> the noise immunity threshold enabled, it is possible to restore
> the bit rate of the I2C transactions transported on the GMSL control
> channel to 339 Kbps.
>
> The 339 Kbps bit rate represents the default setting for the serializer
> and the deserializer chips, and the setup/hold time and slave timeout
> time in use are calibrate to support that rate.

calibrated

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
