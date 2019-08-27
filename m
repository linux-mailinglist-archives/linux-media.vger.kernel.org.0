Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9A4E9E3EA
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 11:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729454AbfH0JWs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 05:22:48 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:46215 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729357AbfH0JWs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 05:22:48 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AD2D21C000C;
        Tue, 27 Aug 2019 09:22:45 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v2 09/10] media: i2c: ov5670: Report native size and crop bounds
Date:   Tue, 27 Aug 2019 11:23:37 +0200
Message-Id: <20190827092339.8858-12-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190827092339.8858-1-jacopo@jmondi.org>
References: <20190827092339.8858-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Report the native pixel array size and the crop bounds for the ov5670
sensor driver.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 2bc57e85f721..3e22fe9ccad1 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2258,6 +2258,25 @@ static int ov5670_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov5670_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = 2592;
+		sel->r.height = 1944;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 {
 	*frames = OV5670_NUM_OF_SKIP_FRAMES;
@@ -2425,6 +2444,7 @@ static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
 	.enum_mbus_code = ov5670_enum_mbus_code,
 	.get_fmt = ov5670_get_pad_format,
 	.set_fmt = ov5670_set_pad_format,
+	.get_selection = ov5670_get_selection,
 	.enum_frame_size = ov5670_enum_frame_size,
 };
 
-- 
2.23.0

