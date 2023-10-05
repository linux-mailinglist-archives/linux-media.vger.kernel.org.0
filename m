Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D73F7BA54D
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 18:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241024AbjJEQPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 12:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241126AbjJEQNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 12:13:41 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3534026FD8;
        Thu,  5 Oct 2023 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Mkk02uRjKGFB4e8aG+3kpHFTSQxewntkAdfkHaxdesI=; b=e8lzia3eWGjc2IATz+le3lrKVu
        gOGiebot8NBca6IuY1/7+0Md+gtJwtDVfAHSbA0UWbreBJzbz2kT+hFv+RpLa6r5qqRoffNUXfRGU
        VA7jnn8XW5RZTzKlM7OWo4x9vALqRV3miM8Zj4Wp1GxFCK1GDxu9CMi+opvVuCBcDMsxrXr1VD/GA
        ISl5cGU9QCIbPRtkw/08b6pYXUxKIhk56rJaYx/OV4skaPAarzqcWN2klpsiXE8vITVUS0/02QcWn
        rDUIB+fTSXu4BQliJpqS6UwH588iRi1GdKAdsFAPCdE/peTEyKFsQeCaJqVQf6gemqeoarlPqa0Hy
        z8Nh6/3A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qoO2h-009V8J-IJ; Thu, 05 Oct 2023 13:05:27 +0000
Date:   Thu, 5 Oct 2023 14:05:27 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Oleksandr Natalenko <oleksandr@natalenko.name>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Regressions <regressions@lists.linux.dev>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
        Maxime Ripard <mripard@kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
Message-ID: <ZR60lylMtLO6ZGp7@casper.infradead.org>
References: <13360591.uLZWGnKmhe@natalenko.name>
 <3254850.aeNJFYEL58@natalenko.name>
 <ZR6p4MpDbQpZiUSZ@casper.infradead.org>
 <22037450.EfDdHjke4D@natalenko.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22037450.EfDdHjke4D@natalenko.name>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 05, 2023 at 02:30:55PM +0200, Oleksandr Natalenko wrote:
> No-no, sorry for possible confusion. Let me explain again:
> 
> 1. we had an issue with i915, which was introduced by 0b62af28f249, and later was fixed by 863a8eb3f270
> 2. now I've discovered another issue, which looks very similar to 1., but in a VM with Cirrus VGA, and it happens even while having 863a8eb3f270 applied
> 3. I've tried reverting 3291e09a4638, after which I cannot reproduce the issue with Cirrus VGA, but clearly there was no fix for it discussed
> 
> IOW, 863a8eb3f270 is the fix for 0b62af28f249, but not for 3291e09a4638. It looks like 3291e09a4638 requires a separate fix.

Thank you!  Sorry about the misunderstanding.  Try this:

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 6129b89bb366..44a948b80ee1 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -540,7 +540,7 @@ struct page **drm_gem_get_pages(struct drm_gem_object *obj)
 	struct page **pages;
 	struct folio *folio;
 	struct folio_batch fbatch;
-	int i, j, npages;
+	long i, j, npages;
 
 	if (WARN_ON(!obj->filp))
 		return ERR_PTR(-EINVAL);
@@ -564,11 +564,13 @@ struct page **drm_gem_get_pages(struct drm_gem_object *obj)
 
 	i = 0;
 	while (i < npages) {
+		long nr;
 		folio = shmem_read_folio_gfp(mapping, i,
 				mapping_gfp_mask(mapping));
 		if (IS_ERR(folio))
 			goto fail;
-		for (j = 0; j < folio_nr_pages(folio); j++, i++)
+		nr = min(npages - i, folio_nr_pages(folio));
+		for (j = 0; j < nr; j++, i++)
 			pages[i] = folio_file_page(folio, i);
 
 		/* Make sure shmem keeps __GFP_DMA32 allocated pages in the


