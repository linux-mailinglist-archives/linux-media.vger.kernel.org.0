Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B58A348B74
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 09:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhCYIXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 04:23:45 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:33732 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229782AbhCYIXR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 04:23:17 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R241e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UTFuKJG_1616660584;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UTFuKJG_1616660584)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 25 Mar 2021 16:23:13 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] media: mxl692: remove impossible condition
Date:   Thu, 25 Mar 2021 16:23:03 +0800
Message-Id: <1616660583-122448-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following coverity warning:

This greater-than-or-equal-to-zero comparison of an unsigned value is
always true. "opcode >= 0".

Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/media/dvb-frontends/mxl692.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/mxl692.c b/drivers/media/dvb-frontends/mxl692.c
index 86af831..8303064 100644
--- a/drivers/media/dvb-frontends/mxl692.c
+++ b/drivers/media/dvb-frontends/mxl692.c
@@ -377,7 +377,7 @@ static int mxl692_memread(struct mxl692_dev *dev, u32 addr,
 
 static const char *mxl692_opcode_string(u8 opcode)
 {
-	if (opcode >= 0 && opcode <= MXL_EAGLE_OPCODE_INTERNAL)
+	if (opcode <= MXL_EAGLE_OPCODE_INTERNAL)
 		return MXL_EAGLE_OPCODE_STRING[opcode];
 
 	return "invalid opcode";
-- 
1.8.3.1

