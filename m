Return-Path: <linux-media+bounces-65848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KI95NyUZQmqg0AkAu9opvQ
	(envelope-from <linux-media+bounces-65848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:05:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 826966D6B3D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:05:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=OpZpETnl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65848-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65848-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C24F63000FF7
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897CF3B42E3;
	Mon, 29 Jun 2026 06:59:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD683A169F;
	Mon, 29 Jun 2026 06:59:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716397; cv=none; b=k37TqD1xDSJKzb5NDqS4JIK8FSwleDFzJOQaya8ryg/E/BvEpvi5CFqlbFohCSjoIfb2PJa9dPDTYCWG7orJmwnZjJdnFBUiZHUk3lAVU49sMg2NTOHp4M8GW8A07FM5MvHeL7q7bIXgHaRyUFKBsuFtzJ72diTNTOF3C9RHuFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716397; c=relaxed/simple;
	bh=cfj6qsLX7lbSG0og6v/xy08fwwUJ7Cuhaei+hCrYdR0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=odXrXz7z5gqpjeZRmF55fuaEW+pP7Wig98LoXz65/3MT7DA886AepkvbnTfAC8KReHHyzGQD+VP6zl0I+YOyFoUgMvxXlp62yQXkJ+PxgdhsR6aUQA1lKNmRnimlOkCBKVbhEHe7VvqfZkvAw1K3i8NsfxIZ2EGXFpEk/DadMYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OpZpETnl; arc=none smtp.client-ip=80.241.56.171
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gpcbW4kVfz9tv4;
	Mon, 29 Jun 2026 08:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782716391; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3hbzEnZLAxVe7ov2oMC76sAGhhFWZLnsRyY/MSpvDoM=;
	b=OpZpETnl2QbkF2dT5mnB5Yni7iy5P50niEkB/W2TSRxOOM32j7izTnQjyiENXcbK26PltS
	v3NslQjcrwoKez3ZUrZeKNsdYHpJHIyjJ/W/Yo0Bmqa5kWhPS3uachHQX+TLXQMJ4mLHI9
	Nm6hQ4d3/UPJEIxR56wmEXB4WubGN9NYpyDKIQq6m5x28UeyHv2dLCXaiKWeywrWktbL5K
	OQOuuge2wOLZ9QiSbbvZ2p3dfhWJDa7/lqSexq1rdxFq1+2mt40I5JgScnzON9FQ1TLjxb
	qiTOtHvA+Jgak4v64ATZwUhVlPVFSugA0cHre/RSPjKxRu3SQNTIjPILaeL/BA==
Message-ID: <e5b833e4c3764efa84f57e1b9691b946e0d3b1cd.camel@mailbox.org>
Subject: Re: [PATCH] dma-fence: Make dma_fence_dedup_array() robust against
 0-count input
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Baineng Shou <shoubaineng@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Akash Goel <akash.goel@arm.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Mon, 29 Jun 2026 08:59:47 +0200
In-Reply-To: <20260629031346.3875683-1-shoubaineng@gmail.com>
References: <20260629031346.3875683-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: bbk6f6twdq8kmn36mzidwpfnhkk5qc61
X-MBO-RS-ID: 236d4085a3bc31e8aaf
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65848-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,amd.com];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shoubaineng@gmail.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tursulin@ursulin.net,m:phasta@kernel.org,m:akash.goel@arm.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 826966D6B3D

On Mon, 2026-06-29 at 11:13 +0800, Baineng Shou wrote:
> dma_fence_dedup_array() returns 1 when called with num_fences =3D=3D 0:
> the for-loop body never executes, j stays at 0, and the final
> `return ++j` yields 1. This contradicts both the kernel-doc ("Return:
> Number of unique fences remaining in the array") and the natural
> expectation that 0 input gives 0 output.
>=20
> All in-tree callers currently filter num_fences =3D=3D 0 before invoking
> this helper (__dma_fence_unwrap_merge() bails out via the
> `if (count =3D=3D 0 || count =3D=3D 1)` fast path; amdgpu_userq_wait_*()
> cannot reach the dedup call with a zero local count because the
> amdgpu_userq_wait_add_fence() helper guarantees num_fences stays in
> [0, wait_info->num_fences], and wait_info->num_fences > 0 is enforced
> at the ioctl entry).
>=20
> However, dma_fence_dedup_array() is EXPORT_SYMBOL_GPL, so any future
> caller that forgets to pre-filter the zero case will get a misleading
> return value of 1. Depending on how that caller uses the result, it
> could dereference an uninitialized fence slot in the array, since the
> caller's array may have been allocated but not yet populated.
>=20
> Make the contract match the documentation by returning 0 early. This
> also skips an unnecessary sort() call on an empty array.
>=20
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
> ---
> =C2=A0drivers/dma-buf/dma-fence-unwrap.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fen=
ce-unwrap.c
> index 53bb40e70b27..364cbf79ad73 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -97,6 +97,9 @@ int dma_fence_dedup_array(struct dma_fence **fences, in=
t num_fences)
> =C2=A0{
> =C2=A0	int i, j;
> =C2=A0
> +	if (!num_fences)
> +		return 0;

Hm, since you're adding this, what about num_fences =3D -5 ?


Let me use this opportunity to also highlight that we should, in C, in
general get away from using int for everything.

__dma_fence_unwrap_merge() directly below uses unsigned int, as you
would expect. dma_fence_dedup_array() has almost no users. Probably we
should change that API to unsigned int, too?


Regards
P.

> +
> =C2=A0	sort(fences, num_fences, sizeof(*fences), fence_cmp, NULL);
> =C2=A0
> =C2=A0	/*

