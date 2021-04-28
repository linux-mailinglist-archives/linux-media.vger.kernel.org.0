Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E93636E159
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 00:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhD1WCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 18:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhD1WCh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 18:02:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B224DC06138B;
        Wed, 28 Apr 2021 15:01:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97B2F88C;
        Thu, 29 Apr 2021 00:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619647307;
        bh=Nz/QCYzL43LScDYgeQKxcDJY4uD2js/djdZrQQeHo84=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H84+64d1WUnNometHHZSbNj+0vMMhDpdJRCDGnCXU550CmVlpVVMmjnj3AbiZnvuc
         ZS9RH7owFxNKuJr1MUkWb13DJP3q3IZkw1WFNXzPC+RCKDnB2qrM8Hl+J3kBAZmje6
         IRipDvI/njnNnIM4VjIEq6RaDLk6Aa37IgmuJ1Nw=
Date:   Thu, 29 Apr 2021 01:01:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nelson Costa <Nelson.Costa@synopsys.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Subject: Re: [RFC 1/8] dt-bindings: media: Document Synopsys DesignWare HDMI
 RX
Message-ID: <YInbRfg14YVyeuEB@pendragon.ideasonboard.com>
References: <cover.1618937288.git.nelson.costa@synopsys.com>
 <21bdecce9dd0a8035d906af2242bc7e3495cc1b0.1618937288.git.nelson.costa@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <21bdecce9dd0a8035d906af2242bc7e3495cc1b0.1618937288.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nelson and Jose,

Thank you for the patch.

On Wed, Apr 28, 2021 at 05:25:04PM +0200, Nelson Costa wrote:
> Document the bindings for the Synopsys DesignWare HDMI RX.
> 
> Signed-off-by: Jose Abreu <jose.abreu@synopsys.com>
> Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
> ---
>  .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 149 +++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> new file mode 100644
> index 0000000..19c7dd4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare HDMI RX Controller and PHYs e405/e406 Device Tree Bindings
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
> +    description: phandle to the configuration clock
> +
> +  clock-names:
> +    const: cfg
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  phys:
> +    maxItems: 1
> +    description: phandle for the HDMI RX PHY
> +
> +  phy-names:
> +    const: hdmi-phy
> +
> +  hdmi-phy@fc:
> +    type: object
> +    description: connection point for HDMI PHY
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        oneOf:
> +          - const: snps,dw-hdmi-phy-e405
> +          - const: snps,dw-hdmi-phy-e406
> +
> +      reg:
> +        maxItems: 1
> +
> +      clocks:
> +        maxItems: 1
> +        description: phandle to the configuration clock
> +
> +      clock-names:
> +        const: cfg
> +
> +      "#phy-cells":
> +        const: 0
> +
> +      input-count:
> +        description: Number of PHY input ports
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [1, 2, 3, 4]
> +
> +    required:
> +      - compatible
> +      - reg
> +      - clocks
> +      - clock-names
> +      - "#phy-cells"
> +      - input-count
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - "#address-cells"
> +  - "#size-cells"
> +  - phys
> +  - phy-names

THe bindings should be using OF graph (ports) to model the connection
between the HDMI source (usually a connector) and the HDMI RX, and
between the HDMI RX and the downstream IP core in the pipeline.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdmi_rx0: hdmi-rx@0 {
> +        compatible = "snps,dw-hdmi-rx";
> +        reg = <0x0 0x10000>;
> +        interrupts = <1 2>;
> +
> +        clocks = <&dw_hdmi_refclk>;
> +        clock-names = "cfg";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        phys = <&hdmi_e405_phy>;
> +        phy-names = "hdmi-phy";
> +
> +        hdmi_e405_phy: hdmi-phy@fc {
> +                compatible = "snps,dw-hdmi-phy-e405";
> +                reg = <0xfc>;
> +
> +                clocks = <&dw_hdmi_refclk>;
> +                clock-names = "cfg";
> +
> +                #phy-cells = <0>;
> +                input-count = <4>;
> +        };
> +    };
> +  - |
> +    hdmi_rx1: hdmi-rx@1 {
> +        compatible = "snps,dw-hdmi-rx";
> +        reg = <0x0 0x10000>;
> +        interrupts = <1 2>;
> +
> +        clocks = <&dw_hdmi_refclk>;
> +        clock-names = "cfg";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        phys = <&hdmi_e406_phy>;
> +        phy-names = "hdmi-phy";
> +
> +        hdmi_e406_phy: hdmi-phy@fc {
> +                compatible = "snps,dw-hdmi-phy-e406";
> +                reg = <0xfc>;
> +
> +                clocks = <&dw_hdmi_refclk>;
> +                clock-names = "cfg";
> +
> +                #phy-cells = <0>;
> +                input-count = <4>;
> +        };
> +    };

-- 
Regards,

Laurent Pinchart
