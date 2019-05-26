Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA622ABD1
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2019 21:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfEZTQF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 15:16:05 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:37312 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfEZTQF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 15:16:05 -0400
Received: by mail-yw1-f66.google.com with SMTP id 186so5815849ywo.4;
        Sun, 26 May 2019 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=noskaXJB+lKStgYLNqjD43scq/LOmprbRcl7XPqZyEI=;
        b=D8JnONzvJVlbSq818NlO2tEUyWIfBoSFmPsh5zvcDyBHWIlsg/7WbzUDiBGXDGAa7t
         t7q/y9nPrbUqqkKlGdqnb0djhVmy6zqH1f47Z4PDzhqU1x2w7hZNelCNTCOpD13xVL1O
         ZXbpqJTWIhIkHYxjvmoGoEFYcUfZ7ezMF2AkwVJlNHt4HR36YZKr2zCpBrXoR3LnYP1K
         PXKJcdeEEjMtuWmQN0LmMdGXR4WGYNss6d30qaK4MmrC9KOQmgn6/n9ZxVEiEa787Ywe
         ZHeqUNq1DmIrBF1UNo7bLY4/n1OEYs7At07Uz5vFO5lZL7KPf6H57qHjmR7U1zykp5tQ
         Qptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=noskaXJB+lKStgYLNqjD43scq/LOmprbRcl7XPqZyEI=;
        b=q3OMvuAI+N1vAgBgWFO9dEkDsdTyyRGG4Md5LtGzjhdI7xR4gMIKzhQV3rmx9RNUIq
         HwKyTo1fGjrMeWYlOC0M79JO5nGKzw3zWX8pBF7PRse3V9sqNZvCd/yLT8DPvADnIwus
         jKqyIG08VZLJz+mbzdSHbepoEYDHoI0YiUYzT3Ni8UUvegLqhwHH7L5/x4DCGMwFDo+L
         BJ48zxpBHg2Wk0P0QJKHVAW9bG86KwGkk3aEa3ignIQARtajVSu3Ud/H11Dj+Oejds1B
         9YyGZP03RT6b3Yf9AMOVRjatSw+GQeNe1AjSCKXKoighZMUzRQxukDDb43abaM2y7rC2
         bp/g==
X-Gm-Message-State: APjAAAXGskhURqx+xSrHo+W8SVkGg8cGtIsvUh+C+m0gArds2eisH+Og
        pWoVypFGMIwq8+B9pbZAm7wMxOuL0fIR6jS7ip8=
X-Google-Smtp-Source: APXvYqz+VzNt0oKUMWNius14IRSdTfbNvnD/DEiP9e5FvjbEQtR2ABEeJ+6nuk7ooQZFFcE+eOm26NaadqAoXgSQSww=
X-Received: by 2002:a81:9a4b:: with SMTP id r72mr30838628ywg.422.1558898160019;
 Sun, 26 May 2019 12:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190525180923.6105-1-peron.clem@gmail.com> <20190525180923.6105-5-peron.clem@gmail.com>
 <20190526190410.ngrvrclp5ge5rdqy@flea>
In-Reply-To: <20190526190410.ngrvrclp5ge5rdqy@flea>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Sun, 26 May 2019 21:15:49 +0200
Message-ID: <CAJiuCceHhxYt=BY0Jvfv6+80ekKcMLUSv5UWBorYuvtO-DkOtg@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: media: sunxi-ir: Add A64 compatible
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Sun, 26 May 2019 at 21:04, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Sat, May 25, 2019 at 08:09:17PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > There is some minor differences between A31 and A64 driver.
> >
> > But A31 IR driver is compatible with A64.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/media/sunxi-ir.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Doc=
umentation/devicetree/bindings/media/sunxi-ir.txt
> > index 53e88ebb53fe..da5aeba843de 100644
> > --- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
> > +++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
> > @@ -5,6 +5,7 @@ Required properties:
> >       "allwinner,sun4i-a10-ir"
> >       "allwinner,sun5i-a13-ir"
> >       "allwinner,sun6i-a31-ir"
> > +     "allwinner,sun50i-a64-ir", "allwinner,sun6i-a31-ir"
>
> I guess resets is mandatory for the A31 onwards too, right?

Indeed, I will add this information in the device-tree bindings.
Ideally, we should also introduce a quirks with a "has_reset" property.

Thanks for your review,
Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
