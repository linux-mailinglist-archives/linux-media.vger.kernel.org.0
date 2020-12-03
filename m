Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7CC2CDE3F
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 20:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgLCTAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 14:00:47 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18301 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgLCTAq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 14:00:46 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc935b60002>; Thu, 03 Dec 2020 11:00:06 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 19:00:02 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 19:00:01 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 02/13] media: tegra-video: Enable VI pixel transform for YUV and RGB formats
Date:   Thu, 3 Dec 2020 10:59:51 -0800
Message-ID: <1607022002-26575-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607022006; bh=3KvReLIRXcuW/kRnBsqtVyD+GiWXJeSQRRku54/yeMg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=qpY7VaVJB1mUY6k5CwE8i2LCBqJjlP7r0PwhCy4qgEhEBOL4nMvEeBfSDZ9KZeQ15
         1b+xPZHpTPzK4xBTtAZZXAk+YSjb4FeqbDPsGS4gIYeyO6FJrT1Ql6IG6unlP+uWRq
         GRM+9rsElqAxnuXzmEsDQnFd73KFZ1sN4sADjGuJWHQSLdC1OFBI1lWGaXTwSDhNtF
         PW1OFLPhqdluRMv85HAi82IZgQQFvT1UqwZd+/4146Yr4FasBF9CESfUHG+8Q2SNAY
         s/Lg75xNCIUzeTq6pNLgDSduhkOFrC/T9t5IZiHswec0YZPPQfYsffXnOVb4+/sDCw
         8pZrJOU6PuX7A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VI Pixel transforms converts source pixel data to selected
destination pixel formats in memory and aligns properly.

YUV and RGB formats need this pixel transform to be enabled.

RAW formats use T_R16_I destination pixel format in memory and
does not need pixel transform as they support direct write to
memory.

So, this patch enables pixel transform for YUV and RGB and keeps
it bypass for RAW formats.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index ac066c0..6b23aa7 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -178,10 +178,23 @@ static int tegra_channel_capture_setup(struct tegra_vi_channel *chan)
 	u32 format = chan->fmtinfo->img_fmt;
 	u32 data_type = chan->fmtinfo->img_dt;
 	u32 word_count = (width * chan->fmtinfo->bit_width) / 8;
+	u32 bypass_pixel_transform = BIT(BYPASS_PXL_TRANSFORM_OFFSET);
+
+	/*
+	 * VI Pixel transformation unit converts source pixels data format
+	 * into selected destination pixel format and aligns properly while
+	 * interfacing with memory packer.
+	 * This pixel transformation should be enabled for YUV and RGB
+	 * formats and should be bypassed for RAW formats as RAW formats
+	 * only support direct to memory.
+	 */
+	if (chan->pg_mode || data_type == TEGRA_IMAGE_DT_YUV422_8 ||
+	    data_type == TEGRA_IMAGE_DT_RGB888)
+		bypass_pixel_transform = 0;
 
 	vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, 0xffffffff);
 	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_DEF,
-		     ((chan->pg_mode ? 0 : 1) << BYPASS_PXL_TRANSFORM_OFFSET) |
+		     bypass_pixel_transform |
 		     (format << IMAGE_DEF_FORMAT_OFFSET) |
 		     IMAGE_DEF_DEST_MEM);
 	vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_DT, data_type);
-- 
2.7.4

