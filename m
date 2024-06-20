Return-Path: <linux-media+bounces-13815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC8191063E
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 15:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37AB61C20A7C
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 13:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43481AF6BB;
	Thu, 20 Jun 2024 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="xZuAGHw+"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA351ACE87;
	Thu, 20 Jun 2024 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718890329; cv=none; b=oYC7pZJJSx32Ma2a0EnyaqvvZ6Ab159XFdfXJBly/f5e1xPJ8FCkEQisqZZGKcenia5lZISkE3dOkEhNBK5T5RGXwFxQ0FWSWbJJpwoXGF8HOq0NixuT29qVJ6zOgJuFSZv5Jfoca+Wx84S/ZoFXubRhhvfx3KFeOeaA7887Bpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718890329; c=relaxed/simple;
	bh=uqG9px9whCOW7Gcy1yIYPJjONlTNDqAYB6qYXXu9HbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gOO9Hw5VflFL5dMYLVnbA8OMuNAQCiatBWLS600hI0YBgsFPyR0CXZhjownmfHIA4jShpeppihvWsOZE3QJGER62JVrtkV2XG0JZz4LfwR5dT60VBEvh853M3cjvQF43Jxp5UyL5MxQANi8/zI4LNSXUdC/kW7oLbK924KQq9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=xZuAGHw+; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718890319;
	bh=uqG9px9whCOW7Gcy1yIYPJjONlTNDqAYB6qYXXu9HbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xZuAGHw+/sI4LMWxddUXw71RUXUUW5iDMoOe+CTqIlhfHc/9NXB+X/DRa3sDOg+NE
	 +WNZt7g71jn1kcvimEt0riEq99o3Of0ELJQb4++nds7q2O9Aj0kEBhU9xBwt5j/y1c
	 G1b+ChjqCbqhf3x107WrDksKHFoCJ2iFl552kM0vEiVHuAQnWz4XKnhx2uiNsfvzwL
	 oH4Bw9vDynmeLpd/yabwU6L/LPSgDkTCcRqOb4NQgAN+ahln9cdT/ZIQ3ve+LzINb4
	 w+x7kCQuEnfjn238wLIOECS7AjNrWjFXDUuZbf+VubHw0sVez9e7jAltdA/CemY4ZH
	 zoPv0zkMFd5iQ==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 543853782039;
	Thu, 20 Jun 2024 13:31:56 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Alex Bee <knaerzche@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 4/4] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
Date: Thu, 20 Jun 2024 09:31:27 -0400
Message-ID: <5790441.DvuYhMxLoT@arisu>
Organization: Collabora
In-Reply-To: <e6e2e0f1-0b16-4a3d-ae7b-be5a04d7902b@kwiboo.se>
References:
 <20240619150029.59730-1-detlev.casanova@collabora.com>
 <052f2ea7-2ded-4d39-a513-3a47fee1bf02@gmail.com>
 <e6e2e0f1-0b16-4a3d-ae7b-be5a04d7902b@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6055362.lOV4Wx5bFT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6055362.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Alex Bee <knaerzche@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Date: Thu, 20 Jun 2024 09:31:27 -0400
Message-ID: <5790441.DvuYhMxLoT@arisu>
Organization: Collabora
In-Reply-To: <e6e2e0f1-0b16-4a3d-ae7b-be5a04d7902b@kwiboo.se>
MIME-Version: 1.0

Hi Jonas, Alex,

On Wednesday, June 19, 2024 2:06:40 P.M. EDT Jonas Karlman wrote:
> Hi Alex,
> 
> On 2024-06-19 19:19, Alex Bee wrote:
> > Am 19.06.24 um 17:28 schrieb Jonas Karlman:
> >> Hi Detlev,
> >> 
> >> On 2024-06-19 16:57, Detlev Casanova wrote:
> >>> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> >>> 
> >>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> >>> ---
> >>> 
> >>>   arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 50 +++++++++++++++++++++++
> >>>   1 file changed, 50 insertions(+)
> >>> 
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>> b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
> >>> 6ac5ac8b48ab..7690632f57f1 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>> @@ -2596,6 +2596,16 @@ system_sram2: sram@ff001000 {
> >>> 
> >>>   		ranges = <0x0 0x0 0xff001000 0xef000>;
> >>>   		#address-cells = <1>;
> >>>   		#size-cells = <1>;
> >>> 
> >>> +
> >>> +		vdec0_sram: rkvdec-sram@0 {
> >>> +			reg = <0x0 0x78000>;
> >>> +			pool;
> >>> +		};
> >>> +
> >>> +		vdec1_sram: rkvdec-sram@1 {
> >>> +			reg = <0x78000 0x77000>;
> >>> +			pool;
> >>> +		};
> >>> 
> >>>   	};
> >>>   	
> >>>   	pinctrl: pinctrl {
> >>> 
> >>> @@ -2665,6 +2675,46 @@ gpio4: gpio@fec50000 {
> >>> 
> >>>   			#interrupt-cells = <2>;
> >>>   		
> >>>   		};
> >>>   	
> >>>   	};
> >>> 
> >>> +
> >>> +	vdec0: video-decoder@fdc38100 {
> >>> +		compatible = "rockchip,rk3588-vdec";
> >>> +		reg = <0x0 0xfdc38100 0x0 0x500>;
> >>> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> >>> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, 
<&cru
> >>> CLK_RKVDEC0_CA>, +			 <&cru 
CLK_RKVDEC0_CORE>, <&cru
> >>> CLK_RKVDEC0_HEVC_CA>;
> >>> +		clock-names = "axi", "ahb", "cabac", "core", 
"hevc_cabac";
> >>> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru 
CLK_RKVDEC0_CORE>,
> >>> +				  <&cru CLK_RKVDEC0_CA>, <&cru 
CLK_RKVDEC0_HEVC_CA>;
> >>> +		assigned-clock-rates = <800000000>, <600000000>,
> >>> +				       <600000000>, <1000000000>;
> >>> +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, 
<&cru
> >>> SRST_RKVDEC0_CA>, +			 <&cru 
SRST_RKVDEC0_CORE>, <&cru
> >>> SRST_RKVDEC0_HEVC_CA>;
> >>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
> >>> +			      "rst_core", "rst_hevc_cabac";
> >>> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> >>> +		sram = <&vdec0_sram>;
> >>> +		status = "okay";
> >>> +	};
> >>> +
> >>> +	vdec1: video-decoder@fdc40100 {
> >>> +		compatible = "rockchip,rk3588-vdec";
> >>> +		reg = <0x0 0xfdc40100 0x0 0x500>;
> >>> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
> >>> +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, 
<&cru
> >>> CLK_RKVDEC1_CA>, +			 <&cru 
CLK_RKVDEC1_CORE>, <&cru
> >>> CLK_RKVDEC1_HEVC_CA>;
> >>> +		clock-names = "axi", "ahb", "cabac", "core", 
"hevc_cabac";
> >>> +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru 
CLK_RKVDEC1_CORE>,
> >>> +				  <&cru CLK_RKVDEC1_CA>, <&cru 
CLK_RKVDEC1_HEVC_CA>;
> >>> +		assigned-clock-rates = <800000000>, <600000000>,
> >>> +				       <600000000>, <1000000000>;
> >>> +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>, 
<&cru
> >>> SRST_RKVDEC1_CA>, +			 <&cru 
SRST_RKVDEC1_CORE>, <&cru
> >>> SRST_RKVDEC1_HEVC_CA>;
> >>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
> >>> +			      "rst_core", "rst_hevc_cabac";
> >>> +		power-domains = <&power RK3588_PD_RKVDEC1>;
> >>> +		sram = <&vdec1_sram>;
> >>> +		status = "okay";
> >>> +	};
> >> 
> >> This is still missing the iommus, please add the iommus, they should be
> >> 
> >> supported/same as the one used for e.g. VOP2:
> >>    compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> >> 
> >> The VOP2 MMUs does have one extra mmu_cfg_mode flag in AUTO_GATING,
> >> compared to the VDPU381 MMUs, however only the AV1D MMU should be
> >> special on RK3588.
> >> 
> >> Please add the iommus :-)
> > 
> > When looking add the vendor DT/iommu driver I'm seeing serval quirks
> > applied for vdec's iommus. Since it's rightly frowned upon adding such
> > boolean-quirk-properties to upstream devicetrees, we'd at least need
> > additional (fallback-) compatibles, even if it works with the iommu driver
> > as is (what I doubt, but haven't tested). We need to be able to apply
> > those
> > quirks later without changing the devicetree (as usual) and I'm sure RK
> > devs haven't added these quirks for the personal amusement.
> 
> Based on what I investigated the hw should work similar, and the quirks
> mostly seem related to optimizations and sw quirks, like do not zap each
> line, keep it alive even when pm runtime say it is not in use and other
> quirks that seem to be more of sw nature on how to best utilize the hw.

I did some testing with the IOMMU but unfortunately, I'm only getting page 
fault errors. This may be something I'm doing wrong, but it clearly needs more 
investigation.

> > If Detlev says
> > iommu is out of scope for this series (which is valid), I'd say it's fine
> > to leave them out for now (as no binding exists) and the HW works
> > (obviously) fine without them.
> 
> Sure, use of MMU can be added later.

I'd rather go for that for now. I'll add that IMMU support is missing in the 
TODO file.

> Regards,
> Jonas
> 
> >> Regards,
> >> Jonas
> >> 
> >>>   };
> >>>   
> >>>   #include "rk3588s-pinctrl.dtsi"


--nextPart6055362.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZ0Ly8ACgkQ5EFKUk4x
7baECAgAjk5js2JpB7x6DfY5moW2stChHufZtF9r0C0I5LGQ79O2WMm00iKy9+Fc
BTaXnm+kcaVHAlnWEySwoY6Rtt+Mcqvcn868s97s0NsgOuI79haxGPDAviqTmN+Y
dzxMxeskaNTBwutUHnbmRe6Te0e2LdqOSciANdXlPwnukKPB26fDJYNMc26wrZ+n
Mk/nkU6GGqrNl9xATPy6CnR8+gzCcqsnQRqHXGuhX1aKhzEa7PX2OFIcAoti+5qM
HoFR5ptStD7+Ea2+xeM/JRuZegTAEzf9J3DstBkSYP/YCfuLMvGb4Miii/d89wn+
3E6az4GaUoiEwBv/cr0uTnWhC0v0fQ==
=znvp
-----END PGP SIGNATURE-----

--nextPart6055362.lOV4Wx5bFT--




