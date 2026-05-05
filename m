Return-Path: <linux-media+bounces-60481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G5dFtJU+mlPMgMAu9opvQ
	(envelope-from <linux-media+bounces-60481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 22:36:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E414D3B34
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 22:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C637D302AE18
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 20:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3073D4103;
	Tue,  5 May 2026 20:35:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1610530C35F;
	Tue,  5 May 2026 20:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778013337; cv=none; b=ukF0chSHW2uPxFhdJA5BpKcyzJHjewVaQlkw7X2CpfDR8J4PzMnXOQpO0j7kO2vAAvbezdjAPVnRFymdMg+V1e5H65FSPu+n8HFvmpKXDPmq4/dEhsEb174NDX6K1QPCqYB3DJjvjqu45QGKbrwjTn0xadv0kyzaPMH7DhBCfrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778013337; c=relaxed/simple;
	bh=UXC9+hPU2ndmcK4oDF3blwKtby0Kh/UxqWZqMo0pXNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZlo9m4C+1LwnjT3K0X7MiZeiwN43m07SoRmfIMtp5kP3UWyOhWlVlLbu36Ibae2BKXjutKTKj8NWsxL63aSAw/1RUrEx1500Uttl+j40z7nvb4QL0WGWxdyYCtHKppFE7AmmS4ppEye+XMF3iSp3aUXUdWHchqG05a1J5zQJXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 352BF1F8005C;
	Tue,  5 May 2026 20:35:28 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 965ABB40590; Tue,  5 May 2026 20:35:26 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 2A1DAB4058A;
	Tue,  5 May 2026 20:35:25 +0000 (UTC)
Date: Tue, 5 May 2026 22:35:22 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM
 region for video engine
Message-ID: <afpUiupOgPhLksM8@shepard>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FpfFtflQBQQ4ZJAp"
Content-Disposition: inline
In-Reply-To: <20260505134812.408316-6-wens@kernel.org>
X-Rspamd-Queue-Id: B1E414D3B34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60481-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_NA(0.00)[sys-base.io];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	BLOCKLISTDE_FAIL(0.00)[185.233.101.22:server fail,192.168.1.1:server fail,100.90.174.1:server fail,172.234.253.10:server fail,109.24.234.12:server fail];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sys-base.io:url]


--FpfFtflQBQQ4ZJAp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Tue 05 May 26, 21:48, Chen-Yu Tsai wrote:
> The SRAM C region contains a partial alias to the VE SRAM already
> referenced by the video engine. To avoid access through this alias
> window, the region should also be claimed by the video engine.
>=20
> Add a reference to the SRAM C region to the video engine node.

It feels very weird to have a reference to the DE2 SRAM region in the
VE node. It seems unlikely that the same region would be used by both DE2 a=
nd
VE and I am pretty sure can have both running at the same time without
overstepping.

=46rom what I can see we have so far assumed that the SRAM C and SRAM C1
are two different physical SRAM areas, but this is most likely not the case.
My guess would be that SRAM C1 is actually a part of SRAM C and the DE2 is
using another part of it. The syscon block probably allows switching access
to these different parts of SRAM C.

Also the sram_c1 node implies it's 2 MiB, which sounds quite unlikely.

All the best,

Paul

>=20
> Fixes: b542570e5605 ("arm64: dts: allwinner: h6: Add Video Engine node")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 72ce1a75647b..88c6e3e105c0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -205,7 +205,7 @@ video-codec@1c0e000 {
>  			clock-names =3D "ahb", "mod", "ram";
>  			resets =3D <&ccu RST_BUS_VE>;
>  			interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> -			allwinner,sram =3D <&ve_sram 1>;
> +			allwinner,sram =3D <&ve_sram 1>, <&de2_sram 1>;
>  			iommus =3D <&iommu 3>;
>  		};
> =20
> --=20
> 2.47.3
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--FpfFtflQBQQ4ZJAp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn6VIoACgkQhP3B6o/u
lQz8VBAAkfyeAYZhinUwpsJmf+oDlItFt7Lfusv+8SkH/qZnD6zCrAQk/Geol1rW
wZlYqRlWIV1tboLHrW+hgJmK43/FRZ8zoXdUVBTmn1qlfDX0VtLF2DvHC+uaufyF
4DTP/NfJmIdPOIltCC3FEYzt78hqUzYwwEnsyR+uZ0kPKS8dQyvBoS24LOwnF70g
huYXW9SWc+458Sjd+NVae7vJneQsx8xrtafjkfPP5Zx2PdYmMTsGPxuBNgLa2CiA
TvtW1mzJtP2egSTdCfzIJRVCdQ6w9/lYvQoFQfz7U+L+MwpB8U7g3yU7sbIEEBwz
1RzbbYTvHm68D95/Qb4wkxEPXPw/HTD5Hy3iHdw6JLz3VOXvvQapTbOQqADL7SqD
6HE8NxgGcLLVMO6P3Na0l+nu6AyuXnou5x99ukr1lQYNAVeUCcq4CpN6GV9/Tgq+
5ZcTzVFJqD2RJfdPbuljaRgWU5i7fUk1QX0QiNmW+m84Kg5e+wkzf/TB1E5JmypQ
w4d8oYb059s57puI8NZgwHnyhoLu3HB/NhjboHLcuwzcbgY6PMq68lqazv6qNY/p
bvQU0TQ/2HwBmCtQT7dIn1ShT5xfo0cu3qpl0bHH9iKBcnXCjdGGqmrNliwBIhta
5rW/eK5LQyKRXSSg3mKHjITNERBpiraMB65z3LMKUrE/UHivWxA=
=03GE
-----END PGP SIGNATURE-----

--FpfFtflQBQQ4ZJAp--

