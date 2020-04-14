Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1172D1A8AC5
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 21:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504784AbgDNT37 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 15:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731146AbgDNT3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 15:29:51 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714A7C03C1A9;
        Tue, 14 Apr 2020 12:10:40 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id j4so785234otr.11;
        Tue, 14 Apr 2020 12:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ScMMUsaLt0ejnuMSGLD3JzzBHstpRGblAIjPSlTU1dg=;
        b=SWvMuY40aT4e5bC+BZbfXwZL1zBdl9PFUrLR30h9USYLtrsrkDE7k0hd6Y/4vvxBYM
         HO8U33ytOyIVZfzwYm+pZX37+kshJohcMoruPunA2fO5drYj5f3uus6ZFODoV9Li0ZIb
         CkoVkKdY6pjUEM4g8fSivPDMqYBwXfEjriX7niRW4l5tNctnPN9cXrhu8I8A1UxtlqC7
         NDDYquys8UEVVROr2HSX4Ah9fW5Uw3b5lNR73YBnG0HWlxVpRy91eyKLoFZAZEl/BWqO
         1m1WGaAnvD9YFKq5pG6qiIqia84HVEjaWSQvdYIrTClMEtrkTcjGOVaPiO6cDkOSsG5E
         o7TQ==
X-Gm-Message-State: AGi0PuZTt+Q+M9eLT/IYnFme9PgxBK2jKkS0w3FWvxjPrsV/cEV8sQ1D
        G6aviB9KBp0hzZR7M3clOgFmNwI=
X-Google-Smtp-Source: APiQypIKWxISZggRXNf9Qgesy8hv7Rz5Nq8gj4Eg85zBnsEFCSfC2I3YgukNf8jHIsVnvUdMfFWC6g==
X-Received: by 2002:a9d:2215:: with SMTP id o21mr19219028ota.113.1586891439450;
        Tue, 14 Apr 2020 12:10:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a13sm2048010otl.55.2020.04.14.12.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 12:10:38 -0700 (PDT)
Received: (nullmailer pid 5509 invoked by uid 1000);
        Tue, 14 Apr 2020 19:10:37 -0000
Date:   Tue, 14 Apr 2020 14:10:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 4/4] dt-bindings: display: add port support to atmel
 lcdc
Message-ID: <20200414191037.GA29184@bogus>
References: <20200412182012.27515-1-sam@ravnborg.org>
 <20200412182012.27515-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200412182012.27515-5-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 12, 2020 at 08:20:12PM +0200, Sam Ravnborg wrote:
> Update the Atmel LCDC binding to include:
> - pwm. Used for backlight
> - endpoints using port node
>   Used for handle to panel
> - Added wiring property that is used to describe
>   the wiring between the LCDC and the panel
> 
> Existing properties that should not be used in new
> bindings are deprecated.
> 
> Updated example to include the updated way to specify panel etc.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/atmel/lcdc.yaml          | 94 ++++++++++++++++++-
>  1 file changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> index 7dcb9a4d5902..b5c2628f7805 100644
> --- a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> +++ b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
> @@ -28,6 +28,7 @@ properties:
>  
>    "#address-cells":
>      const: 1
> +
>    "#size-cells":
>      const: 0
>  
> @@ -43,13 +44,84 @@ properties:
>    lcd-supply:
>      description: Regulator for LCD supply voltage.
>  
> +  "#pwm-cells":
> +    description:
> +      This PWM chip use the default 3 cells bindings
> +      defined in ../../pwm/pwm.yaml.
> +    const: 3
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    maxItems: 2
> +    items:
> +      - const: lcdc_clk
> +      - const: hclk
> +
> +  port@0:

Just 'port' if there's only 1.

> +    type: object
> +    description: Endpoints of the display controller
> +
> +    properties:
> +
> +      reg:
> +        const: 0
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      endpoint@0:

Just 'endpoint' if there's only 1.

> +        type: object
> +        description: endpoint node that include phandle to panel
> +
> +        properties:
> +
> +          reg:
> +            const: 0
> +
> +          wiring:
> +            enum:
> +              - straight
> +              - red-blue-reversed
> +            description: |
> +              The LCDC is based on a blue-green-red configuration but to adapt
> +              to SW only supporting red-green-blue the data lines for red and blue
> +              may be reversed.
> +              See details in: http://ww1.microchip.com/downloads/en/AppNotes/doc6300.pdf
> +              "straight" - default value. Data lines are not reversed, uses BGR
> +              "red-blue-reversed" - red and green are reversed, uses RGB
> +
> +          remote-endpoint:
> +            $ref: /schemas/types.yaml#/definitions/phandle
> +            description:
> +              phandle to the panel node
> +
> +        required:
> +          - reg
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - reg
> +
> +    additionalProperties: false
> +
>    display:
>      $ref: /schemas/types.yaml#/definitions/phandle
> +    deprecated: true
>      description: phandle to display node
>  
>  patternProperties:
>    "^display[0-9]$":
>      type: object
> +    deprecated: true
>      description: |
>        Display node is required to initialize the lcd panel.
>        This should be in the board dts
> @@ -107,12 +179,32 @@ required:
>  
>  examples:
>    - |
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
>      fb {
>          compatible = "atmel,at91sam9263-lcdc";
>          reg = <0x00700000 0x1000>;
> -        interrupts = <23 3 0>;
> +        interrupts = <26 IRQ_TYPE_LEVEL_HIGH 3>;
> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 26>, <&pmc PMC_TYPE_PERIPHERAL 26>;
> +        clock-names = "lcdc_clk", "hclk";
> +
> +        /* pwm for backlight */
> +        #pwm-cells = <3>;
> +
>          #address-cells = <1>;
>          #size-cells = <0>;
> +
> +        port@0 {
> +            reg = <0>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            endpoint@0 {
> +                reg = <0>;
> +                wiring = "red-blue-reversed";
> +                remote-endpoint = <&panel_input>;
> +            };
> +        };
>      };
>  
>    - |
> -- 
> 2.20.1
> 
