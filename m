Return-Path: <linux-media+bounces-57739-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCaiAvd9y2mLIQYAu9opvQ
	(envelope-from <linux-media+bounces-57739-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:55:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 575693658F8
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE9FD3052622
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEBF3CE4BC;
	Tue, 31 Mar 2026 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Lg2A+cAQ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBF33C5DAD
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943392; cv=none; b=XO+RvxAXbvCU127P1lWjyPvorHDThwsKuaGReAIH2pB6Mk72COwA1PAT7Voh9Ss3Sp+s+Og4i//F2kyfTG90iBqxOTvWbHZ1avlAozB6c7U4vLKpd+qS697XNiy9ZfQ0NcaVzy77j041PCzICMhBFHr1kQKhuVREDMBjg9pXiRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943392; c=relaxed/simple;
	bh=LaeQPMcIQimdwej9sn0zSQ45Z5DVj1wYw17CvwPXfDs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mOgHBCTIToSyvUsWs0GfKm4Da+8YaVy9at/6aHN4yQ+2nW0yyuMLgfDvJyIVn81TVCOgJh9c7Sj2AveT/KKrbw1ZPtqj0zLmtUlSkkCzlXWPxE6dYad3N6fJs0nWKi/mr4Usq8BVzSFfchlAv3J45iGb7qtCoysJ4x7+Meud9Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Lg2A+cAQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774943389;
	bh=LaeQPMcIQimdwej9sn0zSQ45Z5DVj1wYw17CvwPXfDs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Lg2A+cAQKcXa7S5/O329V33nbxIKn+z3BybTFk3IRdqxsQ6gy3eMPS/LlUs9br9a1
	 CkqKWZAKCM5iN2+J6dv63qLNiG8YHNsM70PsRFLTZFmHl2SEtbDLVS0L2ujFEElxmB
	 pRuhIZ3wLBJokjXFnF7JGHYcj3waCEcGWMV7VyakM4pBRLt1faCSJezv9foyasiTVV
	 s2mC6kJBYx37RHozWgl5ODl+XH3qBpJ/uMc1llpgDb5c+fXvx50GLQwmXcHw4zVa2H
	 JNf2+53TPnBseGhDeTBKrQzhLF0bmhUjBWE24L6GbkE4DftXvqd319Pl7bIKjZPLMb
	 SrR5lszs0Puyw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 15E4617E3B54;
	Tue, 31 Mar 2026 09:49:49 +0200 (CEST)
Date: Tue, 31 Mar 2026 09:49:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Philipp Stanner
 <phasta@kernel.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] dma-fence: Move signalling tracepoint to before ops
 detach
Message-ID: <20260331094944.772833c0@fedora>
In-Reply-To: <20260330133623.17704-1-tvrtko.ursulin@igalia.com>
References: <20260330133623.17704-1-tvrtko.ursulin@igalia.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-57739-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,collabora.com:dkim,collabora.com:email,igalia.com:email]
X-Rspamd-Queue-Id: 575693658F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 14:36:23 +0100
Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:

> Move the signalling tracepoint to before fence->ops are reset otherwise
> tracepoint will dereference a null pointer.

I suspect other trace points are impacted too
(trace_dma_fence_destroy() is, at the very least).

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/dma-buf/dma-fence.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 1826ba73094c..1c1eaecaf1b0 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fen=
ce *fence,
>  				      &fence->flags)))
>  		return;
> =20
> +	trace_dma_fence_signaled(fence);
> +
>  	/*
>  	 * When neither a release nor a wait operation is specified set the ops
>  	 * pointer to NULL to allow the fence structure to become independent
> @@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fen=
ce *fence,
> =20
>  	fence->timestamp =3D timestamp;
>  	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
> -	trace_dma_fence_signaled(fence);
> =20
>  	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
>  		INIT_LIST_HEAD(&cur->node);


