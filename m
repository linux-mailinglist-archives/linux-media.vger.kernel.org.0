Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B98294319
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438180AbgJTTfa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:35:30 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9834 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438164AbgJTTf3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:35:29 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8f3bf40000>; Tue, 20 Oct 2020 12:35:16 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 19:35:28 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 20 Oct 2020 19:35:28 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/9] media: tegra-video: Use zero crop settings if subdev has no get_selection
Date:   Tue, 20 Oct 2020 12:36:07 -0700
Message-ID: <1603222575-14427-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603222575-14427-1-git-send-email-skomatineni@nvidia.com>
References: <1603222575-14427-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603222516; bh=ERCkCneZmXlmcSkkK9fGRHPBppn9DardS4Sr/wZUI/E=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=OUfOBy591NFmO/4ltl4G2SFSVsqzD6MKSeyLYwJUjN0t11/IFldCdYNphPmz585Ss
         dMGB543luglCpBLjWbj7+cW7iwczih9vl+zCaNowjvyN3dyo9jwu93XJ/BV/732kP4
         X1rzzf037nUmyQG4K1kMzIBP6DBivgHwEQPTo+6KS4MVYT4iSqO7FsE88njzBPPij9
         eU/qy4+YAbxz6P1NneKB0W1iLwCwI0gBJ6lvWiAi+8+HDNx6K2rXTAsgqP57Cp9BMp
         T4b2F42mDU7CiLDT8OlvVjHQM+xTtDqw77LSDgEz1KFdQIkUMXKTaSuY5OZnpO3xae
         zeetzzSEjXKMA==
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

