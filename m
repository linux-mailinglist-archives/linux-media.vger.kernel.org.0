Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A292B980B
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 17:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgKSQdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 11:33:43 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:36549 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728403AbgKSQdm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 11:33:42 -0500
X-Originating-IP: 93.34.118.233
Received: from localhost.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 83BE840014;
        Thu, 19 Nov 2020 16:33:39 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 11/30] media: ov5647: Protect s_stream() with mutex
Date:   Thu, 19 Nov 2020 17:32:30 +0100
Message-Id: <20201119163238.783142-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119163238.783142-1-jacopo@jmondi.org>
References: <20201119161956.756455-1-jacopo@jmondi.org>
 <20201119163238.783142-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the driver mutex to protect s_stream() operations.
This will become more relevant once the sensor will support more formats
and set_format() could be issue concurrently to s_stream().

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 2e7a6cb396890..69a5e25dcd707 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -462,10 +462,17 @@ static const struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
 
 static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 {
+	struct ov5647 *sensor = to_state(sd);
+	int ret;
+
+	mutex_lock(&sensor->lock);
 	if (enable)
-		return ov5647_stream_on(sd);
+		ret = ov5647_stream_on(sd);
 	else
-		return ov5647_stream_off(sd);
+		ret = ov5647_stream_off(sd);
+	mutex_unlock(&sensor->lock);
+
+	return ret;
 }
 
 static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
-- 
2.29.1

