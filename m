Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F741CC17A
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 14:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgEIMyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 08:54:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60004 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgEIMyG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 08:54:06 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id CE30B2A2CA6
Message-ID: <9fdceef69a390235225a8fd08f89f67be9c5c920.camel@collabora.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: rockchip: add rx0 mipi-phy for rk3399
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Helen Koike <helen.koike@collabora.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        mark.rutland@arm.com, karthik.poduval@gmail.com, jbx6244@gmail.com,
        kishon@ti.com
Date:   Sat, 09 May 2020 09:53:53 -0300
In-Reply-To: <20200403161538.1375908-9-helen.koike@collabora.com>
References: <20200403161538.1375908-1-helen.koike@collabora.com>
         <20200403161538.1375908-9-helen.koike@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

On Fri, 2020-04-03 at 13:15 -0300, Helen Koike wrote:
> From: Shunqian Zheng <zhengsq@rock-chips.com>
> 
> Designware MIPI D-PHY, used for ISP0 in rk3399.
> 
> Verified with:
> make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
> 
> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> Changes in v2:
> - fix alignment of clocks
> 
> V1:
> This patchset came from the original ISP series from Rockchip:
> 
>     https://patchwork.kernel.org/patch/10267409/
> 

Can you take the devicetree changes (patches 8 and 9) ?

Thanks,
Ezequiel

> The only difference is:
> - add phy-cells
> - update compatible to "rockchip,rk3399-mipi-dphy-rx0"
> - commit message
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 33cc21fcf4c10..6b3380b10e596 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1394,6 +1394,17 @@ io_domains: io-domains {
>  			status = "disabled";
>  		};
>  
> +		mipi_dphy_rx0: mipi-dphy-rx0 {
> +			compatible = "rockchip,rk3399-mipi-dphy-rx0";
> +			clocks = <&cru SCLK_MIPIDPHY_REF>,
> +				 <&cru SCLK_DPHY_RX0_CFG>,
> +				 <&cru PCLK_VIO_GRF>;
> +			clock-names = "dphy-ref", "dphy-cfg", "grf";
> +			power-domains = <&power RK3399_PD_VIO>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		u2phy0: usb2-phy@e450 {
>  			compatible = "rockchip,rk3399-usb2phy";
>  			reg = <0xe450 0x10>;
> -- 
> 2.26.0
> 
> 


