Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03F9736590
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 22:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfFEUfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 16:35:11 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:45301 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFEUfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 16:35:11 -0400
Received: by mail-yw1-f65.google.com with SMTP id m16so4779138ywh.12;
        Wed, 05 Jun 2019 13:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l03+E+1rYHoeHYqvcAbN6UcQV0/t8ZT8Ua4GYoPSknY=;
        b=YWjYKCzNUvXBxodopAhJImDU8t2GnSwlHigPq68mI+bY3lLTg03GzAiy9C3b64VMAd
         /lWQvmyXBGx4rVvjkEDSMZIxmWGzGQb15ioNnK6BWd/Dpc9qCVU50C9Fk6WN0kkepVXK
         ZHx8ic7c0rfHE2SNaISUu3mUpecLHDUO/3qPE6gA6ATPhRWbP237x0nLCDmBa8SGDgyO
         2BN22d2dWejW/FpRu93YfY2noI7nhdmW0pYLgKgkwFsWfIfeVZnuEofHyLfCTFyR0fJM
         d4t/574oDLDtjB+/A8wWIpy/TZDZZ0L6UlFidYeU0Nf5hd19q4JOZoTyzBKVgdnf/Wst
         pBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l03+E+1rYHoeHYqvcAbN6UcQV0/t8ZT8Ua4GYoPSknY=;
        b=I5CRRUKdtlMp1IUoIVCkEfW2rvOobhjdgdvXlbDPK4NvkaqvKp4LSTaAimVW5/x9dG
         WqnMwoXEQxInJxUArEwW+XJxtxMhf0OJlV3PQgP5zR0DlxUYLDlbPN7FPXgpL6VS1by8
         YNLL0VlT5KFHJAiqfl+j3PS+ku8L+oLQeV7FSRxg1JFP82rfZF9ycZ8LIQm467l9iXLd
         F6wD4PYLIGhzyJeqsyiuS6WxtzK+vfn/CMmCyKhjg5ZDw7kq/5VO5jNy4hV73EKniIkq
         e6XS5pZzLwJU6/Vf4MMdh0bvG6wUU0rqolvmsqSr38CboIA0+/mbgIFION4odSVSofMF
         Ly4Q==
X-Gm-Message-State: APjAAAW6bb1Ffo7B+nx1cCPFavis3b2JL9qW39MuOpH5ZLaLDy6rCmiC
        ryHTFGma9BsSuy2OEkWF/liMvw2/6id5EH3TxPE=
X-Google-Smtp-Source: APXvYqxQCxoaa23XSM9kh7nxBMVdszGzffy/2HEGfA6pHWSkToo3IshmE6fASP2xWcrw/Z52pr/+OPpkJypCjSyqRh4=
X-Received: by 2002:a81:5f54:: with SMTP id t81mr21100308ywb.234.1559766909845;
 Wed, 05 Jun 2019 13:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190604162959.29199-1-peron.clem@gmail.com> <20190604162959.29199-5-peron.clem@gmail.com>
 <20190605095141.psrq6mhk63zto77s@flea> <CAJiuCceZa=WEiF8_LK+jDdiXOn1i8+z8Smr6YKCpo9_XftgueQ@mail.gmail.com>
 <20190605200020.tmyom3lg3inu6vvf@flea>
In-Reply-To: <20190605200020.tmyom3lg3inu6vvf@flea>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Wed, 5 Jun 2019 22:34:58 +0200
Message-ID: <CAJiuCceuN8JHwLBeoKSzwY2s0-wFJf-N8FbqOGemkhtyax73Eg@mail.gmail.com>
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

On Wed, 5 Jun 2019 at 22:00, Maxime Ripard <maxime.ripard@bootlin.com> wrot=
e:
>
> On Wed, Jun 05, 2019 at 02:44:06PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Maxime,
> >
> > On Wed, 5 Jun 2019 at 11:51, Maxime Ripard <maxime.ripard@bootlin.com> =
wrote:
> > >
> > > On Tue, Jun 04, 2019 at 06:29:50PM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > We are using RXINT bits definition when looking at RXSTA register.
> > > >
> > > > These bits are equal but it's not really proper.
> > > >
> > > > Introduce the RXSTA bits and use them to have coherency.
> > > >
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > ---
> > > >  drivers/media/rc/sunxi-cir.c | 18 ++++++++++++------
> > > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-=
cir.c
> > > > index 0504ebfc831f..572bd2257d35 100644
> > > > --- a/drivers/media/rc/sunxi-cir.c
> > > > +++ b/drivers/media/rc/sunxi-cir.c
> > > > @@ -48,11 +48,11 @@
> > > >
> > > >  /* Rx Interrupt Enable */
> > > >  #define SUNXI_IR_RXINT_REG    0x2C
> > > > -/* Rx FIFO Overflow */
> > > > +/* Rx FIFO Overflow Interrupt Enable */
> > > >  #define REG_RXINT_ROI_EN             BIT(0)
> > > > -/* Rx Packet End */
> > > > +/* Rx Packet End Interrupt Enable */
> > > >  #define REG_RXINT_RPEI_EN            BIT(1)
> > > > -/* Rx FIFO Data Available */
> > > > +/* Rx FIFO Data Available Interrupt Enable */
> > > >  #define REG_RXINT_RAI_EN             BIT(4)
> > > >
> > > >  /* Rx FIFO available byte level */
> > > > @@ -60,6 +60,12 @@
> > > >
> > > >  /* Rx Interrupt Status */
> > > >  #define SUNXI_IR_RXSTA_REG    0x30
> > > > +/* Rx FIFO Overflow */
> > > > +#define REG_RXSTA_ROI                        BIT(0)
> > > > +/* Rx Packet End */
> > > > +#define REG_RXSTA_RPE                        BIT(1)
> > > > +/* Rx FIFO Data Available */
> > > > +#define REG_RXSTA_RA                 BIT(4)
> > >
> > > I'm fine with it on principle, but if the consistency needs to be
> > > maintained then we could just reuse the above defines
> >
> > There is no comment why we can reuse them, they can also be some wrong
> > case for example the RXINT_DRQ_EN bit is not present in RXSTA and same
> > for STAT bit present in RXSTA and not present in RXINT.
> >
> > I have discover and read this code a month ago and this logic is
> > really not obvious nor explain.
> >
> > Maybe this hack could be done when we will introduce a quirks, but for
> > the moment I really think that it's more proper and readable to
> > introduce them properly.
>
> I don't think we understood each other :)
>
> I was talking about having something like
>
> #define REG_RXSTA_ROI  REG_RXINT_ROI_EN
Ok, I will send an update.

Thanks for the review,
Cl=C3=A9ment


>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
