Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B730120770
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbfLPNnG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:43:06 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:48610 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727807AbfLPNnG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:43:06 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id A6562513F75AAEF470C6;
        Mon, 16 Dec 2019 21:43:00 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Mon, 16 Dec 2019 21:42:53 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <afd@ti.com>, <sumit.semwal@linaro.org>,
        <benjamin.gaignard@linaro.org>
CC:     <labbott@redhat.com>, <Brian.Starkey@arm.com>,
        <john.stultz@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <zhongjiang@huawei.com>
Subject: [PATCH v2] dma-heap: Make the symbol 'dma_heap_ioctl_cmds' static
Date:   Mon, 16 Dec 2019 21:38:31 +0800
Message-ID: <1576503511-27500-1-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <c1244a5f-b82a-baee-262a-7241531036ad@ti.com>
References: <c1244a5f-b82a-baee-262a-7241531036ad@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following sparse warning.

drivers/dma-buf/dma-heap.c:109:14: warning: symbol 'dma_heap_ioctl_cmds' was not declared. Should it be static?

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

