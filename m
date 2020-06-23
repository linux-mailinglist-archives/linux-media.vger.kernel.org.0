Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34AA20575E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 18:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732548AbgFWQjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 12:39:16 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:56317 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732174AbgFWQjP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 12:39:15 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7FB556000E;
        Tue, 23 Jun 2020 16:39:11 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     mrodin@de.adit-jv.com, hugues.fruchet@st.com, mripard@kernel.org,
        aford173@gmail.com, sudipi@jp.adit-jv.com,
        andrew_gabbasov@mentor.com, erosca@de.adit-jv.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 12/25] media: ov5647: Protect s_stream() with mutex
Date:   Tue, 23 Jun 2020 18:42:21 +0200
Message-Id: <20200623164224.44476-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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
index 859cc5b0d14a3..2d2829f934c3c 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -460,10 +460,17 @@ static const struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
 
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
2.27.0

