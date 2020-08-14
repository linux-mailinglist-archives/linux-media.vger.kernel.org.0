Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4F5244CA1
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 18:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbgHNQaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 12:30:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:2838 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726320AbgHNQaU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 12:30:20 -0400
IronPort-SDR: oQCBArlvamHJxWCsyw9GVHt/l9FKt9PXETx1gHG30E8YOP+l7iBcBt8acXz0i72JcOz9HjEIt5
 Q7Tfj5uIgpsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9713"; a="133964972"
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; 
   d="scan'208";a="133964972"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 09:30:20 -0700
IronPort-SDR: 0GaUVX7pav7BGI0OjRu7tHB84a+ytiZySCjM/yWJxNLkR26HMeGFV7QzP/h7b3tCZ7or97gFLZ
 FMQj/20Tw14A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; 
   d="scan'208";a="327931578"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2020 09:30:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2EE223D7; Fri, 14 Aug 2020 19:30:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/7] media: ipu3-cio2: Replace infinite loop by one with clear exit condition
Date:   Fri, 14 Aug 2020 19:30:15 +0300
Message-Id: <20200814163017.35001-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor cio2_buffer_done() to get rid of infinite loop by replacing it by one
with clear exit condition. This change also allows to check for an error ahead.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index eee7f841050d..f4175dc1501a 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -541,7 +541,7 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
 {
 	struct device *dev = &cio2->pci_dev->dev;
 	struct cio2_queue *q = cio2->cur_queue;
-	int buffers_found = 0;
+	struct cio2_fbpt_entry *const entry;
 	u64 ns = ktime_get_ns();
 
 	if (dma_chan >= CIO2_QUEUES) {
@@ -549,15 +549,18 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
 		return;
 	}
 
+	entry = &q->fbpt[q->bufs_first * CIO2_MAX_LOPS];
+	if (entry->first_entry.ctrl & CIO2_FBPT_CTRL_VALID) {
+		dev_warn(&cio2->pci_dev->dev,
+			 "no ready buffers found on DMA channel %u\n",
+			 dma_chan);
+		return;
+	}
+
 	/* Find out which buffer(s) are ready */
 	do {
-		struct cio2_fbpt_entry *const entry =
-			&q->fbpt[q->bufs_first * CIO2_MAX_LOPS];
 		struct cio2_buffer *b;
 
-		if (entry->first_entry.ctrl & CIO2_FBPT_CTRL_VALID)
-			break;
-
 		b = q->bufs[q->bufs_first];
 		if (b) {
 			unsigned int bytes = entry[1].second_entry.num_of_bytes;
@@ -579,13 +582,8 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
 		atomic_inc(&q->frame_sequence);
 		cio2_fbpt_entry_init_dummy(cio2, entry);
 		q->bufs_first = (q->bufs_first + 1) % CIO2_MAX_BUFFERS;
-		buffers_found++;
-	} while (1);
-
-	if (buffers_found == 0)
-		dev_warn(&cio2->pci_dev->dev,
-			 "no ready buffers found on DMA channel %u\n",
-			 dma_chan);
+		entry = &q->fbpt[q->bufs_first * CIO2_MAX_LOPS];
+	} while (!(entry->first_entry.ctrl & CIO2_FBPT_CTRL_VALID));
 }
 
 static void cio2_queue_event_sof(struct cio2_device *cio2, struct cio2_queue *q)
-- 
2.28.0

