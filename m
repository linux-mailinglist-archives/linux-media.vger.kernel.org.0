Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D14844256E8
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 17:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242493AbhJGPqM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 11:46:12 -0400
Received: from mga06.intel.com ([134.134.136.31]:45046 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242407AbhJGPqL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Oct 2021 11:46:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="287168772"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; 
   d="scan'208";a="287168772"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2021 08:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; 
   d="scan'208";a="568676724"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Oct 2021 08:44:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7595A554; Thu,  7 Oct 2021 18:44:10 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Cc:     Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        jic23@kernel.org, linux@rasmusvillemoes.dk,
        Thorsten Leemhuis <regressions@leemhuis.info>
Subject: [PATCH v4 6/7] plist: Replace kernel.h with the necessary inclusions
Date:   Thu,  7 Oct 2021 18:44:06 +0300
Message-Id: <20211007154407.29746-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007154407.29746-1-andriy.shevchenko@linux.intel.com>
References: <20211007154407.29746-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When kernel.h is used in the headers it adds a lot into dependency hell,
especially when there are circular dependencies are involved.

Replace kernel.h inclusion with the list of what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/plist.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/plist.h b/include/linux/plist.h
index 66bab1bca35c..0f352c1d3c80 100644
--- a/include/linux/plist.h
+++ b/include/linux/plist.h
@@ -73,8 +73,11 @@
 #ifndef _LINUX_PLIST_H_
 #define _LINUX_PLIST_H_
 
-#include <linux/kernel.h>
+#include <linux/container_of.h>
 #include <linux/list.h>
+#include <linux/types.h>
+
+#include <asm/bug.h>
 
 struct plist_head {
 	struct list_head node_list;
-- 
2.33.0

