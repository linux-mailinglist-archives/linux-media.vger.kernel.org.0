Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B112CD9E1
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 16:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgLCPK5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 10:10:57 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:43380 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbgLCPK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 10:10:57 -0500
Received: by mail-il1-f194.google.com with SMTP id z14so2193668ilm.10;
        Thu, 03 Dec 2020 07:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rmoIvvZjt44tZo4dnN2CE2ltl+BLxh4D62w3wIUKMJ0=;
        b=O9m6RFneBHcLVmY/7E9Knm6CVOqtq2Bvw3uJUiW2oeL75PCWgh/mDv42dyyidCnNPo
         zFBtr3II9m74l2ZOBJXSdD/iUW/gawIIiWvn6AgLWNZ2dBdPxOq/MO037vPYFyFQpNeP
         tBr3rMAzlQfMZTM9jCGPTVPBDAt3UPo41yoT249cjtA3hM0XPT/LpBQTtqxNiMEOctCd
         JUw98s0+57JJQNMhJJnYuzmaxtXHe/QSJ7+SSG/uc9eRY1DamJD+2inbuXLGlRc4jijC
         LK4Xxve+TIcwoXac55/2BGlUazHv+kIHZbMFuD3KIDijKtcQqSNLlhK2n2zcULp//hxN
         DNUg==
X-Gm-Message-State: AOAM531qUBg6XSEMYB65Uz9u7o8+dCvUyuO2lK4Gvt66FCeAWgb+Y7kF
        5mE6CPtUsvODDapEN4nIFA==
X-Google-Smtp-Source: ABdhPJxHX0pCNWkq9TWFihBjIHGLGgIkjEH7fIr8sLn66w16qEQ5IC7RsMBD/cLBHjtQFo9wNqa5qw==
X-Received: by 2002:a05:6e02:f43:: with SMTP id y3mr3259097ilj.187.1607008215932;
        Thu, 03 Dec 2020 07:10:15 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id r15sm1009411ila.69.2020.12.03.07.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:10:14 -0800 (PST)
Received: (nullmailer pid 389759 invoked by uid 1000);
        Thu, 03 Dec 2020 15:10:13 -0000
Date:   Thu, 3 Dec 2020 08:10:13 -0700
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: coda: Add missing
 'additionalProperties'
Message-ID: <20201203151013.GA2644458@robh.at.kernel.org>
References: <20201117200752.4004368-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117200752.4004368-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 17, 2020 at 02:07:52PM -0600, Rob Herring wrote:
> 'additionalProperties' is now required by the meta-schema. Add it for
> coda. As a result, 'interrupts', 'interrupt-names' and 'power-domains'
> need to be reworked to be defined at the top level.
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Ping! In case it wasn't clear, this should go in via the media tree.

>  .../devicetree/bindings/media/coda.yaml       | 42 +++++++++----------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
> index 7bac0057faf7..36781ee4617f 100644
> --- a/Documentation/devicetree/bindings/media/coda.yaml
> +++ b/Documentation/devicetree/bindings/media/coda.yaml
> @@ -44,6 +44,21 @@ properties:
>        - const: per
>        - const: ahb
>  
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: BIT processor interrupt
> +      - description: JPEG unit interrupt
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: bit
> +      - const: jpeg
> +
> +  power-domains:
> +    maxItems: 1
> +
>    resets:
>      maxItems: 1
>  
> @@ -59,6 +74,8 @@ required:
>    - clocks
>    - clock-names
>  
> +additionalProperties: false
> +
>  allOf:
>    - if:
>        properties:
> @@ -68,34 +85,17 @@ allOf:
>      then:
>        properties:
>          interrupts:
> -          items:
> -            - description: BIT processor interrupt
> -            - description: JPEG unit interrupt
> +          minItems: 2
>  
>          interrupt-names:
> -          items:
> -            - const: bit
> -            - const: jpeg
> +          minItems: 2
>      else:
>        properties:
>          interrupts:
> -          items:
> -            - description: BIT processor interrupt
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - fsl,imx6dl-vpu
> -              - fsl,imx6q-vpu
> -    then:
> -      properties:
> -        power-domains:
> -          $ref: /schemas/types.yaml#/definitions/phandle
> -          description: phandle pointing to the PU power domain
>            maxItems: 1
>  
> +        power-domains: false
> +
>  examples:
>    - |
>      vpu: video-codec@63ff4000 {
> -- 
> 2.25.1
> 
