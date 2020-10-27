Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AACAC29A32F
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 04:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504586AbgJ0DTc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 23:19:32 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18923 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504542AbgJ0DTa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 23:19:30 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9791c80001>; Mon, 26 Oct 2020 20:19:36 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 27 Oct
 2020 03:19:29 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 27 Oct 2020 03:19:29 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 06/10] media: tegra-video: Add support for EDID ioctl ops
Date:   Mon, 26 Oct 2020 20:19:19 -0700
Message-ID: <1603768763-25590-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
References: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603768777; bh=bHzQRpU16Ph4H6jjekuasUSGwbJ9VXFyRGyVRWLhW1I=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=gRcrriLOY998+iARHUT/omejtD0882kNTOxqtiGqC31zRJ3HfdEvlpD2w1BtqMLqI
         s4ZuJTb2n9oMspbt9yZ+HdEj3t2KbbxxqDeITFtyG3PuOvcq+rlsZLqTUOhVqFT4c7
         MLEJlGShWBmkkttpIAQPdbczwY0WzgsrJdd7pRs0FV6dXUotdvyS2yjky6kErF3+rX
         7rzkwL3K++7mdrrZAG34TWiHM3j3KTWg+2zm3vSPn4e4ci92UKD2f9YWuX/9pLJ1Vt
         2anzSKimfQkmpGbWhkZoqY3edhsf85tYOcaHtIEZTDXlZTYFHf7YMUtki7rB6XxlWL
         hZPYe4cjipFfA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for EDID get and set v4l2 ioctl ops to use
with HDMI to CSI bridges.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index d0d84da..92f36b1 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -721,6 +721,32 @@ static int tegra_channel_s_selection(struct file *file, void *fh,
 	return ret;
 }
 
+static int tegra_channel_g_edid(struct file *file, void *fh,
+				struct v4l2_edid *edid)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, pad, get_edid))
+		return -ENOTTY;
+
+	return v4l2_subdev_call(subdev, pad, get_edid, edid);
+}
+
+static int tegra_channel_s_edid(struct file *file, void *fh,
+				struct v4l2_edid *edid)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, pad, set_edid))
+		return -ENOTTY;
+
+	return v4l2_subdev_call(subdev, pad, set_edid, edid);
+}
+
 static int tegra_channel_g_dv_timings(struct file *file, void *fh,
 				      struct v4l2_dv_timings *timings)
 {
@@ -871,6 +897,8 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 	.vidioc_g_selection		= tegra_channel_g_selection,
 	.vidioc_s_selection		= tegra_channel_s_selection,
+	.vidioc_g_edid			= tegra_channel_g_edid,
+	.vidioc_s_edid			= tegra_channel_s_edid,
 	.vidioc_g_dv_timings		= tegra_channel_g_dv_timings,
 	.vidioc_s_dv_timings		= tegra_channel_s_dv_timings,
 	.vidioc_query_dv_timings	= tegra_channel_query_dv_timings,
-- 
2.7.4

