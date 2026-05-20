Return-Path: <linux-media+bounces-62207-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAzLEwtcDWrBwQUAu9opvQ
	(envelope-from <linux-media+bounces-62207-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:00:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A358893E
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 104013122F51
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 06:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84886366074;
	Wed, 20 May 2026 06:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="VyBRdddL"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B9034A3DB;
	Wed, 20 May 2026 06:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259887; cv=pass; b=KmhxE1ePyvpY5TykJEo9EpAJM+RhkMWlbrbIi5tj1A/Gy3DN9zbKJEKRnUUIrTFT808bSnn+mZbAX3Slkkl0riK9FdOrktv3jKoowQvBP50sbzYVE8WRa0Ifc6J0VV5OLnTSr9Ikds+Lt4Oxh0bGY0H9Q8ldA5tCzOIPRER0LHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259887; c=relaxed/simple;
	bh=hjmjJgRAJge/Gcp0b3nocweBDpeY80SE4udUFeY0rfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=isExqzsOUKRjqNYurqcLP9cXPaPpE325VTYrYGrYb4iEh+6uYI/kua1CE1NkNcNdhldHAt9AZPEm6HgVHDS03yI7oVC4OXKWQO89+s+2zRyrNetw1jPi+7Vztbb6k4YSbMthClVZxw8d45xPKc2p6BZ6BwWIj0FJlEl+C/lqhCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=VyBRdddL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779259867; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KLBTvPulm89Uhd0hrY1hQxXpIYJTSoEldAsWjb56Om/sPBEyUexkg5UYpxkjSIk1Tx3YG4JCbfdh8YTIPVlDM648iQOWxDquMJesPQzQ1s7tWNmdTKndnH3qvAMDXU7EGxZBtv7NsMBN23KUsSXVwWwQ0guDs+qdzXfxl33EynE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779259867; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QB0aBnlsYuDj3KTGtL3n3HDsaBFK9L6LJNUmMJHUjY4=; 
	b=TQ4oJAJ5bv64cMiBCvxeYed1fC9/kbkPzdecrFlE/ugUI2IfR8DX8iWgrLWnKVSKl4dr7qwDZfIZnvn7uZtrrqmJ2VX12BDTTIxworgPS5sKSNt3gB/zsyJ0J4OBDGDUqHiIz4ne1ULiW8oWwJbNqpky+i4eJTHT/vpTs56Uu8A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779259867;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QB0aBnlsYuDj3KTGtL3n3HDsaBFK9L6LJNUmMJHUjY4=;
	b=VyBRdddLQLmNW2QZQ1V6CEYZt7nEdTgavdMYB1VurOPR3uoTzn/Njegc8oYzgnEi
	mtKQuEWzIzHS0ewTEdnXWjWXclzSQloH9N7gOvvhx4GhpUqSfJd8GKNonSYeD/ppXd3
	6mN7WVM9Azu9aLYjLp/XnYTR32QL+/zIiNg2Xbmg=
Received: by mx.zohomail.com with SMTPS id 1779259866052944.3067294851667;
	Tue, 19 May 2026 23:51:06 -0700 (PDT)
Message-ID: <f6bcef23-5510-4aad-bf6a-4e1ecfc8d474@collabora.com>
Date: Wed, 20 May 2026 09:50:54 +0300
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
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <2e23513c-9d59-4891-acfe-9f1fbcbce778@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62207-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3D7A358893E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 11:27, Christian König wrote:
> On 5/19/26 10:22, Deepanshu Kartikey wrote:
>> virtio_gpu_cursor_plane_update() and virtio_gpu_resource_flush() lock
>> the framebuffer BO's dma_resv via virtio_gpu_array_lock_resv() and
>> ignore its return value. The function can fail with -EINTR from
>> dma_resv_lock_interruptible() (signal during lock wait) or with
>> -ENOMEM from dma_resv_reserve_fences() (fence slot allocation),
>> leaving the resv lock not held. The queue path then walks the object
>> array and calls dma_resv_add_fence(), which requires the lock held;
>> with lockdep enabled this trips dma_resv_assert_held():
>>
>>   WARNING: drivers/dma-buf/dma-resv.c:296 at dma_resv_add_fence+0x71e/0x840
>>   Call Trace:
>>    virtio_gpu_array_add_fence
>>    virtio_gpu_queue_ctrl_sgs
>>    virtio_gpu_queue_fenced_ctrl_buffer
>>    virtio_gpu_cursor_plane_update
>>    drm_atomic_helper_commit_planes
>>    drm_atomic_helper_commit_tail
>>    commit_tail
>>    drm_atomic_helper_commit
>>    drm_atomic_commit
>>    drm_atomic_helper_update_plane
>>    __setplane_atomic
>>    drm_mode_cursor_universal
>>    drm_mode_cursor_common
>>    drm_mode_cursor_ioctl
>>    drm_ioctl
>>    __x64_sys_ioctl
>>
>> Beyond the WARN, mutating the dma_resv fence list without the lock
>> races with concurrent readers/writers and can corrupt the list.
> 
> Well why are you trying to add a fence on an atomic mode set in the first place?
> 
> That is usually an illegal operation here.
That is pre-existing in the driver. It performs draw operation and in
some cases waits for the completion during atomic. Whether all that
syncing is correct is hard to say immediately as some of it may be
historical edge cases.

-- 
Best regards,
Dmitry

