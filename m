Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8114834BC
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 17:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbiACQYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 11:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbiACQYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 11:24:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4D7C061761;
        Mon,  3 Jan 2022 08:24:35 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D29DCE53;
        Mon,  3 Jan 2022 17:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641227073;
        bh=J5Rn5mTsyKEMp2WJ3Efp+duU1a+RTNjeXaQxJ6pIZwk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=squzlVGKXzmoOV6cyWip19qV/TYts5Lif9BcoFHxRlQC1RaiSn8KNzyXX0JR083ar
         /MsvOFOU3nwJD1UoSXgwA6kr1bJKUwiQnknINU5DnueY9X3yC492bSZXtblDXrGCiH
         VQCN7m55kd2+5PPxGWw4i+iYY9FfbYmzdM0+86N4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mats Randgaard <matrandg@cisco.com>
Subject: [RFC PATCH 8/8] media: v4l2-mediabus: Drop V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag
Date:   Mon,  3 Jan 2022 18:24:14 +0200
Message-Id: <20220103162414.27723-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MIPI CSI-2 continuous and non-continuous clock modes are mutually
exclusive. Drop the V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag and use
V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK only.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/adv7180.c           | 3 +--
 drivers/media/i2c/tc358743.c          | 6 +++---
 drivers/media/v4l2-core/v4l2-fwnode.c | 4 +---
 include/media/v4l2-mediabus.h         | 3 +--
 4 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 3ff37a550810..4f5db195e66d 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -785,8 +785,7 @@ static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
 	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
 		cfg->type = V4L2_MBUS_CSI2_DPHY;
 		cfg->bus.mipi_csi2.num_data_lanes = 1;
-		cfg->bus.mipi_csi2.flags =
-				V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
+		cfg->bus.mipi_csi2.flags = 0;
 	} else {
 		/*
 		 * The ADV7180 sensor supports BT.601/656 output modes.
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index dfbc42675143..e18b8947ad7e 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -717,7 +717,7 @@ static void tc358743_set_csi(struct v4l2_subdev *sd)
 			((lanes > 3) ? MASK_D3M_HSTXVREGEN : 0x0));
 
 	i2c_wr32(sd, TXOPTIONCNTRL, (state->bus.flags &
-		 V4L2_MBUS_CSI2_CONTINUOUS_CLOCK) ? MASK_CONTCLKMODE : 0);
+		 V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK) ? 0 : MASK_CONTCLKMODE);
 	i2c_wr32(sd, STARTCNTRL, MASK_START);
 	i2c_wr32(sd, CSI_START, MASK_STRT);
 
@@ -1613,7 +1613,7 @@ static int tc358743_get_mbus_config(struct v4l2_subdev *sd,
 	cfg->type = V4L2_MBUS_CSI2_DPHY;
 
 	/* Support for non-continuous CSI-2 clock is missing in the driver */
-	cfg->bus.mipi_csi2.flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
+	cfg->bus.mipi_csi2.flags = 0;
 	cfg->bus.mipi_csi2.num_data_lanes = state->csi_lanes_in_use;
 
 	return 0;
@@ -2039,7 +2039,7 @@ static int tc358743_probe(struct i2c_client *client)
 	/* platform data */
 	if (pdata) {
 		state->pdata = *pdata;
-		state->bus.flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
+		state->bus.flags = 0;
 	} else {
 		err = tc358743_probe_of(state);
 		if (err == -ENODEV)
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 9ff3ebb230e7..9aad860cde6c 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -207,13 +207,11 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 	if (fwnode_property_present(fwnode, "clock-noncontinuous")) {
 		flags |= V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
 		pr_debug("non-continuous clock\n");
-	} else {
-		flags |= V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
 	}
 
 	if (bus_type == V4L2_MBUS_CSI2_DPHY ||
 	    bus_type == V4L2_MBUS_CSI2_CPHY || lanes_used ||
-	    have_clk_lane || (flags & ~V4L2_MBUS_CSI2_CONTINUOUS_CLOCK)) {
+	    have_clk_lane || (flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
 		/* Only D-PHY has a clock lane. */
 		unsigned int dfl_data_lane_index =
 			bus_type == V4L2_MBUS_CSI2_DPHY;
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index c6626a22b394..e0db3bcff9ed 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -68,8 +68,7 @@
 
 /* Serial flags */
 /* Clock non-continuous mode support. */
-#define V4L2_MBUS_CSI2_CONTINUOUS_CLOCK		BIT(8)
-#define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(9)
+#define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(0)
 
 #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
 
-- 
Regards,

Laurent Pinchart

