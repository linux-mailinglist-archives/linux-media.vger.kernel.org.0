Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88AF834683B
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 19:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbhCWS5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 14:57:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53498 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbhCWS5W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 14:57:22 -0400
Received: from localhost.localdomain (unknown [IPv6:2804:14d:72b1:8920:9d72:75bc:e42b:f19e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 36BD41F45395;
        Tue, 23 Mar 2021 18:57:19 +0000 (GMT)
From:   daniel.almeida@collabora.com
To:     ezequiel@collabora.com
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
        Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH] rkvdec: Do not require all controls to be present in every request
Date:   Tue, 23 Mar 2021 15:57:09 -0300
Message-Id: <20210323185709.199114-1-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel Almeida <daniel.almeida@collabora.com>

According to the v4l2 api, it is allowed to skip
setting a control if its contents haven't changed for performance
reasons: userspace should only update the controls that changed from
last frame rather then updating them all. Still some ancient code
that checks for mandatory controls has been left in this driver.

Remove it.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 48 +--------------------------
 drivers/staging/media/rkvdec/rkvdec.h |  1 -
 2 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d3eb81ee8dc2..5f0219d117fb 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -55,16 +55,13 @@ static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
 
 static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 	{
-		.mandatory = true,
 		.cfg.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
 	},
 	{
-		.mandatory = true,
 		.cfg.id = V4L2_CID_STATELESS_H264_SPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
 	},
 	{
-		.mandatory = true,
 		.cfg.id = V4L2_CID_STATELESS_H264_PPS,
 	},
 	{
@@ -585,25 +582,7 @@ static const struct vb2_ops rkvdec_queue_ops = {
 
 static int rkvdec_request_validate(struct media_request *req)
 {
-	struct media_request_object *obj;
-	const struct rkvdec_ctrls *ctrls;
-	struct v4l2_ctrl_handler *hdl;
-	struct rkvdec_ctx *ctx = NULL;
-	unsigned int count, i;
-	int ret;
-
-	list_for_each_entry(obj, &req->objects, list) {
-		if (vb2_request_object_is_buffer(obj)) {
-			struct vb2_buffer *vb;
-
-			vb = container_of(obj, struct vb2_buffer, req_obj);
-			ctx = vb2_get_drv_priv(vb->vb2_queue);
-			break;
-		}
-	}
-
-	if (!ctx)
-		return -EINVAL;
+	unsigned int count;
 
 	count = vb2_request_buffer_cnt(req);
 	if (!count)
@@ -611,31 +590,6 @@ static int rkvdec_request_validate(struct media_request *req)
 	else if (count > 1)
 		return -EINVAL;
 
-	hdl = v4l2_ctrl_request_hdl_find(req, &ctx->ctrl_hdl);
-	if (!hdl)
-		return -ENOENT;
-
-	ret = 0;
-	ctrls = ctx->coded_fmt_desc->ctrls;
-	for (i = 0; ctrls && i < ctrls->num_ctrls; i++) {
-		u32 id = ctrls->ctrls[i].cfg.id;
-		struct v4l2_ctrl *ctrl;
-
-		if (!ctrls->ctrls[i].mandatory)
-			continue;
-
-		ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl, id);
-		if (!ctrl) {
-			ret = -ENOENT;
-			break;
-		}
-	}
-
-	v4l2_ctrl_request_hdl_put(hdl);
-
-	if (ret)
-		return ret;
-
 	return vb2_request_validate(req);
 }
 
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
index 77a137cca88e..52ac3874c5e5 100644
--- a/drivers/staging/media/rkvdec/rkvdec.h
+++ b/drivers/staging/media/rkvdec/rkvdec.h
@@ -25,7 +25,6 @@
 struct rkvdec_ctx;
 
 struct rkvdec_ctrl_desc {
-	u32 mandatory : 1;
 	struct v4l2_ctrl_config cfg;
 };
 
-- 
2.31.0

