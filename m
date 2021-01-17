Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDF42F949E
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 19:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbhAQScr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 13:32:47 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59848 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729874AbhAQScp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 13:32:45 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id AC1AB1F44A58
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mickael Guene <mickael.guene@st.com>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 07/14] media: marvell-ccic: Use v4l2_async_notifier_add_*_subdev
Date:   Sun, 17 Jan 2021 15:29:46 -0300
Message-Id: <20210117182956.41298-15-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117182956.41298-1-ezequiel@collabora.com>
References: <20210117182956.41298-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The use of v4l2_async_notifier_add_subdev will be discouraged.
Drivers are instead encouraged to use a helper such as
v4l2_async_notifier_add_fwnode_remote_subdev.

This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
should get a kmalloc'ed struct v4l2_async_subdev,
removing some boilerplate code while at it.

Use the appropriate helper: v4l2_async_notifier_add_i2c_subdev
or v4l2_async_notifier_add_fwnode_remote_subdev, which handles
the needed setup, instead of open-coding it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/marvell-ccic/cafe-driver.c | 14 +++++++++++---
 drivers/media/platform/marvell-ccic/mcam-core.c   | 10 ----------
 drivers/media/platform/marvell-ccic/mcam-core.h   |  1 -
 drivers/media/platform/marvell-ccic/mmp-driver.c  | 11 ++++++++---
 4 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/cafe-driver.c b/drivers/media/platform/marvell-ccic/cafe-driver.c
index 00f623d62c96..91d65f71be96 100644
--- a/drivers/media/platform/marvell-ccic/cafe-driver.c
+++ b/drivers/media/platform/marvell-ccic/cafe-driver.c
@@ -489,6 +489,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	int ret;
 	struct cafe_camera *cam;
 	struct mcam_camera *mcam;
+	struct v4l2_async_subdev *asd;
 
 	/*
 	 * Start putting together one of our big camera structures.
@@ -546,9 +547,16 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto out_pdown;
 
-	mcam->asd.match_type = V4L2_ASYNC_MATCH_I2C;
-	mcam->asd.match.i2c.adapter_id = i2c_adapter_id(cam->i2c_adapter);
-	mcam->asd.match.i2c.address = ov7670_info.addr;
+	v4l2_async_notifier_init(&mcam->notifier);
+
+	asd = v4l2_async_notifier_add_i2c_subdev(&mcam->notifier,
+					i2c_adapter_id(cam->i2c_adapter),
+					ov7670_info.addr,
+					sizeof(*asd));
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto out_smbus_shutdown;
+	}
 
 	ret = mccic_register(mcam);
 	if (ret)
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index c012fd2e1d29..153277e4fe80 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -1866,16 +1866,6 @@ int mccic_register(struct mcam_camera *cam)
 	cam->pix_format = mcam_def_pix_format;
 	cam->mbus_code = mcam_def_mbus_code;
 
-	/*
-	 * Register sensor notifier.
-	 */
-	v4l2_async_notifier_init(&cam->notifier);
-	ret = v4l2_async_notifier_add_subdev(&cam->notifier, &cam->asd);
-	if (ret) {
-		cam_warn(cam, "failed to add subdev to a notifier");
-		goto out;
-	}
-
 	cam->notifier.ops = &mccic_notify_ops;
 	ret = v4l2_async_notifier_register(&cam->v4l2_dev, &cam->notifier);
 	if (ret < 0) {
diff --git a/drivers/media/platform/marvell-ccic/mcam-core.h b/drivers/media/platform/marvell-ccic/mcam-core.h
index b55545822fd2..f324d808d737 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.h
+++ b/drivers/media/platform/marvell-ccic/mcam-core.h
@@ -151,7 +151,6 @@ struct mcam_camera {
 	 */
 	struct video_device vdev;
 	struct v4l2_async_notifier notifier;
-	struct v4l2_async_subdev asd;
 	struct v4l2_subdev *sensor;
 
 	/* Videobuf2 stuff */
diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
index 032fdddbbecc..40d9fc4a731a 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -180,6 +180,7 @@ static int mmpcam_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct fwnode_handle *ep;
 	struct mmp_camera_platform_data *pdata;
+	struct v4l2_async_subdev *asd;
 	int ret;
 
 	cam = devm_kzalloc(&pdev->dev, sizeof(*cam), GFP_KERNEL);
@@ -238,10 +239,15 @@ static int mmpcam_probe(struct platform_device *pdev)
 	if (!ep)
 		return -ENODEV;
 
-	mcam->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
-	mcam->asd.match.fwnode = fwnode_graph_get_remote_port_parent(ep);
+	v4l2_async_notifier_init(&mcam->notifier);
 
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&mcam->notifier,
+							   ep, sizeof(*asd));
 	fwnode_handle_put(ep);
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto out;
+	}
 
 	/*
 	 * Register the device with the core.
@@ -278,7 +284,6 @@ static int mmpcam_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	return 0;
 out:
-	fwnode_handle_put(mcam->asd.match.fwnode);
 	mccic_shutdown(mcam);
 
 	return ret;
-- 
2.29.2

