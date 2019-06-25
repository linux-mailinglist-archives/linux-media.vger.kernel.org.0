Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 975F055148
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbfFYONX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:13:23 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33269 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfFYONX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:13:23 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1hfmCH-0004Mg-Io; Tue, 25 Jun 2019 16:13:21 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hfmCH-0000bL-AZ; Tue, 25 Jun 2019 16:13:21 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH] media: allegro: use new v4l2_m2m_ioctl_try_encoder_cmd funcs
Date:   Tue, 25 Jun 2019 16:13:20 +0200
Message-Id: <20190625141320.2149-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the try_encoder_cmd is identical for many drivers, there are now
helpers for this function in the mem2mem core. Use the helper in
allegro.

This fixes the v4l2-compliance test regarding V4L2_ENC_CMD_STOP, because
the allegro-specific function rejected invalid flags.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  | 22 ++-----------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 20b38b737869..f050c7347fd5 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -2508,24 +2508,6 @@ static int allegro_s_fmt_vid_out(struct file *file, void *fh,
 	return 0;
 }
 
-static int allegro_try_encoder_cmd(struct file *file, void *fh,
-				   struct v4l2_encoder_cmd *cmd)
-{
-	switch (cmd->cmd) {
-	case V4L2_ENC_CMD_START:
-		cmd->flags = 0;
-		break;
-	case V4L2_ENC_CMD_STOP:
-		if (cmd->flags)
-			return -EINVAL;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int allegro_channel_cmd_stop(struct allegro_channel *channel)
 {
 	struct allegro_dev *dev = channel->dev;
@@ -2594,7 +2576,7 @@ static int allegro_encoder_cmd(struct file *file, void *fh,
 	struct allegro_channel *channel = fh_to_channel(fh);
 	int err;
 
-	err = allegro_try_encoder_cmd(file, fh, cmd);
+	err = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
 	if (err)
 		return err;
 
@@ -2688,7 +2670,7 @@ static const struct v4l2_ioctl_ops allegro_ioctl_ops = {
 	.vidioc_streamon = allegro_ioctl_streamon,
 	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
 
-	.vidioc_try_encoder_cmd = allegro_try_encoder_cmd,
+	.vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
 	.vidioc_encoder_cmd = allegro_encoder_cmd,
 	.vidioc_enum_framesizes = allegro_enum_framesizes,
 
-- 
2.20.1

