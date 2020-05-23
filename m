Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCB21DF6F1
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2020 13:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731207AbgEWLta (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 May 2020 07:49:30 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:21268 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728749AbgEWLta (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 May 2020 07:49:30 -0400
Received: from localhost.localdomain (unknown [222.205.77.158])
        by mail-app3 (Coremail) with SMTP id cC_KCgCnr0O+DcleSsv5AA--.10191S4;
        Sat, 23 May 2020 19:49:22 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: vpif: Fix runtime PM imbalance in vpif_probe
Date:   Sat, 23 May 2020 19:49:17 +0800
Message-Id: <20200523114917.18222-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgCnr0O+DcleSsv5AA--.10191S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKw4UCw4UCF45tr4DZr48Xrb_yoW3ZFX_uw
        1FgF47Wr1rtr1qyw4jk3yfuFyavFZ8uFn7XF4ftFWS9a4Uua17Wry0vr9rZw48Z3y2yFyD
        JasIgFW3ur9xAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbIkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
        Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
        xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI48J
        MxAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
        Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x0JUqZXOUUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoJBlZdtORR6wAAsm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When platform_get_resource() returns an error code, a
pairing runtime PM usage counter decrement is needed
to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/media/platform/davinci/vpif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/davinci/vpif.c b/drivers/media/platform/davinci/vpif.c
index df66461f5d4f..f28c1b27eac6 100644
--- a/drivers/media/platform/davinci/vpif.c
+++ b/drivers/media/platform/davinci/vpif.c
@@ -458,6 +458,7 @@ static int vpif_probe(struct platform_device *pdev)
 	res_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!res_irq) {
 		dev_warn(&pdev->dev, "Missing IRQ resource.\n");
+		pm_runtime_put(&pdev->dev);
 		return -EINVAL;
 	}
 
-- 
2.17.1

