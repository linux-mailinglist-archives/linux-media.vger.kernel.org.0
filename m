Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31DC336F4E
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 10:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbhCKJx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 04:53:28 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:29875 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232079AbhCKJxK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 04:53:10 -0500
X-IronPort-AV: E=Sophos;i="5.81,240,1610377200"; 
   d="scan'208";a="74578298"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Mar 2021 18:53:08 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B8899401070C;
        Thu, 11 Mar 2021 18:53:05 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pavel Machek <pavel@denx.de>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 1/2] media: i2c: imx219: Move out locking/unlocking of vflip and hflip controls from imx219_set_stream
Date:   Thu, 11 Mar 2021 09:52:04 +0000
Message-Id: <20210311095205.8095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311095205.8095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210311095205.8095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move out locking/unlocking of vflip and hflip controls from
imx219_set_stream() to the imx219_start_streaming()/
imx219_stop_streaming() respectively.

This fixes an issue in resume callback error path where streaming is
stopped and the controls are left in locked state.

Fixes: 1283b3b8f82b9 ("media: i2c: Add driver for Sony IMX219 sensor")
Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/imx219.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 6e3382b85a90..82756cbfbaac 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1056,8 +1056,16 @@ static int imx219_start_streaming(struct imx219 *imx219)
 		return ret;
 
 	/* set stream on register */
-	return imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
-				IMX219_REG_VALUE_08BIT, IMX219_MODE_STREAMING);
+	ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
+			       IMX219_REG_VALUE_08BIT, IMX219_MODE_STREAMING);
+	if (ret)
+		return ret;
+
+	/* vflip and hflip cannot change during streaming */
+	__v4l2_ctrl_grab(imx219->vflip, true);
+	__v4l2_ctrl_grab(imx219->hflip, true);
+
+	return 0;
 }
 
 static void imx219_stop_streaming(struct imx219 *imx219)
@@ -1070,6 +1078,9 @@ static void imx219_stop_streaming(struct imx219 *imx219)
 			       IMX219_REG_VALUE_08BIT, IMX219_MODE_STANDBY);
 	if (ret)
 		dev_err(&client->dev, "%s failed to set stream\n", __func__);
+
+	__v4l2_ctrl_grab(imx219->vflip, false);
+	__v4l2_ctrl_grab(imx219->hflip, false);
 }
 
 static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
@@ -1105,10 +1116,6 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
 
 	imx219->streaming = enable;
 
-	/* vflip and hflip cannot change during streaming */
-	__v4l2_ctrl_grab(imx219->vflip, enable);
-	__v4l2_ctrl_grab(imx219->hflip, enable);
-
 	mutex_unlock(&imx219->mutex);
 
 	return ret;
-- 
2.17.1

