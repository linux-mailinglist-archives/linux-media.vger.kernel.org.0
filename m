Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D244033E183
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 23:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhCPWj1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 18:39:27 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:34006 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbhCPWiy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 18:38:54 -0400
Received: by mail-il1-f175.google.com with SMTP id z9so14259452iln.1;
        Tue, 16 Mar 2021 15:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SD/SZ3UG7VKbgaVrrT8DgCnN1QyD1tEWDh0bYJlJYkg=;
        b=UHiyE9aXlDo4t1olVzRuRH7XXrfe8hSLeoVmfvtasqH8vsIaWLu/ifKL9Yu4fQSGBC
         CE5iDrDDUw5jCrSt3d7vczoTS8R9iopwlixwl5cdb+AJw4FG8b0fUncNl+R+vg4wucWF
         OTcw6BF6VKzpo1Ipw2jhCqjq2kQZvue9WIwA9LDO/unU58J8YR6junlV37LOyct3iPds
         zMzfxso1/8QAsfqyAmLCuL2lgCdQn7ekYY47lmMY2RoQ4U6aVcFNUP82XYWP0u+gJtZB
         harFzeArDQbZ2Bf/ZAXP/v2YztVLjXMqRJMwbVrYvylwciPDrI4roU4wSIgdCS3k6hx9
         m8Aw==
X-Gm-Message-State: AOAM531cTAQOXdmHd08gCL6fQ3LJz33b1oYzmwuc8HfWXkdOXyoGWZlL
        MAki6sM+P1yEUnoz9cLJkw==
X-Google-Smtp-Source: ABdhPJz/1RsNGnIMlJ8fyTp0/b8ks4EGuk0hdFVREY0vKfhYgj5oz8QkS10nM9A/ROJUejiF3rXkWw==
X-Received: by 2002:a92:d6c8:: with SMTP id z8mr5459251ilp.162.1615934333469;
        Tue, 16 Mar 2021 15:38:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 74sm9215084iob.43.2021.03.16.15.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 15:38:52 -0700 (PDT)
Received: (nullmailer pid 3815302 invoked by uid 1000);
        Tue, 16 Mar 2021 22:38:50 -0000
Date:   Tue, 16 Mar 2021 16:38:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mchehab@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, kishon@ti.com, vkoul@kernel.org,
        robert.foss@linaro.org, lee.jones@linaro.org
Subject: Re: [PATCH v5 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and
 Status Registers module binding
Message-ID: <20210316223850.GA3806545@robh.at.kernel.org>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
 <1615370138-5673-8-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615370138-5673-8-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 10, 2021 at 05:55:31PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4->v5:
> * Newly introduced in v5. (Rob)
> 
>  .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 202 +++++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> new file mode 100644
> index 00000000..0e724d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/fsl,imx8qxp-csr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp Control and Status Registers Module Bindings
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  As a system controller, the Freescale i.MX8qm/qxp Control and Status
> +  Registers(CSR) module represents a set of miscellaneous registers of a
> +  specific subsystem.  It may provide control and/or status report interfaces
> +  to a mix of standalone hardware devices within that subsystem.  One typical
> +  use-case is for some other nodes to acquire a reference to the syscon node
> +  by phandle, and the other typical use-case is that the operating system
> +  should consider all subnodes of the CSR module as separate child devices.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - fsl,imx8qxp-mipi-lvds-csr
> +          - fsl,imx8qm-lvds-csr

You shouldn't need this, we filter out 'syscon' and 'simple-mfd'.

> +  required:
> +    - compatible
> +
> +properties:
> +  $nodename:
> +    pattern: "^syscon@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx8qxp-mipi-lvds-csr
> +          - fsl,imx8qm-lvds-csr
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ipg
> +
> +patternProperties:
> +  "^(ldb|phy|pxl2dpi)$":
> +    type: object
> +    description: The possible child devices of the CSR module.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qxp-mipi-lvds-csr
> +    then:
> +      required:
> +        - pxl2dpi
> +        - ldb
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qm-lvds-csr
> +    then:
> +      required:
> +        - phy
> +        - ldb
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    mipi_lvds_0_csr: syscon@56221000 {
> +        compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
> +        reg = <0x56221000 0x1000>;
> +        clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
> +        clock-names = "ipg";
> +
> +        mipi_lvds_0_pxl2dpi: pxl2dpi {
> +            compatible = "fsl,imx8qxp-pxl2dpi";
> +            fsl,sc-resource = <IMX_SC_R_MIPI_0>;
> +            power-domains = <&pd IMX_SC_R_MIPI_0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <0>;
> +
> +                    mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
> +                        reg = <0>;
> +                        remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
> +                    };
> +
> +                    mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
> +                        reg = <1>;
> +                        remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <1>;
> +
> +                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
> +                        reg = <0>;
> +                        remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
> +                    };
> +
> +                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
> +                        reg = <1>;
> +                        remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
> +                    };
> +                };
> +            };
> +        };
> +
> +        mipi_lvds_0_ldb: ldb {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "fsl,imx8qxp-ldb";
> +            clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> +                     <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> +            clock-names = "pixel", "bypass";
> +            power-domains = <&pd IMX_SC_R_LVDS_0>;
> +
> +            channel@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +                phys = <&mipi_lvds_0_phy>;
> +                phy-names = "lvds_phy";
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
> +                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    /* ... */
> +                };
> +            };
> +
> +            channel@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +                phys = <&mipi_lvds_0_phy>;
> +                phy-names = "lvds_phy";
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
> +                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    /* ... */
> +                };
> +            };
> +        };
> +    };
> +
> +    mipi_lvds_0_phy: phy@56228300 {
> +        compatible = "fsl,imx8qxp-mipi-dphy";
> +        reg = <0x56228300 0x100>;
> +        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
> +        clock-names = "phy_ref";
> +        #phy-cells = <0>;
> +        fsl,syscon = <&mipi_lvds_0_csr>;
> +        power-domains = <&pd IMX_SC_R_MIPI_0>;
> +    };
> -- 
> 2.7.4
> 
