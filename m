Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9596023A9A9
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 17:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgHCPmc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 11:42:32 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1748 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgHCPmc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 11:42:32 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f28305a0000>; Mon, 03 Aug 2020 08:42:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 03 Aug 2020 08:42:31 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 03 Aug 2020 08:42:31 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Aug
 2020 15:42:31 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 3 Aug 2020 15:42:31 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.221]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2830660001>; Mon, 03 Aug 2020 08:42:31 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 01/10] media: tegra-video: Fix channel format alignment
Date:   Mon, 3 Aug 2020 08:42:17 -0700
Message-ID: <1596469346-937-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596469338; bh=8GJbUvoTqNXQhoilqMQO06MgCPv5IgO6eahUeR7/0ig=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=J9URXn7rMZFZccEKJYxPqRptaEUBofPPMk7FjAt4gq4IjFPO133OgDFVRC4Ln1iev
         dgVOo41Qo8u23/NX0ixCdh7HocuN8e/ELZDYL+NK6+o7uOiHJBX8qfMSa3PXG6L0Ax
         7KWoQ2JvYWh4SUO3LOCyUwrfu0dOpBNcmtqAO4sFmNS/V01+MngwC8pR5xt2LcIb8b
         rrwzR9//F+2DHmWuzmF7GEtTxTm0xQop31XaJhoc81n+GtPCY0cS8dVG5+tsy4MAX2
         /fWtFDqCGD1FwyFPkm3kRA2zlyRebOJjaKTP9l6R4TGgtFCR3vk9/weYNufFM+7jm7
         bMgyUc2WyFSvw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pixel format width is mistakenly aligned to surface align bytes
and altering width to aligned value may force sensor mode change
other than the requested one and also cause mismatch in width
programmed between sensor and vi which can lead to capture errors.

This patch removes width alignment and clamps width as per Tegra
minimum and maximum limits.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 1b5e660..d621ebc 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -359,25 +359,15 @@ static void tegra_channel_fmt_align(struct tegra_vi_channel *chan,
 				    struct v4l2_pix_format *pix,
 				    unsigned int bpp)
 {
-	unsigned int align;
-	unsigned int min_width;
-	unsigned int max_width;
-	unsigned int width;
 	unsigned int min_bpl;
 	unsigned int max_bpl;
 	unsigned int bpl;
 
 	/*
-	 * The transfer alignment requirements are expressed in bytes. Compute
-	 * minimum and maximum values, clamp the requested width and convert
-	 * it back to pixels. Use bytesperline to adjust the width.
+	 * The transfer alignment requirements are expressed in bytes.
+	 * Clamp the requested width and height to the limits.
 	 */
-	align = lcm(SURFACE_ALIGN_BYTES, bpp);
-	min_width = roundup(TEGRA_MIN_WIDTH, align);
-	max_width = rounddown(TEGRA_MAX_WIDTH, align);
-	width = roundup(pix->width * bpp, align);
-
-	pix->width = clamp(width, min_width, max_width) / bpp;
+	pix->width = clamp(pix->width, TEGRA_MIN_WIDTH, TEGRA_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA_MIN_HEIGHT, TEGRA_MAX_HEIGHT);
 
 	/* Clamp the requested bytes per line value. If the maximum bytes per
-- 
2.7.4

