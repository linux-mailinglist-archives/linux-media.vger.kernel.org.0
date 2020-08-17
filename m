Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2EB6247041
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388484AbgHQQIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 12:08:55 -0400
Received: from mga06.intel.com ([134.134.136.31]:20641 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388464AbgHQQIp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 12:08:45 -0400
IronPort-SDR: FTnNcr5/UCG3w7KyQ3KbKlVm+dLnlE5MwpxSrnJseRXn2pBmqlV8Z9wYTT4KqBCwqQ6NYZkrL6
 UFrPybXOfZ3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="216264528"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="216264528"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:08:36 -0700
IronPort-SDR: VfStKSPlBwaXtG6S8SU21yUfMJ8N9IV4At10zyYjJ/8o2yLHYkWruVac9Dfj5tAmptyD827N65
 79XEGeMYnHiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="496528929"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2020 09:08:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7689B16D; Mon, 17 Aug 2020 19:08:33 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 01/10] media: ipu3-cio2: Simplify cleanup code
Date:   Mon, 17 Aug 2020 19:07:24 +0300
Message-Id: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code looks more nicer if we use:
	while (i--)
instead:
	for (i = i - 1; i >= 0; i--)

This would also allow making 'i' unsigned again.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: converted i to unsigned (Sakari)
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 92f5eadf2c99..cb74d49934f1 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -847,7 +847,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 	unsigned int lops = DIV_ROUND_UP(pages + 1, entries_per_page);
 	struct sg_table *sg;
 	struct sg_dma_page_iter sg_iter;
-	int i, j;
+	unsigned int i, j;
 
 	if (lops <= 0 || lops > CIO2_MAX_LOPS) {
 		dev_err(dev, "%s: bad buffer size (%i)\n", __func__,
@@ -887,7 +887,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 	b->lop[i][j] = cio2->dummy_page_bus_addr >> PAGE_SHIFT;
 	return 0;
 fail:
-	for (i--; i >= 0; i--)
+	while (i--)
 		dma_free_coherent(dev, CIO2_PAGE_SIZE,
 				  b->lop[i], b->lop_bus_addr[i]);
 	return -ENOMEM;
-- 
2.28.0

