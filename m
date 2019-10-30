Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84A8CE9E3F
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 16:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfJ3PDA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 11:03:00 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50216 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJ3PDA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 11:03:00 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iPpUs-0001GN-AJ; Wed, 30 Oct 2019 15:02:54 +0000
From:   Colin King <colin.king@canonical.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <brian.starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] dma-buf: heaps: remove redundant assignment to variable ret
Date:   Wed, 30 Oct 2019 15:02:53 +0000
Message-Id: <20191030150253.10596-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned with a value that is never
read, it is being re-assigned the same value on the err0 exit
path. The assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Fixes: 47a32f9c1226 ("dma-buf: heaps: Add system heap to dmabuf heaps")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma-buf/heaps/system_heap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 455782efbb32..817a1667bd57 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -55,10 +55,8 @@ static int system_heap_allocate(struct dma_heap *heap,
 	helper_buffer->pages = kmalloc_array(helper_buffer->pagecount,
 					     sizeof(*helper_buffer->pages),
 					     GFP_KERNEL);
-	if (!helper_buffer->pages) {
-		ret = -ENOMEM;
+	if (!helper_buffer->pages)
 		goto err0;
-	}
 
 	for (pg = 0; pg < helper_buffer->pagecount; pg++) {
 		/*
-- 
2.20.1

