Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B172ABC7
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2019 21:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfEZTJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 15:09:12 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:39312 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfEZTJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 15:09:11 -0400
Received: by mail-yw1-f65.google.com with SMTP id w21so5811521ywd.6;
        Sun, 26 May 2019 12:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=afnFp8Qj6zuCgzLE0dd47oL4y3p86FHahzySe9xFq38=;
        b=P225AtmgLXa4AQY4cLPTI/vGK0XNkInPnL3TFJ67fgeH0aM7EbwXlurnLETHJqJwIh
         fZ9Gsxb9n8ok3a7vfE7NH6onYvFkrBRxB1DwC2NKEkqBC+k25HTZIy4M2EXfc9gk5akm
         tz84YkSiT4qKaiZhDM1DHw448nfsm6oak5ZuC7DmpLyDNabMOXdhhn+gj4HvAMH9HB1U
         Z6qcoTwwIwjws0tJAp0I7zCPBTkXcBBSoTklqbJzbhc9oNfllaGHm4MMPQsgY/M0jND/
         ECBOOGlgt9/FKvSsRPiADIXyFnhQD3IQ6YuPzbgM5MtDOOxqNOWP61PGGAPKNH6YxORJ
         oYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=afnFp8Qj6zuCgzLE0dd47oL4y3p86FHahzySe9xFq38=;
        b=twwA7htDESyg4cJyJ33blNe4y/E1S0A/yodRtnoB/8RrscCbkL5fI2TGEt++cqBg9+
         BWsGS3vaZB4CxiFImxsMaLZMVW78eLUF7+T6gm8oxXqDe71HmcvBq91oV934JkBHaKNs
         1jT29nW0iEDVlmAPThOKdg1I+WiwqYBf9cA/Aebj3+taZReNO5RqDJNO7vHQGYmxJtgG
         foAA84hac1WuGDiXtWoRAw3A6gRY6afScrwVt0GhRhMBC1zYm69QosOMbmIci2ERuCaG
         4UCgQZEjuc4zUOW2SCMj0fclZ1DIIMXT5H0QkbYIB5lFExccrvxV6UoCJHLOijwHsVA2
         RzQg==
X-Gm-Message-State: APjAAAUaOuQ6zZs9IPeQh6kP2nTdYRbuR5e1/Pzs3umQlErSG/AUWZmq
        g7IxmZDDu2+WfECF7KKZWmJLfvGg59oQ25bU8fo=
X-Google-Smtp-Source: APXvYqzuO7uis+Ag6d0Dm4SMdjW5wXGBTZf9kN4/BqjULwWAZx1N7dZqSDycF4Wb4W9vS79yjtRH9ARh5G62qavqBn4=
X-Received: by 2002:a81:cf03:: with SMTP id u3mr23678220ywi.306.1558897750823;
 Sun, 26 May 2019 12:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190525180923.6105-1-peron.clem@gmail.com> <20190525180923.6105-2-peron.clem@gmail.com>
 <20190526190217.257pxcc5s7ykhfor@flea>
In-Reply-To: <20190526190217.257pxcc5s7ykhfor@flea>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Sun, 26 May 2019 21:08:59 +0200
Message-ID: <CAJiuCcdpaw8jLMFUAAqvHr82+UZ4Lf1rrVvB1ksYQ1xcQqTDAg@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: media: A31 compatible
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

On Sun, 26 May 2019 at 21:02, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Sat, May 25, 2019 at 08:09:14PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Since Allwiner A31 all the SoC have a differente memory mapping.
> >
> > Introduce this bindings to make a difference since this generation.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> Mentionning what those differences are would be great

Will do,
Thanks for the review,
Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com, "Missing dma-requests, using %u.\n",
> > -                      DMA_CHAN_MAX_DRQ_A31);
> > -             sdc->max_request =3D DMA_CHAN_MAX_DRQ_A31;
> > +                      DMA_CHAN_MA
