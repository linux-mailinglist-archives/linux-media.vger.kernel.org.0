Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6089B10849E
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfKXTH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:28 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46206 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbfKXTH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:26 -0500
Received: by mail-pg1-f194.google.com with SMTP id r18so5909923pgu.13
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ttEfZsY6dic0+OiNMThzYQrbSNb+Yy78L0Oc8DJv0uY=;
        b=bPcHZ6KNjAJglZr+/RWPxdQod7grx5/2VvfXkbJa1y066M05KSSWGJpKBxIn925wyw
         nnoj9gYIMHDfqnSR22bC0QxrorJ7q2TPV9WFL0eZWYUy2jqdM/2qqv8wEI3D3ryvEuxn
         vzYuxDWVupSpKSdB4QYoxE9++CIfa56Vs10A8/HTAx5rlnyhBOrRXsPmQyh9rHNTO7in
         XTfOuW2Ua0uj9OOYLUkvEcd3fhgnXF01PfWnddiux8DdM+BUFFyaBuLM6iKWasqCqzZ5
         uPY6MSJRE9wLcC7QQKQq8lCltXsEbuQgnKUUlQj9JmEip5iCxE10Ev0ws0j/Ma6Lq01v
         Qihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ttEfZsY6dic0+OiNMThzYQrbSNb+Yy78L0Oc8DJv0uY=;
        b=cjmpjJkaDWhYQLIqGn7CogN2lG1QM38M7UuouePa9Mt9DYZivtvpgkNstJ8BlF/zSQ
         ZGT62HpKi03D/v5HHzGhaXj8njUiUc78ODOb3pyaNbS5SvsgDUNa2sQHS6TFyAp+9QxH
         XO59jR5hy1RWhlml1QizLWHHyRiKxktSqbMccFBTQdJuWUGYFzLlm3EGyEi1g9YlmZm2
         nNiR5gNUFqFGZCCpmRmLT814O+g8KO9hNBglLlTs9lPTWm4syrU178VJSTMqrf6ZmYxQ
         h++kcvPW+wLFqNhmhvl0aq/ffrzbkfogIM/M4ePU5yT/fP2n3Lx8jPd6JUHWANUseUUn
         WZlQ==
X-Gm-Message-State: APjAAAXOerDRMnfiUxXb3HwiGcd1n1s156GH546YfwkwJRh/5Gbm1PMq
        x0QKFAAN3aEIkwDjYvhsYyjS7/sP4CM=
X-Google-Smtp-Source: APXvYqw5bvOuQMHNLc1DGScsuUHOEf4JqodR8M51Z1FgAk9KLiwgNe3946RpJqXBd7lm14K5y15OWA==
X-Received: by 2002:aa7:9314:: with SMTP id 20mr29625167pfj.231.1574622445605;
        Sun, 24 Nov 2019 11:07:25 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:25 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 13/23] media: v4l2-fwnode: Pass notifier to v4l2_async_register_fwnode_subdev()
Date:   Sun, 24 Nov 2019 11:06:53 -0800
Message-Id: <20191124190703.12138-14-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
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
index f43f563f9e98..d2f134caa0cf 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1125,12 +1125,12 @@ int v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd)
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
@@ -1142,12 +1142,6 @@ int v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
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
@@ -1172,15 +1166,12 @@ int v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
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
index cd3dd6e33ef0..06ed4057b426 100644
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
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index db30e2c70f2f..15b08bfb5aa7 100644
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
diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 99166afca071..bbbc4d55fa9e 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -223,6 +223,7 @@ struct csi_state {
 	struct device *dev;
 	struct media_pad pads[CSIS_PADS_NUM];
 	struct v4l2_subdev mipi_sd;
+	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *src_sd;
 
 	u8 index;
@@ -885,7 +886,9 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 	if (ret)
 		return ret;
 
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

