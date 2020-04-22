Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646E01B4B7E
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 19:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgDVRVF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 13:21:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47366 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgDVRVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 13:21:05 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1420B528;
        Wed, 22 Apr 2020 19:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587576062;
        bh=0NQOi0XW/BQoKaII48b5RRVncnaLFN8FKSURigd+vHo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SEtaKP1O7Ne5tsbuTi1ExUc5Q57Il9UJd7f3tyPlRJF+wwKjlYQR2LYQGinrVvjq0
         47u+UCJ8WpnG8CD1RI2sNvs5QKYjyl2rf+Y5HqnqMpLQ06CppW+RhbGtRi6Up+WpaE
         IAm9ln0eolH3FMzgS7GKZqPRJwyvUwlG2kGzm0zc=
Date:   Wed, 22 Apr 2020 20:20:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com,
        digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v9 5/9] dt-binding: tegra: Add VI and CSI bindings
Message-ID: <20200422172047.GA18765@pendragon.ideasonboard.com>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-6-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1587536339-4030-6-git-send-email-skomatineni@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

Thank you for the patch.

On Tue, Apr 21, 2020 at 11:18:55PM -0700, Sowjanya Komatineni wrote:
> Tegra contains VI controller which can support up to 6 MIPI CSI
> camera sensors.
> 
> Each Tegra CSI port from CSI unit can be one-to-one mapper to
> VI channel and can capture from an external camera sensor or
> from built-in test pattern generator.
> 
> This patch adds dt-bindings for Tegra VI and CSI.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt        | 73 ++++++++++++++++++----
>  1 file changed, 60 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> index 9999255..4731921 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> @@ -40,14 +40,30 @@ of the following host1x client modules:
>  
>    Required properties:
>    - compatible: "nvidia,tegra<chip>-vi"
> -  - reg: Physical base address and length of the controller's registers.
> +  - reg: Physical base address and length of the controller registers.
>    - interrupts: The interrupt outputs from the controller.
> -  - clocks: Must contain one entry, for the module clock.
> +  - clocks: clocks: Must contain one entry, for the module clock.
>      See ../clocks/clock-bindings.txt for details.
> -  - resets: Must contain an entry for each entry in reset-names.
> -    See ../reset/reset.txt for details.
> -  - reset-names: Must include the following entries:
> -    - vi
> +  - Tegra20/Tegra30/Tegra114/Tegra124:
> +    - resets: Must contain an entry for each entry in reset-names.
> +      See ../reset/reset.txt for details.
> +    - reset-names: Must include the following entries:
> +      - vi
> +  - Tegra210:
> +    - power-domains: Must include venc powergate node as vi is in VE partition.
> +  - Tegra210 has CSI part of VI sharing same host interface and register space.
> +    So, VI device node should have CSI child node.
> +
> +    - csi: mipi csi interface to vi
> +
> +      Required properties:
> +      - compatible: "nvidia,tegra210-csi"
> +      - reg: Physical base address offset to parent and length of the controller
> +        registers.
> +      - clocks: Must contain entries csi, cilab, cilcd, cile, csi_tpg clocks.
> +        See ../clocks/clock-bindings.txt for details.
> +      - power-domains: Must include sor powergate node as csicil is in
> +        SOR partition.

A bit of a stupid question maybe, but why is this needed ? Can't the
driver that handles the vi DT node ("nvidia,tegra20-vi") handle all the
registers for all the sub-blocks ? Can't we move the clocks and power
domains from the CSI node to the VI node ?

Regardless of the answer to this question, I think this is missing port
nodes for the physical CSI-2 inputs, to connect them to sensors. I
haven't seen anywhere in this series how a CSI-2 sensor is linked to the
VI.

>  
>  - epp: encoder pre-processor
>  
> @@ -309,13 +325,44 @@ Example:
>  			reset-names = "mpe";
>  		};
>  
> -		vi {
> -			compatible = "nvidia,tegra20-vi";
> -			reg = <0x54080000 0x00040000>;
> -			interrupts = <0 69 0x04>;
> -			clocks = <&tegra_car TEGRA20_CLK_VI>;
> -			resets = <&tegra_car 100>;
> -			reset-names = "vi";
> +		vi@54080000 {
> +			compatible = "nvidia,tegra210-vi";
> +			reg = <0x0 0x54080000 0x0 0x700>;
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
> +			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
> +
> +			clocks = <&tegra_car TEGRA210_CLK_VI>;
> +			power-domains = <&pd_venc>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			ranges = <0x0 0x0 0x54080000 0x2000>;
> +
> +			csi@838 {
> +				compatible = "nvidia,tegra210-csi";
> +				reg = <0x838 0x1300>;
> +				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
> +						  <&tegra_car TEGRA210_CLK_CILCD>,
> +						  <&tegra_car TEGRA210_CLK_CILE>,
> +						  <&tegra_car TEGRA210_CLK_CSI_TPG>;
> +				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
> +							 <&tegra_car TEGRA210_CLK_PLL_P>,
> +							 <&tegra_car TEGRA210_CLK_PLL_P>;
> +				assigned-clock-rates = <102000000>,
> +						       <102000000>,
> +						       <102000000>,
> +						       <972000000>;
> +
> +				clocks = <&tegra_car TEGRA210_CLK_CSI>,
> +					 <&tegra_car TEGRA210_CLK_CILAB>,
> +					 <&tegra_car TEGRA210_CLK_CILCD>,
> +					 <&tegra_car TEGRA210_CLK_CILE>,
> +					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
> +				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
> +				power-domains = <&pd_sor>;
> +			};
>  		};
>  
>  		epp {

-- 
Regards,

Laurent Pinchart
