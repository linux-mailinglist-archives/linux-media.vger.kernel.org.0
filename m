Return-Path: <linux-media+bounces-33085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C8AAC067F
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 10:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9101A1BC0E7D
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 08:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7ED9261565;
	Thu, 22 May 2025 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Bc3PC2rB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67AD262FE4
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 08:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901121; cv=none; b=ZzdGrzXR/mnxUkwyT5Nzr554snNiHuzpRxb3vFa0clsBYEzamcDgCEHVQs2r4r3Mr0C1Z4b1Cm/Juu189qyCHcIDeZ7ZPEF1ottYm8Jamo2TbVRu4QLhAfS9RwZ9N3RV9NwM7uHUjylbskjWR2tjZ8ZYzuBjio/s3rukiTxbI3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901121; c=relaxed/simple;
	bh=JoEoV1Ce1I/7zkMlgdvUyYfmL12XBLKds1jFMYsvcuk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZesY0RC/vG6rnmnEgNWPkZqZKEzww7mH3Khdd6nPpj3BCXeodLnjydxpBfFAqohJuid6V4ng3jH+gnXL2zCJn02p5CnxZ/8Xm1P/CpchUD+Jpa7CzkuUzHd3dG/XJkLdvChWw8D7MMNUGDGq0era+8e/BAJcmvRvyUYeGj4ETz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Bc3PC2rB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uYN/
	4foawIwI0Ht0WNe3+6k43nWBWZUZr+KPIgQM9iI=; b=Bc3PC2rB5gzfDPeN/eDK
	J+gXGAiN6ILtUmswy1kQ9X0vQQ7ISI3i3Jeqwj65cjUq6FLpQz5ewWtvxGVQojXF
	+qrw+VW2A0dJUm/BZeyMdYLEFCPYozytldOlvKZoHKS+X2Vq6uhgSwDFOkWG3+Jq
	hz6ax7obBkiwGi5VsCocHXpV1gdB5ALQ5W6I8+CYBe7tNVZLsNV0A5d+naiqV0DK
	6QePHHy0WT8NgT9K680KcgIMYQv+PRbKT7N+tgcYWba1BZvgVtW+kpdVQ4vjJ3Fz
	kHx+Sv11oHOyLUYzMG1Ml78vgsiFSxgK2UM10OufKmTPwFgZMo65w/qpNZMkfOKD
	rA==
Received: (qmail 3564342 invoked from network); 22 May 2025 10:05:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 10:05:14 +0200
X-UD-Smtp-Session: l3s3148p1@CsAH8bQ1bqggAwDPXwj7ADHm2wGe7qss
Date: Thu, 22 May 2025 10:05:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-media@vger.kernel.org
Subject: Re: [0/2] media: usb: hdpvr: make use of quirk flags from I2C core
Message-ID: <aC7auv_rpXr3vjL8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-media@vger.kernel.org
References: <20250522065519.4138-4-wsa+renesas@sang-engineering.com>
 <682ed8b3.050a0220.1b76f0.5818@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z7XL8oD/fakLX1er"
Content-Disposition: inline
In-Reply-To: <682ed8b3.050a0220.1b76f0.5818@mx.google.com>


--Z7XL8oD/fakLX1er
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> # Test build:allmodconfig x86_64
> drivers/media/usb/hdpvr/hdpvr-i2c.c: In function =E2=80=98hdpvr_transfer=
=E2=80=99:
> drivers/media/usb/hdpvr/hdpvr-i2c.c:133:1: warning: label =E2=80=98out=E2=
=80=99 defined but not used [-Wunused-label]
>   133 | out:
>       | ^~~

Embarassing, I just overlooked this output in my build. Sorry!


--Z7XL8oD/fakLX1er
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgu2rYACgkQFA3kzBSg
KbZo3xAAlYHoADsYjT5V/mpnNNhVTqtMxqTz5UmcbguHFlAuoI1lcKA6PBNj8wGO
ChybCgaf/RZrnjHGXEYJMcChAhBK2F6mvFpKAZ3q8KQuR3suFD8xN1BQf9SPllWE
uQdcRdUp6Rrrt4th+xsTkSmKvLJffULk9xqfzPEImVdswyGGDx7BanvZIlXkqIJ7
OrSw/co63m6pSfqVMSEJlkw7rj8AO9+CBtUHVH4eE0i7Xhv+S2QsdtyMCY2DWYNG
YH1d0K63/EvYQGJG5lmmlSxKLB6Ua2N6iGe/Cg0RQQog/fd+TDgv+iSvZo01WcJv
Q6z97r5Dtr1vHOpRYvnEOQjOB3Hlx454wKfmnHt4vSgS0Ha9YdxnkFchfnftQbgW
TqvsrHdwm1S97YqxehDKulNoAcvBn9g6mg4E4UKQUzSsg5ujiG6NQ3OpI13bC4p/
rKZ5M3hs1KRsfSC80yu9F7yeczZYyKGq+zMjfvjQ6EawRL+RmwU0q/6YpDegG+hu
Y8SuQaQm3Z4gxYSlt03ttkrMmYvZ3KOt2daP4fD7pgE8M4zs3XE1z89WvCyL0CPX
IevJCki8ho/UyIWQvG6LR/Nk3prFLsR0t0RturW5DZvXrce00vuq/+Quw+ALi3C9
T9oum2H+ysURUXj6RmxdGUu5lPmHDVRnTY5qegFJptoWXPt876Y=
=Qi32
-----END PGP SIGNATURE-----

--Z7XL8oD/fakLX1er--

