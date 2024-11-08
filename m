Return-Path: <linux-media+bounces-21133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD59C194A
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B47FB244DE
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2851E200F;
	Fri,  8 Nov 2024 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LpI945QP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AAD1E570B;
	Fri,  8 Nov 2024 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058533; cv=none; b=FzqWZZ6B8kjxUnHA67Fq7F1LQpymqR4V/YaTCMu0+SMes96O8ilDXadSx+ZdL3lEUzPn6TjwglvrVNHNK/+ILwWuA0z2VCF9Kn0yoXTJBiQMaMO1WzV2nYshjPl3aNAxK7Q9uHmP12k1SedJmkWeov+cmr9BK+QaCePPdgGL6p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058533; c=relaxed/simple;
	bh=jgGbPlVw9htVnBapbccOdLIZ3VXgt0d8E6hbJmD4w3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Viw6vE0eS8kM4rHWqC95JpY+gaCNzrrc3gLRtYzVDnZriqnDY2k/NKp8BB4fBptklximTk0viOilx0bLtkNgbjv9SVHcnBa/zHVqcq+kLbN8RUhPYWnlDdPCynL+IwnujIavDMN8E7dLzXZPdzY2lAhH213z+QP0IM2AECeNlIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LpI945QP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D59A19E0;
	Fri,  8 Nov 2024 10:35:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731058511;
	bh=jgGbPlVw9htVnBapbccOdLIZ3VXgt0d8E6hbJmD4w3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LpI945QPDPiWjI72YsqjZUtM44gaJKinK4dON+zkFev77+HU6ahFpPujikUPTwJH5
	 pdiJUxjtb1P4wGfkY7CMy2k0p1PLSMh7cDTTaFYS3ULs17nUq6wWGI360v5xtMtZtK
	 CsVEVlEq3zBrcPeXrrMaPf6V+Cj6p+HHy9UxaZHw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Nov 2024 11:34:53 +0200
Subject: [PATCH v2 09/15] media: i2c: ds90ub953: Clear CRC errors in
 ub953_log_status()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-ub9xx-fixes-v2-9-c7db3b2ad89f@ideasonboard.com>
References: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
In-Reply-To: <20241108-ub9xx-fixes-v2-0-c7db3b2ad89f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jgGbPlVw9htVnBapbccOdLIZ3VXgt0d8E6hbJmD4w3s=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnLdtQUN1BzEIT6awDGB5rcL2hURqqYMXMu6SZa
 t1Qdij5SSmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZy3bUAAKCRD6PaqMvJYe
 9XkwD/98zECV9cPq2O5socZ4tr1Dj7vNym5P5yueriPbKecwn4pXUDY9S9VNL/nUBUtYFZIQ7C9
 gndwu2QDXL3iSVQRySS9Mk0lOFLhh9TocXXzlpGJAELY3DoTzW7DgzOVrtMrgHy4Qk4FD52iYPu
 bnfuArvKE6qo0U/AqTggh/BbctdcwDBSxzZyJNNs5KUe0Yp6fwHkErGC+OY/zABE6Nsiqag2V4J
 IsjeJ9dAc4MI2Yv7a3+xstJ83kCaG6jjrADT7N4SsjcxH1M9dgQ0uS4+xo2B9+CZA/EUxCFYlEO
 OhU1F7NNuHZbm0WbWpRkbHT8X4QeLBDVrpS+OEHzG7JkIdMc6ihh6H9Q6WhR50sY22BTY838rbY
 PAgMgezvOZfJfuIPdOSKKnW4dn6sHBmGQUBLzQbXkWytaNTcy2zwUJZJj/PC3b85ORJJUM1ZxL0
 mrmL21I+ah8uzJd0mCi2G4YhGwm8wB2+R+v8xQSVmnM1dZVKHizFoLoPfFlPUupZTTMGSKSVZNG
 dz+y6Tue/mshC599TnDUDH1DDANwzV8Mze58jXzZzKrhOxI5CrqsM4XBhcphQifQ4we89uuslcq
 EvU859Ac6YaKUDZwbnBK8PJQVLe4Q1HgSKzGfSBPSeoyG8+cJWx1Jsuoa5B0jjZnD58B2iuiHrt
 uyO5sjM0EmQTuXQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Clear the CRC error counter after showing it in ub953_log_status() to
make its behavior match the other counter values.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 10daecf6f457..b6451811f906 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -66,6 +66,9 @@
 #define UB953_REG_GPIO_INPUT_CTRL_OUT_EN(n)	BIT(4 + (n))
 #define UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(n)	BIT(0 + (n))
 
+#define UB953_REG_BC_CTRL			0x49
+#define UB953_REG_BC_CTRL_CRC_ERR_CLR		BIT(3)
+
 #define UB953_REG_REV_MASK_ID			0x50
 #define UB953_REG_GENERAL_STATUS		0x52
 
@@ -619,6 +622,12 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	ub953_read(priv, UB953_REG_CRC_ERR_CNT2, &v2);
 	dev_info(dev, "CRC error count %u\n", v1 | (v2 << 8));
 
+	/* Clear CRC error counter */
+	if (v1 || v2)
+		regmap_update_bits(priv->regmap, UB953_REG_BC_CTRL,
+				   UB953_REG_BC_CTRL_CRC_ERR_CLR,
+				   UB953_REG_BC_CTRL_CRC_ERR_CLR);
+
 	ub953_read(priv, UB953_REG_CSI_ERR_CNT, &v);
 	dev_info(dev, "CSI error count %u\n", v);
 

-- 
2.43.0


