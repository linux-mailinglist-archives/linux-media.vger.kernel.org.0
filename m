Return-Path: <linux-media+bounces-26230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E783EA38A79
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 18:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABF7516CAA3
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 17:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B07E229B00;
	Mon, 17 Feb 2025 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="PPLZBa5q"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E1222576E
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739812809; cv=pass; b=ISeti6gExJlec6hk19Lb6Ij9+C7/yxZMs4aNGPIwzwPDlD/TCfXIck/v///lVFM6OORQTCA3kklNRy5qsnzavciHrfZsM7GvuPzboicrO3KmWBzpJJFiJD2ObWPOAKVpPWv5yeB2RnC278Xodfi4VrwOukEHrPddQYEX9LGjY+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739812809; c=relaxed/simple;
	bh=RmRlPwDLPrnAX2zPsRTFbkoReOWFjvhVZv0t81+MH3Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=rdXHW3F+23UitaMfe2P9eVi/k27KQelPBEEqv0lC7HMGDmvtIyjRkXGU3uQnjBKR0BiHvPcws6oXwoxUuAJBh1uZ5p3qp4GDGfC3/I+fzdJcRVS3QqGYEQzQaVUSghR1oT4RMHVF19/U34y9JhXJg6MsQMfLB+RvtP2ASGX7FAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=PPLZBa5q; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739812786; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Rjw/Cm27Uta0gGl2xZQWJeblspEmcJ7tYoBoc0MNE26yVFUoq56OOm+iCJcK/QahAzuPzjnRrg+YDVUUQW0tmpFo62cvum4XCBRibwoIUU+0U9eXLtQYhahscWAyof3zo6nSOHwz2mlgmz0ndwtaphTPnZlDbLKaXdBpnxvSMDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739812786; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=CGjGjHILHE6fBlICxZyQymcs/b7USVxPmHlrDX38mWw=; 
	b=YcLyw0RbW4kRAR0SQLT30/cH01kF2QYy38cW+ZsCIpf6AY78nrhAs35wQ70DWV430oTLPBM/86PLA/Dhijv7Oec9kAk5EKBs4YrIZ11RVVIaMdNYYmb9H2QlwXAiBLp6oU/s9FUfljzPYc2c/scIcLDdEYUl2iQJDzBDOOcIRms=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739812786;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=CGjGjHILHE6fBlICxZyQymcs/b7USVxPmHlrDX38mWw=;
	b=PPLZBa5qn9/du/QNb7UvTN+B6nR+hoAgRqOHFwN1zu2QLe7Wfx0YXp3Sfe0mVpur
	6tYBiIpv6960M06XOPFF2sTcc9G0yGBAb4arCJTAXeswm+N8jsgrSBTYTzBXFE0PnrQ
	f1QgE6NcJzgXLeyaIgF3ySAaoJEk92FqHUGqNjvo=
Received: by mx.zohomail.com with SMTPS id 1739812783746843.9550854145257;
	Mon, 17 Feb 2025 09:19:43 -0800 (PST)
Message-ID: <ed9c800d-8ad4-4c30-a380-7b3053f05d17@collabora.com>
Date: Mon, 17 Feb 2025 20:19:40 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dma-buf/dma-fence: remove unnecessary callbacks
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 tvrtko.ursulin@igalia.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-3-christian.koenig@amd.com>
 <0ced2a19-a595-4862-87b1-f9c5c6cabf16@collabora.com>
Content-Language: en-US
In-Reply-To: <0ced2a19-a595-4862-87b1-f9c5c6cabf16@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 2/17/25 20:11, Dmitry Osipenko wrote:
> On 2/11/25 19:31, Christian König wrote:
>> The fence_value_str and timeline_value_str callbacks were just an
>> unnecessary abstraction in the SW sync implementation.
>>
>> The only caller of those callbacks already knew that the fence in
>> questions is a timeline_fence. So print the values directly instead
>> of using a redirection.
>>
>> Additional to that remove the implementations from virtgpu and vgem.
>> As far as I can see those were never used in the first place.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/dma-buf/sw_sync.c              | 16 ----------------
>>  drivers/dma-buf/sync_debug.c           | 21 ++-------------------
>>  drivers/gpu/drm/vgem/vgem_fence.c      | 15 ---------------
>>  drivers/gpu/drm/virtio/virtgpu_fence.c | 16 ----------------
>>  include/linux/dma-fence.h              | 21 ---------------------
>>  5 files changed, 2 insertions(+), 87 deletions(-)
>>
>> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
>> index f5905d67dedb..849280ae79a9 100644
>> --- a/drivers/dma-buf/sw_sync.c
>> +++ b/drivers/dma-buf/sw_sync.c
>> @@ -173,20 +173,6 @@ static bool timeline_fence_signaled(struct dma_fence *fence)
>>  	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
>>  }
>>  
>> -static void timeline_fence_value_str(struct dma_fence *fence,
>> -				    char *str, int size)
>> -{
>> -	snprintf(str, size, "%lld", fence->seqno);
>> -}
>> -
>> -static void timeline_fence_timeline_value_str(struct dma_fence *fence,
>> -					     char *str, int size)
>> -{
>> -	struct sync_timeline *parent = dma_fence_parent(fence);
>> -
>> -	snprintf(str, size, "%d", parent->value);
>> -}
>> -
>>  static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>  {
>>  	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
>> @@ -208,8 +194,6 @@ static const struct dma_fence_ops timeline_fence_ops = {
>>  	.get_timeline_name = timeline_fence_get_timeline_name,
>>  	.signaled = timeline_fence_signaled,
>>  	.release = timeline_fence_release,
>> -	.fence_value_str = timeline_fence_value_str,
>> -	.timeline_value_str = timeline_fence_timeline_value_str,
>>  	.set_deadline = timeline_fence_set_deadline,
>>  };
>>  
>> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
>> index 237bce21d1e7..270daae7d89a 100644
>> --- a/drivers/dma-buf/sync_debug.c
>> +++ b/drivers/dma-buf/sync_debug.c
>> @@ -82,25 +82,8 @@ static void sync_print_fence(struct seq_file *s,
>>  		seq_printf(s, "@%lld.%09ld", (s64)ts64.tv_sec, ts64.tv_nsec);
>>  	}
>>  
>> -	if (fence->ops->timeline_value_str &&
>> -		fence->ops->fence_value_str) {
>> -		char value[64];
>> -		bool success;
>> -
>> -		fence->ops->fence_value_str(fence, value, sizeof(value));
>> -		success = strlen(value);
>> -
>> -		if (success) {
>> -			seq_printf(s, ": %s", value);
>> -
>> -			fence->ops->timeline_value_str(fence, value,
>> -						       sizeof(value));
>> -
>> -			if (strlen(value))
>> -				seq_printf(s, " / %s", value);
>> -		}
>> -	}
>> -
>> +	seq_printf(s, ": %lld", fence->seqno);
>> +	seq_printf(s, " / %d", parent->value);
>>  	seq_putc(s, '\n');
>>  }
>>  
>> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
>> index e15754178395..5298d995faa7 100644
>> --- a/drivers/gpu/drm/vgem/vgem_fence.c
>> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
>> @@ -53,25 +53,10 @@ static void vgem_fence_release(struct dma_fence *base)
>>  	dma_fence_free(&fence->base);
>>  }
>>  
>> -static void vgem_fence_value_str(struct dma_fence *fence, char *str, int size)
>> -{
>> -	snprintf(str, size, "%llu", fence->seqno);
>> -}
>> -
>> -static void vgem_fence_timeline_value_str(struct dma_fence *fence, char *str,
>> -					  int size)
>> -{
>> -	snprintf(str, size, "%llu",
>> -		 dma_fence_is_signaled(fence) ? fence->seqno : 0);
>> -}
>> -
>>  static const struct dma_fence_ops vgem_fence_ops = {
>>  	.get_driver_name = vgem_fence_get_driver_name,
>>  	.get_timeline_name = vgem_fence_get_timeline_name,
>>  	.release = vgem_fence_release,
>> -
>> -	.fence_value_str = vgem_fence_value_str,
>> -	.timeline_value_str = vgem_fence_timeline_value_str,
>>  };
>>  
>>  static void vgem_fence_timeout(struct timer_list *t)
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
>> index f28357dbde35..44c1d8ef3c4d 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_fence.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
>> @@ -49,26 +49,10 @@ static bool virtio_gpu_fence_signaled(struct dma_fence *f)
>>  	return false;
>>  }
>>  
>> -static void virtio_gpu_fence_value_str(struct dma_fence *f, char *str, int size)
>> -{
>> -	snprintf(str, size, "[%llu, %llu]", f->context, f->seqno);
>> -}
>> -
>> -static void virtio_gpu_timeline_value_str(struct dma_fence *f, char *str,
>> -					  int size)
>> -{
>> -	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
>> -
>> -	snprintf(str, size, "%llu",
>> -		 (u64)atomic64_read(&fence->drv->last_fence_id));
>> -}
>> -
>>  static const struct dma_fence_ops virtio_gpu_fence_ops = {
>>  	.get_driver_name     = virtio_gpu_get_driver_name,
>>  	.get_timeline_name   = virtio_gpu_get_timeline_name,
>>  	.signaled            = virtio_gpu_fence_signaled,
>> -	.fence_value_str     = virtio_gpu_fence_value_str,
>> -	.timeline_value_str  = virtio_gpu_timeline_value_str,
>>  };
>>  
>>  struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index e230af0d123f..8778e2d758da 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -238,27 +238,6 @@ struct dma_fence_ops {
>>  	 */
>>  	void (*release)(struct dma_fence *fence);
>>  
>> -	/**
>> -	 * @fence_value_str:
>> -	 *
>> -	 * Callback to fill in free-form debug info specific to this fence, like
>> -	 * the sequence number.
>> -	 *
>> -	 * This callback is optional.
>> -	 */
>> -	void (*fence_value_str)(struct dma_fence *fence, char *str, int size);
>> -
>> -	/**
>> -	 * @timeline_value_str:
>> -	 *
>> -	 * Fills in the current value of the timeline as a string, like the
>> -	 * sequence number. Note that the specific fence passed to this function
>> -	 * should not matter, drivers should only use it to look up the
>> -	 * corresponding timeline structures.
>> -	 */
>> -	void (*timeline_value_str)(struct dma_fence *fence,
>> -				   char *str, int size);
>> -
>>  	/**
>>  	 * @set_deadline:
>>  	 *
> 
> Look okay. No sure if Google's perfetto makes use of the syncfile
> debugfs and then this change may brake the userspace parser for
> virtio-gpu, but debugfs isn't ABI and perfetto will adapt if needed.
> 
> +cc Rob Clark for visibility
> 
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

and +Gurchetan Singh for even more visibility

-- 
Best regards,
Dmitry

