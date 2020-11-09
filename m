Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2ED2AC15F
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 17:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730885AbgKIQuY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 11:50:24 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:41685 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730208AbgKIQuY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 11:50:24 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DB16A1BF209;
        Mon,  9 Nov 2020 16:50:20 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v3 17/29] media: ov5647: Use SBGGR10_1X10 640x480 as default
Date:   Mon,  9 Nov 2020 17:49:22 +0100
Message-Id: <20201109164934.134919-18-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109164934.134919-1-jacopo@jmondi.org>
References: <20201109164934.134919-1-jacopo@jmondi.org>
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
index a282dc7267ad8..c65aacc0e04d3 100644
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
@@ -1024,7 +1025,6 @@ static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 
-	/* Only one format is supported, so return that. */
 	memset(fmt, 0, sizeof(*fmt));
 	*fmt = OV5647_DEFAULT_FORMAT;
 
-- 
2.29.1

