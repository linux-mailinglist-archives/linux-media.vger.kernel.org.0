Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B2A21F17E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 14:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbgGNMit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 08:38:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48570 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbgGNMis (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 08:38:48 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 32D552A0F1A
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 2/4] media: staging: rkisp1: cap: protect buf.curr and buf.next with buf.lock
Date:   Tue, 14 Jul 2020 14:38:30 +0200
Message-Id: <20200714123832.28011-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714123832.28011-1-dafna.hirschfeld@collabora.com>
References: <20200714123832.28011-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The spinlock buf.lock should protect access to the buffers.
This includes the buffers in buf.queue and also buf.curr and
buf.next. The function 'rkisp1_set_next_buf' access buf.next
therefore it should also be protected with the lock.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 572b0949c81f..fa3eaeac2a00 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -617,10 +617,11 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
 static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
 {
 	struct rkisp1_isp *isp = &cap->rkisp1->isp;
-	struct rkisp1_buffer *curr_buf = cap->buf.curr;
+	struct rkisp1_buffer *curr_buf;
 	unsigned long flags;
 
 	spin_lock_irqsave(&cap->buf.lock, flags);
+	curr_buf = cap->buf.curr;
 
 	if (curr_buf) {
 		curr_buf->vb.sequence = atomic_read(&isp->frame_sequence);
@@ -640,9 +641,9 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
 						 queue);
 		list_del(&cap->buf.next->queue);
 	}
-	spin_unlock_irqrestore(&cap->buf.lock, flags);
 
 	rkisp1_set_next_buf(cap);
+	spin_unlock_irqrestore(&cap->buf.lock, flags);
 }
 
 void rkisp1_capture_isr(struct rkisp1_device *rkisp1)
-- 
2.17.1

