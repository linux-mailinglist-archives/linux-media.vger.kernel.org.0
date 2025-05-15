Return-Path: <linux-media+bounces-32605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CB9AB8AA8
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 17:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3DB74A1EFD
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 15:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939EA218AAA;
	Thu, 15 May 2025 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dGtn3/ZN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701411B0F0A;
	Thu, 15 May 2025 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747322879; cv=none; b=aKAVMNhJrBexp55w0yYaZQVlE63/CXEQFBvk6oh968CehKqt5lp2h1qV2rsEGm3PzKItN5Cw27Z69+SQ3GH7WJYCBvtM9x8sc2Js3xP6l4boVjqAjpIt1Vb5MQosMmeko2KUa4ohxQzYdS4fvAzvQuPKNG9Wbj0vOlHfwoeuVkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747322879; c=relaxed/simple;
	bh=Lmpw7DwQZw+6+nhCvA/dBvpMC1GiljVTmlLUIpVuZpo=;
	h=Content-Type:MIME-Version:Content-Disposition:In-Reply-To:
	 References:Subject:From:Cc:To:Date:Message-ID; b=gT3TgznMAw4nd6HNkMdGauidiJXYebOm9y8Ka3ElUaxmH2FoHYTXvohbWzdieSzz5PoiQJ85rrzvq3CQ0x5ze/4I1T0+7w99o3IaxR42igMK0bxfKXltojaXv8zRkV5AwXdGnL9F5255lZQ3i8x4QPeGMnh3uSNj179n0iWkWDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dGtn3/ZN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:7a1b:96fc:ca34:4316:6e64:be11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64055886;
	Thu, 15 May 2025 17:27:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747322858;
	bh=Lmpw7DwQZw+6+nhCvA/dBvpMC1GiljVTmlLUIpVuZpo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dGtn3/ZNm2DHe7cgDMbCI7MxHBvKADtla6AEc9EOB9cfY1riDWzZfOOJAvGFahSa9
	 +58REyzjQh6duX5wOHPEtG9v8PMRr5SbrcYVT7MwkgxNlCxhO0xMaGjwrFx4ZqbIEx
	 KZ5E7dA2qwos3nzB5xlcce9yMnNGVapLiIHtinuU=
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============8737441480565818882=="
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2247039.irdbgypaU6@steina-w>
References: <20250515142945.1348722-1-alexander.stein@ew.tq-group.com> <174732159526.2108882.8905658469049267620@selene> <2247039.irdbgypaU6@steina-w>
Subject: Re: [PATCH 1/1] media: dt-bindings: sony, imx219: Allow props from video-interface-devices
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Date: Thu, 15 May 2025 17:27:46 +0200
Message-ID: <174732286637.2108882.17517842559862668158@selene>
User-Agent: alot/0.12.dev11+g1dd20f1f

--===============8737441480565818882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting Alexander Stein (2025-05-15 17:09:24)
> Hi,
>=20
> Am Donnerstag, 15. Mai 2025, 17:06:35 CEST schrieb Jai Luthra:
> > Quoting Alexander Stein (2025-05-15 16:29:42)
> > > Allow properties from video-interface-devices. The change is identica=
l to
> > > commit b6339ecfd0865 ("media: dt-bindings: sony,imx290: Allow props f=
rom
> > > video-interface-devices")
> > >=20
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >=20
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> >=20
> > Are there any driver changes coming for the new properties?
>=20
> No. This is a standard property and is already handled in v4l2_fwnode_dev=
ice_parse(),
> same as orientation.
>=20

Ah understood, thank you.

> Best regards,
> Alexander
>=20
> > > ---
> > >  Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml | 5 +++=
+-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >=20

--
Jai
--===============8737441480565818882==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmgmB/IACgkQQ96R+SSa
cUWirg//c4MsUOhXzsuJ3F00FtrW6D5YeTJU+iyr44Mk+XxdDpjZ7MxBPGOaFOaP
+KyN0VluR58q9NFrDjx1/JROkKMGQswx4+EM8a1OR3SAfaQtpX0EFlwwIYS5vZ8C
evvb4QHJx1ushCdNmZanX7622kZBrpI/DvzQlk/F6/ixNedNqQLN2S/zSQ1IFygs
TBnbgjFewpub0GnoP3clY5gD9qOsVb+Zb0zygGAfJAMxjWE2NhPuSMEMiHcGaHoo
FqdGeFNz6Y/sDnl4DjyGmmLsUBll1gS8Sc7q7/ru5aT2mvZnrckzUaZd3dzAseBd
9hi4eAOmOjvyH15gp47KJKye5yss/WdkZsUuAsSTmmgQ/9UXvyQ91O99NloSjJwN
AluGF/9OEna4hTTcknvm7jXSwqPeDcdrDeCQIDiQNoodeoAFauig4/nCcXqrFR1z
o3El3K5SKuNpli19FDy5aPA4iuiUWRIU54nXos/qHomHe1YBkKu0Df5l+5BxcJiM
Qa6f/f9XPZ6NKnLYPNwPbCmEBHBsLI/zCVw88f8zsATkiFZA59YGPDos8KP7fBv0
1wvdzcnERZXDbaqFn2D0b4drpND5CBKbnireJHIFsxAjzGVr3cdYfIkHf0gNBu4S
loqYJEl53O9JQi2sc9C+i06kAQS5VcCdl5UqhvYnjtolojxQwCA=
=soJM
-----END PGP SIGNATURE-----

--===============8737441480565818882==--

