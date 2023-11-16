Return-Path: <linux-media+bounces-464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6F37EE652
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 19:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D05C31F25279
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 18:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C2646555;
	Thu, 16 Nov 2023 18:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJ9bfFsh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AAEDDB3;
	Thu, 16 Nov 2023 18:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3FFC433C8;
	Thu, 16 Nov 2023 18:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700157695;
	bh=HjxV6+x2Lj6Px1fg9ULk4x8A75m8iN6mtVZGabMGXQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJ9bfFshTtRtYme9oQsx7SO3RvvPwsphorKqsvKtzOsroWpl4VVly10DpNWJhi3Bq
	 vtTRncCwvlyXjlFRb+3aM+AJ6zvuGWeagn+e0G6oeeaDJwfobPKDIvTqJb9ZVg6+kg
	 Ra+k8NC2PpnHDEL03KLMgJNNrauuSvLKSnA+XJ3ygoxIM5vpAs1MEHbeOrfMUeWsi1
	 5LsO2d2Mjxp4wFP8HQEMt4oN/Zhao1/M+JD2IzRdcMfzyu6KSVL4/9xbvtMj+9vp8i
	 macnoWsd+kWEdbpQtOHa5aqL+FzcZM9xiQyw9zPsnpSnnUJCeZ2RLfS27mGKDLL5fv
	 5MfFDp8rF8T/Q==
Date: Thu, 16 Nov 2023 18:01:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Mehdi Djait <mehdi.djait@bootlin.com>
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com, paul.kocialkowski@bootlin.com,
	michael.riesch@wolfvision.net
Subject: Re: [PATCH v11 1/3] media: dt-bindings: media: add bindings for
 Rockchip CIF
Message-ID: <20231116-viewable-celery-c85c856f8919@squawk>
References: <cover.1700132457.git.mehdi.djait@bootlin.com>
 <a0af1d30e79fb1f2567297c951781996836d6db6.1700132457.git.mehdi.djait@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7MtYtqQvBHPj+PRR"
Content-Disposition: inline
In-Reply-To: <a0af1d30e79fb1f2567297c951781996836d6db6.1700132457.git.mehdi.djait@bootlin.com>


--7MtYtqQvBHPj+PRR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 12:04:38PM +0100, Mehdi Djait wrote:
> Add a documentation for the Rockchip Camera Interface binding.
>=20
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>

Provided the undocumented compatible in the example is resolved either
by sequencing, or by swapping out for another device:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--7MtYtqQvBHPj+PRR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVZY+AAKCRB4tDGHoIJi
0nB1AQDrj7ZUQKv1gaJp9ugfqMfxNY7gPb9IvFpcJRAv1EsRIQD/aG49xJLrw6Hu
r91zOYmRs4xFowU/j88DH2aJiDweBgU=
=U6QM
-----END PGP SIGNATURE-----

--7MtYtqQvBHPj+PRR--

