Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338CC2BB4F5
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 20:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732266AbgKTTMy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 14:12:54 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35879 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728892AbgKTTMx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 14:12:53 -0500
Received: by mail-ot1-f66.google.com with SMTP id y24so4182290otk.3;
        Fri, 20 Nov 2020 11:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hLqZnQT5B6jK/D0DIjq9dhHr4z0uuriK5bU3awMZYMg=;
        b=SSolebQ5XxlvtB/LHZjvnlFaVtn5VevW/BjltcusQ4pH2a5Sw43JnFpr151OuDcA4I
         K7qn3bC/O3WHRiOsiSLH22Y3D1oL8XQFH+7Ffk9SslDzWIdhpnGQPbl1dib4VaLV2qKt
         itRAXSr8JIkJvizhozaKKu3cAJbiL43LRGFEitAaFcgFYjSEa8feEQzRvO1sTN6/myIU
         Vul3948edupxgNAMLETTJSbavg4ne0AnG+kCbZQGOqqnuon8CiJDzQEK75OISI/8t/mm
         gkgOXcaBBYX/isUZYGokwyToU9hYDI/pPErPmkeMtgdOh8bJbBETuMQJn96l66cWdIkF
         7UiA==
X-Gm-Message-State: AOAM530S6NeyubAOTxN0/AArm03+gjXFAY4OIF2MEP/fxZofgPLwyIcO
        l4ZOxXbuIfJuOHAPhoE2kHPSPaeldwiR4JFgCq0BSnmMURI=
X-Google-Smtp-Source: ABdhPJzLoa6WKtDILDOGpkstaZxzPvZRNmrWOcGtpvxISC7FFKWVO6GT9/653JEKtFUhbfBUcBa/Z0pHLAn+ZnaPR4E=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr14561462otc.145.1605899570960;
 Fri, 20 Nov 2020 11:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20201120161529.236447-1-jacopo+renesas@jmondi.org> <20201120161529.236447-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20201120161529.236447-2-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 20:12:39 +0100
Message-ID: <CAMuHMdX3tHXXQwLf+FcqgwqXC6j+4NYiv2Li4qsodVRTKqqrGg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: max9271: Fix GPIO enable/disable
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 20, 2020 at 5:15 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Fix GPIO enable/disable operations which wrongly read the 0x0f register
> to obtain the current mask of the enabled lines instead of using
> the correct 0x0e register.
>
> Also fix access to bit 0 of the register which is marked as reserved.
>
> Fixes: 34009bffc1c6 ("media: i2c: Add RDACM20 driver")
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
