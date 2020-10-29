Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D6329EB2A
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 12:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgJ2L64 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 07:58:56 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7008 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgJ2L6z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 07:58:55 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CMP9W0qlLzhcjb;
        Thu, 29 Oct 2020 19:58:55 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Thu, 29 Oct 2020 19:58:45 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <sumit.semwal@linaro.org>, <benjamin.gaignard@linaro.org>,
        <lmark@codeaurora.org>, <labbott@redhat.com>,
        <Brian.Starkey@arm.com>, <john.stultz@linaro.org>,
        <christian.koenig@amd.com>
CC:     <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
        Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] dma-buf: heaps: Make sys_heap static
Date:   Thu, 29 Oct 2020 20:10:43 +0800
Message-ID: <1603973443-64798-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following sparse warning:

drivers/dma-buf/heaps/system_heap.c:23:17: warning: symbol 'sys_heap' was not declared. Should it be static?

sys_heap has only call within system_heap.c
It should be static

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 0bf688e..41502bf 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -20,7 +20,7 @@
 
 #include "heap-helpers.h"
 
-struct dma_heap *sys_heap;
+static struct dma_heap *sys_heap;
 
 static void system_heap_free(struct heap_helper_buffer *buffer)
 {
-- 
2.6.2

