Return-Path: <linux-media+bounces-23907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F416F9F9338
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 578F216AEB2
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5578218830;
	Fri, 20 Dec 2024 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KM/u8tXH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794372165EB;
	Fri, 20 Dec 2024 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701194; cv=none; b=nZiyKve6j2qKedzbDZz2e+9sShtmV3e/crtaj9x/qIBsBFuZ6f2yOtaPX8+52Mm0rBaqxelnJ1ehj7HA0UjPLDzqhQIM/RsVHr5A6N/s7P9sRpgvuT3pAOvX+gVwls1QQmaSnuCtP9aEBQQJgniiWtTDNZHCnhWPTQrwNROG5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701194; c=relaxed/simple;
	bh=/R5+PURHVNV+AidcyiHwuNntLSQ9yjMOD3AT1C1w8VA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gk1ct2IDafkyNhijpQMVpC6tyx4mcabGCtuW3ozSjJC2G9ZUzQ2qFdGNEx98d+bF+Q3DLYvEAktCsYt51S1absMQV09pKZMVB0r29tSHcXK55mdyTXgTrPykDeRcZC0iFDPjweZUxcTC1A3yHWUJLW2jx+sgNKbxjE2UwoBzpv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KM/u8tXH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57A65C4AF09;
	Fri, 20 Dec 2024 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734701194;
	bh=/R5+PURHVNV+AidcyiHwuNntLSQ9yjMOD3AT1C1w8VA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KM/u8tXHQH1U1kUlwGIp/zjvPI6au7mwuVs1zUz/BCUQy+wmdkcN/ecz5CBRBwcPF
	 yWk0Q8sAbrzyLVaMlGYSpQTXOhV5wwHLOQdABhIrnhw5n2uajdMrPbTXDHp1Tu3mvM
	 EMRVo3m9KgJ8Z+HZiFvEXUPtHv5qn1lqpsOYhk6IDWixASxl/ljrotp+d2wB20+shL
	 aaMpGaBsPT6bBay4l1RzcwY2cDHSi9MU+vhOCwVPvlz8+6PqxJ6cj8NLnovPZUE/CN
	 dHl/nTXeyG9HcD1p+b6xvHTPJHHcvj2B+V8oCEHJK+70xWK0QFDeYyWWa9MQQbWDBx
	 EsfFsMYL1x5Mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1A3E77188;
	Fri, 20 Dec 2024 13:26:34 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 20 Dec 2024 14:26:09 +0100
Subject: [PATCH v6 10/13] media: i2c: imx214: Verify chip ID
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241220-imx214-v6-10-d90a185d82e5@apitzsch.eu>
References: <20241220-imx214-v6-0-d90a185d82e5@apitzsch.eu>
In-Reply-To: <20241220-imx214-v6-0-d90a185d82e5@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734701191; l=1922;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=SjjQSnd3Z9zd8sIb5Zrn2Vj58ylYHPSyPr5HnJXGY74=;
 b=SZH1F3RGQ7oockYP1UK3ByrdREMljohmXVdxLkso3DUVuag8IJpohGpovSIcIrR+q3b7aeSVQ
 0Zg9RZLCX9TB8cmekNCG6jQKyl/RB7S2Z+phV4FzDjUrRp926/6QTnj
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



