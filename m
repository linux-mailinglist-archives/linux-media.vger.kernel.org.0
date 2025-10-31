Return-Path: <linux-media+bounces-46078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F2C2588D
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 15:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9947E428536
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 14:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5EE33373C;
	Fri, 31 Oct 2025 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b="r7F5Yrkw";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="+lUlqknY"
X-Original-To: linux-media@vger.kernel.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3614F258ED1;
	Fri, 31 Oct 2025 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.152.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761919889; cv=none; b=jhEbJ8cNizk5OGzvJz4D5hn8Y58zHApE+Q4tqpFoUpPnSsKcFf8hzYafJbCq9FfOFL57yR4UsPz7d6pVXrR5cCUQLXokacNWmpj7l5zOKC8KJXTM/kSwVSSSMb3laH7jEHV+mSqs2p3B/gk1QSeS1mab9bQLCOTgs9BtIqjCOYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761919889; c=relaxed/simple;
	bh=806F3k6XPgIgtDKzOwiqa5q3jJuv/CbOcstiKN4t/Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OitXdkWow0L0y9rNGdzuDyHErdOK6xy0a4HcioQpmY49mLlesxWQ6Dv2v+/AAvjOmz73Dieiap20mx7ICxNwLZpASjjba2VyT4vN2xSpB/X/ZFPb68D3c5hBXVnh27EyQm33xt9ihQDayP3Y15t6jMEZKJypoFBKoCKlbkgWd3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net; spf=pass smtp.mailfrom=damsy.net; dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b=r7F5Yrkw; dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b=+lUlqknY; arc=none smtp.client-ip=51.159.152.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=damsy.net
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1761919844; bh=4KnHJ3WNKUbgqsydcoN1WSh
	PIzk8mgmN3Q6/6Zfh76w=; b=r7F5YrkwtSP33iQ8E5EmfLcGqC/PsSba9/zfh7W9yEKZkBCKe2
	eIl3syGPOeoQZTM0k0lxbLxYqNtdFRIeDzz2HZu0hQp2hDU4aFUdiZm3FdQ/FSvB+aXlDoTR8cl
	0c+uxpjkhNy99xwACwawUHzyrNCAVBIMHij3qbeyS+oC3v960WCgVKFHhadNh+Il+w3pl3XiUoL
	akxETjfGm5WzPpPNdUMji1hxCFkSEUEsZhhC1ONZ3xN8LRWwpHkpKcxQmylXyOJ1poSsk2c9aD1
	Je/raOF425npaOisFAuC2uOswYnOU3Z82QZfOT965YoPpEzwdTKKuChYmZcxf2ceiTA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1761919844; bh=4KnHJ3WNKUbgqsydcoN1WSh
	PIzk8mgmN3Q6/6Zfh76w=; b=+lUlqknYEM2JGx0/FAjqopAU3erMVOj1Y7yEIbflOMOcmMMfIW
	NgLENQvh7lRWG1PmygwKT2f5sN8RvQrkeFDA==;
Message-ID: <ebc028f2-3d2d-4f42-a667-df7d6c2b7eb0@damsy.net>
Date: Fri, 31 Oct 2025 15:10:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/sched: Add warning for removing hack in
 drm_sched_fini()
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251023123429.139848-2-phasta@kernel.org>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20251023123429.139848-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Philipp,

Le 23/10/2025 à 14:34, Philipp Stanner a écrit :
> The assembled developers agreed at the X.Org Developers Conference 2025
> that the hack added for amdgpu in drm_sched_fini() shall be removed. It
> shouldn't be needed by amdgpu anymore.
> 
> As it's unclear whether all drivers really follow the life time rule of
> entities having to be torn down before their scheduler, it is reasonable
> to warn for a while before removing the hack.
> 
> Add a warning in drm_sched_fini() that fires if an entity is still
> active.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v3:
>    - Add a READ_ONCE() + comment to make the warning slightly less
>      horrible.
> 
> Changes in v2:
>    - Fix broken brackets.
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 46119aacb809..31039b08c7b9 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1419,7 +1419,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   		struct drm_sched_rq *rq = sched->sched_rq[i];
>   
>   		spin_lock(&rq->lock);
> -		list_for_each_entry(s_entity, &rq->entities, list)
> +		list_for_each_entry(s_entity, &rq->entities, list) {
>   			/*
>   			 * Prevents reinsertion and marks job_queue as idle,
>   			 * it will be removed from the rq in drm_sched_entity_fini()
> @@ -1440,8 +1440,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   			 * For now, this remains a potential race in all
>   			 * drivers that keep entities alive for longer than
>   			 * the scheduler.
> +			 *
> +			 * The READ_ONCE() is there to make the lockless read
> +			 * (warning about the lockless write below) slightly
> +			 * less broken...
>   			 */
> +			if (!READ_ONCE(s_entity->stopped))
> +				dev_warn(sched->dev, "Tearing down scheduler with active entities!\n");
>   			s_entity->stopped = true;
> +		}

The patch is Acked-by: Pierre-Eric Pelloux-Prayer 
<pierre-eric.pelloux-prayer@amd.com>

Thanks.


>   		spin_unlock(&rq->lock);
>   		kfree(sched->sched_rq[i]);
>   	}


