Return-Path: <linux-media+bounces-61368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHyOJThABGokGQIAu9opvQ
	(envelope-from <linux-media+bounces-61368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:11:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DFB53054D
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 11:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11C7D3052038
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69D936F916;
	Wed, 13 May 2026 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Jf8V2eOO"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14A83C3797;
	Wed, 13 May 2026 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663431; cv=pass; b=Dn6iZt+rSILYQ1tUaBQn8C+wZsDB86S5UoRjhtmDILUV1j2A5X3q7NwvxzTmrXyoR4T6lU6ZiZjrxHN/svm7N+r27X5q5zsRKK1e0FXCWi/QUvvYPAoaOm8986G0VssYj9wypqz2tHcBvEk0iIcjZVldcNU+Cbbev01FJuwPiqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663431; c=relaxed/simple;
	bh=BCkN3CWqi1Fou1vJgclLldEXybnXWRswFik3LuSrcf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rE5RO7oKRKuMMy/jGsewYoqTJruz0Smk6qVdQQlxbVn7Vwf2bpeXgbwWQYhNDVnFHUzS/w5brqCFFI9NItyejqG4cpxjuuREnA87xuLrjFIfzMq8NUN+qHqOiVvlvC18Djqj5WqNR4PXLE3BZ9GrZqXb2QCPsnos+c7ttUt4gVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Jf8V2eOO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1778663410; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fKPVwADO8NoII5QZA/9nW44lDanjOSOPhHM423Zx+9+6zesDGOnMff+bl6Rvh35UgZazW4f6pUAJvbXAvKHqhZZYFdnmRXBF06iR1kPcV68F6IKn45f8ugIZ8e4PJ7XblV87S1FasZpuW7NarX5/YHkLXMUQ3iWeg5UVpuMhmHg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778663410; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J+PeEpwgMGG+eT1L4WzFjaLfRNxviLWx3M2E/85kEME=; 
	b=LWW9GtphE/fmKFD55IBBhxIMs4RggAQDNovGJ63G4XWnycQHO5zTbncfVhvn8bBHggKZZUhjQBOziPDbusIDx0usWV5F4GoxPV1yeIwUdB2LfIsVfiVpUaDZZ/xiaJLbZ2XE1NyxxM9w+i2ohLfDSfrQe3cfbQ6JjUt4B1rCsRQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778663410;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=J+PeEpwgMGG+eT1L4WzFjaLfRNxviLWx3M2E/85kEME=;
	b=Jf8V2eOOgD0CHQN4V+0lESC/eA0s1LNDholC2vph3WSKS4d0gSXu+TJW0UbFGg89
	A/7jUvEcwwmIPXG2OJJQZoQi/h3CGidnrHf3CfQCPBsxoautZJNHcFBo8FbSwEEvaZW
	E4WUHbJwdUDYlCgS0OJ9jhB9OvEW+ZhL6xqB/ifM=
Received: by mx.zohomail.com with SMTPS id 177866340828668.99618190513445;
	Wed, 13 May 2026 02:10:08 -0700 (PDT)
Message-ID: <65da2ce9-a2ab-4800-a73e-1a26082d0605@collabora.com>
Date: Wed, 13 May 2026 12:10:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/virtio: move cursor resv lock acquisition to
 prepare_fb
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, simona@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20260512020718.108044-1-kartikey406@gmail.com>
 <d1bc8d7d-3a4f-4ede-8266-81cc66bf11b5@collabora.com>
 <CADhLXY7N0eLpA30eV4Rb=F4vzCf9XYtDjMpxBSJtGeMWNi6Cwg@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CADhLXY7N0eLpA30eV4Rb=F4vzCf9XYtDjMpxBSJtGeMWNi6Cwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Queue-Id: 35DFB53054D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61368-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.linaro.org,syzkaller.appspotmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:mid,collabora.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/13/26 04:55, Deepanshu Kartikey wrote:
> On Tue, May 12, 2026 at 12:04 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> I'm getting lockup with this patch applied and now see that
>> virtio_gpu_resource_flush() also locks BO.
>>
>> Easiest option might be to add uninterruptible variant of
>> virtio_gpu_array_lock_resv(). Could you please try it for v3?
>>
>> --
>> Best regards,
>> Dmitry
> 
> Hi Dmitry,
> 
> Thanks for testing and catching the lockup. Before I send v3, want
> to confirm the approach:
> 
>   1. Revert v2's prepare_fb / cleanup_fb / plane_state changes;
>      keep the lock acquisition inside cursor_plane_update like
>      the original code.
> 
>   2. Add virtio_gpu_array_lock_resv_uninterruptible() in
>      virtgpu_gem.c, mirroring the existing helper but using
>      dma_resv_lock() instead of dma_resv_lock_interruptible() on
>      the nents==1 path. Declare it in virtgpu_drv.h.
> 
>   3. In cursor_plane_update, call the new helper and check its
>      return. The signal path is closed; -ENOMEM from
>      dma_resv_reserve_fences() remains and is handled by freeing
>      objs and skipping the cursor update for that frame.
> 
> A skipped cursor frame on ENOMEM is the remaining failure mode in
> .atomic_update; this avoids the lockup with virtio_gpu_resource_flush()
> that v2's broader lock scope caused.
> 
> Does that match what you had in mind?

Sounds good. The virtio_gpu_resource_flush() also should be updated to
use uninterruptible() variant.

-- 
Best regards,
Dmitry

