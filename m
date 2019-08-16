Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6F1A903C9
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 16:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfHPORO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 10:17:14 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:33867 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfHPORN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 10:17:13 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.homenet.telecomitalia.it (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3D290FF80F;
        Fri, 16 Aug 2019 14:17:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/6] media: i2c: ov5670: Register controls from firmware
Date:   Fri, 16 Aug 2019 16:18:21 +0200
Message-Id: <20190816141822.7582-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190816141822.7582-1-jacopo@jmondi.org>
References: <20190816141822.7582-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly introduced helper to parse properties from firmware and
registerer the associated v4l2 control.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 041fcbb4eebd..2bc57e85f721 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 
 #define OV5670_REG_CHIP_ID		0x300a
 #define OV5670_CHIP_ID			0x005670
@@ -2059,6 +2060,7 @@ static const struct v4l2_ctrl_ops ov5670_ctrl_ops = {
 /* Initialize control handlers */
 static int ov5670_init_controls(struct ov5670 *ov5670)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	s64 vblank_max;
 	s64 vblank_def;
@@ -2129,6 +2131,11 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
 		goto error;
 	}
 
+	ret = v4l2_fwnode_register_controls(dev_fwnode(&client->dev),
+					    ctrl_hdlr, &ov5670_ctrl_ops);
+	if (ret)
+		goto error;
+
 	ov5670->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
-- 
2.22.0

