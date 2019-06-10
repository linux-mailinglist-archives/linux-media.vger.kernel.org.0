Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9719E3B5B8
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 15:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390227AbfFJNEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 09:04:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42930 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389959AbfFJNEF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 09:04:05 -0400
Received: by mail-lf1-f66.google.com with SMTP id y13so6548938lfh.9
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2019 06:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WcJ8L2VIZpozOUCxmAIAp8kABMEhkWByzfpSGr3ZIIo=;
        b=lo0a8oKwwI2k/gAiDktR2QOF6rFcxgeFG/RSLWlqrjAPY3hFnEkgRMGUp0oFBhtm2A
         nVrhhjaXFqDUC1zwdRa4lAaDYf4gxp5jSyH7j+0DiTbweuTovBS0I743+wsnXtz5uHfd
         EfCxY4Uctl1YmOcTq2BIYllN0gL4R8ov1RJxCavY80DwpQJ+3sK0MSc4IaonvDebWRuu
         y9Aw24jPK7gQaFHtuTeuki9lIbuEj7a4WF4h0m6bZklZ1bX0W7j18+AHc0Aj9q+PiHO0
         W7Nf262vjP33Pp4dDm5MFNOiLhXgoX6lkMfm365V586L4kBGbCtDbbb/xd4uWw+mCbjG
         R++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WcJ8L2VIZpozOUCxmAIAp8kABMEhkWByzfpSGr3ZIIo=;
        b=Qp3j4Qyr42R91t9MVcs+7gH21XJIx5WVIVW+4PF0KpuzNEJKZP4JJHuSk9v5JB/OF1
         8EloRsLcNTI6pN16ygahpSM5qVvQxy/UqoyJkFBfnl6YkiZ8Nh1QhJT+NgK/fnsGte7h
         T8BzwK6Re1EkwgVx73v+DEeW6sSxm1VuB042Ip4iKKMSdhLXjhe01X9AEBWeuCy6jBp3
         1jQFegiUDcLfLdZpGRwhNeUhZloUNoMKLpaygULxamNIdaTOdZpXfqUn43Rj6EuhIOC4
         0HxzDtS9HGt9VHKk0M0Etd5V5p+kruZh9c6eYabo+adCBY8jU/VGbD9lys/L6/LzqWA+
         yTCw==
X-Gm-Message-State: APjAAAVegsRu/32sVE8P3TX+/LhKfu/kYo9iejUAKjtkHzVVw3yZiLiM
        nZRNe9sMtD9q8dAZTd4gRjnr6tbM2HmZXL6v+t3Z7w==
X-Google-Smtp-Source: APXvYqzM5swNZJ4w1rVu6nw3oQdiqx3Km/1wZnjPG7wePICVaK1Y/o7E/3VRoxqpRWAudLGWuSAHSADwVXTzzfRVtds=
X-Received: by 2002:a19:c383:: with SMTP id t125mr27992403lff.89.1560171843304;
 Mon, 10 Jun 2019 06:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190606094722.23816-1-anders.roxell@linaro.org> <d6b79ee0-07c6-ad81-16b0-8cf929cc214d@xs4all.nl>
In-Reply-To: <d6b79ee0-07c6-ad81-16b0-8cf929cc214d@xs4all.nl>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Mon, 10 Jun 2019 15:03:52 +0200
Message-ID: <CADYN=9KY5=FzrkC7MKj9QnG-eM1NVuL00w8Xv4yU2r05rhr7WQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] drivers: media: coda: fix warning same module names
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, p.zabel@pengutronix.de,
        andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
        marex@denx.de, stefan@agner.ch, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, b.zolnierkie@samsung.com,
        a.hajda@samsung.com, hkallweit1@gmail.com,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 6 Jun 2019 at 12:13, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 6/6/19 11:47 AM, Anders Roxell wrote:
> > When building with CONFIG_VIDEO_CODA and CONFIG_CODA_FS enabled as
> > loadable modules, we see the following warning:
> >
> > warning: same module names found:
> >   fs/coda/coda.ko
> >   drivers/media/platform/coda/coda.ko
> >
> > Rework so media coda matches the config fragment. Leaving CODA_FS as is
> > since thats a well known module.
> >
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  drivers/media/platform/coda/Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/coda/Makefile b/drivers/media/platform/coda/Makefile
> > index 54e9a73a92ab..588e6bf7c190 100644
> > --- a/drivers/media/platform/coda/Makefile
> > +++ b/drivers/media/platform/coda/Makefile
> > @@ -1,6 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >
> > -coda-objs := coda-common.o coda-bit.o coda-gdi.o coda-h264.o coda-mpeg2.o coda-mpeg4.o coda-jpeg.o
> > +video-coda-objs := coda-common.o coda-bit.o coda-gdi.o coda-h264.o coda-mpeg2.o coda-mpeg4.o coda-jpeg.o
> >
> > -obj-$(CONFIG_VIDEO_CODA) += coda.o
> > +obj-$(CONFIG_VIDEO_CODA) += video-coda.o
>
> How about imx-coda? video-coda suggests it is part of the video subsystem,
> which it isn't.

I'll resend a v2 shortly with imx-coda instead.


Cheers,
Anders

>
> Regards,
>
>         Hans
>
> >  obj-$(CONFIG_VIDEO_IMX_VDOA) += imx-vdoa.o
> >
>
