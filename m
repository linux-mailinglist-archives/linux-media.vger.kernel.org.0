Return-Path: <linux-media+bounces-54067-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIjmNxtXpWmh9gUAu9opvQ
	(envelope-from <linux-media+bounces-54067-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:23:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DC41D57C2
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86556306A927
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 09:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1D138E5C7;
	Mon,  2 Mar 2026 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jy20L4Id"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3781438A705;
	Mon,  2 Mar 2026 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443160; cv=none; b=LzT0xvnadWo/xRNXWpAFo0EwebG9mpFCEk2P8TTFWU60NwypDbi4CPKz16JEiPTvnhr4dpWzFY2Qu8DrAA2R95rWYn5NnEgVmWiXw1wYRe433kX/xVtUEt74TGtHp1OCoLnA40hiEuaUkLprnGxhat1iHPwaNGZzP62YzWjWI/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443160; c=relaxed/simple;
	bh=TaaPRzIzsiJYCDrLVRH+cpv6R+qksPRRJnPucWJCJnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbPqQQzkS2jPSpxKbsWqeNBlBBKGRXBDfo8GQ1nr1j6cpicuO9rnJU5gKmZ3HkVzH2YGIgDBC/FXm8zkPAj+3y465FvT3MYGcaDVM34FtopYvIDVfTK5b0Y9Tzz/VbO8LT9Z4dttT+q5nBNf9rTkAISQH2AzcbFiVtJrMp4oPuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jy20L4Id; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F036C19423;
	Mon,  2 Mar 2026 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772443159;
	bh=TaaPRzIzsiJYCDrLVRH+cpv6R+qksPRRJnPucWJCJnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jy20L4IdLKDTKoVZQQplQ52NEMl1acstjLIcsyA3F/3VBPZyXDttoIxL7TC7C3Y15
	 LweIa9LyHH5q6gmi5/iRz2CC7fN1udYPQ2OiopniwlmgyNilUn1QCMSmXAA3ccbXP6
	 lYbf1HjVAKSY5skXVBd2hIYCLZakSEZ8Z98i08TyYdKTDLrSYLOcWwPFUCSueJrh9M
	 w1vKDzKQfBn3fQZV4WHHsA29DaNZGgH1yHACqbLunffygCzcVFlm0fuGorhxSYtezw
	 DFlln5IO18wQ694ztJi0IbbdJJZMlZd/lsPfOmWBaBtOW+S+FBLm/vkSRIITObml5Z
	 dMQNK4sJwV4AA==
Date: Mon, 2 Mar 2026 10:19:17 +0100
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
Subject: Re: [PATCH v2 6/9] mm: cma: Export cma_get_name
Message-ID: <20260302-unbiased-chinchilla-of-honor-0df03d@houat>
References: <20260227-dma-buf-heaps-as-modules-v2-0-454aee7e06cc@kernel.org>
 <20260227-dma-buf-heaps-as-modules-v2-6-454aee7e06cc@kernel.org>
 <ca2ada49-08cf-43e6-a857-85994374549d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="b3uwsakrtltovl2y"
Content-Disposition: inline
In-Reply-To: <ca2ada49-08cf-43e6-a857-85994374549d@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54067-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40DC41D57C2
X-Rspamd-Action: no action


--b3uwsakrtltovl2y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 6/9] mm: cma: Export cma_get_name
MIME-Version: 1.0

Hi,

On Fri, Feb 27, 2026 at 09:43:12PM +0100, David Hildenbrand (Arm) wrote:
> On 2/27/26 14:15, Maxime Ripard wrote:
> > The CMA dma-buf heap uses the cma_get_name() function to get the name of
> > the heap instance it's going to create.
> >=20
> > However, this function is not exported. Since we want to turn the CMA
> > heap into a module, let's export it.
> >=20
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  mm/cma.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/mm/cma.c b/mm/cma.c
> > index be142b473f3bd41b9c7d8ba4397f018f6993d962..550effb9c4e01cc488b5744=
fe61d55a5b70a6d6c 100644
> > --- a/mm/cma.c
> > +++ b/mm/cma.c
> > @@ -50,10 +50,11 @@ unsigned long cma_get_size(const struct cma *cma)
> > =20
> >  const char *cma_get_name(const struct cma *cma)
> >  {
> >  	return cma->name;
> >  }
> > +EXPORT_SYMBOL_GPL(cma_get_name);
>=20
> No real reason to not squash this patch into #5, right?

I was assuming it was not really the same "category" of the API than
alloc/free, so the reviews might not be the same (like they weren't for
dma_contiguous_default_area). But I guess it also makes sense to squash
both.

I'll update the series

Thanks!

--b3uwsakrtltovl2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaVWFAAKCRAnX84Zoj2+
dlFeAYDD9X9Vv/iM+aCL1lvTjD+K8ui/7OeGWlPDYDEF5o8UD5uVMHs3IY6BHmA1
KoFaDiABgJ1s+qzY07V4RNSom5YMw3yvdtgLOkUoHeCUwOCbz2vqhwSWpT/dAmyd
6eWOH1SckQ==
=KM0Q
-----END PGP SIGNATURE-----

--b3uwsakrtltovl2y--

