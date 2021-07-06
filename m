Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630873BD674
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 14:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237339AbhGFMdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 08:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240116AbhGFMYx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 08:24:53 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1259C0613B7;
        Tue,  6 Jul 2021 05:15:49 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id p9so795522pjl.3;
        Tue, 06 Jul 2021 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t8B/nC3iwzTJBYhCF0Zlx4z9CIpEdQIQ4kfF+EVdryY=;
        b=IhvAskayk+s8h6vWaMytLpo6Okl7xxG4T+63UvntJBQNO0Pebn4QOdiUBbOOu31k1T
         OoUtIX1t7ONJHxz8y1FSEM+aLNzeQVeklREEGe+SVAw3W+mKDRXiTIUje9gw/tXjauWi
         H+Zy5yXkKNAFvejZn4LPPELAa+VxEpAfY31+59cW5cbxh5YvC/rcodQ+NiYQfTKxsprG
         z7436QqEQDscSeUoBKnPGTbkrezZ+jhrwcOEiAQJpWa2aDFvyrHgVXj/32H+IxPDm0G1
         rsNBc//C+jcteZpM2MpBexntmwlPtKioRqWz/p2an0XRu6biiMOnpoGWXrDzPa8YvTsE
         eOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t8B/nC3iwzTJBYhCF0Zlx4z9CIpEdQIQ4kfF+EVdryY=;
        b=KH0KKFvZ7xmBLGva92G3RL4UceBkjuGnF9kLvr4HsCbeYIXilUyBlqi1bBTdGwr19v
         QCtQts7Ycloqb7X/T4lJB4XonGChnesrS7qyKrt0uef0eO5ARcRTev4n0xgSlVfdsW8U
         JBY0UMUJ1c3qpjFaI4HM3afVGC9C/8Ivs/4iGQClQ2GJ15pfBBODDOtldlhQQKaNzE4+
         d0CM3Ve55QDBD/MIiK7WlTFHEopufeYkVnhpa9RTQXW2cu91orn5VZt6ZlO7BUYVefu4
         6sgXn14WERsgivL4JY0q+urqJDKphLbNMV1w/vmfqkwPx+mQg4e3jRBtZHg5SB59NpOJ
         CRUw==
X-Gm-Message-State: AOAM532rKnjMMeAKJsRzbDdaqnH6YWHvOLWMM79kOXa/xbIUByt0f9Re
        jXvQqjE9ogr3UtHDVJb0hHXoEVEvN/wTplc9
X-Google-Smtp-Source: ABdhPJxy1BMiRChdvYZvP8fbQDWUn9suWXI3HNAWgKPQ/pXtaIt/6Mh/F5J0tVUvykg707mD59dDAQ==
X-Received: by 2002:a17:90a:aa8a:: with SMTP id l10mr20420625pjq.227.1625573749103;
        Tue, 06 Jul 2021 05:15:49 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.93])
        by smtp.gmail.com with ESMTPSA id a31sm18427991pgm.73.2021.07.06.05.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 05:15:48 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Frank=20Sch=C3=A4fer?= <fschaefer.oss@googlemail.com>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [media] em28xx-input: fix refcount bug in em28xx_usb_disconnect
Date:   Tue,  6 Jul 2021 20:15:05 +0800
Message-Id: <20210706121505.641603-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If em28xx_ir_init fails, it would decrease the refcount of dev. However,
in the em28xx_ir_fini, when ir is NULL, it goes to ref_put and decrease
the refcount of dev. This will lead to a refcount bug.

Fix this bug by returning 0 when ir is NULL in the em28xx_ir_fini. To
simplify the refcount issue, move the kref_get after the input
extension is successfully initialized and remove the kref_put in the
error handling code.

refcount_t: underflow; use-after-free.
WARNING: CPU: 0 PID: 7 at lib/refcount.c:28 refcount_warn_saturate+0x18e/0x1a0 lib/refcount.c:28
Modules linked in:
CPU: 0 PID: 7 Comm: kworker/0:1 Not tainted 5.13.0 #3
Workqueue: usb_hub_wq hub_event
RIP: 0010:refcount_warn_saturate+0x18e/0x1a0 lib/refcount.c:28
Call Trace:
  kref_put.constprop.0+0x60/0x85 include/linux/kref.h:69
  em28xx_usb_disconnect.cold+0xd7/0xdc drivers/media/usb/em28xx/em28xx-cards.c:4150
  usb_unbind_interface+0xbf/0x3a0 drivers/usb/core/driver.c:458
  __device_release_driver drivers/base/dd.c:1201 [inline]
  device_release_driver_internal+0x22a/0x230 drivers/base/dd.c:1232
  bus_remove_device+0x108/0x160 drivers/base/bus.c:529
  device_del+0x1fe/0x510 drivers/base/core.c:3540
  usb_disable_device+0xd1/0x1d0 drivers/usb/core/message.c:1419
  usb_disconnect+0x109/0x330 drivers/usb/core/hub.c:2221
  hub_port_connect drivers/usb/core/hub.c:5151 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5440 [inline]
  port_event drivers/usb/core/hub.c:5586 [inline]
  hub_event+0xf81/0x1d40 drivers/usb/core/hub.c:5668
  process_one_work+0x2c9/0x610 kernel/workqueue.c:2276
  process_scheduled_works kernel/workqueue.c:2338 [inline]
  worker_thread+0x333/0x5b0 kernel/workqueue.c:2424
  kthread+0x188/0x1d0 kernel/kthread.c:319
  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
Fixes: 47677e51e2a4 ("[media] em28xx: Only deallocate struct em28xx after finishing all extensions")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-input.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index 59529cbf9cd0..f741be9583a8 100644
--- a/drivers/media/usb/em28xx/em28xx-input.c
+++ b/drivers/media/usb/em28xx/em28xx-input.c
@@ -708,7 +708,6 @@ static int em28xx_ir_init(struct em28xx *dev)
 		return 0;
 	}
 
-	kref_get(&dev->ref);
 	INIT_DELAYED_WORK(&dev->buttons_query_work, em28xx_query_buttons);
 
 	if (dev->board.buttons)
@@ -833,6 +832,9 @@ static int em28xx_ir_init(struct em28xx *dev)
 
 	dev_info(&dev->intf->dev, "Input extension successfully initialized\n");
 
+	/* Only increase refcount when this function is executed successfully */
+	kref_get(&dev->ref);
+
 	return 0;
 
 error:
@@ -842,7 +844,6 @@ static int em28xx_ir_init(struct em28xx *dev)
 	kfree(ir);
 ref_put:
 	em28xx_shutdown_buttons(dev);
-	kref_put(&dev->ref, em28xx_free_device);
 	return err;
 }
 
@@ -861,7 +862,7 @@ static int em28xx_ir_fini(struct em28xx *dev)
 
 	/* skip detach on non attached boards */
 	if (!ir)
-		goto ref_put;
+		return 0;
 
 	rc_unregister_device(ir->rc);
 
@@ -871,7 +872,6 @@ static int em28xx_ir_fini(struct em28xx *dev)
 	kfree(ir);
 	dev->ir = NULL;
 
-ref_put:
 	kref_put(&dev->ref, em28xx_free_device);
 
 	return 0;
-- 
2.25.1

