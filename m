Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269F2244CA6
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 18:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgHNQaY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 12:30:24 -0400
Received: from mga18.intel.com ([134.134.136.126]:29793 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728360AbgHNQaY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 12:30:24 -0400
IronPort-SDR: /pCnGfNV/29j2qB37iwoJep8al54AoQI9xVtONzwQPwE/0l7fzlVheQs2u7/QpC7nJ5+CyVguN
 qD9Km7Wzr3mQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9713"; a="142064539"
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; 
   d="scan'208";a="142064539"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 09:30:23 -0700
IronPort-SDR: v9i+1e9iU9+a6wNkj4Ee5BIf18zUYZAZF4xMHBBl/HYYgjZkZX8i3ymlAU6Pwa7i+0JKoYEWkl
 EnUnedGy3NXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; 
   d="scan'208";a="278449490"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 14 Aug 2020 09:30:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 409F0456; Fri, 14 Aug 2020 19:30:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 7/7] media: ipu3-cio2: Update Copyright year and fix indentation issues
Date:   Fri, 14 Aug 2020 19:30:17 +0300
Message-Id: <20200814163017.35001-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
References: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
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
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 5f8ff91dbf09..8925bab8ba06 100644
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

