Return-Path: <linux-media+bounces-44010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E8DBC64C5
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 20:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D94474ED542
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 18:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F70B2C0266;
	Wed,  8 Oct 2025 18:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nngdbMij"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01E51F9EC0;
	Wed,  8 Oct 2025 18:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759948322; cv=none; b=DTXngoUtifp7r89ypB3CU1w9uM1HthrzOqg1+7xeyYvlNKLNlTfSvYwIs2KhNfv4nE4P6zfQEnEQOkKx4yy3cMse87AUH+/oKidFYTj/lUTEwyTDXTSLrxhA5hB3J3IxfCogYtdhNt296rwcryWCU2RcnxllVimsgFCbIdJHscQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759948322; c=relaxed/simple;
	bh=zjfI3cT6XpuNthAHqE9lJ20tHJKopUN+mYVX+mKvdT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbZTa5pfAYD0iPjsWQQcoyLiuYK88VZ6B3lOugt3iTgU88UANTHf+unjoN/pqxs++vf9mzec77BUMzPRBQzwUPQ3DksY4H2nLqEv3vlfs4/WOapMYdvzmjSpaIy4NsS+uOgoL7SoOKDwc/JQNEH5f8Ei3VeEbwxOj48ILsw6Ww0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nngdbMij; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5A6C4CEE7;
	Wed,  8 Oct 2025 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759948322;
	bh=zjfI3cT6XpuNthAHqE9lJ20tHJKopUN+mYVX+mKvdT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nngdbMijs8uXyMp1NfkgvNumGBhbp1KLwQyOGruB8EhbVd1YmcY3E7BuTtju65bAS
	 aIIdUWA1Vm/fi2tND5zLoHik12qzjiFKZZHnW3zyP/KjOmBFbOQf0T0YIh9qwh4XDQ
	 Ub4GMghl7WQrVyTxn7D2tQtUEp6YT+5uHQKSGc2fDtmfPztc6IrrLbj4UzubUXSVbF
	 L9LuK9Uc9PL+psT27tKQo4sXOq3YmpK/73jQSVz27dbpmTgbrwREdW0Qxw5w5MyzXw
	 i5KVsVACc8T+sUdzxCd42r+m+YRkPQbbBgtJsfRwNxBcep7dscOiK1tXFDyl8iCe9z
	 9ZaWaDgFvYlsQ==
Date: Wed, 8 Oct 2025 19:31:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	mchehab@kernel.org, robh@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: Pinefeat cef168 lens control board
Message-ID: <20251008-pushiness-underwent-a1f0450a933f@spud>
References: <20251007-obscure-thrower-1afcdb23c4b8@spud>
 <20251008175036.8314-1-asmirnou@pinefeat.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4A/UAkBy/5jCNeOP"
Content-Disposition: inline
In-Reply-To: <20251008175036.8314-1-asmirnou@pinefeat.co.uk>


--4A/UAkBy/5jCNeOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 06:50:36PM +0100, Aliaksandr Smirnou wrote:
> On Tue, 7 Oct 2025 21:47:29 +0100, Conor Dooley wrote:
>=20
> > I acked v5, any reason for not applying it?
> > https://lore.kernel.org/all/20251007-geologic-epidemic-2f667f232cf6@spu=
d/#t
>=20
> Yes, the dt-bindings patch can be applied.
> The v6 series does not change anything in the dt-bindings patch - only
> another patch in the series was updated, so v6 was sent.
>=20
> Apologies - I wasn't aware that an acked patch could be omitted from
> the new revision.

No no, it's not that it should have been omitted - it's that you should
have applied my ack on v5 when submitting your v6. I guess timing worked
against you because I sent it like 20 mins before you sent v6.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--4A/UAkBy/5jCNeOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOauGQAKCRB4tDGHoIJi
0n3OAPwPtoCJt3+n5CKu93TMblbrmlbdm5GBoTh5R9LzayCONAEAyrNirGTS2fH+
y3kmfeUNwSg3xU+RdP3VctXZItzZBQg=
=oh8E
-----END PGP SIGNATURE-----

--4A/UAkBy/5jCNeOP--

