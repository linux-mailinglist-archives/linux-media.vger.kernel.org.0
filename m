Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC86435BBD9
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 10:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237019AbhDLIOA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 04:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236920AbhDLIN7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 04:13:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C825C061574
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 01:13:42 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BFA63F0;
        Mon, 12 Apr 2021 10:13:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618215220;
        bh=Z/JOpahoeklxi1Mw5cBcVgrKxeoBY08zPqyAOFIKClQ=;
        h=From:To:Cc:Subject:Date:From;
        b=IABj2TFNLUd1UD6SRnLApFBSS4pjHs4MmZ0G51+0KPsKmJ+j8uJf4jEOn0Fm/Uf7n
         r6gWyotGRBWVPGjvYcpcdCKUkvNnszdv7NnhIIhoj33ELjWiRuxA3aR2dnl02OxBKK
         sO+Vth5dhatFsTXhXQGyClXn09eooejXJ+NTwv1E=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] media: videobuf2-v4l2.c: add vb2_queue_change_type() helper
Date:   Mon, 12 Apr 2021 11:12:55 +0300
Message-Id: <20210412081255.104788-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On some platforms a video device can capture either video data or
metadata. The driver can implement vidioc functions for both video and
metadata, and use a single vb2_queue for the buffers. However, vb2_queue
requires choosing a single buffer type, which conflicts with the idea of
capturing either video or metadata.

The buffer type of vb2_queue can be changed, but it's not obvious how
this should be done in the drivers. To help this, add a new helper
function vb2_queue_change_type() which ensures the correct checks and
documents how it can be used.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 14 ++++++++++++++
 include/media/videobuf2-v4l2.h                  | 15 +++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 7e96f67c60ba..2988bb38ceb1 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -939,6 +939,20 @@ void vb2_queue_release(struct vb2_queue *q)
 }
 EXPORT_SYMBOL_GPL(vb2_queue_release);
 
+int vb2_queue_change_type(struct vb2_queue *q, unsigned int type)
+{
+	if (type == q->type)
+		return 0;
+
+	if (vb2_is_busy(q))
+		return -EBUSY;
+
+	q->type = type;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vb2_queue_change_type);
+
 __poll_t vb2_poll(struct vb2_queue *q, struct file *file, poll_table *wait)
 {
 	struct video_device *vfd = video_devdata(file);
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index c203047eb834..3e604c1b5e1b 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -261,6 +261,21 @@ int __must_check vb2_queue_init_name(struct vb2_queue *q, const char *name);
  */
 void vb2_queue_release(struct vb2_queue *q);
 
+/**
+ * vb2_queue_change_type() - change the type of an inactive vb2_queue
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue.
+ *
+ * This function changes the type of the vb2_queue. This is only possible
+ * if the queue is not busy (i.e. no buffers have been queued).
+ *
+ * vb2_queue_change_type() can be used to support multiple buffer types using
+ * the same queue. The driver can implement v4l2_ioctl_ops.vidioc_reqbufs and
+ * v4l2_ioctl_ops.vidioc_create_bufs functions and call vb2_queue_change_type()
+ * before calling vb2_ioctl_reqbufs() or vb2_ioctl_create_bufs(), and thus
+ * "lock" the buffer type until the buffers have been released.
+ */
+int vb2_queue_change_type(struct vb2_queue *q, unsigned int type);
+
 /**
  * vb2_poll() - implements poll userspace operation
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
-- 
2.25.1

