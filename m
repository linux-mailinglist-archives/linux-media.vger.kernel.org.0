Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0336E6D042C
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 13:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbjC3L7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 07:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbjC3L72 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 07:59:28 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1DAA24F
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 04:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177564; x=1711713564;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NbNUahBACIUVR2nEcIbwLYFIVLSnLXRy1H3JcLG6obI=;
  b=TzpRMh60YgSh9Ap6uF5K77UTIfuWi4C0Yk1tFI/5DlsurwYTXU7ZK1jH
   K7JcCRTDvGlmaNbKJcF8SQjL9KRfCXZgcNetu5gUh8aCwXDHmhnVVltd0
   zYoe2QD8awDYvVX+ChAo7aX7ObCB1h9S71WyL4jocAbrK4tfyoYclhb8A
   Goaz153eG9b7IA7WUtK1ynr9HnALYM2tsM3SAHVt0WcKWjdWGJ3mlTLSM
   59L+QlDRjhxuM/l4tfdpQsaDNjJB/VRnIQhszhHspyTq0XcvT/NNR4cdc
   wBd3PpejduWMfmfpP/mnmK0UfT5myIEaTInUTCHZtQUUFCUVF+FTFMkDP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406111522"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406111522"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714952936"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714952936"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:19 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6473C1224B6;
        Thu, 30 Mar 2023 14:59:17 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 17/18] media: v4l: async: Set v4l2_device in async notifier init
Date:   Thu, 30 Mar 2023 14:58:52 +0300
Message-Id: <20230330115853.1628216-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set the v4l2_device already in async notifier init, so struct device
related to it will be available before the notifier is registered.

This patch has been mostly generated using the following command:

git grep -l v4l2_async_nf_init -- drivers/media/ drivers/staging/media/ |
	while read i; do perl -e '
	@a=<>; unlink("'$i'"); open(F, "> '$i'");
	for $f ({i=>"v4l2_async_nf_init", r=>"v4l2_async_nf_register"},
		{i=>"v4l2_async_subdev_nf_init",
		 r=>"v4l2_async_subdev_nf_register"} ) {
	my $b; @a = map { $b = "$1, $2" if
	s/$f->{r}\(([^,]*),\s*([^\)]*)\)/v4l2_async_nf_register\($2\)/;
	$_; } @a; @a = map { if (defined $b) {
	s/v4l2_async_nf_init\([^\)]*\)/$f->{i}\($b\)/;
	s/$f->{r}\(\K[^,]*,\s*//; }; $_; } @a; }; print F @a; close F;'
	< $i; done

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/max9286.c                   |  4 +-
 drivers/media/i2c/st-mipid02.c                |  4 +-
 drivers/media/i2c/tc358746.c                  |  4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  4 +-
 drivers/media/platform/atmel/atmel-isi.c      |  4 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  4 +-
 drivers/media/platform/intel/pxa_camera.c     |  4 +-
 drivers/media/platform/marvell/cafe-driver.c  |  2 +-
 drivers/media/platform/marvell/mcam-core.c    |  2 +-
 drivers/media/platform/marvell/mmp-driver.c   |  2 +-
 .../platform/microchip/microchip-csi2dc.c     |  5 +--
 .../microchip/microchip-sama5d2-isc.c         |  5 +--
 .../microchip/microchip-sama7g5-isc.c         |  5 +--
 drivers/media/platform/nxp/imx-mipi-csis.c    |  4 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |  4 +-
 drivers/media/platform/qcom/camss/camss.c     |  5 +--
 drivers/media/platform/renesas/rcar-isp.c     |  4 +-
 .../platform/renesas/rcar-vin/rcar-core.c     |  8 ++--
 .../platform/renesas/rcar-vin/rcar-csi2.c     |  4 +-
 drivers/media/platform/renesas/rcar_drif.c    |  4 +-
 drivers/media/platform/renesas/renesas-ceu.c  |  4 +-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  4 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  4 +-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  4 +-
 .../platform/samsung/exynos4-is/media-dev.c   |  5 +--
 drivers/media/platform/st/stm32/stm32-dcmi.c  |  4 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  4 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |  6 +--
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  4 +-
 .../sun8i_a83t_mipi_csi2.c                    |  4 +-
 .../media/platform/ti/am437x/am437x-vpfe.c    |  4 +-
 drivers/media/platform/ti/cal/cal.c           |  4 +-
 .../media/platform/ti/davinci/vpif_capture.c  | 11 ++---
 drivers/media/platform/ti/omap3isp/isp.c      |  4 +-
 drivers/media/platform/video-mux.c            |  4 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  4 +-
 drivers/media/v4l2-core/v4l2-async.c          | 43 +++++++------------
 drivers/media/v4l2-core/v4l2-fwnode.c         |  4 +-
 .../deprecated/atmel/atmel-sama5d2-isc.c      |  5 +--
 drivers/staging/media/imx/imx-media-csi.c     |  4 +-
 .../staging/media/imx/imx-media-dev-common.c  |  4 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  4 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c  |  4 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |  4 +-
 drivers/staging/media/tegra-video/vi.c        |  4 +-
 include/media/v4l2-async.h                    | 35 +++++++++------
 46 files changed, 129 insertions(+), 138 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 13cb2537a06d..43e1399a3ed1 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -746,7 +746,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 	if (!priv->nsources)
 		return 0;
 
-	v4l2_async_nf_init(&priv->notifier);
+	v4l2_async_subdev_nf_init(&priv->sd, &priv->notifier);
 
 	for_each_source(priv, source) {
 		unsigned int i = to_index(priv, source);
@@ -766,7 +766,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 
 	priv->notifier.ops = &max9286_notify_ops;
 
-	ret = v4l2_async_subdev_nf_register(&priv->sd, &priv->notifier);
+	ret = v4l2_async_nf_register(&priv->notifier);
 	if (ret) {
 		dev_err(dev, "Failed to register subdev_notifier");
 		v4l2_async_nf_cleanup(&priv->notifier);
diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index daea4cb29ec8..ea00fb813855 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -902,7 +902,7 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 	bridge->rx = ep;
 
 	/* register async notifier so we get noticed when sensor is connected */
-	v4l2_async_nf_init(&bridge->notifier);
+	v4l2_async_subdev_nf_init(&bridge->sd, &bridge->notifier);
 	asd = v4l2_async_nf_add_fwnode_remote(&bridge->notifier,
 					      of_fwnode_handle(ep_node),
 					      struct v4l2_async_connection);
@@ -915,7 +915,7 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 	}
 	bridge->notifier.ops = &mipid02_notifier_ops;
 
-	ret = v4l2_async_subdev_nf_register(&bridge->sd, &bridge->notifier);
+	ret = v4l2_async_nf_register(&bridge->notifier);
 	if (ret)
 		v4l2_async_nf_cleanup(&bridge->notifier);
 
diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index f1f747f12228..0fbb46c2962f 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1460,7 +1460,7 @@ static int tc358746_async_register(struct tc358746 *tc358746)
 		return err;
 	}
 
-	v4l2_async_nf_init(&tc358746->notifier);
+	v4l2_async_subdev_nf_init(&tc358746->sd, &tc358746->notifier);
 	asd = v4l2_async_nf_add_fwnode_remote(&tc358746->notifier, ep,
 					      struct v4l2_async_connection);
 	fwnode_handle_put(ep);
@@ -1472,7 +1472,7 @@ static int tc358746_async_register(struct tc358746 *tc358746)
 
 	tc358746->notifier.ops = &tc358746_notify_ops;
 
-	err = v4l2_async_subdev_nf_register(&tc358746->sd, &tc358746->notifier);
+	err = v4l2_async_nf_register(&tc358746->notifier);
 	if (err)
 		goto err_cleanup;
 
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index b70db7e20acb..fa53d0835c89 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1501,7 +1501,7 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
 	 * suspend.
 	 */
 	cio2->notifier.ops = &cio2_async_ops;
-	ret = v4l2_async_nf_register(&cio2->v4l2_dev, &cio2->notifier);
+	ret = v4l2_async_nf_register(&cio2->notifier);
 	if (ret)
 		dev_err(dev, "failed to register async notifier : %d\n", ret);
 
@@ -1796,7 +1796,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	if (r)
 		goto fail_v4l2_device_unregister;
 
-	v4l2_async_nf_init(&cio2->notifier);
+	v4l2_async_nf_init(&cio2->v4l2_dev, &cio2->notifier);
 
 	/* Register notifier for subdevices we care */
 	r = cio2_parse_firmware(cio2);
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index 2da5918bbff0..4125ab31c825 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1159,7 +1159,7 @@ static int isi_graph_init(struct atmel_isi *isi)
 	if (!ep)
 		return -EINVAL;
 
-	v4l2_async_nf_init(&isi->notifier);
+	v4l2_async_nf_init(&isi->v4l2_dev, &isi->notifier);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&isi->notifier,
 					      of_fwnode_handle(ep),
@@ -1171,7 +1171,7 @@ static int isi_graph_init(struct atmel_isi *isi)
 
 	isi->notifier.ops = &isi_graph_notify_ops;
 
-	ret = v4l2_async_nf_register(&isi->v4l2_dev, &isi->notifier);
+	ret = v4l2_async_nf_register(&isi->notifier);
 	if (ret < 0) {
 		dev_err(isi->dev, "Notifier registration failed\n");
 		v4l2_async_nf_cleanup(&isi->notifier);
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 790a27205f5d..e3a3e87a02ab 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -399,7 +399,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 		return -EINVAL;
 	}
 
-	v4l2_async_nf_init(&csi2rx->notifier);
+	v4l2_async_subdev_nf_init(&csi2rx->subdev, &csi2rx->notifier);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csi2rx->notifier, fwh,
 					      struct v4l2_async_connection);
@@ -409,7 +409,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 
 	csi2rx->notifier.ops = &csi2rx_notifier_ops;
 
-	ret = v4l2_async_subdev_nf_register(&csi2rx->subdev, &csi2rx->notifier);
+	ret = v4l2_async_nf_register(&csi2rx->notifier);
 	if (ret)
 		v4l2_async_nf_cleanup(&csi2rx->notifier);
 
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 31ae220ee4f3..6972d426fd78 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2293,7 +2293,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	v4l2_async_nf_init(&pcdev->notifier);
+	v4l2_async_nf_init(&pcdev->v4l2_dev, &pcdev->notifier);
 	pcdev->res = res;
 	pcdev->pdata = pdev->dev.platform_data;
 	if (pcdev->pdata) {
@@ -2405,7 +2405,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 		goto exit_deactivate;
 
 	pcdev->notifier.ops = &pxa_camera_sensor_ops;
-	err = v4l2_async_nf_register(&pcdev->v4l2_dev, &pcdev->notifier);
+	err = v4l2_async_nf_register(&pcdev->notifier);
 	if (err)
 		goto exit_deactivate;
 
diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
index 4d8843623255..bfb091295291 100644
--- a/drivers/media/platform/marvell/cafe-driver.c
+++ b/drivers/media/platform/marvell/cafe-driver.c
@@ -541,7 +541,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 		goto out_smbus_shutdown;
 
 
-	v4l2_async_nf_init(&mcam->notifier);
+	v4l2_async_nf_init(&mcam->v4l2_dev, &mcam->notifier);
 
 	asd = v4l2_async_nf_add_i2c(&mcam->notifier,
 				    i2c_adapter_id(cam->i2c_adapter),
diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index 2ecdcbcb37fd..6ed09d606cea 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -1873,7 +1873,7 @@ int mccic_register(struct mcam_camera *cam)
 	cam->mbus_code = mcam_def_mbus_code;
 
 	cam->notifier.ops = &mccic_notify_ops;
-	ret = v4l2_async_nf_register(&cam->v4l2_dev, &cam->notifier);
+	ret = v4l2_async_nf_register(&cam->notifier);
 	if (ret < 0) {
 		cam_warn(cam, "failed to register a sensor notifier");
 		goto out;
diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
index 36f58ea830f3..c3f3b784ae3c 100644
--- a/drivers/media/platform/marvell/mmp-driver.c
+++ b/drivers/media/platform/marvell/mmp-driver.c
@@ -239,7 +239,7 @@ static int mmpcam_probe(struct platform_device *pdev)
 	if (!ep)
 		return -ENODEV;
 
-	v4l2_async_nf_init(&mcam->notifier);
+	v4l2_async_nf_init(&mcam->v4l2_dev, &mcam->notifier);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&mcam->notifier, ep,
 					      struct v4l2_async_connection);
diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
index c2b7f50520cd..2952dd6f18ca 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -523,7 +523,7 @@ static int csi2dc_prepare_notifier(struct csi2dc_device *csi2dc,
 	struct v4l2_async_connection *asd;
 	int ret = 0;
 
-	v4l2_async_nf_init(&csi2dc->notifier);
+	v4l2_async_subdev_nf_init(&csi2dc->csi2dc_sd, &csi2dc->notifier);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csi2dc->notifier,
 					      input_fwnode,
@@ -542,8 +542,7 @@ static int csi2dc_prepare_notifier(struct csi2dc_device *csi2dc,
 
 	csi2dc->notifier.ops = &csi2dc_async_ops;
 
-	ret = v4l2_async_subdev_nf_register(&csi2dc->csi2dc_sd,
-					    &csi2dc->notifier);
+	ret = v4l2_async_nf_register(&csi2dc->notifier);
 	if (ret) {
 		dev_err(csi2dc->dev, "fail to register async notifier: %d\n",
 			ret);
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 4c341908d69d..f57f32d46211 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -529,7 +529,7 @@ static int microchip_isc_probe(struct platform_device *pdev)
 		struct fwnode_handle *fwnode =
 			of_fwnode_handle(subdev_entity->epn);
 
-		v4l2_async_nf_init(&subdev_entity->notifier);
+		v4l2_async_nf_init(&isc->v4l2_dev, &subdev_entity->notifier);
 
 		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
 						      fwnode,
@@ -545,8 +545,7 @@ static int microchip_isc_probe(struct platform_device *pdev)
 
 		subdev_entity->notifier.ops = &microchip_isc_async_ops;
 
-		ret = v4l2_async_nf_register(&isc->v4l2_dev,
-					     &subdev_entity->notifier);
+		ret = v4l2_async_nf_register(&subdev_entity->notifier);
 		if (ret) {
 			dev_err(dev, "fail to register async notifier\n");
 			goto cleanup_subdev;
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 44e7818f2e5d..2ea61b85ba5c 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -519,7 +519,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 		struct fwnode_handle *fwnode =
 			of_fwnode_handle(subdev_entity->epn);
 
-		v4l2_async_nf_init(&subdev_entity->notifier);
+		v4l2_async_nf_init(&isc->v4l2_dev, &subdev_entity->notifier);
 
 		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
 						      fwnode,
@@ -535,8 +535,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 
 		subdev_entity->notifier.ops = &microchip_isc_async_ops;
 
-		ret = v4l2_async_nf_register(&isc->v4l2_dev,
-					     &subdev_entity->notifier);
+		ret = v4l2_async_nf_register(&subdev_entity->notifier);
 		if (ret) {
 			dev_err(dev, "fail to register async notifier\n");
 			goto cleanup_subdev;
diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 9c5407b59e8b..e0eb89428f6d 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1252,7 +1252,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	unsigned int i;
 	int ret;
 
-	v4l2_async_nf_init(&csis->notifier);
+	v4l2_async_subdev_nf_init(&csis->sd, &csis->notifier);
 
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
@@ -1288,7 +1288,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 
 	csis->notifier.ops = &mipi_csis_notify_ops;
 
-	ret = v4l2_async_subdev_nf_register(&csis->sd, &csis->notifier);
+	ret = v4l2_async_nf_register(&csis->notifier);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 0c57165c4ec1..dfaaa4dd0c94 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2103,7 +2103,7 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 	struct fwnode_handle *ep;
 	int ret;
 
-	v4l2_async_nf_init(&csi->notifier);
+	v4l2_async_nf_init(&csi->v4l2_dev, &csi->notifier);
 
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
@@ -2123,7 +2123,7 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 
 	csi->notifier.ops = &imx7_csi_notify_ops;
 
-	ret = v4l2_async_nf_register(&csi->v4l2_dev, &csi->notifier);
+	ret = v4l2_async_nf_register(&csi->notifier);
 	if (ret)
 		goto error;
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e33db37c3eb7..20aa9c6ccec6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1640,7 +1640,7 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_cleanup;
 	}
 
-	v4l2_async_nf_init(&camss->notifier);
+	v4l2_async_nf_init(&camss->v4l2_dev, &camss->notifier);
 
 	num_subdevs = camss_of_parse_ports(camss);
 	if (num_subdevs < 0) {
@@ -1655,8 +1655,7 @@ static int camss_probe(struct platform_device *pdev)
 	if (num_subdevs) {
 		camss->notifier.ops = &camss_subdev_notifier_ops;
 
-		ret = v4l2_async_nf_register(&camss->v4l2_dev,
-					     &camss->notifier);
+		ret = v4l2_async_nf_register(&camss->notifier);
 		if (ret) {
 			dev_err(dev,
 				"Failed to register async subdev nodes: %d\n",
diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index eb851c9686f8..cbf2d5ba663a 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -392,7 +392,7 @@ static int risp_parse_dt(struct rcar_isp *isp)
 
 	dev_dbg(isp->dev, "Found '%pOF'\n", to_of_node(fwnode));
 
-	v4l2_async_nf_init(&isp->notifier);
+	v4l2_async_subdev_nf_init(&isp->subdev, &isp->notifier);
 	isp->notifier.ops = &risp_notify_ops;
 
 	asd = v4l2_async_nf_add_fwnode(&isp->notifier, fwnode,
@@ -401,7 +401,7 @@ static int risp_parse_dt(struct rcar_isp *isp)
 	if (IS_ERR(asd))
 		return PTR_ERR(asd);
 
-	ret = v4l2_async_subdev_nf_register(&isp->subdev, &isp->notifier);
+	ret = v4l2_async_nf_register(&isp->notifier);
 	if (ret)
 		v4l2_async_nf_cleanup(&isp->notifier);
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 1d64373e7cd7..e06b6dbdd0a6 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -377,7 +377,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 
 	mutex_unlock(&vin->group->lock);
 
-	v4l2_async_nf_init(&vin->group->notifier);
+	v4l2_async_nf_init(&vin->v4l2_dev, &vin->notifier);
 
 	/*
 	 * Some subdevices may overlap but the parser function can handle it and
@@ -401,7 +401,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 		return 0;
 
 	vin->group->notifier.ops = &rvin_group_notify_ops;
-	ret = v4l2_async_nf_register(&vin->v4l2_dev, &vin->group->notifier);
+	ret = v4l2_async_nf_register(&vin->group->notifier);
 	if (ret < 0) {
 		vin_err(vin, "Notifier registration failed\n");
 		v4l2_async_nf_cleanup(&vin->group->notifier);
@@ -714,7 +714,7 @@ static int rvin_parallel_init(struct rvin_dev *vin)
 {
 	int ret;
 
-	v4l2_async_nf_init(&vin->notifier);
+	v4l2_async_nf_init(&vin->v4l2_dev, &vin->notifier);
 
 	ret = rvin_parallel_parse_of(vin);
 	if (ret)
@@ -727,7 +727,7 @@ static int rvin_parallel_init(struct rvin_dev *vin)
 		to_of_node(vin->parallel.asd->match.fwnode));
 
 	vin->notifier.ops = &rvin_parallel_notify_ops;
-	ret = v4l2_async_nf_register(&vin->v4l2_dev, &vin->notifier);
+	ret = v4l2_async_nf_register(&vin->notifier);
 	if (ret < 0) {
 		vin_err(vin, "Notifier registration failed\n");
 		v4l2_async_nf_cleanup(&vin->notifier);
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index 654d56a57a00..bd556cf67838 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
@@ -1076,7 +1076,7 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 
 	dev_dbg(priv->dev, "Found '%pOF'\n", to_of_node(fwnode));
 
-	v4l2_async_nf_init(&priv->notifier);
+	v4l2_async_subdev_nf_init(&priv->subdev, &priv->notifier);
 	priv->notifier.ops = &rcar_csi2_notify_ops;
 
 	asd = v4l2_async_nf_add_fwnode(&priv->notifier, fwnode,
@@ -1085,7 +1085,7 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 	if (IS_ERR(asd))
 		return PTR_ERR(asd);
 
-	ret = v4l2_async_subdev_nf_register(&priv->subdev, &priv->notifier);
+	ret = v4l2_async_nf_register(&priv->notifier);
 	if (ret)
 		v4l2_async_nf_cleanup(&priv->notifier);
 
diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 5c8f5a53eb4d..17e4c852df80 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -1207,7 +1207,7 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
 	struct fwnode_handle *fwnode, *ep;
 	struct v4l2_async_connection *asd;
 
-	v4l2_async_nf_init(notifier);
+	v4l2_async_nf_init(&sdr->v4l2_dev, &sdr->notifier);
 
 	ep = fwnode_graph_get_next_endpoint(of_fwnode_handle(sdr->dev->of_node),
 					    NULL);
@@ -1341,7 +1341,7 @@ static int rcar_drif_sdr_probe(struct rcar_drif_sdr *sdr)
 	sdr->notifier.ops = &rcar_drif_notify_ops;
 
 	/* Register notifier */
-	ret = v4l2_async_nf_register(&sdr->v4l2_dev, &sdr->notifier);
+	ret = v4l2_async_nf_register(&sdr->notifier);
 	if (ret < 0) {
 		dev_err(sdr->dev, "failed: notifier register ret %d\n", ret);
 		goto cleanup;
diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index 8d47910a8d11..e8a8ecd5c956 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -1667,7 +1667,7 @@ static int ceu_probe(struct platform_device *pdev)
 	if (ret)
 		goto error_pm_disable;
 
-	v4l2_async_nf_init(&ceudev->notifier);
+	v4l2_async_nf_init(&ceudev->v4l2_dev, &ceudev->notifier);
 
 	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
 		ceu_data = of_device_get_match_data(dev);
@@ -1689,7 +1689,7 @@ static int ceu_probe(struct platform_device *pdev)
 
 	ceudev->notifier.v4l2_dev	= &ceudev->v4l2_dev;
 	ceudev->notifier.ops		= &ceu_notify_ops;
-	ret = v4l2_async_nf_register(&ceudev->v4l2_dev, &ceudev->notifier);
+	ret = v4l2_async_nf_register(&ceudev->notifier);
 	if (ret)
 		goto error_cleanup;
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 4abf9f1e88dc..7c6abb162e68 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -183,7 +183,7 @@ static int rzg2l_cru_mc_parse_of_graph(struct rzg2l_cru_dev *cru)
 {
 	int ret;
 
-	v4l2_async_nf_init(&cru->notifier);
+	v4l2_async_nf_init(&cru->v4l2_dev, &cru->notifier);
 
 	ret = rzg2l_cru_mc_parse_of(cru);
 	if (ret)
@@ -194,7 +194,7 @@ static int rzg2l_cru_mc_parse_of_graph(struct rzg2l_cru_dev *cru)
 	if (list_empty(&cru->notifier.asc_head))
 		return 0;
 
-	ret = v4l2_async_nf_register(&cru->v4l2_dev, &cru->notifier);
+	ret = v4l2_async_nf_register(&cru->notifier);
 	if (ret < 0) {
 		dev_err(cru->dev, "Notifier registration failed\n");
 		v4l2_async_nf_cleanup(&cru->notifier);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 5aa3b0239ead..1863162d7c8d 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -674,7 +674,7 @@ static int rzg2l_csi2_parse_dt(struct rzg2l_csi2 *csi2)
 	fwnode = fwnode_graph_get_remote_endpoint(ep);
 	fwnode_handle_put(ep);
 
-	v4l2_async_nf_init(&csi2->notifier);
+	v4l2_async_subdev_nf_init(&csi2->subdev, &csi2->notifier);
 	csi2->notifier.ops = &rzg2l_csi2_notify_ops;
 
 	asd = v4l2_async_nf_add_fwnode(&csi2->notifier, fwnode,
@@ -683,7 +683,7 @@ static int rzg2l_csi2_parse_dt(struct rzg2l_csi2 *csi2)
 	if (IS_ERR(asd))
 		return PTR_ERR(asd);
 
-	ret = v4l2_async_subdev_nf_register(&csi2->subdev, &csi2->notifier);
+	ret = v4l2_async_nf_register(&csi2->notifier);
 	if (ret)
 		v4l2_async_nf_cleanup(&csi2->notifier);
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 5bdb1ecedf6a..0c716839e03a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -187,7 +187,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 	unsigned int index = 0;
 	int ret = 0;
 
-	v4l2_async_nf_init(ntf);
+	v4l2_async_nf_init(&rkisp1->v4l2_dev, ntf);
 
 	ntf->ops = &rkisp1_subdev_notifier_ops;
 
@@ -287,7 +287,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 	if (!index)
 		dev_dbg(rkisp1->dev, "no remote subdevice found\n");
 
-	ret = v4l2_async_nf_register(&rkisp1->v4l2_dev, ntf);
+	ret = v4l2_async_nf_register(ntf);
 	if (ret) {
 		v4l2_async_nf_cleanup(ntf);
 		return ret;
diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index 8c9dad6231a6..5974c2d31ad6 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1477,7 +1477,7 @@ static int fimc_md_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, fmd);
 
-	v4l2_async_nf_init(&fmd->subdev_notifier);
+	v4l2_async_nf_init(&fmd->v4l2_dev, &fmd->subdev_notifier);
 
 	ret = fimc_md_register_platform_entities(fmd, dev->of_node);
 	if (ret)
@@ -1505,8 +1505,7 @@ static int fimc_md_probe(struct platform_device *pdev)
 		fmd->subdev_notifier.ops = &subdev_notifier_ops;
 		fmd->num_sensors = 0;
 
-		ret = v4l2_async_nf_register(&fmd->v4l2_dev,
-					     &fmd->subdev_notifier);
+		ret = v4l2_async_nf_register(&fmd->subdev_notifier);
 		if (ret)
 			goto err_clk_p;
 	}
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index cf03c9529749..c26189584eb0 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1897,7 +1897,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 		return -EINVAL;
 	}
 
-	v4l2_async_nf_init(&dcmi->notifier);
+	v4l2_async_nf_init(&dcmi->v4l2_dev, &dcmi->notifier);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&dcmi->notifier,
 					      of_fwnode_handle(ep),
@@ -1912,7 +1912,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 
 	dcmi->notifier.ops = &dcmi_graph_notify_ops;
 
-	ret = v4l2_async_nf_register(&dcmi->v4l2_dev, &dcmi->notifier);
+	ret = v4l2_async_nf_register(&dcmi->notifier);
 	if (ret < 0) {
 		dev_err(dcmi->dev, "Failed to register notifier\n");
 		v4l2_async_nf_cleanup(&dcmi->notifier);
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index 1a550713ecfb..2dce2198c20e 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -122,7 +122,7 @@ static int sun4i_csi_notifier_init(struct sun4i_csi *csi)
 	struct fwnode_handle *ep;
 	int ret;
 
-	v4l2_async_nf_init(&csi->notifier);
+	v4l2_async_nf_init(&csi->v4l, &csi->notifier);
 
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
@@ -240,7 +240,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unregister_media;
 
-	ret = v4l2_async_nf_register(&csi->v4l, &csi->notifier);
+	ret = v4l2_async_nf_register(&csi->notifier);
 	if (ret) {
 		dev_err(csi->dev, "Couldn't register our notifier.\n");
 		goto err_unregister_media;
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index ebb725fc11ba..8fa768ab5334 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -819,7 +819,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 
 	/* V4L2 Async */
 
-	v4l2_async_nf_init(notifier);
+	v4l2_async_subdev_nf_init(subdev, notifier);
 	notifier->ops = &sun6i_csi_bridge_notifier_ops;
 
 	sun6i_csi_bridge_source_setup(csi_dev, &bridge->source_parallel,
@@ -829,9 +829,9 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 				      SUN6I_CSI_PORT_MIPI_CSI2, NULL);
 
 	if (csi_dev->isp_available)
-		ret = v4l2_async_subdev_nf_register(subdev, notifier);
+		ret = v4l2_async_nf_register(notifier);
 	else
-		ret = v4l2_async_nf_register(v4l2_dev, notifier);
+		ret = v4l2_async_nf_register(notifier);
 	if (ret) {
 		dev_err(dev, "failed to register v4l2 async notifier: %d\n",
 			ret);
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index f2746f77aad0..b0c7498557f4 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -531,7 +531,7 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 
 	/* V4L2 Async */
 
-	v4l2_async_nf_init(notifier);
+	v4l2_async_subdev_nf_init(subdev, notifier);
 	notifier->ops = &sun6i_mipi_csi2_notifier_ops;
 
 	ret = sun6i_mipi_csi2_bridge_source_setup(csi2_dev);
@@ -540,7 +540,7 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 
 	/* Only register the notifier when a sensor is connected. */
 	if (ret != -ENODEV) {
-		ret = v4l2_async_subdev_nf_register(subdev, notifier);
+		ret = v4l2_async_nf_register(notifier);
 		if (ret < 0)
 			goto error_v4l2_notifier_cleanup;
 
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index e7f45673ed82..5c79fc8b097b 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -569,7 +569,7 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
 
 	/* V4L2 Async */
 
-	v4l2_async_nf_init(notifier);
+	v4l2_async_subdev_nf_init(subdev, notifier);
 	notifier->ops = &sun8i_a83t_mipi_csi2_notifier_ops;
 
 	ret = sun8i_a83t_mipi_csi2_bridge_source_setup(csi2_dev);
@@ -578,7 +578,7 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
 
 	/* Only register the notifier when a sensor is connected. */
 	if (ret != -ENODEV) {
-		ret = v4l2_async_subdev_nf_register(subdev, notifier);
+		ret = v4l2_async_nf_register(notifier);
 		if (ret < 0)
 			goto error_v4l2_notifier_cleanup;
 
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index d5ba9b9c7e5a..edf81b8f7b88 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2297,7 +2297,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 
 	dev_dbg(dev, "vpfe_get_pdata\n");
 
-	v4l2_async_nf_init(&vpfe->notifier);
+	v4l2_async_nf_init(&vpfe->v4l2_dev, &vpfe->notifier);
 
 	if (!IS_ENABLED(CONFIG_OF) || !dev->of_node)
 		return dev->platform_data;
@@ -2464,7 +2464,7 @@ static int vpfe_probe(struct platform_device *pdev)
 	}
 
 	vpfe->notifier.ops = &vpfe_async_ops;
-	ret = v4l2_async_nf_register(&vpfe->v4l2_dev, &vpfe->notifier);
+	ret = v4l2_async_nf_register(&vpfe->notifier);
 	if (ret) {
 		vpfe_err(vpfe, "Error registering async notifier\n");
 		ret = -EINVAL;
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 37906c23237e..579337a8d543 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -895,7 +895,7 @@ static int cal_async_notifier_register(struct cal_dev *cal)
 	unsigned int i;
 	int ret;
 
-	v4l2_async_nf_init(&cal->notifier);
+	v4l2_async_nf_init(&cal->v4l2_dev, &cal->notifier);
 	cal->notifier.ops = &cal_async_notifier_ops;
 
 	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
@@ -919,7 +919,7 @@ static int cal_async_notifier_register(struct cal_dev *cal)
 		casd->phy = phy;
 	}
 
-	ret = v4l2_async_nf_register(&cal->v4l2_dev, &cal->notifier);
+	ret = v4l2_async_nf_register(&cal->notifier);
 	if (ret) {
 		cal_err(cal, "Error registering async notifier\n");
 		goto error;
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 728865ad44b7..c145797d6442 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1483,7 +1483,8 @@ static const struct v4l2_async_notifier_operations vpif_async_ops = {
 };
 
 static struct vpif_capture_config *
-vpif_capture_get_pdata(struct platform_device *pdev)
+vpif_capture_get_pdata(struct platform_device *pdev,
+		       struct v4l2_device *v4l2_dev)
 {
 	struct device_node *endpoint = NULL;
 	struct device_node *rem = NULL;
@@ -1492,7 +1493,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 	struct vpif_capture_chan_config *chan;
 	unsigned int i;
 
-	v4l2_async_nf_init(&vpif_obj.notifier);
+	v4l2_async_nf_init(v4l2_dev, &vpif_obj.notifier);
 
 	/*
 	 * DT boot: OF node from parent device contains
@@ -1649,7 +1650,8 @@ static __init int vpif_probe(struct platform_device *pdev)
 		goto vpif_unregister;
 	}
 
-	pdev->dev.platform_data = vpif_capture_get_pdata(pdev);
+	pdev->dev.platform_data =
+		vpif_capture_get_pdata(pdev, &vpif_obj.v4l2_dev);
 	if (!pdev->dev.platform_data) {
 		dev_warn(&pdev->dev, "Missing platform data.  Giving up.\n");
 		goto probe_subdev_out;
@@ -1683,8 +1685,7 @@ static __init int vpif_probe(struct platform_device *pdev)
 			goto probe_subdev_out;
 	} else {
 		vpif_obj.notifier.ops = &vpif_async_ops;
-		err = v4l2_async_nf_register(&vpif_obj.v4l2_dev,
-					     &vpif_obj.notifier);
+		err = v4l2_async_nf_register(&vpif_obj.notifier);
 		if (err) {
 			vpif_err("Error registering async notifier\n");
 			err = -EINVAL;
diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index 7ccc18acb429..c162577441c1 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2423,13 +2423,13 @@ static int isp_probe(struct platform_device *pdev)
 
 	isp->notifier.ops = &isp_subdev_notifier_ops;
 
-	v4l2_async_nf_init(&isp->notifier);
+	v4l2_async_nf_init(&isp->v4l2_dev, &isp->notifier);
 
 	ret = isp_parse_of_endpoints(isp);
 	if (ret < 0)
 		goto error_register_entities;
 
-	ret = v4l2_async_nf_register(&isp->v4l2_dev, &isp->notifier);
+	ret = v4l2_async_nf_register(&isp->notifier);
 	if (ret)
 		goto error_register_entities;
 
diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 7d48fb9bc09d..98eba6d7daf4 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -360,7 +360,7 @@ static int video_mux_async_register(struct video_mux *vmux,
 	unsigned int i;
 	int ret;
 
-	v4l2_async_nf_init(&vmux->notifier);
+	v4l2_async_subdev_nf_init(&vmux->subdev, &vmux->notifier);
 
 	for (i = 0; i < num_input_pads; i++) {
 		struct v4l2_async_connection *asd;
@@ -395,7 +395,7 @@ static int video_mux_async_register(struct video_mux *vmux,
 
 	vmux->notifier.ops = &video_mux_notify_ops;
 
-	ret = v4l2_async_subdev_nf_register(&vmux->subdev, &vmux->notifier);
+	ret = v4l2_async_nf_register(&vmux->notifier);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 83430633ed28..1bf6f7f18a3f 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -516,7 +516,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
 		goto done;
 	}
 
-	v4l2_async_nf_init(&xdev->notifier);
+	v4l2_async_nf_init(&xdev->v4l2_dev, &xdev->notifier);
 
 	/* Parse the graph to extract a list of subdevice DT nodes. */
 	ret = xvip_graph_parse(xdev);
@@ -534,7 +534,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
 	/* Register the subdevices notifier. */
 	xdev->notifier.ops = &xvip_graph_notify_ops;
 
-	ret = v4l2_async_nf_register(&xdev->v4l2_dev, &xdev->notifier);
+	ret = v4l2_async_nf_register(&xdev->notifier);
 	if (ret < 0) {
 		dev_err(xdev->dev, "notifier registration failed\n");
 		goto done;
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 4c3bd64d6a00..9e10e59af8e0 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -542,12 +542,22 @@ static int v4l2_async_nf_asc_valid(struct v4l2_async_notifier *notifier,
 	return 0;
 }
 
-void v4l2_async_nf_init(struct v4l2_async_notifier *notifier)
+void v4l2_async_nf_init(struct v4l2_device *v4l2_dev,
+			struct v4l2_async_notifier *notifier)
 {
 	INIT_LIST_HEAD(&notifier->asc_head);
+	notifier->v4l2_dev = v4l2_dev;
 }
 EXPORT_SYMBOL(v4l2_async_nf_init);
 
+void v4l2_async_subdev_nf_init(struct v4l2_subdev *sd,
+			       struct v4l2_async_notifier *notifier)
+{
+	INIT_LIST_HEAD(&notifier->asc_head);
+	notifier->sd = sd;
+}
+EXPORT_SYMBOL_GPL(v4l2_async_subdev_nf_init);
+
 static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_async_connection *asc;
@@ -593,16 +603,13 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	return ret;
 }
 
-int v4l2_async_nf_register(struct v4l2_device *v4l2_dev,
-			   struct v4l2_async_notifier *notifier)
+int v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 {
 	int ret;
 
-	if (WARN_ON(!v4l2_dev || notifier->sd))
+	if (WARN_ON(!notifier->v4l2_dev == !notifier->sd))
 		return -EINVAL;
 
-	notifier->v4l2_dev = v4l2_dev;
-
 	ret = __v4l2_async_nf_register(notifier);
 	if (ret)
 		notifier->v4l2_dev = NULL;
@@ -611,24 +618,6 @@ int v4l2_async_nf_register(struct v4l2_device *v4l2_dev,
 }
 EXPORT_SYMBOL(v4l2_async_nf_register);
 
-int v4l2_async_subdev_nf_register(struct v4l2_subdev *sd,
-				  struct v4l2_async_notifier *notifier)
-{
-	int ret;
-
-	if (WARN_ON(!sd || notifier->v4l2_dev))
-		return -EINVAL;
-
-	notifier->sd = sd;
-
-	ret = __v4l2_async_nf_register(notifier);
-	if (ret)
-		notifier->sd = NULL;
-
-	return ret;
-}
-EXPORT_SYMBOL(v4l2_async_subdev_nf_register);
-
 static void
 __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
 {
@@ -637,9 +626,6 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
 
 	v4l2_async_nf_unbind_all_subdevs(notifier, false);
 
-	notifier->sd = NULL;
-	notifier->v4l2_dev = NULL;
-
 	list_del(&notifier->notifier_list);
 }
 
@@ -693,6 +679,9 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 		kref_put(&asc->asd->kref, release_async_subdev);
 		kfree(asc);
 	}
+
+	notifier->sd = NULL;
+	notifier->v4l2_dev = NULL;
 }
 
 void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index e4ba04cebc9a..a02b33f94a96 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1300,13 +1300,13 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 	if (!notifier)
 		return -ENOMEM;
 
-	v4l2_async_nf_init(notifier);
+	v4l2_async_subdev_nf_init(sd, notifier);
 
 	ret = v4l2_async_nf_parse_fwnode_sensor(sd->dev, notifier);
 	if (ret < 0)
 		goto out_cleanup;
 
-	ret = v4l2_async_subdev_nf_register(sd, notifier);
+	ret = v4l2_async_nf_register(notifier);
 	if (ret < 0)
 		goto out_cleanup;
 
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index 0471e7796833..bbca9b34db1d 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -509,7 +509,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 		struct fwnode_handle *fwnode =
 			of_fwnode_handle(subdev_entity->epn);
 
-		v4l2_async_nf_init(&subdev_entity->notifier);
+		v4l2_async_nf_init(&isc->v4l2_dev, &subdev_entity->notifier);
 
 		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
 						      fwnode,
@@ -525,8 +525,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 
 		subdev_entity->notifier.ops = &atmel_isc_async_ops;
 
-		ret = v4l2_async_nf_register(&isc->v4l2_dev,
-					     &subdev_entity->notifier);
+		ret = v4l2_async_nf_register(&subdev_entity->notifier);
 		if (ret) {
 			dev_err(dev, "fail to register async notifier\n");
 			goto cleanup_subdev;
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 6a9052790b78..304467f8a196 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1918,7 +1918,7 @@ static int imx_csi_async_register(struct csi_priv *priv)
 	unsigned int port;
 	int ret;
 
-	v4l2_async_nf_init(&priv->notifier);
+	v4l2_async_subdev_nf_init(&priv->sd, &priv->notifier);
 
 	/* get this CSI's port id */
 	ret = fwnode_property_read_u32(dev_fwnode(priv->dev), "reg", &port);
@@ -1944,7 +1944,7 @@ static int imx_csi_async_register(struct csi_priv *priv)
 
 	priv->notifier.ops = &csi_notify_ops;
 
-	ret = v4l2_async_subdev_nf_register(&priv->sd, &priv->notifier);
+	ret = v4l2_async_nf_register(&priv->notifier);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index f2536016d24a..bc34c9b7f452 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -381,7 +381,7 @@ struct imx_media_dev *imx_media_dev_init(struct device *dev,
 
 	INIT_LIST_HEAD(&imxmd->vdev_list);
 
-	v4l2_async_nf_init(&imxmd->notifier);
+	v4l2_async_nf_init(&imxmd->v4l2_dev, &imxmd->notifier);
 
 	return imxmd;
 
@@ -405,7 +405,7 @@ int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
 
 	/* prepare the async subdev notifier and register it */
 	imxmd->notifier.ops = ops ? ops : &imx_media_notifier_ops;
-	ret = v4l2_async_nf_register(&imxmd->v4l2_dev, &imxmd->notifier);
+	ret = v4l2_async_nf_register(&imxmd->notifier);
 	if (ret) {
 		v4l2_err(&imxmd->v4l2_dev,
 			 "v4l2_async_nf_register failed with %d\n", ret);
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index cebf42840061..db1e99c1e8b3 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -635,7 +635,7 @@ static int csi2_async_register(struct csi2_dev *csi2)
 	struct fwnode_handle *ep;
 	int ret;
 
-	v4l2_async_nf_init(&csi2->notifier);
+	v4l2_async_subdev_nf_init(&csi2->sd, &csi2->notifier);
 
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi2->dev), 0, 0,
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
@@ -660,7 +660,7 @@ static int csi2_async_register(struct csi2_dev *csi2)
 
 	csi2->notifier.ops = &csi2_notify_ops;
 
-	ret = v4l2_async_subdev_nf_register(&csi2->sd, &csi2->notifier);
+	ret = v4l2_async_nf_register(&csi2->notifier);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index 05b7215493af..7c3ac47f8a0d 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -641,7 +641,7 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 	unsigned int i;
 	int ret;
 
-	v4l2_async_nf_init(&state->notifier);
+	v4l2_async_subdev_nf_init(&state->sd, &state->notifier);
 
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
@@ -678,7 +678,7 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 
 	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
 
-	ret = v4l2_async_subdev_nf_register(&state->sd, &state->notifier);
+	ret = v4l2_async_nf_register(&state->notifier);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
index dd7dfecb9ef3..77903ac066b2 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
@@ -536,7 +536,7 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp_dev)
 
 	/* V4L2 Async */
 
-	v4l2_async_nf_init(notifier);
+	v4l2_async_nf_init(v4l2_dev, notifier);
 	notifier->ops = &sun6i_isp_proc_notifier_ops;
 
 	sun6i_isp_proc_source_setup(isp_dev, &proc->source_csi0,
@@ -544,7 +544,7 @@ int sun6i_isp_proc_setup(struct sun6i_isp_device *isp_dev)
 	sun6i_isp_proc_source_setup(isp_dev, &proc->source_csi1,
 				    SUN6I_ISP_PORT_CSI1);
 
-	ret = v4l2_async_nf_register(v4l2_dev, notifier);
+	ret = v4l2_async_nf_register(notifier);
 	if (ret) {
 		v4l2_err(v4l2_dev,
 			 "failed to register v4l2 async notifier: %d\n", ret);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index eaa1e241094f..dc3c1eabf0d1 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1278,7 +1278,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	}
 
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		v4l2_async_nf_init(&chan->notifier);
+		v4l2_async_nf_init(&vid->v4l2_dev, &chan->notifier);
 
 	return 0;
 
@@ -1878,7 +1878,7 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
 			continue;
 
 		chan->notifier.ops = &tegra_vi_async_ops;
-		ret = v4l2_async_nf_register(&vid->v4l2_dev, &chan->notifier);
+		ret = v4l2_async_nf_register(&chan->notifier);
 		if (ret < 0) {
 			dev_err(vi->dev,
 				"failed to register channel %d notifier: %d\n",
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 750bf4ddb267..cf2082e17fc4 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -159,6 +159,24 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
 /**
  * v4l2_async_nf_init - Initialize a notifier.
  *
+ * @v4l2_dev: pointer to &struct v4l2_device
+ * @notifier: pointer to &struct v4l2_async_notifier
+ *
+ * This function initializes the notifier @asc_list. It must be called
+ * before adding a subdevice to a notifier, using one of:
+ * v4l2_async_nf_add_fwnode_remote(),
+ * v4l2_async_nf_add_fwnode(),
+ * v4l2_async_nf_add_i2c(),
+ * __v4l2_async_nf_add_connection() or
+ * v4l2_async_nf_parse_fwnode_endpoints().
+ */
+void v4l2_async_nf_init(struct v4l2_device *v4l2_dev,
+			struct v4l2_async_notifier *notifier);
+
+/**
+ * v4l2_async_subdev_nf_init - Initialize a sub-device notifier.
+ *
+ * @v4l2_dev: pointer to &struct v4l2_device
  * @notifier: pointer to &struct v4l2_async_notifier
  *
  * This function initializes the notifier @asc_list. It must be called
@@ -169,7 +187,8 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
  * __v4l2_async_nf_add_connection() or
  * v4l2_async_nf_parse_fwnode_endpoints().
  */
-void v4l2_async_nf_init(struct v4l2_async_notifier *notifier);
+void v4l2_async_subdev_nf_init(struct v4l2_subdev *sd,
+			       struct v4l2_async_notifier *notifier);
 
 /**
  * __v4l2_async_nf_add_connection() - Add an async subdev to the notifier's
@@ -264,21 +283,9 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
 /**
  * v4l2_async_nf_register - registers a subdevice asynchronous notifier
  *
- * @v4l2_dev: pointer to &struct v4l2_device
- * @notifier: pointer to &struct v4l2_async_notifier
- */
-int v4l2_async_nf_register(struct v4l2_device *v4l2_dev,
-			   struct v4l2_async_notifier *notifier);
-
-/**
- * v4l2_async_subdev_nf_register - registers a subdevice asynchronous
- *					 notifier for a sub-device
- *
- * @sd: pointer to &struct v4l2_subdev
  * @notifier: pointer to &struct v4l2_async_notifier
  */
-int v4l2_async_subdev_nf_register(struct v4l2_subdev *sd,
-				  struct v4l2_async_notifier *notifier);
+int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
 
 /**
  * v4l2_async_nf_unregister - unregisters a subdevice
-- 
2.30.2

