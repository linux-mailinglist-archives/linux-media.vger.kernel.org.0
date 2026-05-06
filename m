Return-Path: <linux-media+bounces-60662-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM5rO650+2m7bAMAu9opvQ
	(envelope-from <linux-media+bounces-60662-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 19:04:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 766D14DE8CF
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 19:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12A2A30427E8
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 17:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A5C4A13AC;
	Wed,  6 May 2026 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olmRl9YW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E8040F8E0;
	Wed,  6 May 2026 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087003; cv=none; b=sryyOPAIIz7w5E8fZ+C36uSW/OOpgwwTchz79TTrq8zYQKOrurXVOgVUuSuzP8o7SmHl5oct2ZyAemSxqWv5XkGzl3SqE7H+3/qZdPZime4F71bMiBVicHLZa7H15NqDY7dZFQU+OemKdKBU01+JeLhBuiiM+6PVvEtYGsZx0Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087003; c=relaxed/simple;
	bh=B7/qNq1u3n3ZOcgzC2TWK7t0PKswyuqMpCoMWRqO80Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oqxr+uhi7gdKBjs08MZP7jeAhxfy9UP6VT9z9oaO4T7GinllpxX94rmjA6vVRWvXe1dBwti1M2AlCd0QQIgmhJcoNjTMOW3G51URMWb1/MfgcW0/hBcZ7sl8qZwJG8FjEynRZaiaOBwmc+UKxlvOMVVASUZh1+z57rsO8k+eIRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olmRl9YW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDB7C2BCB0;
	Wed,  6 May 2026 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778087002;
	bh=B7/qNq1u3n3ZOcgzC2TWK7t0PKswyuqMpCoMWRqO80Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olmRl9YWKsrfj4EGWyuH+l3WVviSkLVRVs7D8ANzehr0Va3JdecJ6Pv5rZOqgxz/H
	 K0rTdTl28lAauEQgH+XhUl1l0FkQkx0hPgTnYBB3HE/0oJgyvQB/B385NNw5b1sD97
	 emwPuNeEM7Wb7U9bDpw2TtDgH648iDdClC08y0xLbxLVQVroCoy2/jebNznCfo5QmV
	 R5aYyuBWbKqSe+Azv0Sfp3KlZNAraSzTBg+ieQaJLbXUFwqbRjkIc1RjXIL43S2oeN
	 sGDt6s0IfUsZTc4AE21ucpzOU6b7E3J0h4wFzRUDb+KjwxoMqiMc/LNWz6ato5d/Ae
	 u/RrQaMCT3+oA==
Date: Wed, 6 May 2026 18:03:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
Message-ID: <20260506-numerator-overbite-7b3d5fbd52ba@spud>
References: <20260506064847.37795-1-clamor95@gmail.com>
 <20260506064847.37795-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kQ6ms4uA7wI3gn83"
Content-Disposition: inline
In-Reply-To: <20260506064847.37795-2-clamor95@gmail.com>
X-Rspamd-Queue-Id: 766D14DE8CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60662-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--kQ6ms4uA7wI3gn83
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 09:48:42AM +0300, Svyatoslav Ryhel wrote:
> Document TI LM3559 and LM3560 Synchronous Boost Flash Driver used for
> camera flash LEDs.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kQ6ms4uA7wI3gn83
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaft0VgAKCRB4tDGHoIJi
0mTOAP9TwZaECCAw0/M0scY+sxfOTQWI+Za5hsX1Lp+ytMTycQD8CvtS7xugqPNP
kGL6fLw4mtdAau8iGSR03I/npW15DwU=
=mjwM
-----END PGP SIGNATURE-----

--kQ6ms4uA7wI3gn83--

