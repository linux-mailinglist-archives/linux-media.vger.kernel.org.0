Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968F92CDE46
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 20:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731742AbgLCTA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 14:00:56 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5932 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731726AbgLCTAy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 14:00:54 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc935bd0003>; Thu, 03 Dec 2020 11:00:13 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 19:00:08 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 19:00:07 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 06/13] media: tegra-video: Add support for EDID ioctl ops
Date:   Thu, 3 Dec 2020 10:59:55 -0800
Message-ID: <1607022002-26575-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607022013; bh=pNpN3f/SRR0mn9c/AvbESRBJwpfQPmb/g2WTapIp4ew=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=XJPxc/Mc8fJ/Js9hhiJ0q7KzNyxWsVy0MV5I6YjPZZqTHIJ8QhOPP0lZ/BDzbXJ1K
         xL50hCVQpEhfMPEWgXzsJPRvMNuLzLaUU7qx4dM79K3Z99QurVSpGYNObSqUtOGbmc
         E1GVlFbYPQH1URJxiyoRBINZUoxVgOWV1NUeeSKxp0spbT/zZ3idF4xn+7bUgW45+P
         5jvyICeqVZxZBk4U3UADzhCpPkS7rQrL6LcShmkMH8U+R73bLGY5g1dviTpmZ/Q7P/
         3/+JJLJCxXCPrbMDbhordmvS4st2/QtX6Ra2fNt9HLw5JghOa0hkYPrg3KMysTX+Qf
         hM1OKB3mhhfYw==
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
index d01e88d..bc38136 100644
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
@@ -873,6 +899,8 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
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

