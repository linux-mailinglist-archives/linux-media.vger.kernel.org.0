Return-Path: <linux-media+bounces-53609-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBtsKr2XoGnhkwQAu9opvQ
	(envelope-from <linux-media+bounces-53609-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 19:58:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F35561AE150
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 19:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5CB631D642D
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 18:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B318835A38A;
	Thu, 26 Feb 2026 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFAVns0x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219C83C1960;
	Thu, 26 Feb 2026 18:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772131419; cv=none; b=p27eUZKfB7+AmNRUBWYecbtdr5Sbxvlsya7+spiuaOKdcxGp47Vdgid8xr7+aOzmllNgQSid5AVM8fQDjVLOPaCdW8M3bk0Q4X1JrnYllIICh87m/iGoA9OGwC3jL5LPK1YP9+sg5EWEihYGmzi859fjiEiD2AruW6uO63TTHbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772131419; c=relaxed/simple;
	bh=GgM263nGANWRLKxVMqunt8Sam3YSqtNlhozBs8g55Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fchk07hC6un4v34erkrzHA3YBxy+sAUFMQye8QKPGMHGnI4CReVFCMlaTnVDnBo2kDX0Xw9RKI3youLt/z53zuaGxN8Ax57K8w24IU2ErK4cqOoZLhMT6hgO95xN3+QiRDVPh/pDbCqoEAVngKsd5zbmPIoSNSeSDgKLNpkYh34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFAVns0x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4F2C116C6;
	Thu, 26 Feb 2026 18:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772131418;
	bh=GgM263nGANWRLKxVMqunt8Sam3YSqtNlhozBs8g55Gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFAVns0x9ryCBzjBY15Zb1+kXYi1Esaw1OUp/2iu0fBekK7EodMBq4NpO9PiSZRI6
	 86t+6Mqw4HLFI2DOCC2NyE8TP/yKJDAbQfr/1yARXFNymcvEGGy/XTta3dpTfElrtK
	 kOIg4/CPgIRjXAZk2av4DaMinmXFwuehEMMW9alvxXyPb7IAlJhQSW8QEJEYIXzuOI
	 vZR4RO5tqEOLRqluJ72TA4Y9r+Av264PenJv7tnsm24L0h+4swTxuiUM9fIrFo6OG4
	 eTtEBmi+GfRZp3UsleGDy0NB8jJ2Rwp5hhbxz1syGbzjRmdsqhfiFEvMJpXg8tEvfW
	 aqpI8DW/Dj/ug==
Date: Thu, 26 Feb 2026 18:43:31 +0000
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
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260226-salute-threaten-a3eabb232396@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kkAJ0O2ZXkCJsI6/"
Content-Disposition: inline
In-Reply-To: <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-53609-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: F35561AE150
X-Rspamd-Action: no action


--kkAJ0O2ZXkCJsI6/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
> register blocks have been provided for the video decoder unit.
>=20
> However, the binding does not properly describe the new hardware layout,
> as it breaks the convention expecting the unit address to indicate the
> start of the first register range, i.e. 'function' block is listed
> before 'link' instead of the opposite.

I don't understand this commit message or rationale for an ABI break.
Changing the unit address seems like a "free" fix to your problem,
especially when reg-names is not a required property that you can rely
on. Actually, there may be a bug in the driver - it expects reg-names
for rk3576-vdec and rk3588-vdec but the binding doesn't mandate their
presence for those devices.

Deprecating the order also makes little sense to me, given that some of
these devices only have one reg entry, which as far as I can tell from
looking at the driver *is* the "function" region, so it can never be
entirely deprecated.

Confused,
Conor.

>=20
> Since the binding changes have been already released and a fix would
> bring up an ABI break, mark the current 'reg-names' ordering as
> deprecated and introduce an alternative 'link,function,cache' listing
> which follows the address-based ordering according to the TRM.
>=20
> Additionally, drop the 'reg' description items as the order is not fixed
> anymore, while the information they offer is not very relevant anyway.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../devicetree/bindings/media/rockchip,vdec.yaml     | 20 ++++++++++++--=
------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 809fda45b3bd..c513b68d2c72 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -28,16 +28,20 @@ properties:
> =20
>    reg:
>      minItems: 1
> -    items:
> -      - description: The function configuration registers base
> -      - description: The link table configuration registers base
> -      - description: The cache configuration registers base
> +    maxItems: 3
> =20
>    reg-names:
> -    items:
> -      - const: function
> -      - const: link
> -      - const: cache
> +    oneOf:
> +      - items:
> +          - const: link
> +          - const: function
> +          - const: cache
> +      - items:
> +          - const: function
> +          - const: link
> +          - const: cache
> +        deprecated: true
> +        description: Use link,function,cache block order instead.
> =20
>    interrupts:
>      maxItems: 1
>=20
> --=20
> 2.52.0
>=20

--kkAJ0O2ZXkCJsI6/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaCUUwAKCRB4tDGHoIJi
0vUsAQC17KEoZ4NbwOQnXNQ7UeOV0pTQwc+PR0gNyi8SJ+okYwEA8EvoMZh0U7oE
B2SzgGvfagw4afxHel577llDgMmhfAg=
=GLLI
-----END PGP SIGNATURE-----

--kkAJ0O2ZXkCJsI6/--

