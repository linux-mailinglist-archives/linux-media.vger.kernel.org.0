Return-Path: <linux-media+bounces-13050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD8B90550D
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 16:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FD7A286677
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 14:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A99917E458;
	Wed, 12 Jun 2024 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="lfSuRqIh"
X-Original-To: linux-media@vger.kernel.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AEF17E452
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718202268; cv=none; b=mObe8BEGOVAElM+RYbuTmbVraHyT3SEOnwHL8FeAQt5sEaXN4ewcDPWUoaanqWYBXvDltZbzU4fNHdrNH4XdKuoyYkKZYX+w18LX/uUcaxJktRTAqVZr63ZLnKvvVe/95eq0Q9/D+afdRvJ853G9ejsbLtGoBq7K1qJr5rirNsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718202268; c=relaxed/simple;
	bh=hqdCAfu6vTn5//idU2+5pKvAi77w1mVADDY6sbxvcy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+bwYmA4KWXD/fiE0AroDh/SyH+HMxjBAWf3Lf7VuOulz5IXq5eqwv/uRWvma7nx/ryiyG38ATQrWEx1DeyzD0OLE/os1pE6GJCKhMFi/kdCF1fmNag4bvq6mMJPi5pTRgTBupjA1KoGah4w7VSokpuxkoKPdTgeKSpU5gU5jrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=lfSuRqIh; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
X-Envelope-To: joro@8bytes.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1718202264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpPWUTmJskkL811ZPGgtfh8tQuspDzkS2632APAKQFw=;
	b=lfSuRqIhAXKLPwhZQmRblMlHj7Tj1mrbpRluGLYCIWYMVK+T2JJkVrdjj43/F9GkV7CMnW
	UqtxVVjJYdz0rn60ei4ai17cv3isPimZrwn7AaKmTGCDKzsLKHUqLhPGW7Y1nfuqMNdgum
	98FtYL2kwC0qsfhrDKk/QjUX06GWzb1hkwrTmAX+v39PJl2ySVT6GzjISsGdW2217+eanZ
	tw0SWvRnexpB7waRtRhcegPFa1GMAJ2O6B11YByjXExKOXB6XbvrWPiXjvCOLjgH00IgCs
	yWvuGyMRoKbIdmLfU+XBtXXGHUy+XjPu18ZTBT5W/BcUiqdRc8mfE5WHUW4VVw==
X-Envelope-To: will@kernel.org
X-Envelope-To: robin.murphy@arm.com
X-Envelope-To: heiko@sntech.de
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: ogabbay@kernel.org
X-Envelope-To: tomeu.vizoso@tomeuvizoso.net
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: p.zabel@pengutronix.de
X-Envelope-To: sumit.semwal@linaro.org
X-Envelope-To: christian.koenig@amd.com
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: iommu@lists.linux.dev
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-media@vger.kernel.org
X-Envelope-To: linaro-mm-sig@lists.linaro.org
X-Envelope-To: tomeu@tomeuvizoso.net
X-Envelope-To: tomeu@tomeuvizoso.net
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-rockchip@lists.infradead.org
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject:
 Re: [PATCH 4/9] arm64: dts: rockchip: Add nodes for NPU and its MMU to
 rk3588s
Date: Wed, 12 Jun 2024 16:24:13 +0200
Message-ID: <2746394.siuavCmBn6@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240612-6-10-rocket-v1-4-060e48eea250@tomeuvizoso.net>
References:
 <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-4-060e48eea250@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5733380.qv8PDGWfNk";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart5733380.qv8PDGWfNk
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Date: Wed, 12 Jun 2024 16:24:13 +0200
Message-ID: <2746394.siuavCmBn6@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240612-6-10-rocket-v1-4-060e48eea250@tomeuvizoso.net>
MIME-Version: 1.0

Hi,

On Wednesday, 12 June 2024 15:52:57 CEST Tomeu Vizoso wrote:
> arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 53
> +++++++++++++++++++++++++++++++ 1 file changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
> 6ac5ac8b48ab..a5d53578c8f6 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> @@ -2665,6 +2665,59 @@ gpio4: gpio@fec50000 {
>                         #interrupt-cells = <2>;
>                 };
>         };
> +
> +       rknn: npu@fdab0000 {
> +               compatible = "rockchip,rk3588-rknn", "rockchip,rknn";
> +               reg = <0x0 0xfdab0000 0x0 0x9000>,
> +                     <0x0 0xfdac0000 0x0 0x9000>,
> +                     <0x0 0xfdad0000 0x0 0x9000>;
> +               interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
> +               interrupt-names = "npu0_irq", "npu1_irq", "npu2_irq";
> +               clocks = <&scmi_clk SCMI_CLK_NPU>, <&cru ACLK_NPU0>,
> +                        <&cru ACLK_NPU1>, <&cru ACLK_NPU2>,
> +                        <&cru HCLK_NPU0>, <&cru HCLK_NPU1>,
> +                        <&cru HCLK_NPU2>, <&cru PCLK_NPU_ROOT>;
> +               clock-names = "clk_npu",
> +                             "aclk0", "aclk1", "aclk2",
> +                             "hclk0", "hclk1", "hclk2",
> +                             "pclk";
> +               assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
> +               assigned-clock-rates = <200000000>;
> +               resets = <&cru SRST_A_RKNN0>, <&cru SRST_A_RKNN1>, <&cru
> SRST_A_RKNN2>, +                        <&cru SRST_H_RKNN0>, <&cru
> SRST_H_RKNN1>, <&cru SRST_H_RKNN2>; +               reset-names =
> "srst_a0", "srst_a1", "srst_a2",
> +                             "srst_h0", "srst_h1", "srst_h2";
> +               power-domains = <&power RK3588_PD_NPUTOP>,
> +                               <&power RK3588_PD_NPU1>,
> +                               <&power RK3588_PD_NPU2>;
> +               power-domain-names = "npu0", "npu1", "npu2";
> +               iommus = <&rknn_mmu>;
> +               status = "disabled";
> +       };
> +
> +       rknn_mmu: iommu@fdab9000 {
> +               compatible = "rockchip,rk3588-iommu";
> +               reg = <0x0 0xfdab9000 0x0 0x100>,
> +                     <0x0 0xfdaba000 0x0 0x100>,
> +                     <0x0 0xfdaca000 0x0 0x100>,
> +                     <0x0 0xfdada000 0x0 0x100>;
> +               interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
> +               interrupt-names = "npu0_mmu", "npu1_mmu", "npu2_mmu";
> +               clocks = <&cru ACLK_NPU0>, <&cru ACLK_NPU1>, <&cru
> ACLK_NPU2>, +                        <&cru HCLK_NPU0>, <&cru HCLK_NPU1>,
> <&cru HCLK_NPU2>; +               clock-names = "aclk0", "aclk1", "aclk2",
> +                             "iface0", "iface1", "iface2";
> +               #iommu-cells = <0>;
> +               power-domains = <&power RK3588_PD_NPUTOP>,
> +                               <&power RK3588_PD_NPU1>,
> +                               <&power RK3588_PD_NPU2>;
> +               power-domain-names = "npu0", "npu1", "npu2";
> +               status = "disabled";
> +       };

The nodes should be sorted by address, so these nodes should come between
pmu: power-management@fd8d8000 {
and 
av1d: video-codec@fdc70000 {

Cheers,
  Diederik
--nextPart5733380.qv8PDGWfNk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZmmvjQAKCRDXblvOeH7b
bq4nAP0bM7IIJSkR5Cpa0v55rfayhz1GtgK4oP8lmrY/U1t8fQD+Nf56dyaoEOoP
DY/YRTGxOjhhH6YlVSmtPw3bDw2VTAg=
=1S9B
-----END PGP SIGNATURE-----

--nextPart5733380.qv8PDGWfNk--




