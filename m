Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61CFC242353
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 02:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgHLA1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 20:27:51 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4988 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgHLA1u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 20:27:50 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f3337500000>; Tue, 11 Aug 2020 17:26:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 11 Aug 2020 17:27:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 11 Aug 2020 17:27:50 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Aug
 2020 00:27:49 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 12 Aug 2020 00:27:49 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.172.8]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f3337840005>; Tue, 11 Aug 2020 17:27:49 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 05/10] media: tegra-video: Separate CSI stream enable and disable implementations
Date:   Tue, 11 Aug 2020 17:27:16 -0700
Message-ID: <1597192041-16949-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597192041-16949-1-git-send-email-skomatineni@nvidia.com>
References: <1597192041-16949-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1597192016; bh=uZgxrGDkUOMRSXaG0qPPXkX0uRgXXAAvq4AEaGdQuMg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ZI6jJxMDNU8R7qtwBHVrMz+jmBxd/82ETgcHHzDutiCxjkehC8K98S4HVzgWxH8jT
         A91ZeR/dwv3vSAAoF6neQjDwyAXJVA8egFcX1Mre/YCKuTEVR390opIuytSKoS26e9
         YMnLmDacRACLej4JoGHWHmECsf4ytOXxktp2IbQrq4Woy219Y6tcAZJ3/HPPIHy8Xq
         TBu2GahtpTk4s7/aMO3rZl8XYg0QtDUntUldHp0NwsvlN4LLU/4iHu8QAGJhnlY5cp
         VT7EtKbwgOt2/aCTk5u9HSHeUxNnfc1YpWp/2y/IIB9S7ZSIDROgdQrrYtG+IN6fXV
         0XSLcn/x+Dvbg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch separates implementation of CSI stream enable and disable
into separate functions for readability.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/csi.c | 51 ++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index fb667df..cfe6187 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -232,34 +232,53 @@ static int tegra_csi_g_frame_interval(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
+static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 {
 	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
-	int ret = 0;
+	int ret;
+
+	ret = pm_runtime_get_sync(csi->dev);
+	if (ret < 0) {
+		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
+		pm_runtime_put_noidle(csi->dev);
+		return ret;
+	}
 
 	csi_chan->pg_mode = chan->pg_mode;
-	if (enable) {
-		ret = pm_runtime_get_sync(csi->dev);
-		if (ret < 0) {
-			dev_err(csi->dev,
-				"failed to get runtime PM: %d\n", ret);
-			pm_runtime_put_noidle(csi->dev);
-			return ret;
-		}
+	ret = csi->ops->csi_start_streaming(csi_chan);
+	if (ret < 0)
+		goto rpm_put;
 
-		ret = csi->ops->csi_start_streaming(csi_chan);
-		if (ret < 0)
-			goto rpm_put;
+	return 0;
 
-		return 0;
-	}
+rpm_put:
+	pm_runtime_put(csi->dev);
+	return ret;
+}
+
+static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
+{
+	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
+	struct tegra_csi *csi = csi_chan->csi;
 
 	csi->ops->csi_stop_streaming(csi_chan);
 
-rpm_put:
 	pm_runtime_put(csi->dev);
+
+	return 0;
+}
+
+static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
+{
+	int ret;
+
+	if (enable)
+		ret = tegra_csi_enable_stream(subdev);
+	else
+		ret = tegra_csi_disable_stream(subdev);
+
 	return ret;
 }
 
-- 
2.7.4

