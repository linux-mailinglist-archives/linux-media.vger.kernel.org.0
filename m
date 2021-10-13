Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A3742C480
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 17:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhJMPLA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 13 Oct 2021 11:11:00 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:33356 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhJMPK7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 11:10:59 -0400
Received: by mail-ua1-f49.google.com with SMTP id i15so5256367uap.0;
        Wed, 13 Oct 2021 08:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oFBAfPgyMuB17AqaY51r0mJ1e8vUmKj2hXWfsRy5A/I=;
        b=s1PFQeBjY7ahXzB6d3bs5mW4d1YDM+i4gdPl1PZyicUFV5RD9ownQJlh3swezpAkGz
         Nfs75+oRdCTxssz+mZjhqMz55GsK5GlGlV/GJCS4QGfgP2p8xWYOQ+tbz2m8+113n+nj
         1cjUGIAwwfp4+wLRc7agYNrJJ4w1V3IRDzvr+K9yEwNoBTHB+sogqUl2sWU5LANOM8Mm
         SDFE7t/RLkE8RiytWIcWaN8pOSz4WbYXVE0Gk698aucT0hUmx5kmWsnxpBpbILdScLhw
         qJG/LWR5eXAQ0SzVWGaEiwLA17jfwQBdvSgabW824yx+jqWEJZQ5k4F3JAN3nj2VbA81
         C2hg==
X-Gm-Message-State: AOAM533Begi86te5hqnBHBWc8rqslvScyonWQcXVaVkY+L8MUFPVXI3+
        DQbOatGWzBszvmgUV5GK16KSzRdIIzprRHGgIU3gul9F5TE=
X-Google-Smtp-Source: ABdhPJyq/aqaQT5yX/UCK1Tolq/X2MRdqalWJlYJWiRxvS5BF9LwB21plAGTnUadD4q5Mu7TrFEE7lFo7wqtSzWDky0=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr39805069vsl.9.1634137735682;
 Wed, 13 Oct 2021 08:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211012183324.717975-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20211012183324.717975-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 17:08:44 +0200
Message-ID: <CAMuHMdX8LzmksfB85iSMX4+RYq=SYTamw5C3GNgbAV+9f1uAyQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: adv748x: Convert bindings to json-schema
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thanks for your patch!

On Tue, Oct 12, 2021 at 8:48 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Convert ADV748X analog video decoder documentation to json-schema.

You may want to list what changes you made:
  - Add missing ports subnode
  - Anything else I didn't notice? ;-)

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml

> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: main
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]

They can really appear in any order?

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: adi,adv7481
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          maxItems: 3
> +
> +        interrupt-names:
> +          minItems: 1
> +          items:
> +            - enum: [ intrq1, intrq2, intrq3 ]
> +            - enum: [ intrq1, intrq2, intrq3 ]
> +            - enum: [ intrq1, intrq2, intrq3 ]

They can really appear in any order?

> +    else:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          maxItems: 2
> +
> +        interrupt-names:
> +          minItems: 1
> +          items:
> +            - enum: [ intrq1, intrq2 ]
> +            - enum: [ intrq1, intrq2 ]

They can really appear in any order?

If not, you can merge the entries, and just override maxItems.

The rest looks good to me, but I'm no graph expert.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
