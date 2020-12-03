Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B21182CDE30
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 20:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731647AbgLCTAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 14:00:50 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18309 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbgLCTAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 14:00:49 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc935b80001>; Thu, 03 Dec 2020 11:00:08 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 19:00:05 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 19:00:04 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 04/13] media: tegra-video: Add support for V4L2_PIX_FMT_NV16
Date:   Thu, 3 Dec 2020 10:59:53 -0800
Message-ID: <1607022002-26575-5-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607022008; bh=KU4kkKyfxjB47xZSqJdcMrFYTj+ssTxcvqFUoz12xtg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=ImQ8f5t/c41iPkMOLFI9rTPRcfEQwElpk45j2M7bJ49+hBz8QMXz05vMDkjhxzmi+
         uR5diDl6kTwE1ypebPQf0BG5+jI5yohcDSprgOY4lFhWpi6WgtZucD1XVcgenQGO5x
         vRTwRp07qSs1iJuCbSy+Jd6gPgSNyzE0hJceaOUtzpRm82RbiSqyLU9UmxVPSkbcsx
         6cvohCP2Uh29D33hl1FQjd2q922IHYv8OKxexNIhNcELcYvfWRWc6Lp0i0kD9KLIgn
         Cqr9XAWaPwdAQvipH8Fga6vF3q27WTyNiFhACyj8RGnuLkwv9LA/3R0KtMqPTmF4X2
         JjBkXGQWSd3kQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

NV16 are two-plane versions of YUV422 format.

VI/CSI surface0 registers corresponds to first Y plane and
surface1 registers corresponds to seconds UV plane.

This patch updates image size for NV16 format to include both planes
and programs VI/CSI surface1 registers for UV plane capture.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 13 +++++++++++++
 drivers/staging/media/tegra-video/vi.c       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 68f09e4..b731aa5 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -287,6 +287,7 @@ static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
 {
 	u32 thresh, value, frame_start, mw_ack_done;
 	int bytes_per_line = chan->format.bytesperline;
+	u32 sizeimage = chan->format.sizeimage;
 	int err;
 
 	/* program buffer address by using surface 0 */
@@ -296,6 +297,18 @@ static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
 	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
 
 	/*
+	 * Program surface 1 for UV plane with offset sizeimage from Y plane.
+	 */
+	if (chan->fmtinfo->fourcc == V4L2_PIX_FMT_NV16) {
+		vi_csi_write(chan, TEGRA_VI_CSI_SURFACE1_OFFSET_MSB,
+			     ((u64)buf->addr + sizeimage / 2) >> 32);
+		vi_csi_write(chan, TEGRA_VI_CSI_SURFACE1_OFFSET_LSB,
+			     buf->addr + sizeimage / 2);
+		vi_csi_write(chan, TEGRA_VI_CSI_SURFACE1_STRIDE,
+			     bytes_per_line);
+	}
+
+	/*
 	 * Tegra VI block interacts with host1x syncpt for synchronizing
 	 * programmed condition of capture state and hardware operation.
 	 * Frame start and Memory write acknowledge syncpts has their own
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7edd35c..525c087 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -484,6 +484,8 @@ static void tegra_channel_fmt_align(struct tegra_vi_channel *chan,
 
 	pix->bytesperline = clamp(bpl, min_bpl, max_bpl);
 	pix->sizeimage = pix->bytesperline * pix->height;
+	if (pix->pixelformat == V4L2_PIX_FMT_NV16)
+		pix->sizeimage *= 2;
 }
 
 static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
-- 
2.7.4

