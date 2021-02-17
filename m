Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 006E131D5F9
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbhBQIDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:03:19 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:42191 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbhBQIDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:03:13 -0500
Received: by mail-oi1-f170.google.com with SMTP id 6so4174496ois.9;
        Wed, 17 Feb 2021 00:02:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oO/bxURdFtsjoHNwZsyAw7fJcaRuHY6JC4kqn3mb8GI=;
        b=O5mcTUOBjvUfJkp/Fw6sI4U1otALbtgWG89h2yn+dIxeG9gAbRyPo1SiY2ii5HcRAF
         nxznOR0RgBytpviwy3PYsp6yPw3T8pgscg3+pStbeS4bkS10P2/07A8agCXL1BfZQBe/
         bbtvRSTY8OE4AJgQGu/BjMXjXzkFdALFp/z4Ft+VAfIcqWwGDiCp+NZnimXIPvsiPmlF
         XUsv/R/PA7Iu3O8GfOjDSqyGBKJftnaeBpLOy8S+YtXvxJxw3cJgNobs/iJI5p2tDgkC
         EDDPJxCr+YBmoYsI31pnOAU6u892gQiNxW2GHPrv836IncfVCWXitx5izC8VCCt/y9dQ
         em/A==
X-Gm-Message-State: AOAM533GhdLpurFe3pshHLOF5dqSU3M13Vwo1Iz0I+3jNWuh39Fxnoik
        H3BB4dwHKcx02PzOQoPn7QrERroqGSkVCiUDFdyg9AOL
X-Google-Smtp-Source: ABdhPJxlYZMJoIKkUeX5kbd7z0VgaHtRkAGb7Rn5GjcUX8sbbKkl+GOTRZNYJM7XiIF659mwoKMIgYElm+Vcv7PjqlQ=
X-Received: by 2002:aca:d8c6:: with SMTP id p189mr5045960oig.54.1613548952534;
 Wed, 17 Feb 2021 00:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org> <20210216174146.106639-8-jacopo+renesas@jmondi.org>
In-Reply-To: <20210216174146.106639-8-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Feb 2021 09:02:21 +0100
Message-ID: <CAMuHMdWbGohmE3m868U0QKer6TL2RUbjxy7o4M-f6zbn_db2mw@mail.gmail.com>
Subject: Re: [PATCH 07/16] media: i2c: rdacm2x: Fix wake up delay
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
> The MAX9271 chip manual prescribes a delay of 5 milliseconds
> after the chip exists from low power state.

exits

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
