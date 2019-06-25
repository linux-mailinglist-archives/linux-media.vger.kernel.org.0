Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A45755136
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728818AbfFYOLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:11:19 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43411 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729476AbfFYOLR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:11:17 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1hfmAF-00042p-Tq; Tue, 25 Jun 2019 16:11:15 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hfmAF-0007y4-CO; Tue, 25 Jun 2019 16:11:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, pawel@osciak.com, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 1/2] media: vb2: reorder checks in vb2_poll()
Date:   Tue, 25 Jun 2019 16:11:12 +0200
Message-Id: <20190625141113.30301-2-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625141113.30301-1-m.tretter@pengutronix.de>
References: <20190625141113.30301-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When reaching the end of stream, V4L2 clients may expect the
V4L2_EOS_EVENT before being able to dequeue the last buffer, which has
the V4L2_BUF_FLAG_LAST flag set.

If the vb2_poll() function first checks for events and afterwards if
buffers are available, a driver can queue the V4L2_EOS_EVENT event and
return the buffer after the check for events but before the check for
buffers. This causes vb2_poll() to signal that the buffer with
V4L2_BUF_FLAG_LAST can be read without the V4L2_EOS_EVENT being
available.

First, check for available buffers and afterwards for events to ensure
that if vb2_poll() signals POLLIN | POLLRDNORM for the
V4L2_BUF_FLAG_LAST buffer, it also signals POLLPRI for the
V4L2_EOS_EVENT.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 40d76eb4c2fe..5a9ba3846f0a 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -872,17 +872,19 @@ EXPORT_SYMBOL_GPL(vb2_queue_release);
 __poll_t vb2_poll(struct vb2_queue *q, struct file *file, poll_table *wait)
 {
 	struct video_device *vfd = video_devdata(file);
-	__poll_t res = 0;
+	__poll_t res;
+
+	res = vb2_core_poll(q, file, wait);
 
 	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags)) {
 		struct v4l2_fh *fh = file->private_data;
 
 		poll_wait(file, &fh->wait, wait);
 		if (v4l2_event_pending(fh))
-			res = EPOLLPRI;
+			res |= EPOLLPRI;
 	}
 
-	return res | vb2_core_poll(q, file, wait);
+	return res;
 }
 EXPORT_SYMBOL_GPL(vb2_poll);
 
-- 
2.20.1

