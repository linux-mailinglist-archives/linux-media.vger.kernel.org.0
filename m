Return-Path: <linux-media+bounces-14582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8A2925EBA
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 13:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB53A1F27717
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 11:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1165717332B;
	Wed,  3 Jul 2024 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qi9zy9Ze"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9917D61FE7;
	Wed,  3 Jul 2024 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720006534; cv=none; b=MafUuF/RrZI5p3rxYQmIc37eKHFimAD8AK6bwC5FxqnRep7hUp2vyrFTxMrZdYMoDgDs0iSQFveyV2WgWq51/2K3piE3rINbIJZ8TsInw6nUxkLE6L/CvVo3fVvuqt2+SQGd3GH8jrHzjaCdiwZsGEeTJ3o2WM+9Tgvn95Dfmwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720006534; c=relaxed/simple;
	bh=bJWg1rRruMPh0S46XG5+CR3ZR1oWqGv969BJsrIHKxE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLPzCE2g+f3zQL7O4kILDww4tieF1txKCcrv8NdXINxh97nUFsrIc9+UZ7do8lYbTfodtEJwl6kiwWzYFRy0Syulfa3R+yHDub5Ty3J571p/fFfLGMfUcoo7jryHcvJwK/NHVoWqfF8wudGczATMHUTkWJf4R9BrgWaHBzzzYWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qi9zy9Ze; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720006529;
	bh=bJWg1rRruMPh0S46XG5+CR3ZR1oWqGv969BJsrIHKxE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qi9zy9Zes/ClqzyvfCnf4Li0fHcpxxr3Zw6QmiPAbcig71kV4GGxVF8um12eK+r1j
	 s4i1/4ZM0ae35iYh8VksHbEXsUd7gzhShVpHbCRUPWwr5tfjc0teWw+yYy0kdU0n/+
	 6/xN/FKUBId02cJTXv/o9IhLTglbTRZ3LCQmTnBxheT3ymFAWlKGuWTyFuincbJtZJ
	 pDrEMUhovvpGx/asc7WyQrIZp5nwVczgGrZtQFkBcaW2228UF8SLKrJOZE7znDpzjE
	 6S3rsGTFBCpVQW/6ROk+sKbiFRnDHBf4/2hkMr7ELXJWDv9kq93NdzpDWxnS1EhO1A
	 vlMYOZI5FGzDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDd4d2WPfz4xbg;
	Wed,  3 Jul 2024 21:35:28 +1000 (AEST)
Date: Wed, 3 Jul 2024 21:35:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 v4l-dvb-next tree
Message-ID: <20240703213527.221bfe5a@canb.auug.org.au>
In-Reply-To: <b47f96bb-b1a5-48a1-8002-1cee351bdb3f@xs4all.nl>
References: <20240703163317.55618738@canb.auug.org.au>
	<b47f96bb-b1a5-48a1-8002-1cee351bdb3f@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZRgYOvDDw1HzjEV4Ra8K3CA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZRgYOvDDw1HzjEV4Ra8K3CA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, 3 Jul 2024 11:17:47 +0200 Hans Verkuil <hverkuil-cisco@xs4all.nl> w=
rote:
>
> My mistake. I discovered that git revert doesn't run the commit-msg hook.

Interesting to know.

> Anyway, I installed a pre-push hook to double check this before I push to
> our tree, so hopefully this won't happen again.

Nice idea.

> Question: does this have to be fixed? That would require a rebase, I thin=
k,
> which makes some media developers unhappy. Or can this be left as-is for =
one
> time?

A one off probably doesn't matter (especially such a small patch).

I have to admit though, it looks like this revert *introduces* an
infinite loop i.e. what decrements i?
--=20
Cheers,
Stephen Rothwell

--Sig_/ZRgYOvDDw1HzjEV4Ra8K3CA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaFN38ACgkQAVBC80lX
0Gy4wAf+Lh4ydMr5TTW4OFaNlcbvZJoyDcVGkgVo1QPlUxYkp0ozZ0jij1e534NA
Pf4aUjm6JspcpZ4UIQA4AkpfdCU1APi5LImiarkFBrj0pAeiE1sYKJXOjKht2Naw
0iNs/9Z34QZvH9E4avqPNfw+tP/wSmwGwdzFcKOaqw5RrJReAhbFJIT5YweuSPoE
CWGvnKTtq1jIWhzgn7FccQc2F58npraK8Y+J4MSm8J6lFn9MVgFBwxC/aq3vShjN
PaHvEvsL9SL3KBEvSsKw3B0Ede9mtZMJUznWjcvSRQondXlDlsOsaz0MbNsIBFUa
KlBucrXc59Ij0RBeEBc2/mqWW3K7AQ==
=M4GX
-----END PGP SIGNATURE-----

--Sig_/ZRgYOvDDw1HzjEV4Ra8K3CA--

