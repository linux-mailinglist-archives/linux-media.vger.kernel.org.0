Return-Path: <linux-media+bounces-22603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B96F9E385D
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3811A160107
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2783D1F6662;
	Wed,  4 Dec 2024 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f3TYs03S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E081EE006;
	Wed,  4 Dec 2024 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310366; cv=none; b=FVqae3OEgJloEQ8D1nB2x7AJ5/szsid8TJD+HTu+54KctALf7mAZi+462xnFa8Gb3ubclC+KMbvwwa5XeQ82T2ongbvV6jlgeoDHzxNVSiDbiPzw1QwZ3NpHmh61e1drA1z/nwCCQerJxBo/dd3wRbp/qM0WUz+4b6XC0NOa8sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310366; c=relaxed/simple;
	bh=cvgAmZGnvd+MaIkpjSC6cQoWn3Y/Etg4xrzQpFwC5+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IWSyBAcrpskinr0dBljpXiDnURrPbTsXMVlSwj0VGG7ZCyn5fDJxgaNWjcGHCXn0Y9wpjPLQr71J1fr94VfvBM28puwwtdDE06gg+6h2ZJdy7nVO6A8VBuuJn3SR48k3reE96PrmyR+C/XW/TEjenyDKTWn31DYJO6v7aBcVIfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f3TYs03S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BFBA1D29;
	Wed,  4 Dec 2024 12:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310323;
	bh=cvgAmZGnvd+MaIkpjSC6cQoWn3Y/Etg4xrzQpFwC5+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f3TYs03SgifWvbv+gGweK5Bw/WH3wzU9SiwJYm27xL0NT4G8rmJ/M0vcCQ2vXAEe2
	 5roim0w8RPJ041vFu/QTUAP4Msy7o5CbVt5bYn3k+7mrxyd4JVECGkKs5SINHHbBXj
	 vNdc/JdbLmv/IHw5iAVepkNjml5eUxRcl9NYoYis=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:26 +0200
Subject: [PATCH v3 12/15] media: i2c: ds90ub960: Handle errors in
 ub960_log_status_ub960_sp_eq()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-12-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2084;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=cvgAmZGnvd+MaIkpjSC6cQoWn3Y/Etg4xrzQpFwC5+E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeF6SG7tS/eiKXoOzcD2sDQM4nC9mte+P+7b
 tQ7bhTo/MeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3hQAKCRD6PaqMvJYe
 9UpHD/9adFtA1QLcFEJKFxFjDQp1UUULtz21QokXid773ecBjFkD8OpdRDD4Q9+x7+Cg200mPr7
 Cq51u+2yFiw4LDgp9QK+pLdZnwalxy4zPnHAfjPApkdjy920L73NPzQv+L/JqPXXKuCokijRuMA
 q7TZwyCUbzLUGDtAH3N2lm2uU8TL7gcmIDnQJLqhB52BFXHq1sYnjwprI5nGvoUaxdQ7fhESbQ0
 981oxzOiJzu9HcadL+GvVnA6KHOAyNmjXHx2LEJwldyRlHwd1hT0xBlCuNGdxceAal9e5wBKRnk
 xErBZQjrcQmeF13mzY5dZQac9qM+IbYCAryGTyuynxVP3pJLd93epYLkSJjCgOzlMlq3rvOW0Mg
 +CYiHs8n+x6f3BScN3PccNFD0DesugsRA1XTTkkMi9b2UMp3vOpla+VtG3lGtZtBYESW/JdABjo
 7JJNr2tiR9WK6Jxd79QidvKXOQyCCGW7I4Yuq2cpVIIUDuGGlIiF3DaiJ72CZ8d75TTuJdUHE/k
 4u/0+SZqsE9SGRDJ6kTIqg6XJh5RQWNCZQ0ZJnxmdRKQyMF2qENAI38g7VuxZbA99fGr/AtBDAU
 8u8YhPH6M5eEGQB4rr1n2awpt5NMYCuQ2NtY8RTdgBau4i6r63lNQD7hOmCov3zFoFuy+jFSC0e
 9696riyYmu4TarA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling for i2c read/write calls to
ub960_log_status_ub960_sp_eq().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 64b5297c5f22..1dc10b2ba1f1 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2982,38 +2982,49 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 	struct device *dev = &priv->client->dev;
 	u8 eq_level;
 	s8 strobe_pos;
-	u8 v = 0;
+	int ret;
+	u8 v;
 
 	/* Strobe */
 
-	ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
+	ret = ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
+	if (ret)
+		return;
 
 	dev_info(dev, "\t%s strobe\n",
 		 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
 							  "Manual");
 
 	if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
-		ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
+		ret = ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
+		if (ret)
+			return;
 
 		dev_info(dev, "\tStrobe range [%d, %d]\n",
 			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
 			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);
 	}
 
-	ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
+	ret = ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
+	if (ret)
+		return;
 
 	dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
 
 	/* EQ */
 
-	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
+	ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
+	if (ret)
+		return;
 
 	dev_info(dev, "\t%s EQ\n",
 		 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
 						    "Adaptive");
 
 	if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
-		ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
+		ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
+		if (ret)
+			return;
 
 		dev_info(dev, "\tEQ range [%u, %u]\n",
 			 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,

-- 
2.43.0


