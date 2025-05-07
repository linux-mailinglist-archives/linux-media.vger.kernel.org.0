Return-Path: <linux-media+bounces-31952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9719AADC0D
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 12:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4741A1C2163B
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 10:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8B1207DF7;
	Wed,  7 May 2025 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XvljW1gH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39843207A25
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611998; cv=none; b=hvyAftP+BCipNZc/j/RcPXDqYywbjRvvFQE+Sk9//Hl0Igv/7xSHpP4v1ntRKy9mtsKVnioTYRdCZVtTiyGIgxnlvqwDlK9g6BQcv1bOD2EEhZOylPaX85c+OSeiQrWdXVvrT2cB1HoSuICWbhuHCx1orLdTkk7Hkkq3NUzXELw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611998; c=relaxed/simple;
	bh=nTPmV/ah65M55YkjjC373cBBi8S7rWj8xu/0m/Y1Cew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iICkD4CLmp3PAb5iGItjrX3fplmv1cXMtSVRA/1eI2KtdrpwMmOft8KRYflSoln9LxnE9MndOv/tLXPDF7dDpufq5xsfxK2TR9N6bpNsFgaRqXYnq2pIZUe+iZ1kGd2dfy5H/thmG3aJKN6AbkiVGr7BjN957TCKhNCzdE0IwPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XvljW1gH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Kq86
	79TYhepolaaaC5c38NOuT13bofw3q30AIXXiR4M=; b=XvljW1gHlshtg1NVhu7t
	rFEQEZuUoK+iBNC7J+iFkTIZtHiBEcujDvSslykh7pJAApiG/6w9sHcbKMQAw8NO
	8Em/RjgIwF/r8k/UZ/qcSORWH/NFUY3ug7RfQkkc9zgWIqFbMY/lRSFXghQ8m2wM
	ux8qMv6feJ37iFI95mJ4090EGAwdhzGLaEd6cQAiujKPhNof63UhiCi9Yqym9gVo
	1GhmR4QCeX2egoGp6hLY4KM0QD8ttCJhN39g0u0tWfs64On5b1EQVQFjyV59fZWN
	7m1LX9tkdt9yzX+tI5EIR04NpX1Ya60/wf9WGAXcw6NxBHmnXuYR1ho7fWglI8ZJ
	Gw==
Received: (qmail 3310634 invoked from network); 7 May 2025 11:53:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 May 2025 11:53:11 +0200
X-UD-Smtp-Session: l3s3148p1@eB1us4g0iMUgAwDPXxyAAIlRla1HkD11
Date: Wed, 7 May 2025 11:53:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/6] media: rcar-vin: Unify notifiers and enable MC on
 Gen2
Message-ID: <aBsthimr83OIiJnO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250507094014.622087-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KAFsEIm1wIHkZTkG"
Content-Disposition: inline
In-Reply-To: <20250507094014.622087-1-niklas.soderlund+renesas@ragnatech.se>


--KAFsEIm1wIHkZTkG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  4 files changed, 302 insertions(+), 919 deletions(-)

Can't comment on the technical details, but the diffstat surely is
great, too!


--KAFsEIm1wIHkZTkG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgbLYYACgkQFA3kzBSg
KbbDfRAAtBxbk0t0MCILCL1Ab+DR8862cPD2RTLnMAHA1is/VWT9MiiP1yiLhbkt
XqhLbQ8c0cJBHEtxe+aMMO9zTK0uuv/8zOIizg0CwStT5CvYINPiLjF7hKV+U6sh
tbAYNp1pUPqG33Sob7Cc5QyixO/CMtbUucDHFzeOgNGPMVfmY2x54t+ZjkceWw0M
/uASxlN+d9oz/SlTEiyspTHbPcC9WAhP9Nw3XOKlXfDTEyesJTOPhOzCv24EZcMm
d4/9VGZkLJj4g/mp4B9ZXfVKPjo5+wICZZscbzW93W0qShxMyk0CFE8tulECRw6G
dVjyqiTnNc7sVUqgqeBfzLoowaaaa0RNSDa3+XL4cpONKH32VpNKL8pJATT90fhz
98yB36OwftTT+saGJvB/p4KjnYY49ixzK9OGvq8pHfo1v2aYoCsXQ1tqdh8mMD7g
pKS9p8g2CEuoHCsgnXDBiS1s+dnBkeOc+1CaBHV389rAdysx6tZiYtiQCrr3UYv3
6ncjxkUCK6bWucM0TFlzg80icHwRjGKc6Wn1/gcMhsUjBc82+eQziza6dy8BXsJ+
2wbgI9QqDsva14+WVjUp7L0l+xNcSNfUKBpTOl790bxL7XgEgYNg/FBPVmpa5apm
ojvKNp45DrlyHs4AiRWNApDzn3tsjp9fG8ptEpv1A6C8xGXpK54=
=YAOx
-----END PGP SIGNATURE-----

--KAFsEIm1wIHkZTkG--

