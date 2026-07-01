Return-Path: <linux-media+bounces-66157-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bmR2Mk26RGqYzgoAu9opvQ
	(envelope-from <linux-media+bounces-66157-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 08:57:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F986EA5DF
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 08:57:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="ZU/PqjLY";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66157-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66157-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63F95306BCD4
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 06:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F2D3B1EFC;
	Wed,  1 Jul 2026 06:52:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF036394464
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 06:52:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888744; cv=none; b=epjafVncpoGxCWWzRxY9izvY3OwhuATHnR7zIbAwNdAFGPNx14eX8+p6l0ggPspfjSHlzpmIBFD0YyElYNuneoAnBpUMgtAZsB9Udyk2FPHjHCX7SL/o0KYS4Za1GrmvJi2WEt+GsbRzlSLWKU6FmYuj4SGowRc92hzLLDg0N/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888744; c=relaxed/simple;
	bh=PHXs14EebcKtjFXK4tqArkhsYBrj/ptBAXkQ/CFpKOw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Njr9AAzcSdReoAjIMnbw1qjD8BVVBUs1F9U2jXuvfS3Q05ZNxmojXzxJ/be36/5GbLG5650WGMH6eoq2giTxP/5/TXexq4Ozi9JdL5EbV80LhvnX7ulfocOkqGUCYOsdVWCyLpwZlO6hC+U5egkQWK5HnOcvnz/caIgwpJ7nCPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZU/PqjLY; arc=none smtp.client-ip=80.241.56.152
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gqrKt35VBz9vGl;
	Wed,  1 Jul 2026 08:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782888738; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h0T0Aq4D0iiGnKHiN1eZ2zLsHAfporMJTH+keDJMVT0=;
	b=ZU/PqjLYdUiPOLC1o1CHkNqnRWsWfDKu4PG7OskLcj4psHOOoQ0zBRYGw6Gze2a14/sl2U
	wHMDkln3I3IaRs48Ku4lCmfKS8/KJPIFxPKn/HpIRkzVVyYNWShBhB6ZCw36RxQJhmNEgr
	T4C1QUc50rAHX5pr+aLHYYkI6E8q7ca3/5ba7n1XnpCzewzYb1wnHTXXP230V9lIVXQxgn
	gLiBHCdH5bg1fdWbhQz5JPG06JLtuI6ZEXiQskFJS26aHDHA1SgATq9yELWzTCub2AEcC6
	pOPxortvAhMhqLo2gl1lKSfxpuxgW0ta4z/zQFopBf2arSLnrfQDl6xWUyG+vA==
Message-ID: <9650c30654db85e393217fde419a966d312e4a43.camel@mailbox.org>
Subject: Re: [PATCH] dma_buf: change unsigned int and int types into size_t
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Shahyan Soltani <shahyan.soltani@amd.com>, christian.koenig@amd.com, 
	sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Date: Wed, 01 Jul 2026 08:52:15 +0200
In-Reply-To: <20260630160401.67544-1-shahyan.soltani@amd.com>
References: <20260630160401.67544-1-shahyan.soltani@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ybe5otnm1fhe4joh9rh1ax17bud13fw4
X-MBO-RS-ID: e2417a6c4c1abfbbfb5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,mailbox.org:from_mime];
	TAGGED_FROM(0.00)[bounces-66157-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shahyan.soltani@amd.com,m:christian.koenig@amd.com,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29F986EA5DF

On Tue, 2026-06-30 at 12:04 -0400, Shahyan Soltani wrote:
> The num_fences, count, i, and j variables in dma_fence_dedup_array() and
> __dma_fence_unwrap_merge() have inconsistent integer types, mixing both
> unsigned int and int.
>=20
> Use type size_t consistently for these instead, and update the return
> type of dma_fence_dedup_array() accordingly.
>=20
> Signed-off-by: Shahyan Soltani <shahyan.soltani@amd.com>
> Suggested-by: Philipp Stanner <phasta@mailbox.org>

Thx for fixing this, cool work

Reviewed-by: Philipp Stanner <phasta@kernel.org>

> ---
> The rest of the subsystems (dma_resv_reserve_fences, drm_exec, drm_gpuvm,
> xe, nouveau, etc) uses "unsigned int" for num_fences, for example the
> amdgpu caller in amdgpu_userq_fence.c.

You mention that because you can't / won't change them?

My suggestion actually has been to go for `unsigned int`. Christian
opinioned that it should be size_t. Shouldn't be a big deal, though, my
issue was just the possibility for negative numbers.

Christian, would it be a bit better to be consistent with the parties
Shayan mentions?


P.

>=20
> =C2=A0drivers/dma-buf/dma-fence-unwrap.c | 8 ++++----
> =C2=A0include/linux/dma-fence-unwrap.h=C2=A0=C2=A0 | 6 ++++--
> =C2=A02 files changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fen=
ce-unwrap.c
> index 53bb40e70b27..65e87d263c3a 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -93,9 +93,9 @@ static int fence_cmp(const void *_a, const void *_b)
> =C2=A0 *
> =C2=A0 * Return: Number of unique fences remaining in the array.
> =C2=A0 */
> -int dma_fence_dedup_array(struct dma_fence **fences, int num_fences)
> +size_t dma_fence_dedup_array(struct dma_fence **fences, size_t num_fence=
s)
> =C2=A0{
> -	int i, j;
> +	size_t i, j;
> =C2=A0
> =C2=A0	sort(fences, num_fences, sizeof(*fences), fence_cmp, NULL);
> =C2=A0
> @@ -115,14 +115,14 @@ int dma_fence_dedup_array(struct dma_fence **fences=
, int num_fences)
> =C2=A0EXPORT_SYMBOL_GPL(dma_fence_dedup_array);
> =C2=A0
> =C2=A0/* Implementation for the dma_fence_merge() marco, don't use direct=
ly */
> -struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
> +struct dma_fence *__dma_fence_unwrap_merge(size_t num_fences,
> =C2=A0					=C2=A0=C2=A0 struct dma_fence **fences,
> =C2=A0					=C2=A0=C2=A0 struct dma_fence_unwrap *iter)
> =C2=A0{
> =C2=A0	struct dma_fence *tmp, *unsignaled =3D NULL, **array;
> =C2=A0	struct dma_fence_array *result;
> =C2=A0	ktime_t timestamp;
> -	int i, count;
> +	size_t i, count;
> =C2=A0
> =C2=A0	count =3D 0;
> =C2=A0	timestamp =3D ns_to_ktime(0);
> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-u=
nwrap.h
> index 62df222fe0f1..7bfacdf79de2 100644
> --- a/include/linux/dma-fence-unwrap.h
> +++ b/include/linux/dma-fence-unwrap.h
> @@ -8,6 +8,8 @@
> =C2=A0#ifndef __LINUX_DMA_FENCE_UNWRAP_H
> =C2=A0#define __LINUX_DMA_FENCE_UNWRAP_H
> =C2=A0
> +#include <linux/types.h>
> +
> =C2=A0struct dma_fence;
> =C2=A0
> =C2=A0/**
> @@ -48,11 +50,11 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fe=
nce_unwrap *cursor);
> =C2=A0	for (fence =3D dma_fence_unwrap_first(head, cursor); fence;	\
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 fence =3D dma_fence_unwrap_next(cursor))
> =C2=A0
> -struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
> +struct dma_fence *__dma_fence_unwrap_merge(size_t num_fences,
> =C2=A0					=C2=A0=C2=A0 struct dma_fence **fences,
> =C2=A0					=C2=A0=C2=A0 struct dma_fence_unwrap *cursors);
> =C2=A0
> -int dma_fence_dedup_array(struct dma_fence **array, int num_fences);
> +size_t dma_fence_dedup_array(struct dma_fence **array, size_t num_fences=
);
> =C2=A0
> =C2=A0/**
> =C2=A0 * dma_fence_unwrap_merge - unwrap and merge fences

