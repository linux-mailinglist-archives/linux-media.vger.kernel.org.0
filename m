Return-Path: <linux-media+bounces-62568-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMuBN3QTEGryTAYAu9opvQ
	(envelope-from <linux-media+bounces-62568-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:27:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEC65B08F0
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35549302E32B
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A003A782E;
	Fri, 22 May 2026 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="h3avMHJG"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DB9218EB1;
	Fri, 22 May 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438397; cv=pass; b=FNCQtlgvkruK1yBur5VhXiIfisK6Qegit/Edvy6NuJPMoMCwxhsNm2wTZTckjAMjMBmWSOIz567x32P7ohqLwwhGTXx2YG5pEaPQCkLocAbS61vqbKoMB+Iop8kW/QN8XB2nMkt8s1Xvs7eb57Mry6O2a16c6BKb2CJX2Y8T6Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438397; c=relaxed/simple;
	bh=RRU6vhcUQ7taBtY5PtFSWVTMuqb1sduhme39mKwzTzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFE+QoALz9kZMUGtVa4aUhQaHVf3WSNpRgwz75MVXV4yakROQD++jQFlVg1ynCqSWJjsEm4ig49jBdFNsLJLX16p0WnrI3+87cQaGz3htPLFhxQCJtgTLnGl5Fp6aeDyvpCkiKduud8XeNmMxqsi3yrWZAfjG5QI5AfN0u8CcU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=h3avMHJG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779438375; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dMV2hEK/whH8fcHfZeci81wUSCn4E9qs1sGCHKkzf9W2o2FHj2SlyDxMH4R4yrSCnAPYUSL99FZZeTfAD3JV9yDEmAKzFy2XLA9Rx96kw6UlvNEqZ1g9Hhui1Ean4MUCaXUsDDm3QUv7Z/wr0ONxJKlFGg3U94ycbj+RBFWHeEE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779438375; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9/HtBbXO7Hb1AE+uzWM7pmy4kh9HfNVxnKVejgA40j8=; 
	b=E/HmYUJqYtzpuXR0X8sbjXRSgpmdaYQqQS89L3fkVL9LJeSfX0rMP/1BcVhOVjL1aPTEhxoDPG0/cjjsT6ReM5SRasTVFChRlyrjDMqFsoS9qo7EHuYQyU3X0Y1ntbIUp4OqMPmsMP+J3JEPlfi67tXaf/0FWQtHH86VN5NlToI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779438375;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9/HtBbXO7Hb1AE+uzWM7pmy4kh9HfNVxnKVejgA40j8=;
	b=h3avMHJG8KePKksJfg2l9IKHEfBL5JqsjX5qWxOWVZTI7cIDzexPfgXCEyws/cz+
	N/qkB9ChIP4779gwzJQmlyjLER3oMrGidpF0DpcO1Zy1wPUyFL9FIgwZKP2VKqcBDLr
	PrV4PrUwUWg1vFYQfuPB1wCdXOp3pl+/E5aN0TAI=
Received: by mx.zohomail.com with SMTPS id 1779438373126891.8505993850015;
	Fri, 22 May 2026 01:26:13 -0700 (PDT)
Message-ID: <eebd1c78-94b5-4b33-9708-5cafa1a29ef7@collabora.com>
Date: Fri, 22 May 2026 11:26:06 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtio: use uninterruptible resv lock for plane
 updates
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Deepanshu Kartikey <kartikey406@gmail.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20260519082247.34470-1-kartikey406@gmail.com>
 <2e23513c-9d59-4891-acfe-9f1fbcbce778@amd.com>
 <f6bcef23-5510-4aad-bf6a-4e1ecfc8d474@collabora.com>
 <a0f2cfd5-d4df-4e50-a52b-d5befbc2e481@amd.com>
 <f37bdc63-3575-49e5-aa5b-7b93428b293d@collabora.com>
 <1832e5a8-db85-4b66-a5f0-08043c4aed54@amd.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <1832e5a8-db85-4b66-a5f0-08043c4aed54@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62568-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,redhat.com,chromium.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 4AEC65B08F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

20.05.2026 14:00, Christian König пишет:
> On 5/20/26 10:12, Dmitry Osipenko wrote:
>> On 5/20/26 10:05, Christian König wrote:
>>> On 5/20/26 08:50, Dmitry Osipenko wrote:
>>>> On 5/19/26 11:27, Christian König wrote:
>>>>> On 5/19/26 10:22, Deepanshu Kartikey wrote:
>>>>>> virtio_gpu_cursor_plane_update() and virtio_gpu_resource_flush() lock
>>>>>> the framebuffer BO's dma_resv via virtio_gpu_array_lock_resv() and
>>>>>> ignore its return value. The function can fail with -EINTR from
>>>>>> dma_resv_lock_interruptible() (signal during lock wait) or with
>>>>>> -ENOMEM from dma_resv_reserve_fences() (fence slot allocation),
>>>>>> leaving the resv lock not held. The queue path then walks the object
>>>>>> array and calls dma_resv_add_fence(), which requires the lock held;
>>>>>> with lockdep enabled this trips dma_resv_assert_held():
>>>>>>
>>>>>>   WARNING: drivers/dma-buf/dma-resv.c:296 at dma_resv_add_fence+0x71e/0x840
>>>>>>   Call Trace:
>>>>>>    virtio_gpu_array_add_fence
>>>>>>    virtio_gpu_queue_ctrl_sgs
>>>>>>    virtio_gpu_queue_fenced_ctrl_buffer
>>>>>>    virtio_gpu_cursor_plane_update
>>>>>>    drm_atomic_helper_commit_planes
>>>>>>    drm_atomic_helper_commit_tail
>>>>>>    commit_tail
>>>>>>    drm_atomic_helper_commit
>>>>>>    drm_atomic_commit
>>>>>>    drm_atomic_helper_update_plane
>>>>>>    __setplane_atomic
>>>>>>    drm_mode_cursor_universal
>>>>>>    drm_mode_cursor_common
>>>>>>    drm_mode_cursor_ioctl
>>>>>>    drm_ioctl
>>>>>>    __x64_sys_ioctl
>>>>>>
>>>>>> Beyond the WARN, mutating the dma_resv fence list without the lock
>>>>>> races with concurrent readers/writers and can corrupt the list.
>>>>>
>>>>> Well why are you trying to add a fence on an atomic mode set in the first place?
>>>>>
>>>>> That is usually an illegal operation here.
>>>> That is pre-existing in the driver. It performs draw operation and in
>>>> some cases waits for the completion during atomic. Whether all that
>>>> syncing is correct is hard to say immediately as some of it may be
>>>> historical edge cases.
>>>
>>> I'm not not so deeply in the atomic mode setting stuff but it strongly sounds like that this is seriously broken.
>>>
>>> The background is that the atomic mode set framework allows an output dma_fence which is signaled when the commit is finished.
>>>
>>> So when you allocate a fence slot and add a new fence to finish the atomic commit it is trivially possible that this cycles back and waits for the atomic commit to finish. In other words you have a deadlock.
>>>
>>> You probably need specially crafted userspace with the right timing to trigger that, but such issues are usually a rather big no-no and need to be fixed in the long term.
>>>
>>> Try to add dma_fence_begin_signaling() and dma_fence_end_signaling() annotation and enable lockdep, the tool should be able to point out if and what exactly goes wrong.
>>>
>>> The usual fix is to prepare everything before commit_tail is called (alloc memory, create, reserve slot, add dma_fence etc....) and then just send out the prepared commands later on.
>>
>> We tried with moving resv alloc to prepare_fb() in a previous patch
>> version, it resulted in a non-trivial deadlocks. The goal of this patch
>> is to fix immediate problem with a minimal code change.
> 
> Yeah, totally fine with me to get that fixed first.
> 
>> What you're saying is correct, but it may require a rather big
>> refactoring of the code. In general, everything works okay today, so not
>> really an urgent problem.
> 
> It's just a potential issue and when the AI bots keep evolving like they already do they will sooner or later start to point that out as well.
Don't mind if bots will produce something useful

-- 
Best regards,
Dmitry

