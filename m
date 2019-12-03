Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA0FE112028
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 00:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfLCXVL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 18:21:11 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41390 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbfLCXVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Dec 2019 18:21:11 -0500
Received: by mail-oi1-f196.google.com with SMTP id i1so983957oie.8;
        Tue, 03 Dec 2019 15:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OLIRLr5XywqWPFFuglLlD1BjNumn3WJ8Ne6YKbN5tvs=;
        b=ODYlf9wiDiNXGBvyJ8GVYHEsuaINkT3sMb7iuXjc4/mlSJ5DnBMP0rul9S84KoQHAM
         SwBdl0KkDeZBDXM0ck4HremrYT19zoTqnWYwOXAvvXdp6Qm2hIJqVV380nFl1yx+xRZl
         j0mmlANDJQiTZzTZikkdAbS+j4FTHh6qzXJdwvpwWLUKQTtqF4ujvjC8wwoJt0Ydfd8g
         lCo17Ky+srTRlEr1vZpeH92O18O5fK2ZSb3riLechiyUvd0l6hJHygi2b1pJMd1cpOLF
         m/qJEWatxVQ8DnrKW3qOQFtSv0fHG5kiyYnPXSjnVAnpG8O1i8v3nnljaFd+4ipqeJZR
         04nw==
X-Gm-Message-State: APjAAAXokmRUz2um+gBgl0SzHSauLO3ZUkyZS9UvlbNtU15k2z4hbzQa
        0bcuFCoR/sjQXko54RBmWFytukI=
X-Google-Smtp-Source: APXvYqzxnxMykdi0OVF/YNoTEiUpYFT5/p0zN9KY5kNFKZUG+9whG8bIMuudZJPbuRke4NTBnJ9HPg==
X-Received: by 2002:aca:52c3:: with SMTP id g186mr140649oib.118.1575415270129;
        Tue, 03 Dec 2019 15:21:10 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c68sm984963oig.11.2019.12.03.15.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 15:21:09 -0800 (PST)
Date:   Tue, 3 Dec 2019 17:21:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     mjourdan@baylibre.com, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: media: amlogic,gx-vdec: add bindings
 for G12A family
Message-ID: <20191203232108.GA361@bogus>
References: <20191120111430.29552-1-narmstrong@baylibre.com>
 <20191120111430.29552-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120111430.29552-3-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 20, 2019 at 12:14:28PM +0100, Neil Armstrong wrote:
> Add bindings to support the Amlogic Video Decoder on the Amlogic G12A
> family.
> 
> For the G12A family, a supplementary clock is needed to operate the
> HEVC/VP9 decoder.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/media/amlogic,gx-vdec.yaml       | 57 +++++++++++++++----
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> index 878944867d6e..8ea979bb97e6 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
> @@ -27,12 +27,15 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> +    oneOf:
> +      - items:
> +        - enum:
> +          - amlogic,gxbb-vdec # GXBB (S905)
> +          - amlogic,gxl-vdec # GXL (S905X, S905D)
> +          - amlogic,gxm-vdec # GXM (S912)
> +        - const: amlogic,gx-vdec
>        - enum:
> -        - amlogic,gxbb-vdec # GXBB (S905)
> -        - amlogic,gxl-vdec # GXL (S905X, S905D)
> -        - amlogic,gxm-vdec # GXM (S912)
> -      - const: amlogic,gx-vdec
> +        - amlogic,g12a-vdec # G12A (S905X2, S905D2)
>  
>    interrupts:
>      minItems: 2
> @@ -59,13 +62,9 @@ properties:
>  
>    clocks:
>      minItems: 4
> +    maxItems: 5
>  
> -  clock-names:
> -    items:
> -      - const: dos_parser
> -      - const: dos
> -      - const: vdec_1
> -      - const: vdec_hevc

You can leave this here and add the 5th clock along with { minItems: 4, 
maxItems: 5 }.

Then the 'if' schema just needs a 'maxItems: 4'.

> +  clock-names: true
>  
>    amlogic,ao-sysctrl:
>      description: should point to the AOBUS sysctrl node
> @@ -77,6 +76,42 @@ properties:
>      allOf:
>        - $ref: /schemas/types.yaml#/definitions/phandle
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,gx-vdec
> +
> +    then:
> +      properties:
> +        clock-names:
> +          minItems: 4
> +          items:
> +            - const: dos_parser
> +            - const: dos
> +            - const: vdec_1
> +            - const: vdec_hevc
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,g12a-vdec
> +
> +    then:
> +      properties:
> +        clock-names:
> +          minItems: 5
> +          items:
> +            - const: dos_parser
> +            - const: dos
> +            - const: vdec_1
> +            - const: vdec_hevc
> +            - const: vdec_hevcf
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.22.0
> 
