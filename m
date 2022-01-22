Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DA0496907
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 02:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbiAVBCX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 20:02:23 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:44940 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbiAVBCW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 20:02:22 -0500
Received: by mail-ot1-f42.google.com with SMTP id a10-20020a9d260a000000b005991bd6ae3eso13840340otb.11;
        Fri, 21 Jan 2022 17:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m+eG+pmUgLm2DFISYgu/2cZs/ez+PrqwNhJ5FZ1tJhk=;
        b=5Vz2NgLIURRZUB7wWKqigK2EVfbdxrKSEi84lnkjP0W8OLymNRaeFa28hWOP/Or1hZ
         uuDYj0wAN3KswPa6L1eWxR0yq6AnFylAzVdcZVMAvGC6+VmkyWLEybHA7DYo9nWQeq3D
         srYOHHcBtsSu632iihkbHJMcbchWoSlUfIUypMJufcuH0362EbPS1I10PJqIxawNAel9
         QCIHYO7Jtr7Bvw22k8B5/gaAVxPTdORvVntJvyVu1kaX9fyf8BGA4k2zoP7fLbURl4mT
         VHv1KyMcYChIvESPdsit3527UXzNvcfGYahjqqSKi+nGAoewvEdQxw+SR1IG2vActttc
         qmUg==
X-Gm-Message-State: AOAM5333HRPh7mwKcHQx3koGe81pVTzom07rPdCzxE6LwoITR8IuaXzJ
        GjecvPHrTs1Bn57+PbDvUQ==
X-Google-Smtp-Source: ABdhPJxOXQhYowNaITR/y9j/NY4Oe7ajoksH2gvZ7Z64z6dr6+cYZZQQJ50bZqunauuALEcL6TnalA==
X-Received: by 2002:a9d:5384:: with SMTP id w4mr4494278otg.321.1642813341763;
        Fri, 21 Jan 2022 17:02:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m23sm1499988oos.6.2022.01.21.17.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 17:02:21 -0800 (PST)
Received: (nullmailer pid 1964779 invoked by uid 1000);
        Sat, 22 Jan 2022 01:02:20 -0000
Date:   Fri, 21 Jan 2022 19:02:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC 19/28] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Message-ID: <YetXnJf85MMlJjAW@robh.at.kernel.org>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-20-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112174612.10773-20-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 12, 2022 at 05:46:03PM +0000, Biju Das wrote:
> Document VSPD found in RZ/G2L and RZ/V2L family SoC's.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> index 990e9c1dbc43..b27ee23d2b29 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -19,6 +19,7 @@ properties:
>      enum:
>        - renesas,vsp1 # R-Car Gen2 and RZ/G1
>        - renesas,vsp2 # R-Car Gen3 and RZ/G2
> +      - renesas,vsp2-r9a07g044 # RZ/G2L and RZ/V2L
>  
>    reg:
>      maxItems: 1
> @@ -27,7 +28,8 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

You have to define what each one is once you have more than 1.

>  
>    power-domains:
>      maxItems: 1
> -- 
> 2.17.1
> 
> 
