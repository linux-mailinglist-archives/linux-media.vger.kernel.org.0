Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E32F3A3654
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 23:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbhFJVrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 17:47:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:54422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231133AbhFJVrH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 17:47:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAC1F6140F;
        Thu, 10 Jun 2021 21:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623361510;
        bh=tz069tuRpzth1vlbMNt9axrP0H788thSG4v+resSSzw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IqGg0QY8sX1gf0wW5kx1E6zk593P329ORLqjBhG67WEjlEjOxpOXt/PvLbchaoxI8
         Rv6tIzX+Kmh5empIUW549zJv2EaSljupeMdn03G+2Hrpd7EHocUV3rcZtIxXs6d6B5
         rBo+At1f5cQSHOe3tO/bria5JtD9Wizm8QAoal9kTg3zLBmMs/OOLOBvQKUZ8WvfyD
         F3RuKVn11qgyl+1EQtzDtw/O0ryEiXSmYoqQa64auKu5C6SlSyOH5t2VErzh+yv2jS
         ynzGUTn9xmKdTlFrK+6mq8EMiVh3E61V52MEyNT/CTLFYI6XSjbccxJznZwDkKu4ZP
         gMvFzoiNzM6tg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 6/7] media: subdev: fix compat_ioctl32
Date:   Thu, 10 Jun 2021 23:43:04 +0200
Message-Id: <20210610214305.4170835-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610214305.4170835-1-arnd@kernel.org>
References: <20210610214305.4170835-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The adv7842 and si4713 drivers each define one private ioctl command that
are handled through the subdev_ioctl() helpers, but that don't work in
compat mode because this does not handle private ioctl commands.

The compat_ioctl32 callback for subdevs has outdated calling conventions,
but as there are no users of that, it is easy to change the function
pointer type and the caller to make it behave the same way as the normal
ioctl callback and hook in the two drivers that need no argument
conversion.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/i2c/adv7842.c           |  3 +++
 drivers/media/radio/si4713/si4713.c   |  3 +++
 drivers/media/v4l2-core/v4l2-subdev.c | 19 ++++++++++++++++---
 include/media/v4l2-subdev.h           |  3 +--
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 78e61fe6f2f0..cd6df4f52f33 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3293,6 +3293,9 @@ static const struct v4l2_ctrl_ops adv7842_ctrl_ops = {
 static const struct v4l2_subdev_core_ops adv7842_core_ops = {
 	.log_status = adv7842_log_status,
 	.ioctl = adv7842_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl32 = adv7842_ioctl,
+#endif
 	.interrupt_service_routine = adv7842_isr,
 	.subscribe_event = adv7842_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si4713/si4713.c
index adbf43ff6a21..ae7e477774e3 100644
--- a/drivers/media/radio/si4713/si4713.c
+++ b/drivers/media/radio/si4713/si4713.c
@@ -1398,6 +1398,9 @@ static const struct v4l2_ctrl_ops si4713_ctrl_ops = {
 
 static const struct v4l2_subdev_core_ops si4713_subdev_core_ops = {
 	.ioctl		= si4713_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl32	= si4713_ioctl,
+#endif
 };
 
 static const struct v4l2_subdev_tuner_ops si4713_subdev_tuner_ops = {
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index bf3aa9252458..fbd176d6c415 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -686,13 +686,26 @@ static long subdev_ioctl(struct file *file, unsigned int cmd,
 }
 
 #ifdef CONFIG_COMPAT
-static long subdev_compat_ioctl32(struct file *file, unsigned int cmd,
-	unsigned long arg)
+static long subdev_do_compat_ioctl32(struct file *file, unsigned int cmd, void *arg)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
+	struct mutex *lock = vdev->lock;
+	long ret = -ENODEV;
 
-	return v4l2_subdev_call(sd, core, compat_ioctl32, cmd, arg);
+	if (lock && mutex_lock_interruptible(lock))
+		return -ERESTARTSYS;
+	if (video_is_registered(vdev))
+		ret = v4l2_subdev_call(sd, core, compat_ioctl32, cmd, arg);
+	if (lock)
+		mutex_unlock(lock);
+	return ret;
+}
+
+static long subdev_compat_ioctl32(struct file *file, unsigned int cmd,
+	unsigned long arg)
+{
+	return video_usercopy(file, cmd, arg, subdev_do_compat_ioctl32);
 }
 #endif
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d0e9a5bdb08b..42aa1f6c7c3f 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -195,8 +195,7 @@ struct v4l2_subdev_core_ops {
 	int (*s_gpio)(struct v4l2_subdev *sd, u32 val);
 	long (*ioctl)(struct v4l2_subdev *sd, unsigned int cmd, void *arg);
 #ifdef CONFIG_COMPAT
-	long (*compat_ioctl32)(struct v4l2_subdev *sd, unsigned int cmd,
-			       unsigned long arg);
+	long (*compat_ioctl32)(struct v4l2_subdev *sd, unsigned int cmd, void *arg);
 #endif
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	int (*g_register)(struct v4l2_subdev *sd, struct v4l2_dbg_register *reg);
-- 
2.29.2

