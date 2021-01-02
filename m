Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1FB2E8693
	for <lists+linux-media@lfdr.de>; Sat,  2 Jan 2021 07:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbhABG2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 01:28:30 -0500
Received: from spam.zju.edu.cn ([61.164.42.155]:10888 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726080AbhABG2a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Jan 2021 01:28:30 -0500
Received: from localhost.localdomain (unknown [10.192.85.18])
        by mail-app3 (Coremail) with SMTP id cC_KCgAHsA1OEvBfjwVCAA--.45034S4;
        Sat, 02 Jan 2021 14:27:30 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: media/pci: Fix memleak in empress_init
Date:   Sat,  2 Jan 2021 14:27:22 +0800
Message-Id: <20210102062725.27704-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgAHsA1OEvBfjwVCAA--.45034S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4fJryrGFy7Ww1rKr4xCrg_yoWDCFbE9r
        4Dua9FvrW8Gr10kFy7tF4fAFWkt3yYvFyFyF1ftFZYvrW7ur45JrWq9rnrCw1UWay293sr
        Gr43Ja1UZryrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbc8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
        GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
        6cx26r4fKr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg0IBlZdtRuRfAAVsc
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When vb2_queue_init() fails, dev->empress_dev
should be released just like other error handling
paths.

Fixes: 2ada815fc48bb ("[media] saa7134: convert to vb2")
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/media/pci/saa7134/saa7134-empress.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index 39e3c7f8c5b4..76a37fbd8458 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -282,8 +282,11 @@ static int empress_init(struct saa7134_dev *dev)
 	q->lock = &dev->lock;
 	q->dev = &dev->pci->dev;
 	err = vb2_queue_init(q);
-	if (err)
+	if (err) {
+		video_device_release(dev->empress_dev);
+		dev->empress_dev = NULL;
 		return err;
+	}
 	dev->empress_dev->queue = q;
 	dev->empress_dev->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 					V4L2_CAP_VIDEO_CAPTURE;
-- 
2.17.1

