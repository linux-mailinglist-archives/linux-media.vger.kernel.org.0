Return-Path: <linux-media+bounces-27371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E008EA4C62A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07AF81894EC2
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DA722DFFA;
	Mon,  3 Mar 2025 16:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Od9hz4Nu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BDD22D7BA;
	Mon,  3 Mar 2025 16:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017803; cv=none; b=l7x/VUwmEnvG7VjRqJ3apR6F0q2tklU7/GxtVaaFI+BjA/1iJIvflYGlBvGU8hgDAFKQtsbMTGIm72cKLxQXGQjrNtM2aCgIz6eFeDxxJzcUV8zescjzaut9H1U0X4laNUvIR7c3NoXrF30sRqhIESCd/8dBdLRxrhIasHUHD14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017803; c=relaxed/simple;
	bh=ylFexGf+sBleL9+31yS0Ys++TTddC2aeQt0yLzVWoaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nP3dt8G0hhium9GgPNRySmk+Nlz4oxS1zWYqxPeulIprZg4olNMS9fNolfHci6Yn4BR3B/KG6prCoXdbFZs38hJf8G1z0OArsedA6JVuyLL+CN+6oKpVj4dqmu7fBQb90A1KVFGqu3zVb+RuMEalSFRId/yEswA/mD5HUG4FxDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Od9hz4Nu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99AC9346;
	Mon,  3 Mar 2025 17:01:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017709;
	bh=ylFexGf+sBleL9+31yS0Ys++TTddC2aeQt0yLzVWoaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Od9hz4NubQNRE91iq3Osn6EEZhVZGbYIEnZqnVZNZmd5gPG7SdS/wx/yTahKw8Nrt
	 KFyJ7PgY341FmGNkkPrDRcf9S0DX2Erf2n/ut94vGnoYqeercrwRfH4zv2AK7zWpCA
	 0i1DNq5oS60Lh6Tw3Iig9ULPkF2SmwZQe8gZEvoQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:15 +0530
Subject: [PATCH v3 12/19] media: i2c: ds90ub960: Refresh
 ub960_init_tx_ports_ub9702()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-12-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2407;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=7duuCXdjM4rdqEwgrwUsymUtXQpFXfgR33sQrwGhBQM=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdKA0Jy3LG9Q4+TRngIrLdusDDHEdlqNx0PiF
 Y37NA0kexSJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSgAAKCRBD3pH5JJpx
 RRF2EAC+G9buiySwQ3SAYw0aNsjGf9uzu2r01s7b0SQQ88AxKNOyO+Lgg1MosSlTjnBR3ihGjuW
 KhzMxJKQq0IMuAPh+4Gg6LKFjLT93Al8XIYfHmgn1vpSOTjO6vyorWvEeUmVdhiO6q562pRspTW
 31YnDW+8brU6bXsyVu85bjkuwIC0r7UIEZmglsooH4FqYoUhz5ot8QuTW7J1QhFCE/gZR05hHUe
 FKPz+K08bB1DSXD9/3+R2w4Qfle28NOhppEDw6/sbKDTTj2O+4PMVJDVdDCXe2iLIUvB5+Wr6qs
 5RDG59eBHX7St5KJoMM8GSqQrKskbPLDDc4Jz4LTzOzkglRJ5m3yJuYRU3E5OjhRHHOyJKP8Nr9
 d+2GgllOmZwsXrcsPnKmm/gFlQsY4xI+KguSU6VaJSaKc37Z4m1XVbm9H67YRtcGlp1yqrbKWT9
 KB36Ksr7cnHLyZwpqzRz9nWUqWovdIs3eaKyDUIZ3kwBlSXKOh2DRXd65rQK3d5JdNARTufquzv
 iiJXxzHMxcqYx7TVPjfaAGzOHhCm/XbTJIe1Uh9dJvPRPc6XrQRHc+9efVW4XgnKj0CImyATCRo
 4aw21zxgyc0W8vBt2HsBS6Kh1LYhRScup36wd9I30XOvdvkQE3MzcyXpp+b5itUl5euFZw5rnHv
 CThYpxNxs7SZ/pw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Refresh the ub960_init_tx_ports_ub9702() using the latest version of the
(non-public) hardware documentation.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 579ca570a543a9ee8be8f9d4432a2da8fa09e54d..ed49508d2b79283a95f2f3315b53f21d4301b089 100644
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
2.48.1


