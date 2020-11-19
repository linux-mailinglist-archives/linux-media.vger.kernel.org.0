Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8192B982D
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 17:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgKSQgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 11:36:39 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:65163 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgKSQgj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 11:36:39 -0500
X-Originating-IP: 93.34.118.233
Received: from localhost.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6D3D324000A;
        Thu, 19 Nov 2020 16:36:35 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 26/30] media: ov5647: Rework s_stream() operation
Date:   Thu, 19 Nov 2020 17:35:46 +0100
Message-Id: <20201119163549.793282-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119163549.793282-1-jacopo@jmondi.org>
References: <20201119161956.756455-1-jacopo@jmondi.org>
 <20201119163549.793282-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework the s_stream() operation to turn the sensor on and
off at stream enable/disable time using the pm_runtime infrastructure.

Protect the stream on/off from being called multiple times in
sequence with a 'streaming' flag.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 777c7b30bafd7..1ac1538a3951f 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -114,6 +114,7 @@ struct ov5647 {
 	struct v4l2_ctrl		*hblank;
 	struct v4l2_ctrl		*vblank;
 	struct v4l2_ctrl		*exposure;
+	bool				streaming;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -1001,14 +1002,42 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647, struct v4l2_subdev_pad_config *cfg,
 
 static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
 
 	mutex_lock(&sensor->lock);
-	if (enable)
+	if (sensor->streaming == enable) {
+		mutex_unlock(&sensor->lock);
+		return 0;
+	}
+
+	if (enable) {
+		ret = pm_runtime_get_sync(&client->dev);
+		if (ret < 0)
+			goto error_unlock;
+
 		ret = ov5647_stream_on(sd);
-	else
+		if (ret < 0) {
+			dev_err(&client->dev, "stream start failed: %d\n", ret);
+			goto error_unlock;
+		}
+	} else {
 		ret = ov5647_stream_off(sd);
+		if (ret < 0) {
+			dev_err(&client->dev, "stream stop failed: %d\n", ret);
+			goto error_unlock;
+		}
+		pm_runtime_put(&client->dev);
+	}
+
+	sensor->streaming = enable;
+	mutex_unlock(&sensor->lock);
+
+	return 0;
+
+error_unlock:
+	pm_runtime_put(&client->dev);
 	mutex_unlock(&sensor->lock);
 
 	return ret;
-- 
2.29.1

