Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEE53F5F3E
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 15:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237607AbhHXNe5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 09:34:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:13438 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237517AbhHXNey (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 09:34:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="204444830"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204444830"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 06:34:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="683975684"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 06:33:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 563601AA; Tue, 24 Aug 2021 16:33:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 1/3] lib/sort: Split out choose_swap_func() local helper
Date:   Tue, 24 Aug 2021 16:33:49 +0300
Message-Id: <20210824133351.88179-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In some new code we may need the same functionality as provided by
newly introduced choose_swap_func() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/sort.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/lib/sort.c b/lib/sort.c
index aa18153864d2..d9b2f5b73620 100644
--- a/lib/sort.c
+++ b/lib/sort.c
@@ -151,6 +151,18 @@ static int do_cmp(const void *a, const void *b, cmp_r_func_t cmp, const void *pr
 	return cmp(a, b, priv);
 }
 
+static swap_func_t choose_swap_func(swap_func_t swap_func, void *base, size_t size)
+{
+	if (swap_func)
+		return swap_func;
+
+	if (is_aligned(base, size, 8))
+		return SWAP_WORDS_64;
+	if (is_aligned(base, size, 4))
+		return SWAP_WORDS_32;
+	return SWAP_BYTES;
+}
+
 /**
  * parent - given the offset of the child, find the offset of the parent.
  * @i: the offset of the heap element whose parent is sought.  Non-zero.
@@ -208,14 +220,7 @@ void sort_r(void *base, size_t num, size_t size,
 	if (!a)		/* num < 2 || size == 0 */
 		return;
 
-	if (!swap_func) {
-		if (is_aligned(base, size, 8))
-			swap_func = SWAP_WORDS_64;
-		else if (is_aligned(base, size, 4))
-			swap_func = SWAP_WORDS_32;
-		else
-			swap_func = SWAP_BYTES;
-	}
+	swap_func = choose_swap_func(swap_func, base, size);
 
 	/*
 	 * Loop invariants:
-- 
2.32.0

