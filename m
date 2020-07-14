Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7AF521F17B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 14:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbgGNMin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 08:38:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48554 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgGNMin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 08:38:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 938E02A0D19
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 1/4] media: staging: rkisp1: cap: don't set next buffer from rkisp1_vb2_buf_queue
Date:   Tue, 14 Jul 2020 14:38:29 +0200
Message-Id: <20200714123832.28011-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714123832.28011-1-dafna.hirschfeld@collabora.com>
References: <20200714123832.28011-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function 'rkisp1_vb2_buf_queue' sets the next buffer directly
in case the capture is already streaming but no frame yet arrived
from the sensor. This is an optimization that tries to avoid
dropping a frame.
The call atomic_read(&cap->rkisp1->isp.frame_sequence) is used
to check if a frame arrived. Reading the 'frame_sequence' should
be avoided outside irq handlers to avoid race conditions.

This patch removes this optimization. Dropping of the first
frames can be avoided if userspace queues the buffers before
start streaming. If userspace starts queueing buffers
only after calling 'streamon' he risks frame drops anyway.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 793ec884c894..572b0949c81f 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -743,18 +743,7 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
 		     ispbuf->buff_addr[RKISP1_PLANE_CB]);
 
 	spin_lock_irqsave(&cap->buf.lock, flags);
-
-	/*
-	 * If there's no next buffer assigned, queue this buffer directly
-	 * as the next buffer, and update the memory interface.
-	 */
-	if (cap->is_streaming && !cap->buf.next &&
-	    atomic_read(&cap->rkisp1->isp.frame_sequence) == -1) {
-		cap->buf.next = ispbuf;
-		rkisp1_set_next_buf(cap);
-	} else {
-		list_add_tail(&ispbuf->queue, &cap->buf.queue);
-	}
+	list_add_tail(&ispbuf->queue, &cap->buf.queue);
 	spin_unlock_irqrestore(&cap->buf.lock, flags);
 }
 
-- 
2.17.1

