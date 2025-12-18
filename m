Return-Path: <linux-media+bounces-49074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2100BCCC2F1
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 15:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B07A30C7C84
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 14:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7DE33F393;
	Thu, 18 Dec 2025 14:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjVho5Wk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6670633F8B1
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766066457; cv=none; b=pA7+ygsOPZLYs+PTazd6+ryJgxAKvs2TDse+Ga3l91VpwyGL4/WQCXMutTmF0mLMp3qUiihvrf0gA+JpdOYdz8PEz4VoRO9ELUcxrFvZfAJh3x9vH5RWV0p63I1NXI9/9QsdyvDfusdADzfecWotqGChBEkhaSLTkDfbkLoqs10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766066457; c=relaxed/simple;
	bh=ukcLXdSC69J/Fei+wG7WU/rmxb2NGCM85nOMnSDxsNA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d627I4dq+b327QmY0uFCg2m3h7i9wHefJAYJ4447qi3ZEn7//u4DpozKFCl3dxkNykFa49oBr/xr+8z9Z5UeOoEa7KeTHAdldWxiP3w/QiBenFUTFpry9lDExaQ9kO7RPwfowgI8Uez9vKeDbJRD/uTFiyZMb2hVeSRhUTPUS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjVho5Wk; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5957c929a5eso944541e87.1
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 06:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766066452; x=1766671252; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gia3XsZVU5S68keMVbCpat85CsVkLa/AQdgBIvpcJZo=;
        b=mjVho5WkaUCkUo4lXNJng/3BYqFyIh0kkDPz9IXaTKn7pehMaktEEKeei2j3+nW/aU
         noeuU982JfaxdojCIM+kAoKMaF6w/A7Q7448/zyQhT7plslu7vjhecTlacJRp/np/2H9
         xWJTr9GYg5J1SWqjCAqYlgS0bdVt1vW7LyxyWdqvdic8XfhMxfSyLMYkTsMHPEgHq05c
         5btl4yXPOAbONLa4GtKIKqo5EkbowOfH/xRrPzHWjLJ+B9heVGMjTWK91/sudhVpvRo6
         pQv2VTxPxOtA6h07VH527AsrI1Ny7n7H4vH8loha/NQOCamyHWtSq9FP+KrUxWZvcLyV
         KswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766066452; x=1766671252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gia3XsZVU5S68keMVbCpat85CsVkLa/AQdgBIvpcJZo=;
        b=ddyDM9yKUvZbr7y7G0QdEokaGiObIOCFA7QPocOGBP4QasVRtxQKORyPEWEZNtmYij
         7p7AEKHJDbuuw3UGG64W0d7boh6czd1IVROn6p8HT8z8qtjO5dHdLBCUjs9QxEf4aGVs
         3ziMaizcLC9BgszGyScBodtPFgvs8CNTG9bg6rSyl+aSdseiwGUI7BPa9FlgNgdiojRT
         fMK2E2q+/dcGXpJsgiEyg3tUpgbMcCowjqyaSYyjbqIO1RC4ISq4ismftxk9Ab0CbY1q
         QIqno9LMhMNfMvHoC9bYK9vMRzf3u9UA+EwSHh1UBK2vrye3C9bBmnkHnaFpjnpn5r7U
         m6Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWQN16Uz9sVM8mu0G2omOMEEytNo33YwizVzsR47NNrS1ZlbSXcjKl1hjFyKctxtHWt8bGZK7pNtxFdng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0r9wbQ+l7gXTmu9Wx0BnP/rn71hsRTuH7yK03H1CJ6CdeB9Ut
	xuhEcigUplW/7sXuNgUXCS/+LDUYWqkIQoKJgPGirjSA/8w0V1sTA0on
X-Gm-Gg: AY/fxX4NA2BzVc9F7ZdbiPCqITGoJNwnzRGX0+/PSD0Uz3Fa3CnbM5Of/BVFUF9xxVY
	+fSHiOtpsYlpWV9pqiUyaMYz8gGRCWsK2FPP/+1aXDgt10gLcwF6LEx1yNzAXDcWxCrAApqEqr6
	Y1Y/Mg1axPn5b3H9p+Ye3Rbh+4gu8UqOnPyK69b6sYCNtQ6USO0kWGXhyucM7i39EZI9UrytjHH
	Iae/nK1tzB1zf4Go3dk7VGJ5sco14piVrRrNtgRxVnuqprOhjxIzAHiRaQ5oWrTyyBu3dj0BVBJ
	x9GtSD1ti37QJvl9D2h2pjGF0i5YXmboCFkqZBbR6cgqVTwc+7SeVsmbab8gDTi6+GT2wiOVODz
	BoKuiBUDoJSkmPRmBIDpnA6yny7W5IGTd7qHGz8ujVm9MKNMcH+SCwXZxQYRFJQI=
X-Google-Smtp-Source: AGHT+IEl4Wys7Q4SsRgNG2E+WQ1GNUkskpWJrAarDBASWdaJXnRcMQIARLijn7oPvUMXkjAijza9bw==
X-Received: by 2002:a05:6512:3ba5:b0:597:d702:58e5 with SMTP id 2adb3069b0e04-598faa8408amr8438081e87.39.1766066451811;
        Thu, 18 Dec 2025 06:00:51 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132d4109sm1108082e87.41.2025.12.18.06.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 06:00:51 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 18 Dec 2025 15:00:49 +0100
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org, jstultz@google.com,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
	David Hildenbrand <david@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
Message-ID: <aUQJEa643lQAGK6s@milan>
References: <20251215053050.11599-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215053050.11599-1-21cnbao@gmail.com>

On Mon, Dec 15, 2025 at 01:30:50PM +0800, Barry Song wrote:
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
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  * diff with rfc:
>  Many code refinements based on David's suggestions, thanks!
>  Refine comment and changelog according to Uladzislau, thanks!
>  rfc link:
>  https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/
> 
>  mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 41dd01e8430c..8d577767a9e5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int stride, unsigned int max_steps, unsigned int idx)
> +{
> +	int nr_pages = 1;
> +
> +	/*
> +	 * Currently, batching is only supported in vmap_pages_range
> +	 * when page_shift == PAGE_SHIFT.
> +	 */
> +	if (stride != 1)
> +		return 0;
> +
> +	nr_pages = compound_nr(pages[idx]);
> +	if (nr_pages == 1)
> +		return 0;
> +	if (max_steps < nr_pages)
> +		return 0;
> +
> +	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
> +		return compound_order(pages[idx]);
> +	return 0;
> +}
> +
Can we instead look at this as: it can be that we have continues
set of pages let's find out. I mean if we do not stick just to
compound pages.

--
Uladzislau Rezki

