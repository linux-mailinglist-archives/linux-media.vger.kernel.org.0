Return-Path: <linux-media+bounces-39630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 115D4B23A02
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 22:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43F8B7B425A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 20:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015392D0603;
	Tue, 12 Aug 2025 20:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GHGhIHEb"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7262F0693
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 20:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755030688; cv=none; b=BSuxQoRJBKx8WAKuFyLxHCCggc5H2ria9Wnk5IUiBh41nouLUVSlCRFd3Ma32yAxt342361n24tUTcGgvV6JMKCV74NRqT3qQ6eXAA7r8kAD1o6yQvYE/32k6kPP3jVUZbwgfCNRMtWCUArHbD1V+rwE6FJ8dgqfRIO0Pty6W3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755030688; c=relaxed/simple;
	bh=tcpwHTGufdTICSklfhwoT8MJz+iEx5O7E8DdkXJVJ90=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=sgpMhd4UF7f/B7jKjJAxAFtAR9TxWyHBc9jlQPjFsB9eAOJaYXS7Y/poSjV1+HdL3X2JbpWTLzHxr+lFtGvQDM1LthcgX1VLIIWEfcW+m0qIqtd3FyqlBdYn8gwffdVOVbrMK1Cj1OvjSJlaNKBT7wWoxyWdt/DRbXdkAjLwU4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GHGhIHEb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755030684;
	bh=tcpwHTGufdTICSklfhwoT8MJz+iEx5O7E8DdkXJVJ90=;
	h=Subject:From:To:Cc:Date:From;
	b=GHGhIHEb7QMOMXPpIo6FQe5UKRNkdEZNqFWWRELiiW4dyqA7ZD9vP44jmW+ykiKe9
	 nsI/W9cefPhKAeXpGzd0HUE64GjAXfxh3Ik0JUod15RPqiqaI4em4pWCkLmRDKyzFt
	 XwTvx9id/FUcpCQTNwDPpqP11tOO9sH625YhnQPQkUWmzmszCX+Le59f41d4smNxOW
	 Ayw6EYfXiqiZyTFUtq7uQz8oo4laRfhGWO95RowRFi5B3Z2jHjNLtrZGv0pu+nRkSU
	 q7JrdPEeN2jC92hJYgLDquN6gJ2q8w1PuHNopgdaIsdFG32+OugW1BrbVbH9f03kFN
	 78McNn3MUUCBw==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 208E917E00FC;
	Tue, 12 Aug 2025 22:31:24 +0200 (CEST)
Message-ID: <d5a7552c0c19902259931fa5002eda09b5e88dbb.camel@collabora.com>
Subject: [GIT PULL FOR 6.17]  Media Codec Fixes 2025-08-12
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 12 Aug 2025 16:31:22 -0400
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7RDTmljb2xhcyBEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0
 aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDA
 gQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCgzYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDi
 cVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA
 8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udWs+iGIEExECACIFAkuzca8CGwMGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Ro
 x8rfqHZnSErw9bCHiBwvwJZ77RHTmljb2xhcyBEdWZyZXNuZSAoQiBTYy4gSW5mb3JtYXRpcXVlKS
 A8bmljb2xhcy5kdWZyZXNuZUB1c2hlcmJyb29rZS5jYT6IYAQTEQIAIAUCRRA3QwIbAwYLCQgHAwI
 EFQIIAwQWAgMBAh4BAheAAAoJEHFTAi2sBqgc9OcAnRYaAklWymhy0C8RwjTSa2nlYAUaAKCv4Tsi
 06pkQcCz7FpsGCSdhkgU9bRETmljb2xhcyBEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgP
 G5pY29sYXNkQGJsdWVzdHJlYWt0ZWNoLmNvbT6IYAQTEQIAIAUCRmMbOgIbAwYLCQgHAwIEFQIIAw
 QWAgMBAh4BAheAAAoJEHFTAi2sBqgcGXsAnR3aWvOyEyYlqKT8RoMRqTMTCqDFAKDQlVkxmb2BF8S
 i7UW+Ke5nHB/+aw==
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-cddo8+AjywEC73iE9IDc"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-cddo8+AjywEC73iE9IDc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Mauro,

This includes two fixes for issues reported against in 6.17-rc1 in rkvdec d=
river
along with a removal of pm_runtime_mark_last_busy() requested by Sakari. Th=
is is
my first pull request against "fixes", let me know if this is appropriate.

cheers,
Nicolas

---

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585=
:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/fixes=
-for-6.17-media-codecs-2025-08-12

for you to fetch changes up to 85cb7dc3d2415685a4372f637cf26e5f077e6842:

  media: rkvdec: Remove redundant pm_runtime_mark_last_busy() calls (2025-0=
8-11 16:32:26 -0400)

----------------------------------------------------------------
rkvdec 6.17-rc1 introduced bugs and PM runtime cleanup

----------------------------------------------------------------
Christophe JAILLET (1):
      media: rkvdec: Fix an error handling path in rkvdec_probe()

Dan Carpenter (1):
      media: rkvdec: Fix a NULL vs IS_ERR() bug in probe()

Sakari Ailus (1):
      media: rkvdec: Remove redundant pm_runtime_mark_last_busy() calls

 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

--=-cddo8+AjywEC73iE9IDc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJukmgAKCRBxUwItrAao
HNfnAJ0VNiaidyPcX7tsfjl4mT8U/hk6YACguL58Jh6ZLa8fUefJvefXOUora+E=
=YdIB
-----END PGP SIGNATURE-----

--=-cddo8+AjywEC73iE9IDc--

