Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E5E29045C
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 13:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406929AbgJPLus (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 07:50:48 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43437 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406895AbgJPLus (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 07:50:48 -0400
Received: by mail-ot1-f68.google.com with SMTP id n61so2097208ota.10;
        Fri, 16 Oct 2020 04:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r/6QPBpExSoKarbZok55Q3okDwia1sPzi7Df1m2mfVg=;
        b=qLToeB5QN1lU57o82TzXNCNnk7969ntfaxFxVwFV3jA3LMKKDaYD5hMx9O1n8jqMQy
         gcFgKrGkH586eh4+kGgUIO0P9F03Ni51NSLhPBQKU0XZDjQp3udoVkLjtgK5TnJgHcUw
         7O8Fav044cbmPkiSW4zOVoUsUtSkrDgbulY39X2S3GgwKnRKQobxcqz4+Q570wB5jfY1
         ZTCvlx/N8sQluHklITV83SolbK9YEFSXset9LbWG6+OzMcNDo6NE7uwYOX60Ed6z4KD6
         6G4ohuGZp8PsFO/YlfM5hACtveQTeCNN0InGeqovuY1zVB5Uks0VGbBgp80nKWDX6zc+
         nJTw==
X-Gm-Message-State: AOAM533SzFuIscj/9eSs+FR/MGtuV/dozYLBDOkUT2lujQlREu3/NK2I
        ApT6XyHsQBLQ/8ZsSjgmwRl5VIyyL8QbNux3A0zrOLrU
X-Google-Smtp-Source: ABdhPJwigMKNyVfvIGoimEjWHJyvFWyITKnqMAGiCmKOG0IomEp8v2CuuetHlv8E32U+FTI2pVl7xHVgLom/iXuQAgs=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr2082934oti.107.1602849045708;
 Fri, 16 Oct 2020 04:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201016120625.64337-1-jacopo+renesas@jmondi.org> <20201016120625.64337-3-jacopo+renesas@jmondi.org>
In-Reply-To: <20201016120625.64337-3-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Oct 2020 13:50:34 +0200
Message-ID: <CAMuHMdUof5Yb=5notGDYycJtZyLzGp2RPjJ=m6GVodBRDxw9ow@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: media: max9286: Document 'maxim,high-threshold'
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Oct 16, 2020 at 12:09 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Document the 'maxim,high-threshold' vendor property in the bindings
> document of the max9286 driver.
>
> The newly introduced boolean property allows controlling the initial
> configuration of the GMSL reverse control channel to accommodate
> remote serializers pre-programmed with the high threshold power
> supply noise immunity enabled.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -51,6 +51,19 @@ properties:
>    '#gpio-cells':
>      const: 2
>
> +  maxim,high-threshold:
> +    description: |
> +      A boolean property to increase the initial amplitude of the reverse
> +      control channel to compensate for remote serializers pre-programmed with
> +      high threshold noise-immunity.
> +
> +      Some camera modules (in example the RDACM20 one) include an on-board MCU
> +      that pre-programs the embedded serializer with reverse channel power
> +      supply noise immunity enabled. The deserializer shall increase its
> +      reverse channel amplitude to compensate that and be able to communicate
> +      with the remote end.
> +    type: boolean

Does this "high" threshold correspond to some numerical value?
I.e. could we run into a future need to support more values than just
true/false?
If yes, we may want to use a numerical value from the start.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
