Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDCA720A0
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 22:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730896AbfGWUVc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 16:21:32 -0400
Received: from mga01.intel.com ([192.55.52.88]:19503 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728389AbfGWUVc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 16:21:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 13:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; 
   d="scan'208";a="321110363"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 23 Jul 2019 13:21:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5D1CE81; Tue, 23 Jul 2019 23:21:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] media: v4l2-fwnode: Switch to use fwnode_property_count_uXX()
Date:   Tue, 23 Jul 2019 23:21:28 +0300
Message-Id: <20190723202128.70883-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use fwnode_property_count_uXX() directly, that makes code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
- drop double 'use' in the commit message
- add conversion for u64 array
 drivers/media/v4l2-core/v4l2-fwnode.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 7e740d332a54..6972c5af25c6 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -163,7 +163,7 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 			pr_debug("no lane mapping given, using defaults\n");
 	}
 
-	rval = fwnode_property_read_u32_array(fwnode, "data-lanes", NULL, 0);
+	rval = fwnode_property_count_u32(fwnode, "data-lanes");
 	if (rval > 0) {
 		num_data_lanes =
 			min_t(int, V4L2_FWNODE_CSI2_MAX_DATA_LANES, rval);
@@ -191,8 +191,7 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 			pr_debug("lane %u position %u\n", i, array[i]);
 	}
 
-	rval = fwnode_property_read_u32_array(fwnode, "lane-polarities", NULL,
-					      0);
+	rval = fwnode_property_count_u32(fwnode, "lane-polarities");
 	if (rval > 0) {
 		if (rval != 1 + num_data_lanes /* clock+data */) {
 			pr_warn("invalid number of lane-polarities entries (need %u, got %u)\n",
@@ -525,8 +524,7 @@ int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
 	if (rval < 0)
 		return rval;
 
-	rval = fwnode_property_read_u64_array(fwnode, "link-frequencies",
-					      NULL, 0);
+	rval = fwnode_property_count_u64(fwnode, "link-frequencies");
 	if (rval > 0) {
 		unsigned int i;
 
-- 
2.20.1

