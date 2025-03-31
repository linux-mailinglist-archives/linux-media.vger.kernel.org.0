Return-Path: <linux-media+bounces-29028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CABCA760E4
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B798164D78
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65251D54E3;
	Mon, 31 Mar 2025 08:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S+9VlLSR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8911D1CEEBB
	for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 08:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408396; cv=none; b=ciro9kj5oIGC7yBM3IXk6cBN8tHRVm2cf8xga0IE4FzCIWwJJUtqns+e33bWgkWG/XE5793zyI5rJ1vjtbQ2yIFaYNRaWQphXTPp8P1uahEZ/sG4zXPYL6fjmL3+5tNP5cEGsCdVl1lbeCH7GIIRbrqt8R6RAF/4yGEIJnZG2HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408396; c=relaxed/simple;
	bh=JC8Zg3k4pC52T8cAoWmTNYtFIZ7gUokrLPXLeAcQJaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7o9YNqJD4e6I5afRiZ0bK5pCq+Uw4R61BIR8tNq+tQuW+67iAVNZSa9h2f4EEo82RgRMdpNxtpDEoqxKQZZ/vUAX903XDrZmvCDB/9OwaBncPsKRzXA++1IHvtHw4aQfFDaS0bL2XpWMozKFyPB5Qw3V5bSRDpFjMmrMykxJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S+9VlLSR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3nRs
	WqYey+s0j/QT7G3DREiK6uEnPRgjBICjOA9hk64=; b=S+9VlLSRomaZYcHQgsX3
	Wux4mPdqcViLMbqIyKoNHstMrGzAmEJhnuixDYgZrNrubNdtXGK89S1X6wps8Dv8
	IqKZmcwVGy23LrPPdEgZBols+Saib5mRG5kCz9jMZbOctEd0VU71NaEo+ic8TsOM
	zfEUgkyNgWmTN0HC2RMTCxDN7X4N3NMikPZ1xkC5mK7uz7rc2LAaQsLZcw+y3GZl
	fO5WKMXgfWyySoCvOzcwATkVxET5PxFCw3ZJRC3Tu4jCHb29Vo6v1T/bIxiaV07j
	rdlm+T24/UA/CkRaILG3haz1SbByN+fV1Nitztg3Dw35th1saSEwzsbST4+2Vzf+
	Mw==
Received: (qmail 1149535 invoked from network); 31 Mar 2025 10:06:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 10:06:28 +0200
X-UD-Smtp-Session: l3s3148p1@A6Sw5Z4xHslQ8qei
Date: Mon, 31 Mar 2025 10:06:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: si2168: increase cmd execution timeout value
Message-ID: <Z-pNBAVhUwrcwDQe@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250331075838.3444332-1-christianshewitt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7jQwbF4Vt10NnymL"
Content-Disposition: inline
In-Reply-To: <20250331075838.3444332-1-christianshewitt@gmail.com>


--7jQwbF4Vt10NnymL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  	if (cmd->rlen) {
>  		/* wait cmd execution terminate */
> -		#define TIMEOUT 70
> +		#define TIMEOUT 200

While we are here, can we rename it to CMD_TIMEOUT and put it next to
the #includes?


--7jQwbF4Vt10NnymL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfqTQAACgkQFA3kzBSg
Kbaxsw/+LiWXwEi5DP8ySDnUQow4WCV8AOCBbJK7m7dzvfvS63RJGikiQmSsZkRr
zK/q87dinUM8k5ZKwONpC0YqdE6gpxPE7wHKyQDHWKvHVUko8FmWf6N+IMrTeHEU
LsVtKOMLcfPEOyuqiMwy8TJRB28zksNqhnkFF7q0nYpcsl8D/UR8Mo+IQeExUF6p
XSOP6jiKrTCkwluRKXWh7uekE5qiLgdRUvmqhOIq/xwpgmNyjZa32pRHXHkv8abx
g6s03WrmLMnxaTHdr2QG3zHis1BnhaHgP/Bg64RV+nBu3wcVYZncJdsKZi3OTtlA
/5tGGmJUjouV2NDHTvN67xSDA9F25PtImTSW9H3FcfAhsNRACAHzHwDY0QJjGNYP
bYOdr5FLiJ1++VjdjlpA/5wkpanIiv6xwxwKiRzet/55cvghCljZgbUsXReJ3UMh
UCpHUUwc1Ah5JHop50dyNsNzTpUBOw8ZIz5tfgYyjQn68zQO7h7zYaOx4dInHn4g
/s+V4hlIyPDrdQ0UMdFvpr49IohxDCWOlrpwzcUVo2luOcNvaHydjmvZOp4GReTI
1WVb+wiIYKEqKhdNPj6DmvAUgvWnUpDm73nCiFRJbRGFPawQ7HdNvLH1CXf5rjP2
zP59fj5ofnsRKyUxicHrCrlQRxixzSj19MhDjo76ArxXerL2akA=
=noqq
-----END PGP SIGNATURE-----

--7jQwbF4Vt10NnymL--

