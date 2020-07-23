Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495C122BA86
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 01:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgGWXst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 19:48:49 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17677 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728436AbgGWXsZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 19:48:25 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1a214e0000>; Thu, 23 Jul 2020 16:46:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Jul 2020 16:48:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 16:48:25 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 23:48:24 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 23 Jul 2020 23:48:24 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.236]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f1a21c80000>; Thu, 23 Jul 2020 16:48:24 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v4 13/14] media: tegra-video: Add CSI MIPI pads calibration
Date:   Thu, 23 Jul 2020 16:51:11 -0700
Message-ID: <1595548272-9809-14-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595547982; bh=g/Xy/d2Bic8K6LHFyDmy9eFDrmnaUyUj6fM56xzP/94=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=C8Jwmp2OJKie2fYU50Er2dsmF4o9TScDvaQ1cKwbC1h4SbAey8f23belzzX8KYbkP
         lwq0k5AFbsY9B0MXzXkvh3tjnbN13CeqBYG82gAsk7HgZc2AZ+7ylAU0MZC3mLMB5V
         3WBFwLJ+jNJi3xPpBVH2Y/FBzCgG2IcY7ZmAEqGSOdM5vkOkgYIbNJGh5SykmXjiMU
         QsMp4IL1amGK63NiXpPtLkcrFmBToEbtA7s1budxxZpoSroAwMCQ1Y6nlNIUi3/FNc
         jFku+X7AVxPm4FqTA4IwCggwalTaFbUd3yKv+OpzP+qh4kkU4Xwm46yuSMqrRy1z7E
         aTB85LtY705bw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CSI MIPI pads need to be enabled and calibrated for capturing from
the external sensor or transmitter.

MIPI CAL unit calibrates MIPI pads pull-up, pull-down and termination
impedances. Calibration is done by co-work of MIPI BIAS pad and MIPI
CAL control unit.

Triggering calibration start can happen any time after MIPI pads are
enabled but calibration results will be latched and applied to MIPI
pads by MIPI CAL unit only when the link is in LP11 state and then
calibration status register gets updated.

This patch enables CSI MIPI pads and calibrates them during streaming.

Tegra CSI receiver is able to catch the very first clock transition.
So, CSI receiver is always enabled prior to sensor streaming and
trigger of calibration start is done during CSI subdev streaming and
status of calibration is verified after sensor stream on.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/csi.c | 55 +++++++++++++++++++++++++++++++--
 drivers/staging/media/tegra-video/csi.h |  2 ++
 drivers/staging/media/tegra-video/vi.c  | 25 ++++++++++++++-
 3 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index c21dd09..bdaf4b6 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -252,15 +252,51 @@ static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
 			return ret;
 		}
 
+		if (csi_chan->mipi) {
+			ret = tegra_mipi_enable(csi_chan->mipi);
+			if (ret < 0) {
+				dev_err(csi->dev,
+					"failed to enable MIPI pads: %d\n",
+					ret);
+				goto rpm_put;
+			}
+
+			/*
+			 * CSI MIPI pads PULLUP, PULLDN and TERM impedances
+			 * need to be calibrated after power on.
+			 * So, trigger the calibration start here and results
+			 * will be latched and applied to the pads when link is
+			 * in LP11 state during start of sensor streaming.
+			 */
+			ret = tegra_mipi_start_calibrate(csi_chan->mipi);
+			if (ret < 0) {
+				dev_err(csi->dev,
+					"failed to start MIPI calibrate: %d\n",
+					ret);
+				goto disable_mipi;
+			}
+		}
+
 		ret = csi->ops->csi_start_streaming(csi_chan);
-		if (ret < 0)
-			goto rpm_put;
+		if (ret < 0) {
+			if (csi_chan->mipi)
+				tegra_mipi_cancel_calibrate(csi_chan->mipi);
+			goto disable_mipi;
+		}
 
 		return 0;
 	}
 
 	csi->ops->csi_stop_streaming(csi_chan);
 
+disable_mipi:
+	if (csi_chan->mipi) {
+		ret = tegra_mipi_disable(csi_chan->mipi);
+		if (ret < 0)
+			dev_err(csi->dev,
+				"failed to disable MIPI pads: %d\n", ret);
+	}
+
 rpm_put:
 	pm_runtime_put(csi->dev);
 	return ret;
@@ -294,6 +330,7 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   unsigned int num_pads)
 {
 	struct tegra_csi_channel *chan;
+	int ret = 0;
 
 	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
 	if (!chan)
@@ -312,7 +349,16 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 		chan->pads[0].flags = MEDIA_PAD_FL_SOURCE;
 	}
 
-	return 0;
+	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
+		return 0;
+
+	chan->mipi = tegra_mipi_request(csi->dev, node);
+	if (IS_ERR(chan->mipi)) {
+		ret = PTR_ERR(chan->mipi);
+		dev_err(csi->dev, "failed to get mipi device: %d\n", ret);
+	}
+
+	return ret;
 }
 
 static int tegra_csi_tpg_channels_alloc(struct tegra_csi *csi)
@@ -475,6 +521,9 @@ static void tegra_csi_channels_cleanup(struct tegra_csi *csi)
 	struct tegra_csi_channel *chan, *tmp;
 
 	list_for_each_entry_safe(chan, tmp, &csi->csi_chans, list) {
+		if (chan->mipi)
+			tegra_mipi_free(chan->mipi);
+
 		subdev = &chan->subdev;
 		if (subdev->dev) {
 			if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 78a5110..0d50fc3 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -50,6 +50,7 @@ struct tegra_csi;
  * @framerate: active framerate for TPG
  * @h_blank: horizontal blanking for TPG active format
  * @v_blank: vertical blanking for TPG active format
+ * @mipi: mipi device for corresponding csi channel pads
  */
 struct tegra_csi_channel {
 	struct list_head list;
@@ -65,6 +66,7 @@ struct tegra_csi_channel {
 	unsigned int framerate;
 	unsigned int h_blank;
 	unsigned int v_blank;
+	struct tegra_mipi_device *mipi;
 };
 
 /**
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index fc43629..129790c 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -191,10 +191,12 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on)
 {
 	struct v4l2_subdev *subdev, *csi_subdev, *src_subdev;
+	struct tegra_csi_channel *csi_chan;
 	int ret;
 
 	csi_subdev = tegra_channel_get_remote_csi_subdev(chan);
 	src_subdev = tegra_channel_get_remote_source_subdev(chan);
+	csi_chan = v4l2_get_subdevdata(csi_subdev);
 	/*
 	 * Tegra CSI receiver can detect the first LP to HS transition.
 	 * So, start the CSI stream-on prior to sensor stream-on and
@@ -208,10 +210,31 @@ int tegra_channel_set_stream(struct tegra_vi_channel *chan, bool on)
 	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		return 0;
 
+	/*
+	 * TRM has incorrectly documented to wait for done status from
+	 * calibration logic after CSI interface power on.
+	 * As per the design, calibration results are latched and applied
+	 * to the pads only when the link is in LP11 state which will happen
+	 * during the sensor stream-on.
+	 * CSI subdev stream-on triggers start of MIPI pads calibration.
+	 * Wait for calibration to finish here after sensor subdev stream-on
+	 * and in case of sensor stream-on failure, cancel the calibration.
+	 */
 	subdev = on ? src_subdev : csi_subdev;
 	ret = v4l2_subdev_call(subdev, video, s_stream, on);
-	if (ret < 0 && ret != -ENOIOCTLCMD)
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		if (on && csi_chan->mipi)
+			tegra_mipi_cancel_calibrate(csi_chan->mipi);
 		return ret;
+	}
+
+	if (on && csi_chan->mipi) {
+		ret = tegra_mipi_finish_calibrate(csi_chan->mipi);
+		if (ret < 0)
+			dev_err(csi_chan->csi->dev,
+				"MIPI calibration failed: %d\n", ret);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.7.4

