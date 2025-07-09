Return-Path: <linux-media+bounces-37207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2956AFEA66
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 15:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F8015412BD
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 13:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB25292B59;
	Wed,  9 Jul 2025 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cok7Ru6t"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390841C1F13;
	Wed,  9 Jul 2025 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752068318; cv=none; b=c16SIdn8tFpTaua7FkWDETuD83DbaGWYBRT/fGMU4B0A7rMYye9jCPPZIwVHxrjiNHLmgY7aszTHm89HwJGj/wzvVr17XZHyQ1oA3IhYNFZhoNxALRap5uE/GdPDlcCG401TYgNXHQGRWRVJ8aIxifASIdLhw/8ldUU6jFRuxt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752068318; c=relaxed/simple;
	bh=h8rkgdzFHzQfCXKGB13VqG6DTj3tCT4fvRbPC6Q9TJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpS8BdtiwYWXVFRJ8zCkYMsHN7mVG7ZYMkqezvOGiRnMUcIVwXgw5tn15Agqa1v6AkKDR1qBNXMRA948OrNEoqXdtMHvhY9+A8rWAIehKYtGh+KG29IJeDFX6CgrXHvLYGuqeRSBXtpjUM8ED79ncfQwcUWaFhoZr6G8Z43/GP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cok7Ru6t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEC4C4CEEF;
	Wed,  9 Jul 2025 13:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752068317;
	bh=h8rkgdzFHzQfCXKGB13VqG6DTj3tCT4fvRbPC6Q9TJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cok7Ru6tbwPf8DJ/GhRrPstP/I0zh/TMSe60GW8wNsnXiRyHW+Tf9VR43hFMEXANp
	 nA9yQR+3gGyjumTd2aR31jkaluaCPUfp9OJzMJNGL6iO1bosVebm+gtOam0s3LgviF
	 0qgXZtR5I68ISvW6+7jrDWcLGDJ5eZ1lxF4wInZz59liiDUeFKysL48gZydSKKo/sV
	 RBhFESjNO2O8yASjDhpRyrL3yew7ckHOedOhDO2NYrNdFPmP8ofnTqyxuSr/3hpl/V
	 r9BARdBLahmPKDK4L5U6u/awlc3gw3+s31xuPfGtfv7Y4UgprYL97ykPOEARLt/Afz
	 RKn2Zom/0ZhDw==
Date: Wed, 9 Jul 2025 15:38:34 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Andrew Davis <afd@ti.com>, 
	Jared Kangas <jkangas@redhat.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v6 0/2] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
Message-ID: <20250709-spotted-ancient-oriole-c8bcd1@houat>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
 <49e3fa834aadb37452112bb704a1a1593c1fd0b8.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="t6erlqty7rzkhzhp"
Content-Disposition: inline
In-Reply-To: <49e3fa834aadb37452112bb704a1a1593c1fd0b8.camel@ndufresne.ca>


--t6erlqty7rzkhzhp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/2] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 09:10:02AM -0400, Nicolas Dufresne wrote:
> Hi Maxime,
>=20
> Le mercredi 09 juillet 2025 =E0 14:44 +0200, Maxime Ripard a =E9crit=A0:
> > Hi,
> >=20
> > Here's another attempt at supporting user-space allocations from a
> > specific carved-out reserved memory region.
> >=20
> > The initial problem we were discussing was that I'm currently working on
> > a platform which has a memory layout with ECC enabled. However, enabling
> > the ECC has a number of drawbacks on that platform: lower performance,
> > increased memory usage, etc. So for things like framebuffers, the
> > trade-off isn't great and thus there's a memory region with ECC disabled
> > to allocate from for such use cases.
> >=20
> > After a suggestion from John, I chose to first start using heap
> > allocations flags to allow for userspace to ask for a particular ECC
> > setup. This is then backed by a new heap type that runs from reserved
> > memory chunks flagged as such, and the existing DT properties to specify
> > the ECC properties.
> >=20
> > After further discussion, it was considered that flags were not the
> > right solution, and relying on the names of the heaps would be enough to
> > let userspace know the kind of buffer it deals with.
> >=20
> > Thus, even though the uAPI part of it had been dropped in this second
> > version, we still needed a driver to create heaps out of carved-out mem=
ory
> > regions. In addition to the original usecase, a similar driver can be
> > found in BSPs from most vendors, so I believe it would be a useful
> > addition to the kernel.
> >=20
> > Some extra discussion with Rob Herring [1] came to the conclusion that
> > some specific compatible for this is not great either, and as such an
> > new driver probably isn't called for either.
> >=20
> > Some other discussions we had with John [2] also dropped some hints that
> > multiple CMA heaps might be a good idea, and some vendors seem to do
> > that too.
> >=20
> > So here's another attempt that doesn't affect the device tree at all and
> > will just create a heap for every CMA reserved memory region.
>=20
> Does that means that if we carve-out memory for a co-processor operating =
system,
> that memory region is now available to userspace to allocate from ? Or is=
 there
> a nuance to that ?

There is a nuance to that :)

You need to have the "reusable" property set which is documented as:

      The operating system can use the memory in this region with the
      limitation that the device driver(s) owning the region need to be
      able to reclaim it back. Typically that means that the operating
      system can use that region to store volatile or cached data that
      can be otherwise regenerated or migrated elsewhere.

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/rese=
rved-memory/reserved-memory.yaml#L87

If it's not set, it's not exposed, and I'd expect a coprocessor memory
region wouldn't be flagged as such.

> For other carveout, such as RK3588 HDMI receiver, that is clearly a win, =
giving
> user the ability to allocate using externally supplied constraints rather=
 then
> having to convince the v4l2 driver to match these. While keeping the safe=
ty that
> this carveout will yield valid addresses for the IP.
>=20
> Will there be a generic way to find out which driver/device this carveout
> belongs to ? In V4L2, only complex cameras have userspace drivers, everyt=
hing
> else is generic code.

I believe it's a separate discussion, but the current stance is that the
heap name is enough to identify in a platform-specific way where you
allocate from. I've worked on documenting what a good name is so
userspace can pick it up more easily here:

https://lore.kernel.org/r/20250616-dma-buf-heap-names-doc-v2-1-8ae43174cdbf=
@kernel.org

But it's not really what you expected

Maxime

--t6erlqty7rzkhzhp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG5w1QAKCRAnX84Zoj2+
dp3pAX9+Z09k44eaivapsVKw/NqvekdMSYnQGvkEfOP/NBTjJF5RGakuRbEE73Xk
qKAYEiMBgKsMpFVvSS9l9pFXZtK1LVDJ1XtphLJBeHq/gZxL+5K0t2qMG09CpG18
A+HJas+mmg==
=pWj1
-----END PGP SIGNATURE-----

--t6erlqty7rzkhzhp--

