Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0EC82D7C4A
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 18:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394164AbgLKRFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 12:05:08 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2526 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393728AbgLKREM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 12:04:12 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fd3a63c0000>; Fri, 11 Dec 2020 09:02:52 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec
 2020 17:02:52 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 11 Dec 2020 17:02:51 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 07/13] media: tegra-video: Add support for VIDIOC_LOG_STATUS ioctl
Date:   Fri, 11 Dec 2020 09:02:36 -0800
Message-ID: <1607706162-1548-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
References: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607706172; bh=kTyQynYZOfOfJzdQDZRQRAmmuQmvfE4/+44pKh0V+MY=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=iyR8mvCzd/hKrP7rW+9QkLAyMtstGR2l0KY7IbcLl3vKAeEr0vG8IMHT0nmvMORdp
         j8x5xbFo4gh1EKckA/+2LUSNhf4J3ABVWTwk+UjHP1l8Dm/WIJZFI118AiT5EMMElV
         ALMr6Q//7/L3GKQnuLHkKDQrqXyPtcbHpiK2uQU/uoVfg+is0KpN4FPmxTd34PIOLm
         s1Ddc14R74EJ6M72ddXFA/X7rV6hCiV0CH6D0JQHM4XIpCPewh6KNprANm0oilBVR6
         HXVx7Z3LaGsGwIaGMLQEYyDFHvi34n+r0cZT2rNSWZ2BTdyrGUTZBobKt+00DpLQ8M
         VXsfAH8143oiA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for log_status ioctl.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index bc38136..c280117 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -838,6 +838,15 @@ static int tegra_channel_dv_timings_cap(struct file *file, void *fh,
 	return v4l2_subdev_call(subdev, pad, dv_timings_cap, cap);
 }
 
+static int tegra_channel_log_status(struct file *file, void *fh)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+
+	v4l2_device_call_all(chan->video.v4l2_dev, 0, core, log_status);
+
+	return 0;
+}
+
 static int tegra_channel_enum_input(struct file *file, void *fh,
 				    struct v4l2_input *inp)
 {
@@ -906,6 +915,7 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_query_dv_timings	= tegra_channel_query_dv_timings,
 	.vidioc_enum_dv_timings		= tegra_channel_enum_dv_timings,
 	.vidioc_dv_timings_cap		= tegra_channel_dv_timings_cap,
+	.vidioc_log_status		= tegra_channel_log_status,
 };
 
 /*
-- 
2.7.4

