Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD1ED3BE5AC
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 11:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhGGJhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 05:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhGGJhC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 05:37:02 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19307C061574;
        Wed,  7 Jul 2021 02:34:22 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id u19so747151plc.3;
        Wed, 07 Jul 2021 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7A9IWhxTcjxSny22G7AW0hGs7rwf2yW7az05u+6RoYE=;
        b=ToTv+B8uFC5YwEw4rtqyBh73Hl4yQ2yT1tBgzfI24mm/cDtiAqkhdm2XerNggyR2jg
         d4XAk624sjmg8oJUNa1UifWKEQzLL0w3xwvB+QTCpLiWSWfXj8AqFh+9G7CKgh+41Mvh
         nzNkNPwepYlbIUC/13GMMoMmdnd7KkCeXINGgFIOU1LcTtakXTPHzRGIkqxCKfq2Q0M7
         di1HsUElog9DIolKPtiZ8sHGU0iluUbFwEvCl07ticDhXZK0iimkua5MNIA1Xz8tPFd1
         1okP6/PNKkOkl7CZVPHjLgsv61i8hA2capKLLReIorm2Z1QfXZ48yRpMF0nlpKYO9Uty
         zWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7A9IWhxTcjxSny22G7AW0hGs7rwf2yW7az05u+6RoYE=;
        b=tTRiQWRQce4xJImfLXG0AIGld49bBn+/nqfVF9l0KwNDFreshlYP7zXcwn+4MU4Jmu
         4nEmYfjnzlPak7YDo62a6nT78iHHF46qj4MGesOHdCrmb0lhHR4WzdHtTtU0L26hnkTx
         yJqbIzNdf1VSyk9X6WlTmPIeiGjQZnyWz8nnV+6x6QQioJbVwMwBlK1N0rB4t8b2tNfc
         rpaCpw3oRv4od2DRExHikUWLS403QtIpApZV0FA3K3qvNpKrbS38OM5MDhWT/3MCRk4C
         658R7QSYZrlj00dYHBkN+E6CpFJQdx+moLC5KVKZc/COLim6aD2QYP99Yj1uKIhEMdgk
         OOyQ==
X-Gm-Message-State: AOAM5312vgdkaAm22Nyey9vDHROOy+61BiHpL+R7e4Bs4h16xQgiP/wS
        WlDmXwqUprwzhvStuqMuoIw=
X-Google-Smtp-Source: ABdhPJxkVTYBuRA5pvDPRKa8MeTqNyrY+pxYn1h/pO+GE1+aPGoD+A6eV+VJ5LUY2Og76r8BEOWMcA==
X-Received: by 2002:a17:90a:4cc4:: with SMTP id k62mr24979242pjh.64.1625650461554;
        Wed, 07 Jul 2021 02:34:21 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.27])
        by smtp.gmail.com with ESMTPSA id b65sm19126318pfa.32.2021.07.07.02.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 02:34:21 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] [media] em28xx-input: fix refcount bug in em28xx_usb_disconnect
Date:   Wed,  7 Jul 2021 17:34:09 +0800
Message-Id: <20210707093409.1445747-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If em28xx_ir_init fails, it would decrease the refcount of dev. However,
in the em28xx_ir_fini, when ir is NULL, it goes to ref_put and decrease
the refcount of dev. This will lead to a refcount bug.

Fix this bug by removing the kref_put in the error handling code
of em28xx_ir_init.

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
Fixes: ac5688637144 ("media: em28xx: Fix possible memory leak of em28xx struct")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
v1->v2: move kref_get to the original position
 drivers/media/usb/em28xx/em28xx-input.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index 59529cbf9cd0..0b6d77c3bec8 100644
--- a/drivers/media/usb/em28xx/em28xx-input.c
+++ b/drivers/media/usb/em28xx/em28xx-input.c
@@ -842,7 +842,6 @@ static int em28xx_ir_init(struct em28xx *dev)
 	kfree(ir);
 ref_put:
 	em28xx_shutdown_buttons(dev);
-	kref_put(&dev->ref, em28xx_free_device);
 	return err;
 }
 
-- 
2.25.1

