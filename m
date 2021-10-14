Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F7842DAC2
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 15:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhJNNu2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 09:50:28 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:39617 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhJNNu1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 09:50:27 -0400
Received: by mail-ua1-f48.google.com with SMTP id f3so11388588uap.6;
        Thu, 14 Oct 2021 06:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x53uhlI+aXnM9MOEtxnZrwd1lrkV4cJ/YMq9dGNGyAU=;
        b=BCtVhMQH1e8kC9Xh4jcF/B1sPCNvYo7qg3sLAqzyxMU9LXSb4IZ5wA8jVFumXjDmEF
         k6z4rCKnhMlIUsNkvrw0u0a6PUVJWLM7/VSGRaDwvrQUt6HthP1nAbqgBwjIlRnLv9C1
         nxb+ywjIWHYPQbhJ0mvNGcpbNB6Pnw3RjQow4sZapy9QFgNQbrdajX7XF3i0MdTlzg1g
         6cGEYCRcfPwFtIn7g5shgSA+de5J1OC0iSq8wfswapSzesxHOJ6wF99M//iFN/XMN4Q3
         ustEziO5ayM8dVoOHxFYXCjkp0inVKi6c8Ve1UmHzyU6GlBrthQbNPNGrtCeTgjHb9bc
         IErw==
X-Gm-Message-State: AOAM531zD18er3FlrwlsF0386okdF4x/1e2PmejXpyjUGLLnRI0zQhUY
        qJ1sxWTy2N54Y2gSYgzG3pWQo4ccnp9mqswxoXzMk5oZ
X-Google-Smtp-Source: ABdhPJw0/4tSYGfoqXRVeEVlKRzE8NTqY2UzKyGwpdwvAQzrUqbsBFmePYt1S1fToDXzEv7RZ+qHr8gGtpymRLOWjw0=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr6918296vsl.9.1634219302258;
 Thu, 14 Oct 2021 06:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210901091852.479202-1-maxime@cerno.tech> <20210901091852.479202-28-maxime@cerno.tech>
In-Reply-To: <20210901091852.479202-28-maxime@cerno.tech>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Oct 2021 15:48:11 +0200
Message-ID: <CAMuHMdXBbrsgT1GeT4h7arjVM8j_79w3GPOHgXXQDi5-KD_rAQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/52] dt-bindings: media: Convert OV5640 binding to a schema
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Wed, Sep 1, 2021 at 11:20 AM Maxime Ripard <maxime@cerno.tech> wrote:
> The Omnivision OV5640 is supported by Linux thanks to its device tree
> binding.
>
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
>
> Cc: linux-media@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Steve Longerbeam <slongerbeam@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml

> +  rotation:
> +    enum:
> +      - 0

git am: warning: 1 line adds whitespace errors.


> +      - 180

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
