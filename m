Return-Path: <linux-media+bounces-49073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC519CCC260
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 14:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC9E631057DB
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 13:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABEE345CC0;
	Thu, 18 Dec 2025 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wyp2hrhN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03432334C1C
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766066106; cv=none; b=MjTtU1ypZHYs3J3UqMs1LY0q43ntGPdudZL0oYa6tUYs4RYIb/QVulsSTL2b8dyo94cB+zi5gYo/rmitPh7NtLgIJtQseG9GsmW2BFg3CRhRD5MsoCViQT1hqHJQzgMzFujitwNLxeeKFosUnOHLrnLAoIVPvP9mtS+M6H89pnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766066106; c=relaxed/simple;
	bh=wBgs6aRYBgR9FwlU4HnwO9fuUlN7rp4Z6NSgZdLbCjc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5+SHPm4sa3jIcUGDOJ5ho5Rhtea7l6B20KHdXvSKMcjeJTtAKpD5s/+CVKRLqreNwRYos/mMTU+Clqq19NEXDhq+6RgqjOt1w/qjYIipY+XqIH+S4tIq2dF/MmchtNQYHWfpJUc7PYQFfEW++jNHJ10LH504oUksD8JMtCsYDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wyp2hrhN; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59a10ef758aso598777e87.2
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 05:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766066101; x=1766670901; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HDnXzSjtYaHM4x40x58+Blau4mKWsjcizNbfaizYC4s=;
        b=Wyp2hrhNk9sa5F2+WTTESg99xMkoGk//2oJwOVkz1nL8tta5NjkZ1/tfiaFzFhi1Zl
         Gjz8k0MSmyHioKS3yv3SqsgunuzGZI3AzmpipchDR8j+eQYTOuWWDyhwL87ACoAiAdAe
         HUWj/D6JHxQeyogMG711Ljlj6Jq4B+/bU7QkndPcx/t/P6sJmvlKHK/Ls26g6Qj2P8lP
         B6jw47Hy9hmzA/eiQl18gRg1rZ/xnv8C+mBZIK/fZtWCMJhdCVfQNqSjD+ls6lzf4Wr2
         ZM/AD/ulI5AL3zk1VzOQ0k2DhzQIHkY0REH7igmpy92Y2+MljUPAFGLdX82tRFijzjYO
         bD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766066101; x=1766670901;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDnXzSjtYaHM4x40x58+Blau4mKWsjcizNbfaizYC4s=;
        b=lwg9gFx14m79VE9IN6cXQVPyidq0OyzO6S1T/0z/VhXJUiYAadTgAxDiW5CucVGHzN
         Jt87s55ExJE8yigTau1Vm3ACPAIpo6qkhoJ1iL+4/WCC4Af7dyaVSkXethDD1uj33EDm
         UhCzI2ZUq46UMlvLGN6coN7cKKA7hkhqa9eoICI8ttlEQiXVmgL/s5RwYpQTWIKhZmJj
         yLozzS1Ok6zPWL2TtUIZlPfgY1M6tInAF/VZG+lK3bloMfEVza9W8Gk6IN5EK8B0gnh/
         MR6RpnBEOY8QV3h0tOFVbk0NCd8U6wXSN6QMA0H5pI9zMtHZb3X9VK/7/ithTiAuO6Ik
         Nk6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiiXCNhJ21FTJRee7W47fcxh/6Wg4G5MjCpK3ynkoRl4+rHlvJXrtVnnfOp5+70ap61LgPVvifx7JnDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGS8DQAzIzhh5VHoOPhTMbBDDmLHQaDlGPho+rsY/X2n+P2+E+
	ZLZGta6HMn5WoJzIt+IOfLvE6kZ6qnhh3+jA+DVR80QWzS49sLkwEEPO
X-Gm-Gg: AY/fxX74kdK3p1gsXiaz25/Th2PrHtmqVXL8bO0lY2FrQ79B/3CNdoH66+jFfsnOACM
	9NP1H+HDTfqDbQkivqWJ7VRq8u1XwBmdHcsGSKpWbZ9mj/R/7WxIpGY3GlvAjp239Cgn4GpRjUz
	+bVL5vYyswOB4GzeuaO/iYetpOfp6bFiNM5zcPSXdZcaIN1cN52dIPn7hJLU32lWNkgdkn9hrFJ
	IkVgskxM0hTP9unbXWbyoTUyTYP3zi64Qb0gAdrkLoJr7RqYet7nhyfOp1WKCk3BbD+T1+JND9b
	9JDspGf7uRI8o9ARE/CC3y3pGvOKTopbSsdirTOwRk6+JQaejqFDg7FUhaApBZMvls8q9uqceq8
	/g+tz3HgdRF/rugamJSkAkUNQBuzovFqF2AEILDYKvuwKZkARotRG
X-Google-Smtp-Source: AGHT+IFEs/IPmhycLdgTpBPBgGa1eUvj3QCPpB/NO2gh7wKbNs6ilucY3zYK/1hGd6Pg8xIq9YxpJw==
X-Received: by 2002:a05:6512:6783:b0:596:51d0:9373 with SMTP id 2adb3069b0e04-598faa4d58emr5189309e87.24.1766066100616;
        Thu, 18 Dec 2025 05:55:00 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a13506b2dsm1116848e87.95.2025.12.18.05.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 05:55:00 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 18 Dec 2025 14:54:58 +0100
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
	Barry Song <21cnbao@gmail.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
	jstultz@google.com, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
Message-ID: <aUQHss6K8b_esvpw@milan>
References: <20251215053050.11599-1-21cnbao@gmail.com>
 <e7c8478b-1ce4-4a15-a185-de9d9121438c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7c8478b-1ce4-4a15-a185-de9d9121438c@kernel.org>

On Thu, Dec 18, 2025 at 02:01:56PM +0100, David Hildenbrand (Red Hat) wrote:
> On 12/15/25 06:30, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> > 
> > In many cases, the pages passed to vmap() may include high-order
> > pages allocated with __GFP_COMP flags. For example, the systemheap
> > often allocates pages in descending order: order 8, then 4, then 0.
> > Currently, vmap() iterates over every page individually—even pages
> > inside a high-order block are handled one by one.
> > 
> > This patch detects high-order pages and maps them as a single
> > contiguous block whenever possible.
> > 
> > An alternative would be to implement a new API, vmap_sg(), but that
> > change seems to be large in scope.
> > 
> > When vmapping a 128MB dma-buf using the systemheap, this patch
> > makes system_heap_do_vmap() roughly 17× faster.
> > 
> > W/ patch:
> > [   10.404769] system_heap_do_vmap took 2494000 ns
> > [   12.525921] system_heap_do_vmap took 2467008 ns
> > [   14.517348] system_heap_do_vmap took 2471008 ns
> > [   16.593406] system_heap_do_vmap took 2444000 ns
> > [   19.501341] system_heap_do_vmap took 2489008 ns
> > 
> > W/o patch:
> > [    7.413756] system_heap_do_vmap took 42626000 ns
> > [    9.425610] system_heap_do_vmap took 42500992 ns
> > [   11.810898] system_heap_do_vmap took 42215008 ns
> > [   14.336790] system_heap_do_vmap took 42134992 ns
> > [   16.373890] system_heap_do_vmap took 42750000 ns
> > 
> 
> That's quite a speedup.
> 
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Uladzislau Rezki <urezki@gmail.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: John Stultz <jstultz@google.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >   * diff with rfc:
> >   Many code refinements based on David's suggestions, thanks!
> >   Refine comment and changelog according to Uladzislau, thanks!
> >   rfc link:
> >   https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/
> > 
> >   mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
> >   1 file changed, 39 insertions(+), 6 deletions(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 41dd01e8430c..8d577767a9e5 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> >   	return err;
> >   }
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +		unsigned int stride, unsigned int max_steps, unsigned int idx)
> > +{
> > +	int nr_pages = 1;
> 
> unsigned int, maybe
> 
> Why are you initializing nr_pages when you overwrite it below?
> 
> > +
> > +	/*
> > +	 * Currently, batching is only supported in vmap_pages_range
> > +	 * when page_shift == PAGE_SHIFT.
> 
> I don't know the code so realizing how we go from page_shift to stride too
> me a second. Maybe only talk about stride here?
> 
> OTOH, is "stride" really the right terminology?
> 
> we calculate it as
> 
> 	stride = 1U << (page_shift - PAGE_SHIFT);
> 
> page_shift - PAGE_SHIFT should give us an "order". So is this a
> "granularity" in nr_pages?
> 
> Again, I don't know this code, so sorry for the question.
> 
To me "stride" also sounds unclear.

--
Uladzislau Rezki

