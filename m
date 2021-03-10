Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA91133380D
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 10:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbhCJJBJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 04:01:09 -0500
Received: from mail.zju.edu.cn ([61.164.42.155]:20888 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232349AbhCJJAt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 04:00:49 -0500
Received: from localhost.localdomain (unknown [10.192.85.18])
        by mail-app3 (Coremail) with SMTP id cC_KCgAnXwixikhgKUIyAg--.4878S4;
        Wed, 10 Mar 2021 17:00:36 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: em28xx: Fix missing check in em28xx_capture_start
Date:   Wed, 10 Mar 2021 17:00:32 +0800
Message-Id: <20210310090032.13477-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgAnXwixikhgKUIyAg--.4878S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KF48JFyDJFyfZFW5AF1xAFb_yoW8XF1xpF
        4vy34rArZYgrn0vr1DJrs8Zr15Ga1ktFW2kry7G342gr1rCFsrKw4aqa18urs0kFyS9FZx
        trW8t34akrWjvF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkI1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
        GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
        6cx26r4fKr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgUTBlZdtSrQTAALsR
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several em28xx_write_reg() and em28xx_write_reg_bits()
calls that we have caught their return values but lack further
handling. Check and return error on failure just like other calls
in em28xx_capture_start().

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/media/usb/em28xx/em28xx-core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 584fa400cd7d..2563275fec8e 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -661,6 +661,8 @@ int em28xx_capture_start(struct em28xx *dev, int start)
 						   EM2874_R5F_TS_ENABLE,
 						   start ? EM2874_TS2_CAPTURE_ENABLE : 0x00,
 						   EM2874_TS2_CAPTURE_ENABLE | EM2874_TS2_FILTER_ENABLE | EM2874_TS2_NULL_DISCARD);
+		if (rc < 0)
+			return rc;
 	} else {
 		/* FIXME: which is the best order? */
 		/* video registers are sampled by VREF */
@@ -670,8 +672,11 @@ int em28xx_capture_start(struct em28xx *dev, int start)
 			return rc;
 
 		if (start) {
-			if (dev->is_webcam)
+			if (dev->is_webcam) {
 				rc = em28xx_write_reg(dev, 0x13, 0x0c);
+				if (rc < 0)
+					return rc;
+			}
 
 			/* Enable video capture */
 			rc = em28xx_write_reg(dev, 0x48, 0x00);
@@ -693,6 +698,8 @@ int em28xx_capture_start(struct em28xx *dev, int start)
 		} else {
 			/* disable video capture */
 			rc = em28xx_write_reg(dev, EM28XX_R12_VINENABLE, 0x27);
+			if (rc < 0)
+				return rc;
 		}
 	}
 
-- 
2.17.1

