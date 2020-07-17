Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091DE22448C
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 21:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbgGQTsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 15:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728480AbgGQTsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 15:48:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFC6C0619D2;
        Fri, 17 Jul 2020 12:48:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E4B771D;
        Fri, 17 Jul 2020 21:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595015315;
        bh=+ZDcfgB40euOdUkx9sbeWzWbty8BE6vcFQWFuSI2xOQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pDWY/odmElL1NbeUVG47LkPjhHqFPwzkThvuST3KVLyTe6l+a3hwzaAi5dR+ocYdm
         QAw23aYNh+ew1PIL7KQtw4KG8rE0PgqtUpN/3Y0PW8QeevWJhHMKOTjfmO9KS27HUN
         59hhN8R+miCrCOHZiQPZUFFk2WbR4FNzX58iCE18=
Date:   Fri, 17 Jul 2020 22:48:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 05/13] dt-bindings: media: ov5640: Make bus-type mandatory
Message-ID: <20200717194827.GG5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-6-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:51PM +0200, Jacopo Mondi wrote:
> The ov5640 driver supports both a parallel data interface and a
> CSI-2 serial data interface.
> 
> Depending on which interface is in use, the required endpoint
> properties are different. In order to be able to validate if a
> device node is compliant with the dt-schema bindings, start by
> making the bus-type a mandatory property, and add it to all the
> existing users of ov5640 in mainline DTS.
> 
> On top of this, endpoint properties validation will be implemented,
> conditionally to the reported bus type.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Rob may request this to be split in two, one patch for the binding, one
part for the DT sources. I think it's fine to have a temporary
validation breakage between the two patches, but if you want to avoid
that, it would also be possible to first add the property to the text
bindings, update the DT sources, and then convert to YAML. Up to you.

> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.yaml    | 6 ++++++
>  arch/arm/boot/dts/dra72-evm-common.dtsi                    | 1 +
>  arch/arm/boot/dts/dra76-evm.dts                            | 1 +
>  arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi              | 1 +
>  arch/arm/boot/dts/imx6qdl-icore.dtsi                       | 1 +
>  arch/arm/boot/dts/imx6qdl-sabrelite.dtsi                   | 1 +
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi                     | 1 +
>  arch/arm/boot/dts/stm32mp157c-ev1.dts                      | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts       | 1 +
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi                  | 1 +
>  arch/arm64/boot/dts/ti/k3-am654-base-board.dts             | 1 +
>  12 files changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> index 503f8b78615c..16e6c2dc629a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> @@ -73,6 +73,9 @@ properties:
>            remote-endpoint:
>              description: A phandle to the bus receiver's endpoint node.
> 
> +          bus-type:

You may want to add a comment referring to video-interfaces.txt. We
should really have a header file defining macros for the different bus
types. I wonder how that would work with YAML schemas though.

> +            enum: [4, 5]
> +
>            clock-lanes:
>              const: 0
> 
> @@ -109,6 +112,7 @@ properties:
> 
>          required:
>            - remote-endpoint
> +          - bus-type
> 
>      additionalProperties: false
> 

allOf:
  - if:
      properties:
        bus-type:
          const: 4
      then:
        ...
  - if:
      properties:
        bus-type:
          const: 5
      then:
        ...

It's really time to convert video-interfaces.txt... As that's a big
task, how about doing so piece by piece, moving the bus-type rules
first, and leaving the ports and endpoints (and other pieces) for later
? I think nobody wants to touch video-interfaces.txt because it's lots
of work, starting with a smaller piece may help setting the train in
motion.

I'm also fine doing this on top of this series, yak shaving is not
required.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> @@ -146,6 +150,7 @@ examples:
>              port {
>                  ov5640_to_mipi_csi2: endpoint {
>                      remote-endpoint = <&mipi_csi2_from_ov5640>;
> +                    bus-type = <4>;
>                      clock-lanes = <0>;
>                      data-lanes = <1 2>;
>                  };
> @@ -172,6 +177,7 @@ examples:
>              port {
>                  ov5640_to_parallel: endpoint {
>                      remote-endpoint = <&parallel_from_ov5640>;
> +                    bus-type = <5>;
>                      bus-width = <10>;
>                  };
>              };
> diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
> index c84b63bf0fc8..aba7eb55525d 100644
> --- a/arch/arm/boot/dts/dra72-evm-common.dtsi
> +++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
> @@ -287,6 +287,7 @@ ov5640@3c {
>  		port {
>  			csi2_cam0: endpoint {
>  				remote-endpoint = <&csi2_phy0>;
> +				bus-type = <4>;
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
> diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
> index 820a0ece20d4..ddf16e65ec7f 100644
> --- a/arch/arm/boot/dts/dra76-evm.dts
> +++ b/arch/arm/boot/dts/dra76-evm.dts
> @@ -420,6 +420,7 @@ ov5640@3c {
>  		port {
>  			csi2_cam0: endpoint {
>  				remote-endpoint = <&csi2_phy0>;
> +				bus-type = <4>;
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
> diff --git a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> index 9e027b9a5f91..dd5765778e87 100644
> --- a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> +++ b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> @@ -274,6 +274,7 @@ ov5640: camera@10 {
>  		port {
>  			ov5640_to_mipi_csi2: endpoint {
>  				remote-endpoint = <&mipi_csi2_in>;
> +				bus-type = <4>;
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
> diff --git a/arch/arm/boot/dts/imx6qdl-icore.dtsi b/arch/arm/boot/dts/imx6qdl-icore.dtsi
> index 756f3a9f1b4f..2b1f275b8cc4 100644
> --- a/arch/arm/boot/dts/imx6qdl-icore.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-icore.dtsi
> @@ -213,6 +213,7 @@ ov5640: camera@3c {
>  		port {
>  			ov5640_to_mipi_csi2: endpoint {
>  				remote-endpoint = <&mipi_csi2_in>;
> +				bus-type = <4>;
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
> diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> index 8468216dae9b..5752abb48e68 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> @@ -382,6 +382,7 @@ ov5640: camera@40 {
>  		port {
>  			ov5640_to_mipi_csi2: endpoint {
>  				remote-endpoint = <&mipi_csi2_in>;
> +				bus-type = <4>;
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> index 28b35ccb3757..990f4cc345da 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -313,6 +313,7 @@ rev B board is VGEN5 */
>  		port {
>  			ov5640_to_mipi_csi2: endpoint {
>  				remote-endpoint = <&mipi_csi2_in>;
> +				bus-type = <4>;
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};
> diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> index b19056557ef0..613ede73b65b 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> @@ -190,6 +190,7 @@ ov5640: camera@3c {
>  		port {
>  			ov5640_0: endpoint {
>  				remote-endpoint = <&dcmi_0>;
> +				bus-type = <5>;
>  				bus-width = <8>;
>  				data-shift = <2>; /* lines 9:2 are used */
>  				hsync-active = <0>;
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> index c7bd73f35ed8..6ef528bb5564 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> @@ -46,6 +46,7 @@ ov5640: camera@3c {
>  			port {
>  				ov5640_ep: endpoint {
>  					remote-endpoint = <&csi_ep>;
> +					bus-type = <5>;
>  					bus-width = <8>;
>  					hsync-active = <1>; /* Active high */
>  					vsync-active = <0>; /* Active low */
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
> index dc4ab6b434f9..8ebd6547786e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
> @@ -61,6 +61,7 @@ ov5640: camera@3c {
>  			port {
>  				ov5640_ep: endpoint {
>  					remote-endpoint = <&csi_ep>;
> +					bus-type = <5>;
>  					bus-width = <8>;
>  					hsync-active = <1>; /* Active high */
>  					vsync-active = <0>; /* Active low */
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index fe6613676e45..5c79ad5e7b5d 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -627,6 +627,7 @@ camera_rear@3b {
> 
>  		port {
>  			ov5640_ep: endpoint {
> +				bus-type = <4>;
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  				remote-endpoint = <&csiphy0_ep>;
> diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> index 2f3d3316a1cf..33f4eceffbe5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> @@ -254,6 +254,7 @@ ov5640@3c {
>  		port {
>  			csi2_cam0: endpoint {
>  				remote-endpoint = <&csi2_phy0>;
> +				bus-type = <4>;
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;
>  			};

-- 
Regards,

Laurent Pinchart
