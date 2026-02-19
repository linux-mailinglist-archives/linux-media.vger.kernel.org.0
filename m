Return-Path: <linux-media+bounces-53083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG/lHyzclmlJpgIAu9opvQ
	(envelope-from <linux-media+bounces-53083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:47:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D9715D7ED
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8EC83033AB0
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 09:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C63F548EE;
	Thu, 19 Feb 2026 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZnpcxBN0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="O2OMqjGB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC3E21ADB7
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771494333; cv=pass; b=oXLQYLQ1keuHqjkaOs13DT/oDeIhPotVAzbgaAlk1+ADETrz3m0izpLWobZX3p23/rdUP39J81FkRsmD3G7Pv+sRGdiFsr6LUqww0rTcSrO59RqG9W2aMoVMtfuKJkS7kj+dUJ9k+NX8flbYp+oa1um/jT51V/7eAPDa+SFDXec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771494333; c=relaxed/simple;
	bh=hZUPDfJno0KShOcXhqHgbVffPezF2caUnllpBqqzlpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jq+KyOYQq6A8tj0pbkzAKvVuL9KQAtpANfkDH3qH07dA3ShcKNAcM0+8s0A2dXQJZuSrsFy5iLGMpYti9Q/6wIX5MBKcoAPrVWrF6Sc7jCXHEFA2LYIx4WLiC0oAovyZduXN3bQdI/5DFaK59S6INEIr54KHpUon6++uu3cpiZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZnpcxBN0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=O2OMqjGB; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771494331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jc3i9FwjGQs8rH6ZGdIFq1/g5A3pmIExt0aTpd8WwbE=;
	b=ZnpcxBN0wUdRY3QMdCC0q6s+om+ROlbYUip9NFcJWTylBfNGwc5CXV9G498wxtiR173X25
	qaxo8mzVLtNW4dDJwmSPkcr5d0r+3xpiKmrGUcrXNlSxudJsvI1E6NwOpRCmuuXYZwpSc3
	pScq4hWdm9TQPMXixqKKITJc8JfY964=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-h1074kpqOvuDBP3_vTMIdw-1; Thu, 19 Feb 2026 04:45:29 -0500
X-MC-Unique: h1074kpqOvuDBP3_vTMIdw-1
X-Mimecast-MFC-AGG-ID: h1074kpqOvuDBP3_vTMIdw_1771494329
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-797b0076763so12488477b3.1
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 01:45:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771494329; cv=none;
        d=google.com; s=arc-20240605;
        b=YEo+5Wsi+l/r9J9kp7ZH9oABvdfPEOkwLln8NlozeEkz6RbYEx3E3yhl/VDHG15FSu
         scOTRKpf+opfF9wibFM5xwSUAdef0S0uYt9EJ3TmfiGysCfQLbmsBnGL+GGfeLYiDuao
         9jVAstVfji3ECouNCvvruepeP6onyOWMaMBnJTdnIgU+UOfs55U738OBqmC51oNUsx6a
         RfSCwvgZEhDI+0wc0xZljRKY/lgjqklkvJrgLqkTH+cDWYNVNjI9A7LkLCPIArOjE4vr
         4cp9JweRHAufig2MAwkPrt1CT9eNdh1tHeRZrxUkirQodOc6xxRxy+IrqRic94dfX3r+
         DWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jc3i9FwjGQs8rH6ZGdIFq1/g5A3pmIExt0aTpd8WwbE=;
        fh=crtm0HerCJqHAro3lqPMVaLoa/v8sXiSCUvNhJU2DMw=;
        b=PQzDQt8xWB4qn2PsTHF34O08OxeBogNXrmfIlCRH0P+Xrr+XYpwF/6vmUFQh7Da4nH
         GcAhskB1FnD7QJUCEYN66Dt9ZiPgbFA0GZo63DXh2DFjSzIzYgIHi7IX+PthdvMgEVzF
         TaImOHhaKH2Vz2ZhqICWEkGFw6J1kCmT3z7y4scoQx/SB+oeZWTNJLWFoSGZEwPHMGE3
         ZKTbQdJaF2jbrAbfA4aQNdPcR3vcT3biU5lwAH8bGF07/0Os0UM8MsQDp3k84ZS9i+dq
         o1PRfFpOojOYXgvTDYZQgnPcycM5s3jPXj5+TMvsrjTxFVVGHmQGnMUKXFo4xc5eUkFc
         Y/lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771494329; x=1772099129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc3i9FwjGQs8rH6ZGdIFq1/g5A3pmIExt0aTpd8WwbE=;
        b=O2OMqjGBr7oLIeRyFU3dKyeOUsghfH7hy79i6r4NhjVpRi+4XnKAgknHNJPDG+NgT+
         esziMWoglE9s6ulbBOlDfHL6qAhOpJrd7xL8j//4DTcm8qIBl4js0s99i7kEOBeXhrMz
         KFdZKMlPgFou7r45ynBzD2o2iaEXCg4SlB0uX8e02y4QHWdWXMyAIOoOJYti5GdlStkG
         +E/F8W6JtAFEk5yViRI/zrGNN64SmDvFacvr+/SbJ4UxFRsUPaSOEwWdUUnW+pm8rYLp
         WI8yRTSLcBlleU4VBun5G5PIc+4Wy1DkE2TXk2U4QSnxeQn8p9gvW5Y0D43bsaz5qXZX
         ijLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771494329; x=1772099129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jc3i9FwjGQs8rH6ZGdIFq1/g5A3pmIExt0aTpd8WwbE=;
        b=sWizXTcT6OsxsaHnFHQKk2zrEe0a3ASz2JodyZf5KQyumO3/KdptuyyGbaY3CUD5BB
         C5XQMzpWO3ft+fgjPUFvSlWKU5hoN4cYrMXt4eerT+GIgx/jtnh0DzaYV4J2g2W6V5fB
         TAK2wzaBcVD8L4OO4o7oA3ILdlKLbHtqNb5jgzKFL/n9VEPrABkUT4qykDwuOHJ6etZs
         JGGf0QhHq01tAJyK6tYuNQpZ3MHh8FRdvtv1p3ElD9lr6r7VylYjgPMmdGZp5JmDg6WZ
         utdsSVe2MpeOk9L1UgewqlnP9o3mFxa6YEbE0Gk7DzIEqM3bZ8A32EkzGSL9T/zDe5at
         NCzg==
X-Forwarded-Encrypted: i=1; AJvYcCV3KAHgaT3Yuhzftgva7Nn84inBLiMhTo5hOnKVMA3DRUABVb3FWy1yjVEfZemRDxewvMpDYCedHliBgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9neMKTG/RPq9jzgVGT3Gp+ByAs27m5k717aSqCYJh8I3jCIw+
	VIS/5LpkBulZt87Sk+6m3ggdCl0s8hFPMcBt6Ss+FL5uVm5WCrx/RvI/NGNTWV1urHwpCMkXZqy
	ASqbDzIPoJ/nkEdJay/xSlDg1M2X9l31JwXKAKhuzMZSb/r2EpU/2fQOUZFz5hHLz+559xuup6z
	3vpIpt3yCEN2JWxOVIwU7eQtNJviySfbwhFqSxPgU=
X-Gm-Gg: AZuq6aL44o2LOBA9sC4jDyclV7Jvho5SbOufXJ1FY5oWiWZo8bovylhXw4nrv+Q5fJf
	DqvFRUu51Pd84Yf56ocWv+WSrZGLHCdnqrFcdl1iT8kF7ghtYGEFXbKmD0u7PpWwCovgERcHvtw
	RstiawxQ/sCLOVuY5DaeFXIaI4Lt4QdBvhex8ErkKk4YGtA0hWJkA0xybXB6YXcSoKM7AriPtgy
	w==
X-Received: by 2002:a53:ac83:0:b0:64a:cece:95f0 with SMTP id 956f58d0204a3-64c21b189b8mr12656966d50.61.1771494329152;
        Thu, 19 Feb 2026 01:45:29 -0800 (PST)
X-Received: by 2002:a53:ac83:0:b0:64a:cece:95f0 with SMTP id
 956f58d0204a3-64c21b189b8mr12656956d50.61.1771494328829; Thu, 19 Feb 2026
 01:45:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
In-Reply-To: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 19 Feb 2026 10:45:17 +0100
X-Gm-Features: AaiRm51_qfw3XQOH44zsawVMk4430XcLLbmTSpOFr53O7yUQLt26G4MawVh9oqo
Message-ID: <CADSE00+6Jnv_R69nrWdakX2StNK058ksxva48z=ZnwT=Zr3UOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, linux-mm@kvack.org, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53083-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2D9715D7ED
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 6:15=E2=80=AFPM Eric Chanudet <echanude@redhat.com>=
 wrote:
>
> An earlier series[1] from Maxime introduced dmem to the cma allocator in
> an attempt to use it generally for dma-buf. Restart from there and apply
> the charge in the narrower context of the CMA dma-buf heap instead.
>
> In line with introducing cgroup to the system heap[2], this behavior is
> enabled based on dma_heap.mem_accounting, disabled by default.
>
> dmem is chosen for CMA heaps as it allows limits to be set for each
> region backing each heap. The charge is only put in the dma-buf heap for
> now as it guaranties it can be accounted against a userspace process
> that requested the allocation.
>
> [1] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@k=
ernel.org/
> [2] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ec=
c6b62cc446@redhat.com/
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>

Tested-by: Albert Esteve <aesteve@redhat.com>

I tested the series with a Fedora VM, setting the global user.slice
dmem.max value and then trying to allocate buffers of different sizes
with DMA_HEAP_IOCTL_ALLOC. Exceeding the max limit results in
'Resource temporarily unavailable' and the allocation fails.

BR,
Albert

> ---
> Changes in v2:
> - Rebase on Maxime's introduction of dmem to the cma allocator:
>   https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@ker=
nel.org/
> - Remove the dmem region registration from the cma dma-buf heap
> - Remove the misplaced logic for the default region.
> - Link to v1: https://lore.kernel.org/r/20260130-dmabuf-heap-cma-dmem-v1-=
1-3647ea993e99@redhat.com
>
> ---
> Eric Chanudet (1):
>       dma-buf: heaps: cma: charge each cma heap's dmem
>
> Maxime Ripard (2):
>       cma: Register dmem region for each cma region
>       cma: Provide accessor to cma dmem region
>
>  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
>  include/linux/cma.h              |  9 +++++++++
>  mm/cma.c                         | 20 +++++++++++++++++++-
>  mm/cma.h                         |  3 +++
>  4 files changed, 45 insertions(+), 2 deletions(-)
> ---
> base-commit: 948e195dfaa56e48eabda591f97630502ff7e27e
> change-id: 20260128-dmabuf-heap-cma-dmem-f4120a2df4a8
>
> Best regards,
> --
> Eric Chanudet <echanude@redhat.com>
>


