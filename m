Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9673CBC65
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 21:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbhGPT0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 15:26:31 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:45615 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhGPT0a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 15:26:30 -0400
Received: by mail-io1-f44.google.com with SMTP id z17so5250178iog.12;
        Fri, 16 Jul 2021 12:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OTm0XNX7QR5VUzRmbpcpXSsIdm4bg2gxSberXyeMlDY=;
        b=JgiS+lWD8MI9RwLtSua/9EiCOVEFOKur65z1au7nUizNy0KrHuOYijdW0bF5cjZH4W
         q5uQ0cn1cSajfrCa5Od2xobM1TBf5LS/4etT1ErpLb+MoIXujci0WFiwh6SKCsCZMtvn
         ljO6YqXRmz6CJ8sFH2BYm3I3gEe2eKG3IbJRnwHTg9kSFum81GwUVp5ir4V1MP/9uVfg
         H6JRSkselxhzOA+ZmHGZzx++bRw0hMgDopkTMMeE1hAbhh/Y70Q5sAORAgVcxQ5orYiY
         kJgJE2tlVGNFyxByWF5sU8cdidcZfUbRRQkZhbH1Gd8DuqLJuiEVHnVW1EaI0fnwvc3S
         odfQ==
X-Gm-Message-State: AOAM530IaG1K5TTdDC4HedsY4j9+7Gtl8A0IB0PCumd482F31KSGm/5P
        edSMBSBgZ+w0FLNyQhshBsYVTJhwtg==
X-Google-Smtp-Source: ABdhPJwlbfmHUlKyAdFI2WF99x6bo3uSrZtFXktEDmiy470ONdrguyOumSHkDJY8EfGv1U5BVF/SGw==
X-Received: by 2002:a05:6602:26d2:: with SMTP id g18mr8485399ioo.194.1626463415034;
        Fri, 16 Jul 2021 12:23:35 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id u13sm5433182iot.29.2021.07.16.12.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 12:23:34 -0700 (PDT)
Received: (nullmailer pid 3836563 invoked by uid 1000);
        Fri, 16 Jul 2021 19:23:31 -0000
Date:   Fri, 16 Jul 2021 13:23:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] media: dt-bindings: mt9p031: Convert bindings to
 yaml
Message-ID: <20210716192331.GA3831920@robh.at.kernel.org>
References: <20210714133849.1041619-1-s.riedmueller@phytec.de>
 <20210714133849.1041619-6-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714133849.1041619-6-s.riedmueller@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 14, 2021 at 03:38:48PM +0200, Stefan Riedmueller wrote:
> Convert mt9p031 sensor bindings to yaml schema. Also update the
> MAINTAINERS entry.
> 
> Although input-clock-frequency and pixel-clock-frequency have not been
> definded as endpoint propierties in the textual bindings, the sensor
> does parse them from the endpoint. Thus move these properties to the
> endpoint in the new yaml bindings.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  .../bindings/media/i2c/aptina,mt9p031.yaml    | 92 +++++++++++++++++++
>  .../devicetree/bindings/media/i2c/mt9p031.txt | 40 --------
>  MAINTAINERS                                   |  1 +
>  3 files changed, 93 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> new file mode 100644
> index 000000000000..1531ecd1ed95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/aptina,mt9p031.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aptina 1/2.5-Inch 5Mp CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  The Aptina MT9P031 is a 1/2.5-inch CMOS active pixel digital image sensor
> +  with an active array size of 2592H x 1944V. It is programmable through a
> +  simple two-wire serial interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aptina,mt9p031
> +      - aptina,mt9p031m
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Chip reset GPIO
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          input-clock-frequency:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 6000000
> +            maximum: 96000000
> +            description: Input clock frequency
> +
> +          pixel-clock-frequency:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            maximum: 96000000
> +            description: Target pixel clock frequency
> +
> +          bus-type:
> +            const: 5
> +
> +          bus-width:
> +            const: 12

If there's only 1 possible setting for both of these, why do they need 
to be in DT?

Rob
