Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0430269614
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 17:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389010AbfGOOMA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 10:12:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:49246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731005AbfGOOMA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 10:12:00 -0400
Received: from sasha-vm.mshome.net (unknown [73.61.17.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F75D2081C;
        Mon, 15 Jul 2019 14:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563199919;
        bh=UT4WsB0IQkPOZMcLtl1zIP1E1L51EJNRfglmRNz9A4w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gDJtTl1OMJ4p54+tWOcmfQyz1IoO6mR0lS4419KW+zB99zEUtXOzT6xQ6kQguMWa/
         jCayX1nwgZtQEPOXg1ffg+1o6nQjNIZW9PICw89mVZeI0saaFdg5JBa5fJM/8g7bK1
         i+laXWlQ/9Dz27J61B5Max62FbNz4uJbtnOKjai8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Keith Pyle <kpyle@austin.rr.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 137/219] media: hdpvr: fix locking and a missing msleep
Date:   Mon, 15 Jul 2019 10:02:18 -0400
Message-Id: <20190715140341.6443-137-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715140341.6443-1-sashal@kernel.org>
References: <20190715140341.6443-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil@xs4all.nl>

[ Upstream commit 6bc5a4a1927556ff9adce1aa95ea408c95453225 ]

This driver has three locking issues:

- The wait_event_interruptible() condition calls hdpvr_get_next_buffer(dev)
  which uses a mutex, which is not allowed. Rewrite with list_empty_careful()
  that doesn't need locking.

- In hdpvr_read() the call to hdpvr_stop_streaming() didn't lock io_mutex,
  but it should have since stop_streaming expects that.

- In hdpvr_device_release() io_mutex was locked when calling flush_work(),
  but there it shouldn't take that mutex since the work done by flush_work()
  also wants to lock that mutex.

There are also two other changes (suggested by Keith):

- msecs_to_jiffies(4000); (a NOP) should have been msleep(4000).
- Change v4l2_dbg to v4l2_info to always log if streaming had to be restarted.

Reported-by: Keith Pyle <kpyle@austin.rr.com>
Suggested-by: Keith Pyle <kpyle@austin.rr.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/hdpvr/hdpvr-video.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index e082086428a4..ae6609716347 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -439,7 +439,7 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 	/* wait for the first buffer */
 	if (!(file->f_flags & O_NONBLOCK)) {
 		if (wait_event_interruptible(dev->wait_data,
-					     hdpvr_get_next_buffer(dev)))
+					     !list_empty_careful(&dev->rec_buff_list)))
 			return -ERESTARTSYS;
 	}
 
@@ -465,10 +465,17 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 				goto err;
 			}
 			if (!err) {
-				v4l2_dbg(MSG_INFO, hdpvr_debug, &dev->v4l2_dev,
-					"timeout: restart streaming\n");
+				v4l2_info(&dev->v4l2_dev,
+					  "timeout: restart streaming\n");
+				mutex_lock(&dev->io_mutex);
 				hdpvr_stop_streaming(dev);
-				msecs_to_jiffies(4000);
+				mutex_unlock(&dev->io_mutex);
+				/*
+				 * The FW needs about 4 seconds after streaming
+				 * stopped before it is ready to restart
+				 * streaming.
+				 */
+				msleep(4000);
 				err = hdpvr_start_streaming(dev);
 				if (err) {
 					ret = err;
@@ -1133,9 +1140,7 @@ static void hdpvr_device_release(struct video_device *vdev)
 	struct hdpvr_device *dev = video_get_drvdata(vdev);
 
 	hdpvr_delete(dev);
-	mutex_lock(&dev->io_mutex);
 	flush_work(&dev->worker);
-	mutex_unlock(&dev->io_mutex);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
 	v4l2_ctrl_handler_free(&dev->hdl);
-- 
2.20.1

