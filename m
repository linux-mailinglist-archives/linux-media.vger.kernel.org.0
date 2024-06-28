Return-Path: <linux-media+bounces-14346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C661E91BF8D
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 15:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49F511F23913
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 13:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2C21E895;
	Fri, 28 Jun 2024 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="yIp4QFM6"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00834567F;
	Fri, 28 Jun 2024 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719581497; cv=none; b=cR4kVV0Oz9wmz2dFBdndsrnDuKID9++L4iq1gKyLJcJCP7zYGxmsIT0zCg8xNoe/M1+1t7NZGFRnKgOjr0UiIFmKQQBULGnv8OUhHNYI83QvfxW8Ye2x/H7Bidn2yf8fwO6a1DNRod6VtyCDqbmVS3v9eHfX2t6RSJDaWnoDBn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719581497; c=relaxed/simple;
	bh=EBwHlR6nVxqKGWbd3LN/16tCHeMoecUhepxTPyqgOzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfPE6m3WXWxfhs6Qf0obBtnHphhDW9N7cr/gJhugxecwlmP/LfIiqpWMvmimlx16TwvSZZQAHcGtxK6mXoM11I+VSlCoTnpm5oA0hbR6FylZ0cRrc/V2KxrGADpf6TXKJK0uzinqoJpyD3jAGys5ECdvoYOp91nYs8l6mrUatQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=yIp4QFM6; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719581494;
	bh=EBwHlR6nVxqKGWbd3LN/16tCHeMoecUhepxTPyqgOzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yIp4QFM6wnFn/Xisf+g71XDABvCWuS9qaS3UIELrMqNKjYuGQBqfbw1Sg3mZRIHIy
	 QOUaK9k7zc7UBbpdrUTkrUuZGYEb+auz9a5TgtjtA369P/REA+d/UHiy+SdHlHQcAu
	 4bz2DEllc+tVy8W6gZ0+ThbCBKtVaePvB5g4Nybz9Nv3eetMxYZMFmT7ZffyFRNQum
	 oTFmc2oXGF3+SAmx5JthCBJTX6XEdB5D48mgDBn+RhXsNZxGLZ8HvGn4fnGCDcF+kg
	 K/CapPyd6J7b/zrsrZSqfvlrfAMI+XTUClMlnJWJrBJ4n7areyr8mjxRU7RJ2PbK/z
	 Ht3Gh3dQ0gLOQ==
Received: from arisu.localnet (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9D514378219E;
	Fri, 28 Jun 2024 13:31:30 +0000 (UTC)
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
Date: Fri, 28 Jun 2024 09:31:02 -0400
Message-ID: <114641696.nniJfEyVGO@arisu>
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
Content-Type: multipart/signed; boundary="nextPart2466515.jE0xQCEvom";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2466515.jE0xQCEvom
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Alex Bee <knaerzche@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Date: Fri, 28 Jun 2024 09:31:02 -0400
Message-ID: <114641696.nniJfEyVGO@arisu>
Organization: Collabora
In-Reply-To: <689aec72-f777-4122-a332-02009fbf0b3b@kwiboo.se>
MIME-Version: 1.0

Hi Jonas,

On Thursday, June 27, 2024 6:39:36 P.M. EDT Jonas Karlman wrote:
[snip]
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

Oh I see, it just resets the iommu config in the core's registers, but the 
hardware retains the mapped addresses. That makes things simpler indeed, just 
reconfigure before the next frame in case of status error in the interrupt.

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

Oh I see, I was wondering what the flush_iotlb_all ops was doing exactly. So 
does it flush a "cached" copy of the table from the driver back to the hardware 
? As well as reconfigure the registers I guess.

> Will send an RFC to linux-iommu to collect input on how to best signal
> iommu subsystem that the mmu has been reset by an external event and now
> need to be re-configured.

Thank you ! Can you add me in cc so that I can keep track of this ?

> Regards,
> Jonas
> 
> >> Regards,
> >> Jonas
> >> 
> >>>>> If Detlev says
> >>>>> iommu is out of scope for this series (which is valid), I'd say it's
> >>>>> fine
> >>>>> to leave them out for now (as no binding exists) and the HW works
> >>>>> (obviously) fine without them.
> >>>> 
> >>>> Sure, use of MMU can be added later.
> >>> 
> >>> I'd rather go for that for now. I'll add that IMMU support is missing in
> >>> the TODO file.
> >>> 
> >>>> Regards,
> >>>> Jonas
> >>>> 
> >>>>>> Regards,
> >>>>>> Jonas
> >>>>>> 
> >>>>>>>   };
> >>>>>>>   
> >>>>>>>   #include "rk3588s-pinctrl.dtsi"


--nextPart2466515.jE0xQCEvom
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEonF9IvGrXNkDg+CX5EFKUk4x7bYFAmZ+uxYACgkQ5EFKUk4x
7bYn+Af+I+2016/BEafa9Q8etcNHgO6QmsuzgSlknxe1OjZpDgpzilC/08fIkhZA
7EsnQtt8NakzCuNjdpgVzEMSz7S8UzRvZTuBTlPlQftq0z4wXO6pGn6dZ95pOgIz
27qU8qqvmWYpKNebo+tubXaYYPp28gLxZaw6COXejb6VwNgoIkPEn3Hq0zaPLG10
CyEGqvDmrKAfXgnoE+YskuRXqBfv1VdcuRI17U0pQNE/26h3neV15LUVDOIp8+PI
tPtbyl28HKtGf/+uBD+sP2YjkuJnZdoCNkbbFtYW9wNqlf37IlsO3cJ0mCY2efBq
wMQ7rBLPNzYffMU8BQydtcGegmEthw==
=dwA8
-----END PGP SIGNATURE-----

--nextPart2466515.jE0xQCEvom--




