Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63C32F4118
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 02:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbhAMBWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 20:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbhAMBWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 20:22:38 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3F3C061794;
        Tue, 12 Jan 2021 17:21:58 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id v1so125383pjr.2;
        Tue, 12 Jan 2021 17:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PwrTvDCpQxTz/DIQgW8kuhPAh38es7QArT97GZe3VtU=;
        b=uaiyVxcKcdDalFZ8wJ+put1IH215gZVoe2plqMdRP+2t2x/Fxizlr/N/MMPOBy+I0b
         HitSdRYQF8rvO3yB3xWl5iWNM8zM/Io4Fhhz8Qobmt1P7n4QfUQjBwVrWDgj+r666bBv
         DkJ32IPzh0QlpdPB3YkZ6eMbzbV3ARDqbP38WnfOSzZldntVOmmHoaihJCYYTegPp9am
         F2LQIXwlIkdYp4QYNBsRxXKBElNr5yvhYGzrhq31yP3OOV63VYiKQtGWWpjzacC868HZ
         DL3z2TQ8pFoXWFzW3HfQcUecvT+tbK3HLkMB4un/Ef86zwrP5ZZOdFIQFNO6Ig5X8KKd
         aoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=PwrTvDCpQxTz/DIQgW8kuhPAh38es7QArT97GZe3VtU=;
        b=oh+1nF2SBifjshIQs5mSi17mKaK08TsUbZax/gSRyRu8LIJQZBkNtxlnt32TiqHdxh
         QgrRBbQ9+TSBSNo/CIxxoQuM9titTL6ltqXnJ4InsskYjeSnNlRcybopbooplTKTr3mA
         GW4b8ZWpPLYWT3jh6NkWva2s7cWkIPbY2KQS4rtquxQwi8nOtr7Xny2E07pPS9ezMn+j
         qzd29Et72l938mLwCocNqaZy3lVyhMOuDsko4TAG6JPiAFG6uxQzTeKGzg5l9/8H2xj+
         09u5I27YaQhC6iipvyCpBYpIS8p6YpsL0cUd6dRPfAaXr6/IQQDtJk6TWKG5nxtNwNur
         Gn8Q==
X-Gm-Message-State: AOAM533EwWadb2PDg9aFidDnCV4oVer0M5bexgmrECFkLjcmID9YN0Zt
        yHi/Tix1bjH/0FBw0uB260E=
X-Google-Smtp-Source: ABdhPJzmO+8D0rnhhJPNIKgMyyHl4myY8RINkNNrnEa0wEBRddADD3DsZUjfzpKGbwWsqPYYVIySqA==
X-Received: by 2002:a17:90a:c82:: with SMTP id v2mr475726pja.171.1610500917994;
        Tue, 12 Jan 2021 17:21:57 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id b2sm355197pff.79.2021.01.12.17.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 17:21:57 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        hyesoo.yu@samsung.com, david@redhat.com, mhocko@suse.com,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org, Minchan Kim <minchan@kernel.org>
Subject: [PATCH v3 2/4] mm: failfast mode with __GFP_NORETRY in alloc_contig_range
Date:   Tue, 12 Jan 2021 17:21:41 -0800
Message-Id: <20210113012143.1201105-3-minchan@kernel.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210113012143.1201105-1-minchan@kernel.org>
References: <20210113012143.1201105-1-minchan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Contiguous memory allocation can be stalled due to waiting
on page writeback and/or page lock which causes unpredictable
delay. It's a unavoidable cost for the requestor to get *big*
contiguous memory but it's expensive for *small* contiguous
memory(e.g., order-4) because caller could retry the request
in diffrent range where would have easy migratable pages
without stalling.

This patch introduce __GFP_NORETRY as compaction gfp_mask in
alloc_contig_range so it will fail fast without blocking
when it encounters pages needed waitting.

Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 mm/page_alloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 5b3923db9158..ff41ceb4db51 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8489,12 +8489,16 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 	unsigned int nr_reclaimed;
 	unsigned long pfn = start;
 	unsigned int tries = 0;
+	unsigned int max_tries = 5;
 	int ret = 0;
 	struct migration_target_control mtc = {
 		.nid = zone_to_nid(cc->zone),
 		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
 	};
 
+	if (cc->alloc_contig && cc->mode == MIGRATE_ASYNC)
+		max_tries = 1;
+
 	migrate_prep();
 
 	while (pfn < end || !list_empty(&cc->migratepages)) {
@@ -8511,7 +8515,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 				break;
 			}
 			tries = 0;
-		} else if (++tries == 5) {
+		} else if (++tries == max_tries) {
 			ret = ret < 0 ? ret : -EBUSY;
 			break;
 		}
@@ -8562,7 +8566,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 		.nr_migratepages = 0,
 		.order = -1,
 		.zone = page_zone(pfn_to_page(start)),
-		.mode = MIGRATE_SYNC,
+		.mode = gfp_mask & __GFP_NORETRY ? MIGRATE_ASYNC : MIGRATE_SYNC,
 		.ignore_skip_hint = true,
 		.no_set_skip_hint = true,
 		.gfp_mask = current_gfp_context(gfp_mask),
-- 
2.30.0.284.gd98b1dd5eaa7-goog

