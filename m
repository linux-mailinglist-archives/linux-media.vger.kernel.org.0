Return-Path: <linux-media+bounces-24591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D1A08B3D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ED0A3AA8BF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E271620C494;
	Fri, 10 Jan 2025 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pt9fbl6g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5E120C460;
	Fri, 10 Jan 2025 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500533; cv=none; b=njtcDpLPJRRbiC4fyKDWvwQaIakpxdWRvw3Nu+A88PI0rezFoc2N4ot0KXo9VBbfaNGCq21XmqncjK+R3/WoQP2TiQBWYexwMGcwvH1258dphTA8M06x0L5aSfqyxuAJFZsRKaayvd89RvNTmOzOu/x5GIdYywq2ZCMlTjkGfHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500533; c=relaxed/simple;
	bh=ZcBldV7csNp7Rh3492vSdrLLFvoKPscmdX1BHBLru6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DXlY9TuXJb0m2LMVKjSO5cgM+EsF7TgcmACfUtG5DndbKqpwczfVCA9IE63K4MDIAubedUQAFvZFB3yCrAfRz6m4h4/Hd/IkePzpyLSwQoa1UzEUgIqcSCwhyZop/ru+QQmlax93cAs4slJIQd5PoNBV/49KySc5wuFYa9UjBQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pt9fbl6g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 790801D4F;
	Fri, 10 Jan 2025 10:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736500456;
	bh=ZcBldV7csNp7Rh3492vSdrLLFvoKPscmdX1BHBLru6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pt9fbl6gWmyim2kC6MyKCUzDfE17FEHI7GfEdIKwKw6TIYoZACK9/Z18WaggF5/NB
	 zfKH/K75o1ziRCoasxlyZqrF6Pnaai6RhC2Jrg1A3Wlc2bYritkGp3a2hqc6uNj9c3
	 f1vGd1lQRGxCLlXEd+zzJrqLmMG1YrzgaEJVF+54=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 10 Jan 2025 11:14:11 +0200
Subject: [PATCH 11/19] media: i2c: ds90ub960: Refresh
 ub960_init_tx_ports_ub9702()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-ub9xx-improvements-v1-11-e0b9a1f644da@ideasonboard.com>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
In-Reply-To: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ZcBldV7csNp7Rh3492vSdrLLFvoKPscmdX1BHBLru6c=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBngOUUjOYAsee6729hO9M6T+OE8gbj6Z+BfscUE
 6+9dAZ5MXiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4DlFAAKCRD6PaqMvJYe
 9Xt+EACSau5AjV3nMm6ygT9AbGeixJDU2NQaWKJ0m2H1mhl1cWkpHFQ3o3uK7Ov30w2RoiIzgia
 vnD06gh627pJ42DJi8Kjzyw7ZqlXtEmRryjbQd0kzpx4NjSri9MYjuLNFNRiJA6pmjBHQcJaEDv
 rVIlfKgMRrkL3Inqyp1to+QDeS9pXsWen1PDaecX2jAoUmUItSsgvypXpnoS6ewIGqYaPcL/+jz
 IFVgt0rn2Hber8nalzNuP+p+dD+Lpgh1YRj3+8fkMtB9SCExacQaGHAQUsZCmPgNh/e3wZkDEXn
 nCebB6AHG2zU4r3SQxrEyEA8hy5dijMmfPcvYlbMGKh0hZNk5s/xtVEvZCQYwcN+dTLfYlXU9as
 1YJzoFsr1LUDzNuRaKHrfFE+U4HjumcPlYWjlJot90ZFoMrdLJ1v0/LR7232uz2/Po/ZrFd+tTt
 Bz9HlK5w5TnHdxfpvZxdk3y9oTDEn9wF5B04u1cmUZGnzqV0Il1PYyzwxJDB7NKWyTgrYyAfcSH
 Ix9s9SxWoP5L14snfUo6UsSQjqo3YLyudajh+Nrlj4BiSUOc2NnkMr6g6CfeKfqjCFeCjuf5Osf
 QcAC5hYemmD2CvrHMuYf0tWoN1KTfO6wsOpLKTi7n88r7V2aNmK7gEqnVq2Q5VI8H69lkrQoYo6
 TT0pf6p2T4eGBnA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Refresh the ub960_init_tx_ports_ub9702() using the latest version of the
(non-public) hardware documentation.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 3b3e756af86b..bca858172942 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2018,6 +2018,7 @@ static int ub960_init_tx_ports_ub960(struct ub960_data *priv)
 static int ub960_init_tx_ports_ub9702(struct ub960_data *priv)
 {
 	u8 speed_select;
+	u8 ana_pll_div;
 	u8 pll_div;
 	int ret = 0;
 
@@ -2025,47 +2026,40 @@ static int ub960_init_tx_ports_ub9702(struct ub960_data *priv)
 	case MHZ(400):
 		speed_select = 3;
 		pll_div = 0x10;
+		ana_pll_div = 0xa2;
 		break;
 	case MHZ(800):
 		speed_select = 2;
 		pll_div = 0x10;
+		ana_pll_div = 0x92;
 		break;
 	case MHZ(1200):
 		speed_select = 1;
 		pll_div = 0x18;
+		ana_pll_div = 0x90;
+		break;
+	case MHZ(1500):
+		speed_select = 0;
+		pll_div = 0x0f;
+		ana_pll_div = 0x82;
 		break;
 	case MHZ(1600):
 	default:
 		speed_select = 0;
 		pll_div = 0x10;
+		ana_pll_div = 0x82;
+		break;
+	case MHZ(2500):
+		speed_select = 0x10;
+		pll_div = 0x19;
+		ana_pll_div = 0x80;
 		break;
 	}
 
 	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select, &ret);
-
 	ub960_write(priv, UB9702_SR_CSI_PLL_DIV, pll_div, &ret);
-
-	switch (priv->tx_data_rate) {
-	case MHZ(1600):
-	default:
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x80,
-				&ret);
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a,
-				&ret);
-		break;
-	case MHZ(800):
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x90,
-				&ret);
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4f, 0x2a,
-				&ret);
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4b, 0x2a,
-				&ret);
-		break;
-	case MHZ(400):
-		ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0xa0,
-				&ret);
-		break;
-	}
+	ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA,
+			UB9702_IR_CSI_ANA_CSIPLL_REG_1, ana_pll_div, &ret);
 
 	return ret;
 }

-- 
2.43.0


