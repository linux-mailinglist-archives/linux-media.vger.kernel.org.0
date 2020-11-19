Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BE52B9812
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 17:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbgKSQd7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 11:33:59 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:52137 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728727AbgKSQd6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 11:33:58 -0500
X-Originating-IP: 93.34.118.233
Received: from localhost.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7B4C340017;
        Thu, 19 Nov 2020 16:33:55 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 18/30] media: ov5647: Use SBGGR10_1X10 640x480 as default
Date:   Thu, 19 Nov 2020 17:32:37 +0100
Message-Id: <20201119163238.783142-9-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119163238.783142-1-jacopo@jmondi.org>
References: <20201119161956.756455-1-jacopo@jmondi.org>
 <20201119163238.783142-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The SBGGR10_1X10 formats supports more resolutions than SBGGR8_1X8.
Make it the default sensor format and set 2x2 binned 640x480 resolution
as default sensor size as it maximizes the FOV and framerate.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e206656a5e883..bb570be487175 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -677,8 +677,9 @@ static const struct ov5647_format_list ov5647_formats[] = {
 
 #define OV5647_NUM_FORMATS	(ARRAY_SIZE(ov5647_formats))
 
-#define OV5647_DEFAULT_MODE	(&ov5647_formats[0].modes[0])
-#define OV5647_DEFAULT_FORMAT	(ov5647_formats[0].modes[0].format)
+/* Default sensor mode is 2x2 binned 640x480 SBGGR10_1X10. */
+#define OV5647_DEFAULT_MODE	(&ov5647_formats[1].modes[3])
+#define OV5647_DEFAULT_FORMAT	(ov5647_formats[1].modes[3].format)
 
 static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
 {
@@ -1026,7 +1027,6 @@ static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 
-	/* Only one format is supported, so return that. */
 	*fmt = OV5647_DEFAULT_FORMAT;
 
 	return 0;
-- 
2.29.1

