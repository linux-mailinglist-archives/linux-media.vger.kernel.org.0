Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2BEF755BF
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 19:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729476AbfGYR3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 13:29:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45974 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726547AbfGYR3e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 13:29:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id r1so23089715pfq.12
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=3o1J409FLrSXE1BSq5gY90sptWX1+K/9Q9vgyYosSdo=;
        b=nJi+dlQXxSeP/9x9bZOVNrmFdvdGjV6cIHV6oIhUP+XraMgrxMwyqsFt6rP8GlU+mw
         JWO/Cm+XEmPfEbQe8UxtNfb+7yIMUwpPN1LzqvcUjMMVZTR1OqZ5EF4tApVUFP+lCUBE
         FPzz2ZhpNyO0kM1nxvmDCyp1igI9G4qgzHBOIiu6qhQeIlGKyD59NvAX9hrjdEzqlqin
         4c+oZBqq08twM/n6gUEk3NzQwRvRFp+u6U2j0s0/eu2xA/nccWBK5XR3g9WtT+ez5+FH
         oWDTA5FUAYbslbqwq6YcKiV+INNBtG9ZIxoZfPy0E1Fn3J9+piwKQdXeLroULnlFx2ba
         0yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3o1J409FLrSXE1BSq5gY90sptWX1+K/9Q9vgyYosSdo=;
        b=CgYqdg6z8WEfWbHWlMFIUIAp1exwjiszD4FUrgKnWJiGFx3nWDXsaYwNdWE2oES541
         kSvr5YmcqbwMBtrjAg2hMKLcPCpDhoDsk7M+FqIOvbXZNxodAuaDa5++oBMKfO/3U7op
         /oAVQd/o4uRb16VYWWWYyCUcoBbV2Pm/ut02ifkgtYEp2ybcua29c/3r8QfasbiR/quW
         MLmOJOkYP0mzbWp90iRPnlrHTof5grx/UxAHX7UapgI3fp6E9wu0razEQjDy/yrDOzkz
         gEtKVb7l5CnKQQy44RlXEtdVlz8r6Yp1WGCgc2U/pfkHGCJ2JQwHiohIS0ZbgBh4L8xl
         w90Q==
X-Gm-Message-State: APjAAAWLUOHy8ZzXStVLO5OKYmm7GspzgeLFmXc7RI511cYuRlmJMhO/
        bIsQFydJCNtKJU9+Pg1AdMc=
X-Google-Smtp-Source: APXvYqz5qHT5EfTy67WO06OK+111h+kMujY+q9WMhF8aTysX0ACQIMuz4onU14ISlf3jUzYu5Fy4eQ==
X-Received: by 2002:a62:1807:: with SMTP id 7mr17429989pfy.149.1564075773744;
        Thu, 25 Jul 2019 10:29:33 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id n98sm50595513pjc.26.2019.07.25.10.29.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 10:29:33 -0700 (PDT)
Date:   Thu, 25 Jul 2019 10:30:18 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     "Hans Verkuil (hansverk)" <hansverk@cisco.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "vincent.abriou@st.com" <vincent.abriou@st.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: kernel Warning when using vivid with contiguous dma
Message-ID: <20190725173017.GB31961@Asurada-Nvidia.nvidia.com>
References: <1563794460.2546.3.camel@collabora.com>
 <20190722083748.2abd3fe1@coco.lan>
 <1563887680.23193.9.camel@collabora.com>
 <95693bd5-2118-db95-fbf9-d5e3fc301f0a@cisco.com>
 <1564046865.5850.1.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1564046865.5850.1.camel@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow me to trim the message a bit.

On Thu, Jul 25, 2019 at 11:27:45AM +0200, Dafna Hirschfeld wrote:

> > > [   70.219867] cma: cma_alloc(cma (____ptrval____), count 4050,
> > > align 8)
> > > [   70.237878] cma: cma_alloc: alloc failed, req-size: 4050 pages,
> > > ret: -12

It shows that cma_alloc() failed so the dma_alloc_contigudous()
does fallback alloc_pages_node(). It should be same as previous
__dma_direct_alloc_pages(), but would you like to confirm after
partially reverting the change at kernel/dma/direct.c file? It
is not necessary for debugging to entirely revert the commit as
build break might happen since the helper functions are called
by other files too. Something like this:

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index b67f0aa08aa3..6688e1cee7d1 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -96,6 +96,8 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
 struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
+	unsigned int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	int page_order = get_order(size);
 	struct page *page = NULL;
 	u64 phys_mask;

@@ -107,9 +109,20 @@ struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 	gfp |= __dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
 			&phys_mask);
 again:
-	page = dma_alloc_contiguous(dev, size, gfp);
+	/* CMA can be used only in the context which permits sleeping */
+	if (gfpflags_allow_blocking(gfp)) {
+		page = dma_alloc_from_contiguous(dev, count, page_order,
+						 gfp & __GFP_NOWARN);
+		if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
+			dma_release_from_contiguous(dev, page, count);
+			page = NULL;
+		}
+	}
+	if (!page)
+		page = alloc_pages_node(dev_to_node(dev), gfp, page_order);
+
 	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
-		dma_free_contiguous(dev, page, size);
+		__free_pages(page, page_order);
 		page = NULL;

 		if (IS_ENABLED(CONFIG_ZONE_DMA32) &&
@@ -141,7 +154,7 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 	if (PageHighMem(page)) {
 		/*
 		 * Depending on the cma= arguments and per-arch setup
-		 * dma_alloc_contiguous could return highmem pages.
+		 * dma_alloc_from_contiguous could return highmem pages.
 		 * Without remapping there is no way to return them here,
 		 * so log an error and fail.
 		 */
@@ -170,7 +183,10 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,

 void __dma_direct_free_pages(struct device *dev, size_t size, struct page *page)
 {
-	dma_free_contiguous(dev, page, size);
+	unsigned int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+
+	if (!dma_release_from_contiguous(dev, page, count))
+		__free_pages(page, get_order(size));
 }

 void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,

> > > [   70.244599] cma: number of available pages: 72@184+3886@4306=>
> > > 3958 free of 8192 total pages
> > > [   70.253066] cma: cma_alloc(): returned (____ptrval____)
> > > [   70.264893] cma: cma_release(page (____ptrval____))
> > > [   70.272871] cma: cma_release(page (____ptrval____))
> > > [   70.277800] BUG: Bad page state in process v4l2-ctl  pfn:b5a00
> > > [   70.283652] page:ffff7e0001d68000 refcount:13 mapcount:0
> > > mapping:0000000000000000 index:0x0 compound_mapcount: 0
> > > [   70.293874] flags: 0xffff00000010000(head)
> > > [   70.297999] raw: 0ffff00000010000 dead000000000100
> > > dead000000000122 0000000000000000
> > > [   70.305772] raw: 0000000000000000 0000000000000000
> > > 0000000dffffffff 0000000000000000
> > > [   70.313526] page dumped because: nonzero _refcount
> > > [   70.318327] Modules linked in:
> > > [   70.321399] CPU: 2 PID: 482 Comm: v4l2-ctl Not tainted 5.3.0-
> > > rc1+ #159
> > > [   70.327927] Hardware name: Boundary Devices i.MX8MQ Nitrogen8M
> > > (DT)
> > > [   70.334196] Call trace:
> > > [   70.336654]  dump_backtrace+0x0/0x148
> > > [   70.340319]  show_stack+0x14/0x20
> > > [   70.343640]  dump_stack+0x9c/0xc4
> > > [   70.346959]  bad_page+0xe4/0x148
> > > [   70.350188]  free_pages_check_bad+0x70/0xa8
> > > [   70.354375]  __free_pages_ok+0x294/0x2b0
> > > [   70.358301]  __free_pages+0x38/0x50
> > > [   70.361795]  dma_free_contiguous+0x90/0x98
> > > [   70.365892]  __dma_direct_free_pages+0x18/0x20

Here shows cma_release() has failed as those pages aren't from
CMA, so it uses the fallback __free_pages(). I just scrutinized
my commit once again and found that the free routine has missed
a PAGE_ALIGN() operation for the size parameter. Though it does
not likely cause the problem, yet would you please try this?

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index bfc0c17f2a3d..a2d872a82be9 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -266,7 +266,8 @@ struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
  */
 void dma_free_contiguous(struct device *dev, struct page *page, size_t size)
 {
-       if (!cma_release(dev_get_cma_area(dev), page, size >> PAGE_SHIFT))
+       if (!cma_release(dev_get_cma_area(dev), page,
+                        PAGE_ALIGN(size) >> PAGE_SHIFT))
                __free_pages(page, get_order(size));
 }
