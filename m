Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86FB381C00
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232273AbhEPCQX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232194AbhEPCOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:14:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD69C061343
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 19:05:19 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6260C18C1;
        Sun, 16 May 2021 03:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129508;
        bh=ORVJJzso6eV5EaNbCaQzNYPZy59jogj5eW/fWncn+TM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mUkdRSe5SCMC7V4DRfaFYRd8PCY1QHhrYXCReruSlEo6GQ7o8ThW7i2lJyQ/QLz6F
         1F6e6MJ6hR/9ExLS+uUbRfWdGDfLCiOVytwRNeiUH06YkbXRGr1ki2E1rjjGRvuGqh
         MpqC2V83N009YxzMJzhrBzbybmRerd/lwM/RW2xw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 12/25] media: imx: imx7_mipi_csis: Rename mipi_sd to sd
Date:   Sun, 16 May 2021 04:44:28 +0300
Message-Id: <20210516014441.5508-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSIS is modelled as a single subdev, there's thus no ambiguity
regarding which subdev the code refers to. Rename mipi_sd to sd.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 91 +++++++++++-----------
 1 file changed, 45 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 78014ae02d34..6b9c05b1cdf3 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -298,7 +298,7 @@ struct csi_state {
 	spinlock_t slock;
 	struct device *dev;
 	struct media_pad pads[CSIS_PADS_NUM];
-	struct v4l2_subdev mipi_sd;
+	struct v4l2_subdev sd;
 	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *src_sd;
 
@@ -785,12 +785,12 @@ static void mipi_csis_debugfs_exit(struct csi_state *state)
 
 static struct csi_state *mipi_sd_to_csis_state(struct v4l2_subdev *sdev)
 {
-	return container_of(sdev, struct csi_state, mipi_sd);
+	return container_of(sdev, struct csi_state, sd);
 }
 
-static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
+static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct csi_state *state = mipi_sd_to_csis_state(sd);
 	int ret;
 
 	if (enable) {
@@ -854,15 +854,15 @@ mipi_csis_get_format(struct csi_state *state,
 		     unsigned int pad)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&state->mipi_sd, cfg, pad);
+		return v4l2_subdev_get_try_format(&state->sd, cfg, pad);
 
 	return &state->format_mbus;
 }
 
-static int mipi_csis_init_cfg(struct v4l2_subdev *mipi_sd,
+static int mipi_csis_init_cfg(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_pad_config *cfg)
 {
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct csi_state *state = mipi_sd_to_csis_state(sd);
 	struct v4l2_mbus_framefmt *fmt_sink;
 	struct v4l2_mbus_framefmt *fmt_source;
 	enum v4l2_subdev_format_whence which;
@@ -896,11 +896,11 @@ static int mipi_csis_init_cfg(struct v4l2_subdev *mipi_sd,
 	return 0;
 }
 
-static int mipi_csis_get_fmt(struct v4l2_subdev *mipi_sd,
+static int mipi_csis_get_fmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_pad_config *cfg,
 			     struct v4l2_subdev_format *sdformat)
 {
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct csi_state *state = mipi_sd_to_csis_state(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
 	fmt = mipi_csis_get_format(state, cfg, sdformat->which, sdformat->pad);
@@ -912,11 +912,11 @@ static int mipi_csis_get_fmt(struct v4l2_subdev *mipi_sd,
 	return 0;
 }
 
-static int mipi_csis_enum_mbus_code(struct v4l2_subdev *mipi_sd,
+static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_pad_config *cfg,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct csi_state *state = mipi_sd_to_csis_state(sd);
 
 	/*
 	 * The CSIS can't transcode in any way, the source format is identical
@@ -944,11 +944,11 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *mipi_sd,
 	return 0;
 }
 
-static int mipi_csis_set_fmt(struct v4l2_subdev *mipi_sd,
+static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_pad_config *cfg,
 			     struct v4l2_subdev_format *sdformat)
 {
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct csi_state *state = mipi_sd_to_csis_state(sd);
 	struct csis_pix_format const *csis_fmt;
 	struct v4l2_mbus_framefmt *fmt;
 	unsigned int align;
@@ -958,7 +958,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *mipi_sd,
 	 * modified.
 	 */
 	if (sdformat->pad == CSIS_PAD_SOURCE)
-		return mipi_csis_get_fmt(mipi_sd, cfg, sdformat);
+		return mipi_csis_get_fmt(sd, cfg, sdformat);
 
 	if (sdformat->pad != CSIS_PAD_SINK)
 		return -EINVAL;
@@ -1022,9 +1022,9 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *mipi_sd,
 	return 0;
 }
 
-static int mipi_csis_log_status(struct v4l2_subdev *mipi_sd)
+static int mipi_csis_log_status(struct v4l2_subdev *sd)
 {
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct csi_state *state = mipi_sd_to_csis_state(sd);
 
 	mutex_lock(&state->lock);
 	mipi_csis_log_counters(state, true);
@@ -1064,8 +1064,8 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 				const struct media_pad *local_pad,
 				const struct media_pad *remote_pad, u32 flags)
 {
-	struct v4l2_subdev *mipi_sd = media_entity_to_v4l2_subdev(entity);
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct csi_state *state = mipi_sd_to_csis_state(sd);
 	struct v4l2_subdev *remote_sd;
 
 	dev_dbg(state->dev, "link setup %s -> %s", remote_pad->entity->name,
@@ -1110,7 +1110,7 @@ static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
 				  struct v4l2_async_subdev *asd)
 {
 	struct csi_state *state = mipi_notifier_to_csis_state(notifier);
-	struct media_pad *sink = &state->mipi_sd.entity.pads[CSIS_PAD_SINK];
+	struct media_pad *sink = &state->sd.entity.pads[CSIS_PAD_SINK];
 
 	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
 }
@@ -1155,12 +1155,11 @@ static int mipi_csis_async_register(struct csi_state *state)
 
 	state->notifier.ops = &mipi_csis_notify_ops;
 
-	ret = v4l2_async_subdev_notifier_register(&state->mipi_sd,
-						  &state->notifier);
+	ret = v4l2_async_subdev_notifier_register(&state->sd, &state->notifier);
 	if (ret)
 		return ret;
 
-	return v4l2_async_register_subdev(&state->mipi_sd);
+	return v4l2_async_register_subdev(&state->sd);
 
 err_parse:
 	fwnode_handle_put(ep);
@@ -1174,8 +1173,8 @@ static int mipi_csis_async_register(struct csi_state *state)
 
 static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
 {
-	struct v4l2_subdev *mipi_sd = dev_get_drvdata(dev);
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_state *state = mipi_sd_to_csis_state(sd);
 	int ret = 0;
 
 	mutex_lock(&state->lock);
@@ -1198,8 +1197,8 @@ static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
 
 static int mipi_csis_pm_resume(struct device *dev, bool runtime)
 {
-	struct v4l2_subdev *mipi_sd = dev_get_drvdata(dev);
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_state *state = mipi_sd_to_csis_state(sd);
 	int ret = 0;
 
 	mutex_lock(&state->lock);
@@ -1255,33 +1254,33 @@ static const struct dev_pm_ops mipi_csis_pm_ops = {
  * Probe/remove & platform driver
  */
 
-static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
+static int mipi_csis_subdev_init(struct v4l2_subdev *sd,
 				 struct platform_device *pdev,
 				 const struct v4l2_subdev_ops *ops)
 {
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct csi_state *state = mipi_sd_to_csis_state(sd);
 
-	v4l2_subdev_init(mipi_sd, ops);
-	mipi_sd->owner = THIS_MODULE;
-	snprintf(mipi_sd->name, sizeof(mipi_sd->name), "%s.%d",
+	v4l2_subdev_init(sd, ops);
+	sd->owner = THIS_MODULE;
+	snprintf(sd->name, sizeof(sd->name), "%s.%d",
 		 CSIS_SUBDEV_NAME, state->index);
 
-	mipi_sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	mipi_sd->ctrl_handler = NULL;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->ctrl_handler = NULL;
 
-	mipi_sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	mipi_sd->entity.ops = &mipi_csis_entity_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &mipi_csis_entity_ops;
 
-	mipi_sd->dev = &pdev->dev;
+	sd->dev = &pdev->dev;
 
 	state->csis_fmt = &mipi_csis_formats[0];
-	mipi_csis_init_cfg(mipi_sd, NULL);
+	mipi_csis_init_cfg(sd, NULL);
 
 	state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK
 					 | MEDIA_PAD_FL_MUST_CONNECT;
 	state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
 					   | MEDIA_PAD_FL_MUST_CONNECT;
-	return media_entity_pads_init(&mipi_sd->entity, CSIS_PADS_NUM,
+	return media_entity_pads_init(&sd->entity, CSIS_PADS_NUM,
 				      state->pads);
 }
 
@@ -1354,10 +1353,10 @@ static int mipi_csis_probe(struct platform_device *pdev)
 		goto disable_clock;
 	}
 
-	platform_set_drvdata(pdev, &state->mipi_sd);
+	platform_set_drvdata(pdev, &state->sd);
 
 	mutex_init(&state->lock);
-	ret = mipi_csis_subdev_init(&state->mipi_sd, pdev,
+	ret = mipi_csis_subdev_init(&state->sd, pdev,
 				    &mipi_csis_subdev_ops);
 	if (ret < 0)
 		goto disable_clock;
@@ -1386,10 +1385,10 @@ static int mipi_csis_probe(struct platform_device *pdev)
 unregister_all:
 	mipi_csis_debugfs_exit(state);
 cleanup:
-	media_entity_cleanup(&state->mipi_sd.entity);
+	media_entity_cleanup(&state->sd.entity);
 	v4l2_async_notifier_unregister(&state->notifier);
 	v4l2_async_notifier_cleanup(&state->notifier);
-	v4l2_async_unregister_subdev(&state->mipi_sd);
+	v4l2_async_unregister_subdev(&state->sd);
 disable_clock:
 	mipi_csis_clk_disable(state);
 	mutex_destroy(&state->lock);
@@ -1399,18 +1398,18 @@ static int mipi_csis_probe(struct platform_device *pdev)
 
 static int mipi_csis_remove(struct platform_device *pdev)
 {
-	struct v4l2_subdev *mipi_sd = platform_get_drvdata(pdev);
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct csi_state *state = mipi_sd_to_csis_state(sd);
 
 	mipi_csis_debugfs_exit(state);
 	v4l2_async_notifier_unregister(&state->notifier);
 	v4l2_async_notifier_cleanup(&state->notifier);
-	v4l2_async_unregister_subdev(&state->mipi_sd);
+	v4l2_async_unregister_subdev(&state->sd);
 
 	pm_runtime_disable(&pdev->dev);
 	mipi_csis_pm_suspend(&pdev->dev, true);
 	mipi_csis_clk_disable(state);
-	media_entity_cleanup(&state->mipi_sd.entity);
+	media_entity_cleanup(&state->sd.entity);
 	mutex_destroy(&state->lock);
 	pm_runtime_set_suspended(&pdev->dev);
 
-- 
Regards,

Laurent Pinchart

