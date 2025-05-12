Return-Path: <linux-media+bounces-32271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758C4AB32B5
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 11:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B629E17A8DA
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 09:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E7A256C64;
	Mon, 12 May 2025 09:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="khM/4NUN"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F38433A0
	for <linux-media@vger.kernel.org>; Mon, 12 May 2025 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040745; cv=none; b=BgSAA83IyYaxjNXi9cAXxmZgu6AVZqfwFZaBlCIhJWnNQKdMnkMov7E2m6Dyro55TWFrA4Yy157JlUoU4ySSG5h3zdI/6GXGyQ9n5Ir2gn1Sfb9ABkbdTqs91r+wi4l+nuLVz5LnS/25lT9GUtZwvSshwDHPw4IKzviRttZKSHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040745; c=relaxed/simple;
	bh=fMUqe4KWitjZXym4LkL08Iolae6uMgbRmXEojZBDO4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbgZQlxp74CVsTNzx0RnG5TsDuwHxIgrpC+rGS7JZypg6+ojjz7teFagLaHAbxjlmEoQr4GD+QQeqpKz9AWOAxBunK3AgliMCVDT/EYX64BQ1b40gCEtB4d999/cG66fIQYrVcJACO3yMAm1IvZIKF1lzqe3lrfDfktg6dY67nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=khM/4NUN; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0mTqn4uxOGOFVgmrrtw5QBIjumcsx4s7cKzF4psSG84=; b=khM/4NUNu6chJAWUOqfXhUBXkp
	wVljFe/6YYHOOOF9sVGWlcAN03zaMjkdH8I1wSrxuysB9fngDKMDUfg3B8F12Es7aNya1WRYb0PAk
	UqumuW2RbV6+bWOUeVyetFWUYjgRB61DvY4YRpf0KkyZzuSZ2VVAVkbq9WxDaoKfQgJgL1izmQ7Lj
	QYCMi8FRr7SXLOnu1EE97MWiCnHVzZicz0UENnCUwixSAlQzAAkyimCwOx8AaBMPOn8biv4YOLOg/
	tl2IMaWRMQb8t01cCAqfvT0VN16s0UJ9MLjPAMGUG18biedrNCjtHp7SIRaVz8ZDNvSi6PpYrD+ul
	NlOmm+wg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uEP17-006zJx-4F; Mon, 12 May 2025 11:05:27 +0200
Message-ID: <3e884da6-62c7-4d77-b271-48d4c0ffdfbe@igalia.com>
Date: Mon, 12 May 2025 10:05:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 06/13] dma-fence: Use driver and timeline name helpers
 internally
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-7-tvrtko.ursulin@igalia.com>
 <f0e371e8-5a66-4594-9fc3-167e710017c0@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <f0e371e8-5a66-4594-9fc3-167e710017c0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/05/2025 09:22, Christian König wrote:
> On 5/9/25 17:33, Tvrtko Ursulin wrote:
>> Make the implementation use the previously added helper for accessing the
>> driver and timeline name. This will enable more coverage later when
>> asserts will be added into them.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> I would squash that together with the previous patch. Since both patches are for the same component it doesn't make much sense to separate them.
> 
> Anyway Reviewed-by: Christian König <christian.koenig@amd.com>

Squashed locally and I kept your r-b.

Regards,

Tvrtko

>> ---
>>   drivers/dma-buf/dma-fence.c      | 9 +++++----
>>   include/trace/events/dma_fence.h | 4 ++--
>>   2 files changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 33661658f684..dc2456f68685 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -538,8 +538,8 @@ void dma_fence_release(struct kref *kref)
>>   	if (WARN(!list_empty(&fence->cb_list) &&
>>   		 !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags),
>>   		 "Fence %s:%s:%llx:%llx released with pending signals!\n",
>> -		 fence->ops->get_driver_name(fence),
>> -		 fence->ops->get_timeline_name(fence),
>> +		 dma_fence_driver_name(fence),
>> +		 dma_fence_timeline_name(fence),
>>   		 fence->context, fence->seqno)) {
>>   		unsigned long flags;
>>   
>> @@ -983,8 +983,9 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>>   {
>>   	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
>> -		   fence->ops->get_driver_name(fence),
>> -		   fence->ops->get_timeline_name(fence), fence->seqno,
>> +		   dma_fence_driver_name(fence),
>> +		   dma_fence_timeline_name(fence),
>> +		   fence->seqno,
>>   		   dma_fence_is_signaled(fence) ? "" : "un");
>>   }
>>   EXPORT_SYMBOL(dma_fence_describe);
>> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
>> index a4de3df8500b..84c83074ee81 100644
>> --- a/include/trace/events/dma_fence.h
>> +++ b/include/trace/events/dma_fence.h
>> @@ -16,8 +16,8 @@ DECLARE_EVENT_CLASS(dma_fence,
>>   	TP_ARGS(fence),
>>   
>>   	TP_STRUCT__entry(
>> -		__string(driver, fence->ops->get_driver_name(fence))
>> -		__string(timeline, fence->ops->get_timeline_name(fence))
>> +		__string(driver, dma_fence_driver_name(fence))
>> +		__string(timeline, dma_fence_timeline_name(fence))
>>   		__field(unsigned int, context)
>>   		__field(unsigned int, seqno)
>>   	),
> 


