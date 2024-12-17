Return-Path: <linux-media+bounces-23640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 993519F5619
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 19:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CFEB7A3EDA
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 18:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1DD1F9416;
	Tue, 17 Dec 2024 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWz+gccz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8104E1F8676;
	Tue, 17 Dec 2024 18:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734459953; cv=none; b=SSvIIh+8lLdNEjK4plvBC1IkirUtvSur3WgDGaIUn+1XL9Fq77ySR+Chyu6qBQ1K788o734sm1WtTFpbwnWfcaHFlwu3+BtNPuEBjYIv3NZZLLEOuZtFgY9tmNBqHuYmMZiDR5aneeOVePfIWdUIhREiEN3zouqY7evXX+OLk5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734459953; c=relaxed/simple;
	bh=5sbBvDuhs4dH19A+TJjyjA7fZtevh11swNjccUwIf0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR9qIhtYjt+dwBaCpXHmTsKKWhPu6MJUlaheYCfmJZdGFzCHgQxQAF1RQ10/WHXs+HtSWwCimCnr+bwm4tlMLqDEtAZzr91/DjE1bTa248qUE4o2akXPIvFFeUnrW2I1ILlwhIcV/Rv1vdedm+22T1FmiOF87nGXMsnRbE1VWl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWz+gccz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20634C4CED3;
	Tue, 17 Dec 2024 18:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734459953;
	bh=5sbBvDuhs4dH19A+TJjyjA7fZtevh11swNjccUwIf0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWz+gcczWJ1xJeJsETvul4MmoE4EKFFA2aEgNoNr4wSIUrwO+IDJbPrgXFldeltcj
	 B7157twx6vXJQ3073e1wnjc/GdL7NAHGqf56f9qiDT8T/ynQRw5egSbuWIPwY+0M8a
	 T5AK8nzsmHnl4GnLULal7eA0zsS3YhBlyxjhXgMVK3LN86nb/VRc1IchjeOwqf2ezW
	 9qYeG+ZtclrGKt/zPNBWsUA6fIXLQR6sI7JBnbwEomg4qGAv8FnSqW5AgmBPqefHEe
	 NsVKDDWkUqjnh8GibmHf7WurEMNQu2IGiWCJ+Hxaafefl+0vKuGiMRwCOMM/SNAM5+
	 E9eHChbObZ05w==
Date: Tue, 17 Dec 2024 18:25:47 +0000
From: Conor Dooley <conor@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: imx283: Describe sensor address
 using the reg property
Message-ID: <20241217-moving-rubble-712bba91af4d@spud>
References: <20241217032821.1712916-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="irNW15vzf8lQLXCc"
Content-Disposition: inline
In-Reply-To: <20241217032821.1712916-1-david@ixit.cz>


--irNW15vzf8lQLXCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 10:28:17PM -0500, David Heidelberg wrote:
> Use the reg property instead of text in the description.
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--irNW15vzf8lQLXCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HCKwAKCRB4tDGHoIJi
0tyiAQC0iy2jX2LBj7PYVNqONiCpx88AuaFbzMJXh/vYVCVf+QD/Tmz+g72CKmZo
B4P8X7o7961wpSemOaHoBTCBMbbbCQI=
=4fjz
-----END PGP SIGNATURE-----

--irNW15vzf8lQLXCc--

