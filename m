Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1C25152391
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgBDXtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:49:40 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40702 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgBDXtk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:40 -0500
Received: by mail-pf1-f193.google.com with SMTP id q8so170072pfh.7;
        Tue, 04 Feb 2020 15:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jUynGWRf9sI6R88VN+A+Lof5pz2eSFUmaeoDgeZz6dI=;
        b=mV4ykrXkIToVTjQOxOUTlSnm65lZiucVQSoZGKiO43gNyAML1s8k69ReqZshQWCnVX
         fn1BJL8gWhvgGV9jhgCCyRbIpODc8gATXsy4+mU9VTmAXOpvcVH4c+gDWPAxTTGWhSr2
         I8J55yeSk/6s6BKxRyaRKb/RE07RJdVxTDeM5ITS9dVE/YHEJ5aLNDJItU7ZZ0j3y0JZ
         z1/zmAeqN6cmQP5k5YGrkRrfm8T77uK3J1DdDkxtgzEvEtyhmciFFEs47Gp5O9DuY6hs
         QDLGlTBnoZYmigrqmtCbAjq1a5Yqbf9kosgM/kSMVnXK7zYZL1UCsroQrdPMpvHFNpft
         IAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jUynGWRf9sI6R88VN+A+Lof5pz2eSFUmaeoDgeZz6dI=;
        b=mMJkp/0WdUK49XkWebAK/v4lttgNRAPJmG3OP/PqNln4V9w4XAwdMQDXt9iBXNJnxf
         qvqsO1cXjMn82MUKnX6GGkCHVhvlRR4TPeuVCvd8AuTeKPxkqk7m/C/aP4rQkkA+YksX
         oYNxknxgMC9kHFN8i7x06IILANolQtktwh2dSrqUTxQhsZCUOjAWUb+SP5NPrcI1RvaX
         Bt18A9K2Cb4g8+dq6qg4ta9ZMrtLgjpTsN6TcXHMqr9Vs5wlhL6L6QAdxlHGAf2Lm1NE
         csi1Hl7V1OYJ1AotPPTNgBOgcDms9WPYLmA6dnyO0jwHuJb8HMoxHMl0gh5ABfydiiWA
         37jg==
X-Gm-Message-State: APjAAAVKK+tHWqf/N6cwoBvbQoqrFCaLWsKaN29aq0AkbcG0TTdDNiP2
        Y2FO4IsjikiLU51Roj80re/rYdWK
X-Google-Smtp-Source: APXvYqzcceO1lN1S91G9eSGPySGp3tSRqh1SD5abYm09FOCUxEWixWuYnXT81aaJkpZ5laS5vvtd1A==
X-Received: by 2002:a63:8a42:: with SMTP id y63mr19665372pgd.266.1580860179347;
        Tue, 04 Feb 2020 15:49:39 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:38 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org (open list),
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE)
Subject: [PATCH v3 02/17] media: v4l2-fwnode: Pass notifier to v4l2_async_register_fwnode_subdev()
Date:   Tue,  4 Feb 2020 15:49:03 -0800
Message-Id: <20200204234918.20425-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204234918.20425-1-slongerbeam@gmail.com>
References: <20200204234918.20425-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of allocating a notifier in v4l2_async_register_fwnode_subdev(),
have the caller provide one. This allows the caller to implement
notifier ops (bind, unbind).

The caller is now responsible for first initializing its notifier with a
call to v4l2_async_notifier_init().

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v3:
- added the missing calls to unregister/cleanup the new subdev notifiers.
  Reported by Rui Silva.
---
 drivers/media/platform/video-mux.c         |  8 +++++++-
 drivers/media/v4l2-core/v4l2-fwnode.c      | 11 +----------
 drivers/staging/media/imx/imx6-mipi-csi2.c |  7 ++++++-
 drivers/staging/media/imx/imx7-media-csi.c |  7 ++++++-
 drivers/staging/media/imx/imx7-mipi-csis.c |  9 ++++++++-
 include/media/v4l2-fwnode.h                | 12 ++++++++----
 6 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index ddd0e338f9e4..3d2a5c2b4c08 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -21,6 +21,7 @@
 
 struct video_mux {
 	struct v4l2_subdev subdev;
+	struct v4l2_async_notifier notifier;
 	struct media_pad *pads;
 	struct v4l2_mbus_framefmt *format_mbus;
 	struct mux_control *mux;
@@ -354,8 +355,11 @@ static int video_mux_async_register(struct video_mux *vmux,
 	for (i = 0; i < num_input_pads; i++)
 		ports[i] = i;
 
+	v4l2_async_notifier_init(&vmux->notifier);
+
 	ret = v4l2_async_register_fwnode_subdev(
-		&vmux->subdev, sizeof(struct v4l2_async_subdev),
+		&vmux->subdev, &vmux->notifier,
+		sizeof(struct v4l2_async_subdev),
 		ports, num_input_pads, video_mux_parse_endpoint);
 
 	kfree(ports);
@@ -442,6 +446,8 @@ static int video_mux_remove(struct platform_device *pdev)
 	struct video_mux *vmux = platform_get_drvdata(pdev);
 	struct v4l2_subdev *sd = &vmux->subdev;
 
+	v4l2_async_notifier_unregister(&vmux->notifier);
+	v4l2_async_notifier_cleanup(&vmux->notifier);
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 6ece4320e1d2..ae2cc4d6faf6 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1164,12 +1164,12 @@ int v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd)
 EXPORT_SYMBOL_GPL(v4l2_async_register_subdev_sensor_common);
 
 int v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
+				      struct v4l2_async_notifier *notifier,
 				      size_t asd_struct_size,
 				      unsigned int *ports,
 				      unsigned int num_ports,
 				      parse_endpoint_func parse_endpoint)
 {
-	struct v4l2_async_notifier *notifier;
 	struct device *dev = sd->dev;
 	struct fwnode_handle *fwnode;
 	int ret;
@@ -1181,12 +1181,6 @@ int v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
 	if (!fwnode_device_is_available(fwnode))
 		return -ENODEV;
 
-	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
-	if (!notifier)
-		return -ENOMEM;
-
-	v4l2_async_notifier_init(notifier);
-
 	if (!ports) {
 		ret = v4l2_async_notifier_parse_fwnode_endpoints(dev, notifier,
 								 asd_struct_size,
@@ -1211,15 +1205,12 @@ int v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
 	if (ret < 0)
 		goto out_unregister;
 
-	sd->subdev_notifier = notifier;
-
 	return 0;
 
 out_unregister:
 	v4l2_async_notifier_unregister(notifier);
 out_cleanup:
 	v4l2_async_notifier_cleanup(notifier);
-	kfree(notifier);
 
 	return ret;
 }
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index cd3dd6e33ef0..c1d1afeea53a 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -35,6 +35,7 @@
 struct csi2_dev {
 	struct device          *dev;
 	struct v4l2_subdev      sd;
+	struct v4l2_async_notifier notifier;
 	struct media_pad       pad[CSI2_NUM_PADS];
 	struct clk             *dphy_clk;
 	struct clk             *pllref_clk;
@@ -636,8 +637,10 @@ static int csi2_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &csi2->sd);
 
+	v4l2_async_notifier_init(&csi2->notifier);
+
 	ret = v4l2_async_register_fwnode_subdev(
-		&csi2->sd, sizeof(struct v4l2_async_subdev),
+		&csi2->sd, &csi2->notifier, sizeof(struct v4l2_async_subdev),
 		&sink_port, 1, csi2_parse_endpoint);
 	if (ret)
 		goto dphy_off;
@@ -658,6 +661,8 @@ static int csi2_remove(struct platform_device *pdev)
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 
+	v4l2_async_notifier_unregister(&csi2->notifier);
+	v4l2_async_notifier_cleanup(&csi2->notifier);
 	v4l2_async_unregister_subdev(sd);
 	clk_disable_unprepare(csi2->dphy_clk);
 	clk_disable_unprepare(csi2->pllref_clk);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index db30e2c70f2f..dc6d1a28fde7 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -155,6 +155,7 @@
 struct imx7_csi {
 	struct device *dev;
 	struct v4l2_subdev sd;
+	struct v4l2_async_notifier notifier;
 	struct imx_media_video_dev *vdev;
 	struct imx_media_dev *imxmd;
 	struct media_pad pad[IMX7_CSI_PADS_NUM];
@@ -1266,7 +1267,9 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto free;
 
-	ret = v4l2_async_register_fwnode_subdev(&csi->sd,
+	v4l2_async_notifier_init(&csi->notifier);
+
+	ret = v4l2_async_register_fwnode_subdev(&csi->sd, &csi->notifier,
 						sizeof(struct v4l2_async_subdev),
 						NULL, 0,
 						imx7_csi_parse_endpoint);
@@ -1303,6 +1306,8 @@ static int imx7_csi_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&imxmd->v4l2_dev);
 	media_device_cleanup(&imxmd->md);
 
+	v4l2_async_notifier_unregister(&csi->notifier);
+	v4l2_async_notifier_cleanup(&csi->notifier);
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&csi->ctrl_hdlr);
 
diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 383abecb3bec..4c54456318ea 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -223,6 +223,7 @@ struct csi_state {
 	struct device *dev;
 	struct media_pad pads[CSIS_PADS_NUM];
 	struct v4l2_subdev mipi_sd;
+	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *src_sd;
 
 	u8 index;
@@ -883,7 +884,9 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 	if (ret)
 		return ret;
 
-	ret = v4l2_async_register_fwnode_subdev(mipi_sd,
+	v4l2_async_notifier_init(&state->notifier);
+
+	ret = v4l2_async_register_fwnode_subdev(mipi_sd, &state->notifier,
 						sizeof(struct v4l2_async_subdev),
 						&sink_port, 1,
 						mipi_csis_parse_endpoint);
@@ -1014,6 +1017,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 unregister_all:
 	mipi_csis_debugfs_exit(state);
 	media_entity_cleanup(&state->mipi_sd.entity);
+	v4l2_async_notifier_unregister(&state->notifier);
+	v4l2_async_notifier_cleanup(&state->notifier);
 	v4l2_async_unregister_subdev(&state->mipi_sd);
 disable_clock:
 	mipi_csis_clk_disable(state);
@@ -1101,6 +1106,8 @@ static int mipi_csis_remove(struct platform_device *pdev)
 	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
 
 	mipi_csis_debugfs_exit(state);
+	v4l2_async_notifier_unregister(&state->notifier);
+	v4l2_async_notifier_cleanup(&state->notifier);
 	v4l2_async_unregister_subdev(&state->mipi_sd);
 
 	pm_runtime_disable(&pdev->dev);
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index f6a7bcd13197..b2b61e6c3769 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -375,6 +375,7 @@ int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
  *					and parses fwnode endpoints
  *
  * @sd: pointer to struct &v4l2_subdev
+ * @notifier: the sub-device's notifier.
  * @asd_struct_size: size of the driver's async sub-device struct, including
  *		     sizeof(struct v4l2_async_subdev). The &struct
  *		     v4l2_async_subdev shall be the first member of
@@ -387,13 +388,15 @@ int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
  *		    endpoint. Optional.
  *
  * This function is just like v4l2_async_register_subdev() with the
- * exception that calling it will also allocate a notifier for the
- * sub-device, parse the sub-device's firmware node endpoints using
- * v4l2_async_notifier_parse_fwnode_endpoints() or
+ * exception that calling it will also parse the sub-device's firmware
+ * node endpoints using v4l2_async_notifier_parse_fwnode_endpoints() or
  * v4l2_async_notifier_parse_fwnode_endpoints_by_port(), and
- * registers the sub-device notifier. The sub-device is similarly
+ * registers the sub-device's notifier. The sub-device is similarly
  * unregistered by calling v4l2_async_unregister_subdev().
  *
+ * The caller must first initialize the notifier with a call to
+ * v4l2_async_notifier_init().
+ *
  * While registered, the subdev module is marked as in-use.
  *
  * An error is returned if the module is no longer loaded on any attempts
@@ -401,6 +404,7 @@ int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
  */
 int
 v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
+				  struct v4l2_async_notifier *notifier,
 				  size_t asd_struct_size,
 				  unsigned int *ports,
 				  unsigned int num_ports,
-- 
2.17.1

