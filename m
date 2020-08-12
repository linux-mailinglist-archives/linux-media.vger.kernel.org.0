Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69EB424235C
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 02:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgHLA1s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 20:27:48 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16777 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgHLA1q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 20:27:46 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f3337740001>; Tue, 11 Aug 2020 17:27:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 11 Aug 2020 17:27:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 11 Aug 2020 17:27:46 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Aug
 2020 00:27:45 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 12 Aug 2020 00:27:45 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.172.8]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f3337800001>; Tue, 11 Aug 2020 17:27:45 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 01/10] media: tegra-video: Fix channel format alignment
Date:   Tue, 11 Aug 2020 17:27:12 -0700
Message-ID: <1597192041-16949-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597192041-16949-1-git-send-email-skomatineni@nvidia.com>
References: <1597192041-16949-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1597192052; bh=8GJbUvoTqNXQhoilqMQO06MgCPv5IgO6eahUeR7/0ig=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=CtchQyDxo6dEWACsWBmpfxy7sb08DJHNkxehN6oBK3weN2+U2HmEnvUav1zcrPLdc
         nX4QaF/QESFYHC+kIgJVxTjmvTmr9SKnvdQwaOqWwDhDU+22/KdgDSV4NISI4QQncQ
         Pq0ZEhLIMwTeVzqIlwPEGxJToegdfUb4YSzRvBp+F/HcVnW6+Ve6dswLJ0TEM4OsQ/
         HfIJjANZuWUBBQRNV/pDxsh6RYKT1Ga67uEHo4NLyiLLWyyI9REk+qprjfhgoUU7Qj
         lE2+LvbkKe9akD8qcJTslJNATPE8XiuBM8lxOWs4ePqN+m/Wg/kOl1QqEOcBMGsKpS
         vqf5kbo3YdaCg==
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

