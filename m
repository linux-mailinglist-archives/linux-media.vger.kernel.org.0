Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F07E2453C7
	for <lists+linux-media@lfdr.de>; Sun, 16 Aug 2020 00:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbgHOWFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 18:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbgHOVuw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:50:52 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6B9C08EAD2
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2020 03:37:58 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id CC80829A955
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 05/14] media: staging: rkisp1: params: upon stream stop, iterate a local list to return the buffers
Date:   Sat, 15 Aug 2020 12:37:25 +0200
Message-Id: <20200815103734.31153-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code in '.stop_streaming' callback releases and acquire the lock
at each iteration when returning the buffers.
Holding the lock disables interrupts so it should be minimized.
To make the code cleaner and still minimize holding the lock,
the buffer list is first moved to a local list and
then can be iterated without the lock.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 31 +++++++-------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 0c2bb2eefb22..6a76c586e916 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1477,32 +1477,23 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 {
 	struct rkisp1_params *params = vq->drv_priv;
 	struct rkisp1_buffer *buf;
+	struct list_head tmp_list;
 	unsigned long flags;
-	unsigned int i;
 
-	/* stop params input firstly */
+	INIT_LIST_HEAD(&tmp_list);
+
+	/*
+	 * we first move the buffers into a local list 'tmp_list'
+	 * and then we can iterate it and call vb2_buffer_done
+	 * without holding the lock
+	 */
 	spin_lock_irqsave(&params->config_lock, flags);
 	params->is_streaming = false;
+	list_cut_position(&tmp_list, &params->params, params->params.prev);
 	spin_unlock_irqrestore(&params->config_lock, flags);
 
-	for (i = 0; i < RKISP1_ISP_PARAMS_REQ_BUFS_MAX; i++) {
-		spin_lock_irqsave(&params->config_lock, flags);
-		if (!list_empty(&params->params)) {
-			buf = list_first_entry(&params->params,
-					       struct rkisp1_buffer, queue);
-			list_del(&buf->queue);
-			spin_unlock_irqrestore(&params->config_lock,
-					       flags);
-		} else {
-			spin_unlock_irqrestore(&params->config_lock,
-					       flags);
-			break;
-		}
-
-		if (buf)
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-		buf = NULL;
-	}
+	list_for_each_entry(buf, &tmp_list, queue)
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 }
 
 static int
-- 
2.17.1

