Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87E923F78D
	for <lists+linux-media@lfdr.de>; Sat,  8 Aug 2020 14:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgHHMbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Aug 2020 08:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgHHMbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Aug 2020 08:31:33 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9A8C061756
        for <linux-media@vger.kernel.org>; Sat,  8 Aug 2020 05:31:33 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 4EAE1C638E; Sat,  8 Aug 2020 13:31:23 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     syzbot+ceef16277388d6f24898@syzkaller.appspotmail.com,
        Hillf Danton <hdanton@sina.com>
Subject: [PATCH 1/2] media: rc: uevent sysfs file races with rc_register_device()
Date:   Sat,  8 Aug 2020 13:31:22 +0100
Message-Id: <20200808123123.1804-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only report uevent file contents if device still exists, else we might
read freed memory.

Reported-by: syzbot+ceef16277388d6f24898@syzkaller.appspotmail.com
Cc: Hillf Danton <hdanton@sina.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-main.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 7b53066d9d07..503ae4f3dec3 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -1612,6 +1612,12 @@ static int rc_dev_uevent(struct device *device, struct kobj_uevent_env *env)
 {
 	struct rc_dev *dev = to_rc_dev(device);
 
+	mutex_lock(&dev->lock);
+	if (!dev->registered) {
+		mutex_unlock(&dev->lock);
+		return -ENODEV;
+	}
+
 	if (dev->rc_map.name)
 		ADD_HOTPLUG_VAR("NAME=%s", dev->rc_map.name);
 	if (dev->driver_name)
@@ -1619,6 +1625,8 @@ static int rc_dev_uevent(struct device *device, struct kobj_uevent_env *env)
 	if (dev->device_name)
 		ADD_HOTPLUG_VAR("DEV_NAME=%s", dev->device_name);
 
+	mutex_unlock(&dev->lock);
+
 	return 0;
 }
 
@@ -2011,14 +2019,14 @@ void rc_unregister_device(struct rc_dev *dev)
 	del_timer_sync(&dev->timer_keyup);
 	del_timer_sync(&dev->timer_repeat);
 
-	rc_free_rx_device(dev);
-
 	mutex_lock(&dev->lock);
 	if (dev->users && dev->close)
 		dev->close(dev);
 	dev->registered = false;
 	mutex_unlock(&dev->lock);
 
+	rc_free_rx_device(dev);
+
 	/*
 	 * lirc device should be freed with dev->registered = false, so
 	 * that userspace polling will get notified.
-- 
2.26.2

