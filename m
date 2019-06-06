Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68483373D7
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 14:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfFFMLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 08:11:38 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56715 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727418AbfFFMLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 08:11:37 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YrExhzc7c3qlsYrF1hma92; Thu, 06 Jun 2019 14:11:36 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 6/9] vicodec: set KEY/PFRAME flag when decoding
Date:   Thu,  6 Jun 2019 14:11:28 +0200
Message-Id: <20190606121131.37110-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
References: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfF8IrJ5MbVPIR6gyWP7iAau3S6ZwUN5Ek0hxsRNg/O3trIAdxqRi0Nu4U0JbqlsDS30hoWrW+xtaYDDzGiHb5e1yZ4Lon6vV7IApIaa+FvVQ9ZwIkMIr
 WT8FFnl1NcYawcqA9n0SswVWRAWX3Ej/cf0fHkuRKIKpGPfFbenlfa2E6vbgrqqZIyfDltuH5b2mGSL6tlsjHnFfq8EHXNTs4WhdKjYKK0/+AXW/y05Q1qp1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set V4L2_BUF_FLAG_P/KEYFRAME after decoding a frame.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/vicodec/vicodec-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 4bea4a57386d..4b0062ac880c 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -329,6 +329,10 @@ static int device_process(struct vicodec_ctx *ctx,
 			copy_cap_to_ref(p_dst, ctx->state.info, &ctx->state);
 
 		vb2_set_plane_payload(&dst_vb->vb2_buf, 0, q_dst->sizeimage);
+		if (ntohl(ctx->state.header.flags) & FWHT_FL_I_FRAME)
+			dst_vb->flags |= V4L2_BUF_FLAG_KEYFRAME;
+		else
+			dst_vb->flags |= V4L2_BUF_FLAG_PFRAME;
 	}
 	return ret;
 }
@@ -407,7 +411,6 @@ static void device_run(void *priv)
 	u32 state;
 	struct media_request *src_req;
 
-
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 	src_req = src_buf->vb2_buf.req_obj.req;
@@ -421,7 +424,7 @@ static void device_run(void *priv)
 	else
 		dst_buf->sequence = q_dst->sequence++;
 	dst_buf->flags &= ~V4L2_BUF_FLAG_LAST;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, !ctx->is_enc);
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
 
 	ctx->last_dst_buf = dst_buf;
 
-- 
2.20.1

