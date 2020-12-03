Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECEF02CDE49
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 20:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731763AbgLCTBG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 14:01:06 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5905 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729136AbgLCTAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 14:00:47 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc935b70000>; Thu, 03 Dec 2020 11:00:07 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 19:00:04 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 19:00:03 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 03/13] media: tegra-video: Fix V4L2 pixel format RGB and YUV
Date:   Thu, 3 Dec 2020 10:59:52 -0800
Message-ID: <1607022002-26575-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607022007; bh=imcyi/Wf5bWSKWY3rp4OOsZll/aHA+UXIksKEb6CDQY=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=puKJiVnOZQxmYQCETPz2Ub4HX4uIfpMxL5kU3XkyO8w6y+azx55yrekM+OXTj9sBs
         52ImS4Vsch8t1NT0abQYEMS6s+s/ksl8oMQzOf7cEtc/cjn7xzFbC6jHm194iHQDtd
         6+GTI5FQXUzoqSEi4yvjp0XkQSlfdPjTfShtxRpeAi9n1Kk/eI30GanZUgd++va+xo
         oqM+2LuaP7D80OQkWNZey1QD+aUlr93eg6R5ydSnXf+//L9wC+dlf/yeWPOe0DIgBm
         FAYdqBrnPNR8iJtKAFebPBFKeJWo/Uyy5UhA0jmaLNMryySXhfiQQdQALeGkiprHHV
         tvv4uPjEZIYpw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 pixel format is incorrect for RGB and YUV formats.

This patch fixes it.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 6b23aa7..68f09e4 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -619,19 +619,19 @@ static const struct tegra_video_format tegra210_video_formats[] = {
 	TEGRA210_VIDEO_FMT(RAW12, 12, SGBRG12_1X12, 2, T_R16_I, SGBRG12),
 	TEGRA210_VIDEO_FMT(RAW12, 12, SBGGR12_1X12, 2, T_R16_I, SBGGR12),
 	/* RGB888 */
-	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, RGB24),
+	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, XBGR32),
 	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X32_PADHI, 4, T_A8B8G8R8,
-			   XBGR32),
+			   RGBX32),
 	/* YUV422 */
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 2, T_U8_Y8__V8_Y8, UYVY),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 2, T_V8_Y8__U8_Y8, VYUY),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 2, T_Y8_U8__Y8_V8, YUYV),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 2, T_Y8_V8__Y8_U8, YVYU),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 2, T_U8_Y8__V8_Y8, YVYU),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 2, T_V8_Y8__U8_Y8, YUYV),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 2, T_Y8_U8__Y8_V8, VYUY),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 2, T_Y8_V8__Y8_U8, UYVY),
 	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 1, T_Y8__V8U8_N422, NV16),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, T_U8_Y8__V8_Y8, UYVY),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, T_V8_Y8__U8_Y8, VYUY),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, T_Y8_U8__Y8_V8, YUYV),
-	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, T_Y8_V8__Y8_U8, YVYU),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, T_U8_Y8__V8_Y8, YVYU),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, T_V8_Y8__U8_Y8, YUYV),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, T_Y8_U8__Y8_V8, VYUY),
+	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, T_Y8_V8__Y8_U8, UYVY),
 };
 
 /* Tegra210 VI operations */
-- 
2.7.4

