Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885D323E1A4
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 21:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729363AbgHFTBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 15:01:48 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14653 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728507AbgHFTBj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 15:01:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2c535f0000>; Thu, 06 Aug 2020 12:00:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 12:01:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 06 Aug 2020 12:01:37 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 19:01:37 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 6 Aug 2020 19:01:37 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.172.190]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2c53900000>; Thu, 06 Aug 2020 12:01:36 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 03/10] media: tegra-video: Update format lookup to offset based
Date:   Thu, 6 Aug 2020 12:01:27 -0700
Message-ID: <1596740494-19306-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596740494-19306-1-git-send-email-skomatineni@nvidia.com>
References: <1596740494-19306-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596740447; bh=5U56MbpoGgbizDY87xBQZF5BWeIIcAyUuev+l62V8Co=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=cEQf+DCGF1Y6u2lRk1nLMRrOwBxxLsb6NaEttr4kWxiXiPmIff1Si6AOhh/XZePeo
         SrN8K6goD9fOAQu0/rNFfjTd4o8wUaGMrZfERtlR4XDq6ujHGAId8GOhmy7pPe7EN3
         nlVHYg1aCrEnGSeM2FCBC1CcwHCHUaJgJd6pcVRqrq7u/BV99133gJ23xdjdbxl4DD
         iWkQzUy9cmskGdmBOSvWtzE9KPftnVpejoWJhmrNOt8MMW/N6o6ylNzdCcRqYB0Fkn
         F7vRNelQ5xM5XExuM9QJrmDE7p44AE+Wizuf7oli8uYT7i3czl2ZLC/EtvPE3rn7H3
         /kHjVe+YA3Paw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra VI supported video formats are more for non TPG and there
can be multiple pixel formats for the same media bus format.

This patch updates the helper function for format lookup based on
mbus code from pre-defined Tegra supported format list to look from
the specified list index offset.

Offset based look up is used with sensor device graph (non TPG)
where format enumeration can list all supported formats for the
specific sensor mbus codes.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 0197f4e..52d751f 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -53,11 +53,12 @@ to_tegra_channel_buffer(struct vb2_v4l2_buffer *vb)
 }
 
 static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
-					unsigned int code)
+					unsigned int code,
+					unsigned int offset)
 {
 	unsigned int i;
 
-	for (i = 0; i < vi->soc->nformats; ++i) {
+	for (i = offset; i < vi->soc->nformats; ++i) {
 		if (vi->soc->video_formats[i].code == code)
 			return i;
 	}
@@ -598,11 +599,12 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 	bitmap_zero(chan->tpg_fmts_bitmap, MAX_FORMAT_NUM);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_SRGGB10_1X10);
+					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_RGB888_1X32_PADHI);
+					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
+					     0);
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 }
 
-- 
2.7.4

