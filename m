Return-Path: <linux-media+bounces-64208-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m+jsBOTyJmrkoQIAu9opvQ
	(envelope-from <linux-media+bounces-64208-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:50:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A5658EC4
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:50:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b="kc57xW//";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64208-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64208-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64F82337DAE6
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990BA40861E;
	Mon,  8 Jun 2026 15:01:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E7540BCC3;
	Mon,  8 Jun 2026 15:01:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930883; cv=none; b=q7jqIN93AGZGnrQv41kaETHAyu+bOHUlQ2ErDtcZyfLGLr35J5My9j6Yz+lYEOm3dEhAbFzgAnY8eCJA/q9GIL0rPrh/TGXaqMuQHLtiD2x7lKJSh9HsmgIQLtKS8lkAti+DAwRqLVwVc+FbxWtAArl2mFBW9vf163YBz+AB4QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930883; c=relaxed/simple;
	bh=NKP9ir8/NAmHYlfm0hZw49b1a56R0gaCRSmdEw7uKwM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/MLVlNk6ehO1yB38RTZ5+KuXnbMBfwgP9vXtCqmU1S0Q7qbC40Xbd8eQAnUa2BSvQDFTdJYIb26hBGoW8duXKM/mWnw1ZrPMi8aCzLfLaVlrgQ/10NG2kMP6tsX0qCMoPqD7S508uBB9qqAdb3OACCmbQU/E0WKAC3gXVT7QmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kc57xW//; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780930876;
	bh=NKP9ir8/NAmHYlfm0hZw49b1a56R0gaCRSmdEw7uKwM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kc57xW//jOAjV5tuRDn8U8tFSaYIM/zTPEsaCHQ1C3AU+FLwTjmyr3XOaQYVykrwX
	 DSkKGxc2MNi51e/UOzHxzEcVPrjHst0e4OQidxoRkkyjbGil4EZJ4GS92ouGk1VEu1
	 HX7iqzNvIKrmRTfKcDmQjGuYlfxGpsfMj7Jgkuld5IeC/Lt6gOUw7Gr9guTWeRUGK9
	 jq/VUR/3dLlfmG3TIwORPR2pFMWacfCXh0Q9t9So/8BkHrR0OQ2v7/Udx2v0ODQlaK
	 A73AhGvOLzf+kN5ctc7qOdgACC4E9Oh1lKou7/lgOSg6D6QRFwcfX09izXpdzQH8IZ
	 W6fCzm2dRf/yQ==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D66CB17E0979;
	Mon,  8 Jun 2026 17:01:15 +0200 (CEST)
Date: Mon, 8 Jun 2026 17:01:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
Message-ID: <20260608170112.24fd92df@fedora-2.home>
In-Reply-To: <20260608142436.265820-2-phasta@kernel.org>
References: <20260608142436.265820-2-phasta@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64208-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,collabora.com:dkim,collabora.com:from_mime,fedora-2.home:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 873A5658EC4

On Mon,  8 Jun 2026 16:24:37 +0200
Philipp Stanner <phasta@kernel.org> wrote:

> @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>  void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>  {
>  	const struct dma_fence_ops *ops;
> +	unsigned long flags;
>  
>  	rcu_read_lock();
>  	ops = rcu_dereference(fence->ops);
> -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> +	if (!ops || !ops->set_deadline) {
> +		rcu_read_unlock();
> +		return;
> +	}
> +
> +	dma_fence_lock_irqsave(fence, flags);
> +	if (!dma_fence_is_signaled_locked(fence))
>  		ops->set_deadline(fence, deadline);

You can't take the fence lock around ->set_deadline(), otherwise you'll
deadlock here [1] or here [2].

> +
> +	dma_fence_unlock_irqrestore(fence, flags);
>  	rcu_read_unlock();
>  }


[1]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/dma-buf/sw_sync.c#L182
[2]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/gpu/drm/msm/msm_fence.c#L139

