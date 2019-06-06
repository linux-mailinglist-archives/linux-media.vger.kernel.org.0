Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7E237863
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 17:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729230AbfFFPpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 11:45:24 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59070 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729185AbfFFPpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 11:45:24 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0B4A327E959
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: [PATCH 3/5] media: mtk-vcodec: Use vb2_get_buffer
Date:   Thu,  6 Jun 2019 12:44:24 -0300
Message-Id: <20190606154426.6899-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606154426.6899-1-ezequiel@collabora.com>
References: <20190606154426.6899-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly introduced vb2_get_buffer API and avoid
accessing buffers in the queue directly.

Cc: Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 2c92ee4f0c8c..a26b7269d6f1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -872,11 +872,17 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 
 err_set_param:
 	for (i = 0; i < q->num_buffers; ++i) {
-		if (q->bufs[i]->state == VB2_BUF_STATE_ACTIVE) {
+		struct vb2_buffer *buf = vb2_get_buffer(q, i);
+
+		/*
+		 * FIXME: This check is not needed as only active buffers
+		 * can be marked as done.
+		 */
+		if (buf->state == VB2_BUF_STATE_ACTIVE) {
 			mtk_v4l2_debug(0, "[%d] id=%d, type=%d, %d -> VB2_BUF_STATE_QUEUED",
 					ctx->id, i, q->type,
-					(int)q->bufs[i]->state);
-			v4l2_m2m_buf_done(to_vb2_v4l2_buffer(q->bufs[i]),
+					(int)buf->state);
+			v4l2_m2m_buf_done(to_vb2_v4l2_buffer(buf),
 					VB2_BUF_STATE_QUEUED);
 		}
 	}
-- 
2.20.1

