Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4BE86AF790
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 22:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjCGV23 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 16:28:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbjCGV21 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 16:28:27 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED9D92F38
        for <linux-media@vger.kernel.org>; Tue,  7 Mar 2023 13:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678224499; x=1709760499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3j6/UrKopJfkMp9pDvqDtiL7M+apzmh3TETRZ2YtjH8=;
  b=nx+IrzDj3uX24qVc24J4JeUVpjsAIInDdhmwjl2nGkJBUGYa8n5p9gdU
   oZPVftHHcYrq1BRn4OiMarLWqnQUVUjVwkPch7eS5dlN4zuMpgtMzdw74
   XbUIlY1JU9eEpOixQ/v0xKFTRA202kziKFheMm+MOUowTT19YoOxSj9ky
   8SXZCNod2J1eTSytmVlN3hzTmQkrlYC12v/A8VuV9ofk+ok1t4XrIBcxg
   E1wYXPKr0f0LjrRZJqfygeVRX88amW9/mL6hr3LySK4CGvW1ANNDcTbJm
   QGTPstvHvuLL70RxDAE4XzmCa5liIrPPMgN9tuiQoI6hDlgml3ZkT5yeo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398557077"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="398557077"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676710114"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="676710114"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:10 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E9C57122DA8;
        Tue,  7 Mar 2023 23:20:47 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com
Subject: [RFC 09/10] media: v4l: async: Set v4l2_device in async notifier init
Date:   Tue,  7 Mar 2023 23:20:37 +0200
Message-Id: <20230307212038.968381-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230307212038.968381-1-sakari.ailus@linux.intel.com>
References: <20230307212038.968381-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set the v4l2_device already in async notifier init, so struct device related
to it will be available before the notifier is registered.

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
 drivers/media/platform/nxp/imx-mipi-csis.c    |  4 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |  4 +-
 drivers/media/platform/renesas/rcar-isp.c     |  4 +-
 .../platform/renesas/rcar-vin/rcar-core.c     |  8 ++--
 .../platform/renesas/rcar-vin/rcar-csi2.c     |  4 +-
 drivers/media/platform/renesas/rcar_drif.c    |  4 +-
 drivers/media/platform/renesas/renesas-ceu.c  |  4 +-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  4 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  4 +-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  4 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |  4 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  4 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |  6 +--
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  4 +-
 .../sun8i_a83t_mipi_csi2.c                    |  4 +-
 .../media/platform/ti/am437x/am437x-vpfe.c    |  4 +-
 drivers/media/platform/ti/cal/cal.c           |  4 +-
 drivers/media/platform/ti/omap3isp/isp.c      |  4 +-
 drivers/media/platform/video-mux.c            |  4 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  4 +-
 drivers/media/v4l2-core/v4l2-async.c          | 43 +++++++------------
 drivers/media/v4l2-core/v4l2-fwnode.c         |  4 +-
 drivers/staging/media/imx/imx-media-csi.c     |  4 +-
 .../staging/media/imx/imx-media-dev-common.c  |  4 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  4 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c  |  4 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |  4 +-
 drivers/staging/media/tegra-video/vi.c        |  4 +-
 include/media/v4l2-async.h                    | 35 +++++++++------
 38 files changed, 110 insertions(+), 114 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9ef70841cc32..7feff26497dd 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -745,7 +745,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 	if (!priv->nsources)
 		return 0;
 
-	v4l2_async_nf_init(&priv->notifier);
+	v4l2_async_subdev_nf_init(&priv->sd, &priv->notifier);
 
 	for_each_source(priv, source) {
 		unsigned int i = to_index(priv, source);
@@ -765,7 +765,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 
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
index b848a2a9032f..f492a756e960 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2289,7 +2289,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	if (IS_ERR(pcdev->clk))
 		return PTR_ERR(pcdev->clk);
 
-	v4l2_async_nf_init(&pcdev->notifier);
+	v4l2_async_nf_init(&pcdev->v4l2_dev, &pcdev->notifier);
 	pcdev->res = res;
 	pcdev->pdata = pdev->dev.platform_data;
 	if (pcdev->pdata) {
@@ -2401,7 +2401,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 		goto exit_notifier_cleanup;
 
 	pcdev->notifier.ops = &pxa_camera_sensor_ops;
-	err = v4l2_async_nf_register(&pcdev->v4l2_dev, &pcdev->notifier);
+	err = v4l2_async_nf_register(&pcdev->notifier);
 	if (err)
 		goto exit_notifier_cleanup;
 
diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
index dd1bba70bd79..68492e71bed0 100644
--- a/drivers/media/platform/marvell/cafe-driver.c
+++ b/drivers/media/platform/marvell/cafe-driver.c
@@ -536,7 +536,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto out_pdown;
 
-	v4l2_async_nf_init(&mcam->notifier);
+	v4l2_async_nf_init(&mcam->v4l2_dev, &mcam->notifier);
 
 	asd = v4l2_async_nf_add_i2c(&mcam->notifier,
 				    i2c_adapter_id(cam->i2c_adapter),
diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index b74a362ec075..fc30a56e4026 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -1877,7 +1877,7 @@ int mccic_register(struct mcam_camera *cam)
 	cam->mbus_code = mcam_def_mbus_code;
 
 	cam->notifier.ops = &mccic_notify_ops;
-	ret = v4l2_async_nf_register(&cam->v4l2_dev, &cam->notifier);
+	ret = v4l2_async_nf_register(&cam->notifier);
 	if (ret < 0) {
 		cam_warn(cam, "failed to register a sensor notifier");
 		goto out;
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
index 39fa98e6dbbc..cc10c531e3f2 100644
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
index a21f3b91cc06..a004fb82725c 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2297,7 +2297,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 
 	dev_dbg(dev, "vpfe_get_pdata\n");
 
-	v4l2_async_nf_init(&vpfe->notifier);
+	v4l2_async_nf_init(&vpfe->v4l2_dev, &vpfe->notifier);
 
 	if (!IS_ENABLED(CONFIG_OF) || !dev->of_node)
 		return dev->platform_data;
@@ -2463,7 +2463,7 @@ static int vpfe_probe(struct platform_device *pdev)
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
diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index e7327e38482d..c0f68e97c7f9 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2290,7 +2290,7 @@ static int isp_probe(struct platform_device *pdev)
 
 	mutex_init(&isp->isp_mutex);
 	spin_lock_init(&isp->stat_lock);
-	v4l2_async_nf_init(&isp->notifier);
+	v4l2_async_nf_init(&isp->v4l2_dev, &isp->notifier);
 	isp->dev = &pdev->dev;
 
 	ret = isp_parse_of_endpoints(isp);
@@ -2428,7 +2428,7 @@ static int isp_probe(struct platform_device *pdev)
 
 	isp->notifier.ops = &isp_subdev_notifier_ops;
 
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
index 70e7a1f6ed3b..0dd9172e1ec5 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -532,7 +532,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
 	/* Register the subdevices notifier. */
 	xdev->notifier.ops = &xvip_graph_notify_ops;
 
-	ret = v4l2_async_nf_register(&xdev->v4l2_dev, &xdev->notifier);
+	ret = v4l2_async_nf_register(&xdev->notifier);
 	if (ret < 0) {
 		dev_err(xdev->dev, "notifier registration failed\n");
 		goto done;
@@ -596,7 +596,7 @@ static int xvip_composite_probe(struct platform_device *pdev)
 
 	xdev->dev = &pdev->dev;
 	INIT_LIST_HEAD(&xdev->dmas);
-	v4l2_async_nf_init(&xdev->notifier);
+	v4l2_async_nf_init(&xdev->v4l2_dev, &xdev->notifier);
 
 	ret = xvip_composite_v4l2_init(xdev);
 	if (ret < 0)
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 5c97df911250..22c79a5fb824 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -507,12 +507,22 @@ static int v4l2_async_nf_asc_valid(struct v4l2_async_notifier *notifier,
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
@@ -558,16 +568,13 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
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
@@ -576,24 +583,6 @@ int v4l2_async_nf_register(struct v4l2_device *v4l2_dev,
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
@@ -602,9 +591,6 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
 
 	v4l2_async_nf_unbind_all_subdevs(notifier, false);
 
-	notifier->sd = NULL;
-	notifier->v4l2_dev = NULL;
-
 	list_del(&notifier->notifier_list);
 }
 
@@ -638,6 +624,9 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 		v4l2_async_nf_call_destroy(notifier, asd);
 		kfree(asd);
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
index d0b0ac205ae8..cc1aa114100e 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -135,6 +135,24 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
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
@@ -145,7 +163,8 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
  * __v4l2_async_nf_add_connection() or
  * v4l2_async_nf_parse_fwnode_endpoints().
  */
-void v4l2_async_nf_init(struct v4l2_async_notifier *notifier);
+void v4l2_async_subdev_nf_init(struct v4l2_subdev *sd,
+			       struct v4l2_async_notifier *notifier);
 
 /**
  * __v4l2_async_nf_add_connection() - Add an async subdev to the notifier's
@@ -240,21 +259,9 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
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

