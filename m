Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31662D7C28
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 18:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393760AbgLKREN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 12:04:13 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2291 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389598AbgLKRD3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 12:03:29 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fd3a6390000>; Fri, 11 Dec 2020 09:02:49 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec
 2020 17:02:48 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 11 Dec 2020 17:02:48 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 02/13] media: tegra-video: Enable VI pixel transform for YUV and RGB formats
Date:   Fri, 11 Dec 2020 09:02:31 -0800
Message-ID: <1607706162-1548-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
References: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607706169; bh=3KvReLIRXcuW/kRnBsqtVyD+GiWXJeSQRRku54/yeMg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=dT0/BYwE9AfZF5CrldrAWJVtDVccMVBbJIay7rjv18tiGJtmGnc6QH3T/ikiX90kQ
         BiOtVxUHJRvUrO5JPlmAJ9HxTfBmHbX4lIj+XBHx3a58RYKktnvUcjoNa9ytlVPxqV
         yu3bT20c6i26/337HRkJMH1A+89cMUAynmRWsu5cvXxAuF6w4b1IjU+F8pJb0KI3E3
         bTiqlWL1wverKjK+D7KMq1mm5RHKx4PloCbFSivzp8kOVQCoktFTbyCGNAjMejPN5o
         xucLh8z4vBoFALe9cjtrjmKU4CEfg5kAs++ZbeVzPnV9+kjGFXFavTrekuw0W3HasJ
         kdBpI72ejumCg==
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

