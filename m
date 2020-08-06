Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4214923E1C6
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 21:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729655AbgHFTCQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 15:02:16 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14684 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729249AbgHFTBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 15:01:46 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2c53670000>; Thu, 06 Aug 2020 12:00:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 12:01:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 06 Aug 2020 12:01:45 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Aug
 2020 19:01:45 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 6 Aug 2020 19:01:44 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.172.190]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2c53970000>; Thu, 06 Aug 2020 12:01:44 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 09/10] media: tegra-video: Add CSI MIPI pads calibration
Date:   Thu, 6 Aug 2020 12:01:33 -0700
Message-ID: <1596740494-19306-10-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596740494-19306-1-git-send-email-skomatineni@nvidia.com>
References: <1596740494-19306-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596740455; bh=3W6Pns/QgxtVQou3Zvn+TZ+cxse7K/4yRlz0jorp9so=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=edBTECdqlxwJOIT0WQJW9QDaBUFVsussenmPRW3pXiadGEy5TDj5a0GoHbTqdVgTx
         klsT0YvetjFP41YfQbNVjRRHIK140cOBKMrJwM6f336liCsQ2y+e8iPoiwhJfj3Y8H
         wlatmId7NbmtUaJGLcvZuW5r8CmXnC763plZgYqT7qoNpBA08BgMhnQg5iBadgJ56y
         Lq7ge1Z2QxkJpQwrhMhYxV9UFFdwvD0qMQjJF45jP36AdHHO2vJGaTCYGmEP7PBV/Z
         NMb+l8PxwXqV/gsSm3CcgrTnTODfDaRg0Ds6bEja7bzLoDlCY24BxrXXxpAxdJYR4N
         hWY8vopk9xYKA==
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

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/TODO  |  1 -
 drivers/staging/media/tegra-video/csi.c | 61 +++++++++++++++++++++++++++++++--
 drivers/staging/media/tegra-video/csi.h |  2 ++
 drivers/staging/media/tegra-video/vi.c  | 29 +++++++++++++---
 4 files changed, 84 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/tegra-video/TODO b/drivers/staging/media/tegra-video/TODO
index 97a19b4..98d3c7d 100644
--- a/drivers/staging/media/tegra-video/TODO
+++ b/drivers/staging/media/tegra-video/TODO
@@ -1,5 +1,4 @@
 TODO list
-* Add Tegra CSI MIPI pads calibration.
 * Add MIPI clock Settle time computation based on the data rate.
 * Add support for Ganged mode.
 * Add RAW10 packed video format support to Tegra210 video formats.
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 4176933..7e154f9 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -240,7 +240,7 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
-	int ret;
+	int ret, err;
 
 	ret = pm_runtime_get_sync(csi->dev);
 	if (ret < 0) {
@@ -249,13 +249,47 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 		return ret;
 	}
 
+	if (csi_chan->mipi) {
+		ret = tegra_mipi_enable(csi_chan->mipi);
+		if (ret < 0) {
+			dev_err(csi->dev,
+				"failed to enable MIPI pads: %d\n", ret);
+			goto rpm_put;
+		}
+
+		/*
+		 * CSI MIPI pads PULLUP, PULLDN and TERM impedances need to
+		 * be calibrated after power on.
+		 * So, trigger the calibration start here and results will
+		 * be latched and applied to the pads when link is in LP11
+		 * state during start of sensor streaming.
+		 */
+		ret = tegra_mipi_start_calibration(csi_chan->mipi);
+		if (ret < 0) {
+			dev_err(csi->dev,
+				"failed to start MIPI calibration: %d\n", ret);
+			goto disable_mipi;
+		}
+	}
+
 	csi_chan->pg_mode = chan->pg_mode;
 	ret = csi->ops->csi_start_streaming(csi_chan);
 	if (ret < 0)
-		goto rpm_put;
+		goto finish_calibration;
 
 	return 0;
 
+finish_calibration:
+	if (csi_chan->mipi)
+		tegra_mipi_finish_calibration(csi_chan->mipi);
+disable_mipi:
+	if (csi_chan->mipi) {
+		err = tegra_mipi_disable(csi_chan->mipi);
+		if (err < 0)
+			dev_err(csi->dev,
+				"failed to disable MIPI pads: %d\n", err);
+	}
+
 rpm_put:
 	pm_runtime_put(csi->dev);
 	return ret;
@@ -265,9 +299,17 @@ static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
 {
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
+	int err;
 
 	csi->ops->csi_stop_streaming(csi_chan);
 
+	if (csi_chan->mipi) {
+		err = tegra_mipi_disable(csi_chan->mipi);
+		if (err < 0)
+			dev_err(csi->dev,
+				"failed to disable MIPI pads: %d\n", err);
+	}
+
 	pm_runtime_put(csi->dev);
 
 	return 0;
@@ -313,6 +355,7 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   unsigned int num_pads)
 {
 	struct tegra_csi_channel *chan;
+	int ret = 0;
 
 	chan = kzalloc(sizeof(*chan), GFP_KERNEL);
 	if (!chan)
@@ -331,7 +374,16 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
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
@@ -503,6 +555,9 @@ static void tegra_csi_channels_cleanup(struct tegra_csi *csi)
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
index 29a172f..5543ead 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -191,7 +191,8 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 {
 	struct v4l2_subdev *csi_subdev, *src_subdev;
-	int ret;
+	struct tegra_csi_channel *csi_chan;
+	int ret, err;
 
 	/*
 	 * Tegra CSI receiver can detect the first LP to HS transition.
@@ -206,14 +207,32 @@ static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		return 0;
 
+	csi_chan = v4l2_get_subdevdata(csi_subdev);
+	/*
+	 * TRM has incorrectly documented to wait for done status from
+	 * calibration logic after CSI interface power on.
+	 * As per the design, calibration results are latched and applied
+	 * to the pads only when the link is in LP11 state which will happen
+	 * during the sensor stream-on.
+	 * CSI subdev stream-on triggers start of MIPI pads calibration.
+	 * Wait for calibration to finish here after sensor subdev stream-on.
+	 */
 	src_subdev = tegra_channel_get_remote_source_subdev(chan);
 	ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
-	if (ret < 0 && ret != -ENOIOCTLCMD) {
-		v4l2_subdev_call(csi_subdev, video, s_stream, false);
-		return ret;
-	}
+	err = tegra_mipi_finish_calibration(csi_chan->mipi);
+
+	if (ret < 0 && ret != -ENOIOCTLCMD)
+		goto err_disable_csi_stream;
+
+	if (err < 0)
+		dev_warn(csi_chan->csi->dev,
+			 "MIPI calibration failed: %d\n", ret);
 
 	return 0;
+
+err_disable_csi_stream:
+	v4l2_subdev_call(csi_subdev, video, s_stream, false);
+	return ret;
 }
 
 static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
-- 
2.7.4

