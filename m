Return-Path: <linux-media+bounces-42698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F537B8130D
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 19:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDFCF3A8ABB
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 17:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABBA2FC898;
	Wed, 17 Sep 2025 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="K8oWoQes"
X-Original-To: linux-media@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897D12FC00C
	for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 17:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758130516; cv=none; b=SDut32Z40kvQ/z3M8UqMI7biNd9CwwHaDo/wazShnS0J7o5o8Cqt4+S8TMtYguNqIBnQzJh4hiH8sZhCtL65pOOAaUGhEuMtYN2USQSuLjOC7ujBGk3L8TMYo4DU/kVa0EddIhXH+6u8v8cwJK0bnuA//+du9hKu0Sq0dNp5HYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758130516; c=relaxed/simple;
	bh=v2yxRM+A9uUnMAKTwUq7IuwuKI05EU9sRK8SQppAquU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MxOdWtBmct5kmOjz2RzrCx/G4+VoQlz1CfCxFt+rKw+d7klbdsb5N/GTtocHhpRxAcMbGTHhf3UI4fl/T9sD83WdJH87+flAAlk7Vhs09gEMihcIxkBRd4ny+nKbFRFB2axXLSevv9qXKxmH3XZfr4EJmv3UphpVzlWE4Qm+AOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=K8oWoQes; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1758130509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dLlb+ACdw8BFZ60+LW5IZbLveHRCf/QjOFL02JEqU94=;
	b=K8oWoQesekqRCQW62uCUCaHBUdNVbWLQHi95QsweYx7hB6vX/cFUzBNnSxkoA5Z2fyuh2p
	qVhbXrKBYdXmYKztsLFtmu97m7tZV6QR8lsw5PHEwdHxxjh9sIcqgDuAwHHKdYwjLk4RZo
	+iKcAJ4vTHYM6L5+IHAMFaKH0f1yQiy6l1G7eHvIA6EtahMkWOKErY0247COeV1ttm/UcX
	WaNhYiyyXm5Yxht0J+eVGK9FAlTPWivxq3zLeSQSoHScdrLIoMxORdubjunLnulgnZt0qs
	/rhH9qCpuchd2rFzh989KZgzzulNJ0pTH+3HXWh/3+pFUL5PDuvhfJ/tum6ueQ==
Content-Type: multipart/signed;
 boundary=89136c1695f34d3b83fd4ce72d81bacb807e5b982b68cb4bb0024c460e06;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 17 Sep 2025 19:34:53 +0200
Message-Id: <DCV98UFRGHAS.2DGZOEOVN9WNX@cknow.org>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Heiko Stuebner"
 <heiko@sntech.de>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>
Subject: Re: [PATCH v2 00/12] media: rkvdec: Add support for VDPU381 and
 VDPU383
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
In-Reply-To: <20250808200340.156393-1-detlev.casanova@collabora.com>
X-Migadu-Flow: FLOW_OUT

--89136c1695f34d3b83fd4ce72d81bacb807e5b982b68cb4bb0024c460e06
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Detlev,

On Fri Aug 8, 2025 at 10:03 PM CEST, Detlev Casanova wrote:
> These variants are found respectively in the RK3588 and RK3576 SoCs.
> This patch only adds support for H264 and H265 in both variants.

I tested this on my Rock 5B (rk3588) with (ffmpeg and) mpv on Debian
Forky with sway and I was quite impressed with the results :-)

In my earlier testing I found that the classic BBB video made for a
really good test video and it played REALLY well. The 1080p version in
both x264 and 8-bit x265 played without frame drops, although when
pressing 'I' to show video info over the video it dropped some frames.
But that never resulted in any visible artifacts.
On the 2160p version I did see quite a number of dropped frames, but
didn't notice any visual artifacts. Maybe that it got displayed on a
1080p monitor had something to do with it?

10-bit encoded x265 files (still) resulted in a completely blue output,
but I have strong reasons to believe that's due to 'missing pieces' (ie
NV15 support) in the rest of the display pipeline.

The displayed video seemed sharper and better then in my other tests.
I thought I did see an artifact around 5:50 when a big rock almost fell
on the little animal. Looking further, it appears to be an artifact in
the original video :-O (I saw it also on my AMD GPU on my amd64 system
and also when using software decoding).
The fact I only noticed it when testing this patch set is saying a lot
... in a positive way! So I'm happy to provide my

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B

--89136c1695f34d3b83fd4ce72d81bacb807e5b982b68cb4bb0024c460e06
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaMrxRQAKCRDXblvOeH7b
bsnvAQCZ4jmQgTN7maZDp1lsG8YqclnRyywPjp/P1XSsqzpXhgD/bWyz2LiDNblM
BgknJRJIVtol8jVgNWJrOxS4oEu8UwY=
=2MAb
-----END PGP SIGNATURE-----

--89136c1695f34d3b83fd4ce72d81bacb807e5b982b68cb4bb0024c460e06--

