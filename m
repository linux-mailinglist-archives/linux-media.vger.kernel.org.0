Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE9D35D15
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 14:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbfFEMoS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 08:44:18 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:43116 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfFEMoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 08:44:18 -0400
Received: by mail-yb1-f195.google.com with SMTP id n145so9240140ybg.10;
        Wed, 05 Jun 2019 05:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xi2EvDvX1o5a9FG2uTIFVqZhlEAgWZPRI+I6e9eKWDA=;
        b=Fv7/k7a9r4amkCrKI+VwwbKV67Pg6mruQZNeLTqihnSgQaggIJUtMx2rmAl7PlxGml
         2oi+ybtMM6nhyiSI/NAC2ikNhDm3JyvTAE0bdi1xoAraGXyIOKAeCWEw0kx9plShaYRu
         73rVdnZAwsTNw0ZRvAxgqjUnXIZlCozkOXdibujrNjp+Gp3G2WadNfhkTXtXKd/uJRRJ
         n6pM5OFFQ5CxiUlQA1nKorGAvXCzdE2ZD/bdQ4VzyST4XyV2Av0wV2g8rCKI1KYP4/hx
         kSTvIi37vF429N2y3Y9rNWMwKfj1MA2RhMoOaSexaLVUKGjvAv46Sx+HHcT1HHu19vnB
         UhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xi2EvDvX1o5a9FG2uTIFVqZhlEAgWZPRI+I6e9eKWDA=;
        b=su3MDhQ356W+7gmQhfK6zB5yTGxWffb7FGABado5hQpecfZCZDi5CHMr40/LRmGj4i
         ibJNiA4jTAVZv3j1FexHW7a51K8KwQ8sGVCzYeVQrvokcfap7VN8lbt0VoP0PRIG0/H7
         j3G0jDzeyBQb0L/cCT6VJy4QcpY207EUFjB1LFCDre2LI+inqHTicJOgnRZ9tAezE6AX
         e5/OoUNhEBNnRE1yMRZs2BrECnu5yyV+pPbP6kWwpqgzrguxIb6BRhQMDAEMGHjswFOm
         nVGFB1iBoS+PDJPXDEngVvWmqBJafXRFDGiNTcMfmBIcNCPzb3PTXHkIaKJvdYiWi+A1
         /e8w==
X-Gm-Message-State: APjAAAVBqDKAO25hTVR8cPd1CDbOZR/OFCH6qibVRceFtXTLFYkbVTz0
        OIqCtZamU6o/YLthfZT/b08pSIxoCr9iLp/L4uo=
X-Google-Smtp-Source: APXvYqyNydPnvstKf3mleSA1trFVpSWc/CJWb4PuLa9jX2KFdsZOVXxyiG1PQefvl++ce+LJ3J7EvkwU6iNd8X+t88g=
X-Received: by 2002:a25:9b47:: with SMTP id u7mr18656221ybo.396.1559738657457;
 Wed, 05 Jun 2019 05:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190604162959.29199-1-peron.clem@gmail.com> <20190604162959.29199-5-peron.clem@gmail.com>
 <20190605095141.psrq6mhk63zto77s@flea>
In-Reply-To: <20190605095141.psrq6mhk63zto77s@flea>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Wed, 5 Jun 2019 14:44:06 +0200
Message-ID: <CAJiuCceZa=WEiF8_LK+jDdiXOn1i8+z8Smr6YKCpo9_XftgueQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] media: rc: sunxi: Add RXSTA bits definition
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Wed, 5 Jun 2019 at 11:51, Maxime Ripard <maxime.ripard@bootlin.com> wrot=
e:
>
> On Tue, Jun 04, 2019 at 06:29:50PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > We are using RXINT bits definition when looking at RXSTA register.
> >
> > These bits are equal but it's not really proper.
> >
> > Introduce the RXSTA bits and use them to have coherency.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  drivers/media/rc/sunxi-cir.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.=
c
> > index 0504ebfc831f..572bd2257d35 100644
> > --- a/drivers/media/rc/sunxi-cir.c
> > +++ b/drivers/media/rc/sunxi-cir.c
> > @@ -48,11 +48,11 @@
> >
> >  /* Rx Interrupt Enable */
> >  #define SUNXI_IR_RXINT_REG    0x2C
> > -/* Rx FIFO Overflow */
> > +/* Rx FIFO Overflow Interrupt Enable */
> >  #define REG_RXINT_ROI_EN             BIT(0)
> > -/* Rx Packet End */
> > +/* Rx Packet End Interrupt Enable */
> >  #define REG_RXINT_RPEI_EN            BIT(1)
> > -/* Rx FIFO Data Available */
> > +/* Rx FIFO Data Available Interrupt Enable */
> >  #define REG_RXINT_RAI_EN             BIT(4)
> >
> >  /* Rx FIFO available byte level */
> > @@ -60,6 +60,12 @@
> >
> >  /* Rx Interrupt Status */
> >  #define SUNXI_IR_RXSTA_REG    0x30
> > +/* Rx FIFO Overflow */
> > +#define REG_RXSTA_ROI                        BIT(0)
> > +/* Rx Packet End */
> > +#define REG_RXSTA_RPE                        BIT(1)
> > +/* Rx FIFO Data Available */
> > +#define REG_RXSTA_RA                 BIT(4)
>
> I'm fine with it on principle, but if the consistency needs to be
> maintained then we could just reuse the above defines

There is no comment why we can reuse them, they can also be some wrong
case for example the RXINT_DRQ_EN bit is not present in RXSTA and same
for STAT bit present in RXSTA and not present in RXINT.

I have discover and read this code a month ago and this logic is
really not obvious nor explain.

Maybe this hack could be done when we will introduce a quirks, but for
the moment I really think that it's more proper and readable to
introduce them properly.

Regards,
Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
