Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE76C29A331
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 04:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504832AbgJ0DUn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 23:20:43 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18928 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504583AbgJ0DTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 23:19:32 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9791ca0000>; Mon, 26 Oct 2020 20:19:38 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 27 Oct
 2020 03:19:31 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 27 Oct 2020 03:19:30 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 09/10] media: tegra-video: Implement V4L2 device notify callback
Date:   Mon, 26 Oct 2020 20:19:22 -0700
Message-ID: <1603768763-25590-10-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
References: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603768778; bh=xWtjeqZACAKCgSw2RHdrYwyQIBNwajqC+8SWI/tdbs0=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=YgnaC/R+07E1WDGY25IESREdCQuRe4naJtX6MQCJuo0lj89OK1OJfzG7sZN3Mr0/1
         7ukxL6jhGemgW9/+j5Q5c4Ya75rcFnCOgzM+73oxH+E/UsOerTl3ow/CtuBTdBVkFG
         AXwGRQVTdE1KVQW974qkJ1z10mardt069K48SLChVSU0IG94BH2Hc0/zajTynvMLHz
         tAcKQ8BhuAmb29MH/XRccZ05Pnc6aD4hGBGqPDchraQuhuqNgURk7eoT7gzwmZtJ1B
         Bs4gHwfba997dz2oESJwkol4h1vjH756SBXE3YZc7HdyXzfvYRBU0eJQMfVEdXDF89
         lJ+/wBUgQ5Tlg==
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
index 28c06a9..e866f7d 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1634,6 +1634,9 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
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

