Return-Path: <linux-media+bounces-36260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665F8AED7D8
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 10:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B65A3B0595
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 08:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE89323B63F;
	Mon, 30 Jun 2025 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rnb7/Q99"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519E72BCF5;
	Mon, 30 Jun 2025 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273528; cv=none; b=tBw0lsdb1MCI/o146w5ZXPnYO8pL9Bd26SLqNh0/8+DolR3mZ9qYll+fCnLazH41jhQtGqPtXOcD4O8PwmkcX39Pc9rV+ICXtcnBmmEEfIRstEM0a6hJSo21V4jJc+TtlIDT7x/jB3aXAZlZ41Vst1eVKUPm/W+nq/pP25LUw78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273528; c=relaxed/simple;
	bh=Ahg7O8Gxk7QZFJYCUmSIfBJCpuOCz2nYvFMbHrP/2iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AymcsNVUR+t0m7qe5+zVUmx5ybo1Gb6qUwLb0+pCMKTuijAnpgk5QbLH9wclaMKJ3TF1/Wl/SQpjchsYg0LuvClqJmlanb1Ee1ZfgR/B7abHio6zLEnu8Sjor8z9CTf6O2ofyrjKewMllzM+/rMLwbQ1IA/2yNmIn8n1khgLtNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rnb7/Q99; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676EBC4CEE3;
	Mon, 30 Jun 2025 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751273527;
	bh=Ahg7O8Gxk7QZFJYCUmSIfBJCpuOCz2nYvFMbHrP/2iY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rnb7/Q99npxt4+sy/4HSiKFvZo1MlJGgYUvd+KkLm835TKC5xc/yyut+O67fq3GGT
	 1n3VjxFgdQbvnJwr26mFQFA82wR2A5bWwo3gravRfVxm0WIQJqCJ491xxxn8troo/U
	 SZ85xtS3gtBB31B6Vmye7O4FpLEHEq2OtOrbySpB6U61gIO4LsTVJXm4FhugCHPOHH
	 1rQoedpYHAW0UEgGGlbRs4IDVJtyTJKTxRxBzlsBdVRFyQxDwt5Gmd+e3TMfBh8KG0
	 7GqmP5hVj7tfjNxzvm74MenTq7ZDeQFk0BsnPEoyOxcSVxTmeEaNZTO0XwFql1ZN3X
	 YwQldfgAN/3hQ==
Date: Mon, 30 Jun 2025 10:52:05 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
	Jared Kangas <jkangas@redhat.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: Introduce a new heap for reserved
 memory
Message-ID: <20250630-sheep-of-fantastic-defiance-fb90c5@houat>
References: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
 <20250617-dma-buf-ecc-heap-v5-2-0abdc5863a4f@kernel.org>
 <20250627192347.GA4032621-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="azr4p4pnlcb6447b"
Content-Disposition: inline
In-Reply-To: <20250627192347.GA4032621-robh@kernel.org>


--azr4p4pnlcb6447b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: Introduce a new heap for reserved
 memory
MIME-Version: 1.0

On Fri, Jun 27, 2025 at 02:23:47PM -0500, Rob Herring wrote:
> > +static int __init carveout_heap_init(void)
> > +{
> > +	struct device_node *rmem_node;
> > +	struct device_node *node;
> > +	int ret;
> > +
> > +	rmem_node =3D of_find_node_by_path("/reserved-memory");
> > +	if (!rmem_node)
> > +		return 0;
> > +
> > +	for_each_child_of_node(rmem_node, node) {
> > +		if (!of_device_is_compatible(node, "carved-out"))
> > +			continue;
> > +
> > +		ret =3D carveout_heap_setup(node);
> > +		if (ret)
> > +			return ret;
> > +	}
>=20
> /reserved-memory nodes get a platform_device, so why not make this a=20
> driver?

Because I never realised we could :)

Thanks, I'll fix it for the next version

Maxime

--azr4p4pnlcb6447b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGJQNAAKCRAnX84Zoj2+
djLaAYD2EgQb4dg3meUoXBv7w6f/79iKVhck4zIqbs31UtjQyNcrVEBaEwjtBsNJ
YgB/3oQBgIY3V9gHlCVKbJ+ggP4KJRA02e5r9V6Jxeq9kBkBXfo5q+IgLtEti0vG
8D95b72b7w==
=eHPZ
-----END PGP SIGNATURE-----

--azr4p4pnlcb6447b--

