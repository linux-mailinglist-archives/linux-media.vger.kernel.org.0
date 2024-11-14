Return-Path: <linux-media+bounces-21411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD599C9214
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A3931F23AD1
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A9A19EED0;
	Thu, 14 Nov 2024 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tr3txAoX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECBB1487CD;
	Thu, 14 Nov 2024 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611089; cv=none; b=PeXi8YZw+nqka3wS+La40WBYsbY5e5w4z1dVeDI+U3xBRyXJdWNAFsKHk4IRvkHNm1+fI2ealJ1Q1UlGk81RfC2f0jUMRXVjvHCfWiTAxfaY6EGMqRNHFcEVnCus73AVZfPL/fS6dMp2FpTk2Fk4flWouHWJ1hB0eo95aDkW9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611089; c=relaxed/simple;
	bh=BO0ocrdM8qppSqW1SjWnEfOdpwdtAHOAMkaqKecG0Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9ejgApOOJJPXwpSYPsil96jseJQl9fMIFPNttcb16/8Ln3kQT4swN5nrykbpTANSf+h5kwGcHUsXX5kVd9mCMnLMWcwT//XcnULLJxyJcbPneEQ8VDFy5ZsDJsJzQPhTu3icqMdnNZr5wPGn4Pp/13W1PC398kTHiIAa6T6cuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tr3txAoX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8297CC4CECD;
	Thu, 14 Nov 2024 19:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731611088;
	bh=BO0ocrdM8qppSqW1SjWnEfOdpwdtAHOAMkaqKecG0Lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tr3txAoXtAXT5bN7zR3CtuwXVxxigCyNCfYdRUHQbWfKrqZ61Rg927F8rtYckWtYo
	 k/k4qWwcpmnltWeU8AftQe0dN2t5V2o7lPTQgysNsdn/8C05fE+xW0sSqx4wE5Q1Rb
	 sJxsDsR+qsXa9ge0klkjXIxM/oJtejumsMwhQ9FotePswtU2W+pgYOEVfISQN9YqDc
	 QGCXpGPBJYBVVMJXL9/whHMlPx/n4ukWIP8FW4ih9SMYLc0dBVcPjN/KFZUUxKIsS4
	 80AtBvFtHXF6DWKOQMOgTVvgjYw9heELRrvTvV6Rs7Jl0mpphqq6xoH3xCWwN04KLo
	 1LEfksIezO9iQ==
Date: Thu, 14 Nov 2024 19:04:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: dt-bindings: media: i2c: Add IMX462 to the
 IMX290 binding
Message-ID: <20241114-affidavit-granola-ee8a7bb76d35@spud>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-2-c538a2e24786@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UJbfj84JWYiL4PQf"
Content-Disposition: inline
In-Reply-To: <20241114-media-imx290-imx462-v1-2-c538a2e24786@raspberrypi.com>


--UJbfj84JWYiL4PQf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 04:01:14PM +0000, Dave Stevenson wrote:
> IMX462 is the successor to IMX290, which is supportable by
> the existing IMX290 driver via a new compatible string.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

You've got "media: " twice in $subject.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--UJbfj84JWYiL4PQf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZJywAKCRB4tDGHoIJi
0tBiAQD5ax1UE6LgvKkKSHs+2Rgk33ii2RN+pg21HWrkUGrpSwD/e3Ab1r7f0g6Z
5C3Tkpi3lfXWYPKcXSjldPYCGPZEsgA=
=IwPX
-----END PGP SIGNATURE-----

--UJbfj84JWYiL4PQf--

