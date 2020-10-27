Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B435029A32D
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 04:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504566AbgJ0DT3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 23:19:29 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18918 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504557AbgJ0DT2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 23:19:28 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9791c70001>; Mon, 26 Oct 2020 20:19:35 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 27 Oct
 2020 03:19:27 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 27 Oct 2020 03:19:27 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 03/10] media: tegra-video: Fix V4L2 pixel format for RGB888_1X24
Date:   Mon, 26 Oct 2020 20:19:16 -0700
Message-ID: <1603768763-25590-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
References: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603768775; bh=oZ0OoYopq5ZTtCF6PxH3Qip/gBKrvsKPMfv55eO/rZY=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=AFxLr1XhnNXyEPOUQfvApCFn0qp6dxmBbS4RfgdFF6IOKIjfxbt1r6whhUhrDOWKS
         OKRjIuW32qf7/oyHgUVt2c7r3CGowRtwkwiZyI9lVU38gbSGDX7fpuCgpQ7zr4+5cd
         dtfgrEaPMKxr8mGZ9E09M04Q02nSyqZFRAJpdm9Ti2F+k723oa1HwO4N+KnI4FnIbp
         zEeqlzd+8ilq0s7ngOv0DUyN4mLngRnL6dTSraGphIeEaLBHyIbXGCq48FSFyJO+z4
         PT3Zs8W8RjFiz8uxXTcirlY4Ymm4o21soYFNuZT6FQXkiNUZZL5y4+q+lt3amhhGFZ
         pACNTPDp9Twrw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 pixel format is incorrect for RGB888_1X24.

This patch fixes it.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 6b23aa7..c883925 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -619,7 +619,7 @@ static const struct tegra_video_format tegra210_video_formats[] = {
 	TEGRA210_VIDEO_FMT(RAW12, 12, SGBRG12_1X12, 2, T_R16_I, SGBRG12),
 	TEGRA210_VIDEO_FMT(RAW12, 12, SBGGR12_1X12, 2, T_R16_I, SBGGR12),
 	/* RGB888 */
-	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, RGB24),
+	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X24, 4, T_A8R8G8B8, XRGB32),
 	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X32_PADHI, 4, T_A8B8G8R8,
 			   XBGR32),
 	/* YUV422 */
-- 
2.7.4

