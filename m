Return-Path: <linux-media+bounces-56526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNAzHSVHvWlr8gIAu9opvQ
	(envelope-from <linux-media+bounces-56526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:09:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE72DABA4
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 259EA301E7DF
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865573B8BDA;
	Fri, 20 Mar 2026 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhusO7Ir"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94953A6404;
	Fri, 20 Mar 2026 13:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012192; cv=none; b=FAYrmME50ocZzwM6cp0zu/SQjbHAboGWvvc/bRQ0p4rFL6aA1hrACs03YAbD2tXcSFdBu5G5dPkV6H+SKRKce3EY0LJlHCrMTht9thHeaU8UE6giGaGAkC1ew6xzESPxoUG++ZS0/MYC0kICD7WNJBtlf6+yLFnhXIwQ5+HPBp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012192; c=relaxed/simple;
	bh=KtyqkgdW2N+tGuiRRGwfaJSw9/wwP3BDlPbzeD6Tf8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCljg46eEZ4StPv7EOpWVHr9WOW5aEtEguYepMZdseRFsJ2vZEddGV+PP2bdt3IKt0hjK9zOBszodzI0bfEhw8FrZbG9eKxDnTkPdiAwQxM+KMJNiBjgSiJHmkKiIqQMli/x3jDDSl8sc3GxoR80J0QuHExYod8/3fNz6yUE7Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhusO7Ir; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3263CC4CEF7;
	Fri, 20 Mar 2026 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774012191;
	bh=KtyqkgdW2N+tGuiRRGwfaJSw9/wwP3BDlPbzeD6Tf8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UhusO7Ir2EBydsGHlZyj5vew5uqx3LL62vko5Nvx7uYqnN8LXpvVu0HBg4Jb3rN11
	 6S73M9ojHqYjBNhrbqF5Hh7jyCfzHErGHu3L1R6mUu7iSqAUdNpYycA6t0Y2JGCu7I
	 azCPpzorM0ShT1moymtT/RU9iLPZHEFywsckNnX3po4/g+RkOux39sHfuVFqfrhI0x
	 6K5iBG0kBNAiB0VJi3u6qKegr8Nd04DhRa7oBU/Df5hCAnlurweBz5L4KTZSQstN+h
	 7+aKbBVLQnUQbRckkQHUOiKXHr8jcSwXklaf2DF4sTPlOxHzV7mqlaSl370vp3i1VV
	 OQBJzASK6ggNg==
Date: Fri, 20 Mar 2026 14:09:48 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Albert Esteve <aesteve@redhat.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-mm@kvack.org
Subject: Re: [PATCH v3 0/8] dma-buf: heaps: Turn heaps into modules
Message-ID: <20260320-cryptic-industrious-otter-5b696a@houat>
References: <CGME20260303101320eucas1p2eb4fea499364ef20825d0d73585a2555@eucas1p2.samsung.com>
 <20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org>
 <c60a3f30-6fc3-41ab-835a-2fdd887e18fd@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zs66qpw74bbg7irl"
Content-Disposition: inline
In-Reply-To: <c60a3f30-6fc3-41ab-835a-2fdd887e18fd@samsung.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56526-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E4FE72DABA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--zs66qpw74bbg7irl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/8] dma-buf: heaps: Turn heaps into modules
MIME-Version: 1.0

Hi Marek,

On Fri, Mar 20, 2026 at 01:24:18PM +0100, Marek Szyprowski wrote:
> On 03.03.2026 11:13, Maxime Ripard wrote:
> > The recent introduction of heaps in the optee driver [1] made possible
> > the creation of heaps as modules.
> >
> > It's generally a good idea if possible, including for the already
> > existing system and CMA heaps.
> >
> > The system one is pretty trivial, the CMA one is a bit more involved,
> > especially since we have a call from kernel/dma/contiguous.c to the CMA
> > heap code. This was solved by turning the logic around and making the
> > CMA heap call into the contiguous DMA code.
> >
> > Let me know what you think,
> > Maxime
> >
> > 1: https://lore.kernel.org/dri-devel/20250911135007.1275833-4-jens.wikl=
ander@linaro.org/
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> I'm okay with the kernel/dma/contiguous.c changes. I only wonder how to=
=20
> properly merge them. There are other pending changes to=20
> kernel/dma/contiguous.c file [1] and if they finally get reviewed, I=20
> would like to merge=A0both via dma-mapping-for-next tree. Then I can=20
> provide a stable branch for merging the remaining dma-buf pathes. Is it=
=20
> okay for You?

That sounds reasonable to media
Thanks!
Maxime

--zs66qpw74bbg7irl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCab1HHAAKCRAnX84Zoj2+
dtHjAYCni65LYJfONrHzX1+dmTg8jR62Up22RXPxSlYyod1hB1tdIw9izCD0G6Yd
tTFaIwEBgJvjLz3SwBA1sbRbznr8PQjslZc5ZJNJzdGupJIT8b7KJryJWaeGjrY9
oc+2U5qZsA==
=0xTf
-----END PGP SIGNATURE-----

--zs66qpw74bbg7irl--

