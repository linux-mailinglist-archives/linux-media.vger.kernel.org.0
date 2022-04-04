Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B98E74F1A75
	for <lists+linux-media@lfdr.de>; Mon,  4 Apr 2022 23:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378949AbiDDVSb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Apr 2022 17:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379149AbiDDQhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Apr 2022 12:37:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5212C192B5
        for <linux-media@vger.kernel.org>; Mon,  4 Apr 2022 09:35:50 -0700 (PDT)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1nbPgC-0004CX-Ly; Mon, 04 Apr 2022 18:35:48 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
Subject: [PATCH 2/7] media: coda: disable encoder cmd ioctl on decoder and vice versa
Date:   Mon,  4 Apr 2022 18:35:28 +0200
Message-Id: <20220404163533.707508-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404163533.707508-1-p.zabel@pengutronix.de>
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_disable_ioctl() to disable the VIDIOC_TRY_ENCODER_CMD and
VIDIOC_ENCODER_CMD ioctls on decoder video devices and the
VIDIOC_TRY_DECODER_CMD and VIDIOC_DECODER_CMD ioctls on encoder
video devices.

This allows to drop the coda_try_encoder/decoder_cmd() functions
and to use v4l2_m2m_ioctl_try_encoder/decoder_cmd() directly.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../media/platform/chips-media/coda-common.c  | 38 ++++++-------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index 6d2989504b33..dc75133b0ead 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -1091,17 +1091,6 @@ static int coda_s_selection(struct file *file, void *fh,
 	}
 }
 
-static int coda_try_encoder_cmd(struct file *file, void *fh,
-				struct v4l2_encoder_cmd *ec)
-{
-	struct coda_ctx *ctx = fh_to_ctx(fh);
-
-	if (ctx->inst_type != CODA_INST_ENCODER)
-		return -ENOTTY;
-
-	return v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
-}
-
 static void coda_wake_up_capture_queue(struct coda_ctx *ctx)
 {
 	struct vb2_queue *dst_vq;
@@ -1120,7 +1109,7 @@ static int coda_encoder_cmd(struct file *file, void *fh,
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 
-	ret = coda_try_encoder_cmd(file, fh, ec);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
 	if (ret < 0)
 		return ret;
 
@@ -1149,17 +1138,6 @@ static int coda_encoder_cmd(struct file *file, void *fh,
 	return 0;
 }
 
-static int coda_try_decoder_cmd(struct file *file, void *fh,
-				struct v4l2_decoder_cmd *dc)
-{
-	struct coda_ctx *ctx = fh_to_ctx(fh);
-
-	if (ctx->inst_type != CODA_INST_DECODER)
-		return -ENOTTY;
-
-	return v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
-}
-
 static bool coda_mark_last_meta(struct coda_ctx *ctx)
 {
 	struct coda_buffer_meta *meta;
@@ -1216,7 +1194,7 @@ static int coda_decoder_cmd(struct file *file, void *fh,
 	bool wakeup;
 	int ret;
 
-	ret = coda_try_decoder_cmd(file, fh, dc);
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
 	if (ret < 0)
 		return ret;
 
@@ -1498,9 +1476,9 @@ static const struct v4l2_ioctl_ops coda_ioctl_ops = {
 	.vidioc_g_selection	= coda_g_selection,
 	.vidioc_s_selection	= coda_s_selection,
 
-	.vidioc_try_encoder_cmd	= coda_try_encoder_cmd,
+	.vidioc_try_encoder_cmd	= v4l2_m2m_ioctl_try_encoder_cmd,
 	.vidioc_encoder_cmd	= coda_encoder_cmd,
-	.vidioc_try_decoder_cmd	= coda_try_decoder_cmd,
+	.vidioc_try_decoder_cmd	= v4l2_m2m_ioctl_try_decoder_cmd,
 	.vidioc_decoder_cmd	= coda_decoder_cmd,
 
 	.vidioc_g_parm		= coda_g_parm,
@@ -2904,6 +2882,14 @@ static int coda_register_device(struct coda_dev *dev, int i)
 	v4l2_disable_ioctl(vfd, VIDIOC_G_CROP);
 	v4l2_disable_ioctl(vfd, VIDIOC_S_CROP);
 
+	if (dev->devtype->vdevs[i]->type == CODA_INST_ENCODER) {
+		v4l2_disable_ioctl(vfd, VIDIOC_DECODER_CMD);
+		v4l2_disable_ioctl(vfd, VIDIOC_TRY_DECODER_CMD);
+	} else {
+		v4l2_disable_ioctl(vfd, VIDIOC_ENCODER_CMD);
+		v4l2_disable_ioctl(vfd, VIDIOC_TRY_ENCODER_CMD);
+	}
+
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (!ret)
 		v4l2_info(&dev->v4l2_dev, "%s registered as %s\n",
-- 
2.30.2

