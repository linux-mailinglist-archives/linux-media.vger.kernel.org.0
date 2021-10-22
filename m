Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D737E436F92
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 03:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbhJVBwA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 21:52:00 -0400
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:50247 "EHLO
        out28-148.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbhJVBwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 21:52:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1947132|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00895314-0.00138788-0.989659;FP=13645255560291118206|1|1|8|0|-1|-1|-1;HT=ay29a033018047211;MF=huangshuosheng@allwinnertech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.LflF5bR_1634867362;
Received: from allwinnertech.com(mailfrom:huangshuosheng@allwinnertech.com fp:SMTPD_---.LflF5bR_1634867362)
          by smtp.aliyun-inc.com(10.147.40.44);
          Fri, 22 Oct 2021 09:49:41 +0800
From:   Shuosheng Huang <huangshuosheng@allwinnertech.com>
To:     sumit.semwal@linaro.org, lmark@codeaurora.org, labbott@redhat.com,
        Brian.Starkey@arm.com, john.stultz@linaro.org,
        christian.koenig@amd.com
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>
Subject: [PATCH v2] dma-buf: heaps: init heaps in subsys_initcall
Date:   Fri, 22 Oct 2021 09:48:50 +0800
Message-Id: <20211022014850.22933-1-huangshuosheng@allwinnertech.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some built-in modules will failed to use dma-buf heap to allocate
memory if the heap drivers are too late to be initialized.
To fix this issue, move initialization of dma-buf heap drivers in
subsys_initcall() which is more earlier to be called.

Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 2 +-
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0c05b79870f9..e051403a346d 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -400,6 +400,6 @@ static int add_default_cma_heap(void)
 
 	return ret;
 }
-module_init(add_default_cma_heap);
+subsys_initcall(add_default_cma_heap);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..3d6927657ec9 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -435,5 +435,5 @@ static int system_heap_create(void)
 
 	return 0;
 }
-module_init(system_heap_create);
+subsys_initcall(system_heap_create);
 MODULE_LICENSE("GPL v2");
-- 
2.29.0

