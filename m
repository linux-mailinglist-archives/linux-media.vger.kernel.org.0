Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9DCF5062
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 16:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfKHP6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 10:58:21 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:40929 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfKHP6V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 10:58:21 -0500
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2684310000A;
        Fri,  8 Nov 2019 15:58:17 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v5 11/11] media: i2c: ov13858: Parse and register properties
Date:   Fri,  8 Nov 2019 16:59:44 +0100
Message-Id: <20191108155944.1040883-12-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108155944.1040883-1-jacopo@jmondi.org>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Parse device properties and register controls for them using the newly
introduced helpers.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov13858.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index aac6f77afa0f..2ef5fb5cf519 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 
 #define OV13858_REG_VALUE_08BIT		1
 #define OV13858_REG_VALUE_16BIT		2
@@ -1589,6 +1590,7 @@ static const struct v4l2_subdev_internal_ops ov13858_internal_ops = {
 static int ov13858_init_controls(struct ov13858 *ov13858)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov13858->sd);
+	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 exposure_max;
 	s64 vblank_def;
@@ -1666,6 +1668,15 @@ static int ov13858_init_controls(struct ov13858 *ov13858)
 		goto error;
 	}
 
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		return ret;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov13858_ctrl_ops,
+					      &props);
+	if (ret)
+		return ret;
+
 	ov13858->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
-- 
2.23.0

