Return-Path: <linux-media+bounces-34951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF57AADB4A2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F370165E7A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA5A24167C;
	Mon, 16 Jun 2025 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiZE7a6+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45011D90DD;
	Mon, 16 Jun 2025 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085919; cv=none; b=oCls0aTg7O4z9PNOFmfCN2HnJviXLFmzT9cdpUnl1uKRsVzLLNbgp66iXlgBz7YPGmWWrsxbwKTb7bJajEAh49XgGtDDH1exrJema0RCXaAtOyrFdNxViwfjkjf7MsrYiwTUnLwVPN4ZfIOVr6rkfymXBD9hKhIEEeeIhCh1INE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085919; c=relaxed/simple;
	bh=46VI5kI7DARz6nHBYySD64FMtN5SGMQUkOWuVytVrXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urbuH6WkQU8I63AYAlNj95qyIC+iVhZGM/wzfByrwzdrWOBW1oOL0pxkNDzatKBmozcJ7w+HAcfBZ7ybfKg9iJjcW6VPtDRoWsJPFLwAeX2nYx8hoVrsLDEKNqG5r8Y7wyfBo00362V+6fJYntZrwk53Ju5lNQ6jf7pNySaXbgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiZE7a6+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC04BC4CEEA;
	Mon, 16 Jun 2025 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750085919;
	bh=46VI5kI7DARz6nHBYySD64FMtN5SGMQUkOWuVytVrXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MiZE7a6+q/GsIslhl70mP/J8IrMeR55PETwqoVObqI42VN9ygAKPpurXpMyg7ltMi
	 NSp5vThbbmRt23amO1B4nR/h9wT5OfJbYJTwfQBrzy8ReX7s3sD51LeWfQK86gndm8
	 jmSmscaqmNm+o+jZGKCGpxAshtTC4OtparBXGjZAJlzP+Xv1WRI/6GhjrTpdehub31
	 9QCXaEsIynLHSBMLTc6A15NycKv5ZpZxI3uEG2HnovSHQ1vG3Y/wm7B2nnfQGKobOC
	 ABHMIFcyAEZILSjwuq6LU+MHfrjo9HwVbXw5wPzYdhOF9OfC23Ioq3YoKVH5N0PE2W
	 0jBc3poySiyBQ==
Date: Mon, 16 Jun 2025 15:58:34 +0100
From: Conor Dooley <conor@kernel.org>
To: yassine.ouaissa@allegrodvt.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
Message-ID: <20250616-dragging-lego-ff264b3edcb6@spud>
References: <20250616-allegro_dvt_al300_dec_driver-v3-0-7d746cb9e5f9@allegrodvt.com>
 <20250616-allegro_dvt_al300_dec_driver-v3-3-7d746cb9e5f9@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="92GXpTHi+dETNUEw"
Content-Disposition: inline
In-Reply-To: <20250616-allegro_dvt_al300_dec_driver-v3-3-7d746cb9e5f9@allegrodvt.com>


--92GXpTHi+dETNUEw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 01:12:14PM +0000, Yassine Ouaissa via B4 Relay wrot=
e:
> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>=20
> Add SAS (Soci=E9t=E9 par actions simplifi=E9e) to the allegro of vendor
> prefixe description to include French simplified joint-stock company
> legal structure.
>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--92GXpTHi+dETNUEw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFAxGgAKCRB4tDGHoIJi
0pe7AQCCAy/NM7p1ATskCojxMrDBWbbWKo9pJJCx6Dx5ekBNpQD+NfWNjp1D+GEx
Wsn4ri9kcmt6thxJqpWmk/7juUafGwQ=
=gDpX
-----END PGP SIGNATURE-----

--92GXpTHi+dETNUEw--

