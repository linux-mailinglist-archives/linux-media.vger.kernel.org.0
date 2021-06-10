Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE59D3A2A6A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhFJLi1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:38:27 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:34243 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230462AbhFJLiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:38:22 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rIytl7kZmhqltrIz2lXjUJ; Thu, 10 Jun 2021 13:36:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623324984; bh=ptsFKwpuKbhad0oZGzrE1ORA6VZ/UIUPOLhGW1LXXW0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=SQfxKfbSKsj9a6QSVneScS1jnbTBva0sssoRAwJEfKQfBN9fRml1kpgJ1f2fDbN/F
         pOzx1DmuFIc0ZjzOXc8A/mV7UogUR7Z0rSF22v5TkYM3GuGsm/b3XVoxPfIz0bz1Rt
         I8KCYPwy860CBe3JICtd8qR4TdyiTCDOKvjeTc6LZVy6eZdNvWe+1QSnIf++5AD8//
         Cq6mnqrx319yjlgJx3rCFsiAs+OZzKxJ110HuxgZlVWhbmWbYzcNxlkh4QsC3QtOcA
         BvDPsltxD55JpMf8QU53biloTwhJrC+D687ptAMqhkvxLtmOpRqVx4z4CO+lmFvfQ2
         POs4k/sgq0EIA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCHv2 10/11] vim2m: support read-only requests on the capture queue
Date:   Thu, 10 Jun 2021 13:36:14 +0200
Message-Id: <20210610113615.785359-11-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPnmug6ZXHlb/ZvmC4vbNHpxD73xFb4M0tsprMr6EdAuDd6oNWZt2PXVubXtTOyCb/7VEbxIceoKE0V2AfbWJPh9otbmfksO3D/oXia8aoOXFDH8ic97
 4tbXpucSAudlbehnxYyTSy42Jbr5n3ywcjq+0WLAAeSno+XW7IpFee8wqdTQlWwc7MfSSF0CCrEuuqzrYU1c18DJ5iixB4V78OH/jewuA/vpb53SvEU2JypW
 YQD07JXW85ijiW9dWVf7G/7LSIS2vO5pf+SsJXchHjqhjv70U+Q7crbvrkKE5JR9aJMFO1vsWkykfvKPIXZq4MD+B8JpH0Pel2U1/LS9tSkjtdWXcUGIJ2vc
 tMlf7ZqBUjOquByjzzQpkua+L+BIwfTQSLRBVtMZ+Q+vLN2c7bKwiFvxDnCxyt9mICqMxYBI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added support for read-only requests on the capture queue
in order to test this feature.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vim2m.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index d714fe50afe5..8bd794a19629 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -602,7 +602,11 @@ static void device_run(void *priv)
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	/* Apply request controls if any */
+	/*
+	 * Apply request controls if any.
+	 * The dst_buf queue has read-only requests, so no need to
+	 * setup any controls for that buffer.
+	 */
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->hdl);
 
@@ -611,6 +615,8 @@ static void device_run(void *priv)
 	/* Complete request controls if any */
 	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
 				   &ctx->hdl);
+	v4l2_ctrl_request_complete(dst_buf->vb2_buf.req_obj.req,
+				   &ctx->hdl);
 
 	/* Run delayed work, which simulates a hardware irq  */
 	schedule_delayed_work(&ctx->work_run, msecs_to_jiffies(ctx->transtime));
@@ -1138,6 +1144,8 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->mem_ops = &vb2_vmalloc_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->vb_mutex;
+	dst_vq->supports_requests = true;
+	dst_vq->supports_ro_requests = true;
 
 	return vb2_queue_init(dst_vq);
 }
-- 
2.30.2

