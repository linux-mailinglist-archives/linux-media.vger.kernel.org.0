Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924A329A336
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 04:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504847AbgJ0DUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 23:20:46 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15480 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504564AbgJ0DTa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 23:19:30 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9791c50000>; Mon, 26 Oct 2020 20:19:33 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 27 Oct
 2020 03:19:28 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 27 Oct 2020 03:19:28 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 05/10] media: tegra-video: Add DV timing support
Date:   Mon, 26 Oct 2020 20:19:18 -0700
Message-ID: <1603768763-25590-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
References: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603768773; bh=LiaXgDHJz9gTg1dN9RrtBEXYHCuprW00WoLXWidqB+4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=cFHiyNEenggApaLAFglCG++JtPQ2HXe9BflQTUEUwj8PQEloCYW1Qk3wC4GI50aTT
         VNSbAbUSGv4r9iX/dauXPlQ/dow9XqrhicxOWOUVaUIbUvtDTIF+hOwLcddQhXGUG4
         QnkAp5yp7epGiv7VTBnih1D97laS5tERbSJRuagxWB7mqtFCF/DFzwpYvxhTcWb1Hq
         J5FtoXibtXUtQVrnih6DEZXjAh6rYX1bviwH8P4ZxN59kn6rbYu4+e/nvppHXXrUTw
         sA1iNfIoqn8CcOkm7b4ulEq8Mhr/rR0sJBjZSDwOE6na9XP8h7E9kY16hUgj9Tss0B
         TYMnC3iJ9thNg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds below v4l2 DV timing ioctls to support HDMI-to-CSI
bridges.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 97 ++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 525c087..d0d84da 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -18,6 +18,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
+#include <media/v4l2-dv-timings.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fh.h>
 #include <media/v4l2-fwnode.h>
@@ -720,6 +721,97 @@ static int tegra_channel_s_selection(struct file *file, void *fh,
 	return ret;
 }
 
+static int tegra_channel_g_dv_timings(struct file *file, void *fh,
+				      struct v4l2_dv_timings *timings)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, video, g_dv_timings))
+		return -ENOTTY;
+
+	return v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
+					  video, g_dv_timings, timings);
+}
+
+static int tegra_channel_s_dv_timings(struct file *file, void *fh,
+				      struct v4l2_dv_timings *timings)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+	struct v4l2_bt_timings *bt = &timings->bt;
+	struct v4l2_dv_timings curr_timings;
+	int ret;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, video, s_dv_timings))
+		return -ENOTTY;
+
+	ret = tegra_channel_g_dv_timings(file, fh, &curr_timings);
+	if (ret)
+		return ret;
+
+	if (v4l2_match_dv_timings(timings, &curr_timings, 0, false))
+		return 0;
+
+	if (vb2_is_busy(&chan->queue))
+		return -EBUSY;
+
+	ret = v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
+					 video, s_dv_timings, timings);
+	if (ret)
+		return ret;
+
+	chan->format.width = bt->width;
+	chan->format.height = bt->height;
+	chan->format.bytesperline = bt->width * chan->fmtinfo->bpp;
+	chan->format.sizeimage = chan->format.bytesperline * bt->height;
+	tegra_channel_fmt_align(chan, &chan->format, chan->fmtinfo->bpp);
+
+	return 0;
+}
+
+static int tegra_channel_query_dv_timings(struct file *file, void *fh,
+					  struct v4l2_dv_timings *timings)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, video, query_dv_timings))
+		return -ENOTTY;
+
+	return v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
+					  video, query_dv_timings, timings);
+}
+
+static int tegra_channel_enum_dv_timings(struct file *file, void *fh,
+					 struct v4l2_enum_dv_timings *timings)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, pad, enum_dv_timings))
+		return -ENOTTY;
+
+	return v4l2_subdev_call(subdev, pad, enum_dv_timings, timings);
+}
+
+static int tegra_channel_dv_timings_cap(struct file *file, void *fh,
+					struct v4l2_dv_timings_cap *cap)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, pad, dv_timings_cap))
+		return -ENOTTY;
+
+	return v4l2_subdev_call(subdev, pad, dv_timings_cap, cap);
+}
+
 static int tegra_channel_enum_input(struct file *file, void *fh,
 				    struct v4l2_input *inp)
 {
@@ -779,6 +871,11 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 	.vidioc_g_selection		= tegra_channel_g_selection,
 	.vidioc_s_selection		= tegra_channel_s_selection,
+	.vidioc_g_dv_timings		= tegra_channel_g_dv_timings,
+	.vidioc_s_dv_timings		= tegra_channel_s_dv_timings,
+	.vidioc_query_dv_timings	= tegra_channel_query_dv_timings,
+	.vidioc_enum_dv_timings		= tegra_channel_enum_dv_timings,
+	.vidioc_dv_timings_cap		= tegra_channel_dv_timings_cap,
 };
 
 /*
-- 
2.7.4

