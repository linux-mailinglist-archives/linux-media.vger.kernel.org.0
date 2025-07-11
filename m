Return-Path: <linux-media+bounces-37524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83797B02203
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 18:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFF9A4A2F0D
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 16:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676102EF643;
	Fri, 11 Jul 2025 16:40:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8C01CDA3F;
	Fri, 11 Jul 2025 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752252043; cv=none; b=aO/hOINcddB05Vb4qT6ZoDcfP8egbjK4P3ohr59V/n+TC8IPPXj6dPmueEboLhJX+b6To9ZUoXtqAiwt0hRDXZo80J5lKLzCXNAqVZAZlGW1TgMftx0Vd83g9V7kiXPVst8QY7ROEWCwtS2dowtzvZKeYlMFqR3HxY+8FORnGuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752252043; c=relaxed/simple;
	bh=BDu5xBnZHEG5B/eR+hzVKbwYGVWtaFSNFGqu6NNKK94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JcYwEDOoOuT814luJmjy+2XCzRucuc2txm8BhH1Xf7bOfIP6Zx1iGL/SVDLsE+jGKJzanN4PHkcPlx3yS7skLf4KgkPoYABZMZ1HPRKYEGiDRr1+SYGcmZKBfRpYMxdTL94PLAFT7hZe68MQ3FzzjootfI77w5VlF3cRrBnA3PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B800316F8;
	Fri, 11 Jul 2025 09:40:29 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B3643F6A8;
	Fri, 11 Jul 2025 09:40:37 -0700 (PDT)
Message-ID: <a1a93c41-4c21-4b7a-a8b8-5d4e83d73931@arm.com>
Date: Fri, 11 Jul 2025 17:40:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Daniel Stone <daniel@fooishbar.org>,
 Da Xue <da@libre.computer>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
 <fcb3ca23-7ebd-4f48-92d2-969b24936b9b@arm.com>
 <CAAObsKBiSX0HcxJJjTNGgE4FD4eAYW5wvY=bROtdkZ1mqf_0VQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAAObsKBiSX0HcxJJjTNGgE4FD4eAYW5wvY=bROtdkZ1mqf_0VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/07/2025 5:00 pm, Tomeu Vizoso wrote:
> On Tue, Jun 24, 2025 at 3:50 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
>> [...]
>>> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
>>> index 10acfe8534f00a7985d40a93f4b2f7f69d43caee..50e46f0516bd1615b5f826c5002a6c0ecbf9aed4 100644
>>> --- a/drivers/accel/rocket/rocket_device.h
>>> +++ b/drivers/accel/rocket/rocket_device.h
>>> @@ -13,6 +13,8 @@
>>>    struct rocket_device {
>>>        struct drm_device ddev;
>>>
>>> +     struct mutex sched_lock;
>>> +
>>>        struct mutex iommu_lock;
>>
>> Just realised I missed this in the last patch, but iommu_lock appears to
>> be completely unnecessary now.
>>
>>>        struct rocket_core *cores;
>> [...]
>>> +static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *job)
>>> +{
>>> +     struct rocket_task *task;
>>> +     bool task_pp_en = 1;
>>> +     bool task_count = 1;
>>> +
>>> +     /* GO ! */
>>> +
>>> +     /* Don't queue the job if a reset is in progress */
>>> +     if (atomic_read(&core->reset.pending))
>>> +             return;
>>> +
>>> +     task = &job->tasks[job->next_task_idx];
>>> +     job->next_task_idx++;
>>> +
>>> +     rocket_pc_writel(core, BASE_ADDRESS, 0x1);
>>> +
>>> +     rocket_cna_writel(core, S_POINTER, 0xe + 0x10000000 * core->index);
>>> +     rocket_core_writel(core, S_POINTER, 0xe + 0x10000000 * core->index);
>>
>> Those really look like bitfield operations rather than actual arithmetic
>> to me.
>>
>>> +
>>> +     rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);
>>
>> I don't see how regcmd is created (I guess that's in userspace?), but
>> given that it's explicitly u64 all the way through - and especially
>> since you claim to support 40-bit DMA addresses - it definitely seems
>> suspicious that the upper 32 bits never seem to be consumed anywhere :/
> 
> Yeah, but there's no other register for BASE_ADDRESS address in the TRM.

That only reaffirms the question then - if this value is only ever 
written verbatim to a 32-bit register, why is it 64-bit?

Thanks,
Robin.

