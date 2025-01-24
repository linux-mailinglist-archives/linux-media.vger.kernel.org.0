Return-Path: <linux-media+bounces-25279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C66A1B902
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18DF67A602E
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FCE221D92;
	Fri, 24 Jan 2025 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iE27lJ73"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61963220699;
	Fri, 24 Jan 2025 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731915; cv=none; b=KfdnCgIegDHpk9nvWCxAume6HgX6bNVGxzKPVbwmYnMviD0DRjfOsmexIHsEnMqL8/rmDs4Fr173beCrai49SaXVFscg3gR9tzNyy6Er+72ZCUPhJMViKKRJo0U9VY0h6xawHnpumAoxFALU25z2l1GaPhKuA5LJEhdKcjpLOW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731915; c=relaxed/simple;
	bh=aMzTw3m2IXfT2B1cdcJzjng6lSwwJSqSBJ5aGIXCVNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmiXiozfCIgIxF7hB8g5l96l4lXlxDa0yW3eL4RRAZGsYasbF07ahgK1Q3U/bsgGmyUhfxR3LwIxWcf+kU5pBmjFeYJWtzMEIgH6Z728JcCyFwmkZCfIQevh6CIRH4HlBKkkSan9qEWoCXGl460OLdbqtUtHkaHPeCKPyMKviqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iE27lJ73; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F2CF564;
	Fri, 24 Jan 2025 16:17:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731834;
	bh=aMzTw3m2IXfT2B1cdcJzjng6lSwwJSqSBJ5aGIXCVNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iE27lJ73DKS8px4gHuN4D29e+jBd98PqDCrDykJUgm60bzcn9Bh2nC9PZiiIUQlCP
	 cijDfqXFpC4rIyy+dbNlgfJmCA4p195bJJ1QfcR8OsAQKoVbjgenJc+nzw/JabFOEH
	 Oyu/kubwZMm5m+1HMIIfd8jO/EEZHnmUtPL8eNOk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:48 +0200
Subject: [PATCH v2 11/22] media: i2c: ds90ub960: Split
 ub960_init_tx_ports()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-11-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3822;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=aMzTw3m2IXfT2B1cdcJzjng6lSwwJSqSBJ5aGIXCVNM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68v/HjirgxklsduXiincAj/QaiGfFxoQIgWb
 yrw+QmQQHSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvLwAKCRD6PaqMvJYe
 9emdD/4xN3xTEbaYCov7eBNo7Og1ssNWJMINgYPSP1SkM2kJfCIM67NkHqlKeETFwV+xLjhg2U0
 00KouA/0DQnmFKQfsQJxyAO9TCEQgs7q6K8kH/BpeJwG0Zj/7gCxC0QgGWyEBKT4IXcYaYhlu7L
 omgBHQV+Y+90b868iF25BCIpd6x8iXV5RY3oskTq39uSPi/+4i8Sn2DYBECNeMO8O3U8WoKKZeF
 +a92gLROQgPhx9MNVfLn22Y8Z2IHLxwcwqnhcrVNnV/7AjASSuVBOf+rDNoFqp8qVSiS3d0Lkvv
 VVgzn5fXwQJXY3WbmhPKQ8ZHpLdYjn950dEGM/tiUIPPErGkszMX8d7eapjShrDVEF2YhQgY1UY
 iodumQqGziC9hmUGJ0Gxe7pPleOH5JQXAdP6ga0vgBw7sOgkhPbvsFCejt5/6rEMxS/Gn0WWbML
 gyx8HjRNRiq3gy/wOU+MK8alBdjhSP9WdEqlkjQSdsEjxdT9vAQ+HJg5tJ0lfCo0nB9qZF19qx1
 NIjauTW5AIvouXRzxOBPR+qin7Y8v6o4MqUe0p/oZ51nD/poPsYTCUT/jNq1kdeCVb7l8ObAXTD
 UVkZCo5QSSHrm6ZDZ8j94WcZQNW5QAG8SfTei3Fj9fZyG0EFJg6gO0IMtP0iw0Ar0o5vxTcfzTi
 CtOzD1NXPJX5/HQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Split ub960_init_tx_ports() to a UB960 and a UB9702 versions to make it
easier to update the UB9702 version in the following patch.

No funcional changes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 105 +++++++++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index a890097ad105..3b3e756af86b 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1992,67 +1992,98 @@ static int ub960_init_tx_port(struct ub960_data *priv,
 	return ub960_txport_write(priv, nport, UB960_TR_CSI_CTL, csi_ctl, NULL);
 }
 
-static int ub960_init_tx_ports(struct ub960_data *priv)
+static int ub960_init_tx_ports_ub960(struct ub960_data *priv)
 {
-	unsigned int nport;
 	u8 speed_select;
-	u8 pll_div;
-	int ret = 0;
-
-	/* TX ports */
 
 	switch (priv->tx_data_rate) {
+	case MHZ(400):
+		speed_select = 3;
+		break;
+	case MHZ(800):
+		speed_select = 2;
+		break;
+	case MHZ(1200):
+		speed_select = 1;
+		break;
 	case MHZ(1600):
 	default:
 		speed_select = 0;
-		pll_div = 0x10;
 		break;
-	case MHZ(1200):
-		speed_select = 1;
-		pll_div = 0x18;
+	}
+
+	return ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select, NULL);
+}
+
+static int ub960_init_tx_ports_ub9702(struct ub960_data *priv)
+{
+	u8 speed_select;
+	u8 pll_div;
+	int ret = 0;
+
+	switch (priv->tx_data_rate) {
+	case MHZ(400):
+		speed_select = 3;
+		pll_div = 0x10;
 		break;
 	case MHZ(800):
 		speed_select = 2;
 		pll_div = 0x10;
 		break;
-	case MHZ(400):
-		speed_select = 3;
+	case MHZ(1200):
+		speed_select = 1;
+		pll_div = 0x18;
+		break;
+	case MHZ(1600):
+	default:
+		speed_select = 0;
 		pll_div = 0x10;
 		break;
 	}
 
 	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select, &ret);
 
-	if (priv->hw_data->is_ub9702) {
-		ub960_write(priv, UB9702_SR_CSI_PLL_DIV, pll_div, &ret);
-
-		switch (priv->tx_data_rate) {
-		case MHZ(1600):
-		default:
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
-					0x80, &ret);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b,
-					0x2a, &ret);
-			break;
-		case MHZ(800):
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
-					0x90, &ret);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4f,
-					0x2a, &ret);
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b,
-					0x2a, &ret);
-			break;
-		case MHZ(400):
-			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92,
-					0xa0, &ret);
-			break;
-		}
+	ub960_write(priv, UB9702_SR_CSI_PLL_DIV, pll_div, &ret);
+
+	switch (priv->tx_data_rate) {
+	case MHZ(1600):
+	default:
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x80,
+				&ret);
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a,
+				&ret);
+		break;
+	case MHZ(800):
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x90,
+				&ret);
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4f, 0x2a,
+				&ret);
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a,
+				&ret);
+		break;
+	case MHZ(400):
+		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0xa0,
+				&ret);
+		break;
 	}
 
+	return ret;
+}
+
+static int ub960_init_tx_ports(struct ub960_data *priv)
+{
+	int ret;
+
+	if (priv->hw_data->is_ub9702)
+		ret = ub960_init_tx_ports_ub9702(priv);
+	else
+		ret = ub960_init_tx_ports_ub960(priv);
+
 	if (ret)
 		return ret;
 
-	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
+	for (unsigned int nport = 0; nport < priv->hw_data->num_txports;
+	     nport++) {
 		struct ub960_txport *txport = priv->txports[nport];
 
 		if (!txport)

-- 
2.43.0


