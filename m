Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8641CBF83
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 11:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgEIJC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 05:02:28 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:46347 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgEIJC2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 05:02:28 -0400
X-Originating-IP: 212.216.150.148
Received: from uno.homenet.telecomitalia.it (a-ur1-85.tin.it [212.216.150.148])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7EC921C0004;
        Sat,  9 May 2020 09:02:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz
Subject: [PATCH v11 12/13] media: i2c: imx219: Parse and register properties
Date:   Sat,  9 May 2020 11:04:55 +0200
Message-Id: <20200509090456.3496481-13-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200509090456.3496481-1-jacopo@jmondi.org>
References: <20200509090456.3496481-1-jacopo@jmondi.org>
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
 drivers/media/i2c/imx219.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index cb03bdec1f9c8..8f72ff5c1585e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1171,11 +1171,12 @@ static int imx219_init_controls(struct imx219 *imx219)
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	unsigned int height = imx219->mode->height;
+	struct v4l2_fwnode_device_properties props;
 	int exposure_max, exposure_def, hblank;
 	int i, ret;
 
 	ctrl_hdlr = &imx219->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
 	if (ret)
 		return ret;
 
@@ -1254,6 +1255,15 @@ static int imx219_init_controls(struct imx219 *imx219)
 		goto error;
 	}
 
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx219_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
 	imx219->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
-- 
2.26.1

