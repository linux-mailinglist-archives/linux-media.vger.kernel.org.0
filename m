Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A59D131CA7
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 01:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbgAGALI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 19:11:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41708 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbgAGALI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 19:11:08 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A574D52F;
        Tue,  7 Jan 2020 01:11:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578355865;
        bh=H4NAzk1HO6HlKI8d4ZzyIaQ9+l8IHFtc9UAyj/LlgkY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XqxTt4pqsUfpEnBoAv+yrrlvWKDbLpQYOxT3rP2iesxUWozMJDaVHDaMQ1CQnnm+j
         aDprkAtvWtByJj0HS77depLhFf5bwD3wciRzQTYpc7+rW9exaHrQa99BnauQf2oVjM
         OfSOtXaq3ZpWcNAqk7RLWW8pWbtpj0naAlvJXqKs=
Date:   Tue, 7 Jan 2020 02:10:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org,
        andrey.konovalov@linaro.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, robh+dt@kernel.org, hans.verkuil@cisco.com,
        sakari.ailus@linux.intel.com, joacim.zetterling@gmail.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 09/11] media: staging: dt-bindings: add Rockchip MIPI
 RX D-PHY yaml bindings
Message-ID: <20200107001055.GE22189@pendragon.ideasonboard.com>
References: <20191227200116.2612137-1-helen.koike@collabora.com>
 <20191227200116.2612137-10-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191227200116.2612137-10-helen.koike@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thank you for the patch.

On Fri, Dec 27, 2019 at 05:01:14PM -0300, Helen Koike wrote:
> Add yaml DT bindings for Rockchip MIPI D-PHY RX
> 
> This was tested and verified with:
> mv drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml  Documentation/devicetree/bindings/phy/
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> Changes in v12:
> - The commit replaces the following commit in previous series named
> media: staging: dt-bindings: Document the Rockchip MIPI RX D-PHY bindings
> This new patch adds yaml binding and was verified with
> make dtbs_check and make dt_binding_check
> 
> Changes in v11: None
> Changes in v10:
> - unsquash
> 
> Changes in v9:
> - fix title division style
> - squash
> - move to staging
> 
> Changes in v8: None
> Changes in v7:
> - updated doc with new design and tested example
> 
>  .../bindings/phy/rockchip-mipi-dphy.yaml      | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> 
> diff --git a/drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml b/drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> new file mode 100644
> index 000000000000..af97f1b3e005
> --- /dev/null
> +++ b/drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/rockchip-mipi-dphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip SoC MIPI RX0 D-PHY Device Tree Bindings

Should this be s/RX0/RX/ ? Or do you expect different bindings for RX1 ?
Looking at the PHY driver, it seems to handle all PHYs with a single
struct device. Should we thus use #phy-cells = <1> to select the PHY ?

> +
> +maintainers:
> +  - Helen Koike <helen.koike@collabora.com>
> +  - Ezequiel Garcia <ezequiel@collabora.com>
> +
> +description: |
> +  The Rockchip SoC has a MIPI D-PHY bus with an RX0 entry which connects to
> +  the ISP1 (Image Signal Processing unit v1.0) for CSI cameras.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3399-mipi-dphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Mipi d-phy ref clock
> +      - description: Mipi d-phy rx0 cfg clock

s/Mipi d-phy/MIPI D-PHY/

> +      - description: Video in/out general register file clock
> +
> +  clock-names:
> +    items:
> +      - const: dphy-ref
> +      - const: dphy-cfg
> +      - const: grf
> +
> +  '#phy-cells':
> +    const: 0
> +
> +  power-domains:
> +    description: Video in/out power domain.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - '#phy-cells'
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    /*
> +     * MIPI RX D-PHY use registers in "general register files", it
> +     * should be a child of the GRF.
> +     *
> +     * grf: syscon@ff770000 {
> +     *  compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
> +     *  ...

missing

	* };

> +     */
> +
> +    #include <dt-bindings/clock/rk3399-cru.h>
> +    #include <dt-bindings/power/rk3399-power.h>
> +
> +    dphy: mipi-dphy {
> +        compatible = "rockchip,rk3399-mipi-dphy";
> +        clocks = <&cru SCLK_MIPIDPHY_REF>,
> +                 <&cru SCLK_DPHY_RX0_CFG>,
> +                 <&cru PCLK_VIO_GRF>;
> +        clock-names = "dphy-ref", "dphy-cfg", "grf";
> +        power-domains = <&power RK3399_PD_VIO>;
> +        #phy-cells = <0>;
> +    };

-- 
Regards,

Laurent Pinchart
