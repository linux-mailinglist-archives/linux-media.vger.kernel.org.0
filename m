Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6081C2A60A2
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 10:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbgKDJhd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 04:37:33 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:57980 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726434AbgKDJhc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 04:37:32 -0500
X-Greylist: delayed 452 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Nov 2020 04:37:31 EST
Received: from localhost.localdomain (unknown [124.16.141.241])
        by APP-01 (Coremail) with SMTP id qwCowACnrYmPdKJfA2MUAQ--.61871S2;
        Wed, 04 Nov 2020 17:29:51 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: mt9p031: Remove redundant null check before clk_disable_unprepare
Date:   Wed,  4 Nov 2020 09:29:48 +0000
Message-Id: <20201104092948.8560-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowACnrYmPdKJfA2MUAQ--.61871S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy8CFy8Aw1xGry7Ww4DJwb_yoW3Krg_Cr
        n8Xr17WFWjvr90y348GFs5Ar9rtay8ZFW8Xa48t39akFWjv3Z8ZF4qvry3Aw1DtF4jkF15
        AryUur4fArn7ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2kYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8uwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
        z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0enmtUUUUU==
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCwYKA1z4jjNnQgAAs4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Because clk_disable_unprepare() already checked NULL clock parameter,
so the additional check is unnecessary, just remove it.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/media/i2c/mt9p031.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index dc23b9ed510a..a633b934d93e 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -346,8 +346,7 @@ static void mt9p031_power_off(struct mt9p031 *mt9p031)
 	regulator_bulk_disable(ARRAY_SIZE(mt9p031->regulators),
 			       mt9p031->regulators);
 
-	if (mt9p031->clk)
-		clk_disable_unprepare(mt9p031->clk);
+	clk_disable_unprepare(mt9p031->clk);
 }
 
 static int __mt9p031_set_power(struct mt9p031 *mt9p031, bool on)
-- 
2.17.1

