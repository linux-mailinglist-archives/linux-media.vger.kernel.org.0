Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFF91DFCF9
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 06:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgEXEbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 00:31:45 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:58684 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725796AbgEXEbp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 00:31:45 -0400
Received: from localhost.localdomain (unknown [222.205.77.158])
        by mail-app4 (Coremail) with SMTP id cS_KCgCnNAik+MlejO4aAg--.18628S4;
        Sun, 24 May 2020 12:31:36 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: venc: Fix runtime PM imbalance in venc_open
Date:   Sun, 24 May 2020 12:31:32 +0800
Message-Id: <20200524043132.32758-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgCnNAik+MlejO4aAg--.18628S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKrW7ZFW3Gr18JF1xWF4UArb_yoWDCFg_Wr
        s5WFsrGr4vkrWDXw4jkr1fZ3yIgrWDZr4ruF4SqF43GrWjvF98AryvvrZrAr1kCF42yF1U
        JF9xuFyxAr97CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbIkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
        Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
        xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48J
        MxAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
        GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x0JUfcTPUUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgEJBlZdtORShQAXsX
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/media/platform/qcom/venus/venc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 9981a2a27c90..eefcfbb8f211 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1169,7 +1169,7 @@ static int venc_open(struct file *file)
 
 	ret = pm_runtime_get_sync(core->dev_enc);
 	if (ret < 0)
-		goto err_free_inst;
+		goto err_put_sync;
 
 	ret = venc_ctrl_init(inst);
 	if (ret)
@@ -1214,7 +1214,6 @@ static int venc_open(struct file *file)
 	venc_ctrl_deinit(inst);
 err_put_sync:
 	pm_runtime_put_sync(core->dev_enc);
-err_free_inst:
 	kfree(inst);
 	return ret;
 }
-- 
2.17.1

