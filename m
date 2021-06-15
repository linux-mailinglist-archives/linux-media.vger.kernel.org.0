Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E807E3A8CC2
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 01:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhFOXnA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 19:43:00 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:33789 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhFOXm6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 19:42:58 -0400
Received: by mail-il1-f182.google.com with SMTP id z1so747774ils.0;
        Tue, 15 Jun 2021 16:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KktScGLfwYqDmTgp0+euNKnnKCv+ORCggyGnw//dZVE=;
        b=t1lXUaij+heClw2LhpAfHBcHu/Fg2p2QzCbxc8x1FlpPg9aJLINxRS1fDvfo8VwZ0/
         Ps1ojFpfUjxlP4zyi7ZlQ/o7TKBWL1NjSeibqFHqOzY0B8LsbAmlhklVYscaLJNh1mEX
         NLHfqvtMQuvLx6rnlvyu6kGDXD/LkvbtGk6pbUHNmbKp55kbpK3fxfrvn3+ygzVUZ1AR
         vri9i1JWvyMqFuWKfLlH5/0LUCGLIYrtKGopGLmPPPy+RnIvBuZJs4OvcxRBWom/hCvo
         j43ARJY3D/HtfXTgKZ97IsFtOG+mlR2ASQPLzTfUo/VeYbe954gjeFvQvtNQBNJmZ0IZ
         FWQg==
X-Gm-Message-State: AOAM533T9kr+8ncafQ4MeOQ9E3oY8T4pm0zBngtzEIetxrZ3qEaZZ7qV
        eN3QEwZYYz4GrTw8AxOQBw==
X-Google-Smtp-Source: ABdhPJyJ2oSvUbWTQmXG9OJo4c9tMR9ZFoLJXABAWZda+rPw4vz7JbTFJdeejg8YGgC2q/DfhQ6/XA==
X-Received: by 2002:a92:7510:: with SMTP id q16mr1347061ilc.291.1623800451982;
        Tue, 15 Jun 2021 16:40:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j18sm289799ioo.3.2021.06.15.16.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 16:40:51 -0700 (PDT)
Received: (nullmailer pid 1680952 invoked by uid 1000);
        Tue, 15 Jun 2021 23:40:48 -0000
Date:   Tue, 15 Jun 2021 17:40:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nelson Costa <Nelson.Costa@synopsys.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH 2/9] dt-bindings: media: Document Synopsys DesignWare
 HDMI RX
Message-ID: <20210615234048.GA1668783@robh.at.kernel.org>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
 <a5a52c738db7a4b3125225ac27e5aaff19604aec.1622631488.git.nelson.costa@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5a52c738db7a4b3125225ac27e5aaff19604aec.1622631488.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 02, 2021 at 01:24:20PM +0200, Nelson Costa wrote:
> Document the device tree bindings for the Synopsys DesignWare HDMI RX
> Controller.
> 
> Signed-off-by: Jose Abreu <jose.abreu@synopsys.com>
> Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
> ---
>  .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> new file mode 100644
> index 0000000..4f2169e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare HDMI RX Controller Device Tree Bindings
> +
> +maintainers:
> +  - Jose Abreu <jose.abreu@synopsys.com>
> +  - Nelson Costa <nelson.costa@synopsys.com>
> +
> +description: |
> +  The Synopsys DesignWare HDMI RX Controller and PHYs e405/e406 is an HDMI 2.0
> +  Receiver solution that is able to decode video and audio.
> +
> +properties:
> +  compatible:
> +    const: snps,dw-hdmi-rx
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: |
> +      phandle to the configuration clock
> +
> +  clock-names:
> +    const: cfg
> +
> +  phys:
> +    maxItems: 1
> +    description: |
> +      phandle for the HDMI RX PHY
> +
> +  phy-names:
> +    const: hdmi-phy

You don't need *-names when there is only one generally.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: |
> +      Input port node, multiple endpoints describing the HDMI RX data connected
> +      to the HDMI PHY receiver.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdmi_rx: hdmi-rx@0 {
> +        compatible = "snps,dw-hdmi-rx";
> +        reg = <0x0 0x10000>;
> +        interrupts = <1 2>;
> +
> +        clocks = <&dw_hdmi_refclk>;
> +        clock-names = "cfg";
> +
> +        phys = <&hdmi_e406_phy>;
> +        phy-names = "hdmi-phy";
> +
> +        port {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            hdmi_rx_0: endpoint@0 {
> +                reg = <0>;
> +                remote-endpoint = <&hdmi_e406_phy_0>;
> +            };

I don't get why you have a connection to the phy with 'phys' and OF 
graph? The connection should be to the remote device generating the HDMI 
data with a PHY being somewhat transparent to that data flow.

> +
> +            hdmi_rx_1: endpoint@1 {
> +                reg = <1>;
> +                remote-endpoint = <&hdmi_e406_phy_1>;
> +            };
> +
> +            hdmi_rx_2: endpoint@2 {
> +                reg = <2>;
> +                remote-endpoint = <&hdmi_e406_phy_2>;
> +            };
> +
> +            hdmi_rx_3: endpoint@3 {
> +                reg = <3>;
> +                remote-endpoint = <&hdmi_e406_phy_3>;
> +            };
> +        };
> +    };
> -- 
> 2.7.4
