Return-Path: <linux-media+bounces-14460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF1991DB79
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 11:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E52081C2301B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 09:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD9A53804;
	Mon,  1 Jul 2024 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VZMf8k3w"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F4A54BD8;
	Mon,  1 Jul 2024 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719826333; cv=none; b=MV01vDoiqz3Jl04nvS49nORxtGm0OdBsES4v56X4qRLJAh3iucdVsGz+lzz+8XW4tbPJTCf7x5mLcyuOToT/zt22JQfPzP543L7UEPVh/TMqmpnbB4fuU5JNzA/rqiIXrdomszWEHHC0F0Ey3QtUwqp0WINFu09TKcKZDD9UITQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719826333; c=relaxed/simple;
	bh=WeWKKZqLhakvLMWL8LvQjYmrYXgSqLKPuKERp+T5uDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IdTm1BT57zS3a64oCK62UPu4o/pdeZDovx51npIYDd6i1z1OZgCqZJv4OLQUJrs7a7PgswzJwU68sIQdGcTN9FCYfofmyAz74BIb4+xkeFABhVT78Z9CIi0HVcSr7VHqamXhkn0hKx0e9ekjjKDMAYhm9pAiEIxF6G4SjNnQef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VZMf8k3w; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719826330;
	bh=WeWKKZqLhakvLMWL8LvQjYmrYXgSqLKPuKERp+T5uDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZMf8k3wK6Iz08ROQ//foT2YSvQFetwSFP7bqvDoxX081uKDegZQrp+jIe6iPcPBS
	 t5b2nH9/CH9VqcFDyI8REXjZgUgWlV6037eg3tSay+CB/VkMNQnLBwoHDoCJ6kugQ/
	 VQLGmAI6We824hrXhJH5Kv0V5d2XoIBl2056sLNtuitrwzWq4D+rCRm3MQqo45KBPk
	 xPYWSYlXrQ0lWGxn8t3C9GITC3SuhpgPDNdtosB3McjKQvWIvq3kDfHyLkKKFgpd2c
	 VRYSdODZoHbAEPFiOLV+5CHmJuU3InZmuhhlba7UiDmPDPAHjh0apO8acnynTA1TGC
	 wefJ702Lcnnrg==
Received: from fedora.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D720C378210B;
	Mon,  1 Jul 2024 09:32:09 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
Date: Mon, 01 Jul 2024 11:31:42 +0200
Subject: [PATCH v2 1/2] media: i2c: max96717: coding style fixes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-gmsl2-drivers-style-fixup-v2-1-6b02bd6c1e41@collabora.com>
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

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/i2c/max96717.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 859a439b64d9..4e85b8eb1e77 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -25,6 +25,7 @@
 #define MAX96717_PORTS      2
 #define MAX96717_PAD_SINK   0
 #define MAX96717_PAD_SOURCE 1
+#define MAX96717_CSI_NLANES 4
 
 #define MAX96717_DEFAULT_CLKOUT_RATE	24000000UL
 
@@ -495,7 +496,6 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
 				   u64 streams_mask)
 {
 	struct max96717_priv *priv = sd_to_max96717(sd);
-	struct device *dev = &priv->client->dev;
 	u64 sink_streams;
 	int ret;
 
@@ -516,11 +516,8 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
 		ret = v4l2_subdev_enable_streams(priv->source_sd,
 						 priv->source_sd_pad,
 						 sink_streams);
-		if (ret) {
-			dev_err(dev, "Fail to start streams:%llu on remote subdev\n",
-				sink_streams);
+		if (ret)
 			goto stop_csi;
-		}
 	}
 
 	priv->enabled_source_streams |= streams_mask;
@@ -530,6 +527,7 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
 stop_csi:
 	if (!priv->enabled_source_streams)
 		max96717_start_csi(priv, false);
+
 	return ret;
 }
 
@@ -769,11 +767,8 @@ max96717_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 static unsigned int max96717_clk_find_best_index(struct max96717_priv *priv,
 						 unsigned long rate)
 {
-	unsigned int i, idx;
-	unsigned long diff_new, diff_old;
-
-	diff_old = U32_MAX;
-	idx = 0;
+	unsigned int i, idx = 0;
+	unsigned long diff_new, diff_old = U32_MAX;
 
 	for (i = 0; i < ARRAY_SIZE(max96717_predef_freqs); i++) {
 		diff_new = abs(rate - max96717_predef_freqs[i].freq);
@@ -860,8 +855,7 @@ static int max96717_register_clkout(struct max96717_priv *priv)
 	struct clk_init_data init = { .ops = &max96717_clk_ops };
 	int ret;
 
-	init.name = kasprintf(GFP_KERNEL, "max96717.%s.clk_out",
-			      dev_name(dev));
+	init.name = kasprintf(GFP_KERNEL, "max96717.%s.clk_out", dev_name(dev));
 	if (!init.name)
 		return -ENOMEM;
 
@@ -944,8 +938,9 @@ static int max96717_init_csi_lanes(struct max96717_priv *priv)
 	 * Unused lanes need to be mapped as well to not have
 	 * the same lanes mapped twice.
 	 */
-	for (; lane < 4; lane++) {
-		unsigned int idx = find_first_zero_bit(&lanes_used, 4);
+	for (; lane < MAX96717_CSI_NLANES; lane++) {
+		unsigned int idx = find_first_zero_bit(&lanes_used,
+						       MAX96717_CSI_NLANES);
 
 		val |= idx << (lane * 2);
 		lanes_used |= BIT(idx);
@@ -999,9 +994,7 @@ static int max96717_hw_init(struct max96717_priv *priv)
 static int max96717_parse_dt(struct max96717_priv *priv)
 {
 	struct device *dev = &priv->client->dev;
-	struct v4l2_fwnode_endpoint vep = {
-		.bus_type = V4L2_MBUS_CSI2_DPHY
-	};
+	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
 	struct fwnode_handle *ep_fwnode;
 	unsigned char num_data_lanes;
 	int ret;
@@ -1019,11 +1012,11 @@ static int max96717_parse_dt(struct max96717_priv *priv)
 		return dev_err_probe(dev, ret, "Failed to parse sink endpoint");
 
 	num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
-	if (num_data_lanes < 1 || num_data_lanes > 4)
+	if (num_data_lanes < 1 || num_data_lanes > MAX96717_CSI_NLANES)
 		return dev_err_probe(dev, -EINVAL,
 				     "Invalid data lanes must be 1 to 4\n");
 
-	memcpy(&priv->mipi_csi2, &vep.bus.mipi_csi2, sizeof(priv->mipi_csi2));
+	priv->mipi_csi2 = vep.bus.mipi_csi2;
 
 	return 0;
 }

-- 
2.45.2


