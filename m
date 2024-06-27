Return-Path: <linux-media+bounces-14282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E5491B119
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 22:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90BC91F2475C
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 20:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9E919FA74;
	Thu, 27 Jun 2024 20:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="t8zkxINh"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A23519E827;
	Thu, 27 Jun 2024 20:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719521838; cv=none; b=sHnHtJsZ4xbubn658svVk7ZzXThAsPHKqNrce9xHI2paDj82fS8+IiUyw0bP58wCV6o7JM0kegY/p3B4HZKYCmyycWYiZZjAcKIwBIyHbG+MPf/uKYciHNFRfol7kJ0jTSxc7qeM1DY95pP8Pj7T3+B8ylpdZyMRN2hlTw03v6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719521838; c=relaxed/simple;
	bh=94U5cGjSgJ1hmDnRlX7E28/EM3+Vb46f9mlumivB4cA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9vfisPsakpvwRFj3MKd8bCs3gP8MMoCQqHQZO4eLlUsZ7acfpY/nB5bNlliwkXDEMjcX7N/zzSKd5a2h0Fw7pUj7ujjIJU2/mBv2JAQdlyt6PlCfwV1FjMva8ibTfulyIBLaw/duSTx5ieqvoWoxsSq+X/xoYle76Rj4RXKTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=t8zkxINh; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719521835;
	bh=94U5cGjSgJ1hmDnRlX7E28/EM3+Vb46f9mlumivB4cA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t8zkxINhHkDzCSd9X9ePrVARE6/Y2F+GuQelkWVqy4xKnmOK4Kr8qx4WUT3M/Pk2/
	 JE3Ah1GvnM8JKWYOhYEdvodc8afdh4KiZgeR+E9mzm4Bb0M8XjKxgAhYmawYvLewfi
	 ElXtVCOavSOy51PJsjMaqyCfaFpqaekNgIyA4EMgFNvFwRjGRNsnDoBmTfQ3U65YVE
	 iH3qfeerjb/nI8PPoZKTi0a0MePNnEiVDnhCTkWwZdoXpVF3THr8pq+t27iXB0AgS5
	 J2hmfZAmLtHK4emxthcFcP46Id4N7K3hBBCAArQcOtzgT1xqHIh1teiga/hwqfYskT
	 IRur3TRj/84gA==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B802037821E5;
	Thu, 27 Jun 2024 20:57:11 +0000 (UTC)
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
Date: Thu, 27 Jun 2024 16:56:43 -0400
Message-ID: <4356151.ejJDZkT8p0@arisu>
Organization: Collabora
In-Reply-To: <156b5aaf-8b9a-46b9-82c2-d7e32f4899f5@kwiboo.se>
References:
 <20240619150029.59730-1-detlev.casanova@collabora.com>
 <5790441.DvuYhMxLoT@arisu> <156b5aaf-8b9a-46b9-82c2-d7e32f4899f5@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2196199.Mh6RI2rZIc";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2196199.Mh6RI2rZIc
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Alex Bee <knaerzche@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Date: Thu, 27 Jun 2024 16:56:43 -0400
Message-ID: <4356151.ejJDZkT8p0@arisu>
Organization: Collabora
In-Reply-To: <156b5aaf-8b9a-46b9-82c2-d7e32f4899f5@kwiboo.se>
MIME-Version: 1.0

Hi Jonas,

On Monday, June 24, 2024 5:16:33 A.M. EDT Jonas Karlman wrote:
> Hi Detlev and Alex,
> 
> On 2024-06-20 15:31, Detlev Casanova wrote:
> > Hi Jonas, Alex,
> > 
> > On Wednesday, June 19, 2024 2:06:40 P.M. EDT Jonas Karlman wrote:
> >> Hi Alex,
> >> 
> >> On 2024-06-19 19:19, Alex Bee wrote:
> >>> Am 19.06.24 um 17:28 schrieb Jonas Karlman:
> >>>> Hi Detlev,
> >>>> 
> >>>> On 2024-06-19 16:57, Detlev Casanova wrote:
> >>>>> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> >>>>> 
> >>>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> >>>>> ---
> >>>>> 
> >>>>>   arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 50
> >>>>>   +++++++++++++++++++++++
> >>>>>   1 file changed, 50 insertions(+)
> >>>>> 
> >>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>>>> b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
> >>>>> 6ac5ac8b48ab..7690632f57f1 100644
> >>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>>>> @@ -2596,6 +2596,16 @@ system_sram2: sram@ff001000 {
> >>>>> 
> >>>>>   		ranges = <0x0 0x0 0xff001000 0xef000>;
> >>>>>   		#address-cells = <1>;
> >>>>>   		#size-cells = <1>;
> >>>>> 
> >>>>> +
> >>>>> +		vdec0_sram: rkvdec-sram@0 {
> >>>>> +			reg = <0x0 0x78000>;
> >>>>> +			pool;
> >>>>> +		};
> >>>>> +
> >>>>> +		vdec1_sram: rkvdec-sram@1 {
> >>>>> +			reg = <0x78000 0x77000>;
> >>>>> +			pool;
> >>>>> +		};
> >>>>> 
> >>>>>   	};
> >>>>>   	
> >>>>>   	pinctrl: pinctrl {
> >>>>> 
> >>>>> @@ -2665,6 +2675,46 @@ gpio4: gpio@fec50000 {
> >>>>> 
> >>>>>   			#interrupt-cells = <2>;
> >>>>>   		
> >>>>>   		};
> >>>>>   	
> >>>>>   	};
> >>>>> 
> >>>>> +
> >>>>> +	vdec0: video-decoder@fdc38100 {
> >>>>> +		compatible = "rockchip,rk3588-vdec";
> >>>>> +		reg = <0x0 0xfdc38100 0x0 0x500>;
> >>>>> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> >>>>> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>,
> > 
> > <&cru
> > 
> >>>>> CLK_RKVDEC0_CA>, +			 <&cru
> > 
> > CLK_RKVDEC0_CORE>, <&cru
> > 
> >>>>> CLK_RKVDEC0_HEVC_CA>;
> >>>>> +		clock-names = "axi", "ahb", "cabac", "core",
> > 
> > "hevc_cabac";
> > 
> >>>>> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru
> > 
> > CLK_RKVDEC0_CORE>,
> > 
> >>>>> +				  <&cru CLK_RKVDEC0_CA>, <&cru
> > 
> > CLK_RKVDEC0_HEVC_CA>;
> > 
> >>>>> +		assigned-clock-rates = <800000000>, <600000000>,
> >>>>> +				       <600000000>, <1000000000>;
> >>>>> +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>,
> > 
> > <&cru
> > 
> >>>>> SRST_RKVDEC0_CA>, +			 <&cru
> > 
> > SRST_RKVDEC0_CORE>, <&cru
> > 
> >>>>> SRST_RKVDEC0_HEVC_CA>;
> >>>>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
> >>>>> +			      "rst_core", "rst_hevc_cabac";
> >>>>> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> >>>>> +		sram = <&vdec0_sram>;
> >>>>> +		status = "okay";
> >>>>> +	};
> >>>>> +
> >>>>> +	vdec1: video-decoder@fdc40100 {
> >>>>> +		compatible = "rockchip,rk3588-vdec";
> >>>>> +		reg = <0x0 0xfdc40100 0x0 0x500>;
> >>>>> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
> >>>>> +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>,
> > 
> > <&cru
> > 
> >>>>> CLK_RKVDEC1_CA>, +			 <&cru
> > 
> > CLK_RKVDEC1_CORE>, <&cru
> > 
> >>>>> CLK_RKVDEC1_HEVC_CA>;
> >>>>> +		clock-names = "axi", "ahb", "cabac", "core",
> > 
> > "hevc_cabac";
> > 
> >>>>> +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru
> > 
> > CLK_RKVDEC1_CORE>,
> > 
> >>>>> +				  <&cru CLK_RKVDEC1_CA>, <&cru
> > 
> > CLK_RKVDEC1_HEVC_CA>;
> > 
> >>>>> +		assigned-clock-rates = <800000000>, <600000000>,
> >>>>> +				       <600000000>, <1000000000>;
> >>>>> +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>,
> > 
> > <&cru
> > 
> >>>>> SRST_RKVDEC1_CA>, +			 <&cru
> > 
> > SRST_RKVDEC1_CORE>, <&cru
> > 
> >>>>> SRST_RKVDEC1_HEVC_CA>;
> >>>>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
> >>>>> +			      "rst_core", "rst_hevc_cabac";
> >>>>> +		power-domains = <&power RK3588_PD_RKVDEC1>;
> >>>>> +		sram = <&vdec1_sram>;
> >>>>> +		status = "okay";
> >>>>> +	};
> >>>> 
> >>>> This is still missing the iommus, please add the iommus, they should be
> >>>> 
> >>>> supported/same as the one used for e.g. VOP2:
> >>>>    compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> >>>> 
> >>>> The VOP2 MMUs does have one extra mmu_cfg_mode flag in AUTO_GATING,
> >>>> compared to the VDPU381 MMUs, however only the AV1D MMU should be
> >>>> special on RK3588.
> >>>> 
> >>>> Please add the iommus :-)
> >>> 
> >>> When looking add the vendor DT/iommu driver I'm seeing serval quirks
> >>> applied for vdec's iommus. Since it's rightly frowned upon adding such
> >>> boolean-quirk-properties to upstream devicetrees, we'd at least need
> >>> additional (fallback-) compatibles, even if it works with the iommu
> >>> driver
> >>> as is (what I doubt, but haven't tested). We need to be able to apply
> >>> those
> >>> quirks later without changing the devicetree (as usual) and I'm sure RK
> >>> devs haven't added these quirks for the personal amusement.
> >> 
> >> Based on what I investigated the hw should work similar, and the quirks
> >> mostly seem related to optimizations and sw quirks, like do not zap each
> >> line, keep it alive even when pm runtime say it is not in use and other
> >> quirks that seem to be more of sw nature on how to best utilize the hw.
> > 
> > I did some testing with the IOMMU but unfortunately, I'm only getting page
> > fault errors. This may be something I'm doing wrong, but it clearly needs
> > more investigation.
> 
> I re-tested and the addition of sram seem to now cause page faults, the
> sram also need to be mapped in the iommu.
> 
> However, doing more testing revealed that use of iommu present the same
> issue as seen with hevc on rk3399, after a fail fluster tests continue
> to fail until a reset.
> 
> Seeing how this issue was very similar I re-tested on rk3399 without
> iommu and cma=1G and could observe that there was no longer any need to
> reset after a failed test. Interestingly the score also went up from
> 135 to 137/147.
> 
> Digging some more revealed that the iommu also is reset during the
> internal rkvdec soft reset on error, leaving the iommu with dte_addr=0
> and paging in disabled state.
> 
> Ensuring that the iommu was reconfigured after a failure fixed the issue
> observed on rk3399 and I now also get 137/147 hevc fluster score using
> the iommu.
> 
> Will send out a rkvdec hevc v2 series after some more testing.
> 
> Guessing there is a similar need to reconfigure iommu on rk3588, and my
> initial tests also showed promising result, however more tests are
> needed.

I did some testing with the IOMMU. The good news is that it now works with the 
SRAM.
I am also able to hack the iommu driver to force a reset in case of an error 
in the decoder. I'm not sure how to implement that with the IOMMU kernel API 
though.

Another issue is that resetting the iommu will drop all buffer addresses of 
other decoding contexts that may be running in parallel.

I *think* that the downstream mpp remaps the buffers in the iommu for each 
frame, but I'm not sure about that either.

So running fluster with `-j 1` gives me the expected 129/135 passed tests, but 
`-j 8` will start failing all tests after the first fail (well, first fail 
because of decoder error).

> Regards,
> Jonas
> 
> >>> If Detlev says
> >>> iommu is out of scope for this series (which is valid), I'd say it's
> >>> fine
> >>> to leave them out for now (as no binding exists) and the HW works
> >>> (obviously) fine without them.
> >> 
> >> Sure, use of MMU can be added later.
> > 
> > I'd rather go for that for now. I'll add that IMMU support is missing in
> > the TODO file.
> > 
> >> Regards,
> >> Jonas
> >> 
> >>>> Regards,
> >>>> Jonas
> >>>> 
> >>>>>   };
> >>>>>   
> >>>>>   #include "rk3588s-pinctrl.dtsi"


--nextPart2196199.Mh6RI2rZIc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZ90gsACgkQ5EFKUk4x
7bYa6gf+MiaSK8Y5oLb5OSnCyDTkgoikfs0H7IRjhc9JfuVseIw/XGzQ5T8i83SE
stQe2/brIQeUu5zchivSMvfmJg+ru2YMamAbT/mnMcpB3yeDrAqNBEvkssw4NHgg
bu2QBJgjJHOyNshda9CX5tCs1qkZG2O90QF/UPl01LaLxQ9ELSlEAcbDhsl7bwHJ
2jaPH9Jjx/aKF85ejNCG1/uprnRp0Lt6rSaPl7tmxBbod/kzU92WZmAoDOvoroRr
d8VKGBINQ5pJKfBo4+tavqd7UR1OAH0cVR4E4b2kGjG57qOU32qizZoF3qr/nQBl
A3ePYf8XuUKjf33eZ2SkF1kqF2fWOw==
=JJQJ
-----END PGP SIGNATURE-----

--nextPart2196199.Mh6RI2rZIc--




