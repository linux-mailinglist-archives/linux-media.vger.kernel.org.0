Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3632CDE44
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 20:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387721AbgLCTA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 14:00:56 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5929 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731723AbgLCTAy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 14:00:54 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc935bd0002>; Thu, 03 Dec 2020 11:00:13 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 19:00:09 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 19:00:08 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 07/13] media: tegra-video: Add support for VIDIOC_LOG_STATUS ioctl
Date:   Thu, 3 Dec 2020 10:59:56 -0800
Message-ID: <1607022002-26575-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607022013; bh=kTyQynYZOfOfJzdQDZRQRAmmuQmvfE4/+44pKh0V+MY=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=HK8P3Ioj//TNtz635xPetovlbjJ6sOR0cEOXpQ9+24IPY6Q4o8ADZJLc9gubi4cHz
         Mbygu7yjU+3u4dQTWdt31XIafzBAgDb7+waETVzIOP1FLWcrQO2tXy9WrxxQTa1Pp8
         HEhXyNKJ36QmqfH94p8WZBpFFvGlwZWFpVvR8dUSZRcN+MJyh8Tk/G8PBif3DpkL8C
         KWg1tlYMPmngq9Z3PIiSZCjQPYg9fWZFGwSu8iIovY6BUchqDECW05Kpi3ye9QEMFS
         2Hv2RLpZRw/ppb9J1k8UYHWQOaRs71myUJYgzdZCOW5uhIJ2yUxTuX9+u5oG0of+oY
         uPXTtTNYHyl9g==
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

