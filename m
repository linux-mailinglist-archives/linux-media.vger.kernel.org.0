Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322E436104C
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 18:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbhDOQkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 12:40:37 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:42499 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233916AbhDOQkg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 12:40:36 -0400
Received: by mail-oi1-f176.google.com with SMTP id n140so24868142oig.9;
        Thu, 15 Apr 2021 09:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sNbinBAo/5NA8QLcwtnCqydROuE/q5gCZdDvbMIWpto=;
        b=VhiklPryflj2cXtXa73Ur5KQ70Fg9mQ0QhX+xNCr9R+wVgdabIi9JTzoI4Z7e7udlm
         kxbdWAPNxpghig5FgWc/X59JsWd/hAP5Y0EiFIhpS51Xq7eLj51ggYgvkriSzerQtSTf
         itFXLPhtE0Pa9JFwT/Bk3v1WEm9XoHeM2z6BqPjRsqT6BjZRbrFrTYWqHJNsA3CFvsG9
         KX9B9kemhYLNPFvPpb2gJ5UAwZX1XqGc55cE1y9SPI5aVwDVswj9WNYbFg5xib1pKSei
         aV84OSvwAfoww3+C+QMUYCWO+aR9vsGP2KTlxncwev/OgsPiaa5D9OB9+VLgD/Fmd39v
         qxtw==
X-Gm-Message-State: AOAM531KjUg2U2o2wkpwIB2raawoN/6KjBc+Eh/1NZXqpzmtqwzu4yhT
        lUcfyi78cB7VDObeU7+QMDFoTyqKyA==
X-Google-Smtp-Source: ABdhPJw1wNTGv09rmaL86iTOfnFYVM9FwmSM3O9bB1v/h1nqYWkWzRcd5kCg12eFtbNWJT1zalbV3Q==
X-Received: by 2002:aca:ad87:: with SMTP id w129mr3180608oie.35.1618504813073;
        Thu, 15 Apr 2021 09:40:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e44sm747794ote.21.2021.04.15.09.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 09:40:12 -0700 (PDT)
Received: (nullmailer pid 1534646 invoked by uid 1000);
        Thu, 15 Apr 2021 16:40:11 -0000
Date:   Thu, 15 Apr 2021 11:40:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        jacopo@jmondi.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 30/33] dt-bindings: media: add microchip,xisc device
 bindings
Message-ID: <20210415164011.GA1533489@robh.at.kernel.org>
References: <20210413105731.610028-31-eugen.hristev@microchip.com>
 <20210415085846.824796-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415085846.824796-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 15, 2021 at 11:58:46AM +0300, Eugen Hristev wrote:
> Add bindings for the Microchip eXtended Image Sensor Controller.
> Based on the atmel,isc.yaml binding.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  .../bindings/media/microchip,xisc.yaml        | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,xisc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/microchip,xisc.yaml b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
> new file mode 100644
> index 000000000000..c829fa3d2e0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license still missing.

> +# Copyright (C) 2021 Microchip Technology, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/microchip,xisc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip eXtended Image Sensor Controller (XISC)
> +
> +maintainers:
> +  - Eugen Hristev <eugen.hristev@microchip.com>
> +
> +description: |
> +  The eXtended Image Sensor Controller (XISC) device provides the video input capabilities for the
> +  Microchip AT91 SAM family of devices.
> +
> +  The XISC has a single internal parallel input that supports RAW Bayer, RGB or YUV video.
> +  The source can be either a demuxer from a CSI2 type of bus, or a simple direct bridge to a
> +  parallel sensor.
> +
> +  The XISC provides one clock output that is used to clock the demuxer/bridge.
> +
> +properties:
> +  compatible:
> +    const: microchip,sama7g5-isc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: hclock
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  clock-output-names:
> +    const: isc-mck
> +
> +  microchip,mipi-mode:
> +    type: boolean
> +    description:
> +      As the XISC is usually connected to a demux/bridge, the XISC receives
> +      the same type of input, however, it should be aware of the type of
> +      signals received. The mipi-mode enables different internal handling
> +      of the data and clock lines.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Input port node, single endpoint describing the input pad.
> +
> +    properties:
> +      endpoint:
> +        $ref: video-interfaces.yaml#
> +
> +        properties:
> +          bus-type:
> +            enum: [5, 6]
> +
> +          remote-endpoint: true
> +
> +          bus-width:
> +            enum: [8, 9, 10, 11, 12]
> +            default: 12
> +
> +          hsync-active:
> +            enum: [0, 1]
> +            default: 1
> +
> +          vsync-active:
> +            enum: [0, 1]
> +            default: 1
> +
> +          pclk-sample:
> +            enum: [0, 1]
> +            default: 1
> +
> +        required:
> +          - remote-endpoint
> +          - bus-type
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - clock-output-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    xisc: xisc@e1408000 {
> +        compatible = "microchip,sama7g5-isc";
> +        reg = <0xe1408000 0x2000>;
> +        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 56>;
> +        clock-names = "hclock";
> +        #clock-cells = <0>;
> +        clock-output-names = "isc-mck";
> +
> +        port {
> +                xisc_in: endpoint {
> +                       bus-type = <5>; /* Parallel */
> +                       remote-endpoint = <&csi2dc_out>;
> +                       hsync-active = <1>;
> +                       vsync-active = <1>;
> +                       bus-width = <12>;
> +                };
> +        };
> +    };
> +
> -- 
> 2.25.1
> 
