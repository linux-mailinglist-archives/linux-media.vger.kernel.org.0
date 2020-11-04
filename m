Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929212A61E9
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729591AbgKDKho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:37:44 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:45145 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729583AbgKDKho (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:37:44 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3F5AA100007;
        Wed,  4 Nov 2020 10:37:37 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v2 20/30] media: ov5647: Program mode only if it has changed
Date:   Wed,  4 Nov 2020 11:36:12 +0100
Message-Id: <20201104103622.595908-21-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104103622.595908-1-jacopo@jmondi.org>
References: <20201104103622.595908-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Store in the driver structure a pointer to the currently applied mode
and program a new one at s_stream(1) time only if it has changed.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 21983af55c23f..6e500fb548c74 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -96,6 +96,7 @@ struct ov5647 {
 	bool				clock_ncont;
 	struct v4l2_ctrl_handler	ctrls;
 	const struct ov5647_mode	*mode;
+	const struct ov5647_mode	*current_mode;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -755,6 +756,9 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 	u8 resetval, rdval;
 	int ret;
 
+	if (sensor->mode == sensor->current_mode)
+		return 0;
+
 	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
 	if (ret < 0)
 		return ret;
@@ -781,6 +785,8 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 			return ret;
 	}
 
+	sensor->current_mode = sensor->mode;
+
 	return 0;
 }
 
@@ -819,6 +825,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 
 static int ov5647_stream_off(struct v4l2_subdev *sd)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
 
 	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_CLOCK_LANE_GATE |
@@ -830,7 +837,13 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
 	if (ret < 0)
 		return ret;
 
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
+	ret = ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
+	if (ret < 0)
+		return ret;
+
+	sensor->current_mode = NULL;
+
+	return 0;
 }
 
 static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
-- 
2.29.1

