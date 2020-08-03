Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5E623A388
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 13:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgHCLsK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 07:48:10 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:36739 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726534AbgHCLj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 07:39:56 -0400
X-IronPort-AV: E=Sophos;i="5.75,429,1589209200"; 
   d="scan'208";a="53742353"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Aug 2020 20:39:40 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 88BD142389C3;
        Mon,  3 Aug 2020 20:39:37 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] media: i2c: ov772x: Add test pattern control
Date:   Mon,  3 Aug 2020 12:39:13 +0100
Message-Id: <1596454753-13612-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for test pattern control supported by the sensor.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/media/i2c/ov772x.c | 25 ++++++++++++++++++++++++-
 include/media/i2c/ov772x.h |  1 +
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 2de9248e3689..457887ec548d 100644
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
@@ -772,6 +778,13 @@ static int ov772x_s_frame_interval(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int ov772x_enable_test_pattern(struct ov772x_priv *priv, u32 pattern)
+{
+	priv->test_pattern = pattern;
+	return regmap_update_bits(priv->regmap, COM3, SCOLOR_TEST,
+				  pattern ? SCOLOR_TEST : 0x00);
+}
+
 static int ov772x_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov772x_priv *priv = container_of(ctrl->handler,
@@ -819,6 +832,8 @@ static int ov772x_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 
 		return ret;
+	case V4L2_CID_TEST_PATTERN:
+		return ov772x_enable_test_pattern(priv, ctrl->val);
 	}
 
 	return -EINVAL;
@@ -1113,10 +1128,14 @@ static int ov772x_set_params(struct ov772x_priv *priv,
 		val |= VFLIP_IMG;
 	if (priv->info && (priv->info->flags & OV772X_FLAG_HFLIP))
 		val |= HFLIP_IMG;
+	if (priv->info && (priv->info->flags & OV772X_FLAG_TEST_PATTERN))
+		val |= SCOLOR_TEST;
 	if (priv->vflip_ctrl->val)
 		val ^= VFLIP_IMG;
 	if (priv->hflip_ctrl->val)
 		val ^= HFLIP_IMG;
+	if (priv->test_pattern)
+		val ^= SCOLOR_TEST;
 
 	ret = regmap_update_bits(priv->regmap, COM3, SWAP_MASK | IMG_MASK, val);
 	if (ret < 0)
@@ -1414,6 +1433,10 @@ static int ov772x_probe(struct i2c_client *client)
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
diff --git a/include/media/i2c/ov772x.h b/include/media/i2c/ov772x.h
index a1702d420087..65e6f8d2f4bb 100644
--- a/include/media/i2c/ov772x.h
+++ b/include/media/i2c/ov772x.h
@@ -12,6 +12,7 @@
 /* for flags */
 #define OV772X_FLAG_VFLIP	(1 << 0) /* Vertical flip image */
 #define OV772X_FLAG_HFLIP	(1 << 1) /* Horizontal flip image */
+#define OV772X_FLAG_TEST_PATTERN	(1 << 2) /* Test pattern */
 
 /*
  * for Edge ctrl
-- 
2.17.1

