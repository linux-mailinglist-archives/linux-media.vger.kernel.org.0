Return-Path: <linux-media+bounces-47932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1944C96AEA
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 11:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DEC63A145C
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 10:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC99302CC6;
	Mon,  1 Dec 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttqxnQUl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C410513959D;
	Mon,  1 Dec 2025 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764585399; cv=none; b=HRp+AF0iKARFa3sR/xWR1liv9n7wVAeJw3rLfXOyG4kfe61yTNsCIrDs3N5EwND3S3BdLCF90fgievtZFi4ZqG2IiAKxUopHUlI41mQedqmy4jyQzJntYyKXQ6uexbw7XDHEuyvA/3y7F6Q4jtKDnzUKXhjvGX4nZFNp2XqNqEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764585399; c=relaxed/simple;
	bh=i/3/Rip96GcKSnLsnoJCi2BaWt5AlEQD9LD5Gy2yr64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9jrG5EkrGu9oDRK0M2J9NrdWQRzRzLUbUmC7HYMA1uzZ8sT7r4ZEeFZgnxGnXJ2t/4K/EEBWk/zTayvraGPaM8pT1MsfpAf1AciDmGKE/DQnU5LmCk5cojikn9LJMnVAZSpPzwpJW7zcknrb0l9gmuJ96pVh4Kx8XlDPZNO9hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttqxnQUl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0535CC4CEF1;
	Mon,  1 Dec 2025 10:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764585399;
	bh=i/3/Rip96GcKSnLsnoJCi2BaWt5AlEQD9LD5Gy2yr64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ttqxnQUlMyZ735APhYyyPQlNfKCxrJ7vr/YSfKPCFR/vDFgL5eOPDW09v0LT0lpDU
	 ivEril84GprJ+EjxGUybk0u36RrkTSTOptCgRjdaVWZr9v6m4kzG/4rxC7D8gIjlLg
	 x9L89WwPTIOM0SklBRUx3nfizT1F98V85iPW0HzxOWSuSouOGJXt8bSSuie3N6CKQX
	 v0aWu63LNuFVFVOuT6a7PFDevwj8J4ygb9f+9ABPHjimzoxqrBD4txoLI9eR6nynSH
	 LZPhMTEMQ3aGx4iBMHTVXXD89hmehrEftHm/iHMnsfKYW8uDA0XD02v5GozAldSMPq
	 yvKsa4tXDLWbw==
Message-ID: <ed7701d7-28c8-4760-9ccb-f22fc1e9528e@kernel.org>
Date: Mon, 1 Dec 2025 11:36:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever
 possible
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>, Uladzislau Rezki <urezki@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20251122090343.81243-1-21cnbao@gmail.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251122090343.81243-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/25 10:03, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> In many cases, the pages passed to vmap() may include
> high-order pages—for example, the systemheap often allocates
> pages in descending order: order 8, then 4, then 0. Currently,
> vmap() iterates over every page individually—even the pages
> inside a high-order block are handled one by one. This patch
> detects high-order pages and maps them as a single contiguous
> block whenever possible.
> 
> Another possibility is to implement a new API, vmap_sg().
> However, that change seems to be quite large in scope.
> 
> When vmapping a 128MB dma-buf using the systemheap,
> this RFC appears to make system_heap_do_vmap() 16× faster:
> 
> W/ patch:
> [   51.363682] system_heap_do_vmap took 2474000 ns
> [   53.307044] system_heap_do_vmap took 2469008 ns
> [   55.061985] system_heap_do_vmap took 2519008 ns
> [   56.653810] system_heap_do_vmap took 2674000 ns
> 
> W/o patch:
> [    8.260880] system_heap_do_vmap took 39490000 ns
> [   32.513292] system_heap_do_vmap took 38784000 ns
> [   82.673374] system_heap_do_vmap took 40711008 ns
> [   84.579062] system_heap_do_vmap took 40236000 ns
> 
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>   mm/vmalloc.c | 49 +++++++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 0832f944544c..af2e3e8c052a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -642,6 +642,34 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>   	return err;
>   }
>   
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int stride,
> +		int max_steps,
> +		unsigned int idx)

These fit into less lines.

ideally

\t\tunsigned int stride, int max_steps, unsigned int idx)

> +{

int order, nr_pages, i;
struct page *base;

But I think you can just drop "base". And order.

> +	/*
> +	 * Currently, batching is only supported in vmap_pages_range
> +	 * when page_shift == PAGE_SHIFT.
> +	 */
> +	if (stride != 1)
> +		return 0;
> +
> +	struct page *base = pages[idx];
> +	if (!PageHead(base))
> +		return 0;
> +
> +	int order = compound_order(base);
> +	int nr_pages = 1 << order;


You can drop the head check etc and simply do

nr_pages = compound_nr(pages[idx]);
if (nr_pages == 1)
	return 0;

Which raises the question: are these things folios? I assume not.

> +
> +	if (max_steps < nr_pages)
> +		return 0;
> +
> +	for (int i = 0; i < nr_pages; i++)
> +		if (pages[idx + i] != base + i)
> +			return 0;

if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
	return compound_order(pages[idx]);
return 0;

-- 
Cheers

David

