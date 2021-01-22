Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF293000DE
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 11:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbhAVJ1I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 04:27:08 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:57302 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726488AbhAVJYn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 04:24:43 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UMW2N.v_1611307426;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0UMW2N.v_1611307426)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 22 Jan 2021 17:23:56 +0800
From:   Yang Li <abaci-bugfix@linux.alibaba.com>
To:     mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Yang Li <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] scsi: megaraid_sas: remove redundant NULL check
Date:   Fri, 22 Jan 2021 17:23:44 +0800
Message-Id: <1611307424-109090-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix below warnings reported by coccicheck:
./drivers/scsi/megaraid/megaraid_sas_fusion.c:3924:3-8: WARNING: NULL
check before some freeing functions is not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>
---
 drivers/scsi/megaraid/megaraid_sas_fusion.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/megaraid/megaraid_sas_fusion.c b/drivers/scsi/megaraid/megaraid_sas_fusion.c
index fd60728..38fc946 100644
--- a/drivers/scsi/megaraid/megaraid_sas_fusion.c
+++ b/drivers/scsi/megaraid/megaraid_sas_fusion.c
@@ -3920,8 +3920,7 @@ static irqreturn_t megasas_isr_fusion(int irq, void *devp)
 {
 	unsigned int i;
 	for (i = 0; i < instance->drv_buf_alloc; i++) {
-		if (instance->crash_buf[i])
-			vfree(instance->crash_buf[i]);
+		vfree(instance->crash_buf[i]);
 	}
 	instance->drv_buf_index = 0;
 	instance->drv_buf_alloc = 0;
-- 
1.8.3.1

