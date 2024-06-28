Return-Path: <linux-media+bounces-14336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E291BE98
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 14:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BA511F25BBB
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 12:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B725158A3D;
	Fri, 28 Jun 2024 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZeyLx3nz"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B9C155A23;
	Fri, 28 Jun 2024 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719577797; cv=none; b=PLK6ybBRCYn5nHgd/IIslHDvv8aH7FQ+S/YY4qgPKhIqIYQ3CsueBadm1a+Wx9qrNCn6I/SSi7hdZpJjNvmnJEfEAKEsUJjP44BVBtBWOUM3vB/WE+fKIYJCquBN5U1TEecX+G1sU16r1kjqhIzNBUe3/MinNKraHR5aM1fYpjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719577797; c=relaxed/simple;
	bh=yEQr99rijvwGizsFjRjgK5Gbt0tm8scf9viPfn1GvnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fj75h7nz5Sn3aUG01XGTc6bA0yn0iRmgW0HwI0Cie8dZVqtu1S4jjRSqDwKPj8wwmRrEQElZQn7JYampVDgZZmsohykBUVlau7iRhhZBLEVMDEiF2sGQwqvOog+1HXAM0Wnp6P9hl4vz3R2xMDHgNLr+EusO/2DVdePrrmRvyvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZeyLx3nz; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719577794;
	bh=yEQr99rijvwGizsFjRjgK5Gbt0tm8scf9viPfn1GvnM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZeyLx3nzuQEcBinIJzPsUZxcXU12jndKTe10wZoAWy+28Bh1OaWk2jT8p/rf5k/oG
	 qzZw6TsRXSOcTwqnJhqtipjDpXxcRdbwScZQkAwtB8U9D5mhsAORd07yZwfU0yXCD9
	 rSe47MI8OyhlyfpyrSAS9b6dd0wOcyxdx0sDx5S7/0Akv8U7n+fILlKcBLYz1ysogk
	 0TkxWFuJVDnJdHXaDAG+GXBW2Ct2+2gSvXnftEKtLngiM8RbXKynaVYI9ElwgLSStf
	 QmoeIzzFwp8wpzlm6In9h5me6G6tJGCde+jXtpHkVx14YfVzFxe95jCFNqavxq8bwx
	 GR7MNASS8aiAQ==
Received: from fedora.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5E13A3782200;
	Fri, 28 Jun 2024 12:29:54 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 28 Jun 2024 14:29:28 +0200
Subject: [PATCH 2/2] media: i2c: max96714: coding style fixes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-gmsl2-drivers-style-fixup-v1-2-a4bb49f4c7a1@collabora.com>
References: <20240628-gmsl2-drivers-style-fixup-v1-0-a4bb49f4c7a1@collabora.com>
In-Reply-To: <20240628-gmsl2-drivers-style-fixup-v1-0-a4bb49f4c7a1@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Julien Massot <julien.massot@collabora.com>, 
 20240627151806.3999400-2-tomm.merciai@gmail.com
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719577793; l=2122;
 i=julien.massot@collabora.com; s=20240628; h=from:subject:message-id;
 bh=yEQr99rijvwGizsFjRjgK5Gbt0tm8scf9viPfn1GvnM=;
 b=3FkDsozINAJD7DgH6gB39EA2uT/nx7HUzDzQsc+qRDbQOEpQmQkCp4xCLHYzINgB2q0NKccdB
 gGUizFOf8tyCSpAmnSU8R1szGwRQg01T8EWmnq+YPAewcrntM7Pi3eP
X-Developer-Key: i=julien.massot@collabora.com; a=ed25519;
 pk=upOGEnAvrsJB2Icg0lU3KQah5azRr6NNj9LMEeI1c88=

Coding style fixes suggested by Sakari during the
driver review.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/i2c/max96714.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index c97de66631e0..c738908bf141 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -25,6 +25,7 @@
 #define MAX96714_NPORTS     2
 #define MAX96714_PAD_SINK   0
 #define MAX96714_PAD_SOURCE 1
+#define MAX96714_CSI_NLANES 4
 
 /* DEV */
 #define MAX96714_REG13                 CCI_REG8(0x0d)
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


