Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D7C1AFF41
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgDTAjr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726054AbgDTAjq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:46 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5474EC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:46 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id h11so3294817plr.11
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h6rWwFCNmeKlmAWhjuPvPuQJD25yhyO9wzPdxYNDeN4=;
        b=dAPlkIx2n3zOu67pNCZ1a/IoPRR768CpDzXtp2jHjkDJx7F7NvHzxHlS+Z7N7pJS+T
         /UyKB5i9J0RIuUgF5BRf5/GncSl+WxexY0eoU6LXBR/a++dNG7SDyQG4qQtpHWrwNP/n
         XbDWw5wZF2xfK7BQWZEtcypUEzBwJUjWXGN2InNfJG2TRakm3aNFdj9C9qqd2b9nwqxk
         QQURc9e9pyB5rLVUfR2GI8OyH05P4ztonOK/IlPTqp4sj4XOlmKFN1Rf40UtQce0LCwW
         rfzJx5JGwDCCdpIkLQld2FfqW4tADBSbwggsWnejSMdf63OUT51tbFmp8tcHBnbUawjx
         PiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h6rWwFCNmeKlmAWhjuPvPuQJD25yhyO9wzPdxYNDeN4=;
        b=PmcRkTYltugL75eR1M37lTuXWKyCUryCNpuwuQgngjpGucDC8CfDwBhRxqUH3Rj9RA
         J+DIt5hFk5rVZkY1cgzNwThN3Z1CW427FrXaSYgwaOf3L4bvNPd60M454dfskhIyLxyX
         5970hGq5+jVRVIzWWoxQj1YX2KYoBf+akXRKd1ltkUh7RJGkCnukfrADdYJ/bYdZHNLK
         ZaFS6DhwPgL4VQarj6+HU4C7IOlRpqBgOhlLLmXC+tvKhwlu+SXamZebb15WVxtyOa8o
         sgdfsZlrTrFaVorTjzS6tcC4JHiZAx5jiAWnAZS9iwj4xkSYmpFE6suDZDLjCSelealA
         gTAg==
X-Gm-Message-State: AGi0PubcVg+SDsctDZP50b1xHXexBEJT/YGQ0k1J0m0cjvrsSOWGZvGv
        Q3nTPKnuTJ8p5/uCfSvEIucZ1ucdhr0=
X-Google-Smtp-Source: APiQypJmzceoDX0PUX3ju+NOxu7TDjsSiNWJdV7ZjKb7pb6g3KVJLCX2+ORbsSFCh1hdhSaOxlVlFw==
X-Received: by 2002:a17:90a:246d:: with SMTP id h100mr19246695pje.58.1587343185388;
        Sun, 19 Apr 2020 17:39:45 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:44 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 06/23] media: imx: Parse information from firmware without using callbacks
Date:   Sun, 19 Apr 2020 17:39:13 -0700
Message-Id: <20200420003930.11463-7-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
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
index e76a6a85baa3..58349c449c4d 100644
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
@@ -1867,59 +1869,49 @@ static const struct v4l2_subdev_internal_ops csi_internal_ops = {
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
@@ -1999,9 +1991,13 @@ static int imx_csi_probe(struct platform_device *pdev)
 
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
@@ -2015,6 +2011,8 @@ static int imx_csi_remove(struct platform_device *pdev)
 
 	v4l2_ctrl_handler_free(&priv->ctrl_hdlr);
 	mutex_destroy(&priv->lock);
+	v4l2_async_notifier_unregister(&priv->notifier);
+	v4l2_async_notifier_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 8ab823042c09..332d77aec8aa 100644
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
@@ -633,15 +659,15 @@ static int csi2_probe(struct platform_device *pdev)
 
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
@@ -655,6 +681,8 @@ static int csi2_remove(struct platform_device *pdev)
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 
+	v4l2_async_notifier_unregister(&csi2->notifier);
+	v4l2_async_notifier_cleanup(&csi2->notifier);
 	v4l2_async_unregister_subdev(sd);
 	clk_disable_unprepare(csi2->dphy_clk);
 	clk_disable_unprepare(csi2->pllref_clk);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index acbdffb77668..aaa0b5870c53 100644
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
@@ -1201,11 +1202,41 @@ static const struct v4l2_subdev_internal_ops imx7_csi_internal_ops = {
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
@@ -1288,19 +1319,21 @@ static int imx7_csi_probe(struct platform_device *pdev)
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
@@ -1325,6 +1358,8 @@ static int imx7_csi_remove(struct platform_device *pdev)
 	v4l2_device_unregister(&imxmd->v4l2_dev);
 	media_device_cleanup(&imxmd->md);
 
+	v4l2_async_notifier_unregister(&csi->notifier);
+	v4l2_async_notifier_cleanup(&csi->notifier);
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&csi->ctrl_hdlr);
 
diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index e2403b448b6d..b66299c1136d 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -221,6 +221,7 @@ struct csi_state {
 	struct device *dev;
 	struct media_pad pads[CSIS_PADS_NUM];
 	struct v4l2_subdev mipi_sd;
+	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *src_sd;
 
 	u8 index;
@@ -946,33 +947,11 @@ static int mipi_csis_parse_dt(struct platform_device *pdev,
 
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
@@ -994,17 +973,58 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 
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
@@ -1111,6 +1131,12 @@ static int mipi_csis_probe(struct platform_device *pdev)
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
@@ -1129,7 +1155,10 @@ static int mipi_csis_probe(struct platform_device *pdev)
 
 unregister_all:
 	mipi_csis_debugfs_exit(state);
+cleanup:
 	media_entity_cleanup(&state->mipi_sd.entity);
+	v4l2_async_notifier_unregister(&state->notifier);
+	v4l2_async_notifier_cleanup(&state->notifier);
 	v4l2_async_unregister_subdev(&state->mipi_sd);
 disable_clock:
 	mipi_csis_clk_disable(state);
@@ -1217,6 +1246,8 @@ static int mipi_csis_remove(struct platform_device *pdev)
 	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
 
 	mipi_csis_debugfs_exit(state);
+	v4l2_async_notifier_unregister(&state->notifier);
+	v4l2_async_notifier_cleanup(&state->notifier);
 	v4l2_async_unregister_subdev(&state->mipi_sd);
 
 	pm_runtime_disable(&pdev->dev);
-- 
2.17.1

