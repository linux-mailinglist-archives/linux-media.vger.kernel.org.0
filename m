Return-Path: <linux-media+bounces-30276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEAEA8A8E4
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 22:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EAD0443B79
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 20:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0F724DFF1;
	Tue, 15 Apr 2025 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gXBsYPGF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B562253938
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 20:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744747825; cv=none; b=CzNvTmIgicGYQhC9YSlNrQEcFf7OcQscIeelmMd0gyKOLFOFV5c9ukE3Zeop/FhAjz9qh0XzeYkdxFgvzGEo9I2NUWLZzGAPRKx2LLfsgCfiDJkv+OK8rZ3DXArX+ABz6Acv0Q4B4NAnC4ePcO6yY6nZZfTCQIzz2DH/t9r7OZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744747825; c=relaxed/simple;
	bh=zGG+N2yDwyHXaC8GqSc/AOf+1VKFF/p9dMDTYi0UHqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRqJiTRH/+NQOB3DvPQiPWCNJMSIMfAuuiM/DPt68JlLcAIiAXS112PJoFkciae43ERXlf2i0igREOCuTR/jKPtfX6E4Sh0rh8UdUvesnO4O+T1JFfdeObRLv1a7c5K41SAs7qk06QUNoNSupH3m99FYmmcmZkkmqBnecmvF+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gXBsYPGF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zGG+
	N2yDwyHXaC8GqSc/AOf+1VKFF/p9dMDTYi0UHqM=; b=gXBsYPGFYyCw9LzzMGNp
	yeTFAfEqmfACTJOIyrkkUq/6YTwKTxVlihAPY5unvLR5l/C/7rOS8sMtD/gX4NLp
	KmRU5tWCNK1gAzh0t0Wn0tW6/20SV8BR9aK0LPS4sDczpg9kMyDaLDUDXR3NSkMi
	mUWZbwWrUzuaTzQChXqVdevgvit2A5ls/xXEAmmycFH5+jO9RWymdfxHeIHYmtJR
	2vpBPjex3sGJUQzF+D+M+AUW6hi3h+biAjD1fK5aqVe+5E/o5wlTnRQVGneWnZAY
	AA5RHs3+u4inwn8P60OeVSI2yvgdGYfq8pnRWe/3/uEVIeahdS4o7pV7USZUsHmE
	Qw==
Received: (qmail 431605 invoked from network); 15 Apr 2025 22:10:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Apr 2025 22:10:16 +0200
X-UD-Smtp-Session: l3s3148p1@qAbOwdYyOJQujnsq
Date: Tue, 15 Apr 2025 22:10:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 6/7] i2c: core: Deprecate of_node in struct
 i2c_board_info
Message-ID: <Z_69Jml3-CKi13wB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BDuoVd6siomLyXJY"
Content-Disposition: inline
In-Reply-To: <20250414100409.3910312-7-andriy.shevchenko@linux.intel.com>


--BDuoVd6siomLyXJY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> that Linux kernel supports. Deprecate of_node in struct i2c_board_info,
> so users will be warned and in the future remove it completely.

Is there a plan or volunteer to do the conversion?


--BDuoVd6siomLyXJY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf+vSYACgkQFA3kzBSg
KbbJRw//f8nF3y4JXlYuzHQYvfsPNwImoeiIwRs1xXyFnA46CXf3UJLeT6fI4yBn
Bw2RtzqlcBKjooOd6lEKVRRV6MLDJ6V0kr3ywesZ66S7mQr5NELdltGNY/f0ee2k
2Bp+8zdgGPzV4hnsztOpE/Kc5Cy6c1D4lkM+kl2sAG2RRw//TL4/AZVCbcPOZXd9
Ap/hoHpSLKim+FwAAjYLiono3+gxjlZmgPlSUpIwYvfmATS9O/hB5hNgAjTIkPhW
Q9+LsNyZBZfl8s8V7OD1iDl5EcjNl8iDa8VqPMq5q0BagH0QnqGjiwueOI37dW09
FN7U89XBLnq7xc1kuCK9H//JalLbzW5Sk1D8vOa7prl4WoEJdEAqCTpRPmReK6BA
++zPMDBWYKgVOD/uGN3Lm7041UyuC3vl5riA9P+v7lv4airT6PAx0bonVaJqdv6I
vKUOVM3JPgWxOCVgpIwT/+4Q12vb3svOpBmFJvWyIr4XEgHrbwu4XidJIpsZXXwX
23edA4BWkMsD63SqBGUKF3iAOAajXYQ4pJDgHuzU5UX9QCfnSNgO+EZAte0QfR8e
31dypYq/IqoBwR1LSUDT6UFgK/9RvbVQO6PUzbdA2nkSYmnecG+/fG+XtL9JnyqG
I3cPw5igTWLITYVUAjZDjqSZ2wx2X4rnqkSf/i1ajQE0osz86Ps=
=42VF
-----END PGP SIGNATURE-----

--BDuoVd6siomLyXJY--

