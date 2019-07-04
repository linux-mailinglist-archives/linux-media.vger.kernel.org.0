Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07F045FC31
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 19:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfGDREv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 13:04:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53626 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726966AbfGDREv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 13:04:51 -0400
Received: from [IPv6:2804:431:c7f5:f63c:d711:794d:1c68:5ed3] (unknown [IPv6:2804:431:c7f5:f63c:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B79B728B0E7;
        Thu,  4 Jul 2019 18:04:43 +0100 (BST)
Subject: Re: [PATCH v7 11/14] dt-bindings: Document the Rockchip MIPI RX D-PHY
 bindings
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
 <20190703190910.32633-12-helen.koike@collabora.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <e9102ab5-3e79-bda5-fefc-0541958c215f@collabora.com>
Date:   Thu, 4 Jul 2019 14:04:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703190910.32633-12-helen.koike@collabora.com>
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
> Add DT bindings documentation for Rockchip MIPI D-PHY RX
>
> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> [update for upstream]
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> ---
>
> Changes in v7:
> - updated doc with new design and tested example
>
>  .../bindings/media/rockchip-mipi-dphy.txt     | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
>
> diff --git a/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt b/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
> new file mode 100644
> index 000000000000..2305d44d92db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
> @@ -0,0 +1,38 @@
> +Rockchip SoC MIPI RX D-PHY
> +-------------------------------------------------------------
Here I would also remove those extra `---`.

Thanks,
    André
> +
> +Required properties:
> +- compatible: value should be one of the following
> +	"rockchip,rk3288-mipi-dphy"
> +	"rockchip,rk3399-mipi-dphy"
> +- clocks : list of clock specifiers, corresponding to entries in
> +	clock-names property;
> +- clock-names: required clock name.
> +- #phy-cells: Number of cells in a PHY specifier; Should be 0.
> +
> +MIPI RX D-PHY use registers in "general register files", it
> +should be a child of the GRF.
> +
> +Optional properties:
> +- reg: offset and length of the register set for the device.
> +- rockchip,grf: MIPI TX1RX1 D-PHY not only has its own register but also
> +		the GRF, so it is only necessary for MIPI TX1RX1 D-PHY.
> +
> +Device node example
> +-------------------
> +
> +grf: syscon@ff770000 {
> +	compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
> +
> +...
> +
> +	dphy: mipi-dphy {
> +		compatible = "rockchip,rk3399-mipi-dphy";
> +		clocks = <&cru SCLK_MIPIDPHY_REF>,
> +			<&cru SCLK_DPHY_RX0_CFG>,
> +			<&cru PCLK_VIO_GRF>;
> +		clock-names = "dphy-ref", "dphy-cfg", "grf";
> +		power-domains = <&power RK3399_PD_VIO>;
> +		#phy-cells = <0>;
> +	};
> +};
