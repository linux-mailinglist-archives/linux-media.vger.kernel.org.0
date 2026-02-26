Return-Path: <linux-media+bounces-53638-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPLeKSfGoGnImQQAu9opvQ
	(envelope-from <linux-media+bounces-53638-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:16:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D01B0415
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C83930518F4
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 22:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63CA37B40B;
	Thu, 26 Feb 2026 22:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnePZCv6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4935E1CAA6C;
	Thu, 26 Feb 2026 22:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772144155; cv=none; b=mf8fff+33lqIV/Cs4WMKsvaDLkJ1L0sIKg1Cya1BlPWkrVbkOCNEJ4PCYOxcfnOz9sGGA78a2mMJSK0SN6MzrYn/Hke/2WAoFaTalhLECY9SeF5wKVVP1q0nzVnZJyMNKv89Dps5HXcFhYunzGfFdJWWh+69d8lDzUCFMKFV95E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772144155; c=relaxed/simple;
	bh=RwM7wj3X9IEFP39jnJS9/0+Jh+WbGtD7RfWDnrAgGVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTnRE9Y3+eowzzl6RvinmNRmIo35UIEtPZkPLMI+LRxrMD6dtFTkCUAEPKwGGzoCEDXC9qjmwaNzjKztWFjYIubeqfizPN4XQSSebSYn0n1lgjs7wc97zeo2wMMAnktWCemP5eD1X8h3whgN5z6oh6b38RQO/RvqSbeIp0BQBeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnePZCv6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00733C116C6;
	Thu, 26 Feb 2026 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772144155;
	bh=RwM7wj3X9IEFP39jnJS9/0+Jh+WbGtD7RfWDnrAgGVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnePZCv69sjUeRVSamQ23hxl1GM66e3Hlxsr1z8vhYd0ZAd4KfGZ0no71gFW46FSk
	 W8T09ri+jNX48moO+XyEZgMAcEVM792EXIVSnVxKYE+k5jsE19zLOcbW1qfMDqII6y
	 3A1jLsGdcMeMNnr3zyrgqbwa/zYcLiU2d/eDDOA+p4hxnaIBDrHSbrA2j+VrFmCNvz
	 7TLdR6j6L4pykDQ7D37Jq/4/I52hPX2u8EWQCrqP0DF5HeYW6bIEingt42qGs7sq4C
	 LwWjvrojgPDFYcxv2LpS6+G/kA1PyDtdKPX0PJcxl5lvCmUvnPrx3wQHCAv735RXwp
	 VJze4FZgtsifg==
Date: Thu, 26 Feb 2026 22:15:49 +0000
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
Message-ID: <20260226-ferocious-saturday-0e1f9bb28ec5@spud>
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
	protocol="application/pgp-signature"; boundary="Mr1yXoVEYhQ07KkC"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53638-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 601D01B0415
X-Rspamd-Action: no action


--Mr1yXoVEYhQ07KkC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 04:56:30PM -0500, Nicolas Dufresne wrote:
> Le jeudi 26 f=E9vrier 2026 =E0 20:59 +0000, Conor Dooley a =E9crit=A0:
> > On Thu, Feb 26, 2026 at 02:45:11PM -0500, Nicolas Dufresne wrote:
> > > Le jeudi 26 f=E9vrier 2026 =E0 18:43 +0000, Conor Dooley a =E9crit=A0:
> > In this case, the driver is currently buggy, because, as I mentioned, it
> > uses reg-names without reg-names being required on the platforms with
> > more than 1 reg property. Probably the binding should make reg-names
> > mandatory for these platforms even without this patch, but it *has* to
> > IMO for this proposed change to be applicable.
>=20
> That forced me to check the driver. So for RK33xx and older, there is onl=
y one
> range, and the driver will just pick the one entry expected:
>=20
>=20
> 	if (rkvdec->variant->has_single_reg_region) {
> 		rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> 		if (IS_ERR(rkvdec->regs))
> 			return PTR_ERR(rkvdec->regs);
> 	} else {
> 		rkvdec->regs =3D devm_platform_ioremap_resource_byname(pdev, "function"=
);
> 		if (IS_ERR(rkvdec->regs))
> 			return PTR_ERR(rkvdec->regs);
>=20
> 		rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link");
> 		if (IS_ERR(rkvdec->link))
> 			return PTR_ERR(rkvdec->link);
> 	}
>=20
>=20
> Where for RK35xx variants, it only pick the resources by name. I don't se=
e the
> bug that you see, but I believe this was just a supposition, that you did=
n't
> check the code.

Busy reading path of exile patch notes, so sniping this comment only...

This is a bug, not a supposition, and it's that snippet from the
driver that prompted my comment.. That code requires that if
->has_single_reg_region is set that the dts provides reg-names, but the
binding does not mandate reg-names for rk3576-vdec and rk3588-vdec, so
the driver will fail to probe on a dts that the binding says is valid.

--Mr1yXoVEYhQ07KkC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaDGFQAKCRB4tDGHoIJi
0uKRAP4hMTk5j57Vmq3lgRE2N4Yj1vk27N9x3YrJKFz1HSxaAAEAtUSUKVKVlXrp
DShB3ZBQLupX2wlwrHW/Gf7VZyiStAA=
=e9ND
-----END PGP SIGNATURE-----

--Mr1yXoVEYhQ07KkC--

