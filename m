Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C1335E40F
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 18:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345733AbhDMQeu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 12:34:50 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:43568 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345270AbhDMQes (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 12:34:48 -0400
Received: by mail-oi1-f174.google.com with SMTP id a21so4509136oib.10;
        Tue, 13 Apr 2021 09:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3b8Z/9OKRORHY6YjV3qZPMI7BwgvqRGP23arTb9UMNk=;
        b=C7MxYDLkauMMgLTVp+d/jsfnJFe7MhPxfel3tC8vTLyX2cdBuPzs6epd43JTty+a/e
         y1LneozNM6Y3NaLykdxYFVJL+6opOgpUWnq79p8//OHoKkvIfM1swZF3xhh72WCb6mMf
         pjVnE5MO2XLmjSDbXbk83DjjHz8qnxEspW6xXDifIez1dU5aEmBao1Ni9zvPotxqBXfH
         vFUy5ty5ENp5FkYBWmvPewfSxG7FFe2BjFf33aewOGoYYzb6uJxEoBZ6y85fhiq4nvvk
         3oia8foEU1HxKx3xLkgrjfgVYsd7tkU6NcE+6tQLYyKhYlVDBFu0ADcrM9Q5Hh4O2u53
         eb1A==
X-Gm-Message-State: AOAM531GEz1lwQGHQZWBReyy7i3BTmy/xnrQxd9/h6VPUvCr/AfxQv32
        8qmo/pPt5Q8m3+jIKIctaw==
X-Google-Smtp-Source: ABdhPJzuSEPUm2+DNDhylZ5DaM1ljMcgi8V0tBx1KY3fGWb1MC8/rcJcIssFP/trm7Kk4r8vKva5YQ==
X-Received: by 2002:aca:3b88:: with SMTP id i130mr607502oia.26.1618331668422;
        Tue, 13 Apr 2021 09:34:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p22sm3650602otf.25.2021.04.13.09.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:34:27 -0700 (PDT)
Received: (nullmailer pid 1794363 invoked by uid 1000);
        Tue, 13 Apr 2021 16:34:26 -0000
Date:   Tue, 13 Apr 2021 11:34:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        jacopo@jmondi.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 30/33] dt-bindings: media: add microchip,xisc device
 bindings
Message-ID: <20210413163426.GA1791337@robh.at.kernel.org>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
 <20210413105731.610028-31-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413105731.610028-31-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 01:57:28PM +0300, Eugen Hristev wrote:
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
> index 000000000000..e3825c4e13f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
> @@ -0,0 +1,129 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license new bindings:

GPL-2.0-only OR BSD-2-Clause

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
> +description:

You need '|' on the end if you want to preserve line breaks.

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
