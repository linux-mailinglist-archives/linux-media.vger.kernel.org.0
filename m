Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4061A2D7C3A
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 18:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389602AbgLKREr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 12:04:47 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2532 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393735AbgLKREN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 12:04:13 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fd3a6400000>; Fri, 11 Dec 2020 09:02:56 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec
 2020 17:02:56 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 11 Dec 2020 17:02:55 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 13/13] media: tegra-video: Add custom V4L2 control V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY
Date:   Fri, 11 Dec 2020 09:02:42 -0800
Message-ID: <1607706162-1548-14-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
References: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607706176; bh=OZJ/8SCNM9zia5Uy6aq+c9fc5V1L/LcrVZqaCjqF0cQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=rM7GR58q6tG4hSul58c3J89afQQFafj4IJ8PG1D+E+kEEXRNjBTUlqq1PSMp9mQoh
         x+U/yU/TQwZnuVvDTHljVgTfMHmPd84OlxgGXu8fq+L1MHpKeA53TZicALPEDBz5iU
         edq0OtrpYEgv12+2UhfKPXL9of9IeMhTILv8TnExpMlHhLW35CgjXTdt6AQ+J3m6HJ
         fwxpcptTUNimoCiz4o68Jpgb6MqNZVCYwWG9i6j/1/r42p3eo2/N7Bz3WNxl/2KHD0
         td5gOAqqh8YlEbiCXywfuJmCFrGuhCNzmR2xdG/Jbb2gX/EyL5l0qkXc/kk6RYPLGn
         Hr2cdUj7pm4NA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds custom V4L2 control for syncpt timeout retry to continue
capture on error for specified retries count through this control.

This is useful for HDMI-to-CSI bridge debug purposes like for hotplug scenarios
or for ignoring captures till HDMI input is stabilized.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 10 +++++++++-
 drivers/staging/media/tegra-video/vi.c       | 26 +++++++++++++++++++++++++-
 drivers/staging/media/tegra-video/vi.h       |  4 ++++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 063d0a3..f10a041 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -454,6 +454,7 @@ static int chan_capture_kthread_start(void *data)
 {
 	struct tegra_vi_channel *chan = data;
 	struct tegra_channel_buffer *buf;
+	unsigned int retries = 0;
 	int err = 0;
 
 	while (1) {
@@ -483,8 +484,15 @@ static int chan_capture_kthread_start(void *data)
 		spin_unlock(&chan->start_lock);
 
 		err = tegra_channel_capture_frame(chan, buf);
-		if (err)
+		if (!err) {
+			retries = 0;
+			continue;
+		}
+
+		if (retries++ > chan->syncpt_timeout_retry)
 			vb2_queue_error(&chan->queue);
+		else
+			err = 0;
 	}
 
 	return 0;
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 4773281..70e1e18 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -956,7 +956,6 @@ static const struct v4l2_file_operations tegra_channel_fops = {
 /*
  * V4L2 control operations
  */
-#if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
 static int vi_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct tegra_vi_channel *chan = container_of(ctrl->handler,
@@ -968,6 +967,9 @@ static int vi_s_ctrl(struct v4l2_ctrl *ctrl)
 		/* pattern change takes effect on next stream */
 		chan->pg_mode = ctrl->val + 1;
 		break;
+	case V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY:
+		chan->syncpt_timeout_retry = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -979,10 +981,22 @@ static const struct v4l2_ctrl_ops vi_ctrl_ops = {
 	.s_ctrl	= vi_s_ctrl,
 };
 
+#if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
 static const char *const vi_pattern_strings[] = {
 	"Black/White Direct Mode",
 	"Color Patch Mode",
 };
+#else
+static const struct v4l2_ctrl_config syncpt_timeout_ctrl = {
+	.ops = &vi_ctrl_ops,
+	.id = V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY,
+	.name = "Syncpt timeout retry",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = 1,
+	.max = 10000,
+	.step = 1,
+	.def = 5,
+};
 #endif
 
 static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
@@ -1004,6 +1018,16 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 #else
 	struct v4l2_subdev *subdev;
 
+	/* custom control */
+	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
+	if (chan->ctrl_handler.error) {
+		dev_err(chan->vi->dev, "failed to add %s ctrl handler: %d\n",
+			syncpt_timeout_ctrl.name,
+			chan->ctrl_handler.error);
+		v4l2_ctrl_handler_free(&chan->ctrl_handler);
+		return chan->ctrl_handler.error;
+	}
+
 	subdev = tegra_channel_get_remote_source_subdev(chan);
 	if (!subdev)
 		return -ENODEV;
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 27061a5..a68e2c0 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -23,6 +23,8 @@
 
 #include "csi.h"
 
+#define V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY	(V4L2_CTRL_CLASS_CAMERA | 0x1001)
+
 #define TEGRA_MIN_WIDTH		32U
 #define TEGRA_MAX_WIDTH		32768U
 #define TEGRA_MIN_HEIGHT	32U
@@ -160,6 +162,7 @@ struct tegra_vi_graph_entity {
  * @of_node: device node of VI channel
  *
  * @ctrl_handler: V4L2 control handler of this video channel
+ * @syncpt_timeout_retry: syncpt timeout retry count for the capture
  * @fmts_bitmap: a bitmap for supported formats matching v4l2 subdev formats
  * @tpg_fmts_bitmap: a bitmap for supported TPG formats
  * @pg_mode: test pattern generator mode (disabled/direct/patch)
@@ -201,6 +204,7 @@ struct tegra_vi_channel {
 	struct device_node *of_node;
 
 	struct v4l2_ctrl_handler ctrl_handler;
+	unsigned int syncpt_timeout_retry;
 	DECLARE_BITMAP(fmts_bitmap, MAX_FORMAT_NUM);
 	DECLARE_BITMAP(tpg_fmts_bitmap, MAX_FORMAT_NUM);
 	enum tegra_vi_pg_mode pg_mode;
-- 
2.7.4

