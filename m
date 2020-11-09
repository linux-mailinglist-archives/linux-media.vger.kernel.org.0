Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE082AC153
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 17:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730546AbgKIQuF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 11:50:05 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:33167 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730709AbgKIQuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 11:50:04 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A393B1BF20E;
        Mon,  9 Nov 2020 16:50:00 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v3 09/29] media: ov5647: Implement enum_frame_size()
Date:   Mon,  9 Nov 2020 17:49:14 +0100
Message-Id: <20201109164934.134919-10-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109164934.134919-1-jacopo@jmondi.org>
References: <20201109164934.134919-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the .enum_frame_size subdev pad operation.

As the driver only supports one format and one resolution at the moment
the implementation is trivial.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index b9f19165b3491..f18e3ad342ebf 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -482,6 +482,24 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index)
+		return -EINVAL;
+
+	if (fse->code != MEDIA_BUS_FMT_SBGGR8_1X8)
+		return -EINVAL;
+
+	fse->min_width = 640;
+	fse->max_width = 640;
+	fse->min_height = 480;
+	fse->max_height = 480;
+
+	return 0;
+}
+
 static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_pad_config *cfg,
 			      struct v4l2_subdev_format *format)
@@ -500,9 +518,10 @@ static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
-	.enum_mbus_code = ov5647_enum_mbus_code,
-	.set_fmt =	  ov5647_set_get_fmt,
-	.get_fmt =	  ov5647_set_get_fmt,
+	.enum_mbus_code		= ov5647_enum_mbus_code,
+	.enum_frame_size	= ov5647_enum_frame_size,
+	.set_fmt		= ov5647_set_get_fmt,
+	.get_fmt		= ov5647_set_get_fmt,
 };
 
 static const struct v4l2_subdev_ops ov5647_subdev_ops = {
-- 
2.29.1

