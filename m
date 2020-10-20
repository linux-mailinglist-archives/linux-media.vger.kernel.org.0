Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2BB294317
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438242AbgJTTfw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:35:52 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5598 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438198AbgJTTfd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:35:33 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8f3bd60000>; Tue, 20 Oct 2020 12:34:46 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 19:35:32 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 20 Oct 2020 19:35:32 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 8/9] media: tegra-video: Add support for V4L2_EVENT_SOURCE_CHANGE
Date:   Tue, 20 Oct 2020 12:36:14 -0700
Message-ID: <1603222575-14427-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603222575-14427-1-git-send-email-skomatineni@nvidia.com>
References: <1603222575-14427-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603222486; bh=Ri7BxP7rB/ENWqYxoUtmefRCrq9hjpVnsW9TW30TSIw=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=NETJfVVz+4N+MHFWQPEn7rtnFNWk7E8pL3aUUEk9Q7FoZPHf7ij65iHLlFVin0gMX
         H6121EPCHUL3z16hAKSw+q+Ql8jmm4fCzi/qrRSF++A0FSy0NzcpM3D+K/D7YstpVr
         kYiI4R3fohtGpt2Z3d18xK+SBce6fd0QZ10Y1AYlHhrQhcWhffyon4EKgEDfuJFfJv
         dl4YdFq2fvjmy2zjicxmgA10BTLiglqJVZbC5xRXQL6cpV6eqQ2dSyy/aeOkBpdB8v
         vvBSgzVltCtLtMzd+tWM1pHxZSeFbrxIWFxjWT77EPGPmkM7oiiLvj748ELn8p3yCj
         k08wrRrCNpyEQ==
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
index 936e5e5..28c06a9 100644
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
@@ -902,7 +914,7 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
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

