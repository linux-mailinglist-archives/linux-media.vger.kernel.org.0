Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 086F935D8C4
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 09:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238229AbhDMHXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 03:23:50 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:60024 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237646AbhDMHXr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 03:23:47 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UVQBm1o_1618298586;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UVQBm1o_1618298586)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 13 Apr 2021 15:23:16 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     maintainers@bluecherrydvr.com
Cc:     anton@corp.bluecherry.net, andrey_utkin@fastmail.com,
        ismael@iodev.co.uk, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] media: solo6x10: remove useless function
Date:   Tue, 13 Apr 2021 15:23:01 +0800
Message-Id: <1618298581-33566-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following clang warning:

drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:394:19: warning: unused
function 'vop_interlaced' [-Wunused-function].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 0abcad4..8c4fae7 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -391,11 +391,6 @@ static int solo_send_desc(struct solo_enc_dev *solo_enc, int skip,
 }
 
 /* Extract values from VOP header - VE_STATUSxx */
-static inline int vop_interlaced(const vop_header *vh)
-{
-	return (__le32_to_cpu((*vh)[0]) >> 30) & 1;
-}
-
 static inline u8 vop_channel(const vop_header *vh)
 {
 	return (__le32_to_cpu((*vh)[0]) >> 24) & 0x1F;
-- 
1.8.3.1

