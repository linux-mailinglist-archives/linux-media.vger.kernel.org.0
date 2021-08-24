Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A043F5F3B
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 15:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237266AbhHXNep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 09:34:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:57663 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233407AbhHXNem (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 09:34:42 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="204508204"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204508204"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 06:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="597584075"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2021 06:33:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 68FC936A; Tue, 24 Aug 2021 16:33:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [RFT, PATCH v1 3/3] media: ipu3-cio2: Replace custom implementation of rotate()
Date:   Tue, 24 Aug 2021 16:33:51 +0300
Message-Id: <20210824133351.88179-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824133351.88179-1-andriy.shevchenko@linux.intel.com>
References: <20210824133351.88179-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

rotate() is more efficient than custom implementation.
Replace the latter by the former.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

This should be a copy'n'paste of the algorithm with a slight difference that
it should copy by 4 or 8 bytes at a time. Nonetheless it has to be tested.
Hence, RFT. (Obviously no hurry with this, we are close to release)

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 59 ++-----------------
 1 file changed, 5 insertions(+), 54 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 8bcba168cc57..0fd6040d2f2d 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -21,6 +21,7 @@
 #include <linux/pfn.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/sort.h>
 #include <linux/vmalloc.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -1877,56 +1878,6 @@ static int __maybe_unused cio2_runtime_resume(struct device *dev)
 	return 0;
 }
 
-/*
- * Helper function to advance all the elements of a circular buffer by "start"
- * positions
- */
-static void arrange(void *ptr, size_t elem_size, size_t elems, size_t start)
-{
-	struct {
-		size_t begin, end;
-	} arr[2] = {
-		{ 0, start - 1 },
-		{ start, elems - 1 },
-	};
-
-#define CHUNK_SIZE(a) ((a)->end - (a)->begin + 1)
-
-	/* Loop as long as we have out-of-place entries */
-	while (CHUNK_SIZE(&arr[0]) && CHUNK_SIZE(&arr[1])) {
-		size_t size0, i;
-
-		/*
-		 * Find the number of entries that can be arranged on this
-		 * iteration.
-		 */
-		size0 = min(CHUNK_SIZE(&arr[0]), CHUNK_SIZE(&arr[1]));
-
-		/* Swap the entries in two parts of the array. */
-		for (i = 0; i < size0; i++) {
-			u8 *d = ptr + elem_size * (arr[1].begin + i);
-			u8 *s = ptr + elem_size * (arr[0].begin + i);
-			size_t j;
-
-			for (j = 0; j < elem_size; j++)
-				swap(d[j], s[j]);
-		}
-
-		if (CHUNK_SIZE(&arr[0]) > CHUNK_SIZE(&arr[1])) {
-			/* The end of the first array remains unarranged. */
-			arr[0].begin += size0;
-		} else {
-			/*
-			 * The first array is fully arranged so we proceed
-			 * handling the next one.
-			 */
-			arr[0].begin = arr[1].begin;
-			arr[0].end = arr[1].begin + size0 - 1;
-			arr[1].begin += size0;
-		}
-	}
-}
-
 static void cio2_fbpt_rearrange(struct cio2_device *cio2, struct cio2_queue *q)
 {
 	unsigned int i, j;
@@ -1940,10 +1891,10 @@ static void cio2_fbpt_rearrange(struct cio2_device *cio2, struct cio2_queue *q)
 		return;
 
 	if (j) {
-		arrange(q->fbpt, sizeof(struct cio2_fbpt_entry) * CIO2_MAX_LOPS,
-			CIO2_MAX_BUFFERS, j);
-		arrange(q->bufs, sizeof(struct cio2_buffer *),
-			CIO2_MAX_BUFFERS, j);
+		rotate(q->fbpt, sizeof(struct cio2_fbpt_entry) * CIO2_MAX_LOPS,
+		       CIO2_MAX_BUFFERS, j, NULL);
+		rotate(q->bufs, sizeof(struct cio2_buffer *),
+		       CIO2_MAX_BUFFERS, j, NULL);
 	}
 
 	/*
-- 
2.32.0

