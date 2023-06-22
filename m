Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE05739FDD
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbjFVLl7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjFVLl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:58 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BBAF1FF9
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434097; x=1718970097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TqdCShfEumFiVAgvtg9mzfRS+bhEWmjUE5Bzad3FbqA=;
  b=DxG41EDQM14tIVM7qqul6iO7hmPvyXG8JP5v8cNdFKSXZxLAfdeHyu+w
   Z7LjNtOHa+wZriLen4Qzqp09WjJLWoA/q5qO1E2lHhA4HhwgT0ysKuWCH
   75VAbtVEDDOi9OIwiMQE6t3VxHbwd6FsABEnLxCeWERiFXv3kKlpqRlOb
   jfaFj+owCkD0xKI/l4+p2IgoalDSPKGgowo9yQK27L/RbFsNuWrwRTbxk
   kV8FBfOIvgjgGngm5mwuGC/TUzyPBvlIfQoTdNU2Vg0RGP3tbfs7zt7bs
   OBjXdvz9jtrJfqpYFaQaJLviEEoznDEnP/zwA3iZ4l2NzSUpD3saDPx1O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340800450"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="340800450"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="839013552"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="839013552"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1D53A120E0D;
        Thu, 22 Jun 2023 14:40:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg3-003oTP-06;
        Thu, 22 Jun 2023 14:40:39 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v4 19/38] media: v4l: async: Rename v4l2_async_subdev as v4l2_async_connection
Date:   Thu, 22 Jun 2023 14:40:09 +0300
Message-Id: <20230622114028.908825-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
References: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename v4l2_async_subdev as v4l2_async_connection, in order to
differentiate between the sub-devices and their connections: one
sub-device can have many connections but the V4L2 async framework has so
far allowed just a single one. Connections in this context will later
translate into either MC ancillary or data links.

This patch prepares changing that relation by changing existing users of
v4l2_async_subdev to switch to v4l2_async_connection. Async sub-devices
themselves will not be needed anymore

Additionally, __v4l2_async_nf_add_subdev() has been renamed
__v4l2_async_nf_add_connection().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 .../driver-api/media/v4l2-subdev.rst          |  51 +++---
 drivers/media/i2c/max9286.c                   |   9 +-
 drivers/media/i2c/st-mipid02.c                |   8 +-
 drivers/media/i2c/tc358746.c                  |   6 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  10 +-
 drivers/media/platform/atmel/atmel-isi.c      |   8 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |   6 +-
 drivers/media/platform/intel/pxa_camera.c     |  12 +-
 drivers/media/platform/marvell/cafe-driver.c  |   5 +-
 drivers/media/platform/marvell/mcam-core.c    |   4 +-
 drivers/media/platform/marvell/mmp-driver.c   |   4 +-
 .../platform/microchip/microchip-csi2dc.c     |   6 +-
 .../platform/microchip/microchip-isc-base.c   |   4 +-
 .../media/platform/microchip/microchip-isc.h  |   2 +-
 .../microchip/microchip-sama5d2-isc.c         |   4 +-
 .../microchip/microchip-sama7g5-isc.c         |   4 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |   6 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |   6 +-
 .../platform/nxp/imx8-isi/imx8-isi-core.c     |   8 +-
 drivers/media/platform/qcom/camss/camss.c     |   2 +-
 drivers/media/platform/qcom/camss/camss.h     |   2 +-
 drivers/media/platform/renesas/rcar-isp.c     |   8 +-
 .../platform/renesas/rcar-vin/rcar-core.c     |  44 ++---
 .../platform/renesas/rcar-vin/rcar-csi2.c     |  16 +-
 .../platform/renesas/rcar-vin/rcar-vin.h      |  10 +-
 drivers/media/platform/renesas/rcar_drif.c    |   8 +-
 drivers/media/platform/renesas/renesas-ceu.c  |   6 +-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  10 +-
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |   2 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |   8 +-
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   2 +-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |   8 +-
 .../platform/samsung/exynos4-is/media-dev.c   |   6 +-
 .../platform/samsung/exynos4-is/media-dev.h   |   2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c  |   8 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |   6 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   2 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   2 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   6 +-
 .../sun8i_a83t_mipi_csi2.c                    |   6 +-
 .../media/platform/ti/am437x/am437x-vpfe.c    |   5 +-
 .../media/platform/ti/am437x/am437x-vpfe.h    |   2 +-
 drivers/media/platform/ti/cal/cal.c           |   6 +-
 .../media/platform/ti/davinci/vpif_capture.c  |   7 +-
 drivers/media/platform/ti/omap3isp/isp.c      |   4 +-
 drivers/media/platform/ti/omap3isp/isp.h      |   2 +-
 drivers/media/platform/video-mux.c            |   6 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  22 +--
 drivers/media/v4l2-core/v4l2-async.c          | 159 +++++++++---------
 drivers/media/v4l2-core/v4l2-fwnode.c         |   8 +-
 .../media/deprecated/atmel/atmel-isc-base.c   |   4 +-
 .../media/deprecated/atmel/atmel-isc.h        |   2 +-
 .../deprecated/atmel/atmel-sama5d2-isc.c      |   4 +-
 .../deprecated/atmel/atmel-sama7g5-isc.c      |   4 +-
 drivers/staging/media/imx/imx-media-csi.c     |   6 +-
 .../staging/media/imx/imx-media-dev-common.c  |   2 +-
 drivers/staging/media/imx/imx-media-dev.c     |   2 +-
 drivers/staging/media/imx/imx-media-of.c      |   4 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |   8 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c  |   6 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   2 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   2 +-
 drivers/staging/media/tegra-video/vi.c        |  16 +-
 include/media/davinci/vpif_types.h            |   2 +-
 include/media/v4l2-async.h                    |  87 +++++-----
 include/media/v4l2-subdev.h                   |   4 +-
 66 files changed, 355 insertions(+), 348 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 327d444f34dcb..eba5e44682824 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -206,60 +206,67 @@ of an unregister notifier, it must be cleaned up by calling
 
 Before registering the notifier, bridge drivers must do two things: first, the
 notifier must be initialized using the :c:func:`v4l2_async_nf_init`.  Second,
-bridge drivers can then begin to form a list of subdevice descriptors that the
-bridge device needs for its operation. :c:func:`v4l2_async_nf_add_fwnode`,
+bridge drivers can then begin to form a list of async connection descriptors
+that the bridge device needs for its
+operation. :c:func:`v4l2_async_nf_add_fwnode`,
 :c:func:`v4l2_async_nf_add_fwnode_remote` and :c:func:`v4l2_async_nf_add_i2c`
-are available for that purpose.
+
+Async connection descriptors describe connections to external sub-devices the
+drivers for which are not yet probed. Based on an async connection, a media data
+or ancillary link may be created when the related sub-device becomes
+available. There may be one or more async connections to a given sub-device but
+this is not known at the time of adding the connections to the notifier. Async
+connections are bound as matching async sub-devices are found, one by one.
 
 Asynchronous sub-device registration helper for camera sensor drivers
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 :c:func:`v4l2_async_register_subdev_sensor` is a helper function for sensor
-drivers registering their own async sub-device, but it also registers a notifier
-and further registers async sub-devices for lens and flash devices found in
+drivers registering their own async connection, but it also registers a notifier
+and further registers async connections for lens and flash devices found in
 firmware. The notifier for the sub-device is unregistered and cleaned up with
 the async sub-device, using :c:func:`v4l2_async_unregister_subdev`.
 
 Asynchronous sub-device notifier example
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-These functions allocate an async sub-device descriptor which is of type struct
-:c:type:`v4l2_async_subdev` embedded in a driver-specific struct. The &struct
-:c:type:`v4l2_async_subdev` shall be the first member of this struct:
+These functions allocate an async connection descriptor which is of type struct
+:c:type:`v4l2_async_connection` embedded in a driver-specific struct. The &struct
+:c:type:`v4l2_async_connection` shall be the first member of this struct:
 
 .. code-block:: c
 
-	struct my_async_subdev {
-		struct v4l2_async_subdev asd;
+	struct my_async_connection {
+		struct v4l2_async_connection asc;
 		...
 	};
 
-	struct my_async_subdev *my_asd;
+	struct my_async_connection *my_asc;
 	struct fwnode_handle *ep;
 
 	...
 
-	my_asd = v4l2_async_nf_add_fwnode_remote(&notifier, ep,
-						 struct my_async_subdev);
+	my_asc = v4l2_async_nf_add_fwnode_remote(&notifier, ep,
+						 struct my_async_connection);
 	fwnode_handle_put(ep);
 
-	if (IS_ERR(my_asd))
-		return PTR_ERR(my_asd);
+	if (IS_ERR(my_asc))
+		return PTR_ERR(my_asc);
 
 Asynchronous sub-device notifier callbacks
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-The V4L2 core will then use these descriptors to match asynchronously
-registered subdevices to them. If a match is detected the ``.bound()``
-notifier callback is called. After all subdevices have been located the
-.complete() callback is called. When a subdevice is removed from the
-system the .unbind() method is called. All three callbacks are optional.
+The V4L2 core will then use these connection descriptors to match asynchronously
+registered subdevices to them. If a match is detected the ``.bound()`` notifier
+callback is called. After all connections have been bound the .complete()
+callback is called. When a connection is removed from the system the
+``.unbind()`` method is called. All three callbacks are optional.
 
 Drivers can store any type of custom data in their driver-specific
-:c:type:`v4l2_async_subdev` wrapper. If any of that data requires special
+:c:type:`v4l2_async_connection` wrapper. If any of that data requires special
 handling when the structure is freed, drivers must implement the ``.destroy()``
 notifier callback. The framework will call it right before freeing the
-:c:type:`v4l2_async_subdev`.
+:c:type:`v4l2_async_connection`.
 
 Calling subdev operations
 ~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 6425b0b0b145f..69cc2f5cff59d 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -161,11 +161,12 @@ struct max9286_source {
 };
 
 struct max9286_asd {
-	struct v4l2_async_subdev base;
+	struct v4l2_async_connection base;
 	struct max9286_source *source;
 };
 
-static inline struct max9286_asd *to_max9286_asd(struct v4l2_async_subdev *asd)
+static inline struct max9286_asd *
+to_max9286_asd(struct v4l2_async_connection *asd)
 {
 	return container_of(asd, struct max9286_asd, base);
 }
@@ -659,7 +660,7 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
 
 static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 				struct v4l2_subdev *subdev,
-				struct v4l2_async_subdev *asd)
+				struct v4l2_async_connection *asd)
 {
 	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
 	struct max9286_source *source = to_max9286_asd(asd)->source;
@@ -721,7 +722,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 
 static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *subdev,
-				  struct v4l2_async_subdev *asd)
+				  struct v4l2_async_connection *asd)
 {
 	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
 	struct max9286_source *source = to_max9286_asd(asd)->source;
diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 906553a28676d..5cd87b1d57591 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -829,7 +829,7 @@ static const struct media_entity_operations mipid02_subdev_entity_ops = {
 
 static int mipid02_async_bound(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *s_subdev,
-			       struct v4l2_async_subdev *asd)
+			       struct v4l2_async_connection *asd)
 {
 	struct mipid02_dev *bridge = to_mipid02_dev(notifier->sd);
 	struct i2c_client *client = bridge->i2c_client;
@@ -863,7 +863,7 @@ static int mipid02_async_bound(struct v4l2_async_notifier *notifier,
 
 static void mipid02_async_unbind(struct v4l2_async_notifier *notifier,
 				 struct v4l2_subdev *s_subdev,
-				 struct v4l2_async_subdev *asd)
+				 struct v4l2_async_connection *asd)
 {
 	struct mipid02_dev *bridge = to_mipid02_dev(notifier->sd);
 
@@ -879,7 +879,7 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 {
 	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
 	struct i2c_client *client = bridge->i2c_client;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct device_node *ep_node;
 	int ret;
 
@@ -914,7 +914,7 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
 	v4l2_async_nf_init(&bridge->notifier);
 	asd = v4l2_async_nf_add_fwnode_remote(&bridge->notifier,
 					      of_fwnode_handle(ep_node),
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 	of_node_put(ep_node);
 
 	if (IS_ERR(asd)) {
diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 755be45750525..fad57cc75de40 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1426,7 +1426,7 @@ static int tc358746_init_controls(struct tc358746 *tc358746)
 
 static int tc358746_notify_bound(struct v4l2_async_notifier *notifier,
 				 struct v4l2_subdev *sd,
-				 struct v4l2_async_subdev *asd)
+				 struct v4l2_async_connection *asd)
 {
 	struct tc358746 *tc358746 =
 		container_of(notifier, struct tc358746, notifier);
@@ -1445,7 +1445,7 @@ static int tc358746_async_register(struct tc358746 *tc358746)
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_PARALLEL,
 	};
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct fwnode_handle *ep;
 	int err;
 
@@ -1462,7 +1462,7 @@ static int tc358746_async_register(struct tc358746 *tc358746)
 
 	v4l2_async_nf_init(&tc358746->notifier);
 	asd = v4l2_async_nf_add_fwnode_remote(&tc358746->notifier, ep,
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 	fwnode_handle_put(ep);
 
 	if (IS_ERR(asd)) {
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 78248cb343ceb..636f0f4b4248f 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1371,7 +1371,7 @@ static const struct v4l2_subdev_ops cio2_subdev_ops = {
 /******* V4L2 sub-device asynchronous registration callbacks***********/
 
 struct sensor_async_subdev {
-	struct v4l2_async_subdev asd;
+	struct v4l2_async_connection asd;
 	struct csi2_bus_info csi2;
 };
 
@@ -1381,7 +1381,7 @@ struct sensor_async_subdev {
 /* The .bound() notifier callback when a match is found */
 static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *sd,
-			       struct v4l2_async_subdev *asd)
+			       struct v4l2_async_connection *asd)
 {
 	struct cio2_device *cio2 = to_cio2_device(notifier);
 	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
@@ -1402,7 +1402,7 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
 /* The .unbind callback */
 static void cio2_notifier_unbind(struct v4l2_async_notifier *notifier,
 				 struct v4l2_subdev *sd,
-				 struct v4l2_async_subdev *asd)
+				 struct v4l2_async_connection *asd)
 {
 	struct cio2_device *cio2 = to_cio2_device(notifier);
 	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
@@ -1416,11 +1416,11 @@ static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
 	struct cio2_device *cio2 = to_cio2_device(notifier);
 	struct device *dev = &cio2->pci_dev->dev;
 	struct sensor_async_subdev *s_asd;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct cio2_queue *q;
 	int ret;
 
-	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_entry) {
+	list_for_each_entry(asd, &cio2->notifier.asc_list, asc_entry) {
 		s_asd = to_sensor_asd(asd);
 		q = &cio2->queue[s_asd->csi2.port];
 
diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index c29e04864445c..7dbad99d4e45e 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1120,7 +1120,7 @@ static int isi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 static void isi_graph_notify_unbind(struct v4l2_async_notifier *notifier,
 				     struct v4l2_subdev *sd,
-				     struct v4l2_async_subdev *asd)
+				     struct v4l2_async_connection *asd)
 {
 	struct atmel_isi *isi = notifier_to_isi(notifier);
 
@@ -1132,7 +1132,7 @@ static void isi_graph_notify_unbind(struct v4l2_async_notifier *notifier,
 
 static int isi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_subdev *subdev,
-				   struct v4l2_async_subdev *asd)
+				   struct v4l2_async_connection *asd)
 {
 	struct atmel_isi *isi = notifier_to_isi(notifier);
 
@@ -1151,7 +1151,7 @@ static const struct v4l2_async_notifier_operations isi_graph_notify_ops = {
 
 static int isi_graph_init(struct atmel_isi *isi)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct device_node *ep;
 	int ret;
 
@@ -1163,7 +1163,7 @@ static int isi_graph_init(struct atmel_isi *isi)
 
 	asd = v4l2_async_nf_add_fwnode_remote(&isi->notifier,
 					      of_fwnode_handle(ep),
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 	of_node_put(ep);
 
 	if (IS_ERR(asd))
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 9755d1c8ceb9b..b0731c07eace0 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -246,7 +246,7 @@ static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
 
 static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,
 			      struct v4l2_subdev *s_subdev,
-			      struct v4l2_async_subdev *asd)
+			      struct v4l2_async_connection *asd)
 {
 	struct v4l2_subdev *subdev = notifier->sd;
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
@@ -365,7 +365,7 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
 static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 {
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct fwnode_handle *fwh;
 	struct device_node *ep;
 	int ret;
@@ -402,7 +402,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 	v4l2_async_nf_init(&csi2rx->notifier);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csi2rx->notifier, fwh,
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 	of_node_put(ep);
 	if (IS_ERR(asd))
 		return PTR_ERR(asd);
diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 9ed3c2e063de0..f0d316d5fe27c 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2044,7 +2044,7 @@ static const struct video_device pxa_camera_videodev_template = {
 
 static int pxa_camera_sensor_bound(struct v4l2_async_notifier *notifier,
 		     struct v4l2_subdev *subdev,
-		     struct v4l2_async_subdev *asd)
+		     struct v4l2_async_connection *asd)
 {
 	int err;
 	struct v4l2_device *v4l2_dev = notifier->v4l2_dev;
@@ -2123,7 +2123,7 @@ static int pxa_camera_sensor_bound(struct v4l2_async_notifier *notifier,
 
 static void pxa_camera_sensor_unbind(struct v4l2_async_notifier *notifier,
 		     struct v4l2_subdev *subdev,
-		     struct v4l2_async_subdev *asd)
+		     struct v4l2_async_connection *asd)
 {
 	struct pxa_camera_dev *pcdev = v4l2_dev_to_pcdev(notifier->v4l2_dev);
 
@@ -2197,7 +2197,7 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
 				    struct pxa_camera_dev *pcdev)
 {
 	u32 mclk_rate;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct device_node *np = dev->of_node;
 	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
 	int err = of_property_read_u32(np, "clock-frequency",
@@ -2252,7 +2252,7 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
 
 	asd = v4l2_async_nf_add_fwnode_remote(&pcdev->notifier,
 					      of_fwnode_handle(np),
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 	if (IS_ERR(asd))
 		err = PTR_ERR(asd);
 out:
@@ -2293,14 +2293,14 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	pcdev->res = res;
 	pcdev->pdata = pdev->dev.platform_data;
 	if (pcdev->pdata) {
-		struct v4l2_async_subdev *asd;
+		struct v4l2_async_connection *asd;
 
 		pcdev->platform_flags = pcdev->pdata->flags;
 		pcdev->mclk = pcdev->pdata->mclk_10khz * 10000;
 		asd = v4l2_async_nf_add_i2c(&pcdev->notifier,
 					    pcdev->pdata->sensor_i2c_adapter_id,
 					    pcdev->pdata->sensor_i2c_address,
-					    struct v4l2_async_subdev);
+					    struct v4l2_async_connection);
 		if (IS_ERR(asd))
 			err = PTR_ERR(asd);
 	} else if (pdev->dev.of_node) {
diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
index ae97ce4ead988..dd1bba70bd791 100644
--- a/drivers/media/platform/marvell/cafe-driver.c
+++ b/drivers/media/platform/marvell/cafe-driver.c
@@ -478,7 +478,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	int ret;
 	struct cafe_camera *cam;
 	struct mcam_camera *mcam;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct i2c_client *i2c_dev;
 
 	/*
@@ -540,7 +540,8 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 
 	asd = v4l2_async_nf_add_i2c(&mcam->notifier,
 				    i2c_adapter_id(cam->i2c_adapter),
-				    ov7670_info.addr, struct v4l2_async_subdev);
+				    ov7670_info.addr,
+				    struct v4l2_async_connection);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		goto out_smbus_shutdown;
diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index 154bdcb3f2cc5..3cee6d6b83fa9 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -1756,7 +1756,7 @@ EXPORT_SYMBOL_GPL(mccic_irq);
  */
 
 static int mccic_notify_bound(struct v4l2_async_notifier *notifier,
-	struct v4l2_subdev *subdev, struct v4l2_async_subdev *asd)
+	struct v4l2_subdev *subdev, struct v4l2_async_connection *asd)
 {
 	struct mcam_camera *cam = notifier_to_mcam(notifier);
 	int ret;
@@ -1801,7 +1801,7 @@ static int mccic_notify_bound(struct v4l2_async_notifier *notifier,
 }
 
 static void mccic_notify_unbind(struct v4l2_async_notifier *notifier,
-	struct v4l2_subdev *subdev, struct v4l2_async_subdev *asd)
+	struct v4l2_subdev *subdev, struct v4l2_async_connection *asd)
 {
 	struct mcam_camera *cam = notifier_to_mcam(notifier);
 
diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
index e93feefb447b4..dbc1368b91210 100644
--- a/drivers/media/platform/marvell/mmp-driver.c
+++ b/drivers/media/platform/marvell/mmp-driver.c
@@ -180,7 +180,7 @@ static int mmpcam_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct fwnode_handle *ep;
 	struct mmp_camera_platform_data *pdata;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	int ret;
 
 	cam = devm_kzalloc(&pdev->dev, sizeof(*cam), GFP_KERNEL);
@@ -242,7 +242,7 @@ static int mmpcam_probe(struct platform_device *pdev)
 	v4l2_async_nf_init(&mcam->notifier);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&mcam->notifier, ep,
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 	fwnode_handle_put(ep);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
index bfb3edcf018a8..d631c3880c536 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -476,7 +476,7 @@ static const struct v4l2_subdev_ops csi2dc_subdev_ops = {
 
 static int csi2dc_async_bound(struct v4l2_async_notifier *notifier,
 			      struct v4l2_subdev *subdev,
-			      struct v4l2_async_subdev *asd)
+			      struct v4l2_async_connection *asd)
 {
 	struct csi2dc_device *csi2dc = container_of(notifier,
 						struct csi2dc_device, notifier);
@@ -520,14 +520,14 @@ static const struct v4l2_async_notifier_operations csi2dc_async_ops = {
 static int csi2dc_prepare_notifier(struct csi2dc_device *csi2dc,
 				   struct fwnode_handle *input_fwnode)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	int ret = 0;
 
 	v4l2_async_nf_init(&csi2dc->notifier);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csi2dc->notifier,
 					      input_fwnode,
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 
 	fwnode_handle_put(input_fwnode);
 
diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 4e657fad33d04..8dbf7bc1e863b 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1712,7 +1712,7 @@ static int isc_ctrl_init(struct isc_device *isc)
 
 static int isc_async_bound(struct v4l2_async_notifier *notifier,
 			   struct v4l2_subdev *subdev,
-			   struct v4l2_async_subdev *asd)
+			   struct v4l2_async_connection *asd)
 {
 	struct isc_device *isc = container_of(notifier->v4l2_dev,
 					      struct isc_device, v4l2_dev);
@@ -1741,7 +1741,7 @@ static int isc_async_bound(struct v4l2_async_notifier *notifier,
 
 static void isc_async_unbind(struct v4l2_async_notifier *notifier,
 			     struct v4l2_subdev *subdev,
-			     struct v4l2_async_subdev *asd)
+			     struct v4l2_async_connection *asd)
 {
 	struct isc_device *isc = container_of(notifier->v4l2_dev,
 					      struct isc_device, v4l2_dev);
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index e3a6c7367e70a..ad4e98a1dd8fc 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -44,7 +44,7 @@ struct isc_buffer {
 
 struct isc_subdev_entity {
 	struct v4l2_subdev		*sd;
-	struct v4l2_async_subdev	*asd;
+	struct v4l2_async_connection	*asd;
 	struct device_node		*epn;
 	struct v4l2_async_notifier      notifier;
 
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 746f4a2fa9f6e..10e6cebf629e6 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -525,7 +525,7 @@ static int microchip_isc_probe(struct platform_device *pdev)
 	}
 
 	list_for_each_entry(subdev_entity, &isc->subdev_entities, list) {
-		struct v4l2_async_subdev *asd;
+		struct v4l2_async_connection *asd;
 		struct fwnode_handle *fwnode =
 			of_fwnode_handle(subdev_entity->epn);
 
@@ -533,7 +533,7 @@ static int microchip_isc_probe(struct platform_device *pdev)
 
 		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
 						      fwnode,
-						      struct v4l2_async_subdev);
+						      struct v4l2_async_connection);
 
 		of_node_put(subdev_entity->epn);
 		subdev_entity->epn = NULL;
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 79ae696764d08..324810dbdc3af 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -515,7 +515,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	}
 
 	list_for_each_entry(subdev_entity, &isc->subdev_entities, list) {
-		struct v4l2_async_subdev *asd;
+		struct v4l2_async_connection *asd;
 		struct fwnode_handle *fwnode =
 			of_fwnode_handle(subdev_entity->epn);
 
@@ -523,7 +523,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 
 		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
 						      fwnode,
-						      struct v4l2_async_subdev);
+						      struct v4l2_async_connection);
 
 		of_node_put(subdev_entity->epn);
 		subdev_entity->epn = NULL;
diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d0dc30187775d..390834ce482bd 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1230,7 +1230,7 @@ mipi_notifier_to_csis_state(struct v4l2_async_notifier *n)
 
 static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *sd,
-				  struct v4l2_async_subdev *asd)
+				  struct v4l2_async_connection *asd)
 {
 	struct mipi_csis_device *csis = mipi_notifier_to_csis_state(notifier);
 	struct media_pad *sink = &csis->sd.entity.pads[CSIS_PAD_SINK];
@@ -1247,7 +1247,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct fwnode_handle *ep;
 	unsigned int i;
 	int ret;
@@ -1278,7 +1278,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		goto err_parse;
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 0bd2613b9320f..6e763d6ab9a18 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2032,7 +2032,7 @@ static const struct media_entity_operations imx7_csi_entity_ops = {
 
 static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
 				 struct v4l2_subdev *sd,
-				 struct v4l2_async_subdev *asd)
+				 struct v4l2_async_connection *asd)
 {
 	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
 	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
@@ -2057,7 +2057,7 @@ static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
 
 static int imx7_csi_async_register(struct imx7_csi *csi)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct fwnode_handle *ep;
 	int ret;
 
@@ -2072,7 +2072,7 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 	}
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csi->notifier, ep,
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 
 	fwnode_handle_put(ep);
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 253e77189b69f..a09f416a64c4f 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -30,12 +30,12 @@
  */
 
 struct mxc_isi_async_subdev {
-	struct v4l2_async_subdev asd;
+	struct v4l2_async_connection asd;
 	unsigned int port;
 };
 
 static inline struct mxc_isi_async_subdev *
-asd_to_mxc_isi_async_subdev(struct v4l2_async_subdev *asd)
+asd_to_mxc_isi_async_subdev(struct v4l2_async_connection *asd)
 {
 	return container_of(asd, struct mxc_isi_async_subdev, asd);
 };
@@ -48,12 +48,12 @@ notifier_to_mxc_isi_dev(struct v4l2_async_notifier *n)
 
 static int mxc_isi_async_notifier_bound(struct v4l2_async_notifier *notifier,
 					struct v4l2_subdev *sd,
-					struct v4l2_async_subdev *asd)
+					struct v4l2_async_connection *asc)
 {
 	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
 				      | MEDIA_LNK_FL_ENABLED;
 	struct mxc_isi_dev *isi = notifier_to_mxc_isi_dev(notifier);
-	struct mxc_isi_async_subdev *masd = asd_to_mxc_isi_async_subdev(asd);
+	struct mxc_isi_async_subdev *masd = asd_to_mxc_isi_async_subdev(asc);
 	struct media_pad *pad = &isi->crossbar.pads[masd->port];
 	struct device_link *link;
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1ef26aea3eae6..006855bf076b7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1383,7 +1383,7 @@ static void camss_unregister_entities(struct camss *camss)
 
 static int camss_subdev_notifier_bound(struct v4l2_async_notifier *async,
 				       struct v4l2_subdev *subdev,
-				       struct v4l2_async_subdev *asd)
+				       struct v4l2_async_connection *asd)
 {
 	struct camss *camss = container_of(async, struct camss, notifier);
 	struct camss_async_subdev *csd =
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 3acd2b3403e8c..f6c326cb853b8 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -113,7 +113,7 @@ struct camss_camera_interface {
 };
 
 struct camss_async_subdev {
-	struct v4l2_async_subdev asd; /* must be first */
+	struct v4l2_async_connection asd; /* must be first */
 	struct camss_camera_interface interface;
 };
 
diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index fee1a066f56b7..5c6f931e81201 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -326,7 +326,7 @@ static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
 
 static int risp_notify_bound(struct v4l2_async_notifier *notifier,
 			     struct v4l2_subdev *subdev,
-			     struct v4l2_async_subdev *asd)
+			     struct v4l2_async_connection *asd)
 {
 	struct rcar_isp *isp = notifier_to_isp(notifier);
 	int pad;
@@ -350,7 +350,7 @@ static int risp_notify_bound(struct v4l2_async_notifier *notifier,
 
 static void risp_notify_unbind(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *subdev,
-			       struct v4l2_async_subdev *asd)
+			       struct v4l2_async_connection *asd)
 {
 	struct rcar_isp *isp = notifier_to_isp(notifier);
 
@@ -366,7 +366,7 @@ static const struct v4l2_async_notifier_operations risp_notify_ops = {
 
 static int risp_parse_dt(struct rcar_isp *isp)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct fwnode_handle *fwnode;
 	struct fwnode_handle *ep;
 	unsigned int id;
@@ -396,7 +396,7 @@ static int risp_parse_dt(struct rcar_isp *isp)
 	isp->notifier.ops = &risp_notify_ops;
 
 	asd = v4l2_async_nf_add_fwnode(&isp->notifier, fwnode,
-				       struct v4l2_async_subdev);
+				       struct v4l2_async_connection);
 	fwnode_handle_put(fwnode);
 	if (IS_ERR(asd))
 		return PTR_ERR(asd);
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 3c4f5eb93be18..c2cc206075f2d 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -252,7 +252,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 				     struct v4l2_subdev *subdev,
-				     struct v4l2_async_subdev *asd)
+				     struct v4l2_async_connection *asc)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
 	unsigned int i;
@@ -264,7 +264,7 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 	mutex_lock(&vin->group->lock);
 
 	for (i = 0; i < RVIN_CSI_MAX; i++) {
-		if (vin->group->remotes[i].asd != asd)
+		if (vin->group->remotes[i].asc != asc)
 			continue;
 		vin->group->remotes[i].subdev = NULL;
 		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
@@ -278,7 +278,7 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 
 static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_subdev *subdev,
-				   struct v4l2_async_subdev *asd)
+				   struct v4l2_async_connection *asc)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
 	unsigned int i;
@@ -286,7 +286,7 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
 	mutex_lock(&vin->group->lock);
 
 	for (i = 0; i < RVIN_CSI_MAX; i++) {
-		if (vin->group->remotes[i].asd != asd)
+		if (vin->group->remotes[i].asc != asc)
 			continue;
 		vin->group->remotes[i].subdev = subdev;
 		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
@@ -311,7 +311,7 @@ static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 	int ret;
 
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), port, id, 0);
@@ -327,14 +327,14 @@ static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
 		goto out;
 	}
 
-	asd = v4l2_async_nf_add_fwnode(&vin->group->notifier, fwnode,
-				       struct v4l2_async_subdev);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
+	asc = v4l2_async_nf_add_fwnode(&vin->group->notifier, fwnode,
+				       struct v4l2_async_connection);
+	if (IS_ERR(asc)) {
+		ret = PTR_ERR(asc);
 		goto out;
 	}
 
-	vin->group->remotes[vep.base.id].asd = asd;
+	vin->group->remotes[vep.base.id].asc = asc;
 
 	vin_dbg(vin, "Add group OF device %pOF to slot %u\n",
 		to_of_node(fwnode), vep.base.id);
@@ -387,7 +387,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 			continue;
 
 		for (id = 0; id < max_id; id++) {
-			if (vin->group->remotes[id].asd)
+			if (vin->group->remotes[id].asc)
 				continue;
 
 			ret = rvin_group_parse_of(vin->group->vin[i], port, id);
@@ -396,7 +396,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 		}
 	}
 
-	if (list_empty(&vin->group->notifier.asd_list))
+	if (list_empty(&vin->group->notifier.asc_list))
 		return 0;
 
 	vin->group->notifier.ops = &rvin_group_notify_ops;
@@ -611,7 +611,7 @@ static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
 
 static void rvin_parallel_notify_unbind(struct v4l2_async_notifier *notifier,
 					struct v4l2_subdev *subdev,
-					struct v4l2_async_subdev *asd)
+					struct v4l2_async_connection *asc)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
 
@@ -624,7 +624,7 @@ static void rvin_parallel_notify_unbind(struct v4l2_async_notifier *notifier,
 
 static int rvin_parallel_notify_bound(struct v4l2_async_notifier *notifier,
 				      struct v4l2_subdev *subdev,
-				      struct v4l2_async_subdev *asd)
+				      struct v4l2_async_connection *asc)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
 	int ret;
@@ -656,7 +656,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_UNKNOWN,
 	};
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 	int ret;
 
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
@@ -687,14 +687,14 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 		goto out;
 	}
 
-	asd = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
-				       struct v4l2_async_subdev);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
+	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
+				       struct v4l2_async_connection);
+	if (IS_ERR(asc)) {
+		ret = PTR_ERR(asc);
 		goto out;
 	}
 
-	vin->parallel.asd = asd;
+	vin->parallel.asc = asc;
 
 	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
 out:
@@ -719,11 +719,11 @@ static int rvin_parallel_init(struct rvin_dev *vin)
 	if (ret)
 		return ret;
 
-	if (!vin->parallel.asd)
+	if (!vin->parallel.asc)
 		return -ENODEV;
 
 	vin_dbg(vin, "Found parallel subdevice %pOF\n",
-		to_of_node(vin->parallel.asd->match.fwnode));
+		to_of_node(vin->parallel.asc->match.fwnode));
 
 	vin->notifier.ops = &rvin_parallel_notify_ops;
 	ret = v4l2_async_nf_register(&vin->v4l2_dev, &vin->notifier);
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index 7a134c0eff571..8549a3962102e 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
@@ -989,12 +989,12 @@ static irqreturn_t rcsi2_irq_thread(int irq, void *data)
 
 static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
 			      struct v4l2_subdev *subdev,
-			      struct v4l2_async_subdev *asd)
+			      struct v4l2_async_connection *asc)
 {
 	struct rcar_csi2 *priv = notifier_to_csi2(notifier);
 	int pad;
 
-	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
+	pad = media_entity_get_fwnode_pad(&subdev->entity, asc->match.fwnode,
 					  MEDIA_PAD_FL_SOURCE);
 	if (pad < 0) {
 		dev_err(priv->dev, "Failed to find pad for %s\n", subdev->name);
@@ -1014,7 +1014,7 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
 
 static void rcsi2_notify_unbind(struct v4l2_async_notifier *notifier,
 				struct v4l2_subdev *subdev,
-				struct v4l2_async_subdev *asd)
+				struct v4l2_async_connection *asc)
 {
 	struct rcar_csi2 *priv = notifier_to_csi2(notifier);
 
@@ -1091,7 +1091,7 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
 
 static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 	struct fwnode_handle *fwnode;
 	struct fwnode_handle *ep;
 	struct v4l2_fwnode_endpoint v4l2_ep = {
@@ -1126,11 +1126,11 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
 	v4l2_async_nf_init(&priv->notifier);
 	priv->notifier.ops = &rcar_csi2_notify_ops;
 
-	asd = v4l2_async_nf_add_fwnode(&priv->notifier, fwnode,
-				       struct v4l2_async_subdev);
+	asc = v4l2_async_nf_add_fwnode(&priv->notifier, fwnode,
+				       struct v4l2_async_connection);
 	fwnode_handle_put(fwnode);
-	if (IS_ERR(asd))
-		return PTR_ERR(asd);
+	if (IS_ERR(asc))
+		return PTR_ERR(asc);
 
 	ret = v4l2_async_subdev_nf_register(&priv->subdev, &priv->notifier);
 	if (ret)
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index cb206d3976ddf..792336dada447 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -106,7 +106,7 @@ struct rvin_video_format {
 
 /**
  * struct rvin_parallel_entity - Parallel video input endpoint descriptor
- * @asd:	sub-device descriptor for async framework
+ * @asc:	async connection descriptor for async framework
  * @subdev:	subdevice matched using async framework
  * @mbus_type:	media bus type
  * @bus:	media bus parallel configuration
@@ -115,7 +115,7 @@ struct rvin_video_format {
  *
  */
 struct rvin_parallel_entity {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 	struct v4l2_subdev *subdev;
 
 	enum v4l2_mbus_type mbus_type;
@@ -272,10 +272,10 @@ struct rvin_dev {
  *
  * @lock:		protects the count, notifier, vin and csi members
  * @count:		number of enabled VIN instances found in DT
- * @notifier:		group notifier for CSI-2 async subdevices
+ * @notifier:		group notifier for CSI-2 async connections
  * @vin:		VIN instances which are part of the group
  * @link_setup:		Callback to create all links for the media graph
- * @remotes:		array of pairs of fwnode and subdev pointers
+ * @remotes:		array of pairs of async connection and subdev pointers
  *			to all remote subdevices.
  */
 struct rvin_group {
@@ -291,7 +291,7 @@ struct rvin_group {
 	int (*link_setup)(struct rvin_dev *vin);
 
 	struct {
-		struct v4l2_async_subdev *asd;
+		struct v4l2_async_connection *asc;
 		struct v4l2_subdev *subdev;
 	} remotes[RVIN_REMOTES_MAX];
 };
diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 3a92f4535c18b..90fda730030d7 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -1097,7 +1097,7 @@ static void rcar_drif_sdr_unregister(struct rcar_drif_sdr *sdr)
 /* Sub-device bound callback */
 static int rcar_drif_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_subdev *subdev,
-				   struct v4l2_async_subdev *asd)
+				   struct v4l2_async_connection *asd)
 {
 	struct rcar_drif_sdr *sdr =
 		container_of(notifier, struct rcar_drif_sdr, notifier);
@@ -1112,7 +1112,7 @@ static int rcar_drif_notify_bound(struct v4l2_async_notifier *notifier,
 /* Sub-device unbind callback */
 static void rcar_drif_notify_unbind(struct v4l2_async_notifier *notifier,
 				   struct v4l2_subdev *subdev,
-				   struct v4l2_async_subdev *asd)
+				   struct v4l2_async_connection *asd)
 {
 	struct rcar_drif_sdr *sdr =
 		container_of(notifier, struct rcar_drif_sdr, notifier);
@@ -1205,7 +1205,7 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
 {
 	struct v4l2_async_notifier *notifier = &sdr->notifier;
 	struct fwnode_handle *fwnode, *ep;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 
 	v4l2_async_nf_init(notifier);
 
@@ -1225,7 +1225,7 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
 	}
 
 	asd = v4l2_async_nf_add_fwnode(notifier, fwnode,
-				       struct v4l2_async_subdev);
+				       struct v4l2_async_connection);
 	fwnode_handle_put(fwnode);
 	if (IS_ERR(asd))
 		return PTR_ERR(asd);
diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index 56b9c59cfda82..be6140c93fc0c 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -152,7 +152,7 @@ static inline struct ceu_buffer *vb2_to_ceu(struct vb2_v4l2_buffer *vbuf)
  * ceu_subdev - Wraps v4l2 sub-device and provides async subdevice.
  */
 struct ceu_subdev {
-	struct v4l2_async_subdev asd;
+	struct v4l2_async_connection asd;
 	struct v4l2_subdev *v4l2_sd;
 
 	/* per-subdevice mbus configuration options */
@@ -160,7 +160,7 @@ struct ceu_subdev {
 	struct ceu_mbus_fmt mbus_fmt;
 };
 
-static struct ceu_subdev *to_ceu_subdev(struct v4l2_async_subdev *asd)
+static struct ceu_subdev *to_ceu_subdev(struct v4l2_async_connection *asd)
 {
 	return container_of(asd, struct ceu_subdev, asd);
 }
@@ -1384,7 +1384,7 @@ static void ceu_vdev_release(struct video_device *vdev)
 
 static int ceu_notify_bound(struct v4l2_async_notifier *notifier,
 			    struct v4l2_subdev *v4l2_sd,
-			    struct v4l2_async_subdev *asd)
+			    struct v4l2_async_connection *asd)
 {
 	struct v4l2_device *v4l2_dev = notifier->v4l2_dev;
 	struct ceu_device *ceudev = v4l2_to_ceu(v4l2_dev);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 7a71370fcc32c..2d1093997db52 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -93,7 +93,7 @@ static int rzg2l_cru_group_notify_complete(struct v4l2_async_notifier *notifier)
 
 static void rzg2l_cru_group_notify_unbind(struct v4l2_async_notifier *notifier,
 					  struct v4l2_subdev *subdev,
-					  struct v4l2_async_subdev *asd)
+					  struct v4l2_async_connection *asd)
 {
 	struct rzg2l_cru_dev *cru = notifier_to_cru(notifier);
 
@@ -111,7 +111,7 @@ static void rzg2l_cru_group_notify_unbind(struct v4l2_async_notifier *notifier,
 
 static int rzg2l_cru_group_notify_bound(struct v4l2_async_notifier *notifier,
 					struct v4l2_subdev *subdev,
-					struct v4l2_async_subdev *asd)
+					struct v4l2_async_connection *asd)
 {
 	struct rzg2l_cru_dev *cru = notifier_to_cru(notifier);
 
@@ -139,7 +139,7 @@ static int rzg2l_cru_mc_parse_of(struct rzg2l_cru_dev *cru)
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct fwnode_handle *ep, *fwnode;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	int ret;
 
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(cru->dev), 1, 0, 0);
@@ -163,7 +163,7 @@ static int rzg2l_cru_mc_parse_of(struct rzg2l_cru_dev *cru)
 	}
 
 	asd = v4l2_async_nf_add_fwnode(&cru->notifier, fwnode,
-				       struct v4l2_async_subdev);
+				       struct v4l2_async_connection);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		goto out;
@@ -191,7 +191,7 @@ static int rzg2l_cru_mc_parse_of_graph(struct rzg2l_cru_dev *cru)
 
 	cru->notifier.ops = &rzg2l_cru_async_ops;
 
-	if (list_empty(&cru->notifier.asd_list))
+	if (list_empty(&cru->notifier.asc_list))
 		return 0;
 
 	ret = v4l2_async_nf_register(&cru->v4l2_dev, &cru->notifier);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 0b682cbae3eb5..811603f18af09 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -45,7 +45,7 @@ enum rzg2l_cru_dma_state {
 };
 
 struct rzg2l_cru_csi {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct v4l2_subdev *subdev;
 	u32 channel;
 };
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index d6489c62b0812..b0e75ee7a4754 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -600,7 +600,7 @@ static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {
 
 static int rzg2l_csi2_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_subdev *subdev,
-				   struct v4l2_async_subdev *asd)
+				   struct v4l2_async_connection *asd)
 {
 	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
 
@@ -616,7 +616,7 @@ static int rzg2l_csi2_notify_bound(struct v4l2_async_notifier *notifier,
 
 static void rzg2l_csi2_notify_unbind(struct v4l2_async_notifier *notifier,
 				     struct v4l2_subdev *subdev,
-				     struct v4l2_async_subdev *asd)
+				     struct v4l2_async_connection *asd)
 {
 	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
 
@@ -647,7 +647,7 @@ static int rzg2l_csi2_parse_dt(struct rzg2l_csi2 *csi2)
 	struct v4l2_fwnode_endpoint v4l2_ep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct fwnode_handle *fwnode;
 	struct fwnode_handle *ep;
 	int ret;
@@ -678,7 +678,7 @@ static int rzg2l_csi2_parse_dt(struct rzg2l_csi2 *csi2)
 	csi2->notifier.ops = &rzg2l_csi2_notify_ops;
 
 	asd = v4l2_async_nf_add_fwnode(&csi2->notifier, fwnode,
-				       struct v4l2_async_subdev);
+				       struct v4l2_async_connection);
 	fwnode_handle_put(fwnode);
 	if (IS_ERR(asd))
 		return PTR_ERR(asd);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index a1293c45aae11..d30f0ecb1bfd8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -148,7 +148,7 @@ struct rkisp1_info {
  * @port:		port number (0: MIPI, 1: Parallel)
  */
 struct rkisp1_sensor_async {
-	struct v4l2_async_subdev asd;
+	struct v4l2_async_connection asd;
 	unsigned int index;
 	struct fwnode_handle *source_ep;
 	unsigned int lanes;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 4762cb32353de..eb88494c2a427 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -122,12 +122,12 @@ struct rkisp1_isr_data {
 
 static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 					struct v4l2_subdev *sd,
-					struct v4l2_async_subdev *asd)
+					struct v4l2_async_connection *asc)
 {
 	struct rkisp1_device *rkisp1 =
 		container_of(notifier, struct rkisp1_device, notifier);
 	struct rkisp1_sensor_async *s_asd =
-		container_of(asd, struct rkisp1_sensor_async, asd);
+		container_of(asc, struct rkisp1_sensor_async, asd);
 	int source_pad;
 	int ret;
 
@@ -165,10 +165,10 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
 	return v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
 }
 
-static void rkisp1_subdev_notifier_destroy(struct v4l2_async_subdev *asd)
+static void rkisp1_subdev_notifier_destroy(struct v4l2_async_connection *asc)
 {
 	struct rkisp1_sensor_async *rk_asd =
-		container_of(asd, struct rkisp1_sensor_async, asd);
+		container_of(asc, struct rkisp1_sensor_async, asd);
 
 	fwnode_handle_put(rk_asd->source_ep);
 }
diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index c9cb9a216fae1..59070616cb1bd 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -401,7 +401,7 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 	int index = fmd->num_sensors;
 	struct fimc_source_info *pd = &fmd->sensor[index].pdata;
 	struct device_node *rem, *np;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
 	int ret;
 
@@ -466,7 +466,7 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 
 	asd = v4l2_async_nf_add_fwnode_remote(&fmd->subdev_notifier,
 					      of_fwnode_handle(ep),
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 
 	of_node_put(ep);
 
@@ -1372,7 +1372,7 @@ static int fimc_md_register_clk_provider(struct fimc_md *fmd)
 
 static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 				 struct v4l2_subdev *subdev,
-				 struct v4l2_async_subdev *asd)
+				 struct v4l2_async_connection *asd)
 {
 	struct fimc_md *fmd = notifier_to_fimc_md(notifier);
 	struct fimc_sensor_info *si = NULL;
diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/drivers/media/platform/samsung/exynos4-is/media-dev.h
index 079105d88bab7..786264cf79dc1 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -82,7 +82,7 @@ struct fimc_camclk_info {
  */
 struct fimc_sensor_info {
 	struct fimc_source_info pdata;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct v4l2_subdev *subdev;
 	struct fimc_dev *host;
 };
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index dad6e22e4ce42..6d1197d4464e2 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1837,7 +1837,7 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 static void dcmi_graph_notify_unbind(struct v4l2_async_notifier *notifier,
 				     struct v4l2_subdev *sd,
-				     struct v4l2_async_subdev *asd)
+				     struct v4l2_async_connection *asd)
 {
 	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
 
@@ -1849,7 +1849,7 @@ static void dcmi_graph_notify_unbind(struct v4l2_async_notifier *notifier,
 
 static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_subdev *subdev,
-				   struct v4l2_async_subdev *asd)
+				   struct v4l2_async_connection *asd)
 {
 	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
 	unsigned int ret;
@@ -1887,7 +1887,7 @@ static const struct v4l2_async_notifier_operations dcmi_graph_notify_ops = {
 
 static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct device_node *ep;
 	int ret;
 
@@ -1901,7 +1901,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 
 	asd = v4l2_async_nf_add_fwnode_remote(&dcmi->notifier,
 					      of_fwnode_handle(ep),
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 
 	of_node_put(ep);
 
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index d6e7d1b360836..38ca534842100 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -42,7 +42,7 @@ static const struct media_entity_operations sun4i_csi_video_entity_ops = {
 
 static int sun4i_csi_notify_bound(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *subdev,
-				  struct v4l2_async_subdev *asd)
+				  struct v4l2_async_connection *asd)
 {
 	struct sun4i_csi *csi = container_of(notifier, struct sun4i_csi,
 					     notifier);
@@ -118,7 +118,7 @@ static int sun4i_csi_notifier_init(struct sun4i_csi *csi)
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_PARALLEL,
 	};
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct fwnode_handle *ep;
 	int ret;
 
@@ -136,7 +136,7 @@ static int sun4i_csi_notifier_init(struct sun4i_csi *csi)
 	csi->bus = vep.bus.parallel;
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csi->notifier, ep,
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		goto out;
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index 4db950973ce2a..ebb725fc11ba5 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -642,7 +642,7 @@ static int sun6i_csi_bridge_link(struct sun6i_csi_device *csi_dev,
 static int
 sun6i_csi_bridge_notifier_bound(struct v4l2_async_notifier *notifier,
 				struct v4l2_subdev *remote_subdev,
-				struct v4l2_async_subdev *async_subdev)
+				struct v4l2_async_connection *async_subdev)
 {
 	struct sun6i_csi_device *csi_dev =
 		container_of(notifier, struct sun6i_csi_device,
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
index ee592a14b9c5d..44653b38f7221 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
@@ -34,7 +34,7 @@ struct sun6i_csi_bridge_source {
 };
 
 struct sun6i_csi_bridge_async_subdev {
-	struct v4l2_async_subdev	async_subdev;
+	struct v4l2_async_connection	async_subdev;
 	struct sun6i_csi_bridge_source	*source;
 };
 
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index dce130b4c9f6f..a78900dd0b7a6 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -408,7 +408,7 @@ static const struct media_entity_operations sun6i_mipi_csi2_entity_ops = {
 static int
 sun6i_mipi_csi2_notifier_bound(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *remote_subdev,
-			       struct v4l2_async_subdev *async_subdev)
+			       struct v4l2_async_connection *async_subdev)
 {
 	struct v4l2_subdev *subdev = notifier->sd;
 	struct sun6i_mipi_csi2_device *csi2_dev =
@@ -462,7 +462,7 @@ sun6i_mipi_csi2_bridge_source_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 {
 	struct v4l2_async_notifier *notifier = &csi2_dev->bridge.notifier;
 	struct v4l2_fwnode_endpoint *endpoint = &csi2_dev->bridge.endpoint;
-	struct v4l2_async_subdev *subdev_async;
+	struct v4l2_async_connection *subdev_async;
 	struct fwnode_handle *handle;
 	struct device *dev = csi2_dev->dev;
 	int ret;
@@ -480,7 +480,7 @@ sun6i_mipi_csi2_bridge_source_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 
 	subdev_async =
 		v4l2_async_nf_add_fwnode_remote(notifier, handle,
-						struct v4l2_async_subdev);
+						struct v4l2_async_connection);
 	if (IS_ERR(subdev_async))
 		ret = PTR_ERR(subdev_async);
 
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index 23d32e198aaae..909aaef200989 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -445,7 +445,7 @@ static const struct media_entity_operations sun8i_a83t_mipi_csi2_entity_ops = {
 static int
 sun8i_a83t_mipi_csi2_notifier_bound(struct v4l2_async_notifier *notifier,
 				    struct v4l2_subdev *remote_subdev,
-				    struct v4l2_async_subdev *async_subdev)
+				    struct v4l2_async_connection *async_subdev)
 {
 	struct v4l2_subdev *subdev = notifier->sd;
 	struct sun8i_a83t_mipi_csi2_device *csi2_dev =
@@ -499,7 +499,7 @@ sun8i_a83t_mipi_csi2_bridge_source_setup(struct sun8i_a83t_mipi_csi2_device *csi
 {
 	struct v4l2_async_notifier *notifier = &csi2_dev->bridge.notifier;
 	struct v4l2_fwnode_endpoint *endpoint = &csi2_dev->bridge.endpoint;
-	struct v4l2_async_subdev *subdev_async;
+	struct v4l2_async_connection *subdev_async;
 	struct fwnode_handle *handle;
 	struct device *dev = csi2_dev->dev;
 	int ret;
@@ -517,7 +517,7 @@ sun8i_a83t_mipi_csi2_bridge_source_setup(struct sun8i_a83t_mipi_csi2_device *csi
 
 	subdev_async =
 		v4l2_async_nf_add_fwnode_remote(notifier, handle,
-						struct v4l2_async_subdev);
+						struct v4l2_async_connection);
 	if (IS_ERR(subdev_async))
 		ret = PTR_ERR(subdev_async);
 
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index ffe1887cc429b..a1e01ef5ebddb 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2144,7 +2144,7 @@ static const struct v4l2_ioctl_ops vpfe_ioctl_ops = {
 static int
 vpfe_async_bound(struct v4l2_async_notifier *notifier,
 		 struct v4l2_subdev *subdev,
-		 struct v4l2_async_subdev *asd)
+		 struct v4l2_async_connection *asd)
 {
 	struct vpfe_device *vpfe = container_of(notifier->v4l2_dev,
 					       struct vpfe_device, v4l2_dev);
@@ -2370,8 +2370,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 
 		pdata->asd[i] = v4l2_async_nf_add_fwnode(&vpfe->notifier,
 							 of_fwnode_handle(rem),
-							 struct
-							 v4l2_async_subdev);
+							 struct v4l2_async_connection);
 		of_node_put(rem);
 		if (IS_ERR(pdata->asd[i]))
 			goto cleanup;
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.h b/drivers/media/platform/ti/am437x/am437x-vpfe.h
index f8b4e917b91a3..50c3c793b3708 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.h
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.h
@@ -84,7 +84,7 @@ struct vpfe_config {
 	/* information about each subdev */
 	struct vpfe_subdev_info sub_devs[VPFE_MAX_SUBDEV];
 	/* Flat array, arranged in groups */
-	struct v4l2_async_subdev *asd[VPFE_MAX_SUBDEV];
+	struct v4l2_async_connection *asd[VPFE_MAX_SUBDEV];
 };
 
 struct vpfe_cap_buffer {
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 9c5105223d6bf..bf7a985168c7b 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -804,19 +804,19 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
  */
 
 struct cal_v4l2_async_subdev {
-	struct v4l2_async_subdev asd; /* Must be first */
+	struct v4l2_async_connection asd; /* Must be first */
 	struct cal_camerarx *phy;
 };
 
 static inline struct cal_v4l2_async_subdev *
-to_cal_asd(struct v4l2_async_subdev *asd)
+to_cal_asd(struct v4l2_async_connection *asd)
 {
 	return container_of(asd, struct cal_v4l2_async_subdev, asd);
 }
 
 static int cal_async_notifier_bound(struct v4l2_async_notifier *notifier,
 				    struct v4l2_subdev *subdev,
-				    struct v4l2_async_subdev *asd)
+				    struct v4l2_async_connection *asd)
 {
 	struct cal_camerarx *phy = to_cal_asd(asd)->phy;
 	int pad;
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 44d269d6038c5..a63c9e51dac41 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1363,12 +1363,12 @@ static inline void free_vpif_objs(void)
 
 static int vpif_async_bound(struct v4l2_async_notifier *notifier,
 			    struct v4l2_subdev *subdev,
-			    struct v4l2_async_subdev *asd)
+			    struct v4l2_async_connection *asd)
 {
 	int i;
 
 	for (i = 0; i < vpif_obj.config->asd_sizes[0]; i++) {
-		struct v4l2_async_subdev *_asd = vpif_obj.config->asd[i];
+		struct v4l2_async_connection *_asd = vpif_obj.config->asd[i];
 		const struct fwnode_handle *fwnode = _asd->match.fwnode;
 
 		if (fwnode == subdev->fwnode) {
@@ -1570,8 +1570,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 
 		pdata->asd[i] = v4l2_async_nf_add_fwnode(&vpif_obj.notifier,
 							 of_fwnode_handle(rem),
-							 struct
-							 v4l2_async_subdev);
+							 struct v4l2_async_connection);
 		if (IS_ERR(pdata->asd[i]))
 			goto err_cleanup;
 
diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index c3872eadf5dff..0cc999598ff83 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2024,12 +2024,12 @@ enum isp_of_phy {
 
 static int isp_subdev_notifier_bound(struct v4l2_async_notifier *async,
 				     struct v4l2_subdev *sd,
-				     struct v4l2_async_subdev *asd)
+				     struct v4l2_async_connection *asc)
 {
 	struct isp_device *isp = container_of(async, struct isp_device,
 					      notifier);
 	struct isp_bus_cfg *bus_cfg =
-		&container_of(asd, struct isp_async_subdev, asd)->bus;
+		&container_of(asc, struct isp_async_subdev, asd)->bus;
 	int ret;
 
 	mutex_lock(&isp->media_dev.graph_mutex);
diff --git a/drivers/media/platform/ti/omap3isp/isp.h b/drivers/media/platform/ti/omap3isp/isp.h
index a9d760fbf3493..32ea70c8d2f9b 100644
--- a/drivers/media/platform/ti/omap3isp/isp.h
+++ b/drivers/media/platform/ti/omap3isp/isp.h
@@ -220,7 +220,7 @@ struct isp_device {
 };
 
 struct isp_async_subdev {
-	struct v4l2_async_subdev asd;
+	struct v4l2_async_connection asd;
 	struct isp_bus_cfg bus;
 };
 
diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 6d273abfe16cf..6cc0dde42e809 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -314,7 +314,7 @@ static const struct v4l2_subdev_ops video_mux_subdev_ops = {
 
 static int video_mux_notify_bound(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *sd,
-				  struct v4l2_async_subdev *asd)
+				  struct v4l2_async_connection *asd)
 {
 	struct video_mux *vmux = notifier_to_video_mux(notifier);
 
@@ -334,7 +334,7 @@ static int video_mux_async_register(struct video_mux *vmux,
 	v4l2_async_nf_init(&vmux->notifier);
 
 	for (i = 0; i < num_input_pads; i++) {
-		struct v4l2_async_subdev *asd;
+		struct v4l2_async_connection *asd;
 		struct fwnode_handle *ep, *remote_ep;
 
 		ep = fwnode_graph_get_endpoint_by_id(
@@ -352,7 +352,7 @@ static int video_mux_async_register(struct video_mux *vmux,
 		fwnode_handle_put(remote_ep);
 
 		asd = v4l2_async_nf_add_fwnode_remote(&vmux->notifier, ep,
-						      struct v4l2_async_subdev);
+						      struct v4l2_async_connection);
 
 		fwnode_handle_put(ep);
 
diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 52c5a7decf284..96fbbc55eb12c 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -34,13 +34,13 @@
  * @subdev: V4L2 subdev
  */
 struct xvip_graph_entity {
-	struct v4l2_async_subdev asd; /* must be first */
+	struct v4l2_async_connection asd; /* must be first */
 	struct media_entity *entity;
 	struct v4l2_subdev *subdev;
 };
 
 static inline struct xvip_graph_entity *
-to_xvip_entity(struct v4l2_async_subdev *asd)
+to_xvip_entity(struct v4l2_async_connection *asd)
 {
 	return container_of(asd, struct xvip_graph_entity, asd);
 }
@@ -54,9 +54,9 @@ xvip_graph_find_entity(struct xvip_composite_device *xdev,
 		       const struct fwnode_handle *fwnode)
 {
 	struct xvip_graph_entity *entity;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 
-	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_entry) {
+	list_for_each_entry(asd, &xdev->notifier.asc_list, asc_entry) {
 		entity = to_xvip_entity(asd);
 		if (entity->asd.match.fwnode == fwnode)
 			return entity;
@@ -285,13 +285,13 @@ static int xvip_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	struct xvip_composite_device *xdev =
 		container_of(notifier, struct xvip_composite_device, notifier);
 	struct xvip_graph_entity *entity;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	int ret;
 
 	dev_dbg(xdev->dev, "notify complete, all subdevs registered\n");
 
 	/* Create links for every entity. */
-	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_entry) {
+	list_for_each_entry(asd, &xdev->notifier.asc_list, asc_entry) {
 		entity = to_xvip_entity(asd);
 		ret = xvip_graph_build_one(xdev, entity);
 		if (ret < 0)
@@ -312,9 +312,9 @@ static int xvip_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 static int xvip_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_subdev *subdev,
-				   struct v4l2_async_subdev *asd)
+				   struct v4l2_async_connection *asc)
 {
-	struct xvip_graph_entity *entity = to_xvip_entity(asd);
+	struct xvip_graph_entity *entity = to_xvip_entity(asc);
 
 	entity->entity = &subdev->entity;
 	entity->subdev = subdev;
@@ -380,7 +380,7 @@ static int xvip_graph_parse_one(struct xvip_composite_device *xdev,
 static int xvip_graph_parse(struct xvip_composite_device *xdev)
 {
 	struct xvip_graph_entity *entity;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	int ret;
 
 	/*
@@ -393,7 +393,7 @@ static int xvip_graph_parse(struct xvip_composite_device *xdev)
 	if (ret < 0)
 		return 0;
 
-	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_entry) {
+	list_for_each_entry(asd, &xdev->notifier.asc_list, asc_entry) {
 		entity = to_xvip_entity(asd);
 		ret = xvip_graph_parse_one(xdev, entity->asd.match.fwnode);
 		if (ret < 0) {
@@ -501,7 +501,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
 		goto done;
 	}
 
-	if (list_empty(&xdev->notifier.asd_list)) {
+	if (list_empty(&xdev->notifier.asc_list)) {
 		dev_err(xdev->dev, "no subdev found in graph\n");
 		ret = -ENOENT;
 		goto done;
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 11d336e783bd0..9964d7f384807 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -28,22 +28,22 @@
 
 static int v4l2_async_nf_call_bound(struct v4l2_async_notifier *n,
 				    struct v4l2_subdev *subdev,
-				    struct v4l2_async_subdev *asd)
+				    struct v4l2_async_connection *asc)
 {
 	if (!n->ops || !n->ops->bound)
 		return 0;
 
-	return n->ops->bound(n, subdev, asd);
+	return n->ops->bound(n, subdev, asc);
 }
 
 static void v4l2_async_nf_call_unbind(struct v4l2_async_notifier *n,
 				      struct v4l2_subdev *subdev,
-				      struct v4l2_async_subdev *asd)
+				      struct v4l2_async_connection *asc)
 {
 	if (!n->ops || !n->ops->unbind)
 		return;
 
-	n->ops->unbind(n, subdev, asd);
+	n->ops->unbind(n, subdev, asc);
 }
 
 static int v4l2_async_nf_call_complete(struct v4l2_async_notifier *n)
@@ -55,12 +55,12 @@ static int v4l2_async_nf_call_complete(struct v4l2_async_notifier *n)
 }
 
 static void v4l2_async_nf_call_destroy(struct v4l2_async_notifier *n,
-				       struct v4l2_async_subdev *asd)
+				       struct v4l2_async_connection *asc)
 {
 	if (!n->ops || !n->ops->destroy)
 		return;
 
-	n->ops->destroy(asd);
+	n->ops->destroy(asc);
 }
 
 static bool match_i2c(struct v4l2_async_notifier *notifier,
@@ -151,18 +151,18 @@ static LIST_HEAD(subdev_list);
 static LIST_HEAD(notifier_list);
 static DEFINE_MUTEX(list_lock);
 
-static struct v4l2_async_subdev *
+static struct v4l2_async_connection *
 v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 		      struct v4l2_subdev *sd)
 {
 	bool (*match)(struct v4l2_async_notifier *notifier,
 		      struct v4l2_subdev *sd,
 		      struct v4l2_async_match_desc *match);
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 
-	list_for_each_entry(asd, &notifier->waiting_list, waiting_entry) {
+	list_for_each_entry(asc, &notifier->waiting_list, waiting_entry) {
 		/* bus_type has been verified valid before */
-		switch (asd->match.type) {
+		switch (asc->match.type) {
 		case V4L2_ASYNC_MATCH_TYPE_I2C:
 			match = match_i2c;
 			break;
@@ -176,8 +176,8 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 		}
 
 		/* match cannot be NULL here */
-		if (match(notifier, sd, &asd->match))
-			return asd;
+		if (match(notifier, sd, &asc->match))
+			return asc;
 	}
 
 	return NULL;
@@ -310,7 +310,7 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 				   struct v4l2_device *v4l2_dev,
 				   struct v4l2_subdev *sd,
-				   struct v4l2_async_subdev *asd)
+				   struct v4l2_async_connection *asc)
 {
 	struct v4l2_async_notifier *subdev_notifier;
 	int ret;
@@ -319,7 +319,7 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	if (ret < 0)
 		return ret;
 
-	ret = v4l2_async_nf_call_bound(notifier, sd, asd);
+	ret = v4l2_async_nf_call_bound(notifier, sd, asc);
 	if (ret < 0) {
 		v4l2_device_unregister_subdev(sd);
 		return ret;
@@ -333,13 +333,13 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
 	 */
 	ret = v4l2_async_create_ancillary_links(notifier, sd);
 	if (ret) {
-		v4l2_async_nf_call_unbind(notifier, sd, asd);
+		v4l2_async_nf_call_unbind(notifier, sd, asc);
 		v4l2_device_unregister_subdev(sd);
 		return ret;
 	}
 
-	list_del(&asd->waiting_entry);
-	sd->asd = asd;
+	list_del(&asc->waiting_entry);
+	sd->asd = asc;
 	sd->notifier = notifier;
 
 	/* Move from the global subdevice list to notifier's done */
@@ -380,17 +380,17 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
 
 again:
 	list_for_each_entry(sd, &subdev_list, async_list) {
-		struct v4l2_async_subdev *asd;
+		struct v4l2_async_connection *asc;
 		int ret;
 
-		asd = v4l2_async_find_match(notifier, sd);
-		if (!asd)
+		asc = v4l2_async_find_match(notifier, sd);
+		if (!asc)
 			continue;
 
 		dev_dbg(notifier_dev(notifier),
 			"v4l2-async: match found, subdev %s\n", sd->name);
 
-		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
+		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asc);
 		if (ret < 0)
 			return ret;
 
@@ -448,11 +448,11 @@ static bool
 v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
 				    struct v4l2_async_match_desc *match)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 	struct v4l2_subdev *sd;
 
-	list_for_each_entry(asd, &notifier->waiting_list, waiting_entry)
-		if (v4l2_async_match_equal(&asd->match, match))
+	list_for_each_entry(asc, &notifier->waiting_list, waiting_entry)
+		if (v4l2_async_match_equal(&asc->match, match))
 			return true;
 
 	list_for_each_entry(sd, &notifier->done_list, async_list) {
@@ -477,19 +477,19 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
 			      struct v4l2_async_match_desc *match,
 			      bool skip_self)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 
 	lockdep_assert_held(&list_lock);
 
 	/* Check that an asd is not being added more than once. */
-	list_for_each_entry(asd, &notifier->asd_list, asd_entry) {
-		if (skip_self && &asd->match == match)
+	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
+		if (skip_self && &asc->match == match)
 			continue;
-		if (v4l2_async_match_equal(&asd->match, match))
+		if (v4l2_async_match_equal(&asc->match, match))
 			return true;
 	}
 
-	/* Check that an asd does not exist in other notifiers. */
+	/* Check that an asc does not exist in other notifiers. */
 	list_for_each_entry(notifier, &notifier_list, notifier_entry)
 		if (v4l2_async_nf_has_async_match_entry(notifier, match))
 			return true;
@@ -523,13 +523,13 @@ static int v4l2_async_nf_match_valid(struct v4l2_async_notifier *notifier,
 
 void v4l2_async_nf_init(struct v4l2_async_notifier *notifier)
 {
-	INIT_LIST_HEAD(&notifier->asd_list);
+	INIT_LIST_HEAD(&notifier->asc_list);
 }
 EXPORT_SYMBOL(v4l2_async_nf_init);
 
 static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 	int ret;
 
 	INIT_LIST_HEAD(&notifier->waiting_list);
@@ -537,12 +537,12 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 
 	mutex_lock(&list_lock);
 
-	list_for_each_entry(asd, &notifier->asd_list, asd_entry) {
-		ret = v4l2_async_nf_match_valid(notifier, &asd->match, true);
+	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
+		ret = v4l2_async_nf_match_valid(notifier, &asc->match, true);
 		if (ret)
 			goto err_unlock;
 
-		list_add_tail(&asd->waiting_entry, &notifier->waiting_list);
+		list_add_tail(&asc->waiting_entry, &notifier->waiting_list);
 	}
 
 	ret = v4l2_async_nf_try_all_subdevs(notifier);
@@ -634,23 +634,23 @@ EXPORT_SYMBOL(v4l2_async_nf_unregister);
 
 static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 {
-	struct v4l2_async_subdev *asd, *tmp;
+	struct v4l2_async_connection *asc, *tmp;
 
-	if (!notifier || !notifier->asd_list.next)
+	if (!notifier || !notifier->asc_list.next)
 		return;
 
-	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_entry) {
-		switch (asd->match.type) {
+	list_for_each_entry_safe(asc, tmp, &notifier->asc_list, asc_entry) {
+		switch (asc->match.type) {
 		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
-			fwnode_handle_put(asd->match.fwnode);
+			fwnode_handle_put(asc->match.fwnode);
 			break;
 		default:
 			break;
 		}
 
-		list_del(&asd->asd_entry);
-		v4l2_async_nf_call_destroy(notifier, asd);
-		kfree(asd);
+		list_del(&asc->asc_entry);
+		v4l2_async_nf_call_destroy(notifier, asc);
+		kfree(asc);
 	}
 }
 
@@ -664,95 +664,94 @@ void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_nf_cleanup);
 
-
-static int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
-				      struct v4l2_async_subdev *asd)
+static int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
+					  struct v4l2_async_connection *asc)
 {
 	int ret;
 
 	mutex_lock(&list_lock);
 
-	ret = v4l2_async_nf_match_valid(notifier, &asd->match, false);
+	ret = v4l2_async_nf_match_valid(notifier, &asc->match, false);
 	if (ret)
 		goto unlock;
 
-	list_add_tail(&asd->asd_entry, &notifier->asd_list);
+	list_add_tail(&asc->asc_entry, &notifier->asc_list);
 
 unlock:
 	mutex_unlock(&list_lock);
 	return ret;
 }
 
-struct v4l2_async_subdev *
+struct v4l2_async_connection *
 __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
 			   struct fwnode_handle *fwnode,
-			   unsigned int asd_struct_size)
+			   unsigned int asc_struct_size)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 	int ret;
 
-	asd = kzalloc(asd_struct_size, GFP_KERNEL);
-	if (!asd)
+	asc = kzalloc(asc_struct_size, GFP_KERNEL);
+	if (!asc)
 		return ERR_PTR(-ENOMEM);
 
-	asd->match.type = V4L2_ASYNC_MATCH_TYPE_FWNODE;
-	asd->match.fwnode = fwnode_handle_get(fwnode);
+	asc->match.type = V4L2_ASYNC_MATCH_TYPE_FWNODE;
+	asc->match.fwnode = fwnode_handle_get(fwnode);
 
-	ret = __v4l2_async_nf_add_subdev(notifier, asd);
+	ret = __v4l2_async_nf_add_connection(notifier, asc);
 	if (ret) {
 		fwnode_handle_put(fwnode);
-		kfree(asd);
+		kfree(asc);
 		return ERR_PTR(ret);
 	}
 
-	return asd;
+	return asc;
 }
 EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_fwnode);
 
-struct v4l2_async_subdev *
+struct v4l2_async_connection *
 __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
 				  struct fwnode_handle *endpoint,
-				  unsigned int asd_struct_size)
+				  unsigned int asc_struct_size)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 	struct fwnode_handle *remote;
 
 	remote = fwnode_graph_get_remote_endpoint(endpoint);
 	if (!remote)
 		return ERR_PTR(-ENOTCONN);
 
-	asd = __v4l2_async_nf_add_fwnode(notif, remote, asd_struct_size);
+	asc = __v4l2_async_nf_add_fwnode(notif, remote, asc_struct_size);
 	/*
 	 * Calling __v4l2_async_nf_add_fwnode grabs a refcount,
 	 * so drop the one we got in fwnode_graph_get_remote_port_parent.
 	 */
 	fwnode_handle_put(remote);
-	return asd;
+	return asc;
 }
 EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_fwnode_remote);
 
-struct v4l2_async_subdev *
+struct v4l2_async_connection *
 __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
-			unsigned short address, unsigned int asd_struct_size)
+			unsigned short address, unsigned int asc_struct_size)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 	int ret;
 
-	asd = kzalloc(asd_struct_size, GFP_KERNEL);
-	if (!asd)
+	asc = kzalloc(asc_struct_size, GFP_KERNEL);
+	if (!asc)
 		return ERR_PTR(-ENOMEM);
 
-	asd->match.type = V4L2_ASYNC_MATCH_TYPE_I2C;
-	asd->match.i2c.adapter_id = adapter_id;
-	asd->match.i2c.address = address;
+	asc->match.type = V4L2_ASYNC_MATCH_TYPE_I2C;
+	asc->match.i2c.adapter_id = adapter_id;
+	asc->match.i2c.address = address;
 
-	ret = __v4l2_async_nf_add_subdev(notifier, asd);
+	ret = __v4l2_async_nf_add_connection(notifier, asc);
 	if (ret) {
-		kfree(asd);
+		kfree(asc);
 		return ERR_PTR(ret);
 	}
 
-	return asd;
+	return asc;
 }
 EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_i2c);
 
@@ -784,16 +783,16 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 	list_for_each_entry(notifier, &notifier_list, notifier_entry) {
 		struct v4l2_device *v4l2_dev =
 			v4l2_async_nf_find_v4l2_dev(notifier);
-		struct v4l2_async_subdev *asd;
+		struct v4l2_async_connection *asc;
 
 		if (!v4l2_dev)
 			continue;
 
-		asd = v4l2_async_find_match(notifier, sd);
-		if (!asd)
+		asc = v4l2_async_find_match(notifier, sd);
+		if (!asc)
 			continue;
 
-		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
+		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asc);
 		if (ret)
 			goto err_unbind;
 
@@ -898,14 +897,14 @@ v4l2_async_nf_name(struct v4l2_async_notifier *notifier)
 static int pending_subdevs_show(struct seq_file *s, void *data)
 {
 	struct v4l2_async_notifier *notif;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asc;
 
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(notif, &notifier_list, notifier_entry) {
 		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
-		list_for_each_entry(asd, &notif->waiting_list, waiting_entry)
-			print_waiting_match(s, &asd->match);
+		list_for_each_entry(asc, &notif->waiting_list, waiting_entry)
+			print_waiting_match(s, &asc->match);
 	}
 
 	mutex_unlock(&list_lock);
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index b71561957b9fb..7c3e1648a0f49 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -821,10 +821,10 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
 	     !(ret = fwnode_property_get_reference_args(dev_fwnode(dev), prop,
 							NULL, 0, index, &args));
 	     index++) {
-		struct v4l2_async_subdev *asd;
+		struct v4l2_async_connection *asd;
 
 		asd = v4l2_async_nf_add_fwnode(notifier, args.fwnode,
-					       struct v4l2_async_subdev);
+					       struct v4l2_async_connection);
 		fwnode_handle_put(args.fwnode);
 		if (IS_ERR(asd)) {
 			/* not an error if asd already exists */
@@ -1126,10 +1126,10 @@ v4l2_fwnode_reference_parse_int_props(struct device *dev,
 								  props,
 								  nprops)));
 	     index++) {
-		struct v4l2_async_subdev *asd;
+		struct v4l2_async_connection *asd;
 
 		asd = v4l2_async_nf_add_fwnode(notifier, fwnode,
-					       struct v4l2_async_subdev);
+					       struct v4l2_async_connection);
 		fwnode_handle_put(fwnode);
 		if (IS_ERR(asd)) {
 			ret = PTR_ERR(asd);
diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
index 61c5afa581424..f5d963904201f 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
@@ -1727,7 +1727,7 @@ static int isc_ctrl_init(struct isc_device *isc)
 
 static int isc_async_bound(struct v4l2_async_notifier *notifier,
 			    struct v4l2_subdev *subdev,
-			    struct v4l2_async_subdev *asd)
+			    struct v4l2_async_connection *asd)
 {
 	struct isc_device *isc = container_of(notifier->v4l2_dev,
 					      struct isc_device, v4l2_dev);
@@ -1746,7 +1746,7 @@ static int isc_async_bound(struct v4l2_async_notifier *notifier,
 
 static void isc_async_unbind(struct v4l2_async_notifier *notifier,
 			      struct v4l2_subdev *subdev,
-			      struct v4l2_async_subdev *asd)
+			      struct v4l2_async_connection *asd)
 {
 	struct isc_device *isc = container_of(notifier->v4l2_dev,
 					      struct isc_device, v4l2_dev);
diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc.h b/drivers/staging/media/deprecated/atmel/atmel-isc.h
index dfc030b5a08f0..31767ea74be62 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-isc.h
+++ b/drivers/staging/media/deprecated/atmel/atmel-isc.h
@@ -44,7 +44,7 @@ struct isc_buffer {
 
 struct isc_subdev_entity {
 	struct v4l2_subdev		*sd;
-	struct v4l2_async_subdev	*asd;
+	struct v4l2_async_connection	*asd;
 	struct device_node		*epn;
 	struct v4l2_async_notifier      notifier;
 
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index cc86ebcc76af5..58c8c7813e0f9 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -503,7 +503,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	}
 
 	list_for_each_entry(subdev_entity, &isc->subdev_entities, list) {
-		struct v4l2_async_subdev *asd;
+		struct v4l2_async_connection *asd;
 		struct fwnode_handle *fwnode =
 			of_fwnode_handle(subdev_entity->epn);
 
@@ -511,7 +511,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 
 		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
 						      fwnode,
-						      struct v4l2_async_subdev);
+						      struct v4l2_async_connection);
 
 		of_node_put(subdev_entity->epn);
 		subdev_entity->epn = NULL;
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
index 68ef3374d25e6..f10ddee0949e1 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -493,7 +493,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	}
 
 	list_for_each_entry(subdev_entity, &isc->subdev_entities, list) {
-		struct v4l2_async_subdev *asd;
+		struct v4l2_async_connection *asd;
 		struct fwnode_handle *fwnode =
 			of_fwnode_handle(subdev_entity->epn);
 
@@ -501,7 +501,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 
 		asd = v4l2_async_nf_add_fwnode_remote(&subdev_entity->notifier,
 						      fwnode,
-						      struct v4l2_async_subdev);
+						      struct v4l2_async_connection);
 
 		of_node_put(subdev_entity->epn);
 		subdev_entity->epn = NULL;
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 097171bb930d3..09b8b396022e0 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1892,7 +1892,7 @@ static const struct v4l2_subdev_internal_ops csi_internal_ops = {
 
 static int imx_csi_notify_bound(struct v4l2_async_notifier *notifier,
 				struct v4l2_subdev *sd,
-				struct v4l2_async_subdev *asd)
+				struct v4l2_async_connection *asd)
 {
 	struct csi_priv *priv = notifier_to_dev(notifier);
 	struct media_pad *sink = &priv->sd.entity.pads[CSI_SINK_PAD];
@@ -1913,7 +1913,7 @@ static const struct v4l2_async_notifier_operations csi_notify_ops = {
 
 static int imx_csi_async_register(struct csi_priv *priv)
 {
-	struct v4l2_async_subdev *asd = NULL;
+	struct v4l2_async_connection *asd = NULL;
 	struct fwnode_handle *ep;
 	unsigned int port;
 	int ret;
@@ -1930,7 +1930,7 @@ static int imx_csi_async_register(struct csi_priv *priv)
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (ep) {
 		asd = v4l2_async_nf_add_fwnode_remote(&priv->notifier, ep,
-						      struct v4l2_async_subdev);
+						      struct v4l2_async_connection);
 
 		fwnode_handle_put(ep);
 
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 991820a8500fb..c1216b4557b69 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -384,7 +384,7 @@ int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
 	int ret;
 
 	/* no subdevs? just bail */
-	if (list_empty(&imxmd->notifier.asd_list)) {
+	if (list_empty(&imxmd->notifier.asc_list)) {
 		v4l2_err(&imxmd->v4l2_dev, "no subdevs\n");
 		return -ENODEV;
 	}
diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index c80113905069b..be54dca11465d 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -20,7 +20,7 @@ static inline struct imx_media_dev *notifier2dev(struct v4l2_async_notifier *n)
 /* async subdev bound notifier */
 static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *sd,
-				  struct v4l2_async_subdev *asd)
+				  struct v4l2_async_connection *asd)
 {
 	struct imx_media_dev *imxmd = notifier2dev(notifier);
 	int ret;
diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index 92a99010c1505..118bff988bc7e 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -19,7 +19,7 @@
 static int imx_media_of_add_csi(struct imx_media_dev *imxmd,
 				struct device_node *csi_np)
 {
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	int ret = 0;
 
 	if (!of_device_is_available(csi_np)) {
@@ -31,7 +31,7 @@ static int imx_media_of_add_csi(struct imx_media_dev *imxmd,
 	/* add CSI fwnode to async notifier */
 	asd = v4l2_async_nf_add_fwnode(&imxmd->notifier,
 				       of_fwnode_handle(csi_np),
-				       struct v4l2_async_subdev);
+				       struct v4l2_async_connection);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		if (ret == -EEXIST)
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index ab565b4e29ece..e3273c5c9b602 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -636,7 +636,7 @@ static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
 
 static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
 			     struct v4l2_subdev *sd,
-			     struct v4l2_async_subdev *asd)
+			     struct v4l2_async_connection *asd)
 {
 	struct csi2_dev *csi2 = notifier_to_dev(notifier);
 	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
@@ -659,7 +659,7 @@ static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
 
 static void csi2_notify_unbind(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *sd,
-			       struct v4l2_async_subdev *asd)
+			       struct v4l2_async_connection *asd)
 {
 	struct csi2_dev *csi2 = notifier_to_dev(notifier);
 
@@ -676,7 +676,7 @@ static int csi2_async_register(struct csi2_dev *csi2)
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct fwnode_handle *ep;
 	int ret;
 
@@ -697,7 +697,7 @@ static int csi2_async_register(struct csi2_dev *csi2)
 	dev_dbg(csi2->dev, "flags: 0x%08x\n", vep.bus.mipi_csi2.flags);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csi2->notifier, ep,
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 	fwnode_handle_put(ep);
 
 	if (IS_ERR(asd))
diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index ca2efcc21efe3..326c3763b85a8 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -567,7 +567,7 @@ mipi_notifier_to_csi2_state(struct v4l2_async_notifier *n)
 
 static int imx8mq_mipi_csi_notify_bound(struct v4l2_async_notifier *notifier,
 					struct v4l2_subdev *sd,
-					struct v4l2_async_subdev *asd)
+					struct v4l2_async_connection *asd)
 {
 	struct csi_state *state = mipi_notifier_to_csi2_state(notifier);
 	struct media_pad *sink = &state->sd.entity.pads[MIPI_CSI2_PAD_SINK];
@@ -587,7 +587,7 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct fwnode_handle *ep;
 	unsigned int i;
 	int ret;
@@ -619,7 +619,7 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 		state->bus.flags);
 
 	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
-					      struct v4l2_async_subdev);
+					      struct v4l2_async_connection);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		goto err_parse;
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
index 1ca4673df2b3a..dd7dfecb9ef33 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
@@ -395,7 +395,7 @@ static int sun6i_isp_proc_link(struct sun6i_isp_device *isp_dev,
 
 static int sun6i_isp_proc_notifier_bound(struct v4l2_async_notifier *notifier,
 					 struct v4l2_subdev *remote_subdev,
-					 struct v4l2_async_subdev *async_subdev)
+					 struct v4l2_async_connection *async_subdev)
 {
 	struct sun6i_isp_device *isp_dev =
 		container_of(notifier, struct sun6i_isp_device, proc.notifier);
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
index c5c274e21ad55..db6738a39147b 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
@@ -34,7 +34,7 @@ struct sun6i_isp_proc_source {
 };
 
 struct sun6i_isp_proc_async_subdev {
-	struct v4l2_async_subdev	async_subdev;
+	struct v4l2_async_connection	async_subdev;
 	struct sun6i_isp_proc_source	*source;
 };
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 9c5b6cfdc8e90..07e3eb8c7056a 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -40,7 +40,7 @@
  * @subdev: V4L2 subdev
  */
 struct tegra_vi_graph_entity {
-	struct v4l2_async_subdev asd;
+	struct v4l2_async_connection asd;
 	struct media_entity *entity;
 	struct v4l2_subdev *subdev;
 };
@@ -58,7 +58,7 @@ to_tegra_channel_buffer(struct vb2_v4l2_buffer *vb)
 }
 
 static inline struct tegra_vi_graph_entity *
-to_tegra_vi_graph_entity(struct v4l2_async_subdev *asd)
+to_tegra_vi_graph_entity(struct v4l2_async_connection *asd)
 {
 	return container_of(asd, struct tegra_vi_graph_entity, asd);
 }
@@ -1462,9 +1462,9 @@ tegra_vi_graph_find_entity(struct tegra_vi_channel *chan,
 			   const struct fwnode_handle *fwnode)
 {
 	struct tegra_vi_graph_entity *entity;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 
-	list_for_each_entry(asd, &chan->notifier.asd_list, asd_entry) {
+	list_for_each_entry(asd, &chan->notifier.asc_list, asc_entry) {
 		entity = to_tegra_vi_graph_entity(asd);
 		if (entity->asd.match.fwnode == fwnode)
 			return entity;
@@ -1578,7 +1578,7 @@ static int tegra_vi_graph_build(struct tegra_vi_channel *chan,
 static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 {
 	struct tegra_vi_graph_entity *entity;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct v4l2_subdev *subdev;
 	struct tegra_vi_channel *chan;
 	struct tegra_vi *vi;
@@ -1608,7 +1608,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 	}
 
 	/* create links between the entities */
-	list_for_each_entry(asd, &chan->notifier.asd_list, asd_entry) {
+	list_for_each_entry(asd, &chan->notifier.asc_list, asc_entry) {
 		entity = to_tegra_vi_graph_entity(asd);
 		ret = tegra_vi_graph_build(chan, entity);
 		if (ret < 0)
@@ -1651,7 +1651,7 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 static int tegra_vi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				       struct v4l2_subdev *subdev,
-				       struct v4l2_async_subdev *asd)
+				       struct v4l2_async_connection *asd)
 {
 	struct tegra_vi_graph_entity *entity;
 	struct tegra_vi *vi;
@@ -1775,7 +1775,7 @@ static int tegra_vi_graph_init(struct tegra_vi *vi)
 
 		ret = tegra_vi_graph_parse_one(chan, remote);
 		fwnode_handle_put(remote);
-		if (ret < 0 || list_empty(&chan->notifier.asd_list))
+		if (ret < 0 || list_empty(&chan->notifier.asc_list))
 			continue;
 
 		chan->notifier.ops = &tegra_vi_async_ops;
diff --git a/include/media/davinci/vpif_types.h b/include/media/davinci/vpif_types.h
index d03e5c54347ad..6cce1f09c721b 100644
--- a/include/media/davinci/vpif_types.h
+++ b/include/media/davinci/vpif_types.h
@@ -72,7 +72,7 @@ struct vpif_capture_config {
 	int i2c_adapter_id;
 	const char *card_name;
 
-	struct v4l2_async_subdev *asd[VPIF_CAPTURE_MAX_CHANNELS];
+	struct v4l2_async_connection *asd[VPIF_CAPTURE_MAX_CHANNELS];
 	int asd_sizes[VPIF_CAPTURE_MAX_CHANNELS];
 };
 #endif /* _VPIF_TYPES_H */
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 03ac6520f3d27..a27d9dc8afcbd 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -25,7 +25,7 @@ struct v4l2_async_notifier;
  * @V4L2_ASYNC_MATCH_TYPE_I2C: Match will check for I2C adapter ID and address
  * @V4L2_ASYNC_MATCH_TYPE_FWNODE: Match will use firmware node
  *
- * This enum is used by the asynchronous sub-device logic to define the
+ * This enum is used by the asynchronous connection logic to define the
  * algorithm that will be used to match an asynchronous device.
  */
 enum v4l2_async_match_type {
@@ -34,7 +34,7 @@ enum v4l2_async_match_type {
 };
 
 /**
- * struct v4l2_async_match_desc - async sub-device match information
+ * struct v4l2_async_match_desc - async connection match information
  *
  * @type:	type of match that will be used
  * @fwnode:	pointer to &struct fwnode_handle to be matched.
@@ -62,21 +62,21 @@ struct v4l2_async_match_desc {
 };
 
 /**
- * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
+ * struct v4l2_async_connection - connection descriptor, as known to a bridge
  *
  * @match:	struct of match type and per-bus type matching data sets
- * @asd_entry:	used to add struct v4l2_async_subdev objects to the
- *		master notifier @asd_list
- * @waiting_entry: used to link struct v4l2_async_subdev objects, waiting to be
- *		probed, to a notifier->waiting_list list
+ * @asc_entry:	used to add struct v4l2_async_connection objects to the
+ *		master notifier @asc_list
+ * @waiting_entry: used to link struct v4l2_async_connection objects, waiting to
+ *		be probed, to a notifier->waiting_list list
  *
  * When this struct is used as a member in a driver specific struct,
  * the driver specific struct shall contain the &struct
- * v4l2_async_subdev as its first member.
+ * v4l2_async_connection as its first member.
  */
-struct v4l2_async_subdev {
+struct v4l2_async_connection {
 	struct v4l2_async_match_desc match;
-	struct list_head asd_entry;
+	struct list_head asc_entry;
 	struct list_head waiting_entry;
 };
 
@@ -86,17 +86,17 @@ struct v4l2_async_subdev {
  * @complete:	All subdevices have been probed successfully. The complete
  *		callback is only executed for the root notifier.
  * @unbind:	a subdevice is leaving
- * @destroy:	the asd is about to be freed
+ * @destroy:	the asc is about to be freed
  */
 struct v4l2_async_notifier_operations {
 	int (*bound)(struct v4l2_async_notifier *notifier,
 		     struct v4l2_subdev *subdev,
-		     struct v4l2_async_subdev *asd);
+		     struct v4l2_async_connection *asc);
 	int (*complete)(struct v4l2_async_notifier *notifier);
 	void (*unbind)(struct v4l2_async_notifier *notifier,
 		       struct v4l2_subdev *subdev,
-		       struct v4l2_async_subdev *asd);
-	void (*destroy)(struct v4l2_async_subdev *asd);
+		       struct v4l2_async_connection *asc);
+	void (*destroy)(struct v4l2_async_connection *asc);
 };
 
 /**
@@ -106,8 +106,9 @@ struct v4l2_async_notifier_operations {
  * @v4l2_dev:	v4l2_device of the root notifier, NULL otherwise
  * @sd:		sub-device that registered the notifier, NULL otherwise
  * @parent:	parent notifier
- * @asd_list:	master list of struct v4l2_async_subdev
- * @waiting_list: list of struct v4l2_async_subdev, waiting for their drivers
+ * @asc_list:	master list of struct v4l2_async_connection
+ * @waiting_list: list of struct v4l2_async_connection, waiting for their
+ *		  drivers
  * @done_list:	list of struct v4l2_subdev, already probed
  * @notifier_entry: member in a global list of notifiers
  */
@@ -116,7 +117,7 @@ struct v4l2_async_notifier {
 	struct v4l2_device *v4l2_dev;
 	struct v4l2_subdev *sd;
 	struct v4l2_async_notifier *parent;
-	struct list_head asd_list;
+	struct list_head asc_list;
 	struct list_head waiting_list;
 	struct list_head done_list;
 	struct list_head notifier_entry;
@@ -134,53 +135,53 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
  *
  * @notifier: pointer to &struct v4l2_async_notifier
  *
- * This function initializes the notifier @asd_list. It must be called
+ * This function initializes the notifier @asc_list. It must be called
  * before adding a subdevice to a notifier, using one of:
  * v4l2_async_nf_add_fwnode_remote(), v4l2_async_nf_add_fwnode() or
  * v4l2_async_nf_add_i2c().
  */
 void v4l2_async_nf_init(struct v4l2_async_notifier *notifier);
 
-struct v4l2_async_subdev *
+struct v4l2_async_connection *
 __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
 			   struct fwnode_handle *fwnode,
-			   unsigned int asd_struct_size);
+			   unsigned int asc_struct_size);
 /**
  * v4l2_async_nf_add_fwnode - Allocate and add a fwnode async
- *				subdev to the notifier's master asd_list.
+ *				subdev to the notifier's master asc_list.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
  * @fwnode: fwnode handle of the sub-device to be matched, pointer to
  *	    &struct fwnode_handle
- * @type: Type of the driver's async sub-device struct. The &struct
- *	  v4l2_async_subdev shall be the first member of the driver's async
- *	  sub-device struct, i.e. both begin at the same memory address.
+ * @type: Type of the driver's async sub-device or connection struct. The
+ *	  &struct v4l2_async_connection shall be the first member of the
+ *	  driver's async struct, i.e. both begin at the same memory address.
  *
- * Allocate a fwnode-matched asd of size asd_struct_size, and add it to the
- * notifiers @asd_list. The function also gets a reference of the fwnode which
+ * Allocate a fwnode-matched asc of size asc_struct_size, and add it to the
+ * notifiers @asc_list. The function also gets a reference of the fwnode which
  * is released later at notifier cleanup time.
  */
 #define v4l2_async_nf_add_fwnode(notifier, fwnode, type)		\
 	((type *)__v4l2_async_nf_add_fwnode(notifier, fwnode, sizeof(type)))
 
-struct v4l2_async_subdev *
+struct v4l2_async_connection *
 __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
 				  struct fwnode_handle *endpoint,
-				  unsigned int asd_struct_size);
+				  unsigned int asc_struct_size);
 /**
  * v4l2_async_nf_add_fwnode_remote - Allocate and add a fwnode
  *						  remote async subdev to the
- *						  notifier's master asd_list.
+ *						  notifier's master asc_list.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
- * @ep: local endpoint pointing to the remote sub-device to be matched,
+ * @ep: local endpoint pointing to the remote connection to be matched,
  *	pointer to &struct fwnode_handle
- * @type: Type of the driver's async sub-device struct. The &struct
- *	  v4l2_async_subdev shall be the first member of the driver's async
- *	  sub-device struct, i.e. both begin at the same memory address.
+ * @type: Type of the driver's async connection struct. The &struct
+ *	  v4l2_async_connection shall be the first member of the driver's async
+ *	  connection struct, i.e. both begin at the same memory address.
  *
  * Gets the remote endpoint of a given local endpoint, set it up for fwnode
- * matching and adds the async sub-device to the notifier's @asd_list. The
+ * matching and adds the async connection to the notifier's @asc_list. The
  * function also gets a reference of the fwnode which is released later at
  * notifier cleanup time.
  *
@@ -190,23 +191,23 @@ __v4l2_async_nf_add_fwnode_remote(struct v4l2_async_notifier *notif,
 #define v4l2_async_nf_add_fwnode_remote(notifier, ep, type) \
 	((type *)__v4l2_async_nf_add_fwnode_remote(notifier, ep, sizeof(type)))
 
-struct v4l2_async_subdev *
+struct v4l2_async_connection *
 __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
 			int adapter_id, unsigned short address,
-			unsigned int asd_struct_size);
+			unsigned int asc_struct_size);
 /**
  * v4l2_async_nf_add_i2c - Allocate and add an i2c async
- *				subdev to the notifier's master asd_list.
+ *				subdev to the notifier's master asc_list.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
  * @adapter: I2C adapter ID to be matched
- * @address: I2C address of sub-device to be matched
- * @type: Type of the driver's async sub-device struct. The &struct
- *	  v4l2_async_subdev shall be the first member of the driver's async
- *	  sub-device struct, i.e. both begin at the same memory address.
+ * @address: I2C address of connection to be matched
+ * @type: Type of the driver's async connection struct. The &struct
+ *	  v4l2_async_connection shall be the first member of the driver's async
+ *	  connection struct, i.e. both begin at the same memory address.
  *
  * Same as v4l2_async_nf_add_fwnode() but for I2C matched
- * sub-devices.
+ * connections.
  */
 #define v4l2_async_nf_add_i2c(notifier, adapter, address, type) \
 	((type *)__v4l2_async_nf_add_i2c(notifier, adapter, address, \
@@ -244,7 +245,7 @@ void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier);
  * @notifier: the notifier the resources of which are to be cleaned up
  *
  * Release memory resources related to a notifier, including the async
- * sub-devices allocated for the purposes of the notifier but not the notifier
+ * connections allocated for the purposes of the notifier but not the notifier
  * itself. The user is responsible for calling this function to clean up the
  * notifier after calling v4l2_async_nf_add_fwnode_remote(),
  * v4l2_async_nf_add_fwnode() or v4l2_async_nf_add_i2c().
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b58c7a325e99e..212d7f1ac525c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1022,7 +1022,7 @@ struct v4l2_subdev_platform_data {
  *	    either dev->of_node->fwnode or dev->fwnode (whichever is non-NULL).
  * @async_list: Links this subdev to a global subdev_list or
  *		@notifier->done_list list.
- * @asd: Pointer to respective &struct v4l2_async_subdev.
+ * @asd: Pointer to respective &struct v4l2_async_connection.
  * @notifier: Pointer to the managing notifier.
  * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
  *		     device using v4l2_async_register_subdev_sensor().
@@ -1065,7 +1065,7 @@ struct v4l2_subdev {
 	struct device *dev;
 	struct fwnode_handle *fwnode;
 	struct list_head async_list;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct v4l2_async_notifier *notifier;
 	struct v4l2_async_notifier *subdev_notifier;
 	struct v4l2_subdev_platform_data *pdata;
-- 
2.39.2

