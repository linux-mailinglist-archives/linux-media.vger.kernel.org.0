Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE8D2CAA35
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 18:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392044AbgLARwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 12:52:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391855AbgLARwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 12:52:38 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB61C0613D4;
        Tue,  1 Dec 2020 09:51:52 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id iq13so1678162pjb.3;
        Tue, 01 Dec 2020 09:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AB/6a+0q1qLMuNjG8yRoZzr5m++qXs4+JpGB+h7ZvYE=;
        b=GsNkioNRpEqEv4PmUEZ47G2Nsi0b1FGDOkL5c3BzhVvL5717koBsqxp5YyNaaes87O
         ya6JejYb9FhEGAapd4adPgHU8ehu9r9XjKCJ0dd3iwRD9zsjS2RxEBLKMazdZRU2EEyZ
         SoLfCeVpK1bwA5DMImwlFcR6UcGLh0mh2db7ZSnakc4jVBSYXBhgYMSinVpiQKiQ4KAt
         OfsxLvd4Ugpn98m4QVvoejFLMyBP3CjdWqzFJfW6wvuxFxCdFmqAq+hhGxqw9CEX/1qW
         XsI9jokfMcw3KxL0wtnRSJwrcOOV0mJN4u7KK4Ls1p0PEQ1bJ3eTFevIkdPGX0Ue1sYX
         QhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=AB/6a+0q1qLMuNjG8yRoZzr5m++qXs4+JpGB+h7ZvYE=;
        b=ntkJtbNY8oY+RB5x9BADto8DYTjBmxNgqQmqLtbLUsZzcbH63/YhgP/Uo0lHEBofR6
         lNBCdisHwuH9cxzxHSF6RPgkWQ+DX3j8zVcGt4JEkJtgWPmKPKwnwW9sFug6uuhDr/6G
         4uus72Qa172PJhHUGnvFP06NiUITB9aKaWi6Kggp/IPDFuV1EbchqHO4cQI9/zMzI1FO
         KStTBy/KJ81zsmLo8llc8Qlwii75TkYOjupBLIByDPq1F2WPUHVuh+F7E1inlM+HFtiQ
         cwhZZhs6mwSvQupik53NWqT3bnyVqhuzss67BMNf3D/9amgJMP44KQSKvcmOh1J6PGDG
         q0lQ==
X-Gm-Message-State: AOAM530ZBm9MIjMFLYn9i5ghrVBzA8roM4NQfOL5BTtQkvNy8d35/2k6
        Fp6/dj2OO5v+POd+udJ8LVo=
X-Google-Smtp-Source: ABdhPJwfTISVlwcaeK8OrIVwQd2JJl5304YRCgPrnXjrKTiC7PJ93jeid5YnVZR3iY0PKrrG1rz9Sg==
X-Received: by 2002:a17:902:8605:b029:da:14f6:a4ad with SMTP id f5-20020a1709028605b02900da14f6a4admr3760458plo.79.1606845112164;
        Tue, 01 Dec 2020 09:51:52 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id q23sm390082pfg.192.2020.12.01.09.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 09:51:50 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        hyesoo.yu@samsung.com, willy@infradead.org, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        sumit.semwal@linaro.org, john.stultz@linaro.org,
        Brian.Starkey@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
        Minchan Kim <minchan@kernel.org>
Subject: [PATCH v2 1/4] mm: introduce alloc_contig_mode
Date:   Tue,  1 Dec 2020 09:51:41 -0800
Message-Id: <20201201175144.3996569-2-minchan@kernel.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
In-Reply-To: <20201201175144.3996569-1-minchan@kernel.org>
References: <20201201175144.3996569-1-minchan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are demands to control how hard alloc_contig_range try to
increase allocation success ratio. This patch abstract it by
adding new enum mode parameter in alloc_contig_range.
New API in next patch will add up new mode there to control it.

This patch shouldn't change any existing behavior.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 drivers/virtio/virtio_mem.c | 2 +-
 include/linux/gfp.h         | 8 +++++++-
 mm/cma.c                    | 3 ++-
 mm/page_alloc.c             | 6 ++++--
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 9fc9ec4a25f5..5585fc67b65e 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1148,7 +1148,7 @@ static int virtio_mem_fake_offline(unsigned long pfn, unsigned long nr_pages)
 	 */
 	for (retry_count = 0; retry_count < 5; retry_count++) {
 		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
-					GFP_KERNEL);
+					GFP_KERNEL, ALLOC_CONTIG_NORMAL);
 		if (rc == -ENOMEM)
 			/* whoops, out of memory */
 			return rc;
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index c603237e006c..ad5872699692 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -624,9 +624,15 @@ static inline bool pm_suspended_storage(void)
 #endif /* CONFIG_PM_SLEEP */
 
 #ifdef CONFIG_CONTIG_ALLOC
+enum alloc_contig_mode {
+	/* try several ways to increase success ratio of memory allocation */
+	ALLOC_CONTIG_NORMAL,
+};
+
 /* The below functions must be run on a range from a single zone. */
 extern int alloc_contig_range(unsigned long start, unsigned long end,
-			      unsigned migratetype, gfp_t gfp_mask);
+			      unsigned migratetype, gfp_t gfp_mask,
+			      enum alloc_contig_mode mode);
 extern struct page *alloc_contig_pages(unsigned long nr_pages, gfp_t gfp_mask,
 				       int nid, nodemask_t *nodemask);
 #endif
diff --git a/mm/cma.c b/mm/cma.c
index 3692a34e2353..8010c1ba04b0 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -454,7 +454,8 @@ struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
 
 		pfn = cma->base_pfn + (bitmap_no << cma->order_per_bit);
 		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA,
-				     GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0));
+				     GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0),
+				     ALLOC_CONTIG_NORMAL);
 
 		if (ret == 0) {
 			page = pfn_to_page(pfn);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index f91df593bf71..adfbfd95fbc3 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8533,6 +8533,7 @@ static void __alloc_contig_clear_range(unsigned long start_pfn,
  *			be either of the two.
  * @gfp_mask:	GFP mask to use during compaction. __GFP_ZERO clears allocated
  *		pages.
+ * @mode:	how hard it will try to increase allocation success ratio
  *
  * The PFN range does not have to be pageblock or MAX_ORDER_NR_PAGES
  * aligned.  The PFN range must belong to a single zone.
@@ -8546,7 +8547,8 @@ static void __alloc_contig_clear_range(unsigned long start_pfn,
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range(unsigned long start, unsigned long end,
-		       unsigned migratetype, gfp_t gfp_mask)
+		       unsigned migratetype, gfp_t gfp_mask,
+		       enum alloc_contig_mode mode)
 {
 	unsigned long outer_start, outer_end;
 	unsigned int order;
@@ -8689,7 +8691,7 @@ static int __alloc_contig_pages(unsigned long start_pfn,
 	unsigned long end_pfn = start_pfn + nr_pages;
 
 	return alloc_contig_range(start_pfn, end_pfn, MIGRATE_MOVABLE,
-				  gfp_mask);
+				  gfp_mask, ALLOC_CONTIG_NORMAL);
 }
 
 static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
-- 
2.29.2.454.gaff20da3a2-goog

