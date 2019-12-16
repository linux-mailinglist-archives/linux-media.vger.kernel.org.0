Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07166120210
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 11:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfLPKM6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 05:12:58 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:39516 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727099AbfLPKM5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 05:12:57 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 98AFEFC97C184B045831;
        Mon, 16 Dec 2019 18:12:54 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Mon, 16 Dec 2019 18:12:46 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <sumit.semwal@linaro.org>, <afd@ti.com>,
        <benjamin.gaignard@linaro.org>
CC:     <lmark@codeaurora.org>, <labbott@redhat.com>,
        <Brian.Starkey@arm.com>, <john.stultz@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <zhongjiang@huawei.com>
Subject: [PATCH] dma-heap: Make the symbol 'dma_heap_ioctl_cmds' static
Date:   Mon, 16 Dec 2019 18:08:24 +0800
Message-ID: <1576490904-18069-1-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following sparse warning.

drivers/gpu/drm/ast/ast_main.c:391:22: warning: symbol 'ast_mode_config_mode_valid' was not declared. Should it be static?

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/dma-buf/dma-heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 4f04d10..da2090e 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -106,7 +106,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
 	return 0;
 }
 
-unsigned int dma_heap_ioctl_cmds[] = {
+static unsigned int dma_heap_ioctl_cmds[] = {
 	DMA_HEAP_IOC_ALLOC,
 };
 
-- 
1.7.12.4

