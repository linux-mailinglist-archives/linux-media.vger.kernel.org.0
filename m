Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2C235D546
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343518AbhDMCbi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245713AbhDMCbg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:36 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A69A98AF;
        Tue, 13 Apr 2021 04:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281077;
        bh=cqj84uzHR15SOybhDDJP9WSfm6hIaZdylu9rqjKit9k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IT4xrelwR9X6F7g1C8XxmD2uTSzeYZEdjQ53DHgUsepE8sVY6l4suYv5Y7gzOHw73
         NPMNHa34NdixQ/qWChhkqwQqMEI22sw53TwOjUlYamIDxEjUYjkRHxkI+ac2kZ/eUa
         eiGXtNgpfFe5Ychtcm6DaFmvTdZDUYPcLXnVU6Ng=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 13/23] media: imx: imx7_mipi_csis: Rename csi_state flag field to state
Date:   Tue, 13 Apr 2021 05:30:04 +0300
Message-Id: <20210413023014.28797-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The flag field of the csi_state structure contains the device state.
Rename it accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 6b9c05b1cdf3..49b8afc0f2f8 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -306,7 +306,7 @@ struct csi_state {
 	struct platform_device *pdev;
 	void __iomem *regs;
 	int irq;
-	u32 flags;
+	u32 state;
 
 	struct dentry *debugfs_root;
 	bool debug;
@@ -813,7 +813,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	mutex_lock(&state->lock);
 
 	if (enable) {
-		if (state->flags & ST_SUSPENDED) {
+		if (state->state & ST_SUSPENDED) {
 			ret = -EBUSY;
 			goto unlock;
 		}
@@ -825,14 +825,14 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 
 		mipi_csis_log_counters(state, true);
 
-		state->flags |= ST_STREAMING;
+		state->state |= ST_STREAMING;
 	} else {
 		v4l2_subdev_call(state->src_sd, video, s_stream, 0);
 		ret = v4l2_subdev_call(state->src_sd, core, s_power, 0);
 		if (ret == -ENOIOCTLCMD)
 			ret = 0;
 		mipi_csis_stop_stream(state);
-		state->flags &= ~ST_STREAMING;
+		state->state &= ~ST_STREAMING;
 		if (state->debug)
 			mipi_csis_log_counters(state, true);
 	}
@@ -1028,7 +1028,7 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)
 
 	mutex_lock(&state->lock);
 	mipi_csis_log_counters(state, true);
-	if (state->debug && (state->flags & ST_POWERED))
+	if (state->debug && (state->state & ST_POWERED))
 		mipi_csis_dump_regs(state);
 	mutex_unlock(&state->lock);
 
@@ -1178,15 +1178,15 @@ static int mipi_csis_pm_suspend(struct device *dev, bool runtime)
 	int ret = 0;
 
 	mutex_lock(&state->lock);
-	if (state->flags & ST_POWERED) {
+	if (state->state & ST_POWERED) {
 		mipi_csis_stop_stream(state);
 		ret = regulator_disable(state->mipi_phy_regulator);
 		if (ret)
 			goto unlock;
 		mipi_csis_clk_disable(state);
-		state->flags &= ~ST_POWERED;
+		state->state &= ~ST_POWERED;
 		if (!runtime)
-			state->flags |= ST_SUSPENDED;
+			state->state |= ST_SUSPENDED;
 	}
 
 unlock:
@@ -1202,21 +1202,21 @@ static int mipi_csis_pm_resume(struct device *dev, bool runtime)
 	int ret = 0;
 
 	mutex_lock(&state->lock);
-	if (!runtime && !(state->flags & ST_SUSPENDED))
+	if (!runtime && !(state->state & ST_SUSPENDED))
 		goto unlock;
 
-	if (!(state->flags & ST_POWERED)) {
+	if (!(state->state & ST_POWERED)) {
 		ret = regulator_enable(state->mipi_phy_regulator);
 		if (ret)
 			goto unlock;
 
-		state->flags |= ST_POWERED;
+		state->state |= ST_POWERED;
 		mipi_csis_clk_enable(state);
 	}
-	if (state->flags & ST_STREAMING)
+	if (state->state & ST_STREAMING)
 		mipi_csis_start_stream(state);
 
-	state->flags &= ~ST_SUSPENDED;
+	state->state &= ~ST_SUSPENDED;
 
 unlock:
 	mutex_unlock(&state->lock);
-- 
Regards,

Laurent Pinchart

