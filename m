Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7A6BA7EC2
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 11:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbfIDJEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 05:04:13 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:55389 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727348AbfIDJEN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Sep 2019 05:04:13 -0400
Received: from [IPv6:2001:420:44c1:2579:89b1:cff7:3961:1f3f] ([IPv6:2001:420:44c1:2579:89b1:cff7:3961:1f3f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 5RCyi5WhKMK4h5RD1iCmiJ; Wed, 04 Sep 2019 11:04:12 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.3] videobuf-core.c: poll_wait needs a non-NULL buf
 pointer
Message-ID: <f60c12ef-5015-c6e1-ed1b-e9d8ca98a593@xs4all.nl>
Date:   Wed, 4 Sep 2019 11:04:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIpGoDXWxuH+bY1piwdWUAFLi/m9avsHqBsiaVdRiljwRioAVjeOzR3fM+750hrko6Q5vDTmOp/edT60hJ2ahyXufGdFjv3EmU4vxAUD2lRmEI5CoGtV
 UoAwI/gLZZ7MMDJeJvsaSWy4Q06r5qemkGf3yXbd9HWurilUje5dQWjiDijLq8QJpE8N5wuK8cFkv+o4gr54dVQO1zxXRvPaHMNiOAfrSS2nar3oxVrJ0MSn
 EpDzWxW34q0FcaDJj3qzrVmMMPGMOmu/ghgUg4/59mBTLpHqqem43y4xdAw3CThO2tMwjaHI6DbDUw64GltgYARpU47uBEdYqRVeyfpI9YE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

poll_wait uses &buf->done, but buf is NULL. Move the poll_wait to later
in the function once buf is correctly set and only call it if it is
non-NULL.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: bb436cbeb918 ("media: videobuf: fix epoll() by calling poll_wait first")
Cc: <stable@vger.kernel.org>      # for v5.1 and up
---
diff --git a/drivers/media/v4l2-core/videobuf-core.c b/drivers/media/v4l2-core/videobuf-core.c
index 7ef3e4d22bf6..939fc11cf080 100644
--- a/drivers/media/v4l2-core/videobuf-core.c
+++ b/drivers/media/v4l2-core/videobuf-core.c
@@ -1123,7 +1123,6 @@ __poll_t videobuf_poll_stream(struct file *file,
 	struct videobuf_buffer *buf = NULL;
 	__poll_t rc = 0;

-	poll_wait(file, &buf->done, wait);
 	videobuf_queue_lock(q);
 	if (q->streaming) {
 		if (!list_empty(&q->stream))
@@ -1143,7 +1142,9 @@ __poll_t videobuf_poll_stream(struct file *file,
 		}
 		buf = q->read_buf;
 	}
-	if (!buf)
+	if (buf)
+		poll_wait(file, &buf->done, wait);
+	else
 		rc = EPOLLERR;

 	if (0 == rc) {
