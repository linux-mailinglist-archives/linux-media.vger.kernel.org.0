Return-Path: <linux-media+bounces-60572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBqJEggZ+2mYWgMAu9opvQ
	(envelope-from <linux-media+bounces-60572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:33:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE54D9581
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99463301A1C4
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 10:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FA14014A4;
	Wed,  6 May 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dHhX2DDE"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839335294E;
	Wed,  6 May 2026 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063602; cv=none; b=AGHqlbtHd7SG9WwJa+qRxN4ZK/osfGGYjI94zCkGONaKM9oHKQg3ZWFxF3ruIMEz6TGBfzXRYSsFBmf5ls7xMTjzVSerzeRUgCug1VvfM04gygLf75mRxwFsXnoF7uRnkNJ8qAY61rdQV571FiplmfnrLyhAIh5uztxVhuO3q+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063602; c=relaxed/simple;
	bh=M5o+/YaupNYZyxmeKf2QjXgCKV0qcMjr7DPzv7F8Sv0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HtRb59Sv8iCsc1N7bIHBwPt/jjYCsWSIYzEd2ZnFE/Kmla/SBEMSgJWYGsgy4Y3uR/RrCbE3a8ryueRSTceC7lnkzGoZaz2ShugdLbha+lSlutoF5XQ8Q3y6jbu2ineRqEym5A3Jr69ax3TJCCmF4JaZyYMWsMkh62oL6TmL+RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dHhX2DDE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778063599;
	bh=M5o+/YaupNYZyxmeKf2QjXgCKV0qcMjr7DPzv7F8Sv0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dHhX2DDEb+wKn+xBlaCHlq6jRa1HZj+2R0vY7hAlUA+C+Zoap/YG7alIUX6QF2JuH
	 iGWo984ywb6LITJ7cafk4pbvn2DS/7wUBPMhH0nXlMzQqSjx/ELpj6PTtYAsCFnprr
	 gHgGF7r77Z50yxDgoF7V15ATETV17WYz10R+IypMMoEHxmYpyVhUW9244GtR4aZMrr
	 px8CHnxYwp40tbLvffOrKczuvdf6qie1oISR6ZEtvS5p0MbMQKQPIaTW3bZYPYkoSG
	 N1SjfcJWB9w5YQr31HrOSqFKu4oT6y4u7ppxfzDwvm3pdxYZGHcoyntDpuvIYjP6BP
	 Jn9toahZwrSNw==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64F3617E1227;
	Wed,  6 May 2026 12:33:18 +0200 (CEST)
Date: Wed, 6 May 2026 12:33:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 5/8] drm/panthor: Minor scheduler refactoring
Message-ID: <20260506123314.0f1c01cb@fedora>
In-Reply-To: <20260505140516.1372388-6-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-6-ketil.johnsen@arm.com>
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
X-Rspamd-Queue-Id: DCBE54D9581
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60572-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]

On Tue,  5 May 2026 16:05:11 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> From: Florent Tomasin <florent.tomasin@arm.com>
> 
> Refactor parts of the group scheduling logic into new helper functions.
> This will simplify addition of the protected mode feature.
> 
> Remove redundant assignments of csg_slot.
> 
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 135 +++++++++++++++---------
>  1 file changed, 86 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5ee386338005c..987072bd867c4 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1934,6 +1934,12 @@ static void csgs_upd_ctx_init(struct panthor_csg_slots_upd_ctx *ctx)
>  	memset(ctx, 0, sizeof(*ctx));
>  }
>  
> +static void csgs_upd_ctx_ring_doorbell(struct panthor_csg_slots_upd_ctx *ctx,
> +				       u32 csg_id)
> +{
> +	ctx->update_mask |= BIT(csg_id);
> +}
> +
>  static void csgs_upd_ctx_queue_reqs(struct panthor_device *ptdev,
>  				    struct panthor_csg_slots_upd_ctx *ctx,
>  				    u32 csg_id, u32 value, u32 mask)
> @@ -1944,7 +1950,8 @@ static void csgs_upd_ctx_queue_reqs(struct panthor_device *ptdev,
>  
>  	ctx->requests[csg_id].value = (ctx->requests[csg_id].value & ~mask) | (value & mask);
>  	ctx->requests[csg_id].mask |= mask;
> -	ctx->update_mask |= BIT(csg_id);
> +
> +	csgs_upd_ctx_ring_doorbell(ctx, csg_id);
>  }
>  
>  static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
> @@ -1961,8 +1968,12 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
>  	while (update_slots) {
>  		struct panthor_fw_csg_iface *csg_iface;
>  		u32 csg_id = ffs(update_slots) - 1;
> +		u32 req_mask = ctx->requests[csg_id].mask;
>  
>  		update_slots &= ~BIT(csg_id);
> +		if (!req_mask)
> +			continue;

Looks like something that should be in patch 7, where you update the
doorbell_req register, and then call csgs_upd_ctx_ring_doorbell(),
meaning req_mask can be zero. The other option would be to teach
panthor_csg_slots_upd_ctx about CS doorbells, and let
csgs_upd_ctx_apply_locked() toggle the doorbell_req.

> +
>  		csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
>  		panthor_fw_update_reqs(csg_iface, req,
>  				       ctx->requests[csg_id].value,
> @@ -1979,6 +1990,9 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
>  		int ret;
>  
>  		update_slots &= ~BIT(csg_id);
> +		if (!req_mask)
> +			continue;
> +
>  		csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
>  
>  		ret = panthor_fw_csg_wait_acks(ptdev, csg_id, req_mask, &acked, 100);

