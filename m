Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24884178696
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbgCCXnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:14 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40398 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbgCCXnN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:13 -0500
Received: by mail-pg1-f194.google.com with SMTP id t24so57035pgj.7
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ayKqejKOnrvGn3Gt6KUwE9Eg6tbKPqBovfizospOrd0=;
        b=OOBOylkbTY76ulbBqhazf07EkfIFRkMiFdCxWzSBqvcxpI/vQ+Nbkwzov7mqeuLZXd
         emMoZQo7+NiWQJsGxu8jl6Oim2MAo2kGrPb6L70A7b58IctqZKMCnNhMOXMX3c5070J4
         L9Vo4OUSWjMJGqkCw0dzozVmgZ6w7Z+M1OFX9yfPYfFPp1Bd4KnvgIdLnrNp5j8CHHNj
         sYL6NfPWo+f9eNR2BPV/6F1ZsrSRLi4HrUJx65b4VyMgTXlrnYIctCdpX18KOfaY/LKp
         E4bMEhkgo0bx2S60pKc/VSlWhOUAHS0/Xip+6EzTM8ebqtdzOn9KBWb6I4UWoG3mpl4C
         QuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ayKqejKOnrvGn3Gt6KUwE9Eg6tbKPqBovfizospOrd0=;
        b=t6hs0JRcYWxsqQV2hDCxhtVv8/wx63ManquyQG5omhL5hxu8FoRadCCkSKsZPhwpjq
         bqBpD1q+IJrH9BNs63VPYig+VbDv2W7CpAl07V4kB3+bIEyUBeOii1IPmOyWsjFPDzyp
         8pXg0SL4AH/O2nV0GlJgvg8t4hopBpAPQKb8Y5hdkcZFxb7pqS/+MuOGOER0VYHyI0dW
         o2sxV3HUJ/x82mW6VrwTb6zlwTQpRzG7hjTzj6nF3KyVO2f1taISNnYPBhJk3VgaPsui
         ZrJBn2t8oHK6g5q6q2vqQ9f9KHtTyE++dyG6VOMSIgscRpbXmTtsrtIUGLBMvRxYErZ5
         yCag==
X-Gm-Message-State: ANhLgQ3CqZQcUse49y0jt1P58AYPlXlKL7JjcN2SEbXAbdapUiTv8OA1
        vIp/jbuzIGDe0yA3YUEMFoIItPre9fQ=
X-Google-Smtp-Source: ADFU+vu1IFdWOhwJZwGNrZW7TpR6lqcWisNnwMk8kU/NVMCNFg8IQr7kBkIuAf1OZF+3OEdz0S2+Dw==
X-Received: by 2002:aa7:8755:: with SMTP id g21mr221318pfo.36.1583278991742;
        Tue, 03 Mar 2020 15:43:11 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:11 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 03/17] media: imx: Parse information from firmware without using callbacks
Date:   Tue,  3 Mar 2020 15:42:42 -0800
Message-Id: <20200303234256.8928-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using the convenience functions
v4l2_async_notifier_parse_fwnode_endpoints*() or
v4l2_async_register_fwnode_subdev(), parse the input endpoints
and set up the async sub-devices without using callbacks. The drivers
know which ports it must parse and how to handle unconnected remotes,
so it makes the code simpler to transfer control of endpoint parsing
to the driver.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c  | 78 +++++++++----------
 drivers/staging/media/imx/imx6-mipi-csi2.c | 70 ++++++++++++-----
 drivers/staging/media/imx/imx7-media-csi.c | 53 ++++++++++---
 drivers/staging/media/imx/imx7-mipi-csis.c | 91 +++++++++++++++-------
 4 files changed, 192 insertions(+), 100 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index b60ed4f22f6d..f409fca88dcf 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -58,6 +58,8 @@ struct csi_priv {
 	struct ipu_soc *ipu;
 	struct v4l2_subdev sd;
 	struct media_pad pad[CSI_NUM_PADS];
+	struct v4l2_async_notifier notifier;
+
 	/* the video device at IDMAC output pad */
 	struct imx_media_video_dev *vdev;
 	struct imx_media_fim *fim;
@@ -1864,59 +1866,49 @@ static const struct v4l2_subdev_internal_ops csi_internal_ops = {
 	.unregistered = csi_unregistered,
 };
 
-static int imx_csi_parse_endpoint(struct device *dev,
-				  struct v4l2_fwnode_endpoint *vep,
-				  struct v4l2_async_subdev *asd)
-{
-	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -ENOTCONN;
-}
-
 static int imx_csi_async_register(struct csi_priv *priv)
 {
-	struct v4l2_async_notifier *notifier;
-	struct fwnode_handle *fwnode;
+	struct v4l2_async_subdev *asd = NULL;
+	struct fwnode_handle *ep;
 	unsigned int port;
 	int ret;
 
-	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
-	if (!notifier)
-		return -ENOMEM;
-
-	v4l2_async_notifier_init(notifier);
-
-	fwnode = dev_fwnode(priv->dev);
+	v4l2_async_notifier_init(&priv->notifier);
 
 	/* get this CSI's port id */
-	ret = fwnode_property_read_u32(fwnode, "reg", &port);
-	if (ret < 0)
-		goto out_free;
-
-	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(
-		priv->dev->parent, notifier, sizeof(struct v4l2_async_subdev),
-		port, imx_csi_parse_endpoint);
+	ret = fwnode_property_read_u32(dev_fwnode(priv->dev), "reg", &port);
 	if (ret < 0)
-		goto out_cleanup;
+		return ret;
 
-	ret = v4l2_async_subdev_notifier_register(&priv->sd, notifier);
-	if (ret < 0)
-		goto out_cleanup;
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(priv->dev->parent),
+					     port, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (ep) {
+		asd = kzalloc(sizeof(*asd), GFP_KERNEL);
+		if (!asd) {
+			fwnode_handle_put(ep);
+			return -ENOMEM;
+		}
 
-	ret = v4l2_async_register_subdev(&priv->sd);
-	if (ret < 0)
-		goto out_unregister;
+		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
+			&priv->notifier, ep, asd);
 
-	priv->sd.subdev_notifier = notifier;
+		fwnode_handle_put(ep);
 
-	return 0;
+		if (ret) {
+			kfree(asd);
+			/* OK if asd already exists */
+			if (ret != -EEXIST)
+				return ret;
+		}
+	}
 
-out_unregister:
-	v4l2_async_notifier_unregister(notifier);
-out_cleanup:
-	v4l2_async_notifier_cleanup(notifier);
-out_free:
-	kfree(notifier);
+	ret = v4l2_async_subdev_notifier_register(&priv->sd,
+						  &priv->notifier);
+	if (ret)
+		return ret;
 
-	return ret;
+	return v4l2_async_register_subdev(&priv->sd);
 }
 
 static int imx_csi_probe(struct platform_device *pdev)
@@ -1996,9 +1988,13 @@ static int imx_csi_probe(struct platform_device *pdev)
 
 	ret = imx_csi_async_register(priv);
 	if (ret)
-		goto free;
+		goto cleanup;
 
 	return 0;
+
+cleanup:
+	v4l2_async_notifier_unregister(&priv->notifier);
+	v4l2_async_notifier_cleanup(&priv->notifier);
 free:
 	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
 	mutex_destroy(&priv->lock);
@@ -2012,6 +2008,8 @@ static int imx_csi_remove(struct platform_device *pdev)
 
 	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
 	mutex_destroy(&priv->lock);
+	v4l2_async_notifier_unregister(&priv->notifier);
+	v4l2_async_notifier_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index cd3dd6e33ef0..fdd763587e6c 100644
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
@@ -530,34 +531,59 @@ static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
 	.registered = csi2_registered,
 };
 
-static int csi2_parse_endpoint(struct device *dev,
-			       struct v4l2_fwnode_endpoint *vep,
-			       struct v4l2_async_subdev *asd)
+static int csi2_async_register(struct csi2_dev *csi2)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct v4l2_async_subdev *asd = NULL;
+	struct fwnode_handle *ep;
+	int ret;
 
-	if (!fwnode_device_is_available(asd->match.fwnode)) {
-		v4l2_err(&csi2->sd, "remote is not available\n");
-		return -EINVAL;
-	}
+	v4l2_async_notifier_init(&csi2->notifier);
 
-	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
-		v4l2_err(&csi2->sd, "invalid bus type, must be MIPI CSI2\n");
-		return -EINVAL;
-	}
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi2->dev), 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	if (ret)
+		goto err_parse;
 
-	csi2->bus = vep->bus.mipi_csi2;
+	csi2->bus = vep.bus.mipi_csi2;
 
 	dev_dbg(csi2->dev, "data lanes: %d\n", csi2->bus.num_data_lanes);
 	dev_dbg(csi2->dev, "flags: 0x%08x\n", csi2->bus.flags);
 
-	return 0;
+	asd = kzalloc(sizeof(*asd), GFP_KERNEL);
+	if (!asd) {
+		ret = -ENOMEM;
+		goto err_parse;
+	}
+
+	ret = v4l2_async_notifier_add_fwnode_remote_subdev(
+		&csi2->notifier, ep, asd);
+	if (ret)
+		goto err_parse;
+
+	fwnode_handle_put(ep);
+
+	ret = v4l2_async_subdev_notifier_register(&csi2->sd,
+						  &csi2->notifier);
+	if (ret)
+		return ret;
+
+	return v4l2_async_register_subdev(&csi2->sd);
+
+err_parse:
+	fwnode_handle_put(ep);
+	kfree(asd);
+	return ret;
 }
 
 static int csi2_probe(struct platform_device *pdev)
 {
-	unsigned int sink_port = 0;
 	struct csi2_dev *csi2;
 	struct resource *res;
 	int i, ret;
@@ -636,15 +662,15 @@ static int csi2_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &csi2->sd);
 
-	ret = v4l2_async_register_fwnode_subdev(
-		&csi2->sd, sizeof(struct v4l2_async_subdev),
-		&sink_port, 1, csi2_parse_endpoint);
+	ret = csi2_async_register(csi2);
 	if (ret)
-		goto dphy_off;
+		goto clean_notifier;
 
 	return 0;
 
-dphy_off:
+clean_notifier:
+	v4l2_async_notifier_unregister(&csi2->notifier);
+	v4l2_async_notifier_cleanup(&csi2->notifier);
 	clk_disable_unprepare(csi2->dphy_clk);
 pllref_off:
 	clk_disable_unprepare(csi2->pllref_clk);
@@ -658,6 +684,8 @@ static int csi2_remove(struct platform_device *pdev)
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 
+	v4l2_async_notifier_unregister(&csi2->notifier);
+	v4l2_async_notifier_cleanup(&csi2->notifier);
 	v4l2_async_unregister_subdev(sd);
 	clk_disable_unprepare(csi2->dphy_clk);
 	clk_disable_unprepare(csi2->pllref_clk);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index db30e2c70f2f..776eb42ae5c8 100644
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
@@ -1179,11 +1180,41 @@ static const struct v4l2_subdev_internal_ops imx7_csi_internal_ops = {
 	.unregistered	= imx7_csi_unregistered,
 };
 
-static int imx7_csi_parse_endpoint(struct device *dev,
-				   struct v4l2_fwnode_endpoint *vep,
-				   struct v4l2_async_subdev *asd)
+static int imx7_csi_async_register(struct imx7_csi *csi)
 {
-	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
+	struct v4l2_async_subdev *asd = NULL;
+	struct fwnode_handle *ep;
+	int ret;
+
+	v4l2_async_notifier_init(&csi->notifier);
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (ep) {
+		asd = kzalloc(sizeof(*asd), GFP_KERNEL);
+		if (!asd) {
+			fwnode_handle_put(ep);
+			return -ENOMEM;
+		}
+
+		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
+			&csi->notifier, ep, asd);
+
+		fwnode_handle_put(ep);
+
+		if (ret) {
+			kfree(asd);
+			/* OK if asd already exists */
+			if (ret != -EEXIST)
+				return ret;
+		}
+	}
+
+	ret = v4l2_async_subdev_notifier_register(&csi->sd, &csi->notifier);
+	if (ret)
+		return ret;
+
+	return v4l2_async_register_subdev(&csi->sd);
 }
 
 static int imx7_csi_probe(struct platform_device *pdev)
@@ -1266,19 +1297,21 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto free;
 
-	ret = v4l2_async_register_fwnode_subdev(&csi->sd,
-						sizeof(struct v4l2_async_subdev),
-						NULL, 0,
-						imx7_csi_parse_endpoint);
+	ret = imx7_csi_async_register(csi);
 	if (ret)
-		goto free;
+		goto subdev_notifier_cleanup;
 
 	return 0;
 
+subdev_notifier_cleanup:
+	v4l2_async_notifier_unregister(&csi->notifier);
+	v4l2_async_notifier_cleanup(&csi->notifier);
+
 free:
 	v4l2_ctrl_handler_free(&csi->ctrl_hdlr);
 
 cleanup:
+	v4l2_async_notifier_unregister(&imxmd->notifier);
 	v4l2_async_notifier_cleanup(&imxmd->notifier);
 	v4l2_device_unregister(&imxmd->v4l2_dev);
 	media_device_unregister(&imxmd->md);
@@ -1303,6 +1336,8 @@ static int imx7_csi_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&imxmd->v4l2_dev);
 	media_device_cleanup(&imxmd->md);
 
+	v4l2_async_notifier_unregister(&csi->notifier);
+	v4l2_async_notifier_cleanup(&csi->notifier);
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&csi->ctrl_hdlr);
 
diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 383abecb3bec..7e872d8f51e0 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -223,6 +223,7 @@ struct csi_state {
 	struct device *dev;
 	struct media_pad pads[CSIS_PADS_NUM];
 	struct v4l2_subdev mipi_sd;
+	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *src_sd;
 
 	u8 index;
@@ -827,33 +828,11 @@ static int mipi_csis_parse_dt(struct platform_device *pdev,
 
 static int mipi_csis_pm_resume(struct device *dev, bool runtime);
 
-static int mipi_csis_parse_endpoint(struct device *dev,
-				    struct v4l2_fwnode_endpoint *ep,
-				    struct v4l2_async_subdev *asd)
-{
-	struct v4l2_subdev *mipi_sd = dev_get_drvdata(dev);
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
-
-	if (ep->bus_type != V4L2_MBUS_CSI2_DPHY) {
-		dev_err(dev, "invalid bus type, must be MIPI CSI2\n");
-		return -EINVAL;
-	}
-
-	state->bus = ep->bus.mipi_csi2;
-
-	dev_dbg(state->dev, "data lanes: %d\n", state->bus.num_data_lanes);
-	dev_dbg(state->dev, "flags: 0x%08x\n", state->bus.flags);
-
-	return 0;
-}
-
 static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 				 struct platform_device *pdev,
 				 const struct v4l2_subdev_ops *ops)
 {
 	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
-	unsigned int sink_port = 0;
-	int ret;
 
 	v4l2_subdev_init(mipi_sd, ops);
 	mipi_sd->owner = THIS_MODULE;
@@ -878,17 +857,58 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 
 	state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&mipi_sd->entity, CSIS_PADS_NUM,
-				     state->pads);
+	return media_entity_pads_init(&mipi_sd->entity, CSIS_PADS_NUM,
+				      state->pads);
+}
+
+static int mipi_csis_async_register(struct csi_state *state)
+{
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct v4l2_async_subdev *asd = NULL;
+	struct fwnode_handle *ep;
+	int ret;
+
+	v4l2_async_notifier_init(&state->notifier);
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	if (ret)
+		goto err_parse;
+
+	state->bus = vep.bus.mipi_csi2;
+
+	dev_dbg(state->dev, "data lanes: %d\n", state->bus.num_data_lanes);
+	dev_dbg(state->dev, "flags: 0x%08x\n", state->bus.flags);
+
+	asd = kzalloc(sizeof(*asd), GFP_KERNEL);
+	if (!asd) {
+		ret = -ENOMEM;
+		goto err_parse;
+	}
+
+	ret = v4l2_async_notifier_add_fwnode_remote_subdev(
+		&state->notifier, ep, asd);
+	if (ret)
+		goto err_parse;
+
+	fwnode_handle_put(ep);
+
+	ret = v4l2_async_subdev_notifier_register(&state->mipi_sd,
+						  &state->notifier);
 	if (ret)
 		return ret;
 
-	ret = v4l2_async_register_fwnode_subdev(mipi_sd,
-						sizeof(struct v4l2_async_subdev),
-						&sink_port, 1,
-						mipi_csis_parse_endpoint);
-	if (ret < 0)
-		dev_err(&pdev->dev, "async fwnode register failed: %d\n", ret);
+	return v4l2_async_register_subdev(&state->mipi_sd);
+
+err_parse:
+	fwnode_handle_put(ep);
+	kfree(asd);
 
 	return ret;
 }
@@ -995,6 +1015,12 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto disable_clock;
 
+	ret = mipi_csis_async_register(state);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "async register failed: %d\n", ret);
+		goto cleanup;
+	}
+
 	memcpy(state->events, mipi_csis_events, sizeof(state->events));
 
 	mipi_csis_debugfs_init(state);
@@ -1013,7 +1039,10 @@ static int mipi_csis_probe(struct platform_device *pdev)
 
 unregister_all:
 	mipi_csis_debugfs_exit(state);
+cleanup:
 	media_entity_cleanup(&state->mipi_sd.entity);
+	v4l2_async_notifier_unregister(&state->notifier);
+	v4l2_async_notifier_cleanup(&state->notifier);
 	v4l2_async_unregister_subdev(&state->mipi_sd);
 disable_clock:
 	mipi_csis_clk_disable(state);
@@ -1101,6 +1130,8 @@ static int mipi_csis_remove(struct platform_device *pdev)
 	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
 
 	mipi_csis_debugfs_exit(state);
+	v4l2_async_notifier_unregister(&state->notifier);
+	v4l2_async_notifier_cleanup(&state->notifier);
 	v4l2_async_unregister_subdev(&state->mipi_sd);
 
 	pm_runtime_disable(&pdev->dev);
-- 
2.17.1

