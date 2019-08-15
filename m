Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E151B8F2F8
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 20:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731202AbfHOSOU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 14:14:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51612 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfHOSOU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 14:14:20 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71DDB2AF;
        Thu, 15 Aug 2019 20:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565892857;
        bh=PywuWClfJh3Sq1lkgyHqHLet8t64SevKcOFacHlNbNo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XSaAqhgyTXoRy4Ne5hd+JH48p6twbV+RWWuhcrrGbHEAPxB+p+arrDgJtFnpRyOVj
         gQclbHy+09zseRLnoNSglCm9r3Yr6Fme88FQ5wyPhMC/97JikIbdngJR7t1rVgFhTG
         65N0VxzrsTWu9FqSH/6LxlqNaDE/M/edOovgxdqs=
Date:   Thu, 15 Aug 2019 21:14:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com,
        zyc@rock-chips.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, hans.verkuil@cisco.com,
        sakari.ailus@linux.intel.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 11/14] dt-bindings: Document the Rockchip MIPI RX
 D-PHY bindings
Message-ID: <20190815181413.GZ5011@pendragon.ideasonboard.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-12-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190730184256.30338-12-helen.koike@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thank you for the patch.

On Tue, Jul 30, 2019 at 03:42:53PM -0300, Helen Koike wrote:
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
> Changes in v8: None
> Changes in v7:
> - updated doc with new design and tested example
> 
>  .../bindings/media/rockchip-mipi-dphy.txt     | 38 +++++++++++++++++++

Shouldn't this go to bindings/phy/ ?

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

How about already converting the bindings to yaml ? There's one example
in bindings/phy/ that looks quite similar to what you need here. Make
sure to have a look at Documentation/devicetree/writing-schema.md, and
in particular to run make dt_binding_check.

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

-- 
Regards,

Laurent Pinchart
