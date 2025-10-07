Return-Path: <linux-media+bounces-43867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD09BC2727
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 782934E3F1A
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF79F2E9EA6;
	Tue,  7 Oct 2025 18:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="kzchrdik"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB84E205E25
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 18:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863269; cv=none; b=Ssgz2OM6upSZOwO/739UMMRtybWfyFSnzzh+is3myKw9arfTLaPfTbbHW8W3O4vcMJmYA9JRWEi0AaZgMFmxwWeawXC8fwAVfYf8ClxhGqCYOVXgTlzFk432afgc7x6wrVAoljlaTKHrHrLi4+k78sVPHJslXvpOWLf5ol3hhC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863269; c=relaxed/simple;
	bh=fyqYBk39edhoU3hvwcDq4RniKRvu8ih3vY+jGbKyhzg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cfUeib2Oh1ADUe1C+t+UdQK/yc+tQp9TMlqANT6EcZidYCw+4WAfYmbJvjkM7+LAGh8VbfBpu6ewGsQi1noZffgQ1JwSqGr7WGIxIvBuoDgOFMchXls4lt7KCCWeC3PnGYYr0v+gTRjG44QtmDWAjGrt1W6ItqPCwk9iJXsSqcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=kzchrdik; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-79a7d439efbso60626076d6.0
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 11:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759863266; x=1760468066; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fyqYBk39edhoU3hvwcDq4RniKRvu8ih3vY+jGbKyhzg=;
        b=kzchrdikhUv21qCVt4IxSIPMLRVM4SC76uhM2gu6HjFUkhkzfBNFt29NdwLE8K6k34
         Ml2dBZGS1Blztn4jaW/LGIku4raD5T78ksaC3qXXWuuJ0JzfqTaBFrMlsCNXzItRsc5R
         33yZ1igkFNMfeyHfTp8b5avbMKs+n0GVRSUSBMlsk4ciF/MGq0JcJMcSuhpwTqiuhZf/
         zAQzUE4DvbUW+H1sLQT2HJ9r9Y6jDoyqd1fad1d3ZIWlEVmAreM3KSS+bponKXUgFH4J
         TGlfHQyHMP3eLdkA6Dehqjv3SYOFih9Q3XCIMdiENYA390nFQpYiLWP5BjlkWYWXcz8c
         mSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863266; x=1760468066;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyqYBk39edhoU3hvwcDq4RniKRvu8ih3vY+jGbKyhzg=;
        b=hhJPFyjLvF3jabbLZ7vsA+60EWvMs2292pxQna3bpT4nIF7/qkVs5mNQCnOPhSFA9P
         EJgYWy4m8HbA+NXLR3OyJF+Yi6n6nO14ckSkelzXNWoSK+aEem69ckyT0sSgi7jp5e//
         q8EwTWP6PxqezwIw46PJHmezz2sdhvdSp1z+xe3CNFbFDQbANVdh7WayKrN414Ovn5Ig
         egpwZlXXGJ/ee/fpw6cMIFglJqA+nTgp8KJbr1u74br8YZEv2nYWKlexqy794ZC/BaFt
         S05lBjAg78mzQOcLcgHECTQclfkCHYidvEmH7JkTL9a/X5yPBIqO3V0z2At2qCS8oO0H
         6IFQ==
X-Gm-Message-State: AOJu0YwMueOdt5YpIrt25+YJgTQ7icrO9UnW/4xyQYM/OA15QA9CCQG3
	r8iIov+w3f0S52+h1nE83HBr8jXJlbgSH8dZ+xEla/zZc/GGOWK0fSPlNqt6Mrnu5dz1VVFcRwb
	b+BUQ
X-Gm-Gg: ASbGncvDGpsIkcFqwlRzsYXovTc9lmczfSxaj6FMwnUd6t+H1soY8iy76IMuKxdSsPi
	masLBTlm6HUHhONt/eZlld3/8TyoRb1vMt/9Mgvhbbt3O3bgZ8di2XT+/7GQjRUkcCLU1nVVQ/Y
	x2O/5aIseRW3iJoQyS867l0jp15Fx+CkTQrRgvUoE5Lzl2DueG8dZRlFm7JbJA8If7Xdiq3emHu
	JmnrjAT+tCguhtQZHGNJRot5LdmbHvnTXiCGpx4O/xDLIucCAUg10uf6dJmU4gZo+MssWhKcznd
	nA3H89jsRl7KqTLNpQ0HXuDrI8fj2smukVeI1qVBF72i5X0tfIC1WBSXn4lKQ8hz2HCfoMFg+/G
	3vnkxDO9migkXu8B9nthW5uk0ySnGvYW7iz2raKszmGzOV6n3VbKZ
X-Google-Smtp-Source: AGHT+IEixUIOgl0MCHeaJ3U9YoVpppcjNIJi8FhlBiYJXzIZViLBMX0i5qQwH5C+bK/YoahAmV9Giw==
X-Received: by 2002:a05:6214:5012:b0:879:db53:df0 with SMTP id 6a1803df08f44-87b2efe7106mr6252686d6.46.1759863266399;
        Tue, 07 Oct 2025 11:54:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878be61f6bcsm146805896d6.65.2025.10.07.11.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:54:25 -0700 (PDT)
Message-ID: <46a1915e81b027d1c344eed0477683dd3a68d810.camel@ndufresne.ca>
Subject: Re: [PATCH 16/16] media: rockchip: rga: add rga3 support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sven =?ISO-8859-1?Q?P=FCschel?=	
 <s.pueschel@pengutronix.de>, Jacob Chen <jacob-chen@iotwrt.com>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Tue, 07 Oct 2025 14:54:24 -0400
In-Reply-To: <bf989d9f-9e8e-4acc-b502-1674ce215318@kernel.org>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
	 <bf989d9f-9e8e-4acc-b502-1674ce215318@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-I9QXmLgSnsRRCh9PPEnb"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-I9QXmLgSnsRRCh9PPEnb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Le mardi 07 octobre 2025 =C3=A0 17:39 +0900, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 07/10/2025 17:32, Sven P=C3=BCschel wrote:
> > Add support for the RGA3 unit contained in the RK3588.
> >=20
> > Only a basic feature set consisting of scaling and color conversion is
> > implemented. Advanced features like rotation and cropping will just be
> > ignored. Also the BT601F color space conversion is currently hard coded=
.
> >=20
> > The register address defines were copied from the
> > vendor Rockchip kernel sources and slightly adjusted to not start at 0
> > again for the cmd registers.
> >=20
> > Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > ---
> > =C2=A0drivers/media/platform/rockchip/rga/Makefile=C2=A0 |=C2=A0=C2=A0 =
2 +-
> > =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 4 +
> > =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.c | 490
> > ++++++++++++++++++++++++++
> > =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.h | 186 ++++++++++
> > =C2=A05 files changed, 682 insertions(+), 2 deletions(-)
>=20
> Your order of patches is a mess. DTS cannot be in the middle. In fact,
> DTS should not be even in this patchset, because you are targeting media.

Indeed, order is broken, though I do appreciate having the DTS as part of t=
he
submission, this way I don't have to chase for them when testing. That bein=
g
said, a link or message ID in the cover later would be as good.

Nicolas

>=20
> Best regards,
> Krzysztof

--=-I9QXmLgSnsRRCh9PPEnb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVh4AAKCRDZQZRRKWBy
9O1JAQCgbiRyx2yEWIDJARh2LE+kwcz/R5TwyiD48kcAsBRc3gEAj9DcD7rTLpzu
68L0DpQYyIRrsE94HVozLhgCExOv9gk=
=P0io
-----END PGP SIGNATURE-----

--=-I9QXmLgSnsRRCh9PPEnb--

