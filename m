Return-Path: <linux-media+bounces-61608-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEp9EjTMBWocbgIAu9opvQ
	(envelope-from <linux-media+bounces-61608-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 15:20:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B63E25423F4
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 15:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24FAA30B14AE
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 13:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683743E022D;
	Thu, 14 May 2026 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="R5tH0WKB"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8DF3DFC9C;
	Thu, 14 May 2026 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764611; cv=none; b=sBg9DaUr7oCCBs5kZheYwg+yR1HZhiZ3+i++6m9FTaVGu697poDDHWX48ByR3uvzgFH8CJTQ4UYIYuCZa4s3ZwLDdy4tRQvQzvgGgJU85a2G3cXZESMAcu2r0ODGReKVFar7GUZOSULy7hYjbPjEHYgfGpGOOqjLBiWFOQd3IV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764611; c=relaxed/simple;
	bh=XlQXNhbEfTr01dBzOIt2YI+/ViFio1iF/QMxPWRbPzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmvGsIn2+ojdCblb1i4CiSm6p7gb4wchyTeWLF2d8UKs6OrUBJ9bq89+Z+z3QinsmqWHHPbaituNXH2U+y5BcTw014W4R3O1no08ojOCWkpq3XVBJhvvMBXUUmDY+Ms5JXmn+D8JTXeCoOMBk500RtD2hmTrtKoFMcZ30aP9pZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=R5tH0WKB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD0F5244B;
	Thu, 14 May 2026 06:16:38 -0700 (PDT)
Received: from [10.1.37.28] (e122027.cambridge.arm.com [10.1.37.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C8CB3F836;
	Thu, 14 May 2026 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778764603; bh=XlQXNhbEfTr01dBzOIt2YI+/ViFio1iF/QMxPWRbPzE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R5tH0WKBoMTBO5UI7SJd/dQs8FJ7FF+9n8d3mFdgWH+hAbV3psXfthFEhdBOyDXLq
	 OeV/Dc7lcuRsC2vEiRYWvm42tmeVCttsAlUj0J9Z2npAGimsSw01JbTJ8bWZTPZLmk
	 gumAnP0vz7GxVlRoTkqGl6RoGppepG5O3T5Ti6q8=
Message-ID: <5ab2d07c-74a4-4a2c-b145-6ed7b0060944@arm.com>
Date: Thu, 14 May 2026 14:16:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/panthor: Driver-wide xxx_[un]lock ->
 [scoped_]guard replacement
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
 <20260513-panthor-guard-refactor-v1-1-f2d8c15a97ce@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260513-panthor-guard-refactor-v1-1-f2d8c15a97ce@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B63E25423F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61608-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

On 13/05/2026 17:58, Boris Brezillon wrote:
> Right now panthor is mixed bag of manual locks and guards. Let's
> make that more consitent and thus encourage new submissions to go
> for guards.

I'm fine with encouraging guards for future code - but I'm a little wary
of a big change like this - it's hard to review it and check that
everything works the same. And it's a little dubious that the mechanical
refactoring produces more readable code in some cases.

That said I asked my friendly AI bot...

[...]

> @@ -3142,48 +3126,44 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
>  	LIST_HEAD(remaining_vms);
>  	LIST_HEAD(vms);
>  
> -	mutex_lock(&ptdev->reclaim.lock);
> -	list_splice_init(&ptdev->reclaim.vms, &vms);
> +	scoped_guard(mutex, &ptdev->reclaim.lock)
> +		list_splice_init(&ptdev->reclaim.vms, &vms);
>  
>  	while (freed < nr_to_scan) {
>  		struct panthor_vm *vm;
>  
> -		vm = list_first_entry_or_null(&vms, typeof(*vm),
> -					      reclaim.lru_node);
> -		if (!vm)
> -			break;
> -
> -		if (!kref_get_unless_zero(&vm->base.kref)) {
> -			list_del_init(&vm->reclaim.lru_node);
> -			continue;
> +		scoped_guard(mutex, &ptdev->reclaim.lock) {
> +			vm = list_first_entry_or_null(&vms, typeof(*vm),
> +						      reclaim.lru_node);
> +			if (vm && !kref_get_unless_zero(&vm->base.kref)) {
> +				list_del_init(&vm->reclaim.lru_node);
> +				vm = NULL;
> +			}
>  		}
>  
> -		mutex_unlock(&ptdev->reclaim.lock);
> +		if (!vm)
> +			break;

... and it said the above has changed behaviour.

In the !kref_get_unless_zero() case you now assign vm = NULL which then
leads to the 'break' case above. Previously we 'continue'd.

Thanks,
Steve

