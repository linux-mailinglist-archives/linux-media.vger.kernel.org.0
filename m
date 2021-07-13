Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD973C77CE
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 22:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhGMUYE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 16:24:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:12038 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234172AbhGMUYD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 16:24:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="274067565"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="274067565"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 13:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; 
   d="scan'208";a="562212188"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 13 Jul 2021 13:21:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 28409108; Tue, 13 Jul 2021 23:21:37 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 5/6] media: ipu3-cio2: Introduce to_cio2_buffer() helper macro
Date:   Tue, 13 Jul 2021 23:21:30 +0300
Message-Id: <20210713202131.13906-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210713202131.13906-1-andriy.shevchenko@linux.intel.com>
References: <20210713202131.13906-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide to_cio2_buffer() helper macro and convert users to make
code easier to read.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 9 +++------
 drivers/media/pci/intel/ipu3/ipu3-cio2.h      | 2 ++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 8abb34f47b7b..3acee7a623c0 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -823,8 +823,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 {
 	struct cio2_device *cio2 = vb2_get_drv_priv(vb->vb2_queue);
 	struct device *dev = &cio2->pci_dev->dev;
-	struct cio2_buffer *b =
-		container_of(vb, struct cio2_buffer, vbb.vb2_buf);
+	struct cio2_buffer *b = to_cio2_buffer(vb);
 	unsigned int pages = PFN_UP(vb->planes[0].length);
 	unsigned int lops = DIV_ROUND_UP(pages + 1, CIO2_LOP_ENTRIES);
 	struct sg_table *sg;
@@ -881,8 +880,7 @@ static void cio2_vb2_buf_queue(struct vb2_buffer *vb)
 	struct device *dev = &cio2->pci_dev->dev;
 	struct cio2_queue *q =
 		container_of(vb->vb2_queue, struct cio2_queue, vbq);
-	struct cio2_buffer *b =
-		container_of(vb, struct cio2_buffer, vbb.vb2_buf);
+	struct cio2_buffer *b = to_cio2_buffer(vb);
 	struct cio2_fbpt_entry *entry;
 	unsigned long flags;
 	unsigned int i, j, next = q->bufs_next;
@@ -955,8 +953,7 @@ static void cio2_vb2_buf_cleanup(struct vb2_buffer *vb)
 {
 	struct cio2_device *cio2 = vb2_get_drv_priv(vb->vb2_queue);
 	struct device *dev = &cio2->pci_dev->dev;
-	struct cio2_buffer *b =
-		container_of(vb, struct cio2_buffer, vbb.vb2_buf);
+	struct cio2_buffer *b = to_cio2_buffer(vb);
 	unsigned int i;
 
 	/* Free LOP table */
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index 3806d7f04d69..f82f9b2590b9 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -338,6 +338,8 @@ struct cio2_buffer {
 	unsigned int offset;
 };
 
+#define to_cio2_buffer(vb)	container_of(vb, struct cio2_buffer, vbb.vb2_buf)
+
 struct csi2_bus_info {
 	u32 port;
 	u32 lanes;
-- 
2.30.2

