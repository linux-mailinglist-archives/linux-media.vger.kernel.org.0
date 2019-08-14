Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDCD8DEC3
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 22:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729611AbfHNU1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 16:27:20 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:33645 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729595AbfHNU1U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 16:27:20 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.homenet.telecomitalia.it (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 174B0FF803;
        Wed, 14 Aug 2019 20:27:16 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [RFC 4/5] media: i2c: ov5670: Report the camera location
Date:   Wed, 14 Aug 2019 22:28:14 +0200
Message-Id: <20190814202815.32491-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814202815.32491-1-jacopo@jmondi.org>
References: <20190814202815.32491-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The camera location is retrieved from the firmware interface parsing
the "location" device property and reported through the read-only
V4L2_CID_LOCATION control.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 041fcbb4eebd..1446aef1fc1e 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2059,10 +2059,12 @@ static const struct v4l2_ctrl_ops ov5670_ctrl_ops = {
 /* Initialize control handlers */
 static int ov5670_init_controls(struct ov5670 *ov5670)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 vblank_max;
 	s64 vblank_def;
 	s64 vblank_min;
+	u32 location;
 	s64 exposure_max;
 	int ret;
 
@@ -2124,6 +2126,15 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
 				     ARRAY_SIZE(ov5670_test_pattern_menu) - 1,
 				     0, 0, ov5670_test_pattern_menu);
 
+	ret = device_property_read_u32(&client->dev, "location", &location);
+	if (!ret) {
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov5670_ctrl_ops,
+				  V4L2_CID_LOCATION, V4L2_LOCATION_FRONT,
+				  V4L2_LOCATION_BACK, 1,
+				  location == V4L2_LOCATION_FRONT ?
+				  V4L2_LOCATION_FRONT : V4L2_LOCATION_BACK);
+	}
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		goto error;
-- 
2.22.0

