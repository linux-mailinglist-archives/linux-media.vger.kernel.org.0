Return-Path: <linux-media+bounces-36837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC99AF9262
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 14:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BE884A06AF
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 12:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1453C2D63F0;
	Fri,  4 Jul 2025 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Oxp0Fzn8"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6732C2C9A;
	Fri,  4 Jul 2025 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631563; cv=none; b=rqyRDAqRBeMcVDHjfhZmoAz+bI8vUSNTDdKB2/460NBgcS2U4uWVp2N5swtIBvh0S4BWl46l9zQiKa3t+I0UdX0LbKS7NSrsUKsYEfxfcLger2I84i33Ee6gv4hXRfmjsZWRZ2VCXvNKuPOUiahPjWQpjVCTXk9Ot+6j+iTj+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631563; c=relaxed/simple;
	bh=pXz7VmYETj0HgCThspGPOmL0U5RHB4mgBu4S8tNNrJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0lacVOLr8wh3q/gy2zfk8MNYPvw8Vj6PGYwD4AAd1uvi0tocM4sq0P6iroEwNK8Ij22N9eWm+8faXJnIEblP7MzeNFKGOK0tPNJVg5xCPNxbm1t48bj9x1o57GDlrnmUSlkLISpXDh/zLl+eqT4YhHaBmWR71I4d1RrIO56sMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Oxp0Fzn8; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XbaDjDWqdnKDdqcosm9iq5MePhQ6bbb1VeFVI/I13F4=; b=Oxp0Fzn8fYvGKvkCgubLNFDlMF
	pOs+6UGpF2H0Mlk6S3K6OJgTYWqLOToouotKVhTQp9Ed3B0Vp6vt50DczZxr8rsWhC/S5FQF9aEkf
	QBv+Dj/G+Wr7ttZ8lLgl1X56tblIgnKX1e+E0JaKpmHr4te54gsJwquvcLjym703VJXI4bConOtMd
	8UjPQNXmcSuWt5/wUqEkdRU5zcBFhdPLk3VKCoAmK9v1MXMqDYT3aHihITfSxay+9GUxwl7cC7SOe
	4CFdYm/XS3u8PSRyWZh8R99NlEFAuxnybM08YBHL4RSjf1xsnj2rKDgyMXgxRenpAvQoH27cq0Cw4
	IQX7a2kg==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uXfNW-00CQHV-Rd; Fri, 04 Jul 2025 14:18:55 +0200
Message-ID: <dc5317a4-0adc-4371-871c-79b7d54614a6@igalia.com>
Date: Fri, 4 Jul 2025 09:18:47 -0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/sched: Avoid memory leaks with cancel_job()
 callback
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250701132142.76899-3-phasta@kernel.org>
 <20250701132142.76899-4-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250701132142.76899-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Philipp,

On 01/07/25 10:21, Philipp Stanner wrote:
> Since its inception, the GPU scheduler can leak memory if the driver
> calls drm_sched_fini() while there are still jobs in flight.
> 
> The simplest way to solve this in a backwards compatible manner is by
> adding a new callback, drm_sched_backend_ops.cancel_job(), which
> instructs the driver to signal the hardware fence associated with the
> job. Afterwards, the scheduler can savely use the established free_job()

s/savely/safely

> callback for freeing the job.
> 
> Implement the new backend_ops callback cancel_job().
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Link: https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

