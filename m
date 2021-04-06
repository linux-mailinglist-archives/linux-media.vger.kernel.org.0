Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70AB7354FF1
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 11:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237208AbhDFJdW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 05:33:22 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:41962 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236696AbhDFJdV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 05:33:21 -0400
Received: by mail-vk1-f169.google.com with SMTP id o17so3043492vko.8;
        Tue, 06 Apr 2021 02:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=grgIxmSma2JlieWtBX3rMxJzJxBIyz4KExnfhvygE5M=;
        b=byuWXyERSSoZNxADdXcP7qj3Gh+lRcEXrhE/XKdlLO7AsPuVKfCdBKxL64ncn3nBi/
         kAV4XYOj8w4i39dgrcNED8NsDHb1R0yA6U6txu5E6wC8t8UWuRVSiCf2t3yfZJ/AzrGG
         s3rCOZyosY7SBBCEZGKAF7aBGlCJTYnyXFjsicTRQsQdqeYmn67cDsQditOkRkilNagh
         9Rn+6qqeFR9ZZ+3QVlDhq/gxxAcxvG8sunBwAUO5esMPgP/nBDM9jJIjWq91M0QlxeUC
         VzBbZFjYwwq41DdNLFzQA59eaP/roBD1P43tu5cr5AFPdAN7Zprmm6JxSqQI9dwK6IaG
         /8wA==
X-Gm-Message-State: AOAM530+dUhlV4msIUyoVoONjliCOvYa8nDSN2/xHn03aFBv2tfFjFXq
        vPunDGV/4HHF7cnc8tCcqoyYLy41Y0Kp19We8lscidvf
X-Google-Smtp-Source: ABdhPJzgJNbsIKr5NP1kHfRMwi9+BcmAuttYIVdrxWa1dLq56Xb06r6Zg7tF1EDTF5IKCMc00RB5P7qIa5UgLW9cGhU=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr16362671vkl.5.1617701593632;
 Tue, 06 Apr 2021 02:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210331081735.367238-1-geert+renesas@glider.be> <e566f40a-dcfb-d863-bc6a-369e7972114a@xs4all.nl>
In-Reply-To: <e566f40a-dcfb-d863-bc6a-369e7972114a@xs4all.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Apr 2021 11:33:02 +0200
Message-ID: <CAMuHMdXCjhDQhtAXir5zd7u=NCsCFhVvB6kmckWkmXbiQJix4A@mail.gmail.com>
Subject: Re: [PATCH] media: VIDEO_IMX8_JPEG should depend on ARCH_MXC and not
 default to m
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hoi Hans,

On Tue, Apr 6, 2021 at 11:24 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 31/03/2021 10:17, Geert Uytterhoeven wrote:
> > The i.MX8 QXP/QM integrated JPEG encoder/decoder is only present on
> > Freescale/NXP i.MX8 QXP and QM SoCs.  Hence add a dependency on
> > ARCH_MXC, to prevent asking the user about this driver when configuring
> > a kernel without i.MX8 support.
> >
> > Drop the "default m" (which means "default y" if CONFIG_MODULES is not
> > enabled), as merely enabling CONFIG_COMPILE_TEST should not enable
> > additional code.
>
> You do not actually drop 'default m' in the patch. Either the patch or the
> commit message is wrong.

Oops, the patch is wrong.
V2 sent.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
