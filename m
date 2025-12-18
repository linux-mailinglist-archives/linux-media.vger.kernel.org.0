Return-Path: <linux-media+bounces-49099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A57FACCDAD5
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 22:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 416B0300FA06
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 21:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D142D6608;
	Thu, 18 Dec 2025 21:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1oHi/iV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD0F33AD80
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 21:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766093094; cv=none; b=T6KJYyV92Rr7/fv2U9TCQKKvSkffZoucHUrxw2a2RFYpCuRn3QzxQV01RZrkUB2lGfjpJV8C18itIqx8UyY0mjvnL5zg8igikTtlJz6DJ3b30ajGbnV6oY3JAEfUPqoZ6eReGZyqoGHfMTXVPu4fNcsflo/pPmpFfICPZgcBsSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766093094; c=relaxed/simple;
	bh=ioGwul6NcJRMLNkxVxfAXWMl0uIpRthPzWaXBvUwg/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fFmpZAmuZKEdndgEa+xFPHSdDOAkhRv9J1lrHoCNPsSOwboM7Iodnm8MF3T7h4BL0xRgmfjs+N0Y1NCSS1pvcfpDdvNeevQy0E4CxHslemYRJYy7P5Y4gshYweRxI7FHs8/LaFNZSAoUkW67F844O2g3UruaZuiWVp9EFogob84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1oHi/iV; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so1334204b3a.1
        for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 13:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766093086; x=1766697886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTohBmtIORr8n8lsBagnrEz6IPI4sdKvMwJT/pJENjY=;
        b=V1oHi/iV8tP+QX3YzWlZfOgNf7b+lBrmCaPQHoIdJSxsIKxVsPtmnrTP8swNc7/VgJ
         n1oah6v6cYJBfFMojA8UV3WsaPkYTzXtM2ii2bpXDXj8daJJEChtO3iBqdNPBfSsX0s+
         N8cmhqOyw3/4pd9usp9CjikjcFvPm1nb6+w7xKgdqH1eKLGnkZem5l5gnJNGpEesVUv/
         kIEjIZKwW6kwwL64I/bMJidu60gCtcE525C+dqru6bUYMBWgMMM3t0YvOEAaUQC1XXmm
         j9puqDGISXiEzLD7sR6xx14MPTLs+v1LmytfiY/NWy5jkIYidFmZEdvosmQEcXS40ZIz
         NuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766093086; x=1766697886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTohBmtIORr8n8lsBagnrEz6IPI4sdKvMwJT/pJENjY=;
        b=lFfjrAW+RVCaybtfthylPnLAx9mKSP30AABm7lnvJVRknCXajqHsTi4zRcvpB8Mc6a
         vEFMFOh8vWZB6OIFAgeE8Z1Z5dMZXfs9xRs+I7HDh+au0gFW3hBzXowOVZTgCjO/MVUF
         2/IP7RZhCdxvQHFKMd2aCtozFAXb8HoXpbrXYqEhLYh298FOqX+os26nuKPmYhsZOxat
         5lCX+yIoi0r+RJ+QZ1jlho1Yp9t6z/pz8buRf6aSRFSA+pheO8SiJQU/7OyeQdauiVD1
         uB3Tsj8KQkEClQepW9XJANXYLkupxdWrm3W9MCYwv3QB5fRDMNCXSrdPh0fOp9Jo3waV
         9cyA==
X-Forwarded-Encrypted: i=1; AJvYcCVMUd7Wdffn3BREIvaNalafsnI2CVXEtTV0ufMyNCk9Pz66h/SBlCTnkdJGjUDPgnLe74NvDa9/s/VZmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySuwD6yQ3EK4ZD8NPhrEpCRc3wcPjFMIH+WUCkzkHkhqoOVS2G
	ZG/3t+D1HjRYFuOqnF7h4yA5mea9plz8oI7l0cDVLstZ6Rj5RVJYFnXr
X-Gm-Gg: AY/fxX4/fRoS4ksuxyNZ77AQ73YaI4Xok9Lif74flWCzkA0tLwPIFgZyU141Idp1yM9
	uMLPD1pWCfNXmN4vdTMdLUuXeOWhj49wu+XbZ+qHA3rVju+McATw/Im1x+qlHWMNT/ocD2mjN/s
	XdpyWjPB2+9n2nVSOo040MqZIbaRWnF4yGS6SgStag3tc6vj+MF0wv1o4DxUUhWg+zGPxjnrQZ9
	U7sJvsBnvExpyMqk15TzJwLmd/norO8iyTQjZskIDkAJJUl6ti5PzQzmsYLgMsKphPNkA9r4MbK
	6MpV1tqpMW1j6dEjZw4XSs+xERPhWKWblbAbNdcfLlCrU2y7+LHd8AqW9WqRlnIXSLg0y5Ce7R3
	ngQaaeErfkHKUxGEnFqgGJ03Jmisoan5prdxkULa+t4nukH4xHicBJ/yznV1H3CoIUJ420l1SHJ
	H24Um5Y1U0TJ+GcN9tnVpQE8k+
X-Google-Smtp-Source: AGHT+IGdOHVdrcCuEhBbazWVZdWwuUQF6Z6rcTSGphDUl2qn81RLeTCX0R1hfWncTkyQFdQxgYXjUA==
X-Received: by 2002:a05:6a00:808c:b0:7e8:450c:61b5 with SMTP id d2e1a72fcca58-7ff6607b7e7mr687761b3a.37.1766093086042;
        Thu, 18 Dec 2025 13:24:46 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a939ea2sm258519b3a.4.2025.12.18.13.24.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Dec 2025 13:24:45 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: urezki@gmail.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	dri-devel@lists.freedesktop.org,
	jstultz@google.com,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mm@kvack.org,
	mripard@kernel.org,
	sumit.semwal@linaro.org,
	v-songbaohua@oppo.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap() whenever possible
Date: Fri, 19 Dec 2025 05:24:36 +0800
Message-Id: <20251218212436.17142-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <aUQHss6K8b_esvpw@milan>
References: <aUQHss6K8b_esvpw@milan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Dec 18, 2025 at 9:55 PM Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Thu, Dec 18, 2025 at 02:01:56PM +0100, David Hildenbrand (Red Hat) wrote:
> > On 12/15/25 06:30, Barry Song wrote:
> > > From: Barry Song <v-songbaohua@oppo.com>
> > >
> > > In many cases, the pages passed to vmap() may include high-order
> > > pages allocated with __GFP_COMP flags. For example, the systemheap
> > > often allocates pages in descending order: order 8, then 4, then 0.
> > > Currently, vmap() iterates over every page individually—even pages
> > > inside a high-order block are handled one by one.
> > >
> > > This patch detects high-order pages and maps them as a single
> > > contiguous block whenever possible.
> > >
> > > An alternative would be to implement a new API, vmap_sg(), but that
> > > change seems to be large in scope.
> > >
> > > When vmapping a 128MB dma-buf using the systemheap, this patch
> > > makes system_heap_do_vmap() roughly 17× faster.
> > >
> > > W/ patch:
> > > [   10.404769] system_heap_do_vmap took 2494000 ns
> > > [   12.525921] system_heap_do_vmap took 2467008 ns
> > > [   14.517348] system_heap_do_vmap took 2471008 ns
> > > [   16.593406] system_heap_do_vmap took 2444000 ns
> > > [   19.501341] system_heap_do_vmap took 2489008 ns
> > >
> > > W/o patch:
> > > [    7.413756] system_heap_do_vmap took 42626000 ns
> > > [    9.425610] system_heap_do_vmap took 42500992 ns
> > > [   11.810898] system_heap_do_vmap took 42215008 ns
> > > [   14.336790] system_heap_do_vmap took 42134992 ns
> > > [   16.373890] system_heap_do_vmap took 42750000 ns
> > >
> >
> > That's quite a speedup.
> >
> > > Cc: David Hildenbrand <david@kernel.org>
> > > Cc: Uladzislau Rezki <urezki@gmail.com>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: John Stultz <jstultz@google.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
> > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > ---
> > >   * diff with rfc:
> > >   Many code refinements based on David's suggestions, thanks!
> > >   Refine comment and changelog according to Uladzislau, thanks!
> > >   rfc link:
> > >   https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/
> > >
> > >   mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
> > >   1 file changed, 39 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 41dd01e8430c..8d577767a9e5 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> > >     return err;
> > >   }
> > > +static inline int get_vmap_batch_order(struct page **pages,
> > > +           unsigned int stride, unsigned int max_steps, unsigned int idx)
> > > +{
> > > +   int nr_pages = 1;
> >
> > unsigned int, maybe

Right

> >
> > Why are you initializing nr_pages when you overwrite it below?

Right, initializing nr_pages can be dropped.

> >
> > > +
> > > +   /*
> > > +    * Currently, batching is only supported in vmap_pages_range
> > > +    * when page_shift == PAGE_SHIFT.
> >
> > I don't know the code so realizing how we go from page_shift to stride too
> > me a second. Maybe only talk about stride here?
> >
> > OTOH, is "stride" really the right terminology?
> >
> > we calculate it as
> >
> >       stride = 1U << (page_shift - PAGE_SHIFT);
> >
> > page_shift - PAGE_SHIFT should give us an "order". So is this a
> > "granularity" in nr_pages?

This is the case where vmalloc() may realize that it has
high-order pages and therefore calls
vmap_pages_range_noflush() with a page_shift larger than
PAGE_SHIFT. For vmap(), we take a pages array, so
page_shift is always PAGE_SHIFT.

> >
> > Again, I don't know this code, so sorry for the question.
> >
> To me "stride" also sounds unclear.

Thanks, David and Uladzislau. On second thought, this stride may be
redundant, and it should be possible to drop it entirely. This results
in the code below:

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 41dd01e8430c..3962bdcb43e5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -642,6 +642,20 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int max_steps, unsigned int idx)
+{
+	unsigned int nr_pages	 = compound_nr(pages[idx]);
+
+	if (nr_pages == 1 || max_steps < nr_pages)
+		return 0;
+
+	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
+		return compound_order(pages[idx]);
+	return 0;
+}
+
 /*
  * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
  * flush caches.
@@ -658,20 +672,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
 	WARN_ON(page_shift < PAGE_SHIFT);
 
+	/*
+	 * For vmap(), users may allocate pages from high orders down to
+	 * order 0, while always using PAGE_SHIFT as the page_shift.
+	 * We first check whether the initial page is a compound page. If so,
+	 * there may be an opportunity to batch multiple pages together.
+	 */
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
+			(page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
 		return vmap_small_pages_range_noflush(addr, end, prot, pages);
 
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
+	for (i = 0; i < nr; ) {
+		unsigned int shift = page_shift;
 		int err;
 
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
+		/*
+		 * For vmap() cases, page_shift is always PAGE_SHIFT, even
+		 * if the pages are physically contiguous, they may still
+		 * be mapped in a batch.
+		 */
+		if (page_shift == PAGE_SHIFT)
+			shift += get_vmap_batch_order(pages, nr - i, i);
+		err = vmap_range_noflush(addr, addr + (1UL << shift),
 					page_to_phys(pages[i]), prot,
-					page_shift);
+					shift);
 		if (err)
 			return err;
 
-		addr += 1UL << page_shift;
+		addr += 1UL  << shift;
+		i += 1U << shift;
 	}
 
 	return 0;

Does this look clearer?

Thanks
Barry

