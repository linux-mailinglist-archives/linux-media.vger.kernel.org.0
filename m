Return-Path: <linux-media+bounces-23662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D929F58E1
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8976D7A40C4
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BD71FBCA1;
	Tue, 17 Dec 2024 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4ScNTkO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0361FA251;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734471564; cv=none; b=KgZJ4hPBN9/V3XsJuFSQwmeZ9xTmVAHTFhmLo/eNcuWIhE1sLYXVQ8Xi5ZfU7t3af4rR3Zowkvprh4RNQFkKD2Eu6BB3L/BwyWTHezdePcoILOGd2i4uxzgTK6/+UZjJG9R7W8Vn3urfOdHSLpW3ES1yvwInDjZUNU/+XF98J64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734471564; c=relaxed/simple;
	bh=/R5+PURHVNV+AidcyiHwuNntLSQ9yjMOD3AT1C1w8VA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTVMKMCgYortU5oCZjceRpR9L1gZpxaIWflcLoG55z8s+s2haJrs0AuE5tPCU5Lw6qzo3P+BPB0gqCISxLF6qgUQ47EDxmrRzx/bKP/Dh2F8HleZPy4+vjy9p7CI4biX86OQDWqbDHvMFGsoAQINGfehK6hzUUy0R6i3/4b1thQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4ScNTkO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBDCDC4CEE3;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734471563;
	bh=/R5+PURHVNV+AidcyiHwuNntLSQ9yjMOD3AT1C1w8VA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F4ScNTkO2de2sp2ZLiKg6F/vUSWqDBW0WqsXggBpgpNJFNtwd0O3sn+CVcufUWD3d
	 epdkX3NPO7dPjaYjL8Fed4Xdw7C/sQQE5Z7vGCtWv9wdTqEXSTZwQpRfrFDJZbgA5W
	 5u9jc/C0T6Mp72JsPFEaXId3k5N/6qFXL63gDJ6MabFeH6zxfb93yxCjxfnaAJvVw3
	 lpjULtqFLBsIwKUTGrdSIio2e92RZTj2a40yL1afwHHrQO90exl1WMTtMlYvYZ6+bi
	 4I9lw7e8Z804VESv2Jji3p8kuPevbdOJXZ4dUngS1e1IFhhOzpxDfVj2cPtT9KJW4/
	 4XOKJZLjUcwjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15DEE7717F;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 17 Dec 2024 22:39:22 +0100
Subject: [PATCH v5 10/13] media: i2c: imx214: Verify chip ID
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241217-imx214-v5-10-387f52adef4d@apitzsch.eu>
References: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
In-Reply-To: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734471561; l=1922;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=SjjQSnd3Z9zd8sIb5Zrn2Vj58ylYHPSyPr5HnJXGY74=;
 b=4Ww1uytXFFxmtW+0gDfF3mXonfVr1JgpU9q4CtY2aCqFmmqlqL2iqRTha0uhYZRnEx94LrRu1
 ZhS+BxPIdj+Bb/rpTqbKhR+rtSqqQ3erKep6lCZeOrDEwQORr0mKAcR
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Check the chip ID and stop probing if it is no imx214 sensor.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 50dad9e1a90e56d0785c0f5067cc3fe18ebecf97..6b9584e330ddc17823cbb024e39f9c5fd54442bf 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -20,6 +20,10 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+/* Chip ID */
+#define IMX214_REG_CHIP_ID		CCI_REG16(0x0016)
+#define IMX214_CHIP_ID			0x0214
+
 #define IMX214_REG_MODE_SELECT		CCI_REG8(0x0100)
 #define IMX214_MODE_STANDBY		0x00
 #define IMX214_MODE_STREAMING		0x01
@@ -1101,6 +1105,27 @@ static int imx214_get_regulators(struct device *dev, struct imx214 *imx214)
 				       imx214->supplies);
 }
 
+/* Verify chip ID */
+static int imx214_identify_module(struct imx214 *imx214)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx214->sd);
+	int ret;
+	u64 val;
+
+	ret = cci_read(imx214->regmap, IMX214_REG_CHIP_ID, &val, NULL);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to read chip id %x\n",
+				     IMX214_CHIP_ID);
+
+	if (val != IMX214_CHIP_ID)
+		return dev_err_probe(&client->dev, -EIO,
+				     "chip id mismatch: %x!=%llx\n",
+				     IMX214_CHIP_ID, val);
+
+	return 0;
+}
+
 static int imx214_parse_fwnode(struct device *dev)
 {
 	struct fwnode_handle *endpoint;
@@ -1194,6 +1219,10 @@ static int imx214_probe(struct i2c_client *client)
 	 */
 	imx214_power_on(imx214->dev);
 
+	ret = imx214_identify_module(imx214);
+	if (ret)
+		goto error_power_off;
+
 	pm_runtime_set_active(imx214->dev);
 	pm_runtime_enable(imx214->dev);
 	pm_runtime_idle(imx214->dev);

-- 
2.47.1



