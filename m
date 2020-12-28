Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A742E6777
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 17:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437321AbgL1QZS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Dec 2020 11:25:18 -0500
Received: from mail.zju.edu.cn ([61.164.42.155]:45116 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731173AbgL1NJv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 08:09:51 -0500
X-Greylist: delayed 396 seconds by postgrey-1.27 at vger.kernel.org; Mon, 28 Dec 2020 08:09:43 EST
Received: from localhost.localdomain (unknown [222.205.25.254])
        by mail-app4 (Coremail) with SMTP id cS_KCgBnIzhO1+lfx9EiAA--.57389S4;
        Mon, 28 Dec 2020 21:02:10 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: em28xx: Fix use-after-free in em28xx_alloc_urbs
Date:   Mon, 28 Dec 2020 21:02:05 +0800
Message-Id: <20201228130205.14381-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgBnIzhO1+lfx9EiAA--.57389S4
X-Coremail-Antispam: 1UD129KBjvdXoWrKF1ftrWUJFyxXw15Ary7Wrg_yoWkCrb_Cr
        4UXrW7Xr1rJ3Z3Xw1DGw1Yyr9Fyr43Xr4xWFyrtas5GryUKa4jg3Z8Wrn3GanrZasrZw15
        Xr1qqF4q9rn8CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbI8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4UJVW0owA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
        GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Xr4l42xK82IYc2Ij64vIr41l
        42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
        twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AK
        xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
        fUnpnQUUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgYEBlZdtRrnPgAesl
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When kzalloc() fails, em28xx_uninit_usb_xfer() will free
usb_bufs->buf and set it to NULL. Thus the later access
to usb_bufs->buf[i] will lead to null pointer dereference.
Also the kfree(usb_bufs->buf) after that is redundant.

Fixes: d571b592c6206 ("media: em28xx: don't use coherent buffer for DMA transfers")
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/media/usb/em28xx/em28xx-core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index e6088b5d1b80..3daa64bb1e1d 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -956,14 +956,10 @@ int em28xx_alloc_urbs(struct em28xx *dev, enum em28xx_mode mode, int xfer_bulk,
 
 		usb_bufs->buf[i] = kzalloc(sb_size, GFP_KERNEL);
 		if (!usb_bufs->buf[i]) {
-			em28xx_uninit_usb_xfer(dev, mode);
-
 			for (i--; i >= 0; i--)
 				kfree(usb_bufs->buf[i]);
 
-			kfree(usb_bufs->buf);
-			usb_bufs->buf = NULL;
-
+			em28xx_uninit_usb_xfer(dev, mode);
 			return -ENOMEM;
 		}
 
-- 
2.17.1

