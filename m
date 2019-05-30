Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8876C2FC23
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 15:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfE3NUk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 09:20:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60234 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbfE3NUk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 09:20:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 46A58260D33
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, lkcamp@lists.libreplanetbr.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH] media: vimc: Remove or modify stream checks
Date:   Thu, 30 May 2019 10:19:56 -0300
Message-Id: <20190530131956.25606-1-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change the way subdevices check if the stream is running. Verify the stream
pointer instead of src_frame. This makes easier to get rid of the void* and
u8* that points to frames in the subdevices structs.

Remove checks that s_stream does on subdevices. They are redundant since
the Media Controller Framework doesn't allow two streaming on the same
media pipeline at the same time.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/media/platform/vimc/vimc-debayer.c | 5 +----
 drivers/media/platform/vimc/vimc-scaler.c  | 7 ++-----
 drivers/media/platform/vimc/vimc-sensor.c  | 6 +-----
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 281f9c1a7249..b221f26e01cf 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -270,7 +270,7 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Do not change the format while stream is on */
-		if (vdeb->src_frame)
+		if (vdeb->ved.stream)
 			return -EBUSY;
 
 		sink_fmt = &vdeb->sink_fmt;
@@ -337,9 +337,6 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct v4l2_format_info *pix_info;
 		unsigned int frame_size;
 
-		if (vdeb->src_frame)
-			return 0;
-
 		/* We only support translating bayer to RGB24 */
 		if (src_pixelformat != V4L2_PIX_FMT_RGB24) {
 			dev_err(vdeb->dev,
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 8aecf8e92031..617f2920b86b 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -158,7 +158,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Do not change the format while stream is on */
-		if (vsca->src_frame)
+		if (vsca->ved.stream)
 			return -EBUSY;
 
 		sink_fmt = &vsca->sink_fmt;
@@ -213,9 +213,6 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct v4l2_format_info *pix_info;
 		unsigned int frame_size;
 
-		if (vsca->src_frame)
-			return 0;
-
 		if (!vimc_sca_is_pixfmt_supported(pixelformat)) {
 			dev_err(vsca->dev, "pixfmt (0x%08x) is not supported\n",
 				pixelformat);
@@ -337,7 +334,7 @@ static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
 						    ved);
 
 	/* If the stream in this node is not active, just return */
-	if (!vsca->src_frame)
+	if (!ved->stream)
 		return ERR_PTR(-EINVAL);
 
 	vimc_sca_fill_src_frame(vsca, sink_frame);
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index baca9ca67ce0..d70f1a1408f1 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -141,7 +141,7 @@ static int vimc_sen_set_fmt(struct v4l2_subdev *sd,
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Do not change the format while stream is on */
-		if (vsen->frame)
+		if (vsen->ved.stream)
 			return -EBUSY;
 
 		mf = &vsen->mbus_format;
@@ -197,10 +197,6 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct v4l2_format_info *pix_info;
 		unsigned int frame_size;
 
-		if (vsen->kthread_sen)
-			/* tpg is already executing */
-			return 0;
-
 		/* Calculate the frame size */
 		pix_info = v4l2_format_info(pixelformat);
 		frame_size = vsen->mbus_format.width * pix_info->bpp[0] *
-- 
2.21.0

