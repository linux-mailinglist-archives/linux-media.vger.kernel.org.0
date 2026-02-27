Return-Path: <linux-media+bounces-53677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDfgCAFgoWmksQQAu9opvQ
	(envelope-from <linux-media+bounces-53677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:12:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBF41B4F86
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4761305873D
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 09:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3703B9600;
	Fri, 27 Feb 2026 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Embk+7Be"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF692D249E;
	Fri, 27 Feb 2026 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183394; cv=none; b=RB8JXmWFv+K946+Gdl/Lwsefrj0IS1v2g/6ociKYJCAaZ5ekKP1+qIJHBd2DlFLdWzdOBvpet0eCFwE3gX+wO6NacCe8eG+R7KUDbpZAHbcMAkTCu0byjnt0RVG+Hn0UvnlANYcq2PxhHQVPhNCfq/jTx96nVXo0p4JIu6/fXIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183394; c=relaxed/simple;
	bh=x286f3Mp4XCBrFvPbHHuGFDa6SzN+2L0b/Rah4ouQhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSjblLFQcHo3SyjLPwr2oTtad2C8tUxbkfzRQhK6nMawIfqSO/ddWn2o4Z/u2BvDCiSnFXdgsGGui83r0VfPx0tDZS4/f02VWLE2wRWhp5grIAgXNUFBooJz8Jmma/U9/u7UdYlRsSP5250WLN/cft+JvKCLcQo4goIIFmX3KfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Embk+7Be; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B3BC116C6;
	Fri, 27 Feb 2026 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772183394;
	bh=x286f3Mp4XCBrFvPbHHuGFDa6SzN+2L0b/Rah4ouQhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Embk+7Be8h3rgcr/CwJ58R7uBXxt/TiEvB2SxDRm4a036pbPnfGPvM77gZrFm5bwj
	 9lJpfLiqvue+mPulypgz6yrFfG+Cr8lNfWRvRqMGvdDk4kwe4IkeWYyeRZJeG3ji43
	 KSONJiLoUKmOQbdE9wOeb9oKTd2Be4vt+4MAj5kYsqNMP+Q4BNVGujtwEtTu6vgApG
	 JD9xSc2RVodMAK3qNxVvKnTnoZDNslqukt+7l2nfLYUzfirnCIPQz7ZZjqFw4a3VIR
	 QTKfp9uDdnd0gq2ZtraLMlR6GQlyh1tRJjKFWNc9a6QSrtntGjQxWgDtUFSNcqfwby
	 hAMsVymVOcQRg==
Date: Fri, 27 Feb 2026 09:09:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
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
Message-ID: <20260227-talisman-confused-ce08d476acd5@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260226-salute-threaten-a3eabb232396@spud>
 <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
 <20260226-snide-foil-a05e1aa156a8@spud>
 <3d28c699e47f606bad46bb6447785badace37793.camel@collabora.com>
 <20260226-ferocious-saturday-0e1f9bb28ec5@spud>
 <20260227-overjoyed-unyielding-mosquito-7bfbe3@quoll>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x2dlAfuzH1dyuK2M"
Content-Disposition: inline
In-Reply-To: <20260227-overjoyed-unyielding-mosquito-7bfbe3@quoll>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53677-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9FBF41B4F86
X-Rspamd-Action: no action


--x2dlAfuzH1dyuK2M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 08:38:13AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Feb 26, 2026 at 10:15:49PM +0000, Conor Dooley wrote:
> > >=20
> > >=20
> > > 	if (rkvdec->variant->has_single_reg_region) {
> > > 		rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > > 		if (IS_ERR(rkvdec->regs))
> > > 			return PTR_ERR(rkvdec->regs);
> > > 	} else {
> > > 		rkvdec->regs =3D devm_platform_ioremap_resource_byname(pdev, "funct=
ion");
> > > 		if (IS_ERR(rkvdec->regs))
> > > 			return PTR_ERR(rkvdec->regs);
> > >=20
> > > 		rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link"=
);
> > > 		if (IS_ERR(rkvdec->link))
> > > 			return PTR_ERR(rkvdec->link);
> > > 	}
> > >=20
> > >=20
> > > Where for RK35xx variants, it only pick the resources by name. I don'=
t see the
> > > bug that you see, but I believe this was just a supposition, that you=
 didn't
> > > check the code.
> >=20
> > Busy reading path of exile patch notes, so sniping this comment only...
> >=20
> > This is a bug, not a supposition, and it's that snippet from the
> > driver that prompted my comment.. That code requires that if
> > ->has_single_reg_region is set that the dts provides reg-names, but the
>=20
> No, the opposite. With has_single_reg_region you take first entry and
> ignore names.

Right, that's of course what I meant, I just a word ;)

> > binding does not mandate reg-names for rk3576-vdec and rk3588-vdec, so
>=20
> Best regards,
> Krzysztof
>=20

--x2dlAfuzH1dyuK2M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaFfXAAKCRB4tDGHoIJi
0hv5AP4/TGZbOVeZ0Wp1eV5S4zHnzu5a4AU6VfD/n3/sb9IhvQEAyl00zdxwl4vi
Sm+5PkjtLK5aV4wt1kV3QbcZQ1yKcg0=
=dqra
-----END PGP SIGNATURE-----

--x2dlAfuzH1dyuK2M--

