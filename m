Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565103F4A4B
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 14:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235990AbhHWMHI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 08:07:08 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:38652 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233755AbhHWMGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 08:06:53 -0400
Received: by mail-vs1-f49.google.com with SMTP id t4so8040942vsm.5;
        Mon, 23 Aug 2021 05:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vRUGOdIWlKCN0x5wYo3mkqSM+ACIFjkQA6PJJ1+ee8U=;
        b=EUy4YwLuGvILPYhSAIxowoEOe7Ar5a6t/xA/i2hk0YmTxA9NVbJUIFZ4sOiVyVseUT
         nSqHPoD0arBTYXXvLlXGBQ4d28xkPC2ccY/RpDwkH+U1YXEsYPGKBvvo+lPhLFz7qmRb
         1grEYHWYGPvuS71/S588fcuz7ydaaWBx9yTuVsFtpao5nH49YH2g9OKobbWLShJ8stjN
         D5ProxA9tKVy3Sokf6lENaE9/0gG7oym3DxALubBAf8Suq6+E2p6jYviiGifPnJyvXi8
         KDJ+5jvZyPyZL5rSNupgFj6EoA7h04i73hvp/RXKjcr/clu9bbdFnyISJZh7uOA+1Oga
         EHdw==
X-Gm-Message-State: AOAM532bAg/3YJMGl/MG8SkxmBK2QQbtqM1iyXnfK52fhvDJ+qVa7FcI
        DV0PBwSgx6ABpJFBDK+FEljWGIQraIV2NLhdens=
X-Google-Smtp-Source: ABdhPJx1WX0mtDuYYPVaIT5LDoNkHBh3btEbm9JFpAx5AC6jxEDElSxtpuZnAEincysiGeTZxyBCT0kcEIsK7v1hnik=
X-Received: by 2002:a05:6102:3e92:: with SMTP id m18mr23283394vsv.53.1629720370966;
 Mon, 23 Aug 2021 05:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
 <20210817072703.1167-3-jacopo+renesas@jmondi.org> <10e068ea-98c0-46ba-0013-5f0dfdc5f772@ideasonboard.com>
 <20210818082700.tihxzs6yinvpf45h@uno.localdomain>
In-Reply-To: <20210818082700.tihxzs6yinvpf45h@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Aug 2021 14:05:59 +0200
Message-ID: <CAMuHMdX01XOUzgLOcXNjKDc-H+jWefEp4WBNB4p22oNiwJ9j9A@mail.gmail.com>
Subject: Re: [RFC 2/5] media: i2c: Add MAX9271 I2C driver
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 10:26 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Tue, Aug 17, 2021 at 04:49:17PM +0100, Kieran Bingham wrote:
> > On 17/08/2021 08:27, Jacopo Mondi wrote:
> > > The MAX9271 is a GMSL serializer that serializes a video stream
> > > received from an image sensor through the parallel video bus.
> >
> > https://datasheets.maximintegrated.com/en/ds/MAX9271.pdf calls it a
> > "16-Bit GMSL Serializer with Coas or STP Cable Drive"

Surely copy-and-paste would have prevented that typo of coax? ;-)

> Nice we have a public datasheet now!

Looks like I downloaded that one more than 4 years ago?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
