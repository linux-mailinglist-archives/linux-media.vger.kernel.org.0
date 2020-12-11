Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF8D2D7C12
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 18:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733261AbgLKREM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 12:04:12 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5217 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389597AbgLKRD3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 12:03:29 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fd3a6380004>; Fri, 11 Dec 2020 09:02:48 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec
 2020 17:02:48 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 11 Dec 2020 17:02:47 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 01/13] media: tegra-video: Use zero crop settings if subdev has no get_selection
Date:   Fri, 11 Dec 2020 09:02:30 -0800
Message-ID: <1607706162-1548-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
References: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607706168; bh=ERCkCneZmXlmcSkkK9fGRHPBppn9DardS4Sr/wZUI/E=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=gcpA9QztErpYpOa7hcbyXufvoK9zMTFjezm2xAP6QqCdPh0kDWE4p8B/EzTY6XE4T
         m7zn7y7KnbU7oKLc1Aj0dj3wC6PguBqzagckEDeoOP0vciyN1EqZTwNn6+yNcH0TcU
         ErZJXDE089MLSEWEEMzBz3zXPeXMH/oJGwYToG2sCnUIumv4NgUC3v8jKgQ8FqOm+E
         ZVtrtDNsTg63xjw8zHnz1fdo2aheEr8Zw765gG4BNQ4XsUMXLRPqLVNYacKbvEC/7l
         RIVNfCFapTZxedT7cVQV6Xv6sxHscWirhdvbKf2OvveOwLsMzIEp5+Bl5t8fSm2RdW
         WhNXWvDmIFESg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently try format implementation doesn't check if subdevice has
get_selection ops implemented and returns -EINVAL on error from
direct v4l2_subdev_call of get_selection.

Selection API's are not mandatory for all V4L2 subdevices.

This patch fixes it by adding v4l2_subdev_has_ops check prior to
calling get_selection ops and continues with try or set format with
zero crop settings for subdevices that don't have get_selection and
returns -EINVAL only for subdevices that has get_selection ops.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 560d8b3..7edd35c 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -533,11 +533,18 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, pad_cfg, &fse);
 	if (ret) {
-		ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
-		if (ret)
-			return -EINVAL;
-		pad_cfg->try_crop.width = sdsel.r.width;
-		pad_cfg->try_crop.height = sdsel.r.height;
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+			pad_cfg->try_crop.width = 0;
+			pad_cfg->try_crop.height = 0;
+		} else {
+			ret = v4l2_subdev_call(subdev, pad, get_selection,
+					       NULL, &sdsel);
+			if (ret)
+				return -EINVAL;
+
+			pad_cfg->try_crop.width = sdsel.r.width;
+			pad_cfg->try_crop.height = sdsel.r.height;
+		}
 	} else {
 		pad_cfg->try_crop.width = fse.max_width;
 		pad_cfg->try_crop.height = fse.max_height;
-- 
2.7.4

