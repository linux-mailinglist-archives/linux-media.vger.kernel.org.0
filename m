Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB1D42D773
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 12:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbhJNKuG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 06:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbhJNKuF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 06:50:05 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C2FC061753
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 03:48:00 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u18so24838729lfd.12
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 03:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Y5SU88VxmkbI0mbNF2Xaeysw2Rm83gIlpNsXvM/RlQ0=;
        b=4RgwXXXSWg3C2mppMJSND+KOR94oio05+Xw63mT7iar0p7GhNdHyDkT/Lozhx5izV2
         UzmxuboW6Rk3kCgQWDR2EGckgx8pVIxL8wBbky1TRC1Cw9CefYgON7p8aX4/SG+wqSWQ
         RT6D5W8HEJVxoAdgA0/o25eP2+uGpob+EIMlgtQhO+wY3acAnf0wN1K2mA5EO+a6AD/B
         zHUTZbAnFCnMVov1FsUWbUmBEi98Wij7diWFlsOPMN9sZa/YupuWKzoG2Gi/vSEQYBvN
         ezTEJvpQvPnQ2geBDtH9OZ0YMqIpClHnHD9YY6ps/Gc1bACqd4k6czH5ongLS8qQz1ke
         aQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Y5SU88VxmkbI0mbNF2Xaeysw2Rm83gIlpNsXvM/RlQ0=;
        b=hG44kcrVpWgbGVRyNSjzMzE5JGe62ncjdg9ncq/PpOmLlwh5jCsqWkNhOSyNnijqOF
         bOAGKdex7j9Gko9J0fUT6hTBHcYWIESkReKDxma4NOJnu9ZJagv4vFsxbIWc7USh7PXQ
         uuJVvzI/ZydGzinuWW0XYyXd1aACohrOE/imvhJ46/nkhcAe/sTTY9EAuD+/vYU7mseZ
         y2nKQibKmfWrbisA/hrHc0JSXr+Gmf/peoMnmw75xmz+8yjOelZdhB3ALKj79YLsKJd0
         duJiD2vB/xZYB+StsDTF7FJx5R7LIVy7Ejxd59io5VViHTBn9y7p/U1LW5vfdJFiPt8n
         0hLw==
X-Gm-Message-State: AOAM5328enq9Ujag1Twcym8G5psIP6aPZdmHKyu1Y620ygj479us/aLS
        KqqE9bRLc8CNG/TmEeDsK60BOA==
X-Google-Smtp-Source: ABdhPJzcdE5baOuW79vInqMNEd95GdH46CZDxL0qynIX10cSbctJtc/a9FLLrvy1gtxkc5/UmSGp6Q==
X-Received: by 2002:ac2:5a0c:: with SMTP id q12mr4440494lfn.133.1634208478334;
        Thu, 14 Oct 2021 03:47:58 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id x1sm195759lfr.83.2021.10.14.03.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 03:47:57 -0700 (PDT)
Date:   Thu, 14 Oct 2021 12:47:57 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: adv748x: Convert bindings to json-schema
Message-ID: <YWgK3c+8wHWw8IYM@oden.dyn.berto.se>
References: <20211012183324.717975-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdX8LzmksfB85iSMX4+RYq=SYTamw5C3GNgbAV+9f1uAyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdX8LzmksfB85iSMX4+RYq=SYTamw5C3GNgbAV+9f1uAyQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thanks for your review.

On 2021-10-13 17:08:44 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> Thanks for your patch!
> 
> On Tue, Oct 12, 2021 at 8:48 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Convert ADV748X analog video decoder documentation to json-schema.
> 
> You may want to list what changes you made:
>   - Add missing ports subnode
>   - Anything else I didn't notice? ;-)

Wops, I intended to mention the addition of ports node. Thanks for 
noticing, will send a v2.

> 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> 
> > +  reg-names:
> > +    minItems: 1
> > +    items:
> > +      - const: main
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> 
> They can really appear in any order?

Yes they are refereed by i2c_new_ancillary_device() so any order is 
fine. They can only appear once tho, but I'm not sure how to enforce 
that.

> 
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: adi,adv7481
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 1
> > +          maxItems: 3
> > +
> > +        interrupt-names:
> > +          minItems: 1
> > +          items:
> > +            - enum: [ intrq1, intrq2, intrq3 ]
> > +            - enum: [ intrq1, intrq2, intrq3 ]
> > +            - enum: [ intrq1, intrq2, intrq3 ]
> 
> They can really appear in any order?

Yes, as not all interrupt lines may be wired up. It would be nice to 
enforce that intrq2 must come before intrq3 if both are wired but I'm 
not sure how to express that.

> 
> > +    else:
> > +      properties:
> > +        interrupts:
> > +          minItems: 1
> > +          maxItems: 2
> > +
> > +        interrupt-names:
> > +          minItems: 1
> > +          items:
> > +            - enum: [ intrq1, intrq2 ]
> > +            - enum: [ intrq1, intrq2 ]
> 
> They can really appear in any order?
> 
> If not, you can merge the entries, and just override maxItems.
> 
> The rest looks good to me, but I'm no graph expert.
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
