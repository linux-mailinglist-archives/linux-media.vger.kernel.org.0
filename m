Return-Path: <linux-media+bounces-63321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN3UA/PnHWp0fwkAu9opvQ
	(envelope-from <linux-media+bounces-63321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:13:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF3A624F1C
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E13503014B3D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 20:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB0C39EF3D;
	Mon,  1 Jun 2026 20:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hgtwgt/x"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B979384248
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 20:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780344812; cv=none; b=uKNqlXVH8tGznqaMeOpmphrmUrnK8/87Xhlfzdjt3REgm2FLHA4W6nfC0KjZY0L/8vjeko07d0ZXw48KkDLd8cE+IsTTK+r/oQwYsMOcdGkezIytppF2MUql9GkJUj/XX4GlSfDgMVDTuGzrDH5MjYrh8p2lPDMyeVGvT5hzOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780344812; c=relaxed/simple;
	bh=u0rX3sKGf4C5jo5LQEf/2FBOuXxAQYeVc8y1nGDtWDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fql2JAQjc6Hd0kcJQSWYv4YN/9VAl9n2yls1GUYxDQyEQakeDB+PjB+dFt/Am2Fwk55ma3qGq7HNnan11zj+3QFL/txb1eEVU1KuDdFpiutWvfm2PPFEe93dN0U2o10Fj37YYHSy3fxsXeeY3ZStd89nu9YzlVBM3PMbq/U8Rzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hgtwgt/x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C191F00899;
	Mon,  1 Jun 2026 20:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780344810;
	bh=HWSPUBgngLhAY4SKqiAft6otrSrP1TLfmSB7ZiEjRvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hgtwgt/xqMez/9dmDPHHMVkR9nwyTTo3RZfbnBFo3jvuCwdH/VgIxM9ldu2aEaDFn
	 1OLv8Eu6hr6zxmshnWHn3OCzBKmahLaif0Z2SMUPwbpBtroHMPsP0nF9uEacd7ROlP
	 PtqBHBaNqlqeY43CtgfbgI+yllxA7aw2uYgS1MUKvcm3k+NipJWaPk6XTOq2icraNB
	 JwrVKe69aYRreVmKngL8+8zlnbBkO+nRalmIG4QIZe0wF8JFNCWfF/Hv6axwCxFRUA
	 U/HU4G7mirxpc7Fjsa3bKVxmId4ReG09kU3e4gpo0TTqmrxQWyMzediEnLR55tMkji
	 m2M3eYjowxO0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] dma-buf: Fix silent overflow for phys vec to sgt
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Hu" <xuehaohu@google.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260601200012.3872274-1-xuehaohu@google.com>
References: <20260601200012.3872274-1-xuehaohu@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 20:13:30 +0000
Message-Id: <20260601201330.B6C191F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63321-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: 3EF3A624F1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The error path `err_unmap_dma` overwrites the failure loop index `=
i` and unmaps uninitialized scatterlist entries.
- [High] IOVA space allocated by `dma_iova_try_alloc()` is persistently lea=
ked on multiple error paths.
- [High] DIV_ROUND_UP(length, UINT_MAX) silently evaluates to 0 on 32-bit a=
rchitectures for any length >=3D 2, completely breaking mappings.
- [High] The error unmap path illegally calls `dma_unmap_phys` on split sca=
tterlist chunks rather than the original contiguous mapped regions.
- [High] dma_iova_link() is repeatedly called with a hardcoded offset of 0,=
 causing all physical ranges to be mapped overlapping at the start of the I=
OVA space.
- [High] Setting `orig_nents =3D 0` fundamentally breaks `sg_free_table()`,=
 permanently leaking the scatterlist array.
- [High] Mismatch between accumulated `mapped_len` and provided `size` lead=
s to SG table overflow and NULL pointer dereference.
- [High] Splitting physical ranges exactly at `UINT_MAX` generates unaligne=
d intermediate DMA segments.
--

commit e199cb367b5da0ba616a053228a5bf5567f3d335
Author: David Hu <xuehaohu@google.com>

dma-buf: Fix silent overflow for phys vec to sgt

This commit changes mapped_len and nents to size_t to prevent silent=20
wrap-around when accumulating lengths larger than 4G. It ensures sizes
are correctly calculated and guards against UINT_MAX overflows.

> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-=
mapping.c
> index 794acff2546a3..607b7998463d0 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -10,7 +10,7 @@ static struct scatterlist *fill_sg_entry(struct scatter=
list *sgl, size_t length,
>  					 dma_addr_t addr)
>  {
>  	unsigned int len, nents;
> -	int i;
> +	unsigned int i;
> =20
>  	nents =3D DIV_ROUND_UP(length, UINT_MAX);

[Severity: High]
This is a pre-existing issue, but does DIV_ROUND_UP evaluate to 0 on 32-bit
architectures?

On 32-bit systems, size_t is 32-bit. The macro DIV_ROUND_UP(length, UINT_MA=
X)
expands to (length + 0xFFFFFFFF - 1) / 0xFFFFFFFF. For any length >=3D 2, t=
he
addition overflows the 32-bit limit, wrapping around to a small value.
Dividing this wrapped value by 0xFFFFFFFF yields 0.

Could this evaluate nents to 0 and skip the loop entirely?

>  	for (i =3D 0; i < nents; i++) {
>  		len =3D min_t(size_t, length, UINT_MAX);

[Severity: High]
This isn't a bug introduced by this patch, but does splitting physical rang=
es
exactly at UINT_MAX generate unaligned intermediate DMA segments?

When a physical range exceeds UINT_MAX (4GB - 1 bytes), this loop splits it
into multiple scatterlist entries. Because UINT_MAX is an odd number
(0xFFFFFFFF), the first segment receives an unaligned length, and the next
segment begins at an unaligned address (addr + 0xFFFFFFFF).

Since hardware DMA controllers often require segment lengths and addresses =
to
be properly aligned, could submitting an odd-aligned DMA segment trigger
hardware DMA faults?

[ ... ]
> @@ -36,7 +36,7 @@ static unsigned int calc_sg_nents(struct dma_iova_state=
 *state,
>  				  struct phys_vec *phys_vec, size_t nr_ranges,
>  				  size_t size)
>  {
> -	unsigned int nents =3D 0;
> +	size_t nents =3D 0;
>  	size_t i;
> =20
>  	if (!state || !dma_use_iova(state)) {
> @@ -51,6 +51,9 @@ static unsigned int calc_sg_nents(struct dma_iova_state=
 *state,
>  		nents =3D DIV_ROUND_UP(size, UINT_MAX);

[Severity: High]
This is a pre-existing issue, but on 32-bit architectures, will this also w=
rap
around to 0 for any size >=3D 2 due to the DIV_ROUND_UP macro?

This would evaluate nents to 0, which immediately fails the mapping with
-EINVAL in the new patch code, potentially breaking DMA mappings for buffers
>=3D 2 bytes on 32-bit platforms.

>  	}
> =20
> +	if (nents > UINT_MAX)
> +		return 0;
> +
>  	return nents;
>  }
[ ... ]
> @@ -133,6 +137,11 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_=
buf_attachment *attach,
>  	}
> =20
>  	nents =3D calc_sg_nents(dma->state, phys_vec, nr_ranges, size);
> +	if (!nents) {
> +		ret =3D -EINVAL;
> +		goto err_free_state;

[Severity: High]
This isn't a bug introduced by this patch, but does jumping to
err_free_state leak the IOVA space?

When using PCI_P2PDMA_MAP_THRU_HOST_BRIDGE, an IOVA region is
pre-allocated. The err_free_state path frees dma->state but never calls
dma_iova_destroy().

Could this persistently leak the IOVA space allocated by
dma_iova_try_alloc()?

> +	}
> +
>  	ret =3D sg_alloc_table(&dma->sgt, nents, GFP_KERNEL | __GFP_ZERO);
>  	if (ret)
>  		goto err_free_state;
>
>  	sgl =3D dma->sgt.sgl;
> =20
>  	for (i =3D 0; i < nr_ranges; i++) {
>  		if (!dma->state) {
>  			addr =3D pci_p2pdma_bus_addr_map(provider,
>  						       phys_vec[i].paddr);
>  		} else if (dma_use_iova(dma->state)) {
>  			ret =3D dma_iova_link(attach->dev, dma->state,
>  					    phys_vec[i].paddr, 0,

[Severity: High]
This is a pre-existing issue, but does passing a hardcoded 0 for the offset
cause all physical ranges to overlap?

Inside the mapping loop, physical ranges are linked into the IOVA space via
dma_iova_link(). The fourth parameter expects the offset within the IOVA sp=
ace.
Passing a hardcoded 0 instead of the accumulated mapped_len causes every
subsequent physical range to overwrite the exact same starting region.

Could this corrupt the DMA mapping arrangement and break DMA isolation?

>  					    phys_vec[i].len, dir,
>  					    DMA_ATTR_MMIO);
[ ... ]
>  	if (dma->state && dma_use_iova(dma->state)) {
>  		WARN_ON_ONCE(mapped_len !=3D size);

[Severity: High]
This is a pre-existing issue, but what happens if mapped_len exceeds size?

The function emits a warning but does not abort execution, passing the larg=
er
mapped_len to fill_sg_entry(). Because the iteration count inside
fill_sg_entry will exceed the allocated SGL nents, sg_next(sgl) will
eventually return NULL.

Could this lead to a NULL pointer dereference in the next iteration?

>  		ret =3D dma_iova_sync(attach->dev, dma->state, 0, mapped_len);
>  		if (ret)
>  			goto err_unmap_dma;
[ ... ]
>  	/*
>  	 * No CPU list included =E2=80=94 set orig_nents =3D 0 so others can de=
tect
>  	 * this via SG table (use nents only).
>  	 */
>  	dma->sgt.orig_nents =3D 0;

[Severity: High]
This is a pre-existing issue, but does manually zeroing out orig_nents
break sg_free_table()?

When the mapping is later destroyed, the code calls sg_free_table().
Internally, __sg_free_table() relies on table->orig_nents as the loop
condition to free the underlying scatterlist chunks.

Because it is 0, will the internal while (table->orig_nents) loop immediate=
ly
exit without executing kfree(), silently leaking the entire SG table
allocation?

> =20
>  	/*
>  	 * SGL must be NULL to indicate that SGL is the last one
>  	 * and we allocated correct number of entries in sg_alloc_table()
>  	 */
>  	WARN_ON_ONCE(sgl);
>  	return &dma->sgt;
> =20
>  err_unmap_dma:
>  	if (!i || !dma->state) {
>  		; /* Do nothing */

[Severity: High]
This is a pre-existing issue, but does the !i check incorrectly skip IOVA
cleanup if linking fails on the very first physical range?

If the mapping loop fails on its first iteration (i =3D=3D 0), the err_unma=
p_dma
handler hits this condition and skips dma_iova_destroy, leaking the space.

>  	} else if (dma_use_iova(dma->state)) {
>  		dma_iova_destroy(attach->dev, dma->state, mapped_len, dir,
>  				 DMA_ATTR_MMIO);
>  	} else {
>  		for_each_sgtable_dma_sg(&dma->sgt, sgl, i)
>  			dma_unmap_phys(attach->dev, sg_dma_address(sgl),
>  				       sg_dma_len(sgl), dir, DMA_ATTR_MMIO);

[Severity: High]
This is a pre-existing issue, but does this loop overwrite the failure loop
index i and unmap uninitialized scatterlist entries?

The error handling loop for_each_sgtable_dma_sg resets the index i to 0 and
iterates up to (sgt)->nents. Because the scatterlist table was allocated at
full capacity with __GFP_ZERO, unpopulated SGL entries have
sg_dma_address =3D=3D 0 and sg_dma_len =3D=3D 0.

Could calling dma_unmap_phys on these uninitialized entries violate the DMA=
 API
and trigger IOMMU faults?

[Severity: High]
This isn't a bug introduced by this patch, but does calling dma_unmap_phys
on split scatterlist chunks violate the DMA API?

The code maps the full physical memory range dynamically using dma_map_phys=
()
as a single contiguous mapping. The helper fill_sg_entry() then splits this
mapping into multiple SG list entries.

If an error occurs, the cleanup path iterates over the scattered pieces and
calls dma_unmap_phys() on the individual split chunks.

Since the DMA API requires that unmapping must be performed using the exact
contiguous address and length originally returned by the map function, could
unmapping sub-ranges cause IOMMU state corruption?

>  	}
>  	sg_free_table(&dma->sgt);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601200012.3872=
274-1-xuehaohu@google.com?part=3D1

