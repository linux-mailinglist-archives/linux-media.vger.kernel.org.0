Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3774247056
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390307AbgHQSGx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 14:06:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:29636 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388476AbgHQQIv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 12:08:51 -0400
IronPort-SDR: B0J0vBbiDeK3/G6VhEXMlPGHx4isQafXRx8+ezDyNF/oMXogPEKyTdVvFTRICb+rAdsppqwR08
 DSj0Vsnv0vDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152379917"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="152379917"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 09:08:49 -0700
IronPort-SDR: uP1F40sPgMc7skDAiP0uvjaKZLqGPdzFZfc40CYaSQlCd7Pk9mWGEIzWyvVt8RvQiQjtpO3Opz
 vdJexDlKFoOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; 
   d="scan'208";a="370610482"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 17 Aug 2020 09:08:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DEDAB1A3; Mon, 17 Aug 2020 19:08:46 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 10/10] media: ipu3-cio2: Update Copyright year and fix indentation issues
Date:   Mon, 17 Aug 2020 19:07:33 +0300
Message-Id: <20200817160734.12402-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update Copyright year to cover the previous changes and at the same time
address indentation issues.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: one more indentation fix
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index f3ec2d62cace..9a8c6e99d3ac 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2017 Intel Corporation
+ * Copyright (C) 2017,2020 Intel Corporation
  *
  * Based partially on Intel IPU4 driver written by
  *  Sakari Ailus <sakari.ailus@linux.intel.com>
@@ -9,7 +9,6 @@
  *  Jouni Ukkonen <jouni.ukkonen@intel.com>
  *  Antti Laakso <antti.laakso@intel.com>
  * et al.
- *
  */
 
 #include <linux/delay.h>
@@ -292,7 +291,7 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
 				 struct cio2_csi2_timing *timing)
 {
 	struct device *dev = &cio2->pci_dev->dev;
-	struct v4l2_querymenu qm = {.id = V4L2_CID_LINK_FREQ, };
+	struct v4l2_querymenu qm = { .id = V4L2_CID_LINK_FREQ };
 	struct v4l2_ctrl *link_freq;
 	s64 freq;
 	int r;
@@ -864,7 +863,7 @@ static int cio2_vb2_buf_init(struct vb2_buffer *vb)
 		b->offset = sg->sgl->offset;
 
 	i = j = 0;
-	for_each_sg_dma_page (sg->sgl, &sg_iter, sg->nents, 0) {
+	for_each_sg_dma_page(sg->sgl, &sg_iter, sg->nents, 0) {
 		if (!pages--)
 			break;
 		b->lop[i][j] = PFN_DOWN(sg_page_iter_dma_address(&sg_iter));
-- 
2.28.0

