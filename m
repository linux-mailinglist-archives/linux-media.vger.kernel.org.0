Return-Path: <linux-media+bounces-15362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C17D893D611
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 17:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 789B6286F96
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 15:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6448F17BB2A;
	Fri, 26 Jul 2024 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l7OLWBbe"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF0417B404;
	Fri, 26 Jul 2024 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007626; cv=none; b=kP0pPaZJKtdke7BBV4TsRjWnBpar8qpTcsLG14fxNWFeZAH34vJ5sfp/oEP7bzvjDN+0XnQ2dRjS5k9kkH6wq80QysxMG/S71w9byu+xe+K2ZNjCKnDuMh1cCj3dZRBjjU37wNFXWUULQu5bEHHU/Ksq5v+B8d5CaRz2tbn59co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007626; c=relaxed/simple;
	bh=E2hqZT7pEbmG5Bxqcb8qWIaQEqch6WgC3UILfeH7gLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1lDOJtrHjAfRzhkCdvEo29Z+XKOjgTF52V1vj06T/Iu29VNl3QROI9cRdac/48kSlsYsdCp9dcuEyjqmUUfAu2hoMspzkod60j6hkc+6uRLJm/mg1Rzg3IDrwxIkYDPI/ZNOu9w91dLph0dI/GzvX7WJYpcwxSRu0bGpRug0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l7OLWBbe; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722007621;
	bh=E2hqZT7pEbmG5Bxqcb8qWIaQEqch6WgC3UILfeH7gLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l7OLWBbeAgG9sz17DdR7VWQS01BKtnbaeicriI/MgeVbTqbFIxaVlnt6wSuJq7Amr
	 eBmd3x6j39846oRu8F3NP4dEfASl4Z4bKJD1+Rth8tRiYJ2BpnhY7Mrhl15k6uIY3c
	 AZfThuVIaJT7vXoI0wLXBNhw1fArvSTRsfH36KVfpkYpcsusNwSQHCP/GdKtyn8lni
	 yHM4OgI+ALcTWtVhsHpK3GYjV5uIftUDet0Wdz+vfHcG9/QdZOmnQ0uxzdb7aR+gNb
	 WGf4df2YoVkpfPZ9OFxasCv7+DzVSthHy4LS+UhnCD5MhE41Jk4aqvs4/U7meo4V/E
	 am63/++bliYFg==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 70E073780C6C;
	Fri, 26 Jul 2024 15:26:58 +0000 (UTC)
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
Date: Fri, 26 Jul 2024 11:26:35 -0400
Message-ID: <6070053.DvuYhMxLoT@arisu>
Organization: Collabora
In-Reply-To: <689aec72-f777-4122-a332-02009fbf0b3b@kwiboo.se>
References:
 <20240619150029.59730-1-detlev.casanova@collabora.com>
 <4356151.ejJDZkT8p0@arisu> <689aec72-f777-4122-a332-02009fbf0b3b@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6335455.lOV4Wx5bFT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6335455.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Alex Bee <knaerzche@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Date: Fri, 26 Jul 2024 11:26:35 -0400
Message-ID: <6070053.DvuYhMxLoT@arisu>
Organization: Collabora
In-Reply-To: <689aec72-f777-4122-a332-02009fbf0b3b@kwiboo.se>
MIME-Version: 1.0

Hi Jonas !

On Thursday, June 27, 2024 6:39:36 P.M. EDT Jonas Karlman wrote:
> Hi Datlev,
> 
> On 2024-06-27 22:56, Detlev Casanova wrote:
> > Hi Jonas,
> > 
> > On Monday, June 24, 2024 5:16:33 A.M. EDT Jonas Karlman wrote:
> >> Hi Detlev and Alex,
> >> 
> >> On 2024-06-20 15:31, Detlev Casanova wrote:
> >>> Hi Jonas, Alex,
> >>> 
> >>> On Wednesday, June 19, 2024 2:06:40 P.M. EDT Jonas Karlman wrote:
> >>>> Hi Alex,
> >>>> 
> >>>> On 2024-06-19 19:19, Alex Bee wrote:
> >>>>> Am 19.06.24 um 17:28 schrieb Jonas Karlman:
> >>>>>> Hi Detlev,
> >>>>>> 
> >>>>>> On 2024-06-19 16:57, Detlev Casanova wrote:
> >>>>>>> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> >>>>>>> 
> >>>>>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> >>>>>>> ---
> >>>>>>> 
> >>>>>>>   arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 50
> >>>>>>>   +++++++++++++++++++++++
> >>>>>>>   1 file changed, 50 insertions(+)
> >>>>>>> 
> >>>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>>>>>> b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi index
> >>>>>>> 6ac5ac8b48ab..7690632f57f1 100644
> >>>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >>>>>>> @@ -2596,6 +2596,16 @@ system_sram2: sram@ff001000 {
> >>>>>>> 
> >>>>>>>   		ranges = <0x0 0x0 0xff001000 0xef000>;
> >>>>>>>   		#address-cells = <1>;
> >>>>>>>   		#size-cells = <1>;
> >>>>>>> 
> >>>>>>> +
> >>>>>>> +		vdec0_sram: rkvdec-sram@0 {
> >>>>>>> +			reg = <0x0 0x78000>;
> >>>>>>> +			pool;
> >>>>>>> +		};
> >>>>>>> +
> >>>>>>> +		vdec1_sram: rkvdec-sram@1 {
> >>>>>>> +			reg = <0x78000 0x77000>;
> >>>>>>> +			pool;
> >>>>>>> +		};
> >>>>>>> 
> >>>>>>>   	};
> >>>>>>>   	
> >>>>>>>   	pinctrl: pinctrl {
> >>>>>>> 
> >>>>>>> @@ -2665,6 +2675,46 @@ gpio4: gpio@fec50000 {
> >>>>>>> 
> >>>>>>>   			#interrupt-cells = <2>;
> >>>>>>>   		
> >>>>>>>   		};
> >>>>>>>   	
> >>>>>>>   	};
> >>>>>>> 
> >>>>>>> +
> >>>>>>> +	vdec0: video-decoder@fdc38100 {
> >>>>>>> +		compatible = "rockchip,rk3588-vdec";
> >>>>>>> +		reg = <0x0 0xfdc38100 0x0 0x500>;
> >>>>>>> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> >>>>>>> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>,
> >>> 
> >>> <&cru
> >>> 
> >>>>>>> CLK_RKVDEC0_CA>, +			 <&cru
> >>> 
> >>> CLK_RKVDEC0_CORE>, <&cru
> >>> 
> >>>>>>> CLK_RKVDEC0_HEVC_CA>;
> >>>>>>> +		clock-names = "axi", "ahb", "cabac", "core",
> >>> 
> >>> "hevc_cabac";
> >>> 
> >>>>>>> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru
> >>> 
> >>> CLK_RKVDEC0_CORE>,
> >>> 
> >>>>>>> +				  <&cru CLK_RKVDEC0_CA>, <&cru
> >>> 
> >>> CLK_RKVDEC0_HEVC_CA>;
> >>> 
> >>>>>>> +		assigned-clock-rates = <800000000>, <600000000>,
> >>>>>>> +				       <600000000>, <1000000000>;
> >>>>>>> +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>,
> >>> 
> >>> <&cru
> >>> 
> >>>>>>> SRST_RKVDEC0_CA>, +			 <&cru
> >>> 
> >>> SRST_RKVDEC0_CORE>, <&cru
> >>> 
> >>>>>>> SRST_RKVDEC0_HEVC_CA>;
> >>>>>>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
> >>>>>>> +			      "rst_core", "rst_hevc_cabac";
> >>>>>>> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> >>>>>>> +		sram = <&vdec0_sram>;
> >>>>>>> +		status = "okay";
> >>>>>>> +	};
> >>>>>>> +
> >>>>>>> +	vdec1: video-decoder@fdc40100 {
> >>>>>>> +		compatible = "rockchip,rk3588-vdec";
> >>>>>>> +		reg = <0x0 0xfdc40100 0x0 0x500>;
> >>>>>>> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
> >>>>>>> +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>,
> >>> 
> >>> <&cru
> >>> 
> >>>>>>> CLK_RKVDEC1_CA>, +			 <&cru
> >>> 
> >>> CLK_RKVDEC1_CORE>, <&cru
> >>> 
> >>>>>>> CLK_RKVDEC1_HEVC_CA>;
> >>>>>>> +		clock-names = "axi", "ahb", "cabac", "core",
> >>> 
> >>> "hevc_cabac";
> >>> 
> >>>>>>> +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru
> >>> 
> >>> CLK_RKVDEC1_CORE>,
> >>> 
> >>>>>>> +				  <&cru CLK_RKVDEC1_CA>, <&cru
> >>> 
> >>> CLK_RKVDEC1_HEVC_CA>;
> >>> 
> >>>>>>> +		assigned-clock-rates = <800000000>, <600000000>,
> >>>>>>> +				       <600000000>, <1000000000>;
> >>>>>>> +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>,
> >>> 
> >>> <&cru
> >>> 
> >>>>>>> SRST_RKVDEC1_CA>, +			 <&cru
> >>> 
> >>> SRST_RKVDEC1_CORE>, <&cru
> >>> 
> >>>>>>> SRST_RKVDEC1_HEVC_CA>;
> >>>>>>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
> >>>>>>> +			      "rst_core", "rst_hevc_cabac";
> >>>>>>> +		power-domains = <&power RK3588_PD_RKVDEC1>;
> >>>>>>> +		sram = <&vdec1_sram>;
> >>>>>>> +		status = "okay";
> >>>>>>> +	};
> >>>>>> 
> >>>>>> This is still missing the iommus, please add the iommus, they should
> >>>>>> be
> >>>>>> 
> >>>>>> supported/same as the one used for e.g. VOP2:
> >>>>>>    compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> >>>>>> 
> >>>>>> The VOP2 MMUs does have one extra mmu_cfg_mode flag in AUTO_GATING,
> >>>>>> compared to the VDPU381 MMUs, however only the AV1D MMU should be
> >>>>>> special on RK3588.
> >>>>>> 
> >>>>>> Please add the iommus :-)
> >>>>> 
> >>>>> When looking add the vendor DT/iommu driver I'm seeing serval quirks
> >>>>> applied for vdec's iommus. Since it's rightly frowned upon adding such
> >>>>> boolean-quirk-properties to upstream devicetrees, we'd at least need
> >>>>> additional (fallback-) compatibles, even if it works with the iommu
> >>>>> driver
> >>>>> as is (what I doubt, but haven't tested). We need to be able to apply
> >>>>> those
> >>>>> quirks later without changing the devicetree (as usual) and I'm sure
> >>>>> RK
> >>>>> devs haven't added these quirks for the personal amusement.
> >>>> 
> >>>> Based on what I investigated the hw should work similar, and the quirks
> >>>> mostly seem related to optimizations and sw quirks, like do not zap
> >>>> each
> >>>> line, keep it alive even when pm runtime say it is not in use and other
> >>>> quirks that seem to be more of sw nature on how to best utilize the hw.
> >>> 
> >>> I did some testing with the IOMMU but unfortunately, I'm only getting
> >>> page
> >>> fault errors. This may be something I'm doing wrong, but it clearly
> >>> needs
> >>> more investigation.
> >> 
> >> I re-tested and the addition of sram seem to now cause page faults, the
> >> sram also need to be mapped in the iommu.
> >> 
> >> However, doing more testing revealed that use of iommu present the same
> >> issue as seen with hevc on rk3399, after a fail fluster tests continue
> >> to fail until a reset.
> >> 
> >> Seeing how this issue was very similar I re-tested on rk3399 without
> >> iommu and cma=1G and could observe that there was no longer any need to
> >> reset after a failed test. Interestingly the score also went up from
> >> 135 to 137/147.
> >> 
> >> Digging some more revealed that the iommu also is reset during the
> >> internal rkvdec soft reset on error, leaving the iommu with dte_addr=0
> >> and paging in disabled state.
> >> 
> >> Ensuring that the iommu was reconfigured after a failure fixed the issue
> >> observed on rk3399 and I now also get 137/147 hevc fluster score using
> >> the iommu.
> >> 
> >> Will send out a rkvdec hevc v2 series after some more testing.
> >> 
> >> Guessing there is a similar need to reconfigure iommu on rk3588, and my
> >> initial tests also showed promising result, however more tests are
> >> needed.
> > 
> > I did some testing with the IOMMU. The good news is that it now works with
> > the SRAM.
> 
> Great, I did not look into SRAM at all, just replaced sram prop with iommus
> for my tests, so great that you found a way to make it work with the iommu
> :-)
> > I am also able to hack the iommu driver to force a reset in case of an
> > error in the decoder. I'm not sure how to implement that with the IOMMU
> > kernel API though.
> 
> I am planning on sending something along the way of this as an RFC:
> 
> https://github.com/Kwiboo/linux-rockchip/compare/6da640232631...bf332524d880
> 
> If we re-configure and re-enable the iommu just before next decoding run
> after a decoding has failed seem to resolve any issue I have seen, have
> mainly been tested with rkvdec and HEVC on RK3399/RK3328. On RK3588 this
> also seemed to work, at least when I tested earlier this week.
> 
> > Another issue is that resetting the iommu will drop all buffer addresses
> > of
> > other decoding contexts that may be running in parallel.
> 
> I do not think we need/should reset the iommu, we just need to deal with
> the fact that the rkvdec will reset and disable use of the mmu when it
> reset itself.
> 
> > I *think* that the downstream mpp remaps the buffers in the iommu for each
> > frame, but I'm not sure about that either.
> 
> As long as a frame can be decoded correctly, the mmu config seem to continue
> to be valid and next frame can be decoded.
> 
> > So running fluster with `-j 1` gives me the expected 129/135 passed tests,
> > but `-j 8` will start failing all tests after the first fail (well, first
> > fail because of decoder error).
> 
> This was the main issue blocking rkvdec hevc, just re-confgure the mmu
> after a frame fails to decode seem to resolve this issue.
> 
> Biggest issue at the moment is how to properly signal iommu subsystem that
> it should re-configure, I may have abused the flush_iotlb_all ops, since
> that seemed closest existing hook.
> 
> Will send an RFC to linux-iommu to collect input on how to best signal
> iommu subsystem that the mmu has been reset by an external event and now
> need to be re-configured.

Do you mind if I go ahead and send your iommu flush_iotlb_all patch upstream to 
start the discussion ? I'd love for this patch set to move along and that's 
kind of a blocker right now.

Detlev.



--nextPart6335455.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmajwCsACgkQ5EFKUk4x
7barIQf/fKNHI8sImF3xc2IxLOUmuaNQoDlcEgIggAg8Y+Bz4tmGhZ28kxCI5zWo
HovilM1SYHBOB6oVQjDUzBMJn5R9Nm/1BZ9e+ad1n1GDgCQBReGnKllQ82R6EQUS
lkyYoOBMHCgyYb95f65X4Y6T7wzGhelbz0VMEBzFDfNERlV7ovhqWgm0MIR7FBRv
VxPVn0V5VnQuMa3xl96VYNoe/w69IH429ir+PC0I653QPcljD6HXEiUUhKIErmme
p685s5g8caxxJKeVKmYoTeXmcFDBeaNkj/OOfaK0MYKY9uWfXha6a+nmVQnZy2MI
Vdqi+URH948nZlkyyrxZS6adU17mWQ==
=Pq0j
-----END PGP SIGNATURE-----

--nextPart6335455.lOV4Wx5bFT--




