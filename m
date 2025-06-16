Return-Path: <linux-media+bounces-35007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7896ADBBD7
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 23:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8645317392B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 21:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B5D218ACC;
	Mon, 16 Jun 2025 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Cd/oy/zH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFC22BEFED;
	Mon, 16 Jun 2025 21:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108790; cv=none; b=W0Ppt94u6Cg2iRAb8fXjuQdVQUFaiv3vUpX4v8hMbgltEFwodxCFAUL/U+uTBvywG7Cc7P5lVN993L4ZVsnQfWVvW2LvWm+1xneGKohS9nIaa+NzD5haL0ZF3YcTH1djYfXNXajknIthF5NtAivbQ3XEcbCGhYgI8qYgQSsuIYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108790; c=relaxed/simple;
	bh=x6V7Wz89+nnBrUFm3+BWloa5RRG+umEIveqscFLOfGk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=irxSrHLRO44tohEepolIHyVE536klJiGZwJdGXz66fS+0oJIwMfZaZGUbTjS2sKR80CKqy6alnQkcvLXHFADsw//Qs3/1fbJdBxez0JN+Dk39rmxwT+N1ct4/wHgU1qdclH6BjWejAuSornAFMS9CLhTOyzyxYV0eF/BC+2gm0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Cd/oy/zH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750108786;
	bh=x6V7Wz89+nnBrUFm3+BWloa5RRG+umEIveqscFLOfGk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Cd/oy/zHDRHNvu4kbHm3+77GQ8CLRXM4oupw8B+XFZOWSWmxAGPOGypbArJo/aQMU
	 xr/krkk9kJ/8nYgUUe9LLup/Ur3Xv8w4EuVHYooykr/s7t8FFQNE0oysYLXH7Nn7IP
	 MWbgxShf21PhfPGQfj5IWgv1Od1iQqhNBA9lz2gFHIvpH41KO9QF6FRNQQNvWmTtTW
	 eluK223Ew1Zh1aAsKE5bCNIVDqSbY+xY7aSu24Z6JCGGqKQiglE03zCAf+a41dQ958
	 cC5o9a1DB5uwnwVJa8NXv++mYHX9XEJiWAjCWisFwObvQWQsmHsAAVbprXwAIWXOMN
	 LsmbfIb87zZVg==
Received: from [IPv6:2606:6d00:17:b699::c41] (unknown [IPv6:2606:6d00:17:b699::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8C8A17E0CE3;
	Mon, 16 Jun 2025 23:19:44 +0200 (CEST)
Message-ID: <699cd8c660c255ab3cbec8760292ee76b8d3660f.camel@collabora.com>
Subject: Re: [PATCH 2/5] dt-bindings: iommu: verisilicon: Add binding for
 VSI IOMMU
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Conor Dooley <conor@kernel.org>, Benjamin Gaignard
	 <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 p.zabel@pengutronix.de, 	mchehab@kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 linux-media@vger.kernel.org, 	kernel@collabora.com
Date: Mon, 16 Jun 2025 17:19:42 -0400
In-Reply-To: <20250616-winter-strict-db98f85db22d@spud>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
	 <20250616145607.116639-3-benjamin.gaignard@collabora.com>
	 <20250616-winter-strict-db98f85db22d@spud>
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-1X+bHapYc8YntJ+olzdY"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-1X+bHapYc8YntJ+olzdY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 16 juin 2025 =C3=A0 16:14 +0100, Conor Dooley a =C3=A9crit=C2=A0:
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 oneOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: verisi=
licon,iommu
>=20
> You're missing a soc-specific compatible at the very least here, but is
> there really no versioning on the IP at all? I'd be surprised if
> verisilicon only produced exactly one version of an iommu IP.

I've dumped the HW ID (base + 6*4), and it reports this IP as an "MM 1.2.0"
(0x4d4d1200).

Note, all VSI IP for which rockchip did not rewrite the register
interface expose a HW ID register, but the from and location can vary.
This one is following the old school H1/G1/G2 style, using ascii to
idenity the core type. Interesting fact too, the register layout seem
to be the same as the Vivante MMU (which is hidden inside the etnaviv
driver).

I'm fine with having a soc specific compatible, just documenting
some fact I could dump.

cheers,
Nicolas

--=-1X+bHapYc8YntJ+olzdY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaFCKbgAKCRBxUwItrAao
HOblAKDSSNkF59KB4kGZlOAZFD3NxiROYQCfe1Bhzq/TIVO3L0sddpC9+dFBmPo=
=HgDp
-----END PGP SIGNATURE-----

--=-1X+bHapYc8YntJ+olzdY--

