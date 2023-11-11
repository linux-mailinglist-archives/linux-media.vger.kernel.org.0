Return-Path: <linux-media+bounces-115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 634897E8C43
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 20:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E36F7280F8A
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 19:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B4B1CAA2;
	Sat, 11 Nov 2023 19:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="JR1tpjfL"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E362E1CF8C;
	Sat, 11 Nov 2023 19:06:37 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E173A82;
	Sat, 11 Nov 2023 11:06:37 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id D3E011C0050; Sat, 11 Nov 2023 20:06:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1699729595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0SATLdu8O+1FoZkoCkQe4rgD4RsmkXxDReVEpknUfPk=;
	b=JR1tpjfLrS8oxSDv23LG/WW/B16maQKaOMzsxu/IFmt0G707mUrSFF98ya5Pr6/E3tu4rF
	tbwJIQPTdpccTesxLdF9mP/UCo7w+DWQ6JAlB8mOJJDwOqBcRlig1Kq71G0H8gH01qCFMH
	DJFRYiyTxc5gKg5GFzsM9s5UtuUyQ38=
Date: Sat, 11 Nov 2023 20:06:36 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add prefix for
 GalaxyCore Inc.
Message-ID: <ZU/QvFaDzkLhSAyE@duo.ucw.cz>
References: <20231107081345.3172392-1-alain.volmat@foss.st.com>
 <20231107081345.3172392-2-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HnEnkRRhYmP1yPek"
Content-Disposition: inline
In-Reply-To: <20231107081345.3172392-2-alain.volmat@foss.st.com>


--HnEnkRRhYmP1yPek
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--HnEnkRRhYmP1yPek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZU/QvAAKCRAw5/Bqldv6
8nr/AJ9ZFA6+cDREeD54mI2ioyRe1lSc+gCcCakQIkLS3dqubrmI7H7OnML1zbo=
=716D
-----END PGP SIGNATURE-----

--HnEnkRRhYmP1yPek--

