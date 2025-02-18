Return-Path: <linux-media+bounces-26284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A804A39E6D
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 15:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1E0318964B8
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 14:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B518269D08;
	Tue, 18 Feb 2025 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAgWO2Nu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F152417E6
	for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739887978; cv=none; b=P+XP0kzeYwYaUwl8Pc9L3QHkMjWXzgZF+4cXTP8FjVXBT8Nrtrs9B4i/kE0Gmx/Uw2sXsJGtWydg9iC9Z8BttAfmF0zuFvb51HNPmpLCRFXuYmjDjrHVy30SHFITRTt06AK1MDonXm6K8GnzfHlTyZcVjpTUx4HvmMxO7kIdcrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739887978; c=relaxed/simple;
	bh=dymMTqdECsb8Lth3B3121fFxta6e5G8DT9RsGjHNZqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1Lnkv2zd+PRGiNXGlRZS2bT37tjn0r9hOCoJvMpyulYhZyrq9rY6FofLCD6abG6Vqap1Iev0cj9MJv+Wl/3Sw4+URzOv4dOv63iNFMBQ7fDv6puh6aEilqeJ2z1f0cNSzfs/cVqZRKqzCctbcDhwKfQxpWXbE+HfYk9gj4Vl0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAgWO2Nu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-438a39e659cso38106085e9.2
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739887974; x=1740492774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tzYgRVcywhBYtuTTzJDErGjkC05GXKYOTab/tFE7SCE=;
        b=kAgWO2Nu1q/dqqipeFauypTHu5rdAY+crTO2hXAoURFufvCUYlFGCP3ajClJzadxwE
         MhqiJfWlvRxDzjYWQBoqkZOmJnoZSFl0w/ZrtBAe9+4MMhdSHVtLx3Rs2kxQEVBx3ple
         QbxpELNB7HrJG+OpNQtlfcbRT6b2yHVi1q0oWPQznrHiz/M1L99WNSSRwtPd2pDvEfrl
         lBgnns7iMbIwCCTnEXcLMSHD4b2JZZdhHb6qb4gOKQxjNXr9VXQrAH05mTvM7R7Wp/cw
         mxnGvtiawjOW52GWqdlErQNDKjPFf6XooOZ0nrPaPUas5ZFxG/pfR2C0dxJhupZiEFv7
         LaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739887974; x=1740492774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzYgRVcywhBYtuTTzJDErGjkC05GXKYOTab/tFE7SCE=;
        b=MPX44o5qkwIe/njzLUvN21Gsx2XigHx54wcMVVUXtJSgszziJ88Ze6WwQFPkFiLKC8
         UT9YmuvBI90hBPcDDxdeFL7TzB448GWJXZ/NLEXm3Ypd4UISLhaMVJt1mqkeTo/1JpFd
         N6NNFPdx0b+74MYIaXVwEtp8Vcn0mMB44PHIMU09IXwp7MghWIHbl4gxIGBIdg2+my34
         QxaPDAspUGN1j7Hku59RDdirbkgIAZY3ULHXaiAZQBX1MX7P+eUP7JTgnkg5ccB8MjcW
         lS2hJc7iI31c+1oWQwyXyWEEjLGF9AjiAy14If1d5YU1k8ryqXn+tlyu67hAYWoHYvmz
         kwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVthB3U0bS5oeQq08HLvEeon4V0LPkawPFJGuyQ5mqrnY+/u5enKrI74Hwnz08nluHjwI1NO3TUVhRciw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxrWUJqBhxoyrom/axy4hH5hKhVbt2gwm9TnpuT4yjh/6pTJrs
	c4sKswrukiW1evdw7GngFnQghYNmQc1pqjNawJR5mkHenoE98d6e
X-Gm-Gg: ASbGnct4AFQMJEOD3CX4DPZ91ehBSag9zsPRbStjsubdDqtxksifGr2wndBR4jE7jkP
	7UrFUF0LVG5JM0FIUyl7SoVOsJLuLXAhcOH0LDZHxYDFTp6vCpBteZr2xEN0ON4I70wCZCodjZz
	ImV97Hso+GtA/y21Oa35GFd7zhLHOotNkYbDrwHhzNgnPSIwd+vDrrdBeD1GozODS0A/EDJCCv0
	GYQwPFdZq4ZLoFfjQe5Cm8T48OOnOP2+L2ErWdCIN2sJCFzk7w5KPPJ9//Q4jVxB4UM4vibTTiz
	FVmenR2G7p1gVsFKttdD70IH6McmSyUwwPClXjQk6Nsh
X-Google-Smtp-Source: AGHT+IHQdmBtJTXbHOztlaXrqyk6KztRNhnBVJ/jRSTWe0s3IlZo6TDueGPoBa0nU58F8lBBcX3IRQ==
X-Received: by 2002:a05:600c:4f47:b0:439:9377:fa22 with SMTP id 5b1f17b1804b1-4399377fc5bmr26339075e9.18.1739887973904;
        Tue, 18 Feb 2025 06:12:53 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43986b475ffsm52786645e9.17.2025.02.18.06.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 06:12:53 -0800 (PST)
Message-ID: <6ee944fe-57a7-478c-ab8c-723ce315049f@gmail.com>
Date: Tue, 18 Feb 2025 15:12:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dma-buf: drop caching of sg_tables
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, tvrtko.ursulin@igalia.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-5-christian.koenig@amd.com>
 <Z7NjlfKYlxhTgRqe@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Z7NjlfKYlxhTgRqe@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 17.02.25 um 17:28 schrieb Simona Vetter:
> On Tue, Feb 11, 2025 at 05:31:09PM +0100, Christian König wrote:
>> That was purely for the transition from static to dynamic dma-buf
>> handling and can be removed again now.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Yay!
>
> Might uncover some fun if people have meanwhile started to rely on this
> for perf or something. But we'll figure that out when it happens.

Yeah that was exactly the reason why I made this a separate patch and didn't mixed it into patch #3.

On the other hand I'm fine to keep it a bit longer if anybody complains.

Christian.

>
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>
>
>> ---
>>  drivers/dma-buf/dma-buf.c              | 34 --------------------------
>>  drivers/dma-buf/udmabuf.c              |  1 -
>>  drivers/gpu/drm/drm_prime.c            |  1 -
>>  drivers/gpu/drm/virtio/virtgpu_prime.c |  1 -
>>  include/linux/dma-buf.h                | 13 ----------
>>  5 files changed, 50 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 357b94a3dbaa..35221c4ddbf5 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -636,10 +636,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>  		    || !exp_info->ops->release))
>>  		return ERR_PTR(-EINVAL);
>>  
>> -	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
>> -		    (exp_info->ops->pin || exp_info->ops->unpin)))
>> -		return ERR_PTR(-EINVAL);
>> -
>>  	if (WARN_ON(!exp_info->ops->pin != !exp_info->ops->unpin))
>>  		return ERR_PTR(-EINVAL);
>>  
>> @@ -964,17 +960,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>>  		return;
>>  
>>  	dma_resv_lock(dmabuf->resv, NULL);
>> -
>> -	if (attach->sgt) {
>> -		mangle_sg_table(attach->sgt);
>> -		attach->dmabuf->ops->unmap_dma_buf(attach, attach->sgt,
>> -						   attach->dir);
>> -
>> -		if (dma_buf_pin_on_map(attach))
>> -			dma_buf_unpin(attach);
>> -	}
>>  	list_del(&attach->node);
>> -
>>  	dma_resv_unlock(dmabuf->resv);
>>  
>>  	if (dmabuf->ops->detach)
>> @@ -1069,18 +1055,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>  
>>  	dma_resv_assert_held(attach->dmabuf->resv);
>>  
>> -	if (attach->sgt) {
>> -		/*
>> -		 * Two mappings with different directions for the same
>> -		 * attachment are not allowed.
>> -		 */
>> -		if (attach->dir != direction &&
>> -		    attach->dir != DMA_BIDIRECTIONAL)
>> -			return ERR_PTR(-EBUSY);
>> -
>> -		return attach->sgt;
>> -	}
>> -
>>  	if (dma_buf_pin_on_map(attach)) {
>>  		ret = attach->dmabuf->ops->pin(attach);
>>  		if (ret)
>> @@ -1105,11 +1079,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>  	}
>>  	mangle_sg_table(sg_table);
>>  
>> -	if (attach->dmabuf->ops->cache_sgt_mapping) {
>> -		attach->sgt = sg_table;
>> -		attach->dir = direction;
>> -	}
>> -
>>  #ifdef CONFIG_DMA_API_DEBUG
>>  	{
>>  		struct scatterlist *sg;
>> @@ -1190,9 +1159,6 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>>  
>>  	dma_resv_assert_held(attach->dmabuf->resv);
>>  
>> -	if (attach->sgt == sg_table)
>> -		return;
>> -
>>  	mangle_sg_table(sg_table);
>>  	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>>  
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index cc7398cc17d6..2fa2c9135eac 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -285,7 +285,6 @@ static int end_cpu_udmabuf(struct dma_buf *buf,
>>  }
>>  
>>  static const struct dma_buf_ops udmabuf_ops = {
>> -	.cache_sgt_mapping = true,
>>  	.map_dma_buf	   = map_udmabuf,
>>  	.unmap_dma_buf	   = unmap_udmabuf,
>>  	.release	   = release_udmabuf,
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 32a8781cfd67..c284f306d597 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -810,7 +810,6 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
>>  EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
>>  
>>  static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
>> -	.cache_sgt_mapping = true,
>>  	.attach = drm_gem_map_attach,
>>  	.detach = drm_gem_map_detach,
>>  	.map_dma_buf = drm_gem_map_dma_buf,
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
>> index fe6a0b018571..c6f3be3cb914 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
>> @@ -75,7 +75,6 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>>  
>>  static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>>  	.ops = {
>> -		.cache_sgt_mapping = true,
>>  		.attach = virtio_dma_buf_attach,
>>  		.detach = drm_gem_map_detach,
>>  		.map_dma_buf = virtgpu_gem_map_dma_buf,
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index c54ff2dda8cb..544f8f8c3f44 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -34,15 +34,6 @@ struct dma_buf_attachment;
>>   * @vunmap: [optional] unmaps a vmap from the buffer
>>   */
>>  struct dma_buf_ops {
>> -	/**
>> -	  * @cache_sgt_mapping:
>> -	  *
>> -	  * If true the framework will cache the first mapping made for each
>> -	  * attachment. This avoids creating mappings for attachments multiple
>> -	  * times.
>> -	  */
>> -	bool cache_sgt_mapping;
>> -
>>  	/**
>>  	 * @attach:
>>  	 *
>> @@ -493,8 +484,6 @@ struct dma_buf_attach_ops {
>>   * @dmabuf: buffer for this attachment.
>>   * @dev: device attached to the buffer.
>>   * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
>> - * @sgt: cached mapping.
>> - * @dir: direction of cached mapping.
>>   * @peer2peer: true if the importer can handle peer resources without pages.
>>   * @priv: exporter specific attachment data.
>>   * @importer_ops: importer operations for this attachment, if provided
>> @@ -514,8 +503,6 @@ struct dma_buf_attachment {
>>  	struct dma_buf *dmabuf;
>>  	struct device *dev;
>>  	struct list_head node;
>> -	struct sg_table *sgt;
>> -	enum dma_data_direction dir;
>>  	bool peer2peer;
>>  	const struct dma_buf_attach_ops *importer_ops;
>>  	void *importer_priv;
>> -- 
>> 2.34.1
>>


