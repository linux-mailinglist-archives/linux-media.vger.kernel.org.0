Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2804834B572
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 09:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbhC0I0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 04:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhC0I02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 04:26:28 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB458C0613B1;
        Sat, 27 Mar 2021 01:26:23 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i26so11140577lfl.1;
        Sat, 27 Mar 2021 01:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HXMWNDQbMJC2pNLyvsUAp1+hk7Pgd2JKUMYOKTb8v3Q=;
        b=SvrZTJXvdEocuHaG+xo/n05ji5C+L+4JwDc/e6O/Fogmbj5mmtIObBtdz8lKeGBjb6
         n0V3B8ah2oW/a8ZfX/tKbZjMq+KXsrh3fidAFwkJew6al256wsyazbXvV2fwXVz1BKLe
         w/g4lxYxupNR/Uf9/5dvnhTs7yk1ydKoI5k+/0vXJGEChJ4LbRdubd/vxGcIqh/G9mY9
         A48OfCBLcteraN1ax5YerK6JaeTz84TVN2d22zzuvrva/9AiUZOxmzAyNlP2/18Z84kS
         qoHJkQ3oDczTstEOnxxJTyXzGvl4A6k3wJWsEgoAtH+htyBkkUJrrwypAprOwnqFxALd
         zIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HXMWNDQbMJC2pNLyvsUAp1+hk7Pgd2JKUMYOKTb8v3Q=;
        b=iLMvfcJdoqjYsAkFvxoWX0UEL1k+0ZU1Smsmt40K8yTszQg6cwP5sxr4sgZY7f5rKI
         wMH77Uym8ioG9OBfKUzxw2F8Y50fTk9O6kQE0nDFsbAGcbGEVYtWItHS7Xn8uiWRyKte
         RgmHba7860vb+6zEwN6/TyUcSFvwnEJflUQVdkR8EBTq3hksaDl7Rp8rHpIVEaWu26gk
         IiGQsnuWpB66t/8BZ/KodDz5j9RY2+VAX6Cfg2U4W1toMXN8+rW4EbdrhcvrBq8Nm9Q5
         xOZSGSFo0Mmc/UNnLHjobiFHWVVgCPFMVAJZ9MyurzIS2zzIeIqcnX7L/ShcWsuQEXTR
         VLnQ==
X-Gm-Message-State: AOAM532pc534UMChN7PJGGKbgEmvoI2VQem6R3SunDOaAMXRTRS9rray
        Fq/gxr9jdpNNWpF03X9ACsE329ZPKgmB4WQC
X-Google-Smtp-Source: ABdhPJwptqqbv2/oyazFu0X1cKjhZNZnSUk34ThRMcqN2NwF50QpRWdQPBNmtYdgbggQ48NPGg/A3g==
X-Received: by 2002:a05:6512:3390:: with SMTP id h16mr10875452lfg.479.1616833582353;
        Sat, 27 Mar 2021 01:26:22 -0700 (PDT)
Received: from localhost.localdomain ([94.103.227.42])
        by smtp.gmail.com with ESMTPSA id 21sm1126966lfh.231.2021.03.27.01.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 01:26:21 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+889397c820fa56adf25d@syzkaller.appspotmail.com
Subject: [PATCH] media: usb: fix memory leak in em28xx_dvb_init
Date:   Sat, 27 Mar 2021 11:26:13 +0300
Message-Id: <20210327082613.4702-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot reported memory leak in em28xx_dvb_init()[1]
The problem was in wrong error handling after em28xx_alloc_urbs()[2] call.
In case of error allocated urbs must be freed

  backtrace:
    [<ffffffff8304c141>] kmalloc_array.constprop.0+0x41/0x60 include/linux/slab.h:594
    [<ffffffff8304dba2>] kcalloc include/linux/slab.h:623 [inline]
    [<ffffffff8304dba2>] em28xx_alloc_urbs+0x102/0x550 drivers/media/usb/em28xx/em28xx-core.c:930 [2]
    [<ffffffff84279fa7>] em28xx_dvb_init drivers/media/usb/em28xx/em28xx-dvb.c:1517 [inline]	  [1]
    [<ffffffff84279fa7>] em28xx_dvb_init.cold+0xa3/0x2bb1 drivers/media/usb/em28xx/em28xx-dvb.c:1483
    [<ffffffff8304e33b>] em28xx_init_extension+0x9b/0xe0 drivers/media/usb/em28xx/em28xx-core.c:1126
    [<ffffffff83050143>] request_module_async+0x33/0x40 drivers/media/usb/em28xx/em28xx-cards.c:3406
    [<ffffffff81259229>] process_one_work+0x2c9/0x600 kernel/workqueue.c:2275
    [<ffffffff81259dbb>] process_scheduled_works kernel/workqueue.c:2337 [inline]
    [<ffffffff81259dbb>] worker_thread+0x2fb/0x5d0 kernel/workqueue.c:2426
    [<ffffffff81261228>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<ffffffff8100227f>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

Reported-by: syzbot+889397c820fa56adf25d@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-dvb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 526424279637..471bd74667e3 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -2010,6 +2010,7 @@ static int em28xx_dvb_init(struct em28xx *dev)
 	return result;
 
 out_free:
+	em28xx_uninit_usb_xfer(dev, EM28XX_DIGITAL_MODE);
 	kfree(dvb);
 	dev->dvb = NULL;
 	goto ret;
-- 
2.30.2

