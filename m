Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F15709E3EB
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 11:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbfH0JWu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 05:22:50 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:49909 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729357AbfH0JWu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 05:22:50 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8A7531C000E;
        Tue, 27 Aug 2019 09:22:47 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v2 10/10] media: i2c: ov13858: Report native size and crop bounds
Date:   Tue, 27 Aug 2019 11:23:38 +0200
Message-Id: <20190827092339.8858-13-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190827092339.8858-1-jacopo@jmondi.org>
References: <20190827092339.8858-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Report the native pixel array size and the crop bounds for the ov13858
sensor driver.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov13858.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index d06be9b1e8d5..81ebb38e6567 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1402,6 +1402,30 @@ ov13858_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov13858_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = 16;
+		sel->r.top = 16;
+		sel->r.width = 4224;
+		sel->r.height = 3136;
+		break;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = 4256;
+		sel->r.height = 3168;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ov13858_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 {
 	*frames = OV13858_NUM_OF_SKIP_FRAMES;
@@ -1565,6 +1589,7 @@ static const struct v4l2_subdev_pad_ops ov13858_pad_ops = {
 	.enum_mbus_code = ov13858_enum_mbus_code,
 	.get_fmt = ov13858_get_pad_format,
 	.set_fmt = ov13858_set_pad_format,
+	.get_selection = ov13858_get_selection,
 	.enum_frame_size = ov13858_enum_frame_size,
 };
 
-- 
2.23.0

