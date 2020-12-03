Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32F172CDE4E
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 20:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731793AbgLCTB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 14:01:28 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18455 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729136AbgLCTB1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 14:01:27 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc935bd0002>; Thu, 03 Dec 2020 11:00:13 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 19:00:12 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 19:00:11 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 09/13] media: tegra-video: Implement V4L2 device notify callback
Date:   Thu, 3 Dec 2020 10:59:58 -0800
Message-ID: <1607022002-26575-10-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607022013; bh=ncGsj+Oy+F4Lel7edOJaT66wM9yPnydfWvWB30dUNxo=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=WEyVYfyIIsgLrAqCLF63w9FK9845+8mOPDGODnA7EHYE7gmcVooNheCVZ+Up+5N1r
         WmGEa1MDx2hm1YjP5AyxBokfwRVMEw3IgXaP1aqFc2Ra9q9jl5iBHI+Kz3tCzzbe8b
         Ci9Vf1BYTnf6qqpPS7rdJi9ycSHInjLeQ1hAYSQW3ct+4NkOkngSp9XckjzZBhcTMX
         f40prPcZRxs3hqPqsqfxTJ4Xzqx4ucFrhxF4eteSd64uRNEYif4HXLcmO+vdG/maPJ
         bEHAiRYshZmzt9Dym0yaGyv8WYUHsuMZjjI9y6hv0HccYoopPNGORx9ZrleDm2EVHj
         04tqMmhTd9/dg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement V4L2 device notify callback to handle
V4L2_EVENT_SOURCE_CHANGE event from subdevices.

HDMI-to-CSI bridge drivers trigger V4L2_EVENT_SOURCE_CHANGE when
source DV timing changes are detected or when HDMI hotplug happens.

Runtime source parameter changes during active streaming is not
allowed and Tegra video driver calls vb2_queue_error to signal a
fatal error if a notification of this event happens during an active
streaming.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c    |  3 +++
 drivers/staging/media/tegra-video/video.c | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 0a85e52..d42a218 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1636,6 +1636,9 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 	v4l2_set_subdev_hostdata(subdev, chan);
 
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	v4l2_set_subdev_hostdata(subdev, chan);
+
 	return 0;
 
 unregister_video:
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index e50bd70..d966b31 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
+#include <media/v4l2-event.h>
+
 #include "video.h"
 
 static void tegra_v4l2_dev_release(struct v4l2_device *v4l2_dev)
@@ -24,6 +26,21 @@ static void tegra_v4l2_dev_release(struct v4l2_device *v4l2_dev)
 	kfree(vid);
 }
 
+static void tegra_v4l2_dev_notify(struct v4l2_subdev *sd,
+				  unsigned int notification, void *arg)
+{
+	struct tegra_vi_channel *chan;
+	const struct v4l2_event *ev = arg;
+
+	if (notification != V4L2_DEVICE_NOTIFY_EVENT)
+		return;
+
+	chan = v4l2_get_subdev_hostdata(sd);
+	v4l2_event_queue(&chan->video, arg);
+	if (ev->type == V4L2_EVENT_SOURCE_CHANGE && vb2_is_streaming(&chan->queue))
+		vb2_queue_error(&chan->queue);
+}
+
 static int host1x_video_probe(struct host1x_device *dev)
 {
 	struct tegra_video_device *vid;
@@ -49,6 +66,7 @@ static int host1x_video_probe(struct host1x_device *dev)
 
 	vid->v4l2_dev.mdev = &vid->media_dev;
 	vid->v4l2_dev.release = tegra_v4l2_dev_release;
+	vid->v4l2_dev.notify = tegra_v4l2_dev_notify;
 	ret = v4l2_device_register(&dev->dev, &vid->v4l2_dev);
 	if (ret < 0) {
 		dev_err(&dev->dev,
-- 
2.7.4

