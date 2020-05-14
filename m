Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03FD91D3132
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 15:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbgENNYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 09:24:08 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34500 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgENNYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 09:24:08 -0400
Received: by mail-oi1-f194.google.com with SMTP id c12so23507494oic.1;
        Thu, 14 May 2020 06:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sSamf2egw4mSH0QveGzXce+Ec2ZXIVCWEyzE7zx5koo=;
        b=ufBg/RF2OdkhR5O5PFOlXLoq+pSKv7/3kb0ZgESlTDm+FJnC0FkVZXtcrgiw+740S6
         280Tf1Lz44vPOLCIR+1iFiST9oOxO7p7au6KNxtQ9cN1vFkYB6xaPlfbLRJQVhhC53UY
         usyoBMGwR+etOk0sJuCQGkA/iY2j5d6Rshk8fMUQGqfNr6/MHmyhYR+nXrofaobMJy2f
         xYZi84t8eOGeBgJEljOUiYbgUPHx+udnV+r1QF0IC/gq2rMC6xb40VF39C8bDGJTC3Nh
         zPZABkMekGSyQumpzrAY5m8bEtfOnncGa9C0p+YVaI+GhzPYrJD63aHf4nEQXFq77EE7
         6gwg==
X-Gm-Message-State: AGi0PuZMhhh/jte7hm2F+rXZ7yg70GuOiP1q3wP6ts/GzAeXwdbJ077R
        K7hDKiCuj1sfgMToOalrAMth06Ck/KrxZTLcf60=
X-Google-Smtp-Source: APiQypIRjs+5ZguLChX2CNoHXK9sTuzFIWqm/7PJ80eA/g5b0j1Bj3CFy/GBcv83VDyEJJ+o5z4ZH+rK8ac3DuVbIGQ=
X-Received: by 2002:aca:cd93:: with SMTP id d141mr7906712oig.148.1589462647044;
 Thu, 14 May 2020 06:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200506120304.31550-1-geert+renesas@glider.be> <CAPY8ntDwffdgQadkBLSdJr0q7nThFHEBO_nPmja1EUVhnRa7YQ@mail.gmail.com>
In-Reply-To: <CAPY8ntDwffdgQadkBLSdJr0q7nThFHEBO_nPmja1EUVhnRa7YQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 May 2020 15:23:55 +0200
Message-ID: <CAMuHMdUP8sT5G9TruLcJC8CoXTUrFZGKr07C3sqbbm0sXbjJbQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: Drop <linux/clk-provider.h> and <linux/clkdev.h>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Thu, May 14, 2020 at 3:12 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
> On Wed, 6 May 2020 at 13:03, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > The IMX219 camera driver is not a clock provider, but merely a clock
> > consumer, and thus does not need to include <linux/clk-provider.h> and
> > <linux/clkdev.h>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I'm no expert on the clock frameworks, but that seems logical.
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thank you.

> The same appears to be true for drivers/media/i2c/ov5640.c unless it's
> been fixed since 5.7-rc5.

Quite possible: I did a sweep a while ago, and looked at recently introduced
offenders, but I may have missed some.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
