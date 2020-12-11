Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C162D7C1F
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 18:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393989AbgLKREO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 12:04:14 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5325 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393569AbgLKRDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 12:03:52 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fd3a63a0000>; Fri, 11 Dec 2020 09:02:50 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec
 2020 17:02:50 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 11 Dec 2020 17:02:49 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 04/13] media: tegra-video: Add support for V4L2_PIX_FMT_NV16
Date:   Fri, 11 Dec 2020 09:02:33 -0800
Message-ID: <1607706162-1548-5-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
References: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607706170; bh=KU4kkKyfxjB47xZSqJdcMrFYTj+ssTxcvqFUoz12xtg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=ABaHukVU4Xw2KaV01j2NGOy1SpqVHzk0Exabkc/i9WLHnIxIQ7KF+grQvvoRkYi4b
         Vko6c304ochmhGtLc25M34t2MmYhS+c5gZt96ydeTSiTuK5rHgiGXfqoRYMyonTPC2
         MP0XX0sd7RYnmrHKUBaFPl1xSRYxIr4u6qH83JAXlFrVuMDXnELFdtFksJUjPygpsk
         qNZTE+HFgrDm4urgBnjMCqlKxj/tgAG8WU3cwcbi5fdEMW4z8Yu9Yl4faEp+6StbGD
         g2U8lMDCmPCAUd3x0ujZg1sUUhxAXmgOHVjcojgdi+KxB7Dhk5pha/4aDSAIRBWiwT
         Trp5BfIOl4ZwQ==
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

