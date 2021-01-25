Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3B9304861
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388634AbhAZFpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:45:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbhAYNc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:32:59 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA64C06174A
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 05:29:56 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id C9E93634CD4;
        Mon, 25 Jan 2021 15:25:59 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 14/14] media: v4l2-async: Improve v4l2_async_notifier_add_*_subdev() API
Date:   Mon, 25 Jan 2021 15:22:30 +0200
Message-Id: <20210125132230.6600-29-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The functions that add an async subdev to an async subdev notifier take
as an argument the size of the container structure they need to
allocate. This is error prone, as passing an invalid size will not be
caught by the compiler. Wrap those functions in macros that take a
container type instead of a size, and cast the returned pointer to the
desired type. The compiler will catch mistakes if the incorrect type is
passed to the macro, as the assignment types won't match.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/max9286.c                   |  2 +-
 drivers/media/i2c/st-mipid02.c                |  2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      | 10 +++----
 drivers/media/platform/am437x/am437x-vpfe.c   |  2 +-
 drivers/media/platform/atmel/atmel-isi.c      |  2 +-
 .../media/platform/atmel/atmel-sama5d2-isc.c  |  2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  3 +-
 drivers/media/platform/davinci/vpif_capture.c |  2 +-
 drivers/media/platform/exynos4-is/media-dev.c |  3 +-
 .../media/platform/marvell-ccic/cafe-driver.c |  2 +-
 .../media/platform/marvell-ccic/mmp-driver.c  |  4 +--
 drivers/media/platform/omap3isp/isp.c         | 17 ++++-------
 drivers/media/platform/pxa_camera.c           |  4 +--
 drivers/media/platform/qcom/camss/camss.c     | 11 +++----
 drivers/media/platform/rcar-vin/rcar-core.c   |  5 ++--
 drivers/media/platform/rcar-vin/rcar-csi2.c   |  2 +-
 drivers/media/platform/rcar_drif.c            |  2 +-
 drivers/media/platform/renesas-ceu.c          | 20 +++++--------
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 10 +++----
 drivers/media/platform/stm32/stm32-dcmi.c     |  3 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  4 +--
 drivers/media/platform/ti-vpe/cal.c           | 12 ++++----
 drivers/media/platform/video-mux.c            |  2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   | 10 +++----
 drivers/media/v4l2-core/v4l2-async.c          | 30 +++++++++----------
 drivers/media/v4l2-core/v4l2-fwnode.c         |  4 +--
 drivers/staging/media/imx/imx-media-csi.c     |  2 +-
 drivers/staging/media/imx/imx-media-of.c      |  2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  2 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  2 +-
 drivers/staging/media/imx/imx7-mipi-csis.c    |  2 +-
 drivers/staging/media/tegra-video/vi.c        | 10 +++----
 include/media/v4l2-async.h                    | 27 +++++++++++------
 33 files changed, 106 insertions(+), 111 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index b1e2476d3c9e..02dff168aa7c 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -580,7 +580,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 
 		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
 							    source->fwnode,
-							    sizeof(struct max9286_asd));
+							    struct max9286_asd);
 		if (IS_ERR(asd)) {
 			dev_err(dev, "Failed to add subdev for source %u: %ld",
 				i, PTR_ERR(asd));
diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 42549b3a62a0..8741cdfdc389 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -879,7 +879,7 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
 					&bridge->notifier,
 					of_fwnode_handle(ep_node),
-					sizeof(*asd));
+					struct v4l2_async_subdev);
 	of_node_put(ep_node);
 
 	if (IS_ERR(asd)) {
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 6e121e7a5ecd..7dcea3001209 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1465,7 +1465,6 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
 			.bus_type = V4L2_MBUS_CSI2_DPHY
 		};
 		struct sensor_async_subdev *s_asd;
-		struct v4l2_async_subdev *asd;
 		struct fwnode_handle *ep;
 
 		ep = fwnode_graph_get_endpoint_by_id(
@@ -1479,14 +1478,13 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
 		if (ret)
 			goto err_parse;
 
-		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
-				&cio2->notifier, ep, sizeof(*s_asd));
-		if (IS_ERR(asd)) {
-			ret = PTR_ERR(asd);
+		s_asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+				&cio2->notifier, ep, struct sensor_async_subdev);
+		if (IS_ERR(s_asd)) {
+			ret = PTR_ERR(s_asd);
 			goto err_parse;
 		}
 
-		s_asd = container_of(asd, struct sensor_async_subdev, asd);
 		s_asd->csi2.port = vep.base.port;
 		s_asd->csi2.lanes = vep.bus.mipi_csi2.num_data_lanes;
 
diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 0fb9f9ba1219..6cdc77dda0e4 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -2365,7 +2365,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 
 		pdata->asd[i] = v4l2_async_notifier_add_fwnode_subdev(
 			&vpfe->notifier, of_fwnode_handle(rem),
-			sizeof(struct v4l2_async_subdev));
+			struct v4l2_async_subdev);
 		of_node_put(rem);
 		if (IS_ERR(pdata->asd[i]))
 			goto cleanup;
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index c1a6dd7af002..0514be6153df 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1150,7 +1150,7 @@ static int isi_graph_init(struct atmel_isi *isi)
 	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
 						&isi->notifier,
 						of_fwnode_handle(ep),
-						sizeof(*asd));
+						struct v4l2_async_subdev);
 	of_node_put(ep);
 
 	if (IS_ERR(asd))
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 9ee2cd194f93..0b78fecfd2a8 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -214,7 +214,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
 					&subdev_entity->notifier,
 					of_fwnode_handle(subdev_entity->epn),
-					sizeof(*asd));
+					struct v4l2_async_subdev);
 
 		of_node_put(subdev_entity->epn);
 		subdev_entity->epn = NULL;
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 7d299cacef8c..c68a3eac62cd 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -398,7 +398,8 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 	v4l2_async_notifier_init(&csi2rx->notifier);
 
 	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&csi2rx->notifier,
-							   fwh, sizeof(*asd));
+							   fwh,
+							   struct v4l2_async_subdev);
 	of_node_put(ep);
 	if (IS_ERR(asd))
 		return PTR_ERR(asd);
diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index 72a0e94e2e21..8d2e165bf7de 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -1584,7 +1584,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 
 		pdata->asd[i] = v4l2_async_notifier_add_fwnode_subdev(
 			&vpif_obj.notifier, of_fwnode_handle(rem),
-			sizeof(struct v4l2_async_subdev));
+			struct v4l2_async_subdev);
 		if (IS_ERR(pdata->asd[i]))
 			goto err_cleanup;
 
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index f4687b0cbd65..8e1e892085ec 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -465,7 +465,8 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 	}
 
 	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
-		&fmd->subdev_notifier, of_fwnode_handle(ep), sizeof(*asd));
+		&fmd->subdev_notifier, of_fwnode_handle(ep),
+		struct v4l2_async_subdev);
 
 	of_node_put(ep);
 
diff --git a/drivers/media/platform/marvell-ccic/cafe-driver.c b/drivers/media/platform/marvell-ccic/cafe-driver.c
index 91d65f71be96..9c94a8b58b7c 100644
--- a/drivers/media/platform/marvell-ccic/cafe-driver.c
+++ b/drivers/media/platform/marvell-ccic/cafe-driver.c
@@ -552,7 +552,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	asd = v4l2_async_notifier_add_i2c_subdev(&mcam->notifier,
 					i2c_adapter_id(cam->i2c_adapter),
 					ov7670_info.addr,
-					sizeof(*asd));
+					struct v4l2_async_subdev);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		goto out_smbus_shutdown;
diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
index 40d9fc4a731a..f2f09cea751d 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -241,8 +241,8 @@ static int mmpcam_probe(struct platform_device *pdev)
 
 	v4l2_async_notifier_init(&mcam->notifier);
 
-	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&mcam->notifier,
-							   ep, sizeof(*asd));
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&mcam->notifier, ep,
+							   struct v4l2_async_subdev);
 	fwnode_handle_put(ep);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 1311b4996ece..a6bb7d9bf75f 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2141,7 +2141,6 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
 {
 	struct fwnode_handle *ep;
 	struct isp_async_subdev *isd = NULL;
-	struct v4l2_async_subdev *asd;
 	unsigned int i;
 
 	ep = fwnode_graph_get_endpoint_by_id(
@@ -2159,12 +2158,10 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 
 		if (!ret) {
-			asd = v4l2_async_notifier_add_fwnode_remote_subdev(
-				&isp->notifier, ep, sizeof(*isd));
-			if (!IS_ERR(asd)) {
-				isd = container_of(asd, struct isp_async_subdev, asd);
+			isd = v4l2_async_notifier_add_fwnode_remote_subdev(
+				&isp->notifier, ep, struct isp_async_subdev);
+			if (!IS_ERR(isd))
 				isp_parse_of_parallel_endpoint(isp->dev, &vep, &isd->bus);
-			}
 		}
 
 		fwnode_handle_put(ep);
@@ -2200,12 +2197,10 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
 		}
 
 		if (!ret) {
-			asd = v4l2_async_notifier_add_fwnode_remote_subdev(
-				&isp->notifier, ep, sizeof(*isd));
-
-			if (!IS_ERR(asd)) {
-				isd = container_of(asd, struct isp_async_subdev, asd);
+			isd = v4l2_async_notifier_add_fwnode_remote_subdev(
+				&isp->notifier, ep, struct isp_async_subdev);
 
+			if (!IS_ERR(isd)) {
 				switch (vep.bus_type) {
 				case V4L2_MBUS_CSI2_DPHY:
 					isd->bus.interface =
diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index 5d169ff7771b..ebe18c450c84 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -2256,7 +2256,7 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
 	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
 				&pcdev->notifier,
 				of_fwnode_handle(np),
-				sizeof(*asd));
+				struct v4l2_async_subdev);
 	if (IS_ERR(asd))
 		err = PTR_ERR(asd);
 out:
@@ -2306,7 +2306,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 				&pcdev->notifier,
 				pcdev->pdata->sensor_i2c_adapter_id,
 				pcdev->pdata->sensor_i2c_address,
-				sizeof(*asd));
+				struct v4l2_async_subdev);
 		if (IS_ERR(asd))
 			err = PTR_ERR(asd);
 	} else if (pdev->dev.of_node) {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8fefce57bc49..7c0f669f8aa6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -655,7 +655,6 @@ static int camss_of_parse_ports(struct camss *camss)
 
 	for_each_endpoint_of_node(dev->of_node, node) {
 		struct camss_async_subdev *csd;
-		struct v4l2_async_subdev *asd;
 
 		if (!of_device_is_available(node))
 			continue;
@@ -667,17 +666,15 @@ static int camss_of_parse_ports(struct camss *camss)
 			goto err_cleanup;
 		}
 
-		asd = v4l2_async_notifier_add_fwnode_subdev(
+		csd = v4l2_async_notifier_add_fwnode_subdev(
 			&camss->notifier, of_fwnode_handle(remote),
-			sizeof(*csd));
+			struct camss_async_subdev);
 		of_node_put(remote);
-		if (IS_ERR(asd)) {
-			ret = PTR_ERR(asd);
+		if (IS_ERR(csd)) {
+			ret = PTR_ERR(csd);
 			goto err_cleanup;
 		}
 
-		csd = container_of(asd, struct camss_async_subdev, asd);
-
 		ret = camss_of_parse_endpoint_node(dev, node, csd);
 		if (ret < 0)
 			goto err_cleanup;
diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 98bff765b02e..a9cc09653110 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -642,7 +642,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 	}
 
 	asd = v4l2_async_notifier_add_fwnode_subdev(&vin->notifier, fwnode,
-						    sizeof(*asd));
+						    struct v4l2_async_subdev);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		goto out;
@@ -842,7 +842,8 @@ static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
 	}
 
 	asd = v4l2_async_notifier_add_fwnode_subdev(&vin->group->notifier,
-						    fwnode, sizeof(*asd));
+						    fwnode,
+						    struct v4l2_async_subdev);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		goto out;
diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 945d2eb87233..e06cd512aba2 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -910,7 +910,7 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 	priv->notifier.ops = &rcar_csi2_notify_ops;
 
 	asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier, fwnode,
-						    sizeof(*asd));
+						    struct v4l2_async_subdev);
 	fwnode_handle_put(fwnode);
 	if (IS_ERR(asd))
 		return PTR_ERR(asd);
diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
index f318cd4b8086..83bd9a412a56 100644
--- a/drivers/media/platform/rcar_drif.c
+++ b/drivers/media/platform/rcar_drif.c
@@ -1231,7 +1231,7 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
 	}
 
 	asd = v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode,
-						    sizeof(*asd));
+						    struct v4l2_async_subdev);
 	fwnode_handle_put(fwnode);
 	if (IS_ERR(asd))
 		return PTR_ERR(asd);
diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index 0298d08b39e4..1678175c49bd 100644
--- a/drivers/media/platform/renesas-ceu.c
+++ b/drivers/media/platform/renesas-ceu.c
@@ -1495,7 +1495,6 @@ static int ceu_parse_platform_data(struct ceu_device *ceudev,
 				   const struct ceu_platform_data *pdata)
 {
 	const struct ceu_async_subdev *async_sd;
-	struct v4l2_async_subdev *asd;
 	struct ceu_subdev *ceu_sd;
 	unsigned int i;
 	int ret;
@@ -1511,15 +1510,14 @@ static int ceu_parse_platform_data(struct ceu_device *ceudev,
 
 		/* Setup the ceu subdevice and the async subdevice. */
 		async_sd = &pdata->subdevs[i];
-		asd = v4l2_async_notifier_add_i2c_subdev(&ceudev->notifier,
+		ceu_sd = v4l2_async_notifier_add_i2c_subdev(&ceudev->notifier,
 				async_sd->i2c_adapter_id,
 				async_sd->i2c_address,
-				sizeof(*ceu_sd));
-		if (IS_ERR(asd)) {
+				struct ceu_subdev);
+		if (IS_ERR(ceu_sd)) {
 			v4l2_async_notifier_cleanup(&ceudev->notifier);
-			return PTR_ERR(asd);
+			return PTR_ERR(ceu_sd);
 		}
-		ceu_sd = to_ceu_subdev(asd);
 		ceu_sd->mbus_flags = async_sd->flags;
 		ceudev->subdevs[i] = ceu_sd;
 	}
@@ -1534,7 +1532,6 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
 {
 	struct device_node *of = ceudev->dev->of_node;
 	struct device_node *ep;
-	struct v4l2_async_subdev *asd;
 	struct ceu_subdev *ceu_sd;
 	unsigned int i;
 	int num_ep;
@@ -1576,14 +1573,13 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
 		}
 
 		/* Setup the ceu subdevice and the async subdevice. */
-		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+		ceu_sd = v4l2_async_notifier_add_fwnode_remote_subdev(
 				&ceudev->notifier, of_fwnode_handle(ep),
-				sizeof(*ceu_sd));
-		if (IS_ERR(asd)) {
-			ret = PTR_ERR(asd);
+				struct ceu_subdev);
+		if (IS_ERR(ceu_sd)) {
+			ret = PTR_ERR(ceu_sd);
 			goto error_cleanup;
 		}
-		ceu_sd = to_ceu_subdev(asd);
 		ceu_sd->mbus_flags = fw_ep.bus.parallel.flags;
 		ceudev->subdevs[i] = ceu_sd;
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 235dcf0c4122..447721e78d1e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -251,8 +251,7 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
 		struct v4l2_fwnode_endpoint vep = {
 			.bus_type = V4L2_MBUS_CSI2_DPHY
 		};
-		struct rkisp1_sensor_async *rk_asd = NULL;
-		struct v4l2_async_subdev *asd;
+		struct rkisp1_sensor_async *rk_asd;
 		struct fwnode_handle *ep;
 
 		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
@@ -265,12 +264,11 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
 		if (ret)
 			goto err_parse;
 
-		asd = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
-							sizeof(*rk_asd));
-		if (IS_ERR(asd))
+		rk_asd = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
+							struct rkisp1_sensor_async);
+		if (IS_ERR(rk_asd))
 			goto err_parse;
 
-		rk_asd = container_of(asd, struct rkisp1_sensor_async, asd);
 		rk_asd->mbus_type = vep.bus_type;
 		rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
 		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index 142f63d07dcd..bbcc2254fa2e 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -1820,7 +1820,8 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 	v4l2_async_notifier_init(&dcmi->notifier);
 
 	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
-		&dcmi->notifier, of_fwnode_handle(ep), sizeof(*asd));
+		&dcmi->notifier, of_fwnode_handle(ep),
+		struct v4l2_async_subdev);
 
 	of_node_put(ep);
 
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index 3f94b8c966f3..8d40a7acba9c 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -135,8 +135,8 @@ static int sun4i_csi_notifier_init(struct sun4i_csi *csi)
 
 	csi->bus = vep.bus.parallel;
 
-	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notifier,
-							   ep, sizeof(*asd));
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notifier, ep,
+							   struct v4l2_async_subdev);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		goto out;
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 5fb627811c6b..fa0931788040 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -685,23 +685,21 @@ static int cal_async_notifier_register(struct cal_dev *cal)
 	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 		struct cal_camerarx *phy = cal->phy[i];
 		struct cal_v4l2_async_subdev *casd;
-		struct v4l2_async_subdev *asd;
 		struct fwnode_handle *fwnode;
 
 		if (!phy->sensor_node)
 			continue;
 
 		fwnode = of_fwnode_handle(phy->sensor_node);
-		asd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
-							    fwnode,
-							    sizeof(*casd));
-		if (IS_ERR(asd)) {
+		casd = v4l2_async_notifier_add_fwnode_subdev(&cal->notifier,
+							     fwnode,
+							     struct cal_v4l2_async_subdev);
+		if (IS_ERR(casd)) {
 			phy_err(phy, "Failed to add subdev to notifier\n");
-			ret = PTR_ERR(asd);
+			ret = PTR_ERR(casd);
 			goto error;
 		}
 
-		casd = to_cal_asd(asd);
 		casd->phy = phy;
 	}
 
diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 7b280dfca727..133122e38515 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -371,7 +371,7 @@ static int video_mux_async_register(struct video_mux *vmux,
 			continue;
 
 		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
-			&vmux->notifier, ep, sizeof(*asd));
+			&vmux->notifier, ep, struct v4l2_async_subdev);
 
 		fwnode_handle_put(ep);
 
diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index cc2856efea59..bf4015d852e3 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -359,7 +359,7 @@ static int xvip_graph_parse_one(struct xvip_composite_device *xdev,
 	dev_dbg(xdev->dev, "parsing node %p\n", fwnode);
 
 	while (1) {
-		struct v4l2_async_subdev *asd;
+		struct xvip_graph_entity *xge;
 
 		ep = fwnode_graph_get_next_endpoint(fwnode, ep);
 		if (ep == NULL)
@@ -382,12 +382,12 @@ static int xvip_graph_parse_one(struct xvip_composite_device *xdev,
 			continue;
 		}
 
-		asd = v4l2_async_notifier_add_fwnode_subdev(
+		xge = v4l2_async_notifier_add_fwnode_subdev(
 			&xdev->notifier, remote,
-			sizeof(struct xvip_graph_entity));
+			struct xvip_graph_entity);
 		fwnode_handle_put(remote);
-		if (IS_ERR(asd)) {
-			ret = PTR_ERR(asd);
+		if (IS_ERR(xge)) {
+			ret = PTR_ERR(xge);
 			goto err_notifier_cleanup;
 		}
 	}
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index bd1944c2d062..c265d99cae78 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -623,9 +623,9 @@ int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_subdev);
 
 struct v4l2_async_subdev *
-v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
-				      struct fwnode_handle *fwnode,
-				      unsigned int asd_struct_size)
+__v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
+					struct fwnode_handle *fwnode,
+					unsigned int asd_struct_size)
 {
 	struct v4l2_async_subdev *asd;
 	int ret;
@@ -646,12 +646,12 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
 
 	return asd;
 }
-EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_fwnode_subdev);
+EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_fwnode_subdev);
 
 struct v4l2_async_subdev *
-v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
-					     struct fwnode_handle *endpoint,
-					     unsigned int asd_struct_size)
+__v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
+					       struct fwnode_handle *endpoint,
+					       unsigned int asd_struct_size)
 {
 	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *remote;
@@ -660,21 +660,21 @@ v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
 	if (!remote)
 		return ERR_PTR(ENOTCONN);
 
-	asd = v4l2_async_notifier_add_fwnode_subdev(notif, remote,
-						    asd_struct_size);
+	asd = __v4l2_async_notifier_add_fwnode_subdev(notif, remote,
+						      asd_struct_size);
 	/*
-	 * Calling v4l2_async_notifier_add_fwnode_subdev grabs a refcount,
+	 * Calling __v4l2_async_notifier_add_fwnode_subdev grabs a refcount,
 	 * so drop the one we got in fwnode_graph_get_remote_port_parent.
 	 */
 	fwnode_handle_put(remote);
 	return asd;
 }
-EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_fwnode_remote_subdev);
+EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_fwnode_remote_subdev);
 
 struct v4l2_async_subdev *
-v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
-				   int adapter_id, unsigned short address,
-				   unsigned int asd_struct_size)
+__v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
+				     int adapter_id, unsigned short address,
+				     unsigned int asd_struct_size)
 {
 	struct v4l2_async_subdev *asd;
 	int ret;
@@ -695,7 +695,7 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
 
 	return asd;
 }
-EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_i2c_subdev);
+EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_i2c_subdev);
 
 int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 {
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 919fde20032e..74226f8f99e7 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -955,7 +955,7 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
 
 		asd = v4l2_async_notifier_add_fwnode_subdev(notifier,
 							    args.fwnode,
-							    sizeof(*asd));
+							    struct v4l2_async_subdev);
 		fwnode_handle_put(args.fwnode);
 		if (IS_ERR(asd)) {
 			/* not an error if asd already exists */
@@ -1255,7 +1255,7 @@ v4l2_fwnode_reference_parse_int_props(struct device *dev,
 		struct v4l2_async_subdev *asd;
 
 		asd = v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode,
-							    sizeof(*asd));
+							    struct v4l2_async_subdev);
 		fwnode_handle_put(fwnode);
 		if (IS_ERR(asd)) {
 			ret = PTR_ERR(asd);
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 6344389e6afa..ef5add079774 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1923,7 +1923,7 @@ static int imx_csi_async_register(struct csi_priv *priv)
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (ep) {
 		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
-			&priv->notifier, ep, sizeof(*asd));
+			&priv->notifier, ep, struct v4l2_async_subdev);
 
 		fwnode_handle_put(ep);
 
diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index 82e13e972e23..b677cf0e0c84 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -31,7 +31,7 @@ int imx_media_of_add_csi(struct imx_media_dev *imxmd,
 	/* add CSI fwnode to async notifier */
 	asd = v4l2_async_notifier_add_fwnode_subdev(&imxmd->notifier,
 						    of_fwnode_handle(csi_np),
-						    sizeof(*asd));
+						    struct v4l2_async_subdev);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		if (ret == -EEXIST)
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 9457761b7c8b..1b3fef9d0aa9 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -578,7 +578,7 @@ static int csi2_async_register(struct csi2_dev *csi2)
 	dev_dbg(csi2->dev, "flags: 0x%08x\n", csi2->bus.flags);
 
 	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
-		&csi2->notifier, ep, sizeof(*asd));
+		&csi2->notifier, ep, struct v4l2_async_subdev);
 	fwnode_handle_put(ep);
 
 	if (IS_ERR(asd))
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 6c59485291ca..3046f880c014 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1201,7 +1201,7 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (ep) {
 		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
-			&csi->notifier, ep, sizeof(*asd));
+			&csi->notifier, ep, struct v4l2_async_subdev);
 
 		fwnode_handle_put(ep);
 
diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 32d8e7a824d4..0969ee528e38 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1025,7 +1025,7 @@ static int mipi_csis_async_register(struct csi_state *state)
 	dev_dbg(state->dev, "flags: 0x%08x\n", state->bus.flags);
 
 	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
-		&state->notifier, ep, sizeof(*asd));
+		&state->notifier, ep, struct v4l2_async_subdev);
 	if (IS_ERR(asd))
 		goto err_parse;
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 70e1e18644b2..7a09061cda57 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1788,7 +1788,7 @@ static int tegra_vi_graph_parse_one(struct tegra_vi_channel *chan,
 	struct tegra_vi *vi = chan->vi;
 	struct fwnode_handle *ep = NULL;
 	struct fwnode_handle *remote = NULL;
-	struct v4l2_async_subdev *asd;
+	struct tegra_vi_graph_entity *tvge;
 	struct device_node *node = NULL;
 	int ret;
 
@@ -1812,10 +1812,10 @@ static int tegra_vi_graph_parse_one(struct tegra_vi_channel *chan,
 			continue;
 		}
 
-		asd = v4l2_async_notifier_add_fwnode_subdev(&chan->notifier,
-				remote, sizeof(struct tegra_vi_graph_entity));
-		if (IS_ERR(asd)) {
-			ret = PTR_ERR(asd);
+		tvge = v4l2_async_notifier_add_fwnode_subdev(&chan->notifier,
+				remote, struct tegra_vi_graph_entity);
+		if (IS_ERR(tvge)) {
+			ret = PTR_ERR(tvge);
 			dev_err(vi->dev,
 				"failed to add subdev to notifier: %d\n", ret);
 			fwnode_handle_put(remote);
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index ef4ac3559be9..f817e8b0d31b 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -173,9 +173,12 @@ int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
  * is released later at notifier cleanup time.
  */
 struct v4l2_async_subdev *
-v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
-				      struct fwnode_handle *fwnode,
-				      unsigned int asd_struct_size);
+__v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
+					struct fwnode_handle *fwnode,
+					unsigned int asd_struct_size);
+#define v4l2_async_notifier_add_fwnode_subdev(__notifier, __fwnode, __type)	\
+((__type *)__v4l2_async_notifier_add_fwnode_subdev(__notifier, __fwnode,	\
+						   sizeof(__type)))
 
 /**
  * v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
@@ -199,9 +202,12 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
  * exception that the fwnode refers to a local endpoint, not the remote one.
  */
 struct v4l2_async_subdev *
-v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
-					     struct fwnode_handle *endpoint,
-					     unsigned int asd_struct_size);
+__v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
+					       struct fwnode_handle *endpoint,
+					       unsigned int asd_struct_size);
+#define v4l2_async_notifier_add_fwnode_remote_subdev(__notifier, __ep, __type)	\
+((__type *)__v4l2_async_notifier_add_fwnode_remote_subdev(__notifier, __ep,	\
+							  sizeof(__type)))
 
 /**
  * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
@@ -219,9 +225,12 @@ v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
  * Same as above but for I2C matched sub-devices.
  */
 struct v4l2_async_subdev *
-v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
-				   int adapter_id, unsigned short address,
-				   unsigned int asd_struct_size);
+__v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
+				     int adapter_id, unsigned short address,
+				     unsigned int asd_struct_size);
+#define v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr, __type)	\
+((__type *)__v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr,	\
+						sizeof(__type)))
 
 /**
  * v4l2_async_notifier_register - registers a subdevice asynchronous notifier
-- 
2.29.2

