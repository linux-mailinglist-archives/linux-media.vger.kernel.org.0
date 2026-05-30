Return-Path: <linux-media+bounces-63097-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADmyANN1Gmoe4ggAu9opvQ
	(envelope-from <linux-media+bounces-63097-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 07:29:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D460B530
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 07:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1004303B6EF
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 05:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AA725F7A5;
	Sat, 30 May 2026 05:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAXz3jHA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E852231842
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 05:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780118912; cv=none; b=ulu2sKlMeLQwiiIL/DYXYLZA7sYEq2ILXGFPgHxoondgyK5veUH8a7g0BGCPAXDyZ9S7wSypDk+CgYQvISQtaV598KdFYeAUjlsFwaxfAEFF9SLEjM2mUbYUa3nWz4iY8CNnVG8XGEIjaBGe9Be1im52KDkVtM8zr9O03jfXW5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780118912; c=relaxed/simple;
	bh=SuCRJs41C+LdCiej0QcdlnDSc7NhR7cdLEKOEu7LacM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AM2PhqzfPKqr04EPTSO4Hwcc9SiYg1eQxbWC7ThU7UM/v7Uyky/fXBOrXB7ExP1dKkDLwHdRPKa5hOFdt2aL6VlEE1/xKiccJzKuKET7rmoRt3GfRASeSD/BxBU62dHGQ4WjIxxOwB4gBEAMDOWVjPAMMohVgfUHuAjlWAPVIcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAXz3jHA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CFC1F00899;
	Sat, 30 May 2026 05:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780118910;
	bh=C/VorpfD89TzFMsXVc2TFcwpSe/nSSbiS2fOW9uywTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RAXz3jHAx8a50n+FsAJIS/oDlEvZqxqinnwHCkZr8zBwmLR2pLiOuD/+BDoZZgLRN
	 X6I429St9PKQJ2boh/uziZC9gvj2H68eCAxfrlqsYjbzUt4VJEePlaidgBC3ir5Zzu
	 Ce1+vh/JBBNI4ugIUbRU3sj7S1tuSFFFmdkKQOFyw3KVHzhm2xC9qchSeP0fiTJBQM
	 W7L1AHEgK0R2I5uhj4tKztx72kO8EB9rva9c9K2tPrjOY4eynYYpG7s1FnC4wb1YcS
	 Gl5X56l1IEiRqOaT5/MxM5Eybf5wmTioc2BEZa6qh+UYFg6Oj9tBtThTC0sPp8qcvs
	 ksBXADiV0KoLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 5/6] drm/gem/shmem: Introduce
 __drm_gem_shmem_free_sgt_locked()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lyude Paul" <lyude@redhat.com>
Cc: ojeda@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260529183702.677677-6-lyude@redhat.com>
References: <20260529183702.677677-6-lyude@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 05:28:30 +0000
Message-Id: <20260530052830.77CFC1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63097-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: 556D460B530
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] `__drm_gem_shmem_free_sgt_locked` does not check if the GEM ob=
ject is imported, corrupting memory by unmapping and freeing an alien scatt=
erlist owned by the dma-buf exporter.
--

commit e016ae9bac4aed16d70a96e80b500f0d496fdf7d
Author: Lyude Paul <lyude@redhat.com>

drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()

This commit extracts the scatterlist unmapping and freeing logic into a new
exported helper, __drm_gem_shmem_free_sgt_locked(). This is intended to all=
ow
callers, such as the Rust shmem bindings, to manually unmap the sgt for a
GEM object as needed.

> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 545933c7f7121..c989459eb2159 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c

[ ... ]

> @@ -158,6 +158,30 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(st=
ruct drm_device *dev, size_t
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> =20
> +/**
> + * __drm_gem_shmem_release_sgt_locked - Unpin and DMA unmap pages, and r=
elease the
> + * cached scatter/gather table for an shmem GEM object.
> + * @shmem: shmem GEM object
> + *
> + * If the passed shmem object has an active scatter/gather table for dri=
ver
> + * usage, this function will unmap it and release the memory associated =
with it.
> + * It is the responsibility of the caller to ensure it holds the dma_res=
v_lock
> + * for this object.
> + *
> + * Drivers should not need to call this function themselves, it is mainly
> + * intended for usage in the Rust shmem bindings.
> + */
> +void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	dma_unmap_sgtable(shmem->base.dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, =
0);
> +	sg_free_table(shmem->sgt);
> +	kfree(shmem->sgt);
> +	shmem->sgt =3D NULL;
> +}
> +EXPORT_SYMBOL_GPL(__drm_gem_shmem_free_sgt_locked);

[Severity: Critical]
Does this helper need to check if the GEM object is imported?

If __drm_gem_shmem_free_sgt_locked() is called unconditionally on an import=
ed
GEM object (such as from the Rust bindings dropping an SGTableMap), it seems
like it will unmap and free the scatterlist that is actually owned by the
dma-buf exporter.=20

In the original code within drm_gem_shmem_release(), this memory was protec=
ted
by an explicit check:

	if (drm_gem_is_imported(obj)) {
		drm_prime_gem_destroy(obj, shmem->sgt);
	} else {
		...
		if (shmem->sgt)
			__drm_gem_shmem_free_sgt_locked(shmem);

Can bypassing the drm_gem_is_imported() check here lead to memory corruption
or double-free issues when the exporter also tries to clean up the table?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529183702.6776=
77-1-lyude@redhat.com?part=3D5

