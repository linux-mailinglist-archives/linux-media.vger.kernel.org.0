Return-Path: <linux-media+bounces-37082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33357AFC80D
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBFFB1BC405C
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D89926A1CC;
	Tue,  8 Jul 2025 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="phhqAlQb"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF77B26A1AF;
	Tue,  8 Jul 2025 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969715; cv=none; b=Kvbw6GP3ipFiLI838qllqxyDP6plkXX2JhUgJxpyLESO4BdN6cAeziRGEbfK0wvyFyFWYc3ktwM4nmivzmzPam+RafFUiRomoX2yVPQRbylCnabiupDnH1jnEltJIVDJIVQSPNV8/AW8TsmESLDyzDmByPJLh60Pgf1IOXsO3EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969715; c=relaxed/simple;
	bh=pVC7GxX7t70O6nV2vsIuzXnuZ90xj4rHSPK+8DUoSsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGIoqrAw1SoMzdmWpQbOIKgO4f1OEkFTRucrkp656fX99Hajt14wscgmqCZNdRZujZCYkBmmimUKRgA6J3wqtVWy+vZozm1U8Kq/hYqI/onwxgPIhsdGj2yRJH9cwsDoES8S5k31oq2gm4oM3YXOLCT5y7cUY1t2e52VoOUDCgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=phhqAlQb; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1751969683; x=1752574483; i=christian@heusel.eu;
	bh=pVC7GxX7t70O6nV2vsIuzXnuZ90xj4rHSPK+8DUoSsM=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=phhqAlQbPd9dDE+4Z/IvYh7fgfGT9H4/ezDogouElhqVfWe1B0dEaUSIgRs8uQwo
	 eDYLPo0JRouEgAuUi7atEVyGHgP1h0v0bKZE2KUrVGaEXvhLX1GoRe7B8625q6MHC
	 N+TAWTjAMf9GScJ9QI/ihVHtFeM+4N0qT6qAxz/8WDRuHzNVOv66auQexUpciwSRk
	 ItyKo5kMnR9hhM2MLnim39MGXm3+NxHUXPb/UPjt4c2gL5vF/tJAcDZtjmdB+Z5//
	 YpGwDOF2+X6rAn1cMY3+OlomEcLek34/9AO8qlRatN/W7Nyuct+jH6tYQ0ux1kYV+
	 y2MXsz4Yeqo6OmqWow==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([94.31.75.247]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MyK9U-1ura8N2VIK-0117h4; Tue, 08 Jul 2025 12:14:43 +0200
Date: Tue, 8 Jul 2025 12:14:41 +0200
From: Christian Heusel <christian@heusel.eu>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: tzimmermann@suse.de, asrivats@redhat.com, 
	Christian =?utf-8?B?S8O2bmln?= <Christian.Koenig@amd.com>, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	sumit.semwal@linaro.org, linux-media@vger.kernel.org, 
	dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux regressions mailing list <regressions@lists.linux.dev>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Subject: Re: 6.16-rc5/regression/bisected - WARNING in
 drm_gem_object_handle_put_unlocked after commit 5307dce878d4
Message-ID: <a028ff08-8478-4cab-8bf6-3c9ea4b21ccc@heusel.eu>
References: <CABXGCsNxhEu+win6h1Zwi-0e4NeURzOt2KA=BXakRz08moG4uA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fya22ekfcjwoyp6c"
Content-Disposition: inline
In-Reply-To: <CABXGCsNxhEu+win6h1Zwi-0e4NeURzOt2KA=BXakRz08moG4uA@mail.gmail.com>
X-Provags-ID: V03:K1:kP9F2Oeo9EM+WR1is69hCSu10i0wMrSM8tP03uSWtSAgZa+h4UW
 /G52w2AJzg55Fj+GRg/neWqrxYh9CW8AS8/zNoToIatTcTUCofxizj0i+EuI644J3i14PRS
 nPVy8+aQCMw8Qi157G29tt0Eo+sS3nF9qzWOoYWASCyjrEXjvh1hP7sbDNG4kKbf8g7+hfr
 vPPPR8g3XexELk3WeaDjg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Il5a69wpHRQ=;tXMGCjBoUFpNgIw+/QVJAYQyWdy
 NEmoP3T61ygnivtqIUnRtLSM8P95LRfltSoY4EcAuVKb6ZhJsiTvCMBwU5v0DnuujMt80ImiF
 ShmKJz8t8JawVw53/YHfo3bsCobz2BGzG43m4tfvRR8l8NTs5ArXgJWl+5z/7C77QZ+WOQ0AT
 kRAIocgkcrnrbLiGJoLFxjYqqGLmMmpvC7/lhln+L5vT4l8iGVtcUkoXgoz6E8DDut2pBDnoh
 MxBRzssivhDe6cUpR4aPqFe4WyvezSsfX3lEj5IOyOFjRrhihr8fFuJTYdh3ShjJu3RlKtbo5
 evrLXH4dU1nSeRfI82yCxjUG2UHBZVICovu2IJAk9N2qa9IIoCmzJs/HQA32+F1JYW1BTCjpS
 11Rhjk28rTKQF2kl2lUwEDjWbAWFjNJjRpB9FPpFP/YGYoqgIb54lWtyY7eS73GKWXXIAegoK
 mRQpZIDsXc3IJIzS5iS+hNW4YZaFQzEyp3vlBl8OY3+RH7S405lPTtddgG5J8jVgZ4EwpV99E
 4tCMrFKEbV1+21KNFVghB94CqO3cyud4LeZc0P/6EJPvsD6QkaRcZ1U64ogvXDeCxDrV/PD/S
 INDdeAfh2tcPICXNMr2HgrdIlEOeHpdhSPVhS82Y1xPgpjxW5AbmWijEeNadzv8MR29twkLtZ
 fQA/B3cmUts9y9aBXOM5oBrrsAoCHxTtivi1iY6Yu77LHZs+PwCTHoD27U46nhNyLX1hl13Hf
 YuFy9FN/c7/TnXNin4c/gPDhWw8Emagt8c8EVJkkQnBgMyJCjuZlDrI9bm3bfIDkssJA0zHMs
 3Lo0RkMYqHRuDuNp3eZhwVEv2EkjBq7vUqILpGSVr3yx/0bb2KiXacfvcZp85DtadRMTvDshl
 Di7JyU8cyomWrWP9FZRc3liocGKmF+Z43/yw/mRHePkb41HOE7ztA8OinIUvYW7uWhLpPuGrk
 wJsxPF8OgSWBrLeywbybKSEqDqwdY0otYMV5RF+dUm5QryJUqS6MT6EisMaYnjEiVMDJDmm9y
 nCeuruUOKJdRaFPHT+K7EgdArSQXQ6khFYDQZmxGgcbaltHeW5Y8u6vm05LzL7XOiuu0BMf4U
 Oz9v+d821PhdBOw0Wtz0VyAsT2DeQwrbi/dUYvaGymzGZ554fzykSUP6eRyzo7+LP9Am1gG34
 PzEezJqMw1Lf2tZOIOWtz5bbYeGBjuLhZDx7NH0GilYftKv3nwiIemEBCgrPXlzvMOJbY+oCs
 K9eO5tQt8+wGDrSgj95XyFgNrPwHwYy8MeK4f/XAhn+i59SHu7JzEOEr7hAHGlFH3Mx+hPEyY
 Y9ywk/bZsL5Lql6yAjlHthWLPUpuQKou4yXQTNmF2krFY4w5o749dfZv+yXmqWU4WPApaTeLu
 QterSEC31/YaxbJccQKl2Kand4EE11YR1P14QhTu8HILSd84JtHhGCBMDUS5nY+bfbX10YQMS
 7mMi+h+e9Z8MEwFPhGhNd8pZOcmzCK4PPsDb4Dd1QUo5O3nIo9mN2KiGxCTmNA8sUbd5hwMg8
 WcsUFiXIsY1FHThI0tPa6UVAOqms/3r9tIdfaMVtLZKA1KtgKtQPMcdizFnAqCXD77XgwxMUG
 w4MjoUy5p/9BgYrMDEQuIIcBnkhkwThy7JUwZ72qHtRWyGredv4gI4EcAQFCb9/AEy+a8NOe9
 c=


--fya22ekfcjwoyp6c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: 6.16-rc5/regression/bisected - WARNING in
 drm_gem_object_handle_put_unlocked after commit 5307dce878d4
MIME-Version: 1.0

On 25/07/08 02:26PM, Mikhail Gavrilov wrote:
> Hi Thomas,

Hey Mike,

> After commit 5307dce878d4 ("drm/gem: Acquire references on GEM handles
> for framebuffers"), my kernel log becomes flooded with the following
> warning:
> WARNING: CPU: 5 PID: 1812 at drivers/gpu/drm/drm_gem.c:286
> drm_gem_object_handle_put_unlocked+0x207/0x330
>=20
> This occurs during normal GNOME Shell usage, and the trace appears
> repeatedly. A full stack trace is included below.
>=20
> I bisected the issue to this commit:
> 5307dce878d4 drm/gem: Acquire references on GEM handles for framebuffers

I think this is the same issue as the already fixed
https://gitlab.freedesktop.org/drm/amd/-/issues/4393

Also this is the fix linked in the issue:
https://lore.kernel.org/dri-devel/663110e1-3aa0-4f6f-8727-3a240bc96075@kern=
el.org/T/#me2a0f3254a57cdd157ba79344ab8d51476ba18e5

> Reverting this commit on top of current mainline kernel (6.16-rc5)
> fixes the issue =E2=80=94 the warnings disappear completely.
>=20
> My hardware config: https://linux-hardware.org/?probe=3Dce4c44c524
>=20
> Kernel config, full bisect logs, and kernel logs from each bisect step
> are attached.
> Please take a look as soon as possible =E2=80=94 this regression could af=
fect
> any user relying on fbdev or shadow planes, and the commit is already
> CC'ed to stable@vger.kernel.org.
> It would be unfortunate if this made it into a stable release without
> being addressed.
>=20
> Thanks in advance!
>=20
> --
> Best Regards,
> Mike Gavrilov.

Cheers,
Chris

--fya22ekfcjwoyp6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmhs75EACgkQwEfU8yi1
JYXsLg/+ObOtHgsihU/489f7Y2qWKv5s/4scLsWukSapGhIEIxW0sWySxqzC1Zg9
JKzfWpnsBe3LbXbTo2/CxhdMaQ8kZWODBig7q0mHJJ72Ag3sBMfhcPkqHaGi2LDV
AJTcfdb2hnRwbeDAfIFeHBZUws9fVNaNBQw4/n4HuZNSBjI+VC4uAIKk2USnzmPT
2SEZTXsZw7zKx1lYs/pmOqMguNpbyYstcgqXjH1nxJxLC0X7p5pQTNlqYaKx4lZX
yj7Eusoff/Va4x4nVv+5FlErKVbAXyRgCH16X99hzdSeda28JbZUqoI1HLZ8D+TY
PdAlknCqzmKMd7T3DTdMzc0r8K2t1BCpcvJTa8Tl/imo9OV6sdzFLHW9Zrd3ek7x
e/aV45/7HCDpLpIVDA6t2OUDf9ydeKlIs7koSGBO8nmKBRjmj+XZDIQY4WK1uAw/
JOSJL/sWF2lqh3GXTPLgy8EXi6GpHuuUnqVjjX1DA+9Pq9Wyl9gNbqmnt7yL7Ry2
Z6ZkTnlmeKRkOeLmIC3gtnAn37cFm+QNqkRuTFwZPMTVdoxSJMoO/7QNyEWuz5ei
tLsVAYCHuPKaRzD+IJn9mORKEeY0XLqV0sVrTQLVEf/jx6FB2IvM1BmanMc9Oh4b
UCqFH2z6b/SyLnqPsTujbWRKpP7gNNfxGkySHlkPcYRiA2EUbR0=
=iEvw
-----END PGP SIGNATURE-----

--fya22ekfcjwoyp6c--

