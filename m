Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9DB9E3E9
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 11:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729439AbfH0JWr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 05:22:47 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:49075 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729357AbfH0JWq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 05:22:46 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E9A311C0009;
        Tue, 27 Aug 2019 09:22:43 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v2 08/10] media: i2c: ov13858: Register controls from firmware
Date:   Tue, 27 Aug 2019 11:23:36 +0200
Message-Id: <20190827092339.8858-11-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190827092339.8858-1-jacopo@jmondi.org>
References: <20190827092339.8858-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly introduced helper to parse properties from firmware and
register the associated v4l2 control.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov13858.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index aac6f77afa0f..d06be9b1e8d5 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 
 #define OV13858_REG_VALUE_08BIT		1
 #define OV13858_REG_VALUE_16BIT		2
@@ -1666,6 +1667,11 @@ static int ov13858_init_controls(struct ov13858 *ov13858)
 		goto error;
 	}
 
+	ret = v4l2_fwnode_register_controls(dev_fwnode(&client->dev),
+					    ctrl_hdlr, &ov13858_ctrl_ops);
+	if (ret)
+		goto error;
+
 	ov13858->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
-- 
2.23.0

