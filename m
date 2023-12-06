Return-Path: <linux-media+bounces-1780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A9C807B80
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 23:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12B191C21172
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 22:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0254047F5C;
	Wed,  6 Dec 2023 22:39:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de [80.67.31.30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7520ED5E;
	Wed,  6 Dec 2023 14:39:11 -0800 (PST)
Received: from [92.206.191.209] (helo=note-book.lan)
	by smtprelay03.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <git@apitzsch.eu>)
	id 1rB0TH-0007Ur-2z;
	Wed, 06 Dec 2023 23:34:23 +0100
From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Date: Wed, 06 Dec 2023 23:33:56 +0100
Subject: [PATCH v4 2/4] media: i2c: imx214: Move controls init to separate
 function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231206-imx214-v4-2-7ef604b01dcb@apitzsch.eu>
References: <20231206-imx214-v4-0-7ef604b01dcb@apitzsch.eu>
In-Reply-To: <20231206-imx214-v4-0-7ef604b01dcb@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Level: *

Code refinement.

While at it, don't destroy the mutex not initialized yet if the controls
are initialized incorrectly.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 115 ++++++++++++++++++++++++++-------------------
 1 file changed, 67 insertions(+), 48 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 7c9a240026c4..e460030a601b 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -695,6 +695,69 @@ static const struct v4l2_ctrl_ops imx214_ctrl_ops = {
 	.s_ctrl = imx214_set_ctrl,
 };
 
+static int imx214_ctrls_init(struct imx214 *imx214)
+{
+	static const s64 link_freq[] = {
+		IMX214_DEFAULT_LINK_FREQ
+	};
+	static const struct v4l2_area unit_size = {
+		.width = 1120,
+		.height = 1120,
+	};
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	int ret;
+
+	ctrl_hdlr = &imx214->ctrls;
+	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 3);
+	if (ret)
+		return ret;
+
+	imx214->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
+					       V4L2_CID_PIXEL_RATE, 0,
+					       IMX214_DEFAULT_PIXEL_RATE, 1,
+					       IMX214_DEFAULT_PIXEL_RATE);
+
+	imx214->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL,
+						   V4L2_CID_LINK_FREQ,
+						   ARRAY_SIZE(link_freq) - 1,
+						   0, link_freq);
+	if (imx214->link_freq)
+		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	/*
+	 * WARNING!
+	 * Values obtained reverse engineering blobs and/or devices.
+	 * Ranges and functionality might be wrong.
+	 *
+	 * Sony, please release some register set documentation for the
+	 * device.
+	 *
+	 * Yours sincerely, Ricardo.
+	 */
+	imx214->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     IMX214_EXPOSURE_MIN,
+					     IMX214_EXPOSURE_MAX,
+					     IMX214_EXPOSURE_STEP,
+					     IMX214_EXPOSURE_DEFAULT);
+
+	imx214->unit_size = v4l2_ctrl_new_std_compound(ctrl_hdlr,
+				NULL,
+				V4L2_CID_UNIT_CELL_SIZE,
+				v4l2_ctrl_ptr_create((void *)&unit_size));
+
+	ret = ctrl_hdlr->error;
+	if (ret) {
+		v4l2_ctrl_handler_free(ctrl_hdlr);
+		dev_err(imx214->dev, "failed to add controls: %d\n", ret);
+		return ret;
+	}
+
+	imx214->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+};
+
 #define MAX_CMD 4
 static int imx214_write_table(struct imx214 *imx214,
 			      const struct reg_8 table[])
@@ -918,13 +981,6 @@ static int imx214_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct imx214 *imx214;
-	static const s64 link_freq[] = {
-		IMX214_DEFAULT_LINK_FREQ,
-	};
-	static const struct v4l2_area unit_size = {
-		.width = 1120,
-		.height = 1120,
-	};
 	int ret;
 
 	ret = imx214_parse_fwnode(dev);
@@ -979,48 +1035,10 @@ static int imx214_probe(struct i2c_client *client)
 	pm_runtime_enable(imx214->dev);
 	pm_runtime_idle(imx214->dev);
 
-	v4l2_ctrl_handler_init(&imx214->ctrls, 3);
-
-	imx214->pixel_rate = v4l2_ctrl_new_std(&imx214->ctrls, NULL,
-					       V4L2_CID_PIXEL_RATE, 0,
-					       IMX214_DEFAULT_PIXEL_RATE, 1,
-					       IMX214_DEFAULT_PIXEL_RATE);
-	imx214->link_freq = v4l2_ctrl_new_int_menu(&imx214->ctrls, NULL,
-						   V4L2_CID_LINK_FREQ,
-						   ARRAY_SIZE(link_freq) - 1,
-						   0, link_freq);
-	if (imx214->link_freq)
-		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
-	/*
-	 * WARNING!
-	 * Values obtained reverse engineering blobs and/or devices.
-	 * Ranges and functionality might be wrong.
-	 *
-	 * Sony, please release some register set documentation for the
-	 * device.
-	 *
-	 * Yours sincerely, Ricardo.
-	 */
-	imx214->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
-					     V4L2_CID_EXPOSURE,
-					     IMX214_EXPOSURE_MIN,
-					     IMX214_EXPOSURE_MAX,
-					     IMX214_EXPOSURE_STEP,
-					     IMX214_EXPOSURE_DEFAULT);
-
-	imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
-				NULL,
-				V4L2_CID_UNIT_CELL_SIZE,
-				v4l2_ctrl_ptr_create((void *)&unit_size));
-	ret = imx214->ctrls.error;
-	if (ret) {
-		dev_err(&client->dev, "%s control init failed (%d)\n",
-			__func__, ret);
-		goto free_ctrl;
-	}
+	ret = imx214_ctrls_init(imx214);
+	if (ret < 0)
+		goto error_power_off;
 
-	imx214->sd.ctrl_handler = &imx214->ctrls;
 	mutex_init(&imx214->mutex);
 	imx214->ctrls.lock = &imx214->mutex;
 
@@ -1050,6 +1068,7 @@ static int imx214_probe(struct i2c_client *client)
 free_ctrl:
 	mutex_destroy(&imx214->mutex);
 	v4l2_ctrl_handler_free(&imx214->ctrls);
+error_power_off:
 	pm_runtime_disable(imx214->dev);
 
 	return ret;

-- 
2.43.0


