Return-Path: <linux-media+bounces-17415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBE3968F4C
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA281B2135D
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4047F188A00;
	Mon,  2 Sep 2024 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5koVRdJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E02187874;
	Mon,  2 Sep 2024 21:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314032; cv=none; b=PDKmEjv3kFgm9JGdnLq2BF+FO0+xNDXMwFqck0g7OR1PGyPRrHPWV+t44vnzitoLWurlmaT0+5TXVIz3jtVjNUCBKP+07JeCc/dTH1yfyQn27cw4MQLOZWSMp13wT8jEADlBk9AtLzYn7bDqEDNP03uw9PJgcD3P7WMvrdQHSYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314032; c=relaxed/simple;
	bh=6ZX91TLKHmRY61/QEQQbK7aRUvLFh3CnmWFwFI398Co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hVBz3vcqZ4jEM7LTOOSxiJlco5jTd8a4MO5M62Pb5i6Sz8c3KHjHT9AdCNlwjMod8Dwt/gL5SeZgawlI+ammtnyTgNOwtRx3WoNfVU8rUwvaBIX/sZsYw5+OsRGoNR1Iv0uUttoD6ic9Xz3Q9jDIiNdv4ZPsSpVIz9HXpCkTLgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5koVRdJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0AEDC4CEE1;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725314032;
	bh=6ZX91TLKHmRY61/QEQQbK7aRUvLFh3CnmWFwFI398Co=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o5koVRdJZlZ1EN/2Z2zPcK4DN5mjFjQLx7GwE0M7aqBFASVENb8Y0ZGasUGh0ied9
	 64VHfoMLDYsojkqlTHNlWN8Gdy6hmw5Qr9W4Jbo1bGv1KxuePH1h4xfWiPHdPy0N04
	 65ctTaZYH1txrrES1Ez969Qz9J4Ar1NvfF9SSx6/m0d3bYqDPoPZZ75EyVdDb0RAqg
	 tb4ptH18svCor2mn8NCTGs38wXnAtPLAt4GXW1C6M1yEBIcGSltgRvzWBWb1V/vjcd
	 OAY5679M3Uq/s3DxgWyUO9xSxr0rHbF12xKnyI0vijlBXw94qHlLUV2vC4xkL3iUgp
	 +zH6/bmaOsA/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85D9CA0ED3;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 02 Sep 2024 23:54:39 +0200
Subject: [PATCH 12/13] media: i2c: imx214: Verify chip ID
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240902-imx214-v1-12-c96cba989315@apitzsch.eu>
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725314079; l=1839;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=5SMLl9gufO5wK+wI56UIoUmRDE0mZCVW7My7pmkCiAM=;
 b=GCd1aPUSZvPDQFzZEmpk+LYDo6XYKl0ZEUb69Bxzo1wcISF+MIHCTxOKctOsYvjAFaThJ+ZqN
 zsY6w3QhAfdBs6j6dl3WHRYmjQeVJ1ETr6B9qUQrLVqQmkCedGoULw7
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Check the chip ID and stop probing if it is no imx214 sensor.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index ce6d8a90f4a1..6493a9b9ea88 100644
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
@@ -1168,6 +1172,27 @@ static int imx214_get_regulators(struct device *dev, struct imx214 *imx214)
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
 static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214)
 {
 	struct fwnode_handle *endpoint;
@@ -1261,6 +1286,10 @@ static int imx214_probe(struct i2c_client *client)
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
2.46.0



