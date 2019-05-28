Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7581F2C16F
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 10:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfE1Iem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 04:34:42 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:32873 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726827AbfE1Iel (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 04:34:41 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VXZ7hgpQIsDWyVXZ8hcDJH; Tue, 28 May 2019 10:34:39 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] vicodec: use new v4l2_m2m_ioctl_try_en/decoder_cmd funcs
Date:   Tue, 28 May 2019 10:34:37 +0200
Message-Id: <20190528083437.103215-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528083437.103215-1-hverkuil-cisco@xs4all.nl>
References: <20190528083437.103215-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLPFgJ/6eOFS+kirJGTEVfV7xO6A1viEnPHNoZBj19lb+wJW4HAWB9qf8C1OpLj0KXQPqLU+dq6NXWNLv05neJFNVbmtTIextvQY1JJyyCfhfzjW1LGe
 Vxq5QILSOUbXv+NC02voPbGyn19Kj7SQGbRym40LbST2+UHcJl2n3xDT87WfsHhQEcHMXU800m2kZyRPsf2Rsdy/AeP8MrmGO0rAbDcMu2GPJDkpI+n8tYJi
 QLl302otW5EVSYbyJFnXv3oR/zSSmetjEb3zzthxB34Ite3lMjxxmSiKTy5mA1ESWXxOGScDLOiiyrEkZeo3HnrboCtd+rY/+GSuwWnKu/Zr1sAHnI97dBQp
 Gv/8L/lxbcIJy2Gjt8xs+y90C0DFzUhJ8TwW3E1Qo8WycbLOccFpLvt+RsS59TMcDWzINB4boSCONtU9R+ITv0/D54bKsg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new helper functions for the try_de/decoder_cmd ioctls.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/vicodec/vicodec-core.c | 35 +++----------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
index bd01a9206aa6..71abc87b7b59 100644
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -1188,25 +1188,13 @@ static void vicodec_mark_last_buf(struct vicodec_ctx *ctx)
 	spin_unlock(ctx->lock);
 }
 
-static int vicodec_try_encoder_cmd(struct file *file, void *fh,
-				struct v4l2_encoder_cmd *ec)
-{
-	if (ec->cmd != V4L2_ENC_CMD_STOP)
-		return -EINVAL;
-
-	if (ec->flags & V4L2_ENC_CMD_STOP_AT_GOP_END)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int vicodec_encoder_cmd(struct file *file, void *fh,
 			    struct v4l2_encoder_cmd *ec)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
 	int ret;
 
-	ret = vicodec_try_encoder_cmd(file, fh, ec);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
 	if (ret < 0)
 		return ret;
 
@@ -1214,28 +1202,13 @@ static int vicodec_encoder_cmd(struct file *file, void *fh,
 	return 0;
 }
 
-static int vicodec_try_decoder_cmd(struct file *file, void *fh,
-				struct v4l2_decoder_cmd *dc)
-{
-	if (dc->cmd != V4L2_DEC_CMD_STOP)
-		return -EINVAL;
-
-	if (dc->flags & V4L2_DEC_CMD_STOP_TO_BLACK)
-		return -EINVAL;
-
-	if (!(dc->flags & V4L2_DEC_CMD_STOP_IMMEDIATELY) && (dc->stop.pts != 0))
-		return -EINVAL;
-
-	return 0;
-}
-
 static int vicodec_decoder_cmd(struct file *file, void *fh,
 			    struct v4l2_decoder_cmd *dc)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
 	int ret;
 
-	ret = vicodec_try_decoder_cmd(file, fh, dc);
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
 	if (ret < 0)
 		return ret;
 
@@ -1326,9 +1299,9 @@ static const struct v4l2_ioctl_ops vicodec_ioctl_ops = {
 	.vidioc_g_selection	= vidioc_g_selection,
 	.vidioc_s_selection	= vidioc_s_selection,
 
-	.vidioc_try_encoder_cmd	= vicodec_try_encoder_cmd,
+	.vidioc_try_encoder_cmd	= v4l2_m2m_ioctl_try_encoder_cmd,
 	.vidioc_encoder_cmd	= vicodec_encoder_cmd,
-	.vidioc_try_decoder_cmd	= vicodec_try_decoder_cmd,
+	.vidioc_try_decoder_cmd	= v4l2_m2m_ioctl_try_decoder_cmd,
 	.vidioc_decoder_cmd	= vicodec_decoder_cmd,
 	.vidioc_enum_framesizes = vicodec_enum_framesizes,
 
-- 
2.20.1

