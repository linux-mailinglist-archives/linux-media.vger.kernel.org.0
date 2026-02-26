Return-Path: <linux-media+bounces-53477-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG1RHsUioGkDfwQAu9opvQ
	(envelope-from <linux-media+bounces-53477-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:39:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E38401A468F
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCA8C30117BE
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D859E3A960E;
	Thu, 26 Feb 2026 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoUxF9Ix"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494F03A0E91;
	Thu, 26 Feb 2026 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102329; cv=none; b=ZuxjZXiPZsEJRTp3RG7aA9xHWkcWyAiskwL2qo5N9lx95HICRlme3gAuYuJYXpcVDFfewe0O4Sc9Ss7Q5uKQtLGHXbU4erpEIdlZvilj+jqktKmx05CEee85gMgPZUdgjxNs6Zy+9d9ANfKnUmq3BWjAZpTxWvQVRyulyvKE5xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102329; c=relaxed/simple;
	bh=3cOwLR1yuzDPYHdlDaDVoK2pdPAwkELvu6I0P5vN37I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKjx+wp2SV4+gcZzRW4OzGxC9b5uY29qt0qDuskI8YYE8YUZ7ifR4rUBKb+4bX7HCmNMNXJlQ60jX8QZlwJEpaboOKo1cn8kNNkfPZDBBKqMBTKjgskHdqDMhRLJAVjVVdHXweh703Rgo60fgCEc8T8S9krXfFQ8KL2q4fAnUr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoUxF9Ix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD58C116C6;
	Thu, 26 Feb 2026 10:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772102328;
	bh=3cOwLR1yuzDPYHdlDaDVoK2pdPAwkELvu6I0P5vN37I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IoUxF9IxL7VVwAVoDntFnPAkfIWSHLhW91I1Vc9LOXHqb0Uv5XdMWsOeuNxkKOlnd
	 p3Sff2GOZ5ehabP7i/+BXiG0zYbPB6Arb/3mKU1+a/mWv5bIGqvClieRUtEppXthcQ
	 0H1WxNy4vKo21HkfKSYGPedzAB3nFwQ5J9qq0GHfEVX3acOJCbuDcs22o9CnL8xt/E
	 Fu3qNKVpZNdN/+9W8xTGnDVmZijhJcBEN+zPVPD/jByqSvdOseSF8hY0L0kC0Jh1cX
	 Kwd//qtejF+Wfw2gU6Db0AKwqmLV95mktrlNEV5tSKpS/hpQXsXe73uO29EgtHgVcs
	 RRhzUDaq86Bvw==
Date: Thu, 26 Feb 2026 11:38:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH 2/7] mm: cma: Export cma_alloc and cma_release
Message-ID: <20260226-impetuous-analytic-jellyfish-d4a86d@penduick>
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <20260225-dma-buf-heaps-as-modules-v1-2-2109225a090d@kernel.org>
 <60ecebf2-a708-4797-bedd-588c3e9931ff@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4m3wi7hiurafpqag"
Content-Disposition: inline
In-Reply-To: <60ecebf2-a708-4797-bedd-588c3e9931ff@kernel.org>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-53477-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E38401A468F
X-Rspamd-Action: no action


--4m3wi7hiurafpqag
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/7] mm: cma: Export cma_alloc and cma_release
MIME-Version: 1.0

Hi David,

On Thu, Feb 26, 2026 at 11:25:24AM +0100, David Hildenbrand (Arm) wrote:
> On 2/25/26 17:41, Maxime Ripard wrote:
> > The CMA dma-buf heap uses cma_alloc() and cma_release() to allocate and
> > free, respectively, its CMA buffers.
> >=20
> > However, these functions are not exported. Since we want to turn the CMA
> > heap into a module, let's export them both.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  mm/cma.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/mm/cma.c b/mm/cma.c
> > index 94b5da468a7d719e5144d33b06bcc7619c0fbcc9..be142b473f3bd41b9c7d8ba=
4397f018f6993d962 100644
> > --- a/mm/cma.c
> > +++ b/mm/cma.c
> > @@ -949,10 +949,11 @@ struct page *cma_alloc(struct cma *cma, unsigned =
long count,
> >  	if (page)
> >  		set_pages_refcounted(page, count);
> > =20
> >  	return page;
> >  }
> > +EXPORT_SYMBOL_GPL(cma_alloc);
> > =20
> >  static struct cma_memrange *find_cma_memrange(struct cma *cma,
> >  		const struct page *pages, unsigned long count)
> >  {
> >  	struct cma_memrange *cmr =3D NULL;
> > @@ -1025,10 +1026,11 @@ bool cma_release(struct cma *cma, const struct =
page *pages,
> > =20
> >  	__cma_release_frozen(cma, cmr, pages, count);
> > =20
> >  	return true;
> >  }
> > +EXPORT_SYMBOL_GPL(cma_release);
> > =20
> >  bool cma_release_frozen(struct cma *cma, const struct page *pages,
> >  		unsigned long count)
> >  {
> >  	struct cma_memrange *cmr;
> >=20
>=20
> I'm wondering whether we want to restrict all these exports to the
> dma-buf module only using EXPORT_SYMBOL_FOR_MODULES().

TIL about EXPORT_SYMBOL_FOR_MODULES, thanks.

> Especially dma_contiguous_default_area() (patch #4), I am not sure
> whether we want arbitrary modules to mess with that.

Yeah, I wasn't too fond about that one either. Alternatively, I guess we
could turn dev_get_cma_area into a non-inlined function and export that
instead?

Or we could do both.

Maxime

--4m3wi7hiurafpqag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaAitQAKCRAnX84Zoj2+
dn2RAX40ENhBNNnA9IVK7i0+qn5IsVH8v3M4faEFfo9IBr96Q8kfaeEhQLPJokV5
OD/rbD0BfA29oWhRpf5wZDuyQy8g1598nXD4qkmluGfS3ZE2BbGta/gjBRP5O3kl
YIcJ/SmxPQ==
=LmIK
-----END PGP SIGNATURE-----

--4m3wi7hiurafpqag--

