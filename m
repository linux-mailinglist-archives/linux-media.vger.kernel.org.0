Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA87E167823
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:46:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732546AbgBUIqs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:46:48 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56623 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729567AbgBUIql (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:46:41 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 53xEjunXDPKvK53xHjhWWG; Fri, 21 Feb 2020 09:46:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582274800; bh=O7jgYuGfAnKmBteKeix1dNFCsEIyToRc5U4bcG07CAs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=GW6MTCGZQ7qVKpFSuX2/Wis64xM2coOVbKDKp0uFyllizz0lrAbyCYCyY8EfAa3wH
         etQS150I8dFdOXXlUmkztKeyphWUuXR0Ek4ty51e4apzUCV6OBbS+2UtRbyKbJtRmo
         89xMsqTHDfZ1CpwqP9X0w1ab3rDYsdBohvKkwLQ8g/uKQtYo9Jj0vZmQ2GxcoKdKlQ
         gbMTKeltLyjVwGZna+LoEr4DejB0HnjQ7PWetZWgWO0sUHIcrp014Vg38gHyqN7Nb3
         UR/hfhOz67FEtpfECn2n76zupXhQeWl6qE8sYQTtgihfRjZ0JDA8Rhf4qOLT0/xyv4
         EOknWMXIhXGwA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 6/9] mx2_emmaprp: drop VB2_USERPTR
Date:   Fri, 21 Feb 2020 09:45:28 +0100
Message-Id: <20200221084531.576156-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfO7GlvQYMSL3MXpQ22kDKPL4eYxS2tdiyqRWr9VUDSTGtnwKTjpOhmLvBLlcbeerwSN2n1GCZrlmlbL3+a4Ixldw95R+RKBpfWqU4M/v0L1PJh1nCqA7
 BeCkt2g+WHPiGJyWIjEuEYrqxMyqBquZ4bjaLeHKYvKtii3ggCsNW5lwiZRWdTCw5Hd1smhRTMBqYsIwSm+8MG7Rqu/q+GAcZn2MziCNma2QQWveBZQck5Oe
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The combination of VB2_USERPTR and dma-contig makes no sense for
this device, drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/mx2_emmaprp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mx2_emmaprp.c b/drivers/media/platform/mx2_emmaprp.c
index 27779b75df54..832871c08a21 100644
--- a/drivers/media/platform/mx2_emmaprp.c
+++ b/drivers/media/platform/mx2_emmaprp.c
@@ -688,7 +688,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	int ret;
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	src_vq->ops = &emmaprp_qops;
@@ -702,7 +702,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 		return ret;
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->ops = &emmaprp_qops;
-- 
2.25.0

