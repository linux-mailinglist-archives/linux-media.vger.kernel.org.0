Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EE534135B
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 04:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbhCSDIa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 23:08:30 -0400
Received: from mail-m118208.qiye.163.com ([115.236.118.208]:45514 "EHLO
        mail-m118208.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhCSDIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 23:08:01 -0400
X-Greylist: delayed 536 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Mar 2021 23:08:00 EDT
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.250.176.229])
        by mail-m118208.qiye.163.com (Hmail) with ESMTPA id 339CAE0213;
        Fri, 19 Mar 2021 10:59:02 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH] dma-buf: use wake_up_process() instead of wake_up_state()
Date:   Fri, 19 Mar 2021 10:58:54 +0800
Message-Id: <1616122734-11581-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZHhhJHkIeHxpDQh8eVkpNSk1KSUlMT0lOTUhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mgw6Txw6Lj8POU4UCB84Eko9
        GToKFE9VSlVKTUpNSklJTE9JQ0tDVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5LVUpMTVVJSUJZV1kIAVlBSkxNTTcG
X-HM-Tid: 0a78486c06cb2c17kusn339cae0213
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using wake_up_process() is more simpler and friendly, 
and it is more convenient for analysis and statistics

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 7475e09..de51326
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -655,7 +655,7 @@ dma_fence_default_wait_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	struct default_wait_cb *wait =
 		container_of(cb, struct default_wait_cb, base);
 
-	wake_up_state(wait->task, TASK_NORMAL);
+	wake_up_process(wait->task);
 }
 
 /**
-- 
2.7.4

