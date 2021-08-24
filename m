Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDFA3F5F3D
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 15:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237591AbhHXNe4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 09:34:56 -0400
Received: from mga18.intel.com ([134.134.136.126]:13438 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231237AbhHXNew (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 09:34:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="204444829"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204444829"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 06:34:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="685368422"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2021 06:33:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5F4E4167; Tue, 24 Aug 2021 16:33:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 2/3] lib/sort: Introduce rotate() to circular shift an array of elements
Date:   Tue, 24 Aug 2021 16:33:50 +0300
Message-Id: <20210824133351.88179-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824133351.88179-1-andriy.shevchenko@linux.intel.com>
References: <20210824133351.88179-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In some cases we want to circular shift an array of elements.
Introduce rotate() helper for that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/sort.h |  3 +++
 lib/sort.c           | 61 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/include/linux/sort.h b/include/linux/sort.h
index b5898725fe9d..c881acb12ffc 100644
--- a/include/linux/sort.h
+++ b/include/linux/sort.h
@@ -13,4 +13,7 @@ void sort(void *base, size_t num, size_t size,
 	  cmp_func_t cmp_func,
 	  swap_func_t swap_func);
 
+void rotate(void *base, size_t num, size_t size, size_t by,
+	    swap_func_t swap_func);
+
 #endif
diff --git a/lib/sort.c b/lib/sort.c
index d9b2f5b73620..b9243f8db34b 100644
--- a/lib/sort.c
+++ b/lib/sort.c
@@ -14,6 +14,7 @@
 
 #include <linux/types.h>
 #include <linux/export.h>
+#include <linux/minmax.h>
 #include <linux/sort.h>
 
 /**
@@ -275,3 +276,63 @@ void sort(void *base, size_t num, size_t size,
 	return sort_r(base, num, size, _CMP_WRAPPER, swap_func, cmp_func);
 }
 EXPORT_SYMBOL(sort);
+
+/**
+ * rotate - rotate an array of elements by a number of elements
+ * @base: pointer to data to sort
+ * @num: number of elements
+ * @size: size of each element
+ * @by: number of elements to rotate by
+ * @swap_func: pointer to swap function or NULL
+ *
+ * Helper function to advance all the elements of a circular buffer by
+ * @by positions.
+ */
+void rotate(void *base, size_t num, size_t size, size_t by,
+	    swap_func_t swap_func)
+{
+	struct {
+		size_t begin, end;
+	} arr[2] = {
+		{ .begin = 0, .end = by - 1 },
+		{ .begin = by, .end = num - 1 },
+	};
+
+	swap_func = choose_swap_func(swap_func, base, size);
+
+#define CHUNK_SIZE(a) ((a)->end - (a)->begin + 1)
+
+	/* Loop as long as we have out-of-place entries */
+	while (CHUNK_SIZE(&arr[0]) && CHUNK_SIZE(&arr[1])) {
+		size_t size0, i;
+
+		/*
+		 * Find the number of entries that can be arranged on this
+		 * iteration.
+		 */
+		size0 = min(CHUNK_SIZE(&arr[0]), CHUNK_SIZE(&arr[1]));
+
+		/* Swap the entries in two parts of the array */
+		for (i = 0; i < size0; i++) {
+			void *a = base + size * (arr[0].begin + i);
+			void *b = base + size * (arr[1].begin + i);
+
+			do_swap(a, b, size, swap_func);
+		}
+
+		if (CHUNK_SIZE(&arr[0]) > CHUNK_SIZE(&arr[1])) {
+			/* The end of the first array remains unarranged */
+			arr[0].begin += size0;
+		} else {
+			/*
+			 * The first array is fully arranged so we proceed
+			 * handling the next one.
+			 */
+			arr[0].begin = arr[1].begin;
+			arr[0].end = arr[1].begin + size0 - 1;
+			arr[1].begin += size0;
+		}
+	}
+#undef CHUNK_SIZE
+}
+EXPORT_SYMBOL(rotate);
-- 
2.32.0

