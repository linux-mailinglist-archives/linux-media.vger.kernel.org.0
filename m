Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97FC84CD0F
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 13:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfFTLno (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 07:43:44 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:55327 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726392AbfFTLno (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 07:43:44 -0400
Received: from [IPv6:2001:983:e9a7:1:4588:eede:a2a7:f8e] ([IPv6:2001:983:e9a7:1:4588:eede:a2a7:f8e])
        by smtp-cloud9.xs4all.net with ESMTPA
        id dvThhaHkESfvXdvTihuhId; Thu, 20 Jun 2019 13:43:42 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Keith Pyle <kpyle@austin.rr.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] hdpvr: fix locking and a missing msleep
Message-ID: <62ff556b-cc69-bcd0-b81d-06e4bdd0f7ff@xs4all.nl>
Date:   Thu, 20 Jun 2019 13:43:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFJI0gCQ7KzJpqv5V6/SzCwPbzR4qRSFsMcLDGZsj5nLqtNcFtz7nqaQtV2PL0rTJywNi4ffuRhIQ0GuRDthfl6A9zqomULXf9MkCZf61Q/QTF1xqndp
 RuC25wL5pIGtf4daWIY4w3+tuXI7Fc/Z6wCtX42t0DUE8RyoVNzprNYRqKvyvX3pL52W2JoyhGsBNEpirUOZrQvXY1x7pHpukoK36i517nFGh2DaJ2fKmtD9
 Yn9CFIJi2iEPBaFqz47kaacN1fmTBpqeH+FSF9l5jysOuxHAlpXgZzw48Za3EsAKypLc3EY2ChPIsOM0z9sivw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
---
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 3786ddcc0d18..5b3e67b80627 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -435,7 +435,7 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 	/* wait for the first buffer */
 	if (!(file->f_flags & O_NONBLOCK)) {
 		if (wait_event_interruptible(dev->wait_data,
-					     hdpvr_get_next_buffer(dev)))
+					     !list_empty_careful(&dev->rec_buff_list)))
 			return -ERESTARTSYS;
 	}

@@ -461,10 +461,17 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
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
@@ -1124,9 +1131,7 @@ static void hdpvr_device_release(struct video_device *vdev)
 	struct hdpvr_device *dev = video_get_drvdata(vdev);

 	hdpvr_delete(dev);
-	mutex_lock(&dev->io_mutex);
 	flush_work(&dev->worker);
-	mutex_unlock(&dev->io_mutex);

 	v4l2_device_unregister(&dev->v4l2_dev);
 	v4l2_ctrl_handler_free(&dev->hdl);
