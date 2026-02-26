Return-Path: <linux-media+bounces-53474-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLRTIngeoGmzfgQAu9opvQ
	(envelope-from <linux-media+bounces-53474-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:20:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED0A1A429A
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0337530D3E97
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EAE3A4F48;
	Thu, 26 Feb 2026 10:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YA05vn+G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC473A63E4;
	Thu, 26 Feb 2026 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101092; cv=none; b=gLEAzws+RRGA2dNroysytbZTXIuuMO1lMgOPOABb5fVJyQ6QqpkjRcSoAAmt3r8w4Xc9Cnlm+XC0Tk72MWWzNNt4W2cb+tAQakZ7hz9maZWRC0uT4cVnlW8zm2hZ6JoSqR5p6dDlznLCVJ1Qx+yKf86qKHKnHaK+Q6S0bBda000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101092; c=relaxed/simple;
	bh=tJEgWGAKGq9f+lDM1K325bKAQQGVyuPowxRSNNeauh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgcHdbL5LVrPX6cZDNX2r76xbxUenBV2i28Qm2V8fujwzs05Sv/2id0bjC3qFuaXpO/44Jn5cwNJGsEq6H9IyP1o/LpcT7hsrpeMr8FO6v9r8HfYrIk1eUqZwE0OZk2U4UETXnm8tTpUHayqfIc2Jmk99xZh49gWR+DLnHunN0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YA05vn+G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653B0C19423;
	Thu, 26 Feb 2026 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772101092;
	bh=tJEgWGAKGq9f+lDM1K325bKAQQGVyuPowxRSNNeauh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YA05vn+GecAOHOV0bBkerBcyLQZtuSeUa6UQ7vgNRSwpIOnk1+Xg6+oT0x9IHtTrl
	 onYSZPAZMTe0F6nGswJKHdgRDg7XQpXjYPnevq2aP5CjzYYkfR/90mmCWiRXuQKXgO
	 +H6Xg/Rhq5agCeF2gZr/HUOYNb17ra9+vda9r0ixBAHkwbHtqrU3kZA80oQM3Md0VV
	 3oG+afWszq4v8KgLw8YU0gigEQkK/ASy2JB3YMNHuc2rU2TRc0G1OCIOlc/+VT9/An
	 WWug7j7lR9Tts668IPaefBI8ZdIfDjIeHH8rA4GmNx2mGPbyBeq/94vk28A4Nl//XZ
	 CkRcRNPs8Ilvw==
Date: Thu, 26 Feb 2026 11:18:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH 0/7] dma-buf: heaps: Turn heaps into modules
Message-ID: <20260226-adaptable-vermilion-nautilus-0aa6f0@penduick>
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="sxksscuwilvy7rfq"
Content-Disposition: inline
In-Reply-To: <CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53474-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0ED0A1A429A
X-Rspamd-Action: no action


--sxksscuwilvy7rfq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/7] dma-buf: heaps: Turn heaps into modules
MIME-Version: 1.0

Hi John,

Thanks for the review

On Wed, Feb 25, 2026 at 10:51:30AM -0800, John Stultz wrote:
> On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
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
>=20
> So heaps-as-modules is common in the Android kernels, and was
> attempted to be upstreamed long ago:
>   https://lore.kernel.org/lkml/20191025234834.28214-1-john.stultz@linaro.=
org/
>=20
> And it got a fairly chilly reception, but maybe having the additional
> optee heap (as well as other proposed heaps) might sway folks on this
> now.

I didn't know that Android was using heap as modules only, but I'd say
that it's even more of a reason to upstream it then.

> There is also the kref bits you might need (which Android still carries):
>   https://lore.kernel.org/lkml/20200725032633.125006-1-john.stultz@linaro=
=2Eorg/

I'm curious about this one though. It looks like you add refcounting,
but never really get the references anywhere. What was your intent, that
on every allocation the buffer would get a reference to the heap so we
avoid removing a heap with allocated buffers?

Maxime

--sxksscuwilvy7rfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaAd3wAKCRAnX84Zoj2+
dircAYDWmwkdH/3AAjuPp85DnYNPbSGFdhX/eyVBlLKWPqfln+xq2+gc6gDrOAAL
OyDKUToBf19j250y3Z4PQ7QYr1AXEq1bAKHYLpYrTQLrYCtOtKbL3L1J1eqyj4Jl
H3gZy48H7w==
=URjd
-----END PGP SIGNATURE-----

--sxksscuwilvy7rfq--

