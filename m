Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8003CF6A8
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 11:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbhGTIbL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 04:31:11 -0400
Received: from foss.arm.com ([217.140.110.172]:54178 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233350AbhGTIas (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 04:30:48 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C889C6D;
        Tue, 20 Jul 2021 02:11:26 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16ACD3F73D;
        Tue, 20 Jul 2021 02:11:23 -0700 (PDT)
Subject: Re: [PATCH v3 10/10] arm64: dts: rockchip: Add VPU support for the
 PX30
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Kever Yang <kever.yang@rock-chips.com>, kernel@collabora.com
References: <20210719205242.18807-1-ezequiel@collabora.com>
 <20210719205242.18807-11-ezequiel@collabora.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <a3078b49-696a-1aa6-8f96-70573bd6441d@arm.com>
Date:   Tue, 20 Jul 2021 10:11:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210719205242.18807-11-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-07-19 21:52, Ezequiel Garcia wrote:
> From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> 
> The PX30 has a VPU (both decoder and encoder) with a dedicated IOMMU.
> Describe these two entities in device-tree.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>   arch/arm64/boot/dts/rockchip/px30.dtsi | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index 248ebb61aa79..05ce8ce5e4be 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -1024,6 +1024,29 @@ gpu: gpu@ff400000 {
>   		status = "disabled";
>   	};
>   
> +	vpu: video-codec@ff442000 {
> +		compatible = "rockchip,px30-vpu";
> +		reg = <0x0 0xff442000 0x0 0x800>;
> +		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "vepu", "vdpu";
> +		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> +		clock-names = "aclk", "hclk";
> +		iommus = <&vpu_mmu>;
> +		power-domains = <&power PX30_PD_VPU>;
> +	};
> +
> +	vpu_mmu: iommu@ff442800 {
> +		compatible = "rockchip,iommu";
> +		reg = <0x0 0xff442800 0x0 0x100>;
> +		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "vpu_mmu";

Nit: "interrupt-names" is not part of the IOMMU binding. Same for the 
RK3568 patch too ;)

Robin.

> +		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> +		clock-names = "aclk", "iface";
> +		#iommu-cells = <0>;
> +		power-domains = <&power PX30_PD_VPU>;
> +	};
> +
>   	dsi: dsi@ff450000 {
>   		compatible = "rockchip,px30-mipi-dsi";
>   		reg = <0x0 0xff450000 0x0 0x10000>;
> 
