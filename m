Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1A821A567
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 19:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgGIREA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 13:04:00 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:40871 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgGIREA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 13:04:00 -0400
Received: by mail-il1-f193.google.com with SMTP id e18so2630060ilr.7;
        Thu, 09 Jul 2020 10:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pkrDLfGLudjLQj1h2RUgdB9tGJKsaJLadQNww1tytnA=;
        b=Mq3mCjJexlpkjoeK4XD6umutEEsR/tcyEPi1SMuXmAesS+ikmphLvWkMYyx/F9E0tW
         EiFiPSx51Xy7FbXN1uGvUXqAoanpOjQAMxcVSZ/0Oa/G3rWfdWgx9WThmDgN1JKwNYOT
         uvpdWIsT1/wC7TYQslkczXolCu9uJuotZdESOd2YPVa+cLWpDQghqIZdbgg7sfah+JA3
         gRDJhetoL0R863oJwa+pg+bzFScBwWBoLH3tNqUrJ1ogkWN/sFZsNJrLJ1Y/OYV8NRIF
         5XTiRypkhFUwg5PkzCspg/QGeL+8AFGDQxVTnY8y0pZRi7yGI1v05eu242ljKFvuZOS8
         tgNw==
X-Gm-Message-State: AOAM5308K/Qu5rVNUHQ0apfIi3xiVmvslFjayuKEdSGcSCuDAsu2ngkD
        O5wqyMbaiDZhdXArXFLU3Q==
X-Google-Smtp-Source: ABdhPJxHycLVJ2nL1OWPoCsazDiCpUpx+FrNGz77p+igr770N6ywBBhW5XwbHwq/C1hofPtyA4Xj0g==
X-Received: by 2002:a92:5a56:: with SMTP id o83mr48108659ilb.71.1594314238900;
        Thu, 09 Jul 2020 10:03:58 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id h84sm2540067iof.31.2020.07.09.10.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:03:58 -0700 (PDT)
Received: (nullmailer pid 522839 invoked by uid 1000);
        Thu, 09 Jul 2020 17:03:56 -0000
Date:   Thu, 9 Jul 2020 11:03:56 -0600
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
Subject: Re: [RFC PATCH V7 2/3] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Message-ID: <20200709170356.GB519166@bogus>
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-3-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708104023.3225-3-louis.kuo@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 08, 2020 at 06:40:22PM +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../bindings/media/mediatek-seninf.yaml       | 223 ++++++++++++++++++
>  1 file changed, 223 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.yaml b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> new file mode 100644
> index 000000000000..917b393acc0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
> @@ -0,0 +1,223 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)

Not the right choice:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek-seninf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek Sensor Interface (CSI) Device Tree Bindings
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
> +    minItems: 1
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
> +      - const: cam_seninf
> +      - const: top_mux_seninf
> +
> +  phys:
> +    items:
> +      - description: Seninf mipi dphy
> +
> +  phy-names:
> +    items:
> +      - const: seninf
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
> +    parent {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        seninf: seninf@1a040000 {
> +            compatible = "mediatek,mt8183-seninf";
> +            reg = <0 0x1a040000 0 0x8000>;
> +            interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
> +            power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +            clocks = <&camsys CLK_CAM_SENINF>,
> +                <&topckgen CLK_TOP_MUX_SENINF>;
> +            clock-names = "cam_seninf", "top_mux_seninf";
> +            phys = <&mipi_dphy 0>;
> +            phy-names = "seninf";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    mipi_in_bcam: endpoint {
> +                        data-lanes = <0 1 3 4>;
> +                        remote-endpoint = <&bcam_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    mipi_in_fcam: endpoint {
> +                        data-lanes = <1>;
> +                        remote-endpoint = <&fcam_out>;
> +                    };
> +                };
> +
> +                port@4 {
> +                    reg = <4>;
> +                    seninf_camisp_endpoint: endpoint {
> +                        remote-endpoint = <&camisp_endpoint>;
> +                    };
> +                };
> +            };
> +        };
> +
> +        mipi_dphy: mipi_dphy@11c80000 {

phy@...

> +            compatible = "mediatek,mt8183-mipi_dphy";
> +            reg = <0 0x11C80000 0 0x6000>;
> +            #phy-cells = <1>;
> +        };
> +
> +        i2c2: i2c@11009000 {
> +            reg = <0 0x11009000 0 0x1000>;
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
> +            reg = <0 0x11008000 0 0x1000>;
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
> --
> 2.18.0
