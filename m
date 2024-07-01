Return-Path: <linux-media+bounces-14461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73B91DB7B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 11:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 603001C22FE7
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 09:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA0D12B163;
	Mon,  1 Jul 2024 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MWjzv1j5"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F49A54BE7;
	Mon,  1 Jul 2024 09:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719826333; cv=none; b=Aeg5+cXLFb8jBEqC6B8xr8i/i10v38q6DW3Se71finw3qRXnIf8PYeeEYtarUxHNnoubQaGL3kAvTJE3gye9L9YocCeTOs9wXITXw/jNVVGKfhdp5KgHBcSs+A5Li2OrTXY+l1xsSiePMb4E9BxmrYj0eGVIak4QfW2GMOvmZp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719826333; c=relaxed/simple;
	bh=VMgM4mq4OlaMMrHC+Y9huXojCwkPyNZaSwxW87cG/84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a4jZUgfioZx5EwdKD8CHYqKK5S4BqhuDjGzh5NXwnFwNeP7zR+LStuS0bkiIHgW6y81tLya3iqRm4fcQEJIXAeeQTdTGgHwwM73PcPPwCifADc9k+Ws4wPSU5+CiDrV+b4FEPD41vVIyvyZUJdx2OBPkRykWYvd7RMtiIWm7+n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MWjzv1j5; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719826330;
	bh=VMgM4mq4OlaMMrHC+Y9huXojCwkPyNZaSwxW87cG/84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MWjzv1j5XpY2hHiPP5Y3CjQ5ClF65hCDFrF6yqEPn6R0qnUidK1FBt3uqCzyP0WLF
	 ne8/LZ7+fwiQ/SCK3AxBMjOaNS22dV00rg5m1rG1QTtr0co14opQ30LHHpyevzu6f6
	 wSA7lJrzaXbkxjjtgx7eIfP2wVxWhTfhr6FbnY7mOaSW8brKQ2L7I1sCjXdM+TCyTk
	 bPY5sFq8oRzRvuhNKwn17yLynPfXmh5fS9EtENzsIfOaN/tjvRzLHSVMyqzAovnV1p
	 JKdPyHGjli4/dzamWyseErmi0qtxDwrTmTKpEGvbvH9e95n7aVIBy+8DHX/NBPsvAR
	 2QQpv2gAK43ng==
Received: from fedora.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 653B1378216D;
	Mon,  1 Jul 2024 09:32:10 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
Date: Mon, 01 Jul 2024 11:31:43 +0200
Subject: [PATCH v2 2/2] media: i2c: max96714: coding style fixes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-gmsl2-drivers-style-fixup-v2-2-6b02bd6c1e41@collabora.com>
References: <20240701-gmsl2-drivers-style-fixup-v2-0-6b02bd6c1e41@collabora.com>
In-Reply-To: <20240701-gmsl2-drivers-style-fixup-v2-0-6b02bd6c1e41@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Julien Massot <julien.massot@collabora.com>, 
 20240627151806.3999400-2-tomm.merciai@gmail.com
X-Mailer: b4 0.14.0

Coding style fixes suggested by Sakari during the
driver review.

Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/i2c/max96714.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index c97de66631e0..159753b13777 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -25,6 +25,7 @@
 #define MAX96714_NPORTS     2
 #define MAX96714_PAD_SINK   0
 #define MAX96714_PAD_SOURCE 1
+#define MAX96714_CSI_NLANES 4
 
 /* DEV */
 #define MAX96714_REG13                 CCI_REG8(0x0d)
@@ -52,9 +53,9 @@
 #define MAX96714_PATGEN_V2D            CCI_REG24(0x254)
 #define MAX96714_PATGEN_DE_HIGH        CCI_REG16(0x257)
 #define MAX96714_PATGEN_DE_LOW         CCI_REG16(0x259)
-#define MAX96714_PATGEN_DE_CNT         CCI_REG16(0x25B)
+#define MAX96714_PATGEN_DE_CNT         CCI_REG16(0x25b)
 #define MAX96714_PATGEN_GRAD_INC       CCI_REG8(0x25d)
-#define MAX96714_PATGEN_CHKB_COLOR_A   CCI_REG24(0x25E)
+#define MAX96714_PATGEN_CHKB_COLOR_A   CCI_REG24(0x25e)
 #define MAX96714_PATGEN_CHKB_COLOR_B   CCI_REG24(0x261)
 #define MAX96714_PATGEN_CHKB_RPT_CNT_A CCI_REG8(0x264)
 #define MAX96714_PATGEN_CHKB_RPT_CNT_B CCI_REG8(0x265)
@@ -724,8 +725,9 @@ static int max96714_init_tx_port(struct max96714_priv *priv)
 	 * Unused lanes need to be mapped as well to not have
 	 * the same lanes mapped twice.
 	 */
-	for (; lane < 4; lane++) {
-		unsigned int idx = find_first_zero_bit(&lanes_used, 4);
+	for (; lane < MAX96714_CSI_NLANES; lane++) {
+		unsigned int idx = find_first_zero_bit(&lanes_used,
+						       MAX96714_CSI_NLANES);
 
 		val |= idx << (lane * 2);
 		lanes_used |= BIT(idx);
@@ -757,9 +759,7 @@ static int max96714_rxport_disable_poc(struct max96714_priv *priv)
 static int max96714_parse_dt_txport(struct max96714_priv *priv)
 {
 	struct device *dev = &priv->client->dev;
-	struct v4l2_fwnode_endpoint vep = {
-		.bus_type = V4L2_MBUS_CSI2_DPHY
-	};
+	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
 	struct fwnode_handle *ep_fwnode;
 	u32 num_data_lanes;
 	int ret;
@@ -791,14 +791,14 @@ static int max96714_parse_dt_txport(struct max96714_priv *priv)
 	}
 
 	num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
-	if (num_data_lanes < 1 || num_data_lanes > 4) {
+	if (num_data_lanes < 1 || num_data_lanes > MAX96714_CSI_NLANES) {
 		dev_err(dev,
 			"tx: invalid number of data lanes must be 1 to 4\n");
 		ret = -EINVAL;
 		goto err_free_vep;
 	}
 
-	memcpy(&priv->mipi_csi2, &vep.bus.mipi_csi2, sizeof(priv->mipi_csi2));
+	priv->mipi_csi2 = vep.bus.mipi_csi2;
 
 err_free_vep:
 	v4l2_fwnode_endpoint_free(&vep);

-- 
2.45.2


