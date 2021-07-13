Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280A53C7331
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 17:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237057AbhGMPb4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 11:31:56 -0400
Received: from mga01.intel.com ([192.55.52.88]:16981 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237039AbhGMPb4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 11:31:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="231984582"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="231984582"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 08:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="430084893"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 13 Jul 2021 08:25:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E70DEFF; Tue, 13 Jul 2021 18:25:27 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Baokun Li <libaokun1@huawei.com>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH v2 1/5] media: staging: atomisp: use list_splice_init in atomisp_compat_css20.c
Date:   Tue, 13 Jul 2021 18:25:19 +0300
Message-Id: <20210713152523.19902-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Baokun Li <libaokun1@huawei.com>

Using list_splice_init() instead of entire while-loops
in atomisp_compat_css20.c.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: added this patch to the series
 .../media/atomisp/pci/atomisp_compat_css20.c  | 38 +++----------------
 1 file changed, 5 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index f60198bb8a1a..99a632f33d2d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2102,9 +2102,6 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 		      enum ia_css_pipe_id pipe_id, bool in_reset)
 {
 	struct atomisp_device *isp = asd->isp;
-	struct atomisp_s3a_buf *s3a_buf;
-	struct atomisp_dis_buf *dis_buf;
-	struct atomisp_metadata_buf *md_buf;
 	unsigned long irqflags;
 	unsigned int i;
 
@@ -2144,42 +2141,17 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 	}
 
 	/* move stats buffers to free queue list */
-	while (!list_empty(&asd->s3a_stats_in_css)) {
-		s3a_buf = list_entry(asd->s3a_stats_in_css.next,
-				     struct atomisp_s3a_buf, list);
-		list_del(&s3a_buf->list);
-		list_add_tail(&s3a_buf->list, &asd->s3a_stats);
-	}
-	while (!list_empty(&asd->s3a_stats_ready)) {
-		s3a_buf = list_entry(asd->s3a_stats_ready.next,
-				     struct atomisp_s3a_buf, list);
-		list_del(&s3a_buf->list);
-		list_add_tail(&s3a_buf->list, &asd->s3a_stats);
-	}
+	list_splice_init(&asd->s3a_stats_in_css, &asd->s3a_stats);
+	list_splice_init(&asd->s3a_stats_ready, &asd->s3a_stats);
 
 	spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
-	while (!list_empty(&asd->dis_stats_in_css)) {
-		dis_buf = list_entry(asd->dis_stats_in_css.next,
-				     struct atomisp_dis_buf, list);
-		list_del(&dis_buf->list);
-		list_add_tail(&dis_buf->list, &asd->dis_stats);
-	}
+	list_splice_init(&asd->dis_stats_in_css, &asd->dis_stats);
 	asd->params.dis_proj_data_valid = false;
 	spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
 
 	for (i = 0; i < ATOMISP_METADATA_TYPE_NUM; i++) {
-		while (!list_empty(&asd->metadata_in_css[i])) {
-			md_buf = list_entry(asd->metadata_in_css[i].next,
-					    struct atomisp_metadata_buf, list);
-			list_del(&md_buf->list);
-			list_add_tail(&md_buf->list, &asd->metadata[i]);
-		}
-		while (!list_empty(&asd->metadata_ready[i])) {
-			md_buf = list_entry(asd->metadata_ready[i].next,
-					    struct atomisp_metadata_buf, list);
-			list_del(&md_buf->list);
-			list_add_tail(&md_buf->list, &asd->metadata[i]);
-		}
+		list_splice_init(&asd->metadata_in_css[i], &asd->metadata[i]);
+		list_splice_init(&asd->metadata_ready[i], &asd->metadata[i]);
 	}
 
 	atomisp_flush_params_queue(&asd->video_out_capture);
-- 
2.30.2

