Return-Path: <linux-media+bounces-60937-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO+WHR0e/mkRnAAAu9opvQ
	(envelope-from <linux-media+bounces-60937-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 19:32:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8564F9FF4
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 19:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 725F1307F809
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 17:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A019D410D04;
	Fri,  8 May 2026 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIvJp0Xq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2909C2EC57C;
	Fri,  8 May 2026 17:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261420; cv=none; b=naAES7nVdwFPg55LVZS7dMyO535gNKFYgk9zbgS9hmu1VGhZYNIlAKCZYJI8mcUrG6O/YFqKTQaIU46ptEQcWWii3f6gknXh/mbxop6MDW7NceEkyTj0QfaW1gXxVWbktRaLXgapCNCgo3PGrltu2MqgwTju1hze+/4k/j6e6pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261420; c=relaxed/simple;
	bh=6RBLVHT763iWCAiYJpYG5D13YdW8r7qO5LV7VD/wqLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIshNKoKpFqZVrs9Da+/UDERzs+IoPY25REhkyaPDUrzWDi3anWiNV5IXCjeBJaVAIfG6orPOPOGdi+37APZwtJKSb8ni0RXyOhED1YMYByTwOKH/h12HrzIJWF4Bm1hoGpHxKqbxVstjRF2l9BjRJNx/3R7p08ehJQuU+XJCGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIvJp0Xq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778261418; x=1809797418;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6RBLVHT763iWCAiYJpYG5D13YdW8r7qO5LV7VD/wqLs=;
  b=TIvJp0XqSysJupoJr0xG2Q7UB8LgU8mnArJZ3G9JPlqWwZyEmMj+56G/
   NP+7w30B+sG+SBIPymzmeCmI5INAhI22pG+NGE7caiFYjyAinmnv9ZPIs
   Cu4PS1MgZnW99WC+/3x8S5p45R/ABekWXPcrT13PyL6aRa55gdb/7h9ME
   xmmPZPFriNkAE2oXna18cGz4FJUTSb+lYhlTX0qsn4yhN3Dum9lcn6jvm
   /1ld7SqnyCcXqAnHpJi1kWT/P1RmZ4OQo1rjnNFb75D810NDg5VpL28OM
   fXMPF6htWZSjIqrjCK9v++GLHH+oDlGLKsuNzyUSRdZd+Dg5nM9cbCNvb
   g==;
X-CSE-ConnectionGUID: QPwDmPdzSNS1PGBTUE+Qkg==
X-CSE-MsgGUID: gY9rus7SSCu2sXrTlO6aqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89938811"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89938811"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 10:30:17 -0700
X-CSE-ConnectionGUID: o76zTJr+Ra+d+4BhWnyHLw==
X-CSE-MsgGUID: 7OjNYW/5Q4SD0uBTnc3hwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="235841029"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.20.129]) ([10.246.20.129])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 10:30:13 -0700
Message-ID: <17c27a42-a1ec-4b7a-b6c7-ad6fb2d50df1@linux.intel.com>
Date: Fri, 8 May 2026 19:30:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Reject PRIME export of userptr BOs
To: Ziyi Guo <guoziyi114@gmail.com>, maciej.falkowski@linux.intel.com
Cc: ogabbay@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Ziyi Guo <n7l8m4@u.northwestern.edu>
References: <20260508162856.1131843-1-n7l8m4@u.northwestern.edu>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260508162856.1131843-1-n7l8m4@u.northwestern.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4B8564F9FF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[northwestern.edu:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	TAGGED_FROM(0.00)[bounces-60937-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	HAS_ORG_HEADER(0.00)[];
	R_DKIM_ALLOW(0.00)[intel.com:s=Intel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karol.wachowski@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.599];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Action: no action

On 5/8/2026 6:28 PM, Ziyi Guo wrote:
>   Userptr BOs wrap pinned user pages in a private dma-buf solely for
>   internal use by the NPU driver. Allowing userspace to re-export such a
>   BO via DRM_IOCTL_PRIME_HANDLE_TO_FD would expose those pages to other
>   drivers through an interface that was never intended to be shared.
> 
>   Override the driver's prime_handle_to_fd callback to detect dma-bufs
>   backed by ivpu_gem_userptr_dmabuf_ops and reject the export with
>   -EINVAL.
> 
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>

Hi,

Thank you for submission. Actually very similar (with the same intent)
patch was already applied:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/drivers/accel/ivpu/ivpu_drv.c?id=51d24842acb9b8d643046c71314cc3d7a846a3cf

Kind regards,
Karol


> ---
>  drivers/accel/ivpu/ivpu_drv.c         |  1 +
>  drivers/accel/ivpu/ivpu_gem.c         | 28 +++++++++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_gem.h         |  3 +++
>  drivers/accel/ivpu/ivpu_gem_userptr.c |  5 +++++
>  4 files changed, 37 insertions(+)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 2801378e3e19..086d4c769b33 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -545,6 +545,7 @@ static const struct drm_driver driver = {
>  
>  	.gem_create_object = ivpu_gem_create_object,
>  	.gem_prime_import = ivpu_gem_prime_import,
> +	.prime_handle_to_fd = ivpu_gem_prime_handle_to_fd,
>  
>  	.ioctls = ivpu_drm_ioctls,
>  	.num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 4f2005a8d496..82079f372b39 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_cache.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_prime.h>
>  #include <drm/drm_utils.h>
>  
>  #include "ivpu_drv.h"
> @@ -249,6 +250,33 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
>  	return ERR_PTR(ret);
>  }
>  
> +int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
> +				u32 handle, u32 flags, int *prime_fd)
> +{
> +	struct ivpu_device *vdev = to_ivpu_device(dev);
> +	struct dma_buf *dmabuf;
> +	int fd;
> +
> +	dmabuf = drm_gem_prime_handle_to_dmabuf(dev, file_priv, handle, flags);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	if (ivpu_gem_is_userptr_dma_buf(dmabuf)) {
> +		ivpu_dbg(vdev, IOCTL, "Exporting userptr BO is not allowed\n");
> +		dma_buf_put(dmabuf);
> +		return -EINVAL;
> +	}
> +
> +	fd = dma_buf_fd(dmabuf, flags);
> +	if (fd < 0) {
> +		dma_buf_put(dmabuf);
> +		return fd;
> +	}
> +
> +	*prime_fd = fd;
> +	return 0;
> +}
> +
>  static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
>  {
>  	struct drm_gem_shmem_object *shmem;
> diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
> index 0c3350f22b55..bfd15ce02354 100644
> --- a/drivers/accel/ivpu/ivpu_gem.h
> +++ b/drivers/accel/ivpu/ivpu_gem.h
> @@ -29,6 +29,9 @@ void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
>  
>  struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t size);
>  struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
> +int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
> +				u32 handle, u32 flags, int *prime_fd);
> +bool ivpu_gem_is_userptr_dma_buf(struct dma_buf *dma_buf);
>  struct ivpu_bo *ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>  			       struct ivpu_addr_range *range, u64 size, u32 flags);
>  struct ivpu_bo *ivpu_bo_create_runtime(struct ivpu_device *vdev, u64 addr, u64 size, u32 flags);
> diff --git a/drivers/accel/ivpu/ivpu_gem_userptr.c b/drivers/accel/ivpu/ivpu_gem_userptr.c
> index 7cbf3a4cdc73..45eabea5961e 100644
> --- a/drivers/accel/ivpu/ivpu_gem_userptr.c
> +++ b/drivers/accel/ivpu/ivpu_gem_userptr.c
> @@ -61,6 +61,11 @@ static const struct dma_buf_ops ivpu_gem_userptr_dmabuf_ops = {
>  	.release = ivpu_gem_userptr_dmabuf_release,
>  };
>  
> +bool ivpu_gem_is_userptr_dma_buf(struct dma_buf *dma_buf)
> +{
> +	return dma_buf->ops == &ivpu_gem_userptr_dmabuf_ops;
> +}
> +
>  static struct dma_buf *
>  ivpu_create_userptr_dmabuf(struct ivpu_device *vdev, void __user *user_ptr,
>  			   size_t size, uint32_t flags)


