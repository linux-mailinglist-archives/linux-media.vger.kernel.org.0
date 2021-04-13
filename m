Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D492F35D540
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245632AbhDMCbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35890 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240904AbhDMCbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:33 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F0258AF;
        Tue, 13 Apr 2021 04:31:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281072;
        bh=czBkt64eXp9xKeURplUNs8ceCTMWPIsydohQ7S0F2Tk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cvRpzZooBSeXRPa8SCDf1jREgRoK55/p6wLOzWMYxn2/ByyUlLfAqKHFjiUZtZpKw
         8Bhm3BGeePyM6XChtKTVhzlcvIC3jF7AfedwNXLR1wRnnJWLl/FCbsrC6nSKaGP0PP
         VlKvWEKP+k2Ov/CxTFz98ifaM0b9aA0wDghbA3tU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 07/23] media: imx: imx7-mipi-csis: Reorganize code in sections
Date:   Tue, 13 Apr 2021 05:29:58 +0300
Message-Id: <20210413023014.28797-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve readability by reorganizing the code in sections. No functional
change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 535 +++++++++++----------
 1 file changed, 281 insertions(+), 254 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 030ef0925cd5..eea865ba486d 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -324,6 +324,10 @@ struct csi_state {
 	struct regulator *mipi_phy_regulator;
 };
 
+/* -----------------------------------------------------------------------------
+ * Format helpers
+ */
+
 struct csis_pix_format {
 	u32 code;
 	u32 fmt_reg;
@@ -417,61 +421,6 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 	}
 };
 
-static inline void mipi_csis_write(struct csi_state *state, u32 reg, u32 val)
-{
-	writel(val, state->regs + reg);
-}
-
-static inline u32 mipi_csis_read(struct csi_state *state, u32 reg)
-{
-	return readl(state->regs + reg);
-}
-
-static int mipi_csis_dump_regs(struct csi_state *state)
-{
-	static const struct {
-		u32 offset;
-		const char * const name;
-	} registers[] = {
-		{ MIPI_CSIS_CMN_CTRL, "CMN_CTRL" },
-		{ MIPI_CSIS_CLK_CTRL, "CLK_CTRL" },
-		{ MIPI_CSIS_INT_MSK, "INT_MSK" },
-		{ MIPI_CSIS_DPHY_STATUS, "DPHY_STATUS" },
-		{ MIPI_CSIS_DPHY_CMN_CTRL, "DPHY_CMN_CTRL" },
-		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
-		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
-		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
-		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
-		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
-		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
-		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
-	};
-
-	struct device *dev = &state->pdev->dev;
-	unsigned int i;
-	u32 cfg;
-
-	dev_info(dev, "--- REGISTERS ---\n");
-
-	for (i = 0; i < ARRAY_SIZE(registers); i++) {
-		cfg = mipi_csis_read(state, registers[i].offset);
-		dev_info(dev, "%14s: 0x%08x\n", registers[i].name, cfg);
-	}
-
-	return 0;
-}
-
-static struct csi_state *
-mipi_notifier_to_csis_state(struct v4l2_async_notifier *n)
-{
-	return container_of(n, struct csi_state, notifier);
-}
-
-static struct csi_state *mipi_sd_to_csis_state(struct v4l2_subdev *sdev)
-{
-	return container_of(sdev, struct csi_state, mipi_sd);
-}
-
 static const struct csis_pix_format *find_csis_format(u32 code)
 {
 	unsigned int i;
@@ -482,6 +431,20 @@ static const struct csis_pix_format *find_csis_format(u32 code)
 	return NULL;
 }
 
+/* -----------------------------------------------------------------------------
+ * Hardware configuration
+ */
+
+static inline u32 mipi_csis_read(struct csi_state *state, u32 reg)
+{
+	return readl(state->regs + reg);
+}
+
+static inline void mipi_csis_write(struct csi_state *state, u32 reg, u32 val)
+{
+	writel(val, state->regs + reg);
+}
+
 static void mipi_csis_enable_interrupts(struct csi_state *state, bool on)
 {
 	mipi_csis_write(state, MIPI_CSIS_INT_MSK, on ? 0xffffffff : 0);
@@ -684,6 +647,41 @@ static void mipi_csis_stop_stream(struct csi_state *state)
 	mipi_csis_system_enable(state, false);
 }
 
+static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
+{
+	struct csi_state *state = dev_id;
+	unsigned long flags;
+	unsigned int i;
+	u32 status;
+	u32 dbg_status;
+
+	status = mipi_csis_read(state, MIPI_CSIS_INT_SRC);
+	dbg_status = mipi_csis_read(state, MIPI_CSIS_DBG_INTR_SRC);
+
+	spin_lock_irqsave(&state->slock, flags);
+
+	/* Update the event/error counters */
+	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || state->debug) {
+		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
+			struct mipi_csis_event *event = &state->events[i];
+
+			if ((!event->debug && (status & event->mask)) ||
+			    (event->debug && (dbg_status & event->mask)))
+				event->counter++;
+		}
+	}
+	spin_unlock_irqrestore(&state->slock, flags);
+
+	mipi_csis_write(state, MIPI_CSIS_INT_SRC, status);
+	mipi_csis_write(state, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
+
+	return IRQ_HANDLED;
+}
+
+/* -----------------------------------------------------------------------------
+ * Debug
+ */
+
 static void mipi_csis_clear_counters(struct csi_state *state)
 {
 	unsigned long flags;
@@ -713,9 +711,72 @@ static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
 	spin_unlock_irqrestore(&state->slock, flags);
 }
 
-/*
+static int mipi_csis_dump_regs(struct csi_state *state)
+{
+	static const struct {
+		u32 offset;
+		const char * const name;
+	} registers[] = {
+		{ MIPI_CSIS_CMN_CTRL, "CMN_CTRL" },
+		{ MIPI_CSIS_CLK_CTRL, "CLK_CTRL" },
+		{ MIPI_CSIS_INT_MSK, "INT_MSK" },
+		{ MIPI_CSIS_DPHY_STATUS, "DPHY_STATUS" },
+		{ MIPI_CSIS_DPHY_CMN_CTRL, "DPHY_CMN_CTRL" },
+		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
+		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
+		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
+		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
+		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
+		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
+		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
+	};
+
+	struct device *dev = &state->pdev->dev;
+	unsigned int i;
+	u32 cfg;
+
+	dev_info(dev, "--- REGISTERS ---\n");
+
+	for (i = 0; i < ARRAY_SIZE(registers); i++) {
+		cfg = mipi_csis_read(state, registers[i].offset);
+		dev_info(dev, "%14s: 0x%08x\n", registers[i].name, cfg);
+	}
+
+	return 0;
+}
+
+static int mipi_csis_dump_regs_show(struct seq_file *m, void *private)
+{
+	struct csi_state *state = m->private;
+
+	return mipi_csis_dump_regs(state);
+}
+DEFINE_SHOW_ATTRIBUTE(mipi_csis_dump_regs);
+
+static void mipi_csis_debugfs_init(struct csi_state *state)
+{
+	state->debugfs_root = debugfs_create_dir(dev_name(state->dev), NULL);
+
+	debugfs_create_bool("debug_enable", 0600, state->debugfs_root,
+			    &state->debug);
+	debugfs_create_file("dump_regs", 0600, state->debugfs_root, state,
+			    &mipi_csis_dump_regs_fops);
+}
+
+static void mipi_csis_debugfs_exit(struct csi_state *state)
+{
+	debugfs_remove_recursive(state->debugfs_root);
+}
+
+/* -----------------------------------------------------------------------------
  * V4L2 subdev operations
  */
+
+static struct csi_state *mipi_sd_to_csis_state(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct csi_state, mipi_sd);
+}
+
 static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 {
 	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
@@ -775,35 +836,6 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 	return ret;
 }
 
-static int mipi_csis_link_setup(struct media_entity *entity,
-				const struct media_pad *local_pad,
-				const struct media_pad *remote_pad, u32 flags)
-{
-	struct v4l2_subdev *mipi_sd = media_entity_to_v4l2_subdev(entity);
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
-	struct v4l2_subdev *remote_sd;
-
-	dev_dbg(state->dev, "link setup %s -> %s", remote_pad->entity->name,
-		local_pad->entity->name);
-
-	/* We only care about the link to the source. */
-	if (!(local_pad->flags & MEDIA_PAD_FL_SINK))
-		return 0;
-
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
-	if (flags & MEDIA_LNK_FL_ENABLED) {
-		if (state->src_sd)
-			return -EBUSY;
-
-		state->src_sd = remote_sd;
-	} else {
-		state->src_sd = NULL;
-	}
-
-	return 0;
-}
-
 static struct v4l2_mbus_framefmt *
 mipi_csis_get_format(struct csi_state *state,
 		     struct v4l2_subdev_pad_config *cfg,
@@ -992,47 +1024,10 @@ static int mipi_csis_log_status(struct v4l2_subdev *mipi_sd)
 	return 0;
 }
 
-static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
-{
-	struct csi_state *state = dev_id;
-	unsigned long flags;
-	unsigned int i;
-	u32 status;
-	u32 dbg_status;
-
-	status = mipi_csis_read(state, MIPI_CSIS_INT_SRC);
-	dbg_status = mipi_csis_read(state, MIPI_CSIS_DBG_INTR_SRC);
-
-	spin_lock_irqsave(&state->slock, flags);
-
-	/* Update the event/error counters */
-	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || state->debug) {
-		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
-			struct mipi_csis_event *event = &state->events[i];
-
-			if ((!event->debug && (status & event->mask)) ||
-			    (event->debug && (dbg_status & event->mask)))
-				event->counter++;
-		}
-	}
-	spin_unlock_irqrestore(&state->slock, flags);
-
-	mipi_csis_write(state, MIPI_CSIS_INT_SRC, status);
-	mipi_csis_write(state, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
-
-	return IRQ_HANDLED;
-}
-
 static const struct v4l2_subdev_core_ops mipi_csis_core_ops = {
 	.log_status	= mipi_csis_log_status,
 };
 
-static const struct media_entity_operations mipi_csis_entity_ops = {
-	.link_setup	= mipi_csis_link_setup,
-	.link_validate	= v4l2_subdev_link_validate,
-	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
-};
-
 static const struct v4l2_subdev_video_ops mipi_csis_video_ops = {
 	.s_stream	= mipi_csis_s_stream,
 };
@@ -1050,24 +1045,54 @@ static const struct v4l2_subdev_ops mipi_csis_subdev_ops = {
 	.pad	= &mipi_csis_pad_ops,
 };
 
-static int mipi_csis_parse_dt(struct platform_device *pdev,
-			      struct csi_state *state)
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static int mipi_csis_link_setup(struct media_entity *entity,
+				const struct media_pad *local_pad,
+				const struct media_pad *remote_pad, u32 flags)
 {
-	struct device_node *node = pdev->dev.of_node;
+	struct v4l2_subdev *mipi_sd = media_entity_to_v4l2_subdev(entity);
+	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	struct v4l2_subdev *remote_sd;
 
-	if (of_property_read_u32(node, "clock-frequency",
-				 &state->clk_frequency))
-		state->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
+	dev_dbg(state->dev, "link setup %s -> %s", remote_pad->entity->name,
+		local_pad->entity->name);
 
-	/* Get MIPI PHY resets */
-	state->mrst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(state->mrst))
-		return PTR_ERR(state->mrst);
+	/* We only care about the link to the source. */
+	if (!(local_pad->flags & MEDIA_PAD_FL_SINK))
+		return 0;
+
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	if (flags & MEDIA_LNK_FL_ENABLED) {
+		if (state->src_sd)
+			return -EBUSY;
+
+		state->src_sd = remote_sd;
+	} else {
+		state->src_sd = NULL;
+	}
 
 	return 0;
 }
 
-static int mipi_csis_pm_resume(struct device *dev, bool runtime);
+static const struct media_entity_operations mipi_csis_entity_ops = {
+	.link_setup	= mipi_csis_link_setup,
+	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+/* -----------------------------------------------------------------------------
+ * Async subdev notifier
+ */
+
+static struct csi_state *
+mipi_notifier_to_csis_state(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_state, notifier);
+}
 
 static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *sd,
@@ -1083,36 +1108,6 @@ static const struct v4l2_async_notifier_operations mipi_csis_notify_ops = {
 	.bound = mipi_csis_notify_bound,
 };
 
-static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
-				 struct platform_device *pdev,
-				 const struct v4l2_subdev_ops *ops)
-{
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
-
-	v4l2_subdev_init(mipi_sd, ops);
-	mipi_sd->owner = THIS_MODULE;
-	snprintf(mipi_sd->name, sizeof(mipi_sd->name), "%s.%d",
-		 CSIS_SUBDEV_NAME, state->index);
-
-	mipi_sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	mipi_sd->ctrl_handler = NULL;
-
-	mipi_sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	mipi_sd->entity.ops = &mipi_csis_entity_ops;
-
-	mipi_sd->dev = &pdev->dev;
-
-	state->csis_fmt = &mipi_csis_formats[0];
-	mipi_csis_init_cfg(mipi_sd, NULL);
-
-	state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK
-					 | MEDIA_PAD_FL_MUST_CONNECT;
-	state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
-					   | MEDIA_PAD_FL_MUST_CONNECT;
-	return media_entity_pads_init(&mipi_sd->entity, CSIS_PADS_NUM,
-				      state->pads);
-}
-
 static int mipi_csis_async_register(struct csi_state *state)
 {
 	struct v4l2_fwnode_endpoint vep = {
@@ -1162,27 +1157,138 @@ static int mipi_csis_async_register(struct csi_state *state)
 	return ret;
 }
 
-static int mipi_csis_dump_regs_show(struct seq_file *m, void *private)
+/* -----------------------------------------------------------------------------
+ * Suspend/resume
+ */
+
+static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
+{
+	struct v4l2_subdev *mipi_sd = dev_get_drvdata(dev);
+	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	int ret = 0;
+
+	mutex_lock(&state->lock);
+	if (state->flags & ST_POWERED) {
+		mipi_csis_stop_stream(state);
+		ret = regulator_disable(state->mipi_phy_regulator);
+		if (ret)
+			goto unlock;
+		mipi_csis_clk_disable(state);
+		state->flags &= ~ST_POWERED;
+		if (!runtime)
+			state->flags |= ST_SUSPENDED;
+	}
+
+unlock:
+	mutex_unlock(&state->lock);
+
+	return ret ? -EAGAIN : 0;
+}
+
+static int mipi_csis_pm_resume(struct device *dev, bool runtime)
+{
+	struct v4l2_subdev *mipi_sd = dev_get_drvdata(dev);
+	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+	int ret = 0;
+
+	mutex_lock(&state->lock);
+	if (!runtime && !(state->flags & ST_SUSPENDED))
+		goto unlock;
+
+	if (!(state->flags & ST_POWERED)) {
+		ret = regulator_enable(state->mipi_phy_regulator);
+		if (ret)
+			goto unlock;
+
+		state->flags |= ST_POWERED;
+		mipi_csis_clk_enable(state);
+	}
+	if (state->flags & ST_STREAMING)
+		mipi_csis_start_stream(state);
+
+	state->flags &= ~ST_SUSPENDED;
+
+unlock:
+	mutex_unlock(&state->lock);
+
+	return ret ? -EAGAIN : 0;
+}
+
+static int __maybe_unused mipi_csis_suspend(struct device *dev)
+{
+	return mipi_csis_pm_suspend(dev, false);
+}
+
+static int __maybe_unused mipi_csis_resume(struct device *dev)
 {
-	struct csi_state *state = m->private;
+	return mipi_csis_pm_resume(dev, false);
+}
 
-	return mipi_csis_dump_regs(state);
+static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
+{
+	return mipi_csis_pm_suspend(dev, true);
 }
-DEFINE_SHOW_ATTRIBUTE(mipi_csis_dump_regs);
 
-static void mipi_csis_debugfs_init(struct csi_state *state)
+static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
+{
+	return mipi_csis_pm_resume(dev, true);
+}
+
+static const struct dev_pm_ops mipi_csis_pm_ops = {
+	SET_RUNTIME_PM_OPS(mipi_csis_runtime_suspend, mipi_csis_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(mipi_csis_suspend, mipi_csis_resume)
+};
+
+/* -----------------------------------------------------------------------------
+ * Probe/remove & platform driver
+ */
+
+static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
+				 struct platform_device *pdev,
+				 const struct v4l2_subdev_ops *ops)
 {
-	state->debugfs_root = debugfs_create_dir(dev_name(state->dev), NULL);
+	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
 
-	debugfs_create_bool("debug_enable", 0600, state->debugfs_root,
-			    &state->debug);
-	debugfs_create_file("dump_regs", 0600, state->debugfs_root, state,
-			    &mipi_csis_dump_regs_fops);
+	v4l2_subdev_init(mipi_sd, ops);
+	mipi_sd->owner = THIS_MODULE;
+	snprintf(mipi_sd->name, sizeof(mipi_sd->name), "%s.%d",
+		 CSIS_SUBDEV_NAME, state->index);
+
+	mipi_sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	mipi_sd->ctrl_handler = NULL;
+
+	mipi_sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	mipi_sd->entity.ops = &mipi_csis_entity_ops;
+
+	mipi_sd->dev = &pdev->dev;
+
+	state->csis_fmt = &mipi_csis_formats[0];
+	mipi_csis_init_cfg(mipi_sd, NULL);
+
+	state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK
+					 | MEDIA_PAD_FL_MUST_CONNECT;
+	state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE
+					   | MEDIA_PAD_FL_MUST_CONNECT;
+	return media_entity_pads_init(&mipi_sd->entity, CSIS_PADS_NUM,
+				      state->pads);
 }
 
-static void mipi_csis_debugfs_exit(struct csi_state *state)
+static int mipi_csis_parse_dt(struct platform_device *pdev,
+			      struct csi_state *state)
 {
-	debugfs_remove_recursive(state->debugfs_root);
+	struct device_node *node = pdev->dev.of_node;
+
+	if (of_property_read_u32(node, "clock-frequency",
+				 &state->clk_frequency))
+		state->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
+
+	/* Get MIPI PHY resets */
+	state->mrst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(state->mrst))
+		return PTR_ERR(state->mrst);
+
+	return 0;
 }
 
 static int mipi_csis_probe(struct platform_device *pdev)
@@ -1280,79 +1386,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
-{
-	struct v4l2_subdev *mipi_sd = dev_get_drvdata(dev);
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
-	int ret = 0;
-
-	mutex_lock(&state->lock);
-	if (state->flags & ST_POWERED) {
-		mipi_csis_stop_stream(state);
-		ret = regulator_disable(state->mipi_phy_regulator);
-		if (ret)
-			goto unlock;
-		mipi_csis_clk_disable(state);
-		state->flags &= ~ST_POWERED;
-		if (!runtime)
-			state->flags |= ST_SUSPENDED;
-	}
-
-unlock:
-	mutex_unlock(&state->lock);
-
-	return ret ? -EAGAIN : 0;
-}
-
-static int mipi_csis_pm_resume(struct device *dev, bool runtime)
-{
-	struct v4l2_subdev *mipi_sd = dev_get_drvdata(dev);
-	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
-	int ret = 0;
-
-	mutex_lock(&state->lock);
-	if (!runtime && !(state->flags & ST_SUSPENDED))
-		goto unlock;
-
-	if (!(state->flags & ST_POWERED)) {
-		ret = regulator_enable(state->mipi_phy_regulator);
-		if (ret)
-			goto unlock;
-
-		state->flags |= ST_POWERED;
-		mipi_csis_clk_enable(state);
-	}
-	if (state->flags & ST_STREAMING)
-		mipi_csis_start_stream(state);
-
-	state->flags &= ~ST_SUSPENDED;
-
-unlock:
-	mutex_unlock(&state->lock);
-
-	return ret ? -EAGAIN : 0;
-}
-
-static int __maybe_unused mipi_csis_suspend(struct device *dev)
-{
-	return mipi_csis_pm_suspend(dev, false);
-}
-
-static int __maybe_unused mipi_csis_resume(struct device *dev)
-{
-	return mipi_csis_pm_resume(dev, false);
-}
-
-static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
-{
-	return mipi_csis_pm_suspend(dev, true);
-}
-
-static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
-{
-	return mipi_csis_pm_resume(dev, true);
-}
-
 static int mipi_csis_remove(struct platform_device *pdev)
 {
 	struct v4l2_subdev *mipi_sd = platform_get_drvdata(pdev);
@@ -1373,12 +1406,6 @@ static int mipi_csis_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct dev_pm_ops mipi_csis_pm_ops = {
-	SET_RUNTIME_PM_OPS(mipi_csis_runtime_suspend, mipi_csis_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(mipi_csis_suspend, mipi_csis_resume)
-};
-
 static const struct of_device_id mipi_csis_of_match[] = {
 	{ .compatible = "fsl,imx7-mipi-csi2", },
 	{ /* sentinel */ },
-- 
Regards,

Laurent Pinchart

