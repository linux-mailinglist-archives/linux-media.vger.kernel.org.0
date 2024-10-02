Return-Path: <linux-media+bounces-18971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5337598CF46
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 10:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2DD1F24192
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 08:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A21C19753F;
	Wed,  2 Oct 2024 08:54:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E354780BEC;
	Wed,  2 Oct 2024 08:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859260; cv=none; b=VyNfFD3hXjUldd6MVVpESjkokOUPIFrNIBcKD303aaLuiu+y86AUGI8H3t7DyaHIAoow/UJ4MmgR69jj1sPNOISKkB4He9bl5W7QkuDM+jWXEovs4aTASLN2r7KQCGNkpJH3pOcZBCZuWoyDhRAbOrDRkaNv/MxZq33REuEXyuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859260; c=relaxed/simple;
	bh=LVn/fbv4ls/FB1YzCdyt6qlk61D2pvCndCXJj/AXfsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjw4CVJIPZ8IVrQC+R1KYMi7NeJStPh4v7fTn7uvdp0YiFikbZIG/2RQXxX70e15nXOIqsT7iwLXFMENA8XvXCiSYjBU8+9JZW1BQrA+KFSxy56OD6fJhUKjey1NcbUuWybvuyPl9A36PiBewWhoqAyaKK9CCgk4srxkq6MMTXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F2AB367;
	Wed,  2 Oct 2024 01:54:47 -0700 (PDT)
Received: from [10.57.64.205] (unknown [10.57.64.205])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7E5B3F64C;
	Wed,  2 Oct 2024 01:54:14 -0700 (PDT)
Message-ID: <974cf95e-38fe-4949-ba63-b1513ce8abb5@arm.com>
Date: Wed, 2 Oct 2024 09:54:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20240923230912.2207320-1-adrian.larumbe@collabora.com>
 <20240923230912.2207320-2-adrian.larumbe@collabora.com>
 <20241002103809.26d34ee0@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241002103809.26d34ee0@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/10/2024 09:38, Boris Brezillon wrote:
> On Tue, 24 Sep 2024 00:06:21 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> 
>> +static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
>> +				       u32 cs_ringbuf_size)
>> +{
>> +	u32 min_profiled_job_instrs = U32_MAX;
>> +	u32 last_flag = fls(PANTHOR_DEVICE_PROFILING_ALL);
>> +
>> +	/*
>> +	 * We want to calculate the minimum size of a profiled job's CS,
>> +	 * because since they need additional instructions for the sampling
>> +	 * of performance metrics, they might take up further slots in
>> +	 * the queue's ringbuffer. This means we might not need as many job
>> +	 * slots for keeping track of their profiling information. What we
>> +	 * need is the maximum number of slots we should allocate to this end,
>> +	 * which matches the maximum number of profiled jobs we can place
>> +	 * simultaneously in the queue's ring buffer.
>> +	 * That has to be calculated separately for every single job profiling
>> +	 * flag, but not in the case job profiling is disabled, since unprofiled
>> +	 * jobs don't need to keep track of this at all.
>> +	 */
>> +	for (u32 i = 0; i < last_flag; i++) {
>> +		if (BIT(i) & PANTHOR_DEVICE_PROFILING_ALL)
> 
> I'll get rid of this check when applying, as suggested by Steve. Steve,
> with this modification do you want me to add your R-b?

Yes, please do.

Thanks,
Steve

> BTW, I've also fixed a bunch of checkpatch errors/warnings, so you
> might want to run checkpatch --strict next time.
> 
>> +			min_profiled_job_instrs =
>> +				min(min_profiled_job_instrs, calc_job_credits(BIT(i)));
>> +	}
>> +
>> +	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u64));
>> +}


