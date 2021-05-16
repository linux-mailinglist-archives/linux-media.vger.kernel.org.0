Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44A8381C05
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbhEPCQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbhEPCOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:14:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 427DCC061342
        for <linux-media@vger.kernel.org>; Sat, 15 May 2021 19:05:10 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F0101C41;
        Sun, 16 May 2021 03:45:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621129509;
        bh=G+bYL/XnH14VWv3VGWyCDAyZXKmo9km4B/SxW7eMOTs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gp8gmh2EM/vVobU7gyWr7ydZrj9b3UtycoILdHKzy9YF5xpCvxcYTdOsVlTWusI1t
         fOokIq2qL0z/KhipGWvY73HxqLUtOLpdpBRJbNElL3QiXuTYfbx5z2Ip18tlpKqL20
         ST5Tuq0JUm+jXFrIVzTH9kto44vtfcw/9SVEzcJ4=
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
Subject: [PATCH v2 13/25] media: imx: imx7_mipi_csis: Rename csi_state flag field to state
Date:   Sun, 16 May 2021 04:44:29 +0300
Message-Id: <20210516014441.5508-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The flag field of the csi_state structure contains the device state.
Rename it accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
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

