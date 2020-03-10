Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0399417FBF8
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731436AbgCJNRk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:17:40 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:31755 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731383AbgCJNRj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:17:39 -0400
X-IronPort-AV: E=Sophos;i="5.70,537,1574089200"; 
   d="scan'208";a="41499811"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Mar 2020 22:17:37 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 209F14290415;
        Tue, 10 Mar 2020 22:17:35 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/3] media: i2c: imx219: Fix power sequence
Date:   Tue, 10 Mar 2020 13:17:07 +0000
Message-Id: <1583846229-6799-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583846229-6799-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1583846229-6799-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When supporting Rpi Camera v2 Module on the RZ/G2E, found the driver had
some issues with rcar mipi-csi driver. The sensor never entered into LP-11
state.

The powerup sequence in the datasheet[1] shows the sensor entering into
LP-11 in streaming mode, so to fix this issue transitions are performed
from "streaming -> standby" in the probe() after power up.

With this commit the sensor is able to enter LP-11 mode during power up,
as expected by some CSI-2 controllers.

[1] https://publiclab.org/system/images/photos/000/023/294/original/
RASPBERRY_PI_CAMERA_V2_DATASHEET_IMX219PQH5_7.0.0_Datasheet_XXX.PDF

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f1effb5..16010ca 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1224,6 +1224,23 @@ static int imx219_probe(struct i2c_client *client)
 	/* Set default mode to max resolution */
 	imx219->mode = &supported_modes[0];
 
+	/* sensor doesn't enter LP-11 state upon power up until and unless
+	 * streaming is started, so upon power up switch the modes to:
+	 * streaming -> standby
+	 */
+	ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
+			       IMX219_REG_VALUE_08BIT, IMX219_MODE_STREAMING);
+	if (ret < 0)
+		goto error_power_off;
+	usleep_range(100, 110);
+
+	/* put sensor back to standby mode */
+	ret = imx219_write_reg(imx219, IMX219_REG_MODE_SELECT,
+			       IMX219_REG_VALUE_08BIT, IMX219_MODE_STANDBY);
+	if (ret < 0)
+		goto error_power_off;
+	usleep_range(100, 110);
+
 	ret = imx219_init_controls(imx219);
 	if (ret)
 		goto error_power_off;
-- 
2.7.4

