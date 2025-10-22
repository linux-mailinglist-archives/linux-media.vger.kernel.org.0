Return-Path: <linux-media+bounces-45192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB6FBFA7E8
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15A5F50395B
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F376025A324;
	Wed, 22 Oct 2025 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="X/e4Yd8G"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B591C25BF1B;
	Wed, 22 Oct 2025 07:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761117394; cv=none; b=EXClAfoEGTVabHsMuohfyfkP9oqjniYFYjQOh/mjqVHNt8WdGu+bfdmO9gVIyr6vdgPtmbyC31z17zdSKynjyFfwURAUG8vz7xAc7gGkZ/QVt69DUcnY1kX7kkFkW8Y+A9tRNwsZHyzIOH5TNsrNCfcCS6ECnLA1gq8iF09mIH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761117394; c=relaxed/simple;
	bh=O6lby/cI64Lq+octibPJOj31e2GUH4yGv6XbSm9XSIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMkVnDdB9jBm6tOrQuLsTuajQesLf+e3IdgCqS55cx2CVa7nwkC1nFts7rSjO797URpDKHd8v/Xcl5TMHxUBm73YYpw05HrN3r1ceLAq2pyz2CmZeGpEj20lwIL1fDUygVCwZnwBkKhjyQ4xUSCpSa1cDHJA7HpfeMcJKvn6UJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=X/e4Yd8G; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qBPPrGjT8YjeRj+4gw66VAsO2oG7+WPqHJ1JsvWkV3c=; b=X/e4Yd8G4wX14S0SFmYh0cA6rw
	3O0Kx9GPQLUDpdcwA/9rWkEK70E9mbJImFmRLN1+NqsZ5/Q1+ntjiZskg3LYtHb6sTaFqIvvhjEOr
	DKag0PzF2EjVmdW1D8KENU7BOs5P9DheO8LDWj/9qCZxSrmm2GYvdBr15JgxliAsKE278vWIOmZXz
	3KbdaLDy3NKQl6250ZJGJkZXggGKhqU3lYxBEA+valFgRG9a5lZhkbcoqfvknbfzjcQ+T5cm0OOA7
	gs/tXPbgCN2fe2UVW20oYXgiiAqewy77/86ndJo3OsBwXbKHDOfJ1gF5ukPMXB4Av4uBHQ+JJOL3f
	Edq2eOTA==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vBT4w-00CseB-6l; Wed, 22 Oct 2025 09:16:14 +0200
Message-ID: <26eef700-7997-42e5-b0b9-c03361e05814@igalia.com>
Date: Wed, 22 Oct 2025 08:16:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix race in drm_sched_entity_select_rq()
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, stable@vger.kernel.org
References: <20251022063402.87318-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20251022063402.87318-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 22/10/2025 07:34, Philipp Stanner wrote:
> In a past bug fix it was forgotten that entity access must be protected
> by the entity lock. That's a data race and potentially UB.
> 
> Move the spin_unlock() to the appropriate position.
> 
> Cc: stable@vger.kernel.org # v5.13+
> Fixes: ac4eb83ab255 ("drm/sched: select new rq even if there is only one v3")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 5a4697f636f2..aa222166de58 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -552,10 +552,11 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   		drm_sched_rq_remove_entity(entity->rq, entity);
>   		entity->rq = rq;
>   	}
> -	spin_unlock(&entity->lock);
>   
>   	if (entity->num_sched_list == 1)
>   		entity->sched_list = NULL;
> +
> +	spin_unlock(&entity->lock);
>   }
>   
>   /**

Agreed, unlock at the end is correct.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Luckily only amdgpu calls drm_sched_entity_modify_sched(), and I am not 
sure if with hypothetical multi-threaded submit it could be possible to 
hit it or not.

One thread would have to clear the sched_list, while another would have 
to have passed the !sched_list at the beginning of the function, and the 
job_queue count and last_scheduled completed guards. Which would mean 
job has to get completed between the unlock and clearing the pointer.

Also, take a look at this when you can please:

https://lore.kernel.org/dri-devel/20240719094730.55301-1-tursulin@igalia.com/

This would also have fixed this issue by removing clearing of 
entity->sched_list. Latter being just a hack to work around the issue of 
confused container ownership rules.

Regards,

Tvrtko


