Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA3D8DEC1
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 22:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729643AbfHNU1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 16:27:22 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:35937 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729625AbfHNU1V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 16:27:21 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.homenet.telecomitalia.it (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D59F3FF807;
        Wed, 14 Aug 2019 20:27:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [RFC 5/5] media: i2c: ov13858: Report the camera location
Date:   Wed, 14 Aug 2019 22:28:15 +0200
Message-Id: <20190814202815.32491-6-jacopo@jmondi.org>
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
 drivers/media/i2c/ov13858.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 45bb872db3c5..6baefc3083e1 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1591,6 +1591,7 @@ static int ov13858_init_controls(struct ov13858 *ov13858)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov13858->sd);
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
+	u32 location;
 	s64 vblank_def;
 	s64 vblank_min;
 	s64 hblank;
@@ -1659,6 +1660,16 @@ static int ov13858_init_controls(struct ov13858 *ov13858)
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov13858_test_pattern_menu) - 1,
 				     0, 0, ov13858_test_pattern_menu);
+
+	ret = device_property_read_u32(&client->dev, "location", &location);
+	if (!ret) {
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov13858_ctrl_ops,
+				  V4L2_CID_LOCATION, V4L2_LOCATION_FRONT,
+				  V4L2_LOCATION_BACK, 1,
+				  location == V4L2_LOCATION_FRONT ?
+				  V4L2_LOCATION_FRONT : V4L2_LOCATION_BACK);
+	}
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err(&client->dev, "%s control init failed (%d)\n",
-- 
2.22.0

