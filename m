Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8622F244CA2
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 18:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgHNQaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 12:30:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:2838 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728079AbgHNQaV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 12:30:21 -0400
IronPort-SDR: Ov5Ve5+PVdgL7ZEe0161diwcNHHuWyXYtH2wh/Hmwx94615F8br2zqCAicrIV2DLhBq0SQuZEH
 mihuLFnVY+/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9713"; a="133964974"
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; 
   d="scan'208";a="133964974"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 09:30:20 -0700
IronPort-SDR: qDStCq5sQ9k+J7f8i9tXCawKkML4+Q4p0fyqGB3+2s1tOGw3/qjxTM0dPaOEd1tbmpVlVoGNkd
 D1Qk+uu3WGsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; 
   d="scan'208";a="440159479"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 14 Aug 2020 09:30:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EEA5B190; Fri, 14 Aug 2020 19:30:17 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/7] media: ipu3-cio2: Simplify cleanup code
Date:   Fri, 14 Aug 2020 19:30:11 +0300
Message-Id: <20200814163017.35001-1-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 92f5eadf2c99..c7c3692a6e72 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
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

