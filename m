Return-Path: <linux-media+bounces-61058-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGL1DG+fAWpKgwEAu9opvQ
	(envelope-from <linux-media+bounces-61058-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:20:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9CA50AC61
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 206AA311193D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D6B3D47DE;
	Mon, 11 May 2026 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIddYbla"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC7F3C5528;
	Mon, 11 May 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490269; cv=none; b=hC+YCj9LOeqJoGqClcyhmqzJ7xsKZXRyAZiXhkAftuAACAzd1QiFjMijV+f/yu9LcYzPORp2DuIARZRWDEjRcl2XhT+ARCEdlt3cY1+KuTNlqk07QaW/Dq19m8an64IHxJwrw3vvux/C1gTItw7pLrzhoSBrD/rwPPCymcJKdS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490269; c=relaxed/simple;
	bh=1hHtE+qiixejcQON712uNfesppDbsdiUfLRUqiVc6aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdOaIpz5nzhyzTLkMTr6eDBcniFD3+907NWNyDNbtUzn/sq6yys6Gg13x+Icmag9phM2E4lJJGiieeFNfJUQJB8OJLNr4L41Icr5jnw1lqOE3/37/0hb0CXb1SQJpI5yyiV9Upl1LRzCXHV0nVE3v2/MEfVO4A9mPxuqBiw5CQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIddYbla; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778490267; x=1810026267;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1hHtE+qiixejcQON712uNfesppDbsdiUfLRUqiVc6aI=;
  b=cIddYblai24ZluF3xegs+BGdk745bu4ZdRTfihFJMC8MTKNci9kYKUp0
   2nC/uEacFtGmxHdILwS+usCJ4WbHLOhOZrn5LU2kkMfYHl98E/1tiR1hJ
   cf419/RZdxNOep1JMGKe35K3r9L2rcdP+lm0Jo0qdI9RQuOLXqzdVyq2Z
   1b4wZVHPhfc3qe+r9XGK8V/IXUEx4j8kUedtnkdsnOcZ9/K4920mZvIMB
   pjmUSeTholJ2KVYmGfpc2PiJ9B04Kg6ZKPkOF0CQsdu/2Rcw+Cci5ajcF
   gr8tF6gjSw3pAYS7X1Z/yZ4vMLfWTHVAHCjbT/OGcvZr5WLQ8xri/hZ7I
   A==;
X-CSE-ConnectionGUID: JqBXV4ToTWG5O0d8jJ1Nrw==
X-CSE-MsgGUID: AWUWcz4UTLK/PUEyLz5TZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="89676596"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="89676596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 02:04:27 -0700
X-CSE-ConnectionGUID: 1jP2xWNfQPCQ5XZKIGqUtg==
X-CSE-MsgGUID: U9GJ5rlqTfOIW8tFirLliw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="241372324"
Received: from unknown (HELO [10.102.88.33]) ([10.102.88.33])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 02:04:23 -0700
Message-ID: <0097f608-dbac-482d-9851-ce306b0c7b78@linux.intel.com>
Date: Mon, 11 May 2026 11:04:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Reject PRIME export of userptr BOs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ziyi Guo <guoziyi114@gmail.com>, maciej.falkowski@linux.intel.com,
 jacek.lawrynowicz@linux.intel.com
Cc: ogabbay@kernel.org, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Ziyi Guo <n7l8m4@u.northwestern.edu>
References: <20260508162856.1131843-1-n7l8m4@u.northwestern.edu>
 <14b62cee-c46e-4fb9-91ab-aa09c0962834@amd.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <14b62cee-c46e-4fb9-91ab-aa09c0962834@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9B9CA50AC61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[northwestern.edu:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	TAGGED_FROM(0.00)[bounces-61058-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,linux.intel.com];
	HAS_ORG_HEADER(0.00)[];
	R_DKIM_ALLOW(0.00)[intel.com:s=Intel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karol.wachowski@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.933];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/11/2026 9:39 AM, Christian König wrote:
> Hi Zivi,
> 
> On 5/8/26 18:28, Ziyi Guo wrote:
>>   Userptr BOs wrap pinned user pages in a private dma-buf solely for
>>   internal use by the NPU driver. Allowing userspace to re-export such a
>>   BO via DRM_IOCTL_PRIME_HANDLE_TO_FD would expose those pages to other
>>   drivers through an interface that was never intended to be shared.
>>
>>   Override the driver's prime_handle_to_fd callback to detect dma-bufs
>>   backed by ivpu_gem_userptr_dmabuf_ops and reject the export with
>>   -EINVAL.
>>
>> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
> 

Hi Christian

> first of all thanks a lot for pointing that out! The patch which orginally added that somehow slipped through the cracks.
> 
> Then @Karol and @Jacek, using DMA-buf like that is a pretty big NO-GO from the DMA-buf side!
> 
> Using page which you don't own (especially file system backend ones) in a DMA-buf is absolutely *NOT* something you can do.
> 
> I hope that it is not the case here, but if you also allow to mmap() them then you have create a massive security problem which can lead to random file system corruptions.

This is not allowed, ivpu userpointer dma_buf_ops have no .mmap handler,
this results in -EINVAL when invoked.

Regards,
Karol

> 
> Regards,
> Christian.
> 
>> ---
>>  drivers/accel/ivpu/ivpu_drv.c         |  1 +
>>  drivers/accel/ivpu/ivpu_gem.c         | 28 +++++++++++++++++++++++++++
>>  drivers/accel/ivpu/ivpu_gem.h         |  3 +++
>>  drivers/accel/ivpu/ivpu_gem_userptr.c |  5 +++++
>>  4 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
>> index 2801378e3e19..086d4c769b33 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.c
>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>> @@ -545,6 +545,7 @@ static const struct drm_driver driver = {
>>
>>         .gem_create_object = ivpu_gem_create_object,
>>         .gem_prime_import = ivpu_gem_prime_import,
>> +       .prime_handle_to_fd = ivpu_gem_prime_handle_to_fd,
>>
>>         .ioctls = ivpu_drm_ioctls,
>>         .num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>> index 4f2005a8d496..82079f372b39 100644
>> --- a/drivers/accel/ivpu/ivpu_gem.c
>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>> @@ -12,6 +12,7 @@
>>  #include <drm/drm_cache.h>
>>  #include <drm/drm_debugfs.h>
>>  #include <drm/drm_file.h>
>> +#include <drm/drm_prime.h>
>>  #include <drm/drm_utils.h>
>>
>>  #include "ivpu_drv.h"
>> @@ -249,6 +250,33 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
>>         return ERR_PTR(ret);
>>  }
>>
>> +int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
>> +                               u32 handle, u32 flags, int *prime_fd)
>> +{
>> +       struct ivpu_device *vdev = to_ivpu_device(dev);
>> +       struct dma_buf *dmabuf;
>> +       int fd;
>> +
>> +       dmabuf = drm_gem_prime_handle_to_dmabuf(dev, file_priv, handle, flags);
>> +       if (IS_ERR(dmabuf))
>> +               return PTR_ERR(dmabuf);
>> +
>> +       if (ivpu_gem_is_userptr_dma_buf(dmabuf)) {
>> +               ivpu_dbg(vdev, IOCTL, "Exporting userptr BO is not allowed\n");
>> +               dma_buf_put(dmabuf);
>> +               return -EINVAL;
>> +       }
>> +
>> +       fd = dma_buf_fd(dmabuf, flags);
>> +       if (fd < 0) {
>> +               dma_buf_put(dmabuf);
>> +               return fd;
>> +       }
>> +
>> +       *prime_fd = fd;
>> +       return 0;
>> +}
>> +
>>  static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
>>  {
>>         struct drm_gem_shmem_object *shmem;
>> diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
>> index 0c3350f22b55..bfd15ce02354 100644
>> --- a/drivers/accel/ivpu/ivpu_gem.h
>> +++ b/drivers/accel/ivpu/ivpu_gem.h
>> @@ -29,6 +29,9 @@ void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
>>
>>  struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t size);
>>  struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
>> +int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
>> +                               u32 handle, u32 flags, int *prime_fd);
>> +bool ivpu_gem_is_userptr_dma_buf(struct dma_buf *dma_buf);
>>  struct ivpu_bo *ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>>                                struct ivpu_addr_range *range, u64 size, u32 flags);
>>  struct ivpu_bo *ivpu_bo_create_runtime(struct ivpu_device *vdev, u64 addr, u64 size, u32 flags);
>> diff --git a/drivers/accel/ivpu/ivpu_gem_userptr.c b/drivers/accel/ivpu/ivpu_gem_userptr.c
>> index 7cbf3a4cdc73..45eabea5961e 100644
>> --- a/drivers/accel/ivpu/ivpu_gem_userptr.c
>> +++ b/drivers/accel/ivpu/ivpu_gem_userptr.c
>> @@ -61,6 +61,11 @@ static const struct dma_buf_ops ivpu_gem_userptr_dmabuf_ops = {
>>         .release = ivpu_gem_userptr_dmabuf_release,
>>  };
>>
>> +bool ivpu_gem_is_userptr_dma_buf(struct dma_buf *dma_buf)
>> +{
>> +       return dma_buf->ops == &ivpu_gem_userptr_dmabuf_ops;
>> +}
>> +
>>  static struct dma_buf *
>>  ivpu_create_userptr_dmabuf(struct ivpu_device *vdev, void __user *user_ptr,
>>                            size_t size, uint32_t flags)
>> --
>> 2.34.1
>>
> 


