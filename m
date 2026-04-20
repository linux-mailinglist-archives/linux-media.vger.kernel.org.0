Return-Path: <linux-media+bounces-59130-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIlZEwgL5mluqwEAu9opvQ
	(envelope-from <linux-media+bounces-59130-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 13:16:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DEA429D68
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 13:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5FE4B300C7C9
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 11:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABDA399350;
	Mon, 20 Apr 2026 11:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnZtKkde"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5932345749;
	Mon, 20 Apr 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776683777; cv=none; b=O3Eobf8KFEyqMSXNEl/D6EJ9uCdzOkGTpWgS9Bt/Cu286hGB2UZeZA2lMujnc+WVBGnyz13Zn31270oXi4p/QluHuvNx0KAwj5dW98KTN8lsgFIYM63B9ZRuQccUiHAMjPH5PbLobntuqDyNfkInpxDjB8iBu142n6Jr9HA1cz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776683777; c=relaxed/simple;
	bh=E3LCQG8HaN8tXHqYyryawmIyRQGzMvIjy3sviGum+9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrVIe/2aKV1KzfXuUpYNYnEshoCQmM1XEqwV9LJxhLVmPLXHnMxeVX2M3Nzk+9imeK0xAg/9fuiuY4SJpzE9J5qc71T9wQ+ihazuf9Hd/4YEFtSgNgKTtvSXBpuQOBIxcdiDbYbS7whNqwzlvuPpNBUQ+MJPIRRgtijweyqS4QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnZtKkde; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DE8C19425;
	Mon, 20 Apr 2026 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776683777;
	bh=E3LCQG8HaN8tXHqYyryawmIyRQGzMvIjy3sviGum+9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RnZtKkde+IXoHiqqdX6/cgZKbjGiMKGRxerrJvhNSsGxdDYfIEG6RPHuMYetJSHRb
	 W8uaiwYAqrE+WUwkvGC4RcGb4PQn3lx3FuM9joCA3MRsMlaLxTKpQKUEdGRUiUTEgE
	 RePj60pzWk1GttZXACRCtiOEDMD0NXKD0wKULeJDzoKinHs0EW68l6NPmzc5jJDB00
	 996ig5yBNJ9U0p0TTT0DeTL+AKUtmlieXoFkG3PRaEV+YWg0d5x93kW+7cdn2DO+b6
	 8xGb5mS8SfLBKnpoh5595gRaMvo+oHLxXZRAbvqrB9bVB5RvKzmMLzeqNe9gCZEPFn
	 G/keq3PM3MLQg==
Date: Mon, 20 Apr 2026 12:16:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] media: dt-bindings: Drop starfive,jh7110-camss
 from staging
Message-ID: <20260420-very-cartel-645595ffd1c7@spud>
References: <20260303-drop-starfive-camss-v3-0-8f44c07fb137@ideasonboard.com>
 <20260303-drop-starfive-camss-v3-2-8f44c07fb137@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="90PYsgMjf7E0SKBf"
Content-Disposition: inline
In-Reply-To: <20260303-drop-starfive-camss-v3-2-8f44c07fb137@ideasonboard.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59130-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ideasonboard.com:email,starfivetech.com:email,1.46.188.0:email]
X-Rspamd-Queue-Id: 63DEA429D68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--90PYsgMjf7E0SKBf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 02:54:07PM +0530, Jai Luthra wrote:
> The starfive-camss driver is no longer being worked upon for destaging,
> and will be dropped in a subsequent commit, so drop the DT bindings.
>=20
> Link: https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F2@=
ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/
> Acked-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

In removing the binding, you should have also sent patches for removing
the users of this:
arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: /soc/isp@19=
840000: failed to match any schema with compatible: ['starfive,jh7110-camss=
']
arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: /soc/isp@19840000: f=
ailed to match any schema with compatible: ['starfive,jh7110-camss']
arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: /soc/isp@19840000: fail=
ed to match any schema with compatible: ['starfive,jh7110-camss']
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtb: /soc/is=
p@19840000: failed to match any schema with compatible: ['starfive,jh7110-c=
amss']
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dtb: /s=
oc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7=
110-camss']
arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dtb: /soc/isp@1984000=
0: failed to match any schema with compatible: ['starfive,jh7110-camss']
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: /soc/i=
sp@19840000: failed to match any schema with compatible: ['starfive,jh7110-=
camss']
arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dtb: /soc/isp@19840000: fai=
led to match any schema with compatible: ['starfive,jh7110-camss']
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: /soc/i=
sp@19840000: failed to match any schema with compatible: ['starfive,jh7110-=
camss']
arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dtb: /soc/isp@1984000=
0: failed to match any schema with compatible: ['starfive,jh7110-camss']

--90PYsgMjf7E0SKBf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeYK+wAKCRB4tDGHoIJi
0hIvAP9hKQGG7rJLPjsNy7XSnHE/RaeILkoi5O+cdU4aXry7QgD7BGYtB37H7KRy
ZNbfoktS46J4D4KeEzTXG3pBYxbeAgA=
=wgfX
-----END PGP SIGNATURE-----

--90PYsgMjf7E0SKBf--

