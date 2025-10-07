Return-Path: <linux-media+bounces-43863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C12BC25A0
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 20:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C170234F0F2
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 18:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CEB2EB5A6;
	Tue,  7 Oct 2025 18:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="GHskeJ5i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7632E8B7E
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 18:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860773; cv=none; b=YiUH3b9gJEHku99ItZHHPFn1SmdQEAKDch1xuY4LxklATDNcIuEWfj27cXRJNf1JfVQRRlhtsfEqJwCk2E5qkN+oB+3TNummEYHbd7bjchLGBoZRn4Rz5YJbaNxzuzLojCxK9tGAYwrMWf3bK7KtbksNsWKCTn/isnTZt9akEvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860773; c=relaxed/simple;
	bh=8SHmDoHdQmKTfiI5PMccAlbyA1V46slp40pEW9LImx8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P9ikKv+/KmZKUy3shZIPdOkKs1oD1o3zQMVqafGZo5XVhRXq/iPs2yabBEry+DEexbA5qCEMbLX2WNPieLXwcqFWAeuqgJihElrS/MfL6lNjiNkrlWiI50aLkCBvFy1XLrZwTUR0/CVq76w/OSfNKxZzDT10rOXc9HiG1BFuEEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=GHskeJ5i; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-856cbf74c4aso813589785a.2
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 11:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759860770; x=1760465570; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8SHmDoHdQmKTfiI5PMccAlbyA1V46slp40pEW9LImx8=;
        b=GHskeJ5iOGKUF0EhQL5GEL/fKpWwQO2j5EZT4v+Xghzwol/ZHwKO9XTIDVndG9KvFt
         lpoQvb5UfDCGsrTvZIawsNbC/tBSVgz7zj6kRKw7Dz5ItsuvgwqewY+IhqrfPACLLisn
         f2AIjKn9EQjXiCH4O4orSGZ7NaOL6KmP2884P+Zlzbo0q/AIp4g3jLpg0fa4+e3UjNjj
         rd8q0/rLhx3cTYRl1swLVrvo3Gibnq4bzOW6keffIjCuAPgz6NJJ/MzL7SvTXcQZN6+C
         X7WgxzpKqdCdgNUpYcAQUbOIs02WnasJCbIjfAygCi7mOPTXEJA1RVZkYfQiEL7YSnbe
         Fm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759860770; x=1760465570;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SHmDoHdQmKTfiI5PMccAlbyA1V46slp40pEW9LImx8=;
        b=ty5CBJjUYXnQiZCl2gz7evxI9kNYAKww/Dpf4Kavl4QfO2VIkZTOrbTnKH+Xgph95C
         gt1FkwRp4ZzcYVQ4UcK542FJlCEJuYEe1KYrgeHBCCYd8CunG2XL5MFUn8EqYRp8gkGE
         mPte0oH6jO+55Is1nDMEgJGtJdARLRcgpCL82Jk3NiwznfTknPHOC6eERskJDcAAbc3/
         7JwnZCwbQI7KoyzKwBuH7hFSiQNLkLoKcuA1gr6TZEF7v6EpfGPRatmV6Ov9yXlx+7nT
         q4MYZOjFWrY1HmYZj2sc9Xeg49KbWBveRP7xaQiUwOp8CPtw3NqLFtse6fA2lZxWhvDQ
         vGFA==
X-Gm-Message-State: AOJu0YwPi3nbqCjQhpRWvOa2nZV53pLRIXp70mmrxsYS1YGbh78ufK0S
	LF3/DkbnHC6II6/ztQOIPTq54OuyAROVR8FSsIdcyaWUEJIOolQyDiTqPh07AoCUXN97sCkUdeq
	PqHae
X-Gm-Gg: ASbGncuE8Jsf3wZpAk+Nqs63TOspIRGagRhm9ACZTZyf9cM9GjU3JtqP8F7auteP5U4
	EYrgOpPz63/KLfl9gTP+KdtSKiIzcbcCFtNztVGaXgugPPXeHceQMx0Cl631L6n8X1s4K0p+noz
	bbfdNjiDBWg3+PfYhtxh7CxQGnj2yzQiFiaHhFLCYGwG7KurjWU1RBXMt6YHO9uQAaMKtxkaVLn
	ZAQUP6xVjGbl3Ibyuv+CilmMHbtEfnLEVAKpFQYvxMeCJuSNSAKFsL4fxluYP5Fd9rfQWW7CDgR
	xq4FnkPmnrpqcTVtvQwyxU++aZRGVfUmx68LVx4Dq27kWvsThnzxA40U7yJ0IS9xMmbXYcaSfB+
	6UzC60cGYfxWbd81CEtDaVxlxmvProy3X2j2iyCKrhHfs8XzWaBnM
X-Google-Smtp-Source: AGHT+IFJwiFyqdn6vHfsVW5AqTzfPU59JdPTe9jsCTVyjegINt2FetoGEQEhtGUGJnu4FO7lY33Vsw==
X-Received: by 2002:a05:620a:1a8e:b0:878:671f:7395 with SMTP id af79cd13be357-8835410ff67mr108686985a.69.1759860770343;
        Tue, 07 Oct 2025 11:12:50 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-877794b8c0esm1649064985a.45.2025.10.07.11.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:12:49 -0700 (PDT)
Message-ID: <dd5f934f222116a29ef5ec19a52a9b3ae7433de9.camel@ndufresne.ca>
Subject: Re: [PATCH 13/16] media: dt-bindings: media: rockchip-rga: add
 rockchip,rk3588-rga3
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
Date: Tue, 07 Oct 2025 14:12:48 -0400
In-Reply-To: <c4b0f1d0-cebd-4381-b2c0-20c177c0732c@kernel.org>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-13-36ad85570402@pengutronix.de>
	 <c4b0f1d0-cebd-4381-b2c0-20c177c0732c@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7gUIbCmFrGsfnm1LXQ2d"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-7gUIbCmFrGsfnm1LXQ2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 07 octobre 2025 =C3=A0 17:38 +0900, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 07/10/2025 17:32, Sven P=C3=BCschel wrote:
> > Add a new compatible for the rk3588 Rockchip SoC, which features an
> > RGA3, which is described in the TRM Part2.

Please write something here. You can't explain why RK did this, but at leas=
t
explain what are the differences and additional feature. It should also be =
super
clear through your patchset everything you didn't support, since when readi=
ng
your set, it really have nothing extra implemented.

> >=20
> > Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > ---
> > =C2=A0Documentation/devicetree/bindings/media/rockchip-rga.yaml | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > index
> > ac17cda65191be047fc61d0c806f806c6af07c7b..11e86333c56aab55d9358dc88e45e=
7c1eb
> > faae9e 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
> > @@ -20,6 +20,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: rockchip,rk3288-rga
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: rockchip,rk3399-rga
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: rockchip,rk3588-rga3
>=20
> There is already rk3588-rga, so please explain in commit msg
> differences, including compatibility or lack thereof. I am confused why
> there are two completely different 2D accelerators simultaneously on
> that SoC.

It is quite strange hardware design, but this is really how the hardware is=
. I
personally don't expect an explanation from a third party. Its a mirror of =
the
VOP2 planes really.

Nicolas

>=20
> Best regards,
> Krzysztof

--=-7gUIbCmFrGsfnm1LXQ2d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVYIAAKCRDZQZRRKWBy
9Go6AP9e4y2IiSL2I+67c8y9Mn1TNSV8ucapX8SFj5r6BqkeaAD/ebUK9jFL041m
do23vyGkPpDC61NKSkX4f+0FGc9xDwc=
=HOjH
-----END PGP SIGNATURE-----

--=-7gUIbCmFrGsfnm1LXQ2d--

