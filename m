Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF800312E9E
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 11:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbhBHKLp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 05:11:45 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:45516 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231960AbhBHKGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 05:06:10 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UOBlDvt_1612778688;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UOBlDvt_1612778688)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 08 Feb 2021 18:04:53 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     bparrot@ti.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] media: ti-vpe: Simplify bool comparison
Date:   Mon,  8 Feb 2021 18:04:46 +0800
Message-Id: <1612778686-55814-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following coccicheck warning:

./drivers/media/platform/ti-vpe/vpdma.c:946:5-26: WARNING: Comparison to
bool.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/media/platform/ti-vpe/vpdma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
index 2e5148a..f8998a8 100644
--- a/drivers/media/platform/ti-vpe/vpdma.c
+++ b/drivers/media/platform/ti-vpe/vpdma.c
@@ -942,8 +942,7 @@ int vpdma_hwlist_alloc(struct vpdma_data *vpdma, void *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&vpdma->lock, flags);
-	for (i = 0; i < VPDMA_MAX_NUM_LIST &&
-	    vpdma->hwlist_used[i] == true; i++)
+	for (i = 0; i < VPDMA_MAX_NUM_LIST && vpdma->hwlist_used[i]; i++)
 		;
 
 	if (i < VPDMA_MAX_NUM_LIST) {
-- 
1.8.3.1

