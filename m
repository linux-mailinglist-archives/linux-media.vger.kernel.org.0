Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBE22FF292
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 18:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389361AbhAUR4l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 12:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389229AbhAURzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 12:55:54 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F682C0613D6;
        Thu, 21 Jan 2021 09:55:13 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d4so1711542plh.5;
        Thu, 21 Jan 2021 09:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gPMjM19aJ4pm3ETJElwKqqAg8qqzpXB97r3PbN2RvL8=;
        b=qDC+o38edBIaLnG8PWToxRhj0mPMeIfGyClNNZGIdiSSXZ2tJZWeGMSjqb6Huno5Je
         +s9NpaIPVTqyciyZTwKM5kcwYq2dDpuaC0zoITN6bASo1/oCbfUYZKU1WDHQFpR4oTNg
         Q+2MMzLxdK1Ode8CPyEpokjv+oVgNPg+KGhhdt3i2NU2HG/DmJKDhjdILm/UOXIjpOai
         er6lOvs1xiyuvzkQUHTmK/7TJ35rFG3Qq4hWmU2S0uFXV8TnSr3Uu+mgP7eff89fbX4D
         Pa584ZSykXNIjOtQdY8kLxVwg4OVsCPqbdHgBWm//V/4HNQhBVmyo2f3msnkwFwkGnCO
         2CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=gPMjM19aJ4pm3ETJElwKqqAg8qqzpXB97r3PbN2RvL8=;
        b=tTIA/jVHiaWhFtKmkLmeBusMNi3TEo0mf+FoqBugcWub+nwYbCFANmEDPMT3qNc1JM
         /Qo3rRGVHHbPBk3qZh7Mksh1xAym+WJmDtO0vrP/2txQi8opK2bx7bdOp8jwcMEN88gH
         W2q8nldW+SwdzH+9UNemNxtIsafTT7LCdu2Vn0NHAuzj3E5e7bs7x+48qj10bDtb3C2K
         z7O7jwQmotu8ejQqBdvwPyOyk+YOef4dOwYtheIP7T4dYS1NwmxKXehA4beWkXA4sKzN
         iJmxwDBCXVISSlf/KvEIbjfl3en169+/SBL/q2SJ+5gWi0wrnM3JNDXQFoDNnYoA4cu3
         Z6LA==
X-Gm-Message-State: AOAM532CDtC9IBzIYiTavQ6sOq2dlND4oq9SHORays1d9ET1GZLId40G
        mfvqFcfozM4rHDcRu/q06/Y=
X-Google-Smtp-Source: ABdhPJwua3dS85PxEqSvzV1XHGSp3rtEG3Evxsrqo12dFSbOhRShx1GThlZKPz/+p0B1yNRZEi2OWw==
X-Received: by 2002:a17:902:59c7:b029:de:25e7:2426 with SMTP id d7-20020a17090259c7b02900de25e72426mr424509plj.21.1611251713128;
        Thu, 21 Jan 2021 09:55:13 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:74d0:bb24:e25e:dc4d])
        by smtp.gmail.com with ESMTPSA id t2sm6897317pju.19.2021.01.21.09.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 09:55:12 -0800 (PST)
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
Subject: [PATCH v4 2/4] mm: failfast mode with __GFP_NORETRY in alloc_contig_range
Date:   Thu, 21 Jan 2021 09:55:00 -0800
Message-Id: <20210121175502.274391-3-minchan@kernel.org>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
In-Reply-To: <20210121175502.274391-1-minchan@kernel.org>
References: <20210121175502.274391-1-minchan@kernel.org>
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
in different range where would have easy migratable pages
without stalling.

This patch introduce __GFP_NORETRY as compaction gfp_mask in
alloc_contig_range so it will fail fast without blocking
when it encounters pages needed waiting.

Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 mm/page_alloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b031a5ae0bd5..1cdc3ee0b22e 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8491,12 +8491,16 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
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
@@ -8513,7 +8517,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 				break;
 			}
 			tries = 0;
-		} else if (++tries == 5) {
+		} else if (++tries == max_tries) {
 			ret = ret < 0 ? ret : -EBUSY;
 			break;
 		}
@@ -8564,7 +8568,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
 		.nr_migratepages = 0,
 		.order = -1,
 		.zone = page_zone(pfn_to_page(start)),
-		.mode = MIGRATE_SYNC,
+		.mode = gfp_mask & __GFP_NORETRY ? MIGRATE_ASYNC : MIGRATE_SYNC,
 		.ignore_skip_hint = true,
 		.no_set_skip_hint = true,
 		.gfp_mask = current_gfp_context(gfp_mask),
-- 
2.30.0.296.g2bfb1c46d8-goog

