Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228691DF681
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2020 12:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387695AbgEWKDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 May 2020 06:03:49 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:16114 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725270AbgEWKDt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 May 2020 06:03:49 -0400
Received: from localhost.localdomain (unknown [222.205.77.158])
        by mail-app2 (Coremail) with SMTP id by_KCgCnHr709Mhe2tm5AQ--.78S4;
        Sat, 23 May 2020 18:03:36 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: coda: Fix runtime PM imbalance in coda_probe
Date:   Sat, 23 May 2020 18:03:32 +0800
Message-Id: <20200523100332.32626-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: by_KCgCnHr709Mhe2tm5AQ--.78S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4rJFyfAF15Wr1rAw1xAFb_yoW8Gr13pa
        9Ykay0kFWFgws0vr4DAw1UuFW5WFyS9ry7Kr9ruwn5A3s8Jas2qw4rtFy3tFy8JrZ7A3W7
        AFnIq39rAF4j9r7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvI1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
        Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
        6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
        vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxG
        rwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
        6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x0JUd-B_UUUUU=
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgQJBlZdtORGcwAFsi
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When coda_firmware_request() returns an error code,
a pairing runtime PM usage counter decrement is needed
to keep the counter balanced.

Also, the caller expects coda_probe() to increase PM
usage counter, there should be a refcount decrement
in coda_remove() to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/media/platform/coda/coda-common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index d0d093dd8f7c..550e9a1266da 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -3119,6 +3119,8 @@ static int coda_probe(struct platform_device *pdev)
 	return 0;
 
 err_alloc_workqueue:
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	destroy_workqueue(dev->workqueue);
 err_v4l2_register:
 	v4l2_device_unregister(&dev->v4l2_dev);
@@ -3136,6 +3138,7 @@ static int coda_remove(struct platform_device *pdev)
 	}
 	if (dev->m2m_dev)
 		v4l2_m2m_release(dev->m2m_dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	v4l2_device_unregister(&dev->v4l2_dev);
 	destroy_workqueue(dev->workqueue);
-- 
2.17.1

