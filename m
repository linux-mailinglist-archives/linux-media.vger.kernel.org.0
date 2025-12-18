Return-Path: <linux-media+bounces-49071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 671F1CCBE87
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 14:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E516306B158
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 13:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474E9335568;
	Thu, 18 Dec 2025 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbQ31GKB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB7422652D;
	Thu, 18 Dec 2025 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766062923; cv=none; b=lIjbBanBifvvy1tP/0XjIrbOH2SWCYGskwH4YkPsq0AO1DwiauOsMuw73gyOgcR+ERdNmMzxWXGSikDOu2kfwNzbgfvZ5WxIQ97SgozfXCO4KzC74qg4rVbBI0k7eqi1lhNlgKx1FHa+Kak4Xc/PxFk8PKPM1lU2jpDPlx3aPtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766062923; c=relaxed/simple;
	bh=5DO6RDJonvikBIJmz3ENuqZ6dln+OBwoslWDMriPCxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBOaaS/cYMqG99enf6A+NMwvaj1tAFQe6UCIoUzQqQol9teiWJUl2tV557ACKZYmpdwVLOIUK5jhCCvETrCYKT/yaaYQwr/MsK4xGKPNKi7l8JMyKaFxhVmt9iibofp9XahgSTehIKtPQHawr8dAMhXA28mPHBt7noKkOUZ7mLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbQ31GKB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF0FC4CEFB;
	Thu, 18 Dec 2025 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766062922;
	bh=5DO6RDJonvikBIJmz3ENuqZ6dln+OBwoslWDMriPCxQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DbQ31GKBFd/oztUBucHbc47Na0LxGXTFx7Pw4Xxwv9sS8M3jt2HPGOLVZmnDoFXAg
	 1lPYxdNXc+mmQETjuJltJAr1vJF0j6466kUMAy5JlN/ZRkJuuZTJxDosJqMv5o4x/C
	 eAJP5rOyEf3PcneZlw0xvV4NbTNPYx7udhFIC8ULB7ljmJrtcZRllxeWEmmiPI0d2y
	 +UagdKor2Ki0nJNKW8wuhmcBpqor2QAHEsRtwemp4FqRFPvBvqLNpC9wbtCxqDW7jr
	 9eSKdG7Xx2CrWyI0COT932fUrYy+93xJaTzkw9EndpEjK9NhLzeOqQulfJ3HHxAsYT
	 Y8VRgutX7DOfw==
Message-ID: <e7c8478b-1ce4-4a15-a185-de9d9121438c@kernel.org>
Date: Thu, 18 Dec 2025 14:01:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org, jstultz@google.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 Uladzislau Rezki <urezki@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Tangquan Zheng <zhengtangquan@oppo.com>
References: <20251215053050.11599-1-21cnbao@gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251215053050.11599-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/15/25 06:30, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> In many cases, the pages passed to vmap() may include high-order
> pages allocated with __GFP_COMP flags. For example, the systemheap
> often allocates pages in descending order: order 8, then 4, then 0.
> Currently, vmap() iterates over every page individually—even pages
> inside a high-order block are handled one by one.
> 
> This patch detects high-order pages and maps them as a single
> contiguous block whenever possible.
> 
> An alternative would be to implement a new API, vmap_sg(), but that
> change seems to be large in scope.
> 
> When vmapping a 128MB dma-buf using the systemheap, this patch
> makes system_heap_do_vmap() roughly 17× faster.
> 
> W/ patch:
> [   10.404769] system_heap_do_vmap took 2494000 ns
> [   12.525921] system_heap_do_vmap took 2467008 ns
> [   14.517348] system_heap_do_vmap took 2471008 ns
> [   16.593406] system_heap_do_vmap took 2444000 ns
> [   19.501341] system_heap_do_vmap took 2489008 ns
> 
> W/o patch:
> [    7.413756] system_heap_do_vmap took 42626000 ns
> [    9.425610] system_heap_do_vmap took 42500992 ns
> [   11.810898] system_heap_do_vmap took 42215008 ns
> [   14.336790] system_heap_do_vmap took 42134992 ns
> [   16.373890] system_heap_do_vmap took 42750000 ns
> 

That's quite a speedup.

> Cc: David Hildenbrand <david@kernel.org>
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>   * diff with rfc:
>   Many code refinements based on David's suggestions, thanks!
>   Refine comment and changelog according to Uladzislau, thanks!
>   rfc link:
>   https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/
> 
>   mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 41dd01e8430c..8d577767a9e5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>   	return err;
>   }
>   
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int stride, unsigned int max_steps, unsigned int idx)
> +{
> +	int nr_pages = 1;

unsigned int, maybe

Why are you initializing nr_pages when you overwrite it below?

> +
> +	/*
> +	 * Currently, batching is only supported in vmap_pages_range
> +	 * when page_shift == PAGE_SHIFT.

I don't know the code so realizing how we go from page_shift to stride 
too me a second. Maybe only talk about stride here?

OTOH, is "stride" really the right terminology?

we calculate it as

	stride = 1U << (page_shift - PAGE_SHIFT);

page_shift - PAGE_SHIFT should give us an "order". So is this a 
"granularity" in nr_pages?

Again, I don't know this code, so sorry for the question.

> +	 */
> +	if (stride != 1)
> +		return 0;
> +
> +	nr_pages = compound_nr(pages[idx]);
> +	if (nr_pages == 1)
> +		return 0;
> +	if (max_steps < nr_pages)
> +		return 0;

Might combine these simple checks

if (nr_pages == 1 || max_steps < nr_pages)
	return 0;


-- 
Cheers

David

