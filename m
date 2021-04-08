Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C49357CFF
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 09:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhDHHJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 03:09:14 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:23924 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229506AbhDHHJN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 03:09:13 -0400
Received: from localhost.localdomain (unknown [10.192.24.118])
        by mail-app2 (Coremail) with SMTP id by_KCgDX3zcCrG5g_QfdAA--.42451S4;
        Thu, 08 Apr 2021 15:08:54 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ti-vpe: cal: Fix runtime PM imbalance in cal_probe
Date:   Thu,  8 Apr 2021 15:08:50 +0800
Message-Id: <20210408070850.11837-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: by_KCgDX3zcCrG5g_QfdAA--.42451S4
X-Coremail-Antispam: 1UD129KBjvdXoWrZrW3Aw4rurW8GF1kAr48tFb_yoWDXrg_Gr
        45GFsrWF4rGr1vgw47Kr1a9ryIvFZ8Zr1rXFWSqrWay34jkryDXr1DZF97Zw47Xw4IyFnY
        qr90gFWfCwnxCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl6s0DM28EF7xvwVC2z280
        aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07
        x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15
        McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
        1lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
        Y20_GFWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
        AIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg0JBlZdtTTcOgAEso
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pm_runtime_get_sync() will increase the rumtime PM counter
even it returns an error. Thus a pairing decrement is needed
to prevent refcount leak. Fix this by replacing this API with
pm_runtime_resume_and_get(), which will not change the runtime
PM counter on error.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/media/platform/ti-vpe/cal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index fa0931788040..ce4e53b9be10 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1010,7 +1010,7 @@ static int cal_probe(struct platform_device *pdev)
 
 	/* Read the revision and hardware info to verify hardware access. */
 	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
 		goto error_pm_runtime;
 
-- 
2.17.1

