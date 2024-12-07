Return-Path: <linux-media+bounces-22836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3344F9E8215
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 21:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39AFB1884848
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 20:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCFD19C54B;
	Sat,  7 Dec 2024 20:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzjyLr8J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D621993B1;
	Sat,  7 Dec 2024 20:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733604508; cv=none; b=unDCrmooV+LHTVmgBMBzdqtamwkFsLk7eQ14w+1tu8apLywvXHnJBOKPL3Tq/wH4jYFHQKFPa2R24J89JNqm0dza5W3EOlRrD18k9okQLwYpEsc3j+htnVa7PvDBvHY8ufoysu4g79GGjwlouOZLo2rzyI0PQ5OBr5z3RlxjVYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733604508; c=relaxed/simple;
	bh=zJ6ZzWRB3Z3aFVEgu8oPRX3v0KpPSqQf6B9+ebnyGCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rCTPUBJx0S9+WzlnawWoa3r6Igy6LpDcUCdEw575UejdUF6pg2UDAEmP4uv5tlON/UT02GZDHPHa9QQoNzn75gnpdjg59gb/NgwltmpHgFNZtcTmhHOL1rm1KMUwWQvB+ytWuWArsA0ME2+z5OWL4ZjNEv4NqHJxBm9wgtuVYF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzjyLr8J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA579C4CEF5;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733604506;
	bh=zJ6ZzWRB3Z3aFVEgu8oPRX3v0KpPSqQf6B9+ebnyGCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kzjyLr8JuITI0bU7SgV/QyTCuZM7u6hvvpupK11hUUJzNoNg0Yvv/fDR3/IHtsECL
	 YxM5wCAkVLaWwCXk52N2hTRYi29OEX6/CoFbKC5NfO7e2w0IiAqXywDhHBaZTPmajB
	 Nw1Ovlz/GFKKvrMcCFb1Q9kzsFeDmDgaBputr54s3KeALNJ7/Cyqp5OPDiYUm/m2gD
	 5hCR8YqdkFWyKXLo174A3PEUbkAJ3sHfPGu/G6MmtvZKOnwmT52VHQM4Dn/Y1TFXmr
	 MRv5hs25qUnSQ8XxQiEy1Xs171S28pk9I2zD+Rqv2dHndJos/fn9wFn67iR0OWl8wM
	 8dFOY6AtRGM4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1440E77180;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 07 Dec 2024 21:47:59 +0100
Subject: [PATCH v3 10/12] media: i2c: imx214: Verify chip ID
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241207-imx214-v3-10-ab60af7ee915@apitzsch.eu>
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
In-Reply-To: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733604504; l=1922;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=TLL1L63CYz7vxWgfg6u2A7RVfVB86BDjDm4kG2L4gow=;
 b=hiIysf/xZoKo2oL7O428EUzFOxPOqrxDF9dOfDUbox1dr75KqpzKJXmds2TK/Eteviypfplcu
 rL6KlQ2m2tAD2P7VrH7lGSOw/mYr1nv+R72FkvF2pMXSf8yOA6nKjzJ
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
index a35e4e60e55c2b9d9e3090c98e695f78d099cf44..3cd64bb91795d8490acad5926940c111fb95fae5 100644
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
@@ -1092,6 +1096,27 @@ static int imx214_get_regulators(struct device *dev, struct imx214 *imx214)
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
@@ -1184,6 +1209,10 @@ static int imx214_probe(struct i2c_client *client)
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



