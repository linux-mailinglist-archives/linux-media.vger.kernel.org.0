Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 849E8E1040
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 04:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389430AbfJWCzT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 22:55:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:12628 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389423AbfJWCzT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 22:55:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 19:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,219,1569308400"; 
   d="scan'208";a="191692921"
Received: from ipu5-build.bj.intel.com ([10.238.232.193])
  by orsmga008.jf.intel.com with ESMTP; 22 Oct 2019 19:55:17 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org
Cc:     mchehab+samsung@kernel.org, sakari.ailus@linux.intel.com,
        tfiga@chromium.org, bingbu.cao@linux.intel.com
Subject: [PATCH] media: staging/intel-ipu3: remove the unnecessary compiler flags
Date:   Wed, 23 Oct 2019 11:01:23 +0800
Message-Id: <1571799683-19361-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Currently, we can build ipu3 driver code without any
warnings with W=1, so the extra compiler flags in Makefile
and the item in TODO file can be removed.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/staging/media/ipu3/Makefile | 6 ------
 drivers/staging/media/ipu3/TODO     | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/media/ipu3/Makefile b/drivers/staging/media/ipu3/Makefile
index cc288ae6d5f2..9def80ef28f3 100644
--- a/drivers/staging/media/ipu3/Makefile
+++ b/drivers/staging/media/ipu3/Makefile
@@ -10,9 +10,3 @@ ipu3-imgu-objs += \
 		ipu3-css.o ipu3-v4l2.o ipu3.o
 
 obj-$(CONFIG_VIDEO_IPU3_IMGU) += ipu3-imgu.o
-
-# HACK! While this driver is in bad shape, don't enable several warnings
-#       that would be otherwise enabled with W=1
-ccflags-y += $(call cc-disable-warning, packed-not-aligned)
-ccflags-y += $(call cc-disable-warning, type-limits)
-ccflags-y += $(call cc-disable-warning, unused-const-variable)
diff --git a/drivers/staging/media/ipu3/TODO b/drivers/staging/media/ipu3/TODO
index 5e55baeaea1a..8b95e74e43a0 100644
--- a/drivers/staging/media/ipu3/TODO
+++ b/drivers/staging/media/ipu3/TODO
@@ -27,5 +27,3 @@ staging directory.
 - Document different operation modes, and which buffer queues are relevant
   in each mode. To process an image, which queues require a buffer an in
   which ones is it optional?
-
-- Make sure it builds fine with no warnings with W=1
-- 
2.7.4

