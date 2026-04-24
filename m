Return-Path: <linux-media+bounces-59565-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PGVARL262mjTQAAu9opvQ
	(envelope-from <linux-media+bounces-59565-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:00:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF76463F2A
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10C9F30125D8
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 23:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194F0362142;
	Fri, 24 Apr 2026 23:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FFci2RcD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB622D531;
	Fri, 24 Apr 2026 23:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777071623; cv=none; b=f62ug8s+E1leUed8kBls925gjy2HY6oriIzKnBXlKPBJkTG2U0Kd9HJyoJ5Z4rqzt2gj+P9y8DpZHwZ17JWFvz+aUnie2TrYlLIdZDoU0CaROM58lUZcSTwb7ujjLMUBKejbB1YgDuRAmJ42iBB6sDavWlLpK49x+SBrIPVreQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777071623; c=relaxed/simple;
	bh=mXeWIc4bSwDCNBcdRGufU1M9fLVnzL1D1gJleQSCgmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8CO0K3+uN14+8wa5VdK4IP/i3Q8K1c8K49eWFFZb14KNhTO9GBuNx+ERylIM7GUzE2QeDkmepRRyFfFbsGCJKJMFuAehonrCSFwu9d8S+n5d2hysJYowZeK3xuzB32ve1fSXP94+vn0dMN+Vc+pHd91L+Rs26eboI0wvVHIfAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FFci2RcD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59E6C986;
	Sat, 25 Apr 2026 00:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777071519;
	bh=mXeWIc4bSwDCNBcdRGufU1M9fLVnzL1D1gJleQSCgmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFci2RcD/qwzOICb/XJNhBJMrszBBdEiF2PyvpZYQfELPjQ992/wd1Xq+LB4T+F+a
	 UAj9P3s909RycxhJp4fW+3EBpbIxcOA2C/2kXmTl51mqqbRKLFXHhfQRuik4aavhI3
	 Tf7H1cNcUMW50IzgCaiIUOL90GIg1VQyVer2BrgU=
Date: Sat, 25 Apr 2026 02:00:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Xu Hongfei <xuhf@rock-chips.com>, michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RFC PATCH 2/5] arm64: dts: rockchip: add ISP nodes to rk3588
Message-ID: <20260424230017.GD3219146@killaraus.ideasonboard.com>
References: <20260424175853.638202-1-paul.elder@ideasonboard.com>
 <20260424175853.638202-3-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424175853.638202-3-paul.elder@ideasonboard.com>
X-Rspamd-Queue-Id: 5BF76463F2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-59565-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Paul,

Thank you for the patch.

On Sat, Apr 25, 2026 at 02:58:47AM +0900, Paul Elder wrote:
> From: Xu Hongfei <xuhf@rock-chips.com>
> 
> Add device tree nodes for the ISP and their iommus on the RK3588.
> 
> Signed-off-by: Xu Hongfei <xuhf@rock-chips.com>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index 8b98e5c3cc8b..607b03d55dfd 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -3535,6 +3535,66 @@ gpio4: gpio@fec50000 {
>  			#interrupt-cells = <2>;
>  		};
>  	};
> +
> +	isp0: isp@fdcb0000 {
> +		compatible = "rockchip,rk3588-isp";
> +		reg = <0x0 0xfdcb0000 0x0 0x7f00>;
> +		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "isp_irq", "mi_irq";
> +		clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>,
> +			 <&cru CLK_ISP0_CORE>, <&cru CLK_ISP0_CORE_MARVIN>,
> +			 <&cru CLK_ISP0_CORE_VICAP>;
> +		clock-names = "aclk", "hclk", "clk_core",
> +			      "clk_core_marvin", "clk_core_vicap";
> +		power-domains = <&power RK3588_PD_VI>;
> +		iommus = <&isp0_mmu>;
> +		status = "disabled";
> +	};
> +
> +	isp0_mmu: iommu@fdcb7f00 {
> +		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg = <0x0 0xfdcb7f00 0x0 0x100>;
> +		interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "isp0_mmu";

I don't think interrupt-names is needed. Same for the second IOMMU.

> +		clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>;
> +		clock-names = "aclk", "iface";
> +		power-domains = <&power RK3588_PD_VI>;
> +		#iommu-cells = <0>;
> +		rockchip,disable-mmu-reset;
> +		status = "disabled";
> +	};
> +
> +	isp1: isp@fdcc0000 {
> +		compatible = "rockchip,rk3588-isp";
> +		reg = <0x0 0xfdcc0000 0x0 0x7f00>;
> +		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "isp_irq", "mi_irq";
> +		clocks = <&cru ACLK_ISP1>, <&cru HCLK_ISP1>,
> +			 <&cru CLK_ISP1_CORE>, <&cru CLK_ISP1_CORE_MARVIN>,
> +			 <&cru CLK_ISP1_CORE_VICAP>;
> +		clock-names = "aclk", "hclk", "clk_core",
> +			      "clk_core_marvin", "clk_core_vicap";
> +		power-domains = <&power RK3588_PD_ISP1>;
> +		iommus = <&isp1_mmu>;
> +		status = "disabled";
> +	};
> +
> +	isp1_mmu: iommu@fdcc7f00 {
> +		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg = <0x0 0xfdcc7f00 0x0 0x100>;
> +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "isp1_mmu";
> +		clocks = <&cru ACLK_ISP1>, <&cru HCLK_ISP1>;
> +		clock-names = "aclk", "iface";
> +		power-domains = <&power RK3588_PD_ISP1>;
> +		#iommu-cells = <0>;
> +		rockchip,disable-mmu-reset;
> +		status = "disabled";
> +	};
>  };
>  
>  #include "rk3588-base-pinctrl.dtsi"

-- 
Regards,

Laurent Pinchart

