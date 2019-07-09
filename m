Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD3CE63C11
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 21:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728979AbfGITnl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 15:43:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45376 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfGITnl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 15:43:41 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 4786F28AFAE
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        kernel@collabora.com, skhan@linuxfoundation.org,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH 1/2] media: Revert "media: vimc: Remove or modify stream checks"
Date:   Tue,  9 Jul 2019 16:43:26 -0300
Message-Id: <e144e6f5aae4e3d932e464fbf741d7cbaaf55980.1562701396.git.helen.koike@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit 3c1b9ac753e99005d7ee0a883d6e5b577ba32aa9.

Required to Revert "media: vimc: propagate pixel format in the stream"
which introduced the stream object in the vimc_ent_device struct.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/media/platform/vimc/vimc-debayer.c | 5 ++++-
 drivers/media/platform/vimc/vimc-scaler.c  | 7 +++++--
 drivers/media/platform/vimc/vimc-sensor.c  | 6 +++++-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 00598fbf3cba..72adba6cf892 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -262,7 +262,7 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Do not change the format while stream is on */
-		if (vdeb->ved.stream)
+		if (vdeb->src_frame)
 			return -EBUSY;
 
 		sink_fmt = &vdeb->sink_fmt;
@@ -329,6 +329,9 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct v4l2_format_info *pix_info;
 		unsigned int frame_size;
 
+		if (vdeb->src_frame)
+			return 0;
+
 		/* We only support translating bayer to RGB24 */
 		if (src_pixelformat != V4L2_PIX_FMT_RGB24) {
 			dev_err(vdeb->dev,
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index c7123a45c55b..5f31c1e351a3 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -148,7 +148,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Do not change the format while stream is on */
-		if (vsca->ved.stream)
+		if (vsca->src_frame)
 			return -EBUSY;
 
 		sink_fmt = &vsca->sink_fmt;
@@ -203,6 +203,9 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct v4l2_format_info *pix_info;
 		unsigned int frame_size;
 
+		if (vsca->src_frame)
+			return 0;
+
 		if (!vimc_sca_is_pixfmt_supported(pixelformat)) {
 			dev_err(vsca->dev, "pixfmt (0x%08x) is not supported\n",
 				pixelformat);
@@ -324,7 +327,7 @@ static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
 						    ved);
 
 	/* If the stream in this node is not active, just return */
-	if (!ved->stream)
+	if (!vsca->src_frame)
 		return ERR_PTR(-EINVAL);
 
 	vimc_sca_fill_src_frame(vsca, sink_frame);
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 51359472eef2..c47454cc7f70 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -131,7 +131,7 @@ static int vimc_sen_set_fmt(struct v4l2_subdev *sd,
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Do not change the format while stream is on */
-		if (vsen->ved.stream)
+		if (vsen->frame)
 			return -EBUSY;
 
 		mf = &vsen->mbus_format;
@@ -187,6 +187,10 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 		const struct v4l2_format_info *pix_info;
 		unsigned int frame_size;
 
+		if (vsen->kthread_sen)
+			/* tpg is already executing */
+			return 0;
+
 		/* Calculate the frame size */
 		pix_info = v4l2_format_info(pixelformat);
 		frame_size = vsen->mbus_format.width * pix_info->bpp[0] *
-- 
2.20.1

