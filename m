Return-Path: <linux-media+bounces-3039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C21181F2F0
	for <lists+linux-media@lfdr.de>; Thu, 28 Dec 2023 00:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BAE01F22F70
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 23:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096E94989D;
	Wed, 27 Dec 2023 23:12:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3992D49891
	for <linux-media@vger.kernel.org>; Wed, 27 Dec 2023 23:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875a56.versanet.de ([83.135.90.86] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rId4z-0000wb-CI; Thu, 28 Dec 2023 00:12:49 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: liujianfeng1994@gmail.com, Jianfeng Liu <liujianfeng1994@gmail.com>
Subject:
 Re: [PATCH 2/3] arm64: dts: rockchip: Add Hantro G1 VPU support for RK3588
Date: Thu, 28 Dec 2023 00:12:48 +0100
Message-ID: <6924598.K2JlShyGXD@diego>
In-Reply-To: <20231227173911.3295410-3-liujianfeng1994@gmail.com>
References:
 <20231227173911.3295410-1-liujianfeng1994@gmail.com>
 <20231227173911.3295410-3-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Am Mittwoch, 27. Dezember 2023, 18:39:10 CET schrieb Jianfeng Liu:
> This patch enables Hantro G1 video decoder in RK3588's
> device-tree
> 
> Tested with FFmpeg v4l2_request code taken from [1]
> with MPEG2, H.264 and VP8 samples.
> 
> [1] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> index 5fb0baf8a..b3536e097 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> @@ -708,6 +708,26 @@ vop_mmu: iommu@fdd97e00 {
>  		status = "disabled";
>  	};
> 
> +	vpu: video-codec@fdb50400 {

please sort nodes by bus-address. According to the current rk3588s.dtsi,
both nodes should be between 
- i2c@fd880000
+ video-codec@fdb50400
+ iommu@fdb50800
- vop@fdd90000


Otherwise this looks nice :-) .

Thanks
Heiko

> +		compatible = "rockchip,rk3588-vpu";
> +		reg = <0x0 0xfdb50000 0x0 0x800>;
> +		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> +		clock-names = "aclk", "hclk";
> +		iommus = <&vdpu_mmu>;
> +		power-domains = <&power RK3588_PD_VDPU>;
> +	};
> +
> +	vdpu_mmu: iommu@fdb50800 {
> +		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg = <0x0 0xfdb50800 0x0 0x40>;
> +		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clock-names = "aclk", "iface";
> +		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> +		power-domains = <&power RK3588_PD_VDPU>;
> +		#iommu-cells = <0>;
> +	};
> +
>  	uart0: serial@fd890000 {
>  		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
>  		reg = <0x0 0xfd890000 0x0 0x100>;
> --
> 2.34.1
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 





