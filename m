Return-Path: <linux-media+bounces-51989-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JlSA215gGne8gIAu9opvQ
	(envelope-from <linux-media+bounces-51989-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:16:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A150DCAB55
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05D0930414FE
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACDD357A3D;
	Mon,  2 Feb 2026 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="grHdKIRC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oqH09scm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CA03563F9
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027165; cv=none; b=DFSyVsJ9sXn6OHJmlQmve0oLB53NrflefFxcbb+78pf31YniGWHwfDiFatcGEn3xUgp/kRmhZbhG9+b/tYkNRiM+Qw3YaZwjhblCIGN7RX2YlgVyI6IvTeQoSDbIJuRAivc94EQS5Bzexewg9odVNp+eNUH2fEAclTUjWyWQvNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027165; c=relaxed/simple;
	bh=+54t9JXO7n+eXPdANWOp0RpcdZIaJgMYBRBapxAnQOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INEPiif9bufn5pVgOZE9hVLYzYcIpjXCoAQC/5Nvq9nXQc/IPG3tnIP6zaNMr4Vtq2iKq5DaxzV0r/jEi65fHT+3Y7FeX8+oNlHhuL5R4nnojSHy1KcWBLTID4xNt9rnJ0ijGuKlIY/HiAehrRcqpOKkFCrXE30ISuuSMSD9oeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=grHdKIRC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oqH09scm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770027161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T8trzVS4ZUCHrBPpOVXGPFbB+m6G0A2WMMBaMJLn58s=;
	b=grHdKIRCq2qMDqKOTtkKRekxMw+/5A+wPdTHrVOUpHHAUKnIUuK5YB9fd4BV5YOBocjBkY
	Wcwm2N3YLJjzoqGW0wQK9HSFswcQK2op/GUfFaD+7i46kitoAtbPJnOA8YIZoFWdQL4f4I
	yyvQjtdqO04xDxbPjuoTyWO03Jxzfus=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-CLEbeAeONYWY4JLNaj-waA-1; Mon, 02 Feb 2026 05:12:40 -0500
X-MC-Unique: CLEbeAeONYWY4JLNaj-waA-1
X-Mimecast-MFC-AGG-ID: CLEbeAeONYWY4JLNaj-waA_1770027159
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4801c1056c7so22666565e9.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770027159; x=1770631959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8trzVS4ZUCHrBPpOVXGPFbB+m6G0A2WMMBaMJLn58s=;
        b=oqH09scm8tZr9T2nN1Cfq7lQQOa+2HDrxsRmxmOcosPLG7fxwLO+4Y26QJU3o50nG9
         auJ5MZwIQEZWU+oD/Jc468TGwa9IqZPpahX4JPsIL6oXLv+M900QbTngNePhRWWWu1Cx
         F3i5up0c1iIN0iI0NuyuP2W4HZ+0v0Y/f/NWaUtTCgTkvYC6gUcnonwqUCdOWoOxTtLX
         sGUIW/lHrkbjRvn8tgz7GIf3PLDJkb5FWPALj5D7S1QCZyyPzzeGKuz+htxPoYl27pNs
         Ng3bF+wMPdEp/wc/pGAiJEcJ9ZlbHLcTHDwNrNo6B5yD8oJhSFPZFQQvVaHwW+dvtopf
         xKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027159; x=1770631959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8trzVS4ZUCHrBPpOVXGPFbB+m6G0A2WMMBaMJLn58s=;
        b=gt0Ld1DFfP3/rYOolrBJozMOD4Le+961BtUDrDL/od9DX/yEnPfRyRoLSPSnWa5n73
         L7jI0bCqvjcWpV8uUrNv4HfLVGq6V10LakU2yydzgWZwX4s9UZxBc0wukQ0NX4JhnS9s
         orahTX59wlpbksDE68CcWmiqCuzl0/HtCciBZSsDYHzd+oN8zmo1oNA0a9LgPbSbrt1x
         hMCG8DNAnkQLoYjMKUDENmS/KDrh5MDmG5iHlhB6+9yMayWVMAbC0eeBEAhsZ1oLOx84
         Yck0IjUxY5Ro3i38oya2sBZbwHUSVwRZDaxFtMbARzLDs6smnr9eg0Lp7bTYuUApzbWv
         EMHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW1Eo1vXON62zufE/7IcPDQdR5L3H1s6MyS7NS1HeKn2nPknejH1WfGY/gmVt88tIQHsJS8a75EBIMhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytTYDgYE2VDXb9G00D9PitLOUrFoKTy6I+nX1inj0mXcpE2R+v
	JCuut9Z7FO45dEs3wk4K3OAxq3iObmd8Wr/TmtS46WEp6O4XHfCwCwKrU6XVU9DApu6yJkubwII
	f1Aj70Bkr4SIlP1uLnHLqiJcfFRjGtLhi143MwXcB3hrINjphnkGsvRLANLS1SCdE
X-Gm-Gg: AZuq6aIuNtBk9vkwumZ1qk0H/tOXwFvCT6I1MWAOAC95ikY5PHtF32rFz3wG3svANtk
	uCnkFPBYtjtmsZWCXSRbOU2+mb7anMDpwPhomTROZ5Q6Nardf52//amGQd4eBEbVDwgvgHjopq4
	lgDyxKnT9o3k0bGr1COs66d25oXm7FFJA7CBU2WJ59io5wtIMVwwh59IYMFilX/WniZvwp6/TGv
	U0GObQWrAaT7VXtEaCrB4nl60XmzsyvVMS2sLU3GWLTCqzK4ahtf4gB8HgBLK4EjR1EydzVhrly
	0GGeiYMXDLzVyimoQwNZn0AxOJBlLRhhGGC4P7VVajZ1EgO3anE7IDRtFHcSXQ==
X-Received: by 2002:a05:600c:6092:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-482db45441fmr144478625e9.12.1770027158988;
        Mon, 02 Feb 2026 02:12:38 -0800 (PST)
X-Received: by 2002:a05:600c:6092:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-482db45441fmr144478255e9.12.1770027158488;
        Mon, 02 Feb 2026 02:12:38 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffe9sm555222985e9.4.2026.02.02.02.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:12:37 -0800 (PST)
Date: Mon, 2 Feb 2026 11:12:37 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH] dma-buf: heaps: cma: register a dmem region for each cma
 heap
Message-ID: <20260202-wealthy-quick-cow-8c5421@houat>
References: <20260130-dmabuf-heap-cma-dmem-v1-1-3647ea993e99@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ourfsz72devil6zd"
Content-Disposition: inline
In-Reply-To: <20260130-dmabuf-heap-cma-dmem-v1-1-3647ea993e99@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51989-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A150DCAB55
X-Rspamd-Action: no action


--ourfsz72devil6zd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: heaps: cma: register a dmem region for each cma
 heap
MIME-Version: 1.0

Hi,

On Fri, Jan 30, 2026 at 05:55:30PM -0500, Eric Chanudet wrote:
> The cma dma-buf heaps let userspace allocate buffers in CMA regions
> without enforcing limits. Register a dmem region per cma heap and charge
> against it when allocating a buffer in a cma heap.
>=20
> For the default cma region, two heaps may be created for the same cma
> range:
> commit 854acbe75ff4 ("dma-buf: heaps: Give default CMA heap a fixed name")
>   Introduced /dev/dma_heap/default_cma_region
> commit 4f5f8baf7341 ("dma-buf: heaps: cma: Create CMA heap for each CMA
>                       reserved region")
>   Created a CMA heap for each CMA region, which might create a duplicate
>   heap to the default one, e.g:
>     /dev/dma_heap/default_cma_region
>     /dev/dma_heap/reserved
>=20
> Removing the legacy heap would break user API. So handle the special
> case by using one dmem between the two heaps to account charges
> correctly.
>=20
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
> In continuation with introducing cgroup for the system heap[1], this
> behavior is enabled based on dma_heap.mem_accounting, disabled by
> default.
>=20
> dmem is chosen for CMA heaps as it allows limits to be set for each
> region backing each heap. There is one caveat for the default cma range
> that may accessible through two different cma heaps, which is treated as
> a special case.
>=20
> [1] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ec=
c6b62cc446@redhat.com/
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 51 ++++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 46 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..608af8ad6bce7fe0321da6d8f=
1b65a69f5d8d950 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -27,6 +27,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> +#include <linux/cgroup_dmem.h>
> =20
>  #define DEFAULT_CMA_NAME "default_cma_region"
> =20
> @@ -46,7 +47,9 @@ int __init dma_heap_cma_register_heap(struct cma *cma)
>  struct cma_heap {
>  	struct dma_heap *heap;
>  	struct cma *cma;
> +	struct dmem_cgroup_region *cg;
>  };
> +static struct dmem_cgroup_region *default_cma_cg;
> =20
>  struct cma_heap_buffer {
>  	struct cma_heap *heap;
> @@ -58,6 +61,7 @@ struct cma_heap_buffer {
>  	pgoff_t pagecount;
>  	int vmap_cnt;
>  	void *vaddr;
> +	struct dmem_cgroup_pool_state *pool;
>  };
> =20
>  struct dma_heap_attachment {
> @@ -276,6 +280,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *=
dmabuf)
>  	kfree(buffer->pages);
>  	/* release memory */
>  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
> +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
>  	kfree(buffer);
>  }
> =20
> @@ -319,9 +324,16 @@ static struct dma_buf *cma_heap_allocate(struct dma_=
heap *heap,
>  	if (align > CONFIG_CMA_ALIGNMENT)
>  		align =3D CONFIG_CMA_ALIGNMENT;
> =20
> +	if (mem_accounting) {
> +		ret =3D dmem_cgroup_try_charge(cma_heap->cg, size,
> +					     &buffer->pool, NULL);
> +		if (ret)
> +			goto free_buffer;
> +	}
>
>  	cma_pages =3D cma_alloc(cma_heap->cma, pagecount, align, false);
>  	if (!cma_pages)
> -		goto free_buffer;
> +		goto uncharge_cgroup;
> =20
>  	/* Clear the cma pages */
>  	if (PageHighMem(cma_pages)) {
> @@ -376,6 +388,8 @@ static struct dma_buf *cma_heap_allocate(struct dma_h=
eap *heap,
>  	kfree(buffer->pages);
>  free_cma:
>  	cma_release(cma_heap->cma, cma_pages, pagecount);
> +uncharge_cgroup:
> +	dmem_cgroup_uncharge(buffer->pool, size);

Should we make that conditional on mem_accounting =3D=3D true ?

>  free_buffer:
>  	kfree(buffer);
> =20
> @@ -390,25 +404,52 @@ static int __init __add_cma_heap(struct cma *cma, c=
onst char *name)
>  {
>  	struct dma_heap_export_info exp_info;
>  	struct cma_heap *cma_heap;
> +	struct dmem_cgroup_region *region;
> +	int ret;
> =20
>  	cma_heap =3D kzalloc(sizeof(*cma_heap), GFP_KERNEL);
>  	if (!cma_heap)
>  		return -ENOMEM;
>  	cma_heap->cma =3D cma;
> =20
> +	/*
> +	 * If two heaps are created for the default cma region, use the same
> +	 * dmem for them. They both use the same memory pool.
> +	 */
> +	if (dev_get_cma_area(NULL) =3D=3D cma && default_cma_cg)
> +		region =3D default_cma_cg;
> +	else {
> +		region =3D dmem_cgroup_register_region(cma_get_size(cma), "cma/%s", na=
me);
> +		if (IS_ERR(region)) {
> +			ret =3D PTR_ERR(region);
> +			goto free_cma_heap;
> +		}
> +	}
> +	cma_heap->cg =3D region;
> +

I'm not sure it's the best way to go with this. We want to track all
relevant CMA allocations going forward, in the heaps and elsewhere.

If we were to do what you suggest, an allocation in, say, DRM or v4l2
wouldn't be tracked in the same region than one in the heaps, while we
want to have it cumulated.

I think we'd be better off if we created a dmem region for each CMA
region in the system, but we would charge from the heap so we don't
account for every allocation.

I don't think we can register the dmem region when the CMA area is
initialized though, since it will probably be too early in the kernel
boot and SLAB isn't around yet.

But since we would need an accessor to get a dmem region from a cma
region, we could do something like check if a dmem eregion already
exists for that cma region, and allocate one otherwise. Or have a
secondary initcall to allocate all dmem regions.

Maxime

--ourfsz72devil6zd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYB4kAAKCRAnX84Zoj2+
dqPBAX9oydlm9YZRNx1uUYcnGj8czxCI9/nwwv3lTG3vB/96CaCaciG72JRvyD2+
YtcMBPEBf2UZP8KVV1tDJ+oujyCdJZXIsjWxMc55iL7AcfydJqlROACsQSaGrLgZ
L+gEjF3czQ==
=dD0c
-----END PGP SIGNATURE-----

--ourfsz72devil6zd--


