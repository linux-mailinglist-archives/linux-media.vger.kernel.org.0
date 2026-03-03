Return-Path: <linux-media+bounces-54362-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Hw1KJfhpmkPYQAAu9opvQ
	(envelope-from <linux-media+bounces-54362-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 14:26:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D031F02D7
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 14:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F7863138F48
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 13:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0CD423A8E;
	Tue,  3 Mar 2026 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rxq8YKY/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fLF6JY8P"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534FF421EE8
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544043; cv=none; b=Cbg5eHivtp0eYkCXRnVUzo2kvXNHAYm/+XdTaeIu/to0s3WVNwjHkIu+LFqfz4MLMtBchCqpRbrL6PvwaIN6iIxwOnnj0DbXMbEjEuXa2yUvDBPSlOTKfutSgevYJVmTX1bvDqSNnL7+fWCGAM1cHVJSbX1SmPuRxUo5ipKkTw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544043; c=relaxed/simple;
	bh=J4csnvn+Bc+XOoKsNSRfk9sHct/ghF7OEQ7i1GtycAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGuGVyfKkleiisrzXhGa3qHEIVdU54F/ewzvZ8uIyW+XeUNNp1YLeK0EUaSSeXupxB79mWsUSdybVgVk6AwTGXS02Xg6QaFelfp9wCpdnEwVbsXCAmjwJtv+eFeLeaKjUyth+YOAr78+MmsG5HZviq1VOeUJTiuf+fLbVX+K7xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rxq8YKY/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fLF6JY8P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772544041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8HeSeolQ1fBhOJOln5m5tn/ig4w91f0rYiMidADsnM8=;
	b=Rxq8YKY/G0MAzRHW70jR/uxPVvH1nHRtu+bppm/uTpFOnBZFyuh0DVbUoxn/kEbH6edYQH
	HBMW38YqkVC2puMmCBRmXH0u7l/yX5IuaUmW1NuHYUYrMsb9ygXwmEkJgiMnpBSgefDchZ
	xBZJua9+qdrY5b/r/7FErxYln+YB2rU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-uj_3Vc_KN1yN6sV6BZXTow-1; Tue, 03 Mar 2026 08:20:38 -0500
X-MC-Unique: uj_3Vc_KN1yN6sV6BZXTow-1
X-Mimecast-MFC-AGG-ID: uj_3Vc_KN1yN6sV6BZXTow_1772544037
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-439c2a0d821so277819f8f.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 05:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772544037; x=1773148837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8HeSeolQ1fBhOJOln5m5tn/ig4w91f0rYiMidADsnM8=;
        b=fLF6JY8PeN2Fyly1gwQVpvjd95zb5DouTdxj8dXwFPWl1hHChYllKiVN0fGfHlp0li
         mXU/35kWjauRnc6tZHhtOwrUfmKakORcunlALDKqmKyvutsrZAHVhYuaEtUQHgJs2oZa
         i8Xm/NVxMcmOJtO7HEMLp/N5eK5e6Mfa+LiEBdblRwOd9qvNevI5mUsnbK2P0+QlYgK3
         4+2KpvikPN70zjJus/ek/Vz8diunEBM9P6yKEPkiqlFH3rLYITnSItJZn06H5BiQu63f
         KOS/Fv3CVXMyZUJZtKJa6sCgXK5dl+7EifcSZi2Ku91XX/mOXIQHAmNlNDbNjJ0XVB5n
         uPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544037; x=1773148837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HeSeolQ1fBhOJOln5m5tn/ig4w91f0rYiMidADsnM8=;
        b=Pb6jxZEs2TVVZOj9JuoIC+1Zq74dzSv+qo6eBgS1ncr9TyxFmL1SP07VP/sc4dvxUe
         sDeu83tcP2Lre7DayoDB/DHR201c0kGUxPTSROoRp5rGbs0DcMPhf6naNo0GTOokFedm
         A0IcOenfHo5+YCDsLzXlWNG6GiFhSZf4+t6n1Gjp+YCN7YMYyMMlin70aYUXNIA4tQ+k
         Rqzh+rYfpxkAosQrjCo4VGtwyz1lEp1LltbcyQO1dWbuDEMW2WtRtH3uH0ayW6PwxPC6
         GV0D6H5QZbVHNwfhgOwsJ3tnlIl1GJTgDVSyDQIpbD/Dww9IQlZ6ct8E5UhrTvLvVPhF
         O7JA==
X-Forwarded-Encrypted: i=1; AJvYcCVi/iOp5iJVV+cIAU581CvkuRiyhuLnmzsOFxMKrccevDdxXunK9o0zmiCGEIVf4T5B/QDizRAqot897w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlJWlL5wOEUV76M3HL0ssM/YE/vn7GxlzNUan49Nv+abVFqwEO
	ZJbDvoOS1Rd0riz1vwCsoDoWuXEhbZ3vEtzYRaOrgrdcv9Zoqha4xwbH/88CpRWFWX/jpuF3qqr
	TJ0Komhtcm2p1mLS0H/55lBSpH6tSsI+5gn02d292e9cmnINJkgWw20MteVOk/Ce1
X-Gm-Gg: ATEYQzxD0ZX3TzIvZSzKF/GFuxYyxaEfj+kJS78nokhRcrURFRr28rEQ7aBhRnXaeR/
	O/91R+ZFXFKdkPZd0M4Yz6UVenIneLlRPd6FDv+Kcaa9SOwZ06Y/QZL1xWGKEQ0fpK2MjeaHavr
	Lgzm2lvsUYv6dLaME/EhLN/l4dBtd0CUJ05O773n1E7TB6lIGxb7cN5XfBU5vy1z93jIzwPn9oR
	dqwWpqI4CW0II1PNymoB+ABSUD5jV+Xdk8tA9cnPvuAabV4ZKO7/QtC+795wVkEyGxC5dOQRq1w
	xCyjkdWDMp0T/aRBTkgwGNRrPgSdrKJN9pC0UsS653sHh3JQbxH3OGUcJ52aL9O8dqtOW2dTHQ=
	=
X-Received: by 2002:a05:6000:25c6:b0:439:c14b:2100 with SMTP id ffacd0b85a97d-439c14b22d7mr3433792f8f.12.1772544036665;
        Tue, 03 Mar 2026 05:20:36 -0800 (PST)
X-Received: by 2002:a05:6000:25c6:b0:439:c14b:2100 with SMTP id ffacd0b85a97d-439c14b22d7mr3433696f8f.12.1772544036002;
        Tue, 03 Mar 2026 05:20:36 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439af926c53sm24022288f8f.8.2026.03.03.05.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:20:35 -0800 (PST)
Date: Tue, 3 Mar 2026 14:20:34 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, echanude@redhat.com
Subject: Re: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
Message-ID: <20260303-rigorous-cow-of-saturation-23f87b@houat>
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <20260303-b4-dmabuf-heap-coherent-rmem-v2-4-65a4653b3378@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3oyzr26awgsnuxvr"
Content-Disposition: inline
In-Reply-To: <20260303-b4-dmabuf-heap-coherent-rmem-v2-4-65a4653b3378@redhat.com>
X-Rspamd-Queue-Id: F2D031F02D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54362-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


--3oyzr26awgsnuxvr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
MIME-Version: 1.0

Hi,

On Tue, Mar 03, 2026 at 01:33:47PM +0100, Albert Esteve wrote:
> Add a dma-buf heap for DT coherent reserved-memory
> (i.e., 'shared-dma-pool' without 'reusable' property),
> exposing one heap per region for userspace buffers.
>=20
> The heap binds the heap device to each memory region so
> coherent allocations use the correct dev->dma_mem, and
> it defers registration until module_init when normal
> allocators are available.
>=20
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/dma-buf/dma-heap.c            |   4 +-
>  drivers/dma-buf/heaps/Kconfig         |   9 +
>  drivers/dma-buf/heaps/Makefile        |   1 +
>  drivers/dma-buf/heaps/coherent_heap.c | 426 ++++++++++++++++++++++++++++=
++++++
>  include/linux/dma-heap.h              |  11 +
>  include/linux/dma-map-ops.h           |   7 +
>  6 files changed, 456 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 88189d4e48561..ba87e5ac16ae2 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -390,8 +390,8 @@ struct dma_heap *dma_heap_add(const struct dma_heap_e=
xport_info *exp_info)
> =20
>  	heap =3D dma_heap_create(exp_info);
>  	if (IS_ERR(heap)) {
> -		pr_err("dma_heap: failed to create heap (%d)\n", PTR_ERR(heap));
> -		return PTR_ERR(heap);
> +		pr_err("dma_heap: failed to create heap (%ld)\n", PTR_ERR(heap));
> +		return ERR_CAST(heap);

This looks unrelated and should possibly be squashed into the previous
patch that introduces dma_heap_create()?

> +static int coherent_heap_init_dma_mask(struct device *dev)
> +{
> +	int ret;
> +
> +	ret =3D dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +	if (!ret)
> +		return 0;
> +
> +	/* Fallback to 32-bit DMA mask */
> +	return dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +}

Why do you need to mess with the DMA mask? I'd expect that device to be
able to access everything.

> +static int __coherent_heap_register(struct reserved_mem *rmem)
> +{
> +	struct dma_heap_export_info exp_info;
> +	struct coherent_heap *coh_heap;
> +	struct device *heap_dev;
> +	int ret;
> +
> +	if (!rmem || !rmem->name)
> +		return -EINVAL;
> +
> +	coh_heap =3D kzalloc_obj(*coh_heap);
> +	if (!coh_heap)
> +		return -ENOMEM;
> +
> +	coh_heap->rmem =3D rmem;
> +	coh_heap->name =3D kstrdup(rmem->name, GFP_KERNEL);
> +	if (!coh_heap->name) {
> +		ret =3D -ENOMEM;
> +		goto free_coherent_heap;
> +	}
> +
> +	exp_info.name =3D coh_heap->name;
> +	exp_info.ops =3D &coherent_heap_ops;
> +	exp_info.priv =3D coh_heap;
> +
> +	coh_heap->heap =3D dma_heap_create(&exp_info);
> +	if (IS_ERR(coh_heap->heap)) {
> +		ret =3D PTR_ERR(coh_heap->heap);
> +		goto free_name;
> +	}
> +
> +	heap_dev =3D dma_heap_get_dev(coh_heap->heap);
> +	ret =3D coherent_heap_init_dma_mask(heap_dev);
> +	if (ret) {
> +		pr_err("coherent_heap: failed to set DMA mask (%d)\n", ret);
> +		goto destroy_heap;
> +	}
> +
> +	ret =3D of_reserved_mem_device_init_with_mem(heap_dev, rmem);
> +	if (ret) {
> +		pr_err("coherent_heap: failed to initialize memory (%d)\n", ret);
> +		goto destroy_heap;
> +	}
> +
> +	ret =3D dma_heap_register(coh_heap->heap);
> +	if (ret) {
> +		pr_err("coherent_heap: failed to register heap (%d)\n", ret);
> +		goto destroy_heap;
> +	}

I guess it's more of a comment about your previous patch, but it's not
clear to me why you needed to split dma_heap_add into dma_heap_create /
_register. Can you expand a bit?

> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 1b0ea43ba66c3..77e6cb66ffce1 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -9,10 +9,12 @@
>  #ifndef _DMA_HEAPS_H
>  #define _DMA_HEAPS_H
> =20
> +#include <linux/errno.h>
>  #include <linux/types.h>
> =20
>  struct dma_heap;
>  struct device;
> +struct reserved_mem;
> =20
>  /**
>   * struct dma_heap_ops - ops to operate on a given heap
> @@ -53,4 +55,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_ex=
port_info *exp_info);
> =20
>  extern bool mem_accounting;
> =20
> +#if IS_ENABLED(CONFIG_DMABUF_HEAPS_COHERENT)
> +int dma_heap_coherent_register(struct reserved_mem *rmem);
> +#else
> +static inline int dma_heap_coherent_register(struct reserved_mem *rmem)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  #endif /* _DMA_HEAPS_H */

Do you still need that now that you switched to an iterator-like
function?

> diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> index 60b63756df821..c87e5e44e5383 100644
> --- a/include/linux/dma-map-ops.h
> +++ b/include/linux/dma-map-ops.h
> @@ -12,6 +12,7 @@
> =20
>  struct cma;
>  struct iommu_ops;
> +struct reserved_mem;
> =20
>  struct dma_map_ops {
>  	void *(*alloc)(struct device *dev, size_t size,
> @@ -161,6 +162,7 @@ int dma_alloc_from_dev_coherent(struct device *dev, s=
size_t size,
>  int dma_release_from_dev_coherent(struct device *dev, int order, void *v=
addr);
>  int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct=
 *vma,
>  		void *cpu_addr, size_t size, int *ret);
> +struct reserved_mem *dma_coherent_get_reserved_region(unsigned int idx);
>  #else
>  static inline int dma_declare_coherent_memory(struct device *dev,
>  		phys_addr_t phys_addr, dma_addr_t device_addr, size_t size)
> @@ -172,6 +174,11 @@ static inline int dma_declare_coherent_memory(struct=
 device *dev,
>  #define dma_release_from_dev_coherent(dev, order, vaddr) (0)
>  #define dma_mmap_from_dev_coherent(dev, vma, vaddr, order, ret) (0)
>  static inline void dma_release_coherent_memory(struct device *dev) { }
> +static inline
> +struct reserved_mem *dma_coherent_get_reserved_region(unsigned int idx)
> +{
> +	return NULL;
> +}
>  #endif /* CONFIG_DMA_DECLARE_COHERENT */
> =20
>  #ifdef CONFIG_DMA_GLOBAL_POOL

To preserve bisectability, you shouldn't do it that way. Introduce this
function into a preliminary patch, and then use it in this one.

Maxime

--3oyzr26awgsnuxvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaabgIgAKCRAnX84Zoj2+
dpoAAYDbvla5ginFJZBwWscCdbzpqxZu0Nmn5Wmi+a860nETKwKEQNqs0s5JuwUy
LJBvBPIBf3AhBVl15Ze7xHfd358n8N5AmjXfB9uhtuZLkCNeqTzjr/j0hj5xhQ45
SMroDA+cOQ==
=6R14
-----END PGP SIGNATURE-----

--3oyzr26awgsnuxvr--


