Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4BCC8281C
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731184AbfHEXfa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:30 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45085 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731172AbfHEXf2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id r1so40409689pfq.12;
        Mon, 05 Aug 2019 16:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UgoIagqsWr60jnSWexngudSw/GwE5rD1jIoLj49qMwY=;
        b=R2Q3ujMPxawa8Ih7aXqp3Qg1h8/R/awfKhqLCTfyfpIm5oT6+RVS4em3Jx8/I4Cku9
         pwQECqGipkn48+tT5RSkwHjVxKeRBUftfOuNTsO4cy0o49HItAynGTsARGDY1Vq3jDu8
         fse/w6WUMHDLhuLJsJSQvew7Z/PElcZ4VHDxGQ3/3JJjH/mNfQdL3lcUZAhUv8DSuhMh
         lrKbji7udkd5AZuLqkW6QWapCMe0mIDBur5YVAk6bWxQuAAoYUAKRSGQUA8Oru6kOWMV
         uKPJ33SyiOWgdmODdyzKJ8e03JSz7RKmF7lISuIzf7Ji7+Gq0HJ9DtWNBjIUeMSZpozN
         Q+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UgoIagqsWr60jnSWexngudSw/GwE5rD1jIoLj49qMwY=;
        b=tK7EwKta2AQL9Pjfcwf0l8huPxV/yhd3vkabvBIW7LCSh+Vfs8tbw2p61pHhpa0CXV
         YGLrSuyJCl0/AqHz2s8et3rIyU7DiBsfBgorJDnLBnqcY8EDPzgmACVNZtifaz3Zt+xS
         qL3eFudBBmTjfcQNmv2Dv33C+NgQWG+/8XR/v4C+wSKIpL5nYUU6HKVhIjC5G4Hj2z6h
         KBpTTnY1XrXal73feWa0kaRLGnqcR16uwAXpQjX2Y/8VZL/KgwXdm6iH0Lkh96wEL+us
         1xtaDVuDHOrYy+/MuMZxfyCs9lZ298lLSh/DpJR75fFlMXmrOe5TxoSaH9Itlbs6koFV
         LZug==
X-Gm-Message-State: APjAAAV32y+ytCwLPkdYp4jXygtF6AzkJq0XBPZu2iQpUAl7klaF22kU
        GGDJN2S2FSEEo4ZIOSygNh1Fslcv
X-Google-Smtp-Source: APXvYqy9NbfueskhgMm+yPwYldKJ5nVyez32oNS70n9npXFHhG92pCWMjWrdWUkzDDfL2FSIvahpDQ==
X-Received: by 2002:a62:e910:: with SMTP id j16mr525719pfh.123.1565048127806;
        Mon, 05 Aug 2019 16:35:27 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:27 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org (open list),
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE)
Subject: [PATCH 11/22] media: v4l2-fwnode: Pass notifier to v4l2_async_register_fwnode_subdev()
Date:   Mon,  5 Aug 2019 16:34:54 -0700
Message-Id: <20190805233505.21167-12-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
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
 drivers/media/platform/video-mux.c         |  6 +++++-
 drivers/media/v4l2-core/v4l2-fwnode.c      | 11 +----------
 drivers/staging/media/imx/imx6-mipi-csi2.c |  5 ++++-
 drivers/staging/media/imx/imx7-media-csi.c |  5 ++++-
 drivers/staging/media/imx/imx7-mipi-csis.c |  5 ++++-
 include/media/v4l2-fwnode.h                | 12 ++++++++----
 6 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index ddd0e338f9e4..ca1cef783646 100644
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
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 5d4ce4aa3fdc..8f5b3fdea061 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1124,12 +1124,12 @@ int v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd)
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
@@ -1141,12 +1141,6 @@ int v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
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
@@ -1171,15 +1165,12 @@ int v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
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
index f29e28df36ed..408ee2765e77 100644
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
@@ -643,8 +644,10 @@ static int csi2_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &csi2->sd);
 
+	v4l2_async_notifier_init(&csi2->notifier);
+
 	ret = v4l2_async_register_fwnode_subdev(
-		&csi2->sd, sizeof(struct v4l2_async_subdev),
+		&csi2->sd, &csi2->notifier, sizeof(struct v4l2_async_subdev),
 		&sink_port, 1, csi2_parse_endpoint);
 	if (ret)
 		goto dphy_off;
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 500b4c08d967..a1c96c52a606 100644
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
@@ -1250,7 +1251,9 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	v4l2_ctrl_handler_init(&csi->ctrl_hdlr, 0);
 	csi->sd.ctrl_handler = &csi->ctrl_hdlr;
 
-	ret = v4l2_async_register_fwnode_subdev(&csi->sd,
+	v4l2_async_notifier_init(&csi->notifier);
+
+	ret = v4l2_async_register_fwnode_subdev(&csi->sd, &csi->notifier,
 						sizeof(struct v4l2_async_subdev),
 						NULL, 0,
 						imx7_csi_parse_endpoint);
diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index d1cdf011c8f1..f71d9183cad2 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -223,6 +223,7 @@ struct csi_state {
 	struct device *dev;
 	struct media_pad pads[CSIS_PADS_NUM];
 	struct v4l2_subdev mipi_sd;
+	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *src_sd;
 
 	u8 index;
@@ -892,7 +893,9 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 
 	v4l2_set_subdevdata(mipi_sd, &pdev->dev);
 
-	ret = v4l2_async_register_fwnode_subdev(mipi_sd,
+	v4l2_async_notifier_init(&state->notifier);
+
+	ret = v4l2_async_register_fwnode_subdev(mipi_sd, &state->notifier,
 						sizeof(struct v4l2_async_subdev),
 						&sink_port, 1,
 						mipi_csis_parse_endpoint);
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index f81f8bf34526..27a7b78149c2 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -331,6 +331,7 @@ int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
  *					and parses fwnode endpoints
  *
  * @sd: pointer to struct &v4l2_subdev
+ * @notifier: the sub-device's notifier.
  * @asd_struct_size: size of the driver's async sub-device struct, including
  *		     sizeof(struct v4l2_async_subdev). The &struct
  *		     v4l2_async_subdev shall be the first member of
@@ -343,13 +344,15 @@ int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
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
@@ -357,6 +360,7 @@ int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
  */
 int
 v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
+				  struct v4l2_async_notifier *notifier,
 				  size_t asd_struct_size,
 				  unsigned int *ports,
 				  unsigned int num_ports,
-- 
2.17.1

