Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1DDC1DE28D
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 11:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgEVJD2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 05:03:28 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:51422 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728424AbgEVJD2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 05:03:28 -0400
Received: from localhost.localdomain (unknown [222.205.77.158])
        by mail-app3 (Coremail) with SMTP id cC_KCgBXX4tSlcde_SjxAA--.37151S4;
        Fri, 22 May 2020 17:03:18 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: smiapp: Fix runtime PM imbalance on error
Date:   Fri, 22 May 2020 17:03:13 +0800
Message-Id: <20200522090313.10634-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgBXX4tSlcde_SjxAA--.37151S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKw4UCw4UCF45tr4DtFyfXrb_yoW3Zwc_Gr
        sxXw1xWrZ5GFn3Kw1jva4fZFyaqFWDWF4kXr1Fqa4ak39Fk3Z8GrZY9r98Aw42vrsFva4Y
        yw1DWF17ur9rCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbIkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4UJVW0owA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWU
        XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l
        42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
        twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAF
        wI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf
        9x0JUSsjbUUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgUIBlZdtOQgrAABsf
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When v4l2_async_register_subdev_sensor_common() returns
an error code, a pairing runtime PM usage counter
decrement is needed to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 5e4f6a2ef78e..43ba63c48a87 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -3103,6 +3103,7 @@ static int smiapp_probe(struct i2c_client *client)
 	return 0;
 
 out_disable_runtime_pm:
+	pm_runtime_put_autosuspend(&client->dev);
 	pm_runtime_disable(&client->dev);
 
 out_media_entity_cleanup:
-- 
2.17.1

