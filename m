Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A98DC91024
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 12:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfHQKnb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Aug 2019 06:43:31 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:51937 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbfHQKnb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Aug 2019 06:43:31 -0400
Received: from uno.homenet.telecomitalia.it (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id E4B84100007;
        Sat, 17 Aug 2019 10:43:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH 2/2] media: i2c: ov13858: Report native size and crop bounds
Date:   Sat, 17 Aug 2019 12:44:44 +0200
Message-Id: <20190817104444.28329-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190817104444.28329-1-jacopo@jmondi.org>
References: <20190817104444.28329-1-jacopo@jmondi.org>
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
index 838a6c6136a8..32f46c1395eb 100644
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
2.22.0

