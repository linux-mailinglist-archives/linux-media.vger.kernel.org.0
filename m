Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A90FD29A329
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 04:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504807AbgJ0DTy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 23:19:54 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15487 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504574AbgJ0DTa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 23:19:30 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9791c60000>; Mon, 26 Oct 2020 20:19:34 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 27 Oct
 2020 03:19:30 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 27 Oct 2020 03:19:29 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 07/10] media: tegra-video: Add support for VIDIOC_LOG_STATUS ioctl
Date:   Mon, 26 Oct 2020 20:19:20 -0700
Message-ID: <1603768763-25590-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
References: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603768774; bh=SF21BnA36cQvnemUV9ucdhKRKNHO+gD0lDF9mm2flJQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=ey8ih83EpHuyzFS1fmvkXHyUC4UpJM9Hnts6hAhW/VwW9Jvs4oYRlRSYh3Fy14uET
         C4O2sooKtgQecbCpjuKPNy3lCgOos32JoV5LCaU8KjAl9h+SYzf8NAOldLgU5I6rnC
         s4Wk6OIrRd36W4Noek6uOO0+dy61CcK4mz6a96Sy/vhJm6n/g7O0rk3ExCDPy3peId
         kncEEO1R1srUl2GbIHHoU5QP5WU9BEGQlaGo68XeORHN54iuXd63e6tsJWhM7rUA7g
         MQRruTHwz+WSzr4+QmYk8IqinSpDxlzncJWiZx5OifhLtPGRtmVQ//33umWgFeWnUB
         twritOzua+aVw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for log_status ioctl.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 92f36b1..936e5e5 100644
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
@@ -904,6 +913,7 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_query_dv_timings	= tegra_channel_query_dv_timings,
 	.vidioc_enum_dv_timings		= tegra_channel_enum_dv_timings,
 	.vidioc_dv_timings_cap		= tegra_channel_dv_timings_cap,
+	.vidioc_log_status		= tegra_channel_log_status,
 };
 
 /*
-- 
2.7.4

