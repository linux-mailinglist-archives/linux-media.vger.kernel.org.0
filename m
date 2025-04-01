Return-Path: <linux-media+bounces-29139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCFEA7795D
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 13:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E7513A78B3
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBE41F152B;
	Tue,  1 Apr 2025 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJo3yjt5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1541F03C1
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743505854; cv=none; b=b+OYPKPAhlIIooXoBzzTSRH+kVVzCXOBSE7LfloGztSaSDIK6/lrig/wMEZYTIDhJa8xDV7PaX/H4Ijjgn5LezLLcY4BAyPYaTLYQvF3DhXUz9+uX7oIPhCn2pKaghQ9qTAr5aawfjOKGaa5L6ZppkZeyRHH7gbG+cFq295ts/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743505854; c=relaxed/simple;
	bh=tYlQHoxwve9UP7tmrnSPtG/5UNeYIgQxR86Wn3zTg14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KN0VaZckv88s1DQ70zfg+A6nYhyd9O/7fKR9A5rhQJx2DKHu7eoP+nzTiZBAB3RJrwFKyc3nKt+GkLE02ibvTcsbDd77Cd79v97zgTq9TKV2MBaxvz1s0z1xfYfWIaimTqYMkwX/F0BmWt8/1ivP8fRk2lSsUSHc/36c9BzbnJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJo3yjt5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D421C4CEE4;
	Tue,  1 Apr 2025 11:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743505853;
	bh=tYlQHoxwve9UP7tmrnSPtG/5UNeYIgQxR86Wn3zTg14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJo3yjt5tSJq7M3R09sbpjXhMjIVUN3XRF8G5KOGtpMy7rgKPwk78VBO6gCAX+4OR
	 iy16w9hOuHQ0/MCM+aqXLR1ljy0iEDJrMib001Ume43NqGLNgWvy+soZVQwJD32KNE
	 GQtYm6cF0kYHkA8lXsbxUu+ZVf2xfgzQ2BewUg7HkE5lPM9Nb7AYel1xiQq7h/TtdE
	 upIp+KPaBTJhpLAba8nlyII14pTf28t9X64/WSlEub2hUJqej/Mm7PXqyj8n5e/1Xd
	 FitHmV79ZQRYGozOCawVnCIDXBctHaa1f6W67kKulKoXrNaEK87SW2V2Vbq4zjXPSa
	 oMwwfhV56gP/w==
Date: Tue, 1 Apr 2025 13:10:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: tc358743: ignore video while HPD is low
Message-ID: <20250401-aloof-vigorous-ringtail-927e0d@houat>
References: <de582d1f-700b-4d95-bd48-196413116455@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fepb4lukff6wal6h"
Content-Disposition: inline
In-Reply-To: <de582d1f-700b-4d95-bd48-196413116455@xs4all.nl>


--fepb4lukff6wal6h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: tc358743: ignore video while HPD is low
MIME-Version: 1.0

On Tue, Apr 01, 2025 at 11:54:17AM +0200, Hans Verkuil wrote:
> If the HPD is low (happens if there is no EDID or the
> EDID is being updated), then return -ENOLINK in
> tc358743_get_detected_timings() instead of detecting video.
>=20
> This avoids userspace thinking that it can start streaming when
> the HPD is low.
>=20
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Tested-by: Maxime Ripard <mripard@kernel.org>

Thanks for submitting it. It might be worth adding a Link: tag to the
initial discussion?

Maxime

--fepb4lukff6wal6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+vJuQAKCRDj7w1vZxhR
xcfCAQDIuKykLtlZh7zNg55IJujq0yuVhx79PUv8tD4k0pumDwD/RVJQPcrQA8bw
oxqvP2f33e8wNyeiwWOhY2G9kWS4RwY=
=oF9a
-----END PGP SIGNATURE-----

--fepb4lukff6wal6h--

