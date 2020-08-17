Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC30B246C11
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 18:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388487AbgHQQI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 12:08:58 -0400
Received: from mga11.intel.com ([192.55.52.93]:29629 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388468AbgHQQIv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 12:08:51 -0400
IronPort-SDR: RQWOS7Fe+xXNlG+2V2hr6eXXL4TENH+OdoAfnKa88dLEgChd8pEaABdpMooAowj19xuQWeqCd8
 Z7Wx7hidIR6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152379910"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="152379910"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:08:43 -0700
IronPort-SDR: YKVw3TvsPr5cnn6mHJ9P5BtgcvDNbPUrz3h9g+FUvRjfF2bD+fYVOfooMmkz/WkG5eYlxD6OFy
 ni/cU2IxsZqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="370610454"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 17 Aug 2020 09:08:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9FC921C5; Mon, 17 Aug 2020 19:08:40 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 05/10] media: ipu3-cio2: Replace infinite loop by one with clear exit condition
Date:   Mon, 17 Aug 2020 19:07:28 +0300
Message-Id: <20200817160734.12402-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
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
v2: Dropped const (Bingbu)
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 35bf05de5d5d..36b4c7730f43 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -540,7 +540,7 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
 {
 	struct device *dev = &cio2->pci_dev->dev;
 	struct cio2_queue *q = cio2->cur_queue;
-	int buffers_found = 0;
+	struct cio2_fbpt_entry *entry;
 	u64 ns = ktime_get_ns();
 
 	if (dma_chan >= CIO2_QUEUES) {
@@ -548,15 +548,18 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
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
@@ -578,13 +581,8 @@ static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
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

