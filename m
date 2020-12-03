Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDCE2CDE4F
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 20:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501959AbgLCTB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 14:01:28 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18458 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731699AbgLCTB1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 14:01:27 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc935c00000>; Thu, 03 Dec 2020 11:00:16 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 19:00:11 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 19:00:10 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 08/13] media: tegra-video: Add support for V4L2_EVENT_SOURCE_CHANGE
Date:   Thu, 3 Dec 2020 10:59:57 -0800
Message-ID: <1607022002-26575-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607022016; bh=N2+onGn+P/wtgXxXpkvV3u/wLb5I44E5LjNI+JkjEcA=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=P2srQbxkV+ko79JDl9AUr7NjObxkL3cn9YnU+qeq5bkpZhAtDZUNb1K+/C40OuZ5b
         uLmoV5peKXuMA3c02m7QlfUZZaNCxyxELeVw3rggAvasQJlZfUiQqlzSBmNsFLzqQm
         D3LeInr9mLvKXisZb/qxX0Nrd117bNS8xZw/k4NWHHFA9Eima5NHhjFVdIjvAZJ4so
         5nNInJ84bVpBOAX+gVxrNblAAq3QATn/2soWX1LesEr4Vn9Cm5Mvuy1mQmsG+DuyY8
         D3KGCYUFbiTcpSWqQkKsAn4uaPA7RYuJtKMBmjIyXr48RHfFGIYQ0JrjeFG3r3vIT2
         8y94V4clYS1hg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current implementation uses v4l2_ctrl_subscribe_event() and this
does not handle V4L2_EVENT_SOURCE_CHANGE.

So, update driver to handle V4L2_EVENT_SOURCE_CHANGE.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c280117..0a85e52 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -642,6 +642,18 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
 	return 0;
 }
 
+static int
+tegra_channel_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_event_subscribe(fh, sub, 4, NULL);
+	}
+
+	return v4l2_ctrl_subscribe_event(fh, sub);
+}
+
 static int tegra_channel_g_selection(struct file *file, void *priv,
 				     struct v4l2_selection *sel)
 {
@@ -904,7 +916,7 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_expbuf			= vb2_ioctl_expbuf,
 	.vidioc_streamon		= vb2_ioctl_streamon,
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
-	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_subscribe_event		= tegra_channel_subscribe_event,
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 	.vidioc_g_selection		= tegra_channel_g_selection,
 	.vidioc_s_selection		= tegra_channel_s_selection,
-- 
2.7.4

