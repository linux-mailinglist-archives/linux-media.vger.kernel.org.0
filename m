Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5563D373D3
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 14:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfFFMLh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 08:11:37 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:45055 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726040AbfFFMLg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 08:11:36 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YrExhzc7c3qlsYrF0hma8Z; Thu, 06 Jun 2019 14:11:35 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/9] vicodec: always return a valid format.
Date:   Thu,  6 Jun 2019 14:11:24 +0200
Message-Id: <20190606121131.37110-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
References: <20190606121131.37110-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKtIBrnrPXSVio9cPUc5JB9Ftpx+rBkd7RzCHgtzXD4RR8L2gM0yjVm1hADwzWZIq1xQhT+YMm5f1T+FF5Q7+37T74jyOFE7XpMFoBufC39KsTR1Bhg5
 IK+7IuX4Zh+ohQFt3ocmRlKmO9rEpP/AgBcp4Dhylp/Gew64btiUQx6DpGUD4yr43DP3QMqE7VtOJEgZevDYMGMdFB0a9Rl/7jR5O6KHJWcSzDAfx6ViLdNC
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rather than returning width/height values of 0, just default to
a format. Formats in V4L2 are always supposed to be valid, there
is no concept of an invalid format.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/vicodec/vicodec-core.c | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index 358469f23191..b23d57f50c94 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -1742,11 +1742,13 @@ static const struct v4l2_ctrl_config vicodec_ctrl_stateless_state = {
  */
 static int vicodec_open(struct file *file)
 {
+	const struct v4l2_fwht_pixfmt_info *info = v4l2_fwht_get_pixfmt(0);
 	struct video_device *vfd = video_devdata(file);
 	struct vicodec_dev *dev = video_drvdata(file);
 	struct vicodec_ctx *ctx = NULL;
 	struct v4l2_ctrl_handler *hdl;
-	unsigned int size;
+	unsigned int raw_size;
+	unsigned int comp_size;
 	int rc = 0;
 
 	if (mutex_lock_interruptible(vfd->lock))
@@ -1785,7 +1787,7 @@ static int vicodec_open(struct file *file)
 	v4l2_ctrl_handler_setup(hdl);
 
 	if (ctx->is_enc)
-		ctx->q_data[V4L2_M2M_SRC].info = v4l2_fwht_get_pixfmt(0);
+		ctx->q_data[V4L2_M2M_SRC].info = info;
 	else if (ctx->is_stateless)
 		ctx->q_data[V4L2_M2M_SRC].info = &pixfmt_stateless_fwht;
 	else
@@ -1794,22 +1796,22 @@ static int vicodec_open(struct file *file)
 	ctx->q_data[V4L2_M2M_SRC].coded_height = 720;
 	ctx->q_data[V4L2_M2M_SRC].visible_width = 1280;
 	ctx->q_data[V4L2_M2M_SRC].visible_height = 720;
-	size = 1280 * 720 * ctx->q_data[V4L2_M2M_SRC].info->sizeimage_mult /
-		ctx->q_data[V4L2_M2M_SRC].info->sizeimage_div;
+	raw_size = 1280 * 720 * info->sizeimage_mult / info->sizeimage_div;
+	comp_size = 1280 * 720 * pixfmt_fwht.sizeimage_mult /
+				 pixfmt_fwht.sizeimage_div;
 	if (ctx->is_enc || ctx->is_stateless)
-		ctx->q_data[V4L2_M2M_SRC].sizeimage = size;
+		ctx->q_data[V4L2_M2M_SRC].sizeimage = raw_size;
 	else
 		ctx->q_data[V4L2_M2M_SRC].sizeimage =
-			size + sizeof(struct fwht_cframe_hdr);
+			comp_size + sizeof(struct fwht_cframe_hdr);
+	ctx->q_data[V4L2_M2M_DST] = ctx->q_data[V4L2_M2M_SRC];
 	if (ctx->is_enc) {
-		ctx->q_data[V4L2_M2M_DST] = ctx->q_data[V4L2_M2M_SRC];
 		ctx->q_data[V4L2_M2M_DST].info = &pixfmt_fwht;
-		ctx->q_data[V4L2_M2M_DST].sizeimage = 1280 * 720 *
-			ctx->q_data[V4L2_M2M_DST].info->sizeimage_mult /
-			ctx->q_data[V4L2_M2M_DST].info->sizeimage_div +
-			sizeof(struct fwht_cframe_hdr);
+		ctx->q_data[V4L2_M2M_DST].sizeimage =
+			comp_size + sizeof(struct fwht_cframe_hdr);
 	} else {
-		ctx->q_data[V4L2_M2M_DST].info = NULL;
+		ctx->q_data[V4L2_M2M_DST].info = info;
+		ctx->q_data[V4L2_M2M_DST].sizeimage = raw_size;
 	}
 
 	ctx->state.colorspace = V4L2_COLORSPACE_REC709;
-- 
2.20.1

