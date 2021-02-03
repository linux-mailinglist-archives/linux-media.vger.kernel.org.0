Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377C330D176
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 03:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhBCCXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 21:23:00 -0500
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:8818 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230377AbhBCCW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 21:22:59 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R781e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UNj9G-w_1612318926;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UNj9G-w_1612318926)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 03 Feb 2021 10:22:06 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     dongchun.zhu@mediatek.com
Cc:     mchehab@kernel.org, matthias.bgg@gmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] media: i2c: remove unneeded semicolon
Date:   Wed,  3 Feb 2021 10:22:01 +0800
Message-Id: <1612318921-106894-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Eliminate the following coccicheck warning:
./drivers/media/i2c/ov02a10.c:703:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/media/i2c/ov02a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 8683ffd..e0f7d69 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -700,7 +700,7 @@ static int ov02a10_set_ctrl(struct v4l2_ctrl *ctrl)
 	default:
 		ret = -EINVAL;
 		break;
-	};
+	}
 
 	pm_runtime_put(&client->dev);
 
-- 
1.8.3.1

