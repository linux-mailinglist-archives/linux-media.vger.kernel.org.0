Return-Path: <linux-media+bounces-47122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB319C5DE86
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 16:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1BA064F93B6
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 15:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3549632D43B;
	Fri, 14 Nov 2025 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrzXRK73"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F9132D431
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132182; cv=none; b=Ar5y0rwcTb/WvU+3og0eF8AztGlf5YBi3+QLfx+8fGCessPAYvxrwVi8RIEQxFMI8lIzHE1JLMceAzPacXfTJE6BEurCAv0X9oNsHFmoTO6ZKHgGRavKnWW72J22XV5eMMyYRdOE9aTYaF3rh6N4+OTf5+ZbYkgS8/yQ9nW8wNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132182; c=relaxed/simple;
	bh=8C9FHp7PZ631e2Ybbwogq7Pblu3WU18LYULy9dqpPsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4XIRErJ1xx3U7OdPK1IYpzm3FnA8xeW4a4TykFkpukcfb7XELc3KkLNs5nz19IqnHOkqM+P48wT5f7/nykumf280N4cqPrbgnwsRLHGPr2CnZSJm/cwg6EdLWXVvRuaTaKgVPYCDk4THSv+sHtZjo5RUmV1nBistSCI63IC2k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrzXRK73; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47118259fd8so16042235e9.3
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763132179; x=1763736979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s/9mxyG1LVSxOgn1WKCRkmy+qBsoYVMZn7X9oY3XK/o=;
        b=DrzXRK7309makCRyyckanFU2YCV0LbP+bHzVkskNtEeH0OAG+sRIJAX6BLER8S6CFI
         tqze0a/N5MsVsN5V0pe9c6Za77WJc7mZP5Ig78s5/iJZ5AqTgAgZ3I1EZzXCzTct9RVH
         ClxDL2LG4S64qptAwYmry+CljmjOptdPcADGXKKzEovmWzcNZ4q0oiCuhIrgAYGavj17
         82cWtM8L4MTqJKCblgM5Bmjec6wYN/ZiVWtNKK3HAu/RyEDjPsutxck1Co8GRGTogWdc
         B/8snNSfEbAJkeJPI5ZjsEW+idV9XcJP5FXJMbz+L7KP/u2GWm1JUh1AyHlim5TfqMW6
         nA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763132179; x=1763736979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/9mxyG1LVSxOgn1WKCRkmy+qBsoYVMZn7X9oY3XK/o=;
        b=MkO6hGQq90Wd5jzOZ/WkwQoIuM0MQSV5cN/vYW3QJEntgLAgg5Iz8IueEiwu+HuUoD
         9dUqZSdw2MFkniynBJj1gg4m4gHNnssfUZSKtK3sWcWazSefKt82EcXIiXTi/iOkuLOJ
         K4WRslDLRAJQ3WzET3p23c13lcKOXQG5pQcIoxbEUIju4inZUg9zcGrtJXLWAuSp3V38
         SJibAzF4WxufLZ09zGNvdAcYCb69j49NzmS6A7qxJABfOCWUp2lyLsIg0Zu+YJql7rdL
         aKsEuuAgpq2nQQ+X+uO1Ac8LZYfeFnFjDTDmlMRViKwA5BQRDEd5+KYtvCSN0BCQ0wM7
         bOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnia6u0zwoLfmH48hfYRnj4Ysx3l88uWJTvyM5pozdh+OVeg0c/nURSuyJhNpV0HuWMhIaQY36w+B+SA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo5PCJ+Ucr3qjNXe6VMZW/ZpNYzoj6qXVIB5LBAAMkGziE6J6m
	cSKhgsJY8tSJBLKH5uCY9uYFGBgYqkOSxSuuPzOUxvILRqG+gw8fV9sA
X-Gm-Gg: ASbGncu27YhigIrgKE7ZDIqQquJKACKGsNd3UNng6nZy1HXJp79ysmi32M59Y01HO/7
	qGJGAfyYSwgZARSt2IRFv4SIRVpbz6v8G2vRWUMGv66DeiTdk8bWu4QDY/A+2zww+rnck2ughGa
	VrNj4kEE2ZljF+Q5MZj9z+VseySvp0F5quUUlFahzSBTBo0lbvcrRaNSqK8yYOAnO6ScxscyqN6
	vw1gJ9SbXGOaVKIBwOBoTzW1qlBO2GW9yR3dJLeedFohdP2NFl9w8XaPrvxP5kcJRCGSeLuKa0p
	EYMY+R9iHv/32GbzFMY/tyf7bwPec8eqt0e0HcsmMOxIm5V+XAtU9ChImTQQqtbu8CjFpFlmx2u
	gKT9/UQl7bKgYk4+L2DiNmzIw8XQkzUKH4EzxP6PaKEbteOdQi6ZFiua1pP89K5Tq3ZLueZXFcZ
	ofOkXnHsaCboJemVJkYwaVgX/C3It4mLfVMbgrBcYAXQj4gcl0tE2HvKz9a0+uU0A=
X-Google-Smtp-Source: AGHT+IHH+QDPwizZAqaXOkEIZoWon24hqYUWks1VOVo0gf4ap+2tE/j3QWY4er5Dp7X0/B6XnzFATw==
X-Received: by 2002:a05:600c:4753:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4778fe5ff23mr34390975e9.1.1763132178710;
        Fri, 14 Nov 2025 06:56:18 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm148886025e9.2.2025.11.14.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:56:17 -0800 (PST)
Date: Fri, 14 Nov 2025 15:56:15 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <cd467v5xu6aaxtllfc5awt6sen6jw3u4vdr35ue3x6e5cao6vz@4kjeiwo63tce>
References: <20251022144930.73272-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tqyqdls54xm3etue"
Content-Disposition: inline
In-Reply-To: <20251022144930.73272-1-clamor95@gmail.com>


--tqyqdls54xm3etue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:49:28PM +0300, Svyatoslav Ryhel wrote:
> Document CSI HW block found in Tegra20 and Tegra30 SoC.
>=20
> The #nvidia,mipi-calibrate-cells is not an introduction of property, such
> property already exists in nvidia,tegra114-mipi.yaml and is used in
> multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
> mipi calibration function and CSI function, in Tegra114+ mipi calibration
> got a dedicated hardware block which is already supported. This property
> here is used to align with mipi-calibration logic used by Tegra114+.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-csi.yaml     | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra20-csi.yaml

Applied, thanks.

Thierry

--tqyqdls54xm3etue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQw8ACgkQ3SOs138+
s6Fc0w//YzvvfrnY2oE+gg920G2CSw3rl1e0FAgNvins2Qt8x1QUys+Tr3GyLm3k
k2TYECD1jsXh6dGN5XWZUxY8m0G+pzXgFqZ8jnLRstWRC0I3Vn+nGsbXBUMpbp0F
ogRuV3DGK+9Z3eDBahsQulOIQtRMvM9fMO3csuzI/ql+XCVzwjFzD1yjWkwsgl55
spLXD/YnC2YRd6rB0CbTxKb4CZX7xJm6eFZ0JWAgWdUDemIKLQXEmFIK5ZoqCK/q
PYn9uuFLeebTTLQF5dCuvSGSjoQY+SrVHBPDRDUqFL5m2PQPIWdVIgWPTrQ5vllZ
AkED1KPfot8yoPt0lP97nynkWFaC6jp0aSSKGhNiv3gwunwF1Tzf4KMlwtn/NZhl
jGrwt2CkVE6i0pW2lf6xneM6Kg206eSuCA5Shla69u74LGB0f4+sCfdNfDxg0y4v
24rrOPlNcFrJduCiGW+wgszu3XiR1Uy/l/UlSV505O44uHTRck16zup+hA6mz9Xv
s12707JMhxwtvqNUlvHc5pyu6KU7dgOzG4X3ezHKd/o3Zuxun8ZOtqUsWvhlRrrd
XkLbkt11kNxmCuVgBPxIwLTXSgIDZZxDN641pvWfFUx/sV5QZ8RgObK79ne4d/yC
BvXV19RCcd0c/aYfIaOn92k74QkOzOgFR2h9HOzDlaxTHEY/hFo=
=ETS8
-----END PGP SIGNATURE-----

--tqyqdls54xm3etue--

