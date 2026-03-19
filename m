Return-Path: <linux-media+bounces-56340-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J1CAYkLvGkArgIAu9opvQ
	(envelope-from <linux-media+bounces-56340-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:43:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 711D12CD133
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0304D3046D97
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A372C11E8;
	Thu, 19 Mar 2026 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2kuo2AK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A46F3D47A9;
	Thu, 19 Mar 2026 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931112; cv=none; b=pO1m6xS+kv3EC/T7fr6QPyxfXTkwYKO8Xixdghgcaimtp4FIZcYw5TqnNthDvYmtpe/g+mnY0p4B+Vw93pzi24syOskg3WhHQAd0kHY+P4GLfJ8l59KCUxi2MDU4qU/y1IkyXBCdIn66I3T743M9LFFPlJ4dkeiCT6OiS69m/RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931112; c=relaxed/simple;
	bh=xVDCvmHcqvISvprP7lO7W6ddF7WUVJ7W2Df/HLSX/ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjsBq5fsyZUGyQo5gE22UtJUU0tLWzd4Y8ZiytwHeNXAt9GEHcpk/G0vorJC3qcFrpIzTbl7z6Q16JYvMqGCBQEOR8w3aFESvZlysCW2M742bdOfWkh8XfiPwIxLnyIiF7kwLjV6S3t4X06wlB3aFKLxVePBp1s7ajD5Su0LrCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2kuo2AK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF48C19424;
	Thu, 19 Mar 2026 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931112;
	bh=xVDCvmHcqvISvprP7lO7W6ddF7WUVJ7W2Df/HLSX/ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2kuo2AK5XKO3e1cpuhsJqbCb932nj+lOW/XRoTa5IcwOsYufpH27/bdev1IWsa1u
	 06RQxeQl/XeWFQgYAWyGwcW5uMHorjRHwCOYXGGMdK/H0mukpftjtUsvYkwmn3yiAc
	 WYOMz4kGTBIc2VNAKd/AEq7K/U7FFGzBaAY3bVzq/lvRzUn9/3mNktUBWDHKNyClte
	 e/ZljoGXAcB0WQ/oNTRV2y2l47eqZ+AS7p4psAhMwF017vRcEWhUqAk79CkKh1WPMf
	 4aBY8Jhk7/iXZhtfBoeGcrpQQfT8t5vpZ5igasBjHvm57milfLFqCtehtwcTcSAJ4m
	 CuiVgcEZPVTYQ==
Date: Thu, 19 Mar 2026 14:38:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/9] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260319-unrobed-simile-1c1393962ff9@spud>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-2-77de5ee9048e@collabora.com>
 <20260318-mumbo-lumber-b550932a5423@spud>
 <d9a9be92-7439-4899-8be2-adf7f0490790@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gs5QsPffFgv1KN45"
Content-Disposition: inline
In-Reply-To: <d9a9be92-7439-4899-8be2-adf7f0490790@collabora.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56340-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 711D12CD133
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--gs5QsPffFgv1KN45
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 09:04:06AM +0100, Michael Riesch wrote:
> Hi Conor,
>=20
> On 3/18/26 18:52, Conor Dooley wrote:
> > [...]
> >> =20
> >>    resets:
> >> -    items:
> >> -      - description: ARST
> >> -      - description: HRST
> >> -      - description: DRST
> >> -      - description: PRST
> >> -      - description: IRST
> >> +    minItems: 5
> >> +    maxItems: 9
> >> =20
> >>    reset-names:
> >> -    items:
> >> -      - const: arst
> >> -      - const: hrst
> >> -      - const: drst
> >> -      - const: prst
> >> -      - const: irst
> >> +    minItems: 5
> >> +    maxItems: 9
> >=20
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: rockchip,rk3568-vicap
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          minItems: 4
> >> +          maxItems: 4
> >=20
> > Anything here that repeats the outermost constraint should be dropped,
> > so no minItems here..
>=20
> I already took a look at similar VICAPs (e.g., R3576) that will have
> more clocks. This is way I left this one in here.
>=20
> But I guess I will remove it and add it again when e.g. RK3576 VICAP
> support is added.
>=20
> >> [...]
> >=20
> >> +
> >> +        reset-names:
> >> +          items:
> >> +            - const: arst
> >> +            - const: hrst
> >> +            - const: drst
> >> +            - const: irst0
> >=20
> > Were you willing to reuse "irst" for the 0th irst, all the repetition
> > wouldn't be needed. I assume it represents the reset for the port at
> > address 0, so it wouldn't even be a different meaning on each device.
>=20
> Not quite I think. "{a,h,d}rst" are the same on all variants, then there
> is "prst" and "irst" on RK3568 and "irst{0-5}" on RK3588. So I thought
> that writing it out explicitly for each variant is more readable (even
> though it may need a few characters more).


Ah right, I didn't see the prst one somehow. Ignore me so.

--gs5QsPffFgv1KN45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwKYQAKCRB4tDGHoIJi
0vI1AP9iqd2CvDCVFRnFVh5XA4+IKjf2bhkzQrjtjDQ4SFrupAEA+VRt+iWztoun
oOwvNknPS9jj2rDN9dV2GlO7x5HP/wU=
=of5J
-----END PGP SIGNATURE-----

--gs5QsPffFgv1KN45--

