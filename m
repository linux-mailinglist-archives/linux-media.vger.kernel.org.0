Return-Path: <linux-media+bounces-64793-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +SsbFsGsLmoo1wQAu9opvQ
	(envelope-from <linux-media+bounces-64793-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:29:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A51636812D3
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:29:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64793-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64793-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75A883003603
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 13:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6365F3A6EEC;
	Sun, 14 Jun 2026 13:29:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578883A6411;
	Sun, 14 Jun 2026 13:29:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781443758; cv=none; b=MMijpg+qethOHbvk5bXoltqLVPVroguNns3TcXHg9tVzYKIZcYH1oB6+kZrkJ2YyRSP+uMx/CXVG9aVCJvFHTOyXE7CQYqZEPoztVgvkD6W5xTG4kk9BC8l+5kCT7dmTW45BPX5xU8frCqYoBft9EmjMuDZ+MOSNlneHJi7Mbuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781443758; c=relaxed/simple;
	bh=IOIWRugL/3SvWihH+OP2mK3CmqU8jMkGJ/HW/FOQaKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcfYay1afH75HI0F0pv5I9S87tFtoTa8HPhxEg0IyrivAbDx7Jx2+RjhjmnhhFvPnp2/Y9dnJ1etwQARJxdNvMv0hPZiLObN2WdN6rZIlM9Arv2oozpZT+7+5FjpVdydQaNVigPZd17K4i4Prt5PutBBmQK073Dt9ZUyGSEDXts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 47CBD37002FD;
	Sun, 14 Jun 2026 13:29:06 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id E698AB4568D; Sun, 14 Jun 2026 13:29:03 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C008CB4567C;
	Sun, 14 Jun 2026 13:29:01 +0000 (UTC)
Date: Sun, 14 Jun 2026 15:28:58 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 4/6] dt-bindings: sun6i-a31-mipi-dphy: Add V3s SoC
 compatible entry
Message-ID: <ai6smn4BnbAIMXCt@collins>
References: <20260613152655.212490-1-paulk@sys-base.io>
 <20260613152655.212490-5-paulk@sys-base.io>
 <20260613-nondescript-sociable-goat-aee13a@quoll>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NSEvN2AwITQmLA/Z"
Content-Disposition: inline
In-Reply-To: <20260613-nondescript-sociable-goat-aee13a@quoll>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-64793-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:yong.deng@magewell.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:mripard@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,magewell.com,kernel.org,gmail.com,sholland.org,baylibre.com,redhat.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sys-base.io:email,sys-base.io:url,sys-base.io:from_mime,paulk.fr:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A51636812D3


--NSEvN2AwITQmLA/Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Sat 13 Jun 26, 20:22, Krzysztof Kozlowski a =C3=A9crit :
> On Sat, Jun 13, 2026 at 05:26:53PM +0200, Paul Kocialkowski wrote:
> > The V3s/V3/S3 comes with a rx-only D-PHY paired with the MIPI CSI-2
> > controller. It is compatible with the D-PHY found on the A31.
> >=20
> > Add an entry with a new compatible and the A31 compatible as fallback.
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >  .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-=
mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-=
mipi-dphy.yaml
> > index 6a4fd4929959..3ca1a1c47032 100644
> > --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dp=
hy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dp=
hy.yaml
> > @@ -21,6 +21,9 @@ properties:
> >        - items:
> >            - const: allwinner,sun50i-a64-mipi-dphy
> >            - const: allwinner,sun6i-a31-mipi-dphy
> > +      - items:
> > +          - const: allwinner,sun8i-v3s-mipi-dphy
>=20
> So that's enum with previous first entry (50i-a64) - same fallback.

Ah sorry about that. Thanks for the review!

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--NSEvN2AwITQmLA/Z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmourJoACgkQhP3B6o/u
lQwV+A/+NkOCmMfOg2YFf5bQKC5plenZLRP17/88N9UXHjsV3ImZ8OtBZjC8y/9q
MzYyACkWYH8Me6BqtOnnWsIhwWZk5dnkibEudFSYZXj6y5XumVtqQY6JuT6fTS7M
+bGYBtH511C/QCiRVSUdV+nh07htVNPouWpDiePOyQxgLRGrXFTjbvX5MAlpiR1z
wld6FnIrX4Scsjs1j2Ow4Ns8ikjQ+TlKbjiErf5PLrqlEgACxcpnpDofDfqNrbBF
wzxJE4QWD3DW5kqxvCKsaFOP8ZqMdlkU0QrH1QCPimrdFlhD8BdkJppLQDLT6+Vw
b9lKj08AwoCZDunrjGBqUPWvsKeHGkWrLGD6ReJP0Pom3t5HSQT0azoc06os6tI7
rqd/BWBSvJe4+efslxM/ptqqqBBn1dRQPqgv46FQDwDh6oIFSeRSCJHn6FcIcxd9
lSTJQLS19oYyiokAu9TBbHfvq0wvLrOytKccxv8e9Uk20ER2X5cInI17KibuAvxU
zy956vSRzj6GG68m8rswA8pwtx4qidemyM4KZMkUxcATDSDUR7KjSWpYWQK7G4bO
BYViglw8xHSVuQCLpKhNk0MghQ//Qx6o+uDmePHmOgkNEQMzXJ8W0URQ94eVkbZC
Lnfbgmtd5fIB7JQgK8fASwIAgprARTW08+bmUxRT4tP4Gt2DukQ=
=7Yam
-----END PGP SIGNATURE-----

--NSEvN2AwITQmLA/Z--

