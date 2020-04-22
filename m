Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9441B4C1C
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 19:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgDVRsJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 13:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726006AbgDVRsJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 13:48:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B0EC03C1A9;
        Wed, 22 Apr 2020 10:48:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57C5A528;
        Wed, 22 Apr 2020 19:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587577685;
        bh=PxeMuCTvxHgnZOe/lMzPRZh/Nr57sZzlUDVOFyhkSBc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y09URktS1v2REPmzS7wuue4PzmpHSEvmi/ZvXGlCZeJE5NnPSDrfJL1YPOg+KcWS4
         Cc8MJNX26MLloD58tpZFwZwwpYTzx0bAJC5dIbdFRjXYZyj3WB/yvI+tH775YQbehg
         7YdC7JM1mtNMm766y2DA1h9mWF0VaKEuXsGc8MvY=
Date:   Wed, 22 Apr 2020 20:47:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com,
        digetx@gmail.com, sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v9 5/9] dt-binding: tegra: Add VI and CSI bindings
Message-ID: <20200422174750.GH28105@pendragon.ideasonboard.com>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-6-git-send-email-skomatineni@nvidia.com>
 <20200422172047.GA18765@pendragon.ideasonboard.com>
 <1ae63b2e-17f0-ca0e-23fa-9aa63eafe01b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ae63b2e-17f0-ca0e-23fa-9aa63eafe01b@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

On Wed, Apr 22, 2020 at 10:26:20AM -0700, Sowjanya Komatineni wrote:
> On 4/22/20 10:20 AM, Laurent Pinchart wrote:
> > On Tue, Apr 21, 2020 at 11:18:55PM -0700, Sowjanya Komatineni wrote:
> >> Tegra contains VI controller which can support up to 6 MIPI CSI
> >> camera sensors.
> >>
> >> Each Tegra CSI port from CSI unit can be one-to-one mapper to
> >> VI channel and can capture from an external camera sensor or
> >> from built-in test pattern generator.
> >>
> >> This patch adds dt-bindings for Tegra VI and CSI.
> >>
> >> Acked-by: Thierry Reding <treding@nvidia.com>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> >> ---
> >>   .../display/tegra/nvidia,tegra20-host1x.txt        | 73 ++++++++++++++++++----
> >>   1 file changed, 60 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> >> index 9999255..4731921 100644
> >> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> >> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> >> @@ -40,14 +40,30 @@ of the following host1x client modules:
> >>
> >>     Required properties:
> >>     - compatible: "nvidia,tegra<chip>-vi"
> >> -  - reg: Physical base address and length of the controller's registers.
> >> +  - reg: Physical base address and length of the controller registers.
> >>     - interrupts: The interrupt outputs from the controller.
> >> -  - clocks: Must contain one entry, for the module clock.
> >> +  - clocks: clocks: Must contain one entry, for the module clock.
> >>       See ../clocks/clock-bindings.txt for details.
> >> -  - resets: Must contain an entry for each entry in reset-names.
> >> -    See ../reset/reset.txt for details.
> >> -  - reset-names: Must include the following entries:
> >> -    - vi
> >> +  - Tegra20/Tegra30/Tegra114/Tegra124:
> >> +    - resets: Must contain an entry for each entry in reset-names.
> >> +      See ../reset/reset.txt for details.
> >> +    - reset-names: Must include the following entries:
> >> +      - vi
> >> +  - Tegra210:
> >> +    - power-domains: Must include venc powergate node as vi is in VE partition.
> >> +  - Tegra210 has CSI part of VI sharing same host interface and register space.
> >> +    So, VI device node should have CSI child node.
> >> +
> >> +    - csi: mipi csi interface to vi
> >> +
> >> +      Required properties:
> >> +      - compatible: "nvidia,tegra210-csi"
> >> +      - reg: Physical base address offset to parent and length of the controller
> >> +        registers.
> >> +      - clocks: Must contain entries csi, cilab, cilcd, cile, csi_tpg clocks.
> >> +        See ../clocks/clock-bindings.txt for details.
> >> +      - power-domains: Must include sor powergate node as csicil is in
> >> +        SOR partition.
> >
> > A bit of a stupid question maybe, but why is this needed ? Can't the
> > driver that handles the vi DT node ("nvidia,tegra20-vi") handle all the
> > registers for all the sub-blocks ? Can't we move the clocks and power
> > domains from the CSI node to the VI node ?
> 
> CSI is separate device driver and VI is separate device driver.

That's fine, but that's a software design decision, it should not affect
the DT bindings. It's possible (even if I don't necessarily recommend
doing so) to create a platform device manually in the VI driver to get
it bound to the CSI driver. In any case DT should describe the system
architecture and shouldn't be influenced by hardware design.

> For T210, CSI shares register space under VI but for later Tegras its 
> separate register space.

This is useful information. How about interrupts though ? You don't
specify any interrupt line here, how are the CSI interrutps handled ?

> So CSI and VI drivers are separate with their corresponding clocks and 
> power domains in their nodes.
> 
> > Regardless of the answer to this question, I think this is missing port
> > nodes for the physical CSI-2 inputs, to connect them to sensors. I
> > haven't seen anywhere in this series how a CSI-2 sensor is linked to the
> > VI.
> 
> This patch series is only for Tegra internal TPG and tegra video driver 
> creates hard media links between CSI and VI,

Could you share the output of media-ctl --print-dot to show how this
looks like ?

> Sensor support will be in Series-2 where port nodes will be used for 
> real sensor <-> csi <-> vi endpoints
> 
> >>   - epp: encoder pre-processor
> >>
> >> @@ -309,13 +325,44 @@ Example:
> >>                        reset-names = "mpe";
> >>                };
> >>
> >> -             vi {
> >> -                     compatible = "nvidia,tegra20-vi";
> >> -                     reg = <0x54080000 0x00040000>;
> >> -                     interrupts = <0 69 0x04>;
> >> -                     clocks = <&tegra_car TEGRA20_CLK_VI>;
> >> -                     resets = <&tegra_car 100>;
> >> -                     reset-names = "vi";
> >> +             vi@54080000 {
> >> +                     compatible = "nvidia,tegra210-vi";
> >> +                     reg = <0x0 0x54080000 0x0 0x700>;
> >> +                     interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> >> +                     assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
> >> +                     assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
> >> +
> >> +                     clocks = <&tegra_car TEGRA210_CLK_VI>;
> >> +                     power-domains = <&pd_venc>;
> >> +
> >> +                     #address-cells = <1>;
> >> +                     #size-cells = <1>;
> >> +
> >> +                     ranges = <0x0 0x0 0x54080000 0x2000>;
> >> +
> >> +                     csi@838 {
> >> +                             compatible = "nvidia,tegra210-csi";
> >> +                             reg = <0x838 0x1300>;
> >> +                             assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
> >> +                                               <&tegra_car TEGRA210_CLK_CILCD>,
> >> +                                               <&tegra_car TEGRA210_CLK_CILE>,
> >> +                                               <&tegra_car TEGRA210_CLK_CSI_TPG>;
> >> +                             assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
> >> +                                                      <&tegra_car TEGRA210_CLK_PLL_P>,
> >> +                                                      <&tegra_car TEGRA210_CLK_PLL_P>;
> >> +                             assigned-clock-rates = <102000000>,
> >> +                                                    <102000000>,
> >> +                                                    <102000000>,
> >> +                                                    <972000000>;
> >> +
> >> +                             clocks = <&tegra_car TEGRA210_CLK_CSI>,
> >> +                                      <&tegra_car TEGRA210_CLK_CILAB>,
> >> +                                      <&tegra_car TEGRA210_CLK_CILCD>,
> >> +                                      <&tegra_car TEGRA210_CLK_CILE>,
> >> +                                      <&tegra_car TEGRA210_CLK_CSI_TPG>;
> >> +                             clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
> >> +                             power-domains = <&pd_sor>;
> >> +                     };
> >>                };
> >>
> >>                epp {

-- 
Regards,

Laurent Pinchart
