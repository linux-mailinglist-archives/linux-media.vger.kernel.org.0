Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB3B1B14ED
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 20:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgDTSnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 14:43:14 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43989 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgDTSnN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 14:43:13 -0400
Received: by mail-oi1-f195.google.com with SMTP id j16so9707895oih.10;
        Mon, 20 Apr 2020 11:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wr9z4VHkUYV0azpH3NGkoTt6PH+KjpNDUACdFjs/NiA=;
        b=Gu6Z5Tso+EJRSfSLfc9bwUebHcB5EXrMQQGUWu5wXZvsT8NGBF0EkI8vzjXss+M22D
         7Yo5HT9oXgjZZpznZgz1pp7TanC3g59pwOcsCnaHxy5oYlgLS5MaffT/34zabwqM8IPk
         k+0OgWPpox6gTnAIsUOVIimIey0WNeTwBWBm0kI4DvhXCmMLjGI36Ycg0Ca9bW8k/39w
         Bz+mf1/UawsQfJMHkGMx48OSokP6XXNHu7VdTqeQ3rhHgZsN1ufJmyb4L1d/aWqP1RbM
         sROYszgRphjcFN58VwkpOdECt9d1PH3wAyB9BK0PCKZarbSSyQX0eyLjYnt3nE2/U9nA
         v7kw==
X-Gm-Message-State: AGi0PuYJcbXbGvUkQ8+RFL7WFN6z2VgYmiH1DhJiAjwtv0SYD5xH+PZw
        XjfJoRn7O8TTTwUjxj1Esw==
X-Google-Smtp-Source: APiQypJe7MGfPouzuOmJSJnUYSad5CodTv75XXmNZndtyFF4Gy8XOt8HUimd4fV/Vgik2rKP29RQcg==
X-Received: by 2002:aca:cf4b:: with SMTP id f72mr580396oig.177.1587408191338;
        Mon, 20 Apr 2020 11:43:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c24sm50813oov.48.2020.04.20.11.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:43:10 -0700 (PDT)
Received: (nullmailer pid 22017 invoked by uid 1000);
        Mon, 20 Apr 2020 18:43:09 -0000
Date:   Mon, 20 Apr 2020 13:43:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Louis Kuo <louis.kuo@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, keiichiw@chromium.org, matthias.bgg@gmail.com,
        mchehab@kernel.org, yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, Jerry-ch.Chen@mediatek.com,
        jungo.lin@mediatek.com, linux-media@vger.kernel.org,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH V6 2/3] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Message-ID: <20200420184309.GA14720@bogus>
References: <20200410071723.19720-1-louis.kuo@mediatek.com>
 <20200410071723.19720-3-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410071723.19720-3-louis.kuo@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 10, 2020 at 03:17:22PM +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.

checkpatch.pl reports some trailing WS.

> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../bindings/media/mediatek-seninf.yaml       | 219 ++++++++++++++++++
>  1 file changed, 219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.yaml b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> new file mode 100644
> index 000000000000..c9e5776a2bd0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> @@ -0,0 +1,219 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek-seninf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek seninf MIPI-CSI2 host driver

Bindings aren't drivers.

> +
> +maintainers:
> +  - Louis Kuo <louis.kuo@mediatek.com>
> +
> +description: |
> +  Seninf MIPI-CSI2 host driver is a HW camera interface controller. It support
> +  a widely adopted, simple, high-speed protocol primarily intended for
> +  point-to-point image and video transmission between cameras and host devices.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8183-seninf
> +
> +  reg:
> +    minItems: 2
> +    items:
> +      - description: The Seninf main register region
> +      - description: The RX register region
> +
> +  reg-names:
> +    minItems: 2

Drop, implied.

> +    items:
> +      - const: base
> +      - const: rx
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Seninf camsys clock
> +      - description: Seninf top mux clock
> +
> +  clock-names:
> +    items:
> +      - const: clk_cam_seninf
> +      - const: clk_top_mux_seninf

Drop 'clk_' as it is redundant.

> +
> +  # See ./video-interfaces.txt for details
> +  ports:
> +    type: object
> +    additionalProperties: false
> +
> +    properties: 
> +      port@0:
> +        type: object
> +        description: connection point for sensor at port 0
> +        additionalProperties: false
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              remote-endpoint: true
> +
> +      port@1:
> +        type: object
> +        description: connection point for sensor at port 1
> +        additionalProperties: false
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              remote-endpoint: true
> +
> +      port@4:
> +        type: object
> +        description: connection point for camsys
> +        additionalProperties: false
> +
> +        properties:
> +          reg:
> +            const: 4
> +
> +        patternProperties:
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +    required:
> +      - port@0
> +      - port@1
> +      - port@4
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt8183-power.h>
> +
> +    parent0: parent@0 {

bus {

> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        seninf: seninf@1a040000 {
> +            compatible = "mediatek,mt8183-seninf";
> +            reg = <0 0x1a040000 0 0x8000>,
> +                  <0 0x11c80000 0 0x6000>;
> +            reg-names = "base", "rx";
> +            interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
> +            power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +            clocks = <&camsys CLK_CAM_SENINF>,
> +                <&topckgen CLK_TOP_MUX_SENINF>;
> +            clock-names = "clk_cam_seninf", "clk_top_mux_seninf";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    mipi_in_bcam: endpoint {
> +                        data-lanes = <0 1 3 4>;
> +                        remote-endpoint = <&bcam_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    mipi_in_fcam: endpoint {
> +                        data-lanes = <1>;
> +                        remote-endpoint = <&fcam_out>;
> +                    };
> +                };
> +
> +                port@4 {
> +                    reg = <4>;
> +
> +                    seninf_camisp_endpoint: endpoint {
> +                        remote-endpoint = <&camisp_endpoint>;
> +                    };
> +                };
> +            };
> +        };
> +
> +        i2c2: i2c@11009000 {

This will give a warning on 5.7-rc. Add a reg property.

> +            clock-frequency = <400000>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            wcam: camera@36 {
> +                compatible = "ovti,ov5695";
> +                reg = <0x36>;
> +
> +                port {
> +                    bcam_out: endpoint {
> +                        remote-endpoint = <&mipi_in_bcam>;
> +                        data-lanes = <0 1 3 4>;
> +                    };
> +                };
> +            };
> +        };
> +
> +        i2c4: i2c@11008000 {
> +            clock-frequency = <400000>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            
> +            ucam: camera@3c {
> +                compatible = "ovti,ov2685";
> +                reg = <0x3c>;
> +
> +                port {
> +                    fcam_out: endpoint {
> +                        remote-endpoint = <&mipi_in_fcam>;
> +                        data-lanes = <1>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> \ No newline at end of file

Fix.

> -- 
> 2.18.0
