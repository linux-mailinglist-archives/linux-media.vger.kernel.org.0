Return-Path: <linux-media+bounces-19942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BC89A574A
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 00:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 319AB281C10
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 22:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1789E19ABC4;
	Sun, 20 Oct 2024 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9kTAjE+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15DF1991D8;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729462453; cv=none; b=maKvw7eaJEhrQIUxgKxUXtw5N3UZrSMYf3xwKjcpYORu/GFVKmOIpte7s4acprzMIdFvRngLK4Pg2a/pdL2ZLbtdpHeypVSvAuEBHWaqiMT9+DK5e4zrJJh85Yjb77skGFJAOVc4HEMY0DzNqKF5zDmauHpcOlT78HNH5n4WZ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729462453; c=relaxed/simple;
	bh=a8bY/xGPZkN+M2yMUmLGritDMG4PTMLJ8/QIZQ4QtRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqi+dVbsxqRCOu1xCRk5BtMAEbjCWQbrDoTeIKgVcpWiPI0jNDvu0mUxmEfUdN9xgEVaPPHldz02GJqBgS89rKvFrwBOt2Dqq87imO26yrarHV6ZnC1w82jj97izSmFTpx6lFYFMcTKTFXL/4TLD3RsCOgY8MLK6os1wONraaIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9kTAjE+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61E5AC4AF0F;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729462452;
	bh=a8bY/xGPZkN+M2yMUmLGritDMG4PTMLJ8/QIZQ4QtRE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A9kTAjE+iiBLK5HtgH9D/Q8zL7PP9lhdg2LeK63JihPUkKbF3LiDu144scp4ZkMM8
	 slM6yPLZHpQREo1Ipc+uDuEBqHqbJ/dFro6pWbtr6EcpXTlx5pPVPlVKqTEGaQL0Eb
	 hZZafEdOzifwXTOkcoIsPh4O+rHW5f0oV8hAslQkJ1OILeyN8OYBN/onoeRkK8Yetp
	 OBePRA+BZ4uH2boE5h0RdFwNlqmiOWYzEWcj5aYdSWrxyItSgtj8eWtUobYdk/OW2S
	 1EqquVLGqzhyjMIEqUkQvrVpO6ZZw0MIjZSpFhenIO38xe6aFxje1kN7UNXz3b/AjO
	 oJJAAbF3/ekgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FCAD3C938;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 21 Oct 2024 00:13:33 +0200
Subject: [PATCH v2 13/13] media: i2c: imx214: Add test pattern control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241021-imx214-v2-13-fbd23e99541e@apitzsch.eu>
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
In-Reply-To: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729462449; l=4254;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=Ycuv3mccDEUrqsrrRYMMgnDXXWQgzfPBCnvvdHtarng=;
 b=bI5djwgEKIrSxryBacux+T5CBYrRX/3hNryn31sxQI1+EwJXGIWJDKBdMgJpMH4kYelxOgast
 ncT0/+Sm/xQAjW+vzk7FFQ1kqgGUsfNy/SRDxCEIYN4XrzV3p37q4KZ
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

This adds V4L2_CID_TEST_PATTERN control support.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 77 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 46f3e27371d8075517a75891e6a742912c2a3604..2aca3d88a0a7fa9b870090f1083b31b0c3c84652 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -184,6 +184,23 @@
 
 #define IMX214_REG_ATR_FAST_MOVE	CCI_REG8(0x9300)
 
+/* Test Pattern Control */
+#define IMX214_REG_TEST_PATTERN		CCI_REG16(0x0600)
+#define IMX214_TEST_PATTERN_DISABLE	0
+#define IMX214_TEST_PATTERN_SOLID_COLOR	1
+#define IMX214_TEST_PATTERN_COLOR_BARS	2
+#define IMX214_TEST_PATTERN_GREY_COLOR	3
+#define IMX214_TEST_PATTERN_PN9		4
+
+/* Test pattern colour components */
+#define IMX214_REG_TESTP_RED		CCI_REG16(0x0602)
+#define IMX214_REG_TESTP_GREENR		CCI_REG16(0x0604)
+#define IMX214_REG_TESTP_BLUE		CCI_REG16(0x0606)
+#define IMX214_REG_TESTP_GREENB		CCI_REG16(0x0608)
+#define IMX214_TESTP_COLOUR_MIN		0
+#define IMX214_TESTP_COLOUR_MAX		0x03ff
+#define IMX214_TESTP_COLOUR_STEP	1
+
 /* IMX214 native and active pixel array size */
 #define IMX214_NATIVE_WIDTH		4224U
 #define IMX214_NATIVE_HEIGHT		3136U
@@ -216,6 +233,22 @@ static const u32 imx214_mbus_formats[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
 };
 
+static const char * const imx214_test_pattern_menu[] = {
+	"Disabled",
+	"Color Bars",
+	"Solid Color",
+	"Grey Color Bars",
+	"PN9"
+};
+
+static const int imx214_test_pattern_val[] = {
+	IMX214_TEST_PATTERN_DISABLE,
+	IMX214_TEST_PATTERN_COLOR_BARS,
+	IMX214_TEST_PATTERN_SOLID_COLOR,
+	IMX214_TEST_PATTERN_GREY_COLOR,
+	IMX214_TEST_PATTERN_PN9,
+};
+
 struct imx214 {
 	struct device *dev;
 	struct clk *xclk;
@@ -818,6 +851,26 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(imx214->regmap, IMX214_REG_FRM_LENGTH_LINES,
 			  format->height + ctrl->val, &ret);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		cci_write(imx214->regmap, IMX214_REG_TEST_PATTERN,
+			  imx214_test_pattern_val[ctrl->val], &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_RED:
+		cci_write(imx214->regmap, IMX214_REG_TESTP_RED,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_GREENR:
+		cci_write(imx214->regmap, IMX214_REG_TESTP_GREENR,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_BLUE:
+		cci_write(imx214->regmap, IMX214_REG_TESTP_BLUE,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_GREENB:
+		cci_write(imx214->regmap, IMX214_REG_TESTP_GREENB,
+			  ctrl->val, &ret);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -845,14 +898,14 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	int exposure_max, exposure_def;
 	int hblank;
-	int ret;
+	int i, ret;
 
 	ret = v4l2_fwnode_device_parse(imx214->dev, &props);
 	if (ret < 0)
 		return ret;
 
 	ctrl_hdlr = &imx214->ctrls;
-	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 12);
+	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 13);
 	if (ret)
 		return ret;
 
@@ -909,6 +962,26 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 
 	v4l2_ctrl_cluster(2, &imx214->hflip);
 
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx214_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(imx214_test_pattern_menu) - 1,
+				     0, 0, imx214_test_pattern_menu);
+	for (i = 0; i < 4; i++) {
+		/*
+		 * The assumption is that
+		 * V4L2_CID_TEST_PATTERN_GREENR == V4L2_CID_TEST_PATTERN_RED + 1
+		 * V4L2_CID_TEST_PATTERN_BLUE   == V4L2_CID_TEST_PATTERN_RED + 2
+		 * V4L2_CID_TEST_PATTERN_GREENB == V4L2_CID_TEST_PATTERN_RED + 3
+		 */
+		v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
+				  V4L2_CID_TEST_PATTERN_RED + i,
+				  IMX214_TESTP_COLOUR_MIN,
+				  IMX214_TESTP_COLOUR_MAX,
+				  IMX214_TESTP_COLOUR_STEP,
+				  IMX214_TESTP_COLOUR_MAX);
+		/* The "Solid color" pattern is white by default */
+	}
+
 	imx214->unit_size = v4l2_ctrl_new_std_compound(ctrl_hdlr,
 				NULL,
 				V4L2_CID_UNIT_CELL_SIZE,

-- 
2.47.0



