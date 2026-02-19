Return-Path: <linux-media+bounces-53082-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILjsMBTVlmmVowIAu9opvQ
	(envelope-from <linux-media+bounces-53082-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:17:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4829E15D43C
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5FD8303B970
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 09:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B30833987F;
	Thu, 19 Feb 2026 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S3oPSyt6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KN5g58Xd"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6451C3346A7
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492607; cv=none; b=EIQ7Sl/pCJnld2jRXE/fZOXJ9NkDgmj/NT8RNlJDpmYK5gIeOixwxUPaB2tJQ8/w9oHZ8n3naVNIKi02fcI2Pq7Y7vbvwel/4jlu59it97NfDgkL1EMP5pOlofvtxxK7cFS2vib36dTc+i5KbE781Pei0iqpauolRwtm658ZeZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492607; c=relaxed/simple;
	bh=aEyWs1Zvn9OJBYISRKRqEdGU3qAi+EDqYLdy0wsyuVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEcas59fkdFcc9DeSewVoyXBML9Mmj4QcuA5X24zNPPmpNySSTQzlzK0e7GmQanWYEpYdnqwVe7cGebb1iHnduq2noxzoO2ioTuxI8hkRPdSBvaWqoSUxMPZivFHONztja0UmN14ZRaiwwamdojt0BANLJPfig+JSkRErFJBohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S3oPSyt6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KN5g58Xd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771492605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FvCQKIeQDulHEvNvZG4/Rs7O2SMt0AI9xdkS+RkTuNc=;
	b=S3oPSyt6ZDAbe+yKY/3wSjr20G0/WTWyNBwT8wqkVykVvluG8yCDH/chQxob2SJ71YPtTJ
	FdcTwBfcs3O0NCehyro2mz0EI7h/ku53DXFhYR+5JQZAd6a7uG7EoEreTZjFwhDWkdW28W
	qNuigtps9/7fCvJBBtOT6XcXxY58jBI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-yiCGFjNoOCubnAwdutkyIg-1; Thu, 19 Feb 2026 04:16:41 -0500
X-MC-Unique: yiCGFjNoOCubnAwdutkyIg-1
X-Mimecast-MFC-AGG-ID: yiCGFjNoOCubnAwdutkyIg_1771492600
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4836b7fbf4fso6560535e9.2
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 01:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771492600; x=1772097400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvCQKIeQDulHEvNvZG4/Rs7O2SMt0AI9xdkS+RkTuNc=;
        b=KN5g58XdCaGHiKPmJ/NGudUiRrESmzZaMOV/jXZ8x6aymgjeiHsfDrCud/ZW+zwl+S
         gRVe4yHtRWQRqXYZS8Jwtgz2CrdbutF0EkD/nq1MXB46PipcWEyP5waQFHIe1d2XsHXn
         jEoxtTA17L68VM7A7oRA/t5RApeHxiUMyIf7j9axD1WTfMcYsiFsw9NPPkMdfgHL2F8Z
         vANmqarRKAJwPI27Q33JCUWpGkEj9WfEzX6fnWWHNBhkXPaTHk3VJTbulDco5K8hLwjm
         HYuCrmtBvHXmHx5QIxIvJWeT44ZjikrCIS7fTNH4y4bv9w01wmGBrhCWSttNxzS5cJ+L
         5fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771492600; x=1772097400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvCQKIeQDulHEvNvZG4/Rs7O2SMt0AI9xdkS+RkTuNc=;
        b=rifHlq7ZJhmWEm/nED8S4pY6ect/iJClvSsLR5LS+XfIPF7mJhpSmmtvKIAB3lqC2u
         syQLEweFYgWtPp0SRMAU0k+gQkQ3MOBIQsEfWY7keH7rqj+6ziE/HNi07dNkFJ7oKb6Z
         lGVC7i523/xp9+wPf7qowf2b7U4iYXuy262iOPt6R4CxXnp/g655a7iIpfT3BccZQOPG
         8UyF44URjqKQ1kwMlqK9HbPW5iENpLrYnTK0FQR+zaqLQV7yxVY0wLW9rOjBUQh3sdYT
         HGwy5Md0lFvnU2ESldR5yLuBX1pnDacp8G0K5P9pgVioDwdCCWpvCisf163qgWoR+t8h
         0S1w==
X-Forwarded-Encrypted: i=1; AJvYcCVwb2UQ4iVeLCAkbCy613uveEcQvjPNNTBNL2/N4/a8mnWG0kvbYhuAVFGHE1za8pExclq2K5zM7Ltyag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDKKg5ORMYvsNQAlb4LgtA+NV9NSEkD6cpQV75IlteMAAPdJ2M
	oWpGxiZyJOy43T4TOGll5WlECqSBpketcVcB0iopRtnRelHRAvxL55SdtIIxw/SM8e+cBxWTzAJ
	Ubjkta+fvh9Y9UfSBYgLRF0Ybr1zJQRkqBKQVRWZahYT3BXD+kAW6SmTcEgAyAj0Z
X-Gm-Gg: AZuq6aKSQAiXRSfSvLkSgKwLgvhtYuwI+fKvwYcFIfKtTzeKtbeQ70i4taEgOXQT0lz
	gn6ZT9DUbU2WmXx+LQUyVHlt/aLEJLjObqnR9YvLFmR1PTg5d5F0e4BnfXI94w6a8N+nhx9RCUk
	vZ+yEezyeGBE1Auzq/0oYBejX3PplgvvEYRuUiMlRsJ1d1eyBj6xBaRPjnIYiXNaiOEYVQEhNkd
	I1kJ7zZlgVomVhcyDtKFJhjL6OiiWIGT/FhUZy5BoG5gsiPU8j7KSPe0V8UJ2CrxqYh4TPXdwbU
	NFo7KwkCC0rtS3T07w+6kdT9WViZJV0OQFqG7vyeQdl5EftheIdVQmYl4WQqb46Js9O2HfNBsQ=
	=
X-Received: by 2002:a05:600c:8289:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-4839e66fc83mr23233435e9.36.1771492599591;
        Thu, 19 Feb 2026 01:16:39 -0800 (PST)
X-Received: by 2002:a05:600c:8289:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-4839e66fc83mr23232985e9.36.1771492599016;
        Thu, 19 Feb 2026 01:16:39 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839ea1e7e1sm14492695e9.2.2026.02.19.01.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 01:16:38 -0800 (PST)
Date: Thu, 19 Feb 2026 10:16:37 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>, 
	linux-mm@kvack.org
Subject: Re: [PATCH v2 3/3] dma-buf: heaps: cma: charge each cma heap's dmem
Message-ID: <20260219-illustrious-tungsten-starfish-5dad8c@houat>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="qbjavhllvvchwpql"
Content-Disposition: inline
In-Reply-To: <20260218-dmabuf-heap-cma-dmem-v2-3-b249886fb7b2@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53082-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4829E15D43C
X-Rspamd-Action: no action


--qbjavhllvvchwpql
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] dma-buf: heaps: cma: charge each cma heap's dmem
MIME-Version: 1.0

Hi,

On Wed, Feb 18, 2026 at 12:14:12PM -0500, Eric Chanudet wrote:
> The cma dma-buf heaps let userspace allocate buffers in CMA regions
> without enforcing limits. Since each cma region registers in dmem,
> charge against it when allocating a buffer in a cma heap.
>=20
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 49cc45fb42dd7200c3c14384bcfdbe85323454b1..bbd4f9495808da19256d97bd6=
a4dca3e1b0a30a0 100644
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
> @@ -58,6 +59,7 @@ struct cma_heap_buffer {
>  	pgoff_t pagecount;
>  	int vmap_cnt;
>  	void *vaddr;
> +	struct dmem_cgroup_pool_state *pool;

I guess we should add an #if IS_ENABLED #endif guard for dmem?

>  };
> =20
>  struct dma_heap_attachment {
> @@ -276,6 +278,7 @@ static void cma_heap_dma_buf_release(struct dma_buf *=
dmabuf)
>  	kfree(buffer->pages);
>  	/* release memory */
>  	cma_release(cma_heap->cma, buffer->cma_pages, buffer->pagecount);
> +	dmem_cgroup_uncharge(buffer->pool, buffer->len);
>  	kfree(buffer);
>  }
> =20
> @@ -319,9 +322,17 @@ static struct dma_buf *cma_heap_allocate(struct dma_=
heap *heap,
>  	if (align > CONFIG_CMA_ALIGNMENT)
>  		align =3D CONFIG_CMA_ALIGNMENT;
> =20
> +	if (mem_accounting) {
> +		ret =3D dmem_cgroup_try_charge(
> +			cma_get_dmem_cgroup_region(cma_heap->cma), size,
> +			&buffer->pool, NULL);

This alone doesn't call for a new version, but adhering to the kernel
coding style would look like this:

+		ret =3D dmem_cgroup_try_charge(cma_get_dmem_cgroup_region(cma_heap->cma),
+					     size, &buffer->pool, NULL);

It looks good to me otherwise,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--qbjavhllvvchwpql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZbU8AAKCRAnX84Zoj2+
diB9AYDhkg6+tBwkM8yMFN9/WFT+hpPNlhGw0UEY/ZE0DHuKywzN1rTS3USBgeXc
4vi8MkIBgIRG4eHa1thavtEHDzWooCqiLhwDczcPdIil4bWekTGZxgf1mQQHrqGd
pK5ZeNH5CQ==
=YZKD
-----END PGP SIGNATURE-----

--qbjavhllvvchwpql--


