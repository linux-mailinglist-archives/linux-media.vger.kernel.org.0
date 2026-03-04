Return-Path: <linux-media+bounces-54548-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCGLCfiyqGlawgAAu9opvQ
	(envelope-from <linux-media+bounces-54548-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 23:32:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8E2208A46
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 23:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4409630EC559
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 22:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C21639658E;
	Wed,  4 Mar 2026 22:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+GbCzwk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC53101A0;
	Wed,  4 Mar 2026 22:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772663399; cv=none; b=f7fXHVMlNZNZvEGQn1y/xB8vyXoAkI8N0IWclAe1bO5KLqthjEhenBg8dVSXwUjvhtS0oEfFxhPTUl+j/N6wG0k8eYdNYYiYYsxGR8OLX85e8lSydWq1F0Cu0Px9H6Tor5q8DNdJUpThuXgoLfYqdZstMohN3qsS3sRmPyHnxEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772663399; c=relaxed/simple;
	bh=3FJZfyaoW2n8+C7MJpN0vluz5q4yQ6pJg7+9Bbmp5R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5RxmCW6io5OfgdsfIiK15G12A2Qmst15MuwB7++/e8PX4NmOeBR2QlHnQfDidHCvfNGjOqEHtHhiTk1np4/CXQtGRja6e/IvR3zLK6TmbGl3AlOhEb8nT8WV1Z6G4O1eViNMVeVDcKASmif3BU7si1HCOjrq1yUZrlHrCKfeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+GbCzwk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EDCC19425;
	Wed,  4 Mar 2026 22:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772663398;
	bh=3FJZfyaoW2n8+C7MJpN0vluz5q4yQ6pJg7+9Bbmp5R4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+GbCzwk4GlVqiwIPJABB76mXAR3wqrOTfo1lvjjpnv6x7zylGb9wHz43E5HJIS0j
	 CssMiOArG4aJlhv/fi7LrqOgNk5VQKkroK8s/8C7AkbmAaXp9sUPmhwmMgup/GuhR3
	 L3XpZkQR/xulaKOzP7hqWBYhkZWOx2h1fhRxLd33uccA4TuAEhXlR0fzEDSeAtgaU2
	 SSw9Y+SOrk7ezmNWfWuBskZ5X4H71k+afPeF/8H5Z6zRMhLSWUbBuKqh463mkiJ53e
	 7m/HWWVxFipET9XJ9Gjdr02ca6tGpQdSxx7itamHhwy3DDDUaq6UBu+euMBheufV9O
	 ehROkvxXwqSBw==
Date: Wed, 4 Mar 2026 22:29:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 1/4] media: dt-bindings: rockchip,vdec: Mark reg-names
 required for RK35{76,88}
Message-ID: <20260304-stack-marbles-c788714a116d@spud>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
 <20260304-vdec-reg-order-rk3576-v5-1-7006fad42c3a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3FZK3G5ptjaGHPxj"
Content-Disposition: inline
In-Reply-To: <20260304-vdec-reg-order-rk3576-v5-1-7006fad42c3a@collabora.com>
X-Rspamd-Queue-Id: 6D8E2208A46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54548-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,collabora.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


--3FZK3G5ptjaGHPxj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026 at 11:00:40PM +0200, Cristian Ciocaltea wrote:
> The Rockchip Video Decoder driver expects reg-names to be mandatory for
> RK3576 and RK3588 SoCs, however the binding does not currently require
> the use of them.
>=20
> As a consequence, driver would fail to probe with a hypothetical
> devicetree that doesn't provide the reg-names for these SoCs, but which
> is otherwise a perfectly valid DT from the binding perspective.
>=20
> Update the binding and make reg-names required for the aforementioned
> SoCs.  While this change introduces an ABI break, the expected impact on
> potential users would be minimal, if any, since the old SoCs are
> unaffected, while the video decoder support for these newer variants in
> mainline driver and devicetrees hasn't been released yet.
>=20
> Moreover, this is also a prerequisite for a subsequent binding update
> introducing an alternative reg-names order, according to the
> address-based listing in the vendor's datasheet.
>=20
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/all/20260227-urologist-gratitude-7984733f=
2d41@spud/
> Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Video=
 Decoder bindings")
> Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video Deco=
der bindings")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3FZK3G5ptjaGHPxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaiyYQAKCRB4tDGHoIJi
0mAVAQD3bq2yM/By7Zecxq5OzU8kDn07EEIF/g5RIu7wrl4UsgD9H1u53E7eYcZi
Q2t9M8Kv1f4EBbnxZmdj/4yTVs7csw4=
=axN/
-----END PGP SIGNATURE-----

--3FZK3G5ptjaGHPxj--

