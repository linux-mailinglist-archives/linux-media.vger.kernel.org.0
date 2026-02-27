Return-Path: <linux-media+bounces-53745-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF00Id7RoWlLwgQAu9opvQ
	(envelope-from <linux-media+bounces-53745-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:18:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6371BB569
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8C503024EC3
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CCB43634E;
	Fri, 27 Feb 2026 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBdhI7K7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF8541324D;
	Fri, 27 Feb 2026 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772212697; cv=none; b=jSN+4/J5cjHDI8UaMwMx3HVX024XndZ6AyQVwe7iZtEtTT0Acpkb1bm99DHDT3fvkewcYaKNuDU3fFSWf3YQon939xC6lqPvZtiqOzYwwDvpC3gaVfkLRoVjAQlEtK6bESOxl1os0a0077vHLFUtm2vWn0urfFOEXiwd7FhlFPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772212697; c=relaxed/simple;
	bh=3mbceozugLiHmArMcxTVzkMFCimRUS9Tx3RUhhcr7RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ol3kKWQgYoET0BKBcib4x0KqSJX1qhcgRPGrS2JdTrdaJdudx2+rthRzJKEpnh5sFPcLaGr8o3MUv2coFZLmxqF8AhHSSWajFIjAyDqRHelt9oBZr67iLWeczXHF7G9VMSYolEf0ppOWIJUDO3AUXbWT6ZjZz+l7SYwGYR6aXDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBdhI7K7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F53C116C6;
	Fri, 27 Feb 2026 17:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772212697;
	bh=3mbceozugLiHmArMcxTVzkMFCimRUS9Tx3RUhhcr7RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBdhI7K7JLku13dodPnOKu6IfC3mAD5SCrenwHX6d4Wh0WD5tViOVjnQNFBB8kdX5
	 5eSKQNJS0rug5WYOY0XlY2VY5holHW6rCfLhDpEMETbcNV44Mke5rpaqATYd7gFHqW
	 BNq+Kv/p55WVxoFbjkUonlEaFXzdn/lAQIVT97IJDIzyZLRqUnm0sFyByGF/kDYEyu
	 d0llaJbk7xrrsJCPQ7bg9xdM6y/WxBWBG3MGCTDFVU7XviGHHyVghRL9myUjkEeY52
	 TPJ7xGySsRnPgfWLy/3ITaRBFAnOFEM2egTjZ3X/uB3tae1iJsWo7K+A4M9dro1fVV
	 sk4Jqxw7jzIyQ==
Date: Fri, 27 Feb 2026 17:18:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260227-atonable-glamorous-920cfd832bc1@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260226-salute-threaten-a3eabb232396@spud>
 <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
 <20260226-snide-foil-a05e1aa156a8@spud>
 <3d28c699e47f606bad46bb6447785badace37793.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vYHIxUdYf3Z5HD0e"
Content-Disposition: inline
In-Reply-To: <3d28c699e47f606bad46bb6447785badace37793.camel@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53745-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F6371BB569
X-Rspamd-Action: no action


--vYHIxUdYf3Z5HD0e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 04:56:30PM -0500, Nicolas Dufresne wrote:
> Le jeudi 26 f=E9vrier 2026 =E0 20:59 +0000, Conor Dooley a =E9crit=A0:
> > On Thu, Feb 26, 2026 at 02:45:11PM -0500, Nicolas Dufresne wrote:
> > > Le jeudi 26 f=E9vrier 2026 =E0 18:43 +0000, Conor Dooley a =E9crit=A0:

> > > > Deprecating the order also makes little sense to me, given that som=
e of
> > > > these devices only have one reg entry, which as far as I can tell f=
rom
> > > > looking at the driver *is* the "function" region, so it can never be
> > > > entirely deprecated.
> > >=20
> > > What I'd like to see, is a binding expression that behave like a set,=
 not a
> > > list, and leave the ordering open. As people keep repeating, there is=
 nothing in
> > > a binding that assist to define the right ordering (its not address o=
r base
> > > addres aware). That basically means, we can't as reviewer see that or=
dering is
> > > going to imposing using a base address in the unit name (which is a c=
onvenience,
> > > not a rule I suppose) that differ from the vendor documented base add=
ress.
> > >=20
> > > By explicitly removing the ordering in the binding, we create a stric=
t rule that
> > > driver should retrieve this by name, and never assume the ordering, w=
hich I
> > > personally like.
> > >=20
> > > thoughts ?
> >=20
> > Yeah, you can do this, but to avoid potential breaks you have to do it
> > from the start, not after the fact. Probably there's bindings that get
> > acked every day that do do this. Even the retcon is okay to do when
> > reg-names is mandated by the binding and the users use reg-names in my
> > opinion.
>=20
> I think from the above analyses, since the usage only starts in rc1, we h=
ave
> room for improving it knowing we aren't creating problem for anyone. Note=
 that I
> have no idea what the syntax is to "do this", and I doubt either Detlev or
> Cristian have a clue.

I think this is the only bit that really still needs a reply, this can
be solved by adding reg-names as "required" to the existing conditional
portion of the binding. There's probably hundreds of examples if one
does a search for "then:\n.*required:" to use a basis for the change
here. Probably should be an independent change, since it is needed even
without the re-order given the bug I brought up.

--vYHIxUdYf3Z5HD0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHR0wAKCRB4tDGHoIJi
0r6WAP9VK7+6OaP5sOcidYjpySG5XxQ5RJ952PgFal1Lp3jyHgEAuWV27vyRLAcU
T2nCuQzy1OAWqV7CIe2IDkNISVDIuAM=
=MFt2
-----END PGP SIGNATURE-----

--vYHIxUdYf3Z5HD0e--

