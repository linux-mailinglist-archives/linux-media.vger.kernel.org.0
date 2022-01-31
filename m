Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AC24A4994
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241029AbiAaOob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:44:31 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54707 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241187AbiAaOoM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:44:12 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 61707C0004;
        Mon, 31 Jan 2022 14:44:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 16/21] media: ov5640: Disable s_frame_interval in MIPI mode
Date:   Mon, 31 Jan 2022 15:44:44 +0100
Message-Id: <20220131144444.129036-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131144444.129036-1-jacopo@jmondi.org>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144444.129036-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the sensor is operated in MIPI mode, the frame rate configuration
is performed by tuning the frame blanking times and not by the
s_frame_interval subdev operation.

Disallow enum/s/g_frame_interval if the chip is used in MIPI mode.

While at it re-indent one function which whose parameters were wrongly
aligned.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index ec46e16223af..28da0ddd2a06 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3275,15 +3275,17 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov5640_enum_frame_interval(
-	struct v4l2_subdev *sd,
-	struct v4l2_subdev_state *sd_state,
-	struct v4l2_subdev_frame_interval_enum *fie)
+static int ov5640_enum_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	struct v4l2_fract tpf;
 	int ret;
 
+	if (ov5640_is_mipi(sensor))
+		return -EINVAL;
+
 	if (fie->pad != 0)
 		return -EINVAL;
 	if (fie->index >= OV5640_NUM_FRAMERATES)
@@ -3306,6 +3308,9 @@ static int ov5640_g_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 
+	if (ov5640_is_mipi(sensor))
+		return -EINVAL;
+
 	mutex_lock(&sensor->lock);
 	fi->interval = sensor->frame_interval;
 	mutex_unlock(&sensor->lock);
@@ -3320,6 +3325,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 	const struct ov5640_mode_info *mode;
 	int frame_rate, ret = 0;
 
+	if (ov5640_is_mipi(sensor))
+		return -EINVAL;
+
 	if (fi->pad != 0)
 		return -EINVAL;
 
-- 
2.35.0

