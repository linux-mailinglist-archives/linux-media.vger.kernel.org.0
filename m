Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8954A74C
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730040AbfFRQpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60007 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729952AbfFRQpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:44 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-IT; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 09/28] media: coda: implement decoder source change event
Date:   Tue, 18 Jun 2019 18:45:16 +0200
Message-Id: <20190618164535.20162-10-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618164535.20162-1-p.zabel@pengutronix.de>
References: <20190618164535.20162-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The stateful decoder API requires decoders to signal detection
of stream dimensions via the V4L2_EVENT_SOURCE_CHANGE event.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-common.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index f8cfafa2ce42..b30945fa0a70 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1255,9 +1255,16 @@ static int coda_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 static int coda_subscribe_event(struct v4l2_fh *fh,
 				const struct v4l2_event_subscription *sub)
 {
+	struct coda_ctx *ctx = fh_to_ctx(fh);
+
 	switch (sub->type) {
 	case V4L2_EVENT_EOS:
 		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	case V4L2_EVENT_SOURCE_CHANGE:
+		if (ctx->inst_type == CODA_INST_DECODER)
+			return v4l2_event_subscribe(fh, sub, 0, NULL);
+		else
+			return -EINVAL;
 	default:
 		return v4l2_ctrl_subscribe_event(fh, sub);
 	}
@@ -1642,6 +1649,16 @@ void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
 	}
 }
 
+static void coda_queue_source_change_event(struct coda_ctx *ctx)
+{
+	static const struct v4l2_event source_change_event = {
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
+	};
+
+	v4l2_event_queue_fh(&ctx->fh, &source_change_event);
+}
+
 static void coda_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -1696,6 +1713,9 @@ static void coda_buf_queue(struct vb2_buffer *vb)
 					   &ctx->seq_init_work);
 				flush_work(&ctx->seq_init_work);
 			}
+
+			if (ctx->initialized)
+				coda_queue_source_change_event(ctx);
 		}
 	} else {
 		if (ctx->inst_type == CODA_INST_ENCODER &&
-- 
2.20.1

