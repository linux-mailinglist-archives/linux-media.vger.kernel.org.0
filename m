Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 914FF5FC2D
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 19:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfGDREi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 13:04:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53598 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfGDREh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 13:04:37 -0400
Received: from [IPv6:2804:431:c7f5:f63c:d711:794d:1c68:5ed3] (unknown [IPv6:2804:431:c7f5:f63c:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DC2ED28B0E2;
        Thu,  4 Jul 2019 18:04:28 +0100 (BST)
Subject: Re: [PATCH v7 10/14] dt-bindings: Document the Rockchip ISP1 bindings
To:     Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org
Cc:     devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190703190910.32633-1-helen.koike@collabora.com>
 <20190703190910.32633-11-helen.koike@collabora.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <b475739c-a460-612e-bc4c-57dc7ce18a67@collabora.com>
Date:   Thu, 4 Jul 2019 14:03:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703190910.32633-11-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Helen,

On 7/3/19 4:09 PM, Helen Koike wrote:
> From: Jacob Chen <jacob2.chen@rock-chips.com>
>
> Add DT bindings documentation for Rockchip ISP1
>
> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> [update for upstream]
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> ---
>
> Changes in v7:
> - update document with new design and tested example
>
>  .../bindings/media/rockchip-isp1.txt          | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-isp1.txt
>
> diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.txt b/Documentation/devicetree/bindings/media/rockchip-isp1.txt
> new file mode 100644
> index 000000000000..a97fef0f189f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-isp1.txt
> @@ -0,0 +1,71 @@
> +Rockchip SoC Image Signal Processing unit v1
> +----------------------------------------------
> +
> +Rockchip ISP1 is the Camera interface for the Rockchip series of SoCs
> +which contains image processing, scaling, and compression funcitons.
> +
> +Required properties:
> +- compatible: value should be one of the following
> +	"rockchip,rk3288-cif-isp";
> +	"rockchip,rk3399-cif-isp";
> +- reg : offset and length of the register set for the device.
> +- interrupts: should contain ISP interrupt.
> +- clocks: phandle to the required clocks.
> +- clock-names: required clock name.
> +- iommus: required a iommu node.
> +- phys: the phandle for the PHY port
> +- phy-names: must contain "dphy"
> +
> +port node
> +-------------------
I would remove those extra `---`, and keep as:
...node
...----

The same applies for the title.

Thanks,
    André

> +
> +The device node should contain one 'ports' child node, with children 'port'
> +with child 'endpoint'.
> +nodes, according to the bindings defined in Documentation/devicetree/bindings/
> +media/video-interfaces.txt.
> +
> +- endpoint(mipi):
> +	- remote-endpoint: Connecting to Rockchip MIPI-DPHY,
> +		which is defined in rockchip-mipi-dphy.txt.
> +
> +The port node must contain at least one endpoint, either parallel or mipi.
> +It could have multiple endpoints, but please note the hardware don't support
> +two sensors work at a time, they are supposed to work asynchronously.
> +
> +Device node example
> +-------------------
> +
> +	isp0: isp0@ff910000 {
> +		compatible = "rockchip,rk3399-cif-isp";
> +		reg = <0x0 0xff910000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru SCLK_ISP0>,
> +			 <&cru ACLK_ISP0>, <&cru ACLK_ISP0_WRAPPER>,
> +			 <&cru HCLK_ISP0>, <&cru HCLK_ISP0_WRAPPER>;
> +		clock-names = "clk_isp",
> +			      "aclk_isp", "aclk_isp_wrap",
> +			      "hclk_isp", "hclk_isp_wrap";
> +		power-domains = <&power RK3399_PD_ISP0>;
> +		iommus = <&isp0_mmu>;
> +		phys = <&dphy>;
> +		phy-names = "dphy";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				mipi_in_wcam: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&wcam_out>;
> +					data-lanes = <1 2>;
> +				};
> +
> +				mipi_in_ucam: endpoint@1 {
> +					reg = <1>;
> +					remote-endpoint = <&ucam_out>;
> +					data-lanes = <1>;
> +				};
> +			};
> +		};
> +	};
