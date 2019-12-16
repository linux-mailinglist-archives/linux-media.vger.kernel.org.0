Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B62E4120EE3
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 17:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfLPQLL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 11:11:11 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:55668 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfLPQLK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 11:11:10 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1igsxX-0003nJ-Vx; Mon, 16 Dec 2019 16:11:00 +0000
From:   Colin King <colin.king@canonical.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <brian.starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Sandeep Patil <sspatil@android.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] dma-buf: fix resource leak on -ENOTTY error return path
Date:   Mon, 16 Dec 2019 16:10:59 +0000
Message-Id: <20191216161059.269492-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The -ENOTTY error return path does not free the allocated
kdata as it returns directly. Fix this by returning via the
error handling label err.

Addresses-Coverity: ("Resource leak")
Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma-buf/dma-heap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 4f04d104ae61..80f2f5eac1e4 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -157,7 +157,8 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 		ret = dma_heap_ioctl_allocate(file, kdata);
 		break;
 	default:
-		return -ENOTTY;
+		ret = -ENOTTY;
+		goto err;
 	}
 
 	if (copy_to_user((void __user *)arg, kdata, out_size) != 0)
-- 
2.24.0

