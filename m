Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD446B279E
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 15:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbjCIOqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 09:46:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbjCIOpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 09:45:50 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD44F0FE8;
        Thu,  9 Mar 2023 06:44:31 -0800 (PST)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id CA553FF80B;
        Thu,  9 Mar 2023 14:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1678373053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MDyvqcJLnh/rRPLNU2ZPgLh5AYWNHTEkdgruIRNFhf4=;
        b=fNk/tmXjOlIeSHjmlFwyBeDBN3ybWAYZD+jgEBolcdMCPxHc9l1LIMIv0U1aED8LUSX05O
        Z2bDVpWP1tlfHgmZoQFsjmy6/sUcqxb+njp+WM12ucj/dQhYq5g5XrQOgt1HXl9XUFwyXe
        6Ih5vFsV0bKKeivrwjmgaWQ1qyNy4UAYKcZOABIZ2+6L1QgW3AXcJ3k9NrmhFsqVa2dlL6
        spd+eyU92ye0wPeiAYDaM5YJo+7WgH0jYXXM2ohg4x+pkXZfBtCwjLaJ0gA2HZH9qPRp3a
        c06AEU9c48b/Yu9e2ZjflvFVh8D1i+q6ms+i3Mge+pomcCTeoXLEqw5Fm98cIg==
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [RESEND PATCH v4 15/21] staging: media: tegra-video: move MIPI calibration calls from VI to CSI
Date:   Thu,  9 Mar 2023 15:43:14 +0100
Message-Id: <20230309144320.2937553-16-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI module does not handle all the MIPI lane calibration procedure,
leaving a small part of it to the VI module. In doing this,
tegra_channel_enable_stream() (vi.c) manipulates the private data of the
upstream subdev casting it to struct 'tegra_csi_channel', which will be
wrong after introducing a VIP (parallel video input) channel.

This prevents adding support for the VIP module.  It also breaks the
logical isolation between modules.

Since the lane calibration requirement does not exist in the parallel input
module, moving the calibration function to a per-module op is not
optimal. Instead move the calibration procedure in the CSI module, together
with the rest of the calibration procedures. After this change,
tegra_channel_enable_stream() just calls v4l2_subdev_call() to ask for a
stream start/stop to the CSI module, which in turn knows all the
CSI-specific details to implement it.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/csi.c | 44 ++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c  | 54 ++-----------------------
 2 files changed, 48 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9a03d5ccdf3c..b93fc879ef3a 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -328,12 +328,42 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 	}
 
 	csi_chan->pg_mode = chan->pg_mode;
+
+	/*
+	 * Tegra CSI receiver can detect the first LP to HS transition.
+	 * So, start the CSI stream-on prior to sensor stream-on and
+	 * vice-versa for stream-off.
+	 */
 	ret = csi->ops->csi_start_streaming(csi_chan);
 	if (ret < 0)
 		goto finish_calibration;
 
+	if (csi_chan->mipi) {
+		struct v4l2_subdev *src_subdev;
+		/*
+		 * TRM has incorrectly documented to wait for done status from
+		 * calibration logic after CSI interface power on.
+		 * As per the design, calibration results are latched and applied
+		 * to the pads only when the link is in LP11 state which will happen
+		 * during the sensor stream-on.
+		 * CSI subdev stream-on triggers start of MIPI pads calibration.
+		 * Wait for calibration to finish here after sensor subdev stream-on.
+		 */
+		src_subdev = tegra_channel_get_remote_source_subdev(chan);
+		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
+		err = tegra_mipi_finish_calibration(csi_chan->mipi);
+
+		if (ret < 0 && ret != -ENOIOCTLCMD)
+			goto disable_csi_stream;
+
+		if (err < 0)
+			dev_warn(csi->dev, "MIPI calibration failed: %d\n", err);
+	}
+
 	return 0;
 
+disable_csi_stream:
+	csi->ops->csi_stop_streaming(csi_chan);
 finish_calibration:
 	if (csi_chan->mipi)
 		tegra_mipi_finish_calibration(csi_chan->mipi);
@@ -352,10 +382,24 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 
 static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
 {
+	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 	struct tegra_csi *csi = csi_chan->csi;
 	int err;
 
+	/*
+	 * Stream-off subdevices in reverse order to stream-on.
+	 * Remote source subdev in TPG mode is same as CSI subdev.
+	 */
+	if (csi_chan->mipi) {
+		struct v4l2_subdev *src_subdev;
+
+		src_subdev = tegra_channel_get_remote_source_subdev(chan);
+		err = v4l2_subdev_call(src_subdev, video, s_stream, false);
+		if (err < 0 && err != -ENOIOCTLCMD)
+			dev_err_probe(csi->dev, err, "source subdev stream off failed\n");
+	}
+
 	csi->ops->csi_stop_streaming(csi_chan);
 
 	if (csi_chan->mipi) {
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 3762fd273514..a26eb1ca869f 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -187,49 +187,15 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 
 static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 {
-	struct v4l2_subdev *csi_subdev, *src_subdev;
-	struct tegra_csi_channel *csi_chan;
-	int ret, err;
+	struct v4l2_subdev *subdev;
+	int ret;
 
-	/*
-	 * Tegra CSI receiver can detect the first LP to HS transition.
-	 * So, start the CSI stream-on prior to sensor stream-on and
-	 * vice-versa for stream-off.
-	 */
-	csi_subdev = tegra_channel_get_remote_csi_subdev(chan);
-	ret = v4l2_subdev_call(csi_subdev, video, s_stream, true);
+	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	ret = v4l2_subdev_call(subdev, video, s_stream, true);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
 
-	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		return 0;
-
-	csi_chan = v4l2_get_subdevdata(csi_subdev);
-	/*
-	 * TRM has incorrectly documented to wait for done status from
-	 * calibration logic after CSI interface power on.
-	 * As per the design, calibration results are latched and applied
-	 * to the pads only when the link is in LP11 state which will happen
-	 * during the sensor stream-on.
-	 * CSI subdev stream-on triggers start of MIPI pads calibration.
-	 * Wait for calibration to finish here after sensor subdev stream-on.
-	 */
-	src_subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
-	err = tegra_mipi_finish_calibration(csi_chan->mipi);
-
-	if (ret < 0 && ret != -ENOIOCTLCMD)
-		goto err_disable_csi_stream;
-
-	if (err < 0)
-		dev_warn(csi_chan->csi->dev,
-			 "MIPI calibration failed: %d\n", err);
-
 	return 0;
-
-err_disable_csi_stream:
-	v4l2_subdev_call(csi_subdev, video, s_stream, false);
-	return ret;
 }
 
 static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
@@ -237,18 +203,6 @@ static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	/*
-	 * Stream-off subdevices in reverse order to stream-on.
-	 * Remote source subdev in TPG mode is same as CSI subdev.
-	 */
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, video, s_stream, false);
-	if (ret < 0 && ret != -ENOIOCTLCMD)
-		return ret;
-
-	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		return 0;
-
 	subdev = tegra_channel_get_remote_csi_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, false);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
-- 
2.34.1

