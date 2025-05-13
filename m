Return-Path: <linux-media+bounces-32405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D40B4AB5795
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89B7219E3ADD
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5CE1AD3E0;
	Tue, 13 May 2025 14:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIfVpoi9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A0519CC3C;
	Tue, 13 May 2025 14:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147826; cv=none; b=K52ItSjNChuqAtoyX2F5r2D0HQ1o34/SdPZ0g+abG3qM/TyMOx/Nqv34gquzJdztYeh/ACos+8PqG9yOmQ39UfZbhSJngDSIClRu8ZmfOWY3FU+pNnNM72u15j0PVFSIQ1DA2TP+LdwSV2UAOrILtQlRwb2KCzGInqZDoWWMUe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147826; c=relaxed/simple;
	bh=8nE/mVj/5tKUiVMPvMi5ed3vQ2RYq7H69J2WfDO/NH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkDqFop1WxKNSEW7qlKu5+okopspcuK2RCHNi+TzDsHY7GI/Rw4LP1CT8fRqD9trZUwHXH8Wbf+hmvEUHbpeu5HQuUGLupVyjw4o+82wCq3NqxSFmXFIL5uWjbraX/B2a0paZe8To0e/M9hd5GLcyHdxr3lGiTKleK3vRDj+nJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIfVpoi9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD58C4CEE4;
	Tue, 13 May 2025 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747147825;
	bh=8nE/mVj/5tKUiVMPvMi5ed3vQ2RYq7H69J2WfDO/NH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIfVpoi9JN7QI4JV7U4pUtfMbHMPXh1b2t4m4qidr/lxq/XZeodRhjeJPGM/bQIYv
	 kb75Dge9taXUs3KGjG58XrPsN+AorUfLlB5AjfvsMNnrvCkWTFzWToWtJIHNZwckpD
	 8vk62piL6MYLZZuTNt0w+ja6W7QxBqLbNTn89gWAjMttnIVi8rAND7H7K6RJRfa6aG
	 4ds0VXhgrm3nof11lnuI4k1fUaAhwta1B6goCvij1M9h30ji+jBc2/piX/Dq+Q/Lbi
	 r8EOl5VtBXn1LG0N5kPUMxJeclhqddxcYGAm4x8nA5Yy7DKIhbBH8vINcPoSHxou27
	 hjsg9UVcnk8OQ==
Date: Tue, 13 May 2025 15:50:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>, Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH 2/5] dt-bindings: Add vendor prefix for allegrodvt
Message-ID: <20250513-varnish-subtitle-0421b30a9626@spud>
References: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
 <20250513083609.328422-3-yassine.ouaissa@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b0tNX6rinjYvhaZl"
Content-Disposition: inline
In-Reply-To: <20250513083609.328422-3-yassine.ouaissa@allegrodvt.com>


--b0tNX6rinjYvhaZl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 10:35:47AM +0200, Yassine Ouaissa wrote:
> Add allegrodvt vendor prefix so it may be used in future device.
> compatibles

Why should this company get two vendor prefixes?
I don't see what is wrong with the existing one, sorry.

>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 86f6a19b28ae..90bc1ec721ed 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -81,7 +81,7 @@ patternProperties:
>      description: Aldec, Inc.
>    "^alfa-network,.*":
>      description: ALFA Network Inc.
> -  "^allegro,.*":
> +  "^(allegro|allegrodvt),.*":
>      description: Allegro DVT
>    "^allegromicro,.*":
>      description: Allegro MicroSystems, Inc.
> --=20
> 2.30.2
>=20

--b0tNX6rinjYvhaZl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCNcKgAKCRB4tDGHoIJi
0iWkAP91CM1tZScImp5J6RFXp4KtN1OSuAzTfgl5VQeyhWZF4AD/Q45N6Gl3PSLD
FzOuC6YGTfwPRbuUyijgHc29uXAKwQk=
=dDyk
-----END PGP SIGNATURE-----

--b0tNX6rinjYvhaZl--

