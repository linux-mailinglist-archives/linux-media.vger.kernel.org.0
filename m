Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC2D919DB9F
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 18:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404135AbgDCQ1d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 12:27:33 -0400
Received: from gloria.sntech.de ([185.11.138.130]:57094 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404022AbgDCQ1d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Apr 2020 12:27:33 -0400
Received: from p5b127fb0.dip0.t-ipconnect.de ([91.18.127.176] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1jKPAF-00065N-VY; Fri, 03 Apr 2020 18:27:27 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add the camera interface description of the PX30
Date:   Fri, 03 Apr 2020 18:27:27 +0200
Message-ID: <4068915.k80quj1ed4@phil>
In-Reply-To: <20200403142122.297283-4-maxime.chevallier@bootlin.com>
References: <20200403142122.297283-1-maxime.chevallier@bootlin.com> <20200403142122.297283-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, 3. April 2020, 16:21:22 CEST schrieb Maxime Chevallier:
> The PX30 has a camera interface, supporting CSI2, BT656 and Parallel
> modes. Add a DT description for this interface.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index 3e1f51a66daf..38ed35bc9b7a 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -1058,6 +1058,18 @@ dsi_in_vopl: endpoint@1 {
>  		};
>  	};
>  
> +	cif: cif@ff490000 {

nit: please sort by register address, so @ff490000 is definitly
somewhere after that ff460000 of the vopb ;-)

> +		compatible = "rockchip,px30-cif";
> +		reg = <0x0 0xff490000 0x0 0x200>;
> +		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>, <&cru SCLK_CIF_OUT>;
> +		clock-names = "aclk_cif", "hclk_cif", "pclk_cif", "cif_out";
> +		resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
> +		reset-names = "rst_cif_a", "rst_cif_h", "rst_cif_pclkin";
> +		power-domains = <&power PX30_PD_VI>;

nit: while doing the above, ideally just move the power-domains above resets
everthing else is sorted nicely.


Thanks
Heiko

> +		status = "disabled";
> +	};
> +
>  	vopb: vop@ff460000 {
>  		compatible = "rockchip,px30-vop-big";
>  		reg = <0x0 0xff460000 0x0 0xefc>;
> 




