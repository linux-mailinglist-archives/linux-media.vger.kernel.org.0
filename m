Return-Path: <linux-media+bounces-19934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F289A5741
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 00:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 757911C20FBE
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 22:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC29319A285;
	Sun, 20 Oct 2024 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQs6RVDV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D21990DE;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729462452; cv=none; b=SfFZ2l6aocKQX3zDdhHLOpWpPEJrbtaHLd6DzpikcyXog5RRVHaDrTEGl5Nw38M+0tO28V/3WzU7Q+Ld7CJsL3SwGSwH2y8/DCmW0lScyVJ75/gxkPpgVN+xSv000wGbyR0XU3Rp8rLsh8pafYiHQpsWdBo3LNgDJpYopuw/iDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729462452; c=relaxed/simple;
	bh=Qh+HlbXBUo1VBQOn0w/yDvHmWcGb0zokAliDr8akBTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G78utLsgg3IicXptqgFZsZxfJI/28S0hsvST4WBzOoFDvpizs6RX2nyZhVZ8ZJd0uESwyfVw0AlnOJ6yN7bB+jNYXAlvPdqyAtqJs4rtXXiEIS7frpuyFdoth/pmtmY5FV6SgULipMp9qzAIS7i6Zu8Ru1M+QkcOUeCtVAt3M6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQs6RVDV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 521F2C116B1;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729462452;
	bh=Qh+HlbXBUo1VBQOn0w/yDvHmWcGb0zokAliDr8akBTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KQs6RVDVQnCNmxtGR1dzHHvW4LIzVpHpBWDfI77SecOtAgdNj7/2wZ9mBGhIsZxVM
	 vdGuz7JwuVogc7ocnYBD2dUVPhyNqifoAc9oJprDuvkLNYN1d1H1UTOBuCRfEXmeVf
	 eU3Lz+qpicpI8GfE+4kMj6dG3/e72ErRvWxZXG+noNscgpa7zA+ZmAy3FV021ywjjl
	 bLB6yzhnlV3/560RBfHbJF8FXPlp2ZdnOE88ehPK53c2qRTdmjFWvqvyWx4u2T9Yco
	 cM4WRDfrkH2fYhlbpjsl6dFhHeNZQyE/IL3BwaUg78V7B2MPA3QRA+70WMyuPscxXg
	 SkQFgvaZCWkXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46447D3C92D;
	Sun, 20 Oct 2024 22:14:12 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 21 Oct 2024 00:13:32 +0200
Subject: [PATCH v2 12/13] media: i2c: imx214: Verify chip ID
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241021-imx214-v2-12-fbd23e99541e@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729462449; l=1945;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=FA2ltgR03XIW0MQOGKvnA0vnMK8r1SAa9oWfLEnwbTQ=;
 b=PApl0rElYHQfB3MaLLW/CWU7C26ValY60tGgDfCIr/O2gYstJmom02lr+ZjXlBWvqnYxo4sW4
 6/+sJv6qT0pCpf3ckHdD4+RSDSZevrTBnLO0gqgi8wI4FzGymaEV2pU
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
index ad1f88057ac47ae0d494d7a10520fabf969315ed..46f3e27371d8075517a75891e6a742912c2a3604 100644
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
@@ -1153,6 +1157,27 @@ static int imx214_get_regulators(struct device *dev, struct imx214 *imx214)
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
@@ -1245,6 +1270,10 @@ static int imx214_probe(struct i2c_client *client)
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
2.47.0



