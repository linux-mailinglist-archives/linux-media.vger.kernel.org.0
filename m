Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3040038297A
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 12:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236323AbhEQKJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 06:09:30 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:57142 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236141AbhEQKJ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 06:09:27 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0UZ78uCN_1621246070;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UZ78uCN_1621246070)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 17 May 2021 18:08:08 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     eugen.hristev@microchip.com
Cc:     mchehab@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] media: atmel: atmel-isc: Remove redundant assignment to i
Date:   Mon, 17 May 2021 18:07:48 +0800
Message-Id: <1621246068-58221-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Variable i is being assigned a value however the assignment is
never read, so this redundant assignment can be removed.

Clean up the following clang-analyzer warning:

drivers/media/platform/atmel/atmel-isc-base.c:975:2: warning: Value
stored to 'i' is never read [clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index ce8e135..a017572c 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -972,7 +972,6 @@ static int isc_enum_fmt_vid_cap(struct file *file, void *priv,
 
 	index -= ARRAY_SIZE(controller_formats);
 
-	i = 0;
 	supported_index = 0;
 
 	for (i = 0; i < ARRAY_SIZE(formats_list); i++) {
-- 
1.8.3.1

