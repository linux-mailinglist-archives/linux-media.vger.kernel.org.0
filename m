Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C412680D3
	for <lists+linux-media@lfdr.de>; Sun, 13 Sep 2020 20:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbgIMSnE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Sep 2020 14:43:04 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58490 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725980AbgIMSnB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Sep 2020 14:43:01 -0400
X-IronPort-AV: E=Sophos;i="5.76,423,1592838000"; 
   d="scan'208";a="56925270"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Sep 2020 03:43:00 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B739540078B7;
        Mon, 14 Sep 2020 03:42:58 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v4 3/3] media: i2c: ov772x: Add test pattern control
Date:   Sun, 13 Sep 2020 19:42:47 +0100
Message-Id: <20200913184247.618-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200913184247.618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200913184247.618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for test pattern control supported by the sensor.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov772x.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index edd7c4c22225..2eeb11eae5f8 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -227,7 +227,7 @@
 
 /* COM3 */
 #define SWAP_MASK       (SWAP_RGB | SWAP_YUV | SWAP_ML)
-#define IMG_MASK        (VFLIP_IMG | HFLIP_IMG)
+#define IMG_MASK        (VFLIP_IMG | HFLIP_IMG | SCOLOR_TEST)
 
 #define VFLIP_IMG       0x80	/* Vertical flip image ON/OFF selection */
 #define HFLIP_IMG       0x40	/* Horizontal mirror image ON/OFF selection */
@@ -425,6 +425,7 @@ struct ov772x_priv {
 	const struct ov772x_win_size     *win;
 	struct v4l2_ctrl		 *vflip_ctrl;
 	struct v4l2_ctrl		 *hflip_ctrl;
+	unsigned int			  test_pattern;
 	/* band_filter = COM8[5] ? 256 - BDBASE : 0 */
 	struct v4l2_ctrl		 *band_filter_ctrl;
 	unsigned int			  fps;
@@ -540,6 +541,11 @@ static const struct ov772x_win_size ov772x_win_sizes[] = {
 	},
 };
 
+static const char * const ov772x_test_pattern_menu[] = {
+	"Disabled",
+	"Vertical Color Bar Type 1",
+};
+
 /*
  * frame rate settings lists
  */
@@ -809,6 +815,9 @@ static int ov772x_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 
 		return ret;
+	case V4L2_CID_TEST_PATTERN:
+		priv->test_pattern = ctrl->val;
+		return 0;
 	}
 
 	return -EINVAL;
@@ -1107,6 +1116,8 @@ static int ov772x_set_params(struct ov772x_priv *priv,
 		val ^= VFLIP_IMG;
 	if (priv->hflip_ctrl->val)
 		val ^= HFLIP_IMG;
+	if (priv->test_pattern)
+		val |= SCOLOR_TEST;
 
 	ret = regmap_update_bits(priv->regmap, COM3, SWAP_MASK | IMG_MASK, val);
 	if (ret < 0)
@@ -1405,6 +1416,10 @@ static int ov772x_probe(struct i2c_client *client)
 	priv->band_filter_ctrl = v4l2_ctrl_new_std(&priv->hdl, &ov772x_ctrl_ops,
 						   V4L2_CID_BAND_STOP_FILTER,
 						   0, 256, 1, 0);
+	v4l2_ctrl_new_std_menu_items(&priv->hdl, &ov772x_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ov772x_test_pattern_menu) - 1,
+				     0, 0, ov772x_test_pattern_menu);
 	priv->subdev.ctrl_handler = &priv->hdl;
 	if (priv->hdl.error) {
 		ret = priv->hdl.error;
-- 
2.17.1

