Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F632DA654
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 03:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgLOCj3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 21:39:29 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9529 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbgLOCjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 21:39:14 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cw2VT2Dh3zhrph;
        Tue, 15 Dec 2020 10:37:53 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 10:38:25 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <sumit.semwal@linaro.org>, <benjamin.gaignard@linaro.org>,
        <lmark@codeaurora.org>, <labbott@redhat.com>,
        <Brian.Starkey@arm.com>, <john.stultz@linaro.org>,
        <christian.koenig@amd.com>
CC:     <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dma-buf: system_heap: Use PTR_ERR_OR_ZERO() to simplify code
Date:   Tue, 15 Dec 2020 10:38:35 +0800
Message-ID: <1607999915-53034-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes coccicheck warning:
drivers/dma-buf/heaps/system_heap.c:437:1-3: WARNING: PTR_ERR_OR_ZERO
can be used

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/dma-buf/heaps/system_heap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 17e0e9a..c5d8a40 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -434,10 +434,8 @@ static int system_heap_create(void)
 	exp_info.priv = NULL;
 
 	sys_heap = dma_heap_add(&exp_info);
-	if (IS_ERR(sys_heap))
-		return PTR_ERR(sys_heap);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(sys_heap);
 }
 module_init(system_heap_create);
 MODULE_LICENSE("GPL v2");
-- 
2.7.4

