Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF26382984
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 12:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236270AbhEQKK7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 06:10:59 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:49101 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236231AbhEQKK6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 06:10:58 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R971e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UZ7T3S7_1621246162;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UZ7T3S7_1621246162)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 17 May 2021 18:09:29 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     hugues.fruchet@foss.st.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] media: st-delta: Remove redundant assignment to ret
Date:   Mon, 17 May 2021 18:09:20 +0800
Message-Id: <1621246160-59374-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Variable ret is being assigned a value however the assignment is
never read, so this redundant assignment can be removed.

Clean up the following clang-analyzer warning:

drivers/media/platform/sti/delta/delta-v4l2.c:1010:4: warning: Value
stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/media/platform/sti/delta/delta-v4l2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/sti/delta/delta-v4l2.c b/drivers/media/platform/sti/delta/delta-v4l2.c
index 064a00a..c887a31 100644
--- a/drivers/media/platform/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/sti/delta/delta-v4l2.c
@@ -1007,7 +1007,6 @@ static void delta_run_work(struct work_struct *work)
 			dev_err(delta->dev,
 				"%s  NULL decoded frame\n",
 				ctx->name);
-			ret = -EIO;
 			goto out;
 		}
 
-- 
1.8.3.1

