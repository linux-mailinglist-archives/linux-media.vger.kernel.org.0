Return-Path: <linux-media+bounces-49430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2252CDAAC3
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 22:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBCEB3018F5A
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 21:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93D43128A5;
	Tue, 23 Dec 2025 21:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5X8iNhl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B843093BF
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 21:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766525030; cv=none; b=k8Op4bPV+QKZmTRHsRny/MbQXbk6CaK80/stBdouxdDrZ2ZbJ5x8AgvnshntzdZF47xDgC13f7z37lgPam+Y79C9qZZqbKo2Ed004+ka0tZxOFS/xIYHA/2obVQTpxA076qHuOVcB81yCMpBcVwByT9jZgqcT4FRrukFZPZreRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766525030; c=relaxed/simple;
	bh=8A43PuKCaT9dpb/liuxml+Xte92r8a4IaYTnZQZ4acs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/O3Zn7OfojGyv7MJj5IwFtWK6Ulyei544/PFcNWA9sO0uwFRvhDhG2N/1ZF+ZLlKQd8gNAq3pJxgd9E0wQ4QDkrbfrFpcE6eV4897FgY2Lr+kdPQBTNZKnYahQ6YnYvUg/sJGWnElpB5Uwe62/Yj/2hISazcIVUrCSAawo8PEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5X8iNhl; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7ba55660769so4354562b3a.1
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 13:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766525028; x=1767129828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUOtxvoS/dJ0bosqqi9uYzrSZp+RubGpXgIfU8VaOC0=;
        b=L5X8iNhl6OwDWT5xin0gzFw8vBRzd4ou5tONDiKScR/dmtc5jeFwvCNripmAyKJAcI
         TgfxqfqEWqN0F5vd1RpUtf74VkpCoySEMZwhCRNW+usDTaFKIJZ3rDzm0a7OrDq0jGTV
         duLEkyN9uh/vouEBLaiPTg77i3oCmeuUKsihNWirKgrFkpj1WyYy3Zk41J3do+I8Vk4C
         11WgH36JdzGGOxf2wxc+7PeU11N0rRssEdfUPyJEJZXUjoK/2HBTWZ2xlTSfGSKnInCr
         beJ0LJY8g1K/hdNNLrJ5lL2/Rf60OEzOKRa2aWjKnszXwYmSddfD+VznN3GafhBhMAPC
         yFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525028; x=1767129828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aUOtxvoS/dJ0bosqqi9uYzrSZp+RubGpXgIfU8VaOC0=;
        b=AaOIT3UjLgOcQcaHnYMX7/jWdNhfiP/2U/gDsuTnTLwdFV8kXcq7sKg0Zz3yBnOUi3
         Zo07rvlo01KKjR79rgiVNEvpjWa7prVhuVnG+vbsl2hA+VQel3b8mO2Vo7fPT+wyM5xH
         pb4OfV+q+WXDy0SOFOSHXcq92OURy2OME6BGLJUuBeRKEm8hm/FprEzQgJaG4jW4MRey
         E9JhZ81jrpquxN7chjBrc/C+Wb8+aYMpv0RZqjb780KuWqiGLiLMnuVpl14MX7AwHvBs
         UYoSM6t7VzbzCHMSe9NiwrH5svzcxFO4rDx9op323ZQjy0wFH477Lph2+a3njO9l2VMg
         Hkzw==
X-Forwarded-Encrypted: i=1; AJvYcCUaWdgNP6lyUGpXnuPnc9EmUu7Emjn0I/1Yvd7z/hp24Eb2xx0W34Lv1qVBHNo6MXsw6dd4Nm9++wiJ/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuqvB/XUwCh9u8uflrl45L5P2qTCCTX+HWxiKnf/A8KrUDG+Dl
	UsSvWZ/LebcBcrEz1G6Sht7x0MngUY3OuE8SXR5G6Ly3bhclpEXExcf6
X-Gm-Gg: AY/fxX4Bh66ujd3JlgWf0GwPDcC1eH94akP3XfY6VoElSkB9BMBucVjxYA4aiwK1JB0
	qX6kIySu081G0Hocg5LEOMKxgT7qwN8Y3aGLo9Whr1K9QubIHP1I2e4wPSpx9+/JKLXJUs7VaCD
	KqNyuPfuwPRTREATXPiFu6smS5MZtdu55JeXGZJiBMptSkP4sKzfyOoP/z6RPV6smdyIwdal+ar
	RetopuyLiQ0xD3pVUqsoJZ1V/EX2Hsycg6/2kEWWtC4b+M8ZLNsoCPtUcolO/kp+GylVEWIb5fr
	sTDk1jHsGWgQ4pc4z3zIRisG/OHOVaZRwi88JgS6FuE7UNAYpaCx7GSKGGixUAv7bLAOCCaNikU
	qIfC8H6eAUWwo4HH9aFTvbFEzSedU0tpNotc3FQGFmejeEgH0gc4X+Dap3hkWsjx2PSgNS6d4RB
	tOSMVQEY3nRi/QI1XzcKTWprk=
X-Google-Smtp-Source: AGHT+IFjl4NYgeswg6t6gVHpQmyKXq6Zs/y+ycrSPrseIyz6yvUumVrAY0eo9AqIFMVJD/juZ07wKw==
X-Received: by 2002:a05:6a00:3017:b0:781:1f28:eadd with SMTP id d2e1a72fcca58-7ff646f8f08mr13731625b3a.20.1766525027718;
        Tue, 23 Dec 2025 13:23:47 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cffesm14433009b3a.49.2025.12.23.13.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:23:45 -0800 (PST)
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
Date: Wed, 24 Dec 2025 10:23:34 +1300
Message-ID: <20251223212336.36249-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aUlC6N1jmDbMDPc5@milan>
References: <aUlC6N1jmDbMDPc5@milan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> >  /*
> >   * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
> >   * flush caches.
> > @@ -658,20 +672,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >
> >       WARN_ON(page_shift < PAGE_SHIFT);
> >
> > +     /*
> > +      * For vmap(), users may allocate pages from high orders down to
> > +      * order 0, while always using PAGE_SHIFT as the page_shift.
> > +      * We first check whether the initial page is a compound page. If so,
> > +      * there may be an opportunity to batch multiple pages together.
> > +      */
> >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > -                     page_shift == PAGE_SHIFT)
> > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> >               return vmap_small_pages_range_noflush(addr, end, prot, pages);
> Hm.. If first few pages are order-0 and the rest are compound
> then we do nothing.

Now the dma-buf is allocated in descending order. If page0
is not huge, page1 will not be either. However, I agree that
we may extend support for this case.

>
> >
> > -     for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> > +     for (i = 0; i < nr; ) {
> > +             unsigned int shift = page_shift;
> >               int err;
> >
> > -             err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> > +             /*
> > +              * For vmap() cases, page_shift is always PAGE_SHIFT, even
> > +              * if the pages are physically contiguous, they may still
> > +              * be mapped in a batch.
> > +              */
> > +             if (page_shift == PAGE_SHIFT)
> > +                     shift += get_vmap_batch_order(pages, nr - i, i);
> > +             err = vmap_range_noflush(addr, addr + (1UL << shift),
> >                                       page_to_phys(pages[i]), prot,
> > -                                     page_shift);
> > +                                     shift);
> >               if (err)
> >                       return err;
> >
> > -             addr += 1UL << page_shift;
> > +             addr += 1UL  << shift;
> > +             i += 1U << shift;
> >       }
> >
> >       return 0;
> >
> > Does this look clearer?
> >
> The concern is we mix it with a huge page mapping path. If we want to batch
> v-mapping for page_shift == PAGE_SHIFT case, where "pages" array may contain
> compound pages(folio)(corner case to me), i think we should split it.

I agree this might not be common when the vmap buffer is only
used by the CPU. However, for GPUs, NPUs, and similar devices,
benefiting from larger mappings may be quite common.

Does the code below, which moves batched mapping to vmap(),
address both of your concerns?

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ecbac900c35f..782f2eac8a63 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3501,6 +3501,20 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int max_steps, unsigned int idx)
+{
+	unsigned int nr_pages;
+
+	nr_pages = compound_nr(pages[idx]);
+	if (nr_pages == 1 || max_steps < nr_pages)
+		return 0;
+
+	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
+		return compound_order(pages[idx]);
+	return 0;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3544,10 +3558,21 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
-		vunmap(area->addr);
-		return NULL;
+	for (unsigned int i = 0; i < count; ) {
+		unsigned int shift = PAGE_SHIFT;
+		int err;
+
+		shift += get_vmap_batch_order(pages, count - i, i);
+		err = vmap_range_noflush(addr, addr + (1UL << shift),
+				page_to_phys(pages[i]), pgprot_nx(prot),
+				shift);
+		if (err) {
+			vunmap(area->addr);
+			return NULL;
+		}
+
+		addr += 1UL  << shift;
+		i += 1U << shift;
 	}
 
 	if (flags & VM_MAP_PUT_PAGES) {
-- 
2.48.1

Thanks
Barry

