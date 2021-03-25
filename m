Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECCA7348BB7
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 09:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhCYIk2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 04:40:28 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:40250 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229662AbhCYIkH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 04:40:07 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R791e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UTFqzCb_1616661599;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UTFqzCb_1616661599)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 25 Mar 2021 16:40:05 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH v2] media: mxl692: remove impossible condition
Date:   Thu, 25 Mar 2021 16:39:56 +0800
Message-Id: <1616661596-11886-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following coverity warning:

This greater-than-or-equal-to-zero comparison of an unsigned value is
always true. "opcode >= 0".

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  - Make the commit message more clearer.

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

