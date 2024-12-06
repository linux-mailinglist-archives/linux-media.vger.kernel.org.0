Return-Path: <linux-media+bounces-22776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F17879E68C2
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 09:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 415751885FBE
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 08:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83491DB52D;
	Fri,  6 Dec 2024 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nVsqgyxu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E011DFE2B;
	Fri,  6 Dec 2024 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473641; cv=none; b=SGEQ9eDVVSumqvfIKqDpAlHEIrmb4Cqq6am4pi8cbvEsAqlDbUFFRi1TF0VG8bszai2GS3pOMLFVHWq72pZdAR7WUMQlODUOLicH4OZtbD2K3Rgvb8KCZIwBYdq3n+4Li4FDN8OF/p2J57PRI1cTt+f//gSQ+31zS0JQ8VkHb1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473641; c=relaxed/simple;
	bh=EvybpXzj4B6bnj4sfMr1dme2NoTO1hCmVx5yi/P/qAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFz1EbISAjyKvcp+1Dp6egQNKnnWtQWbv8kCCYKp9UJXf5OEGSkXXJaA4MxZRCBI7co5YVTKIT5okFrAzRpI69sO9khtF0OGKD7rGjjW9EsLzvRzbOEpgzAcxMm9MUtef37lGMfbSiNhuI0jJp9Bc/dcq2+GR4AJal+QB+plqOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nVsqgyxu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90FA0B2B;
	Fri,  6 Dec 2024 09:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733473606;
	bh=EvybpXzj4B6bnj4sfMr1dme2NoTO1hCmVx5yi/P/qAA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nVsqgyxuBe9Br0LulGjjdYtcLcqwDh01zTTQkaEfovi3VemnY52yFJu62buEYhx5g
	 4rhZSp+l21bGHgJEs/H0+EAFQ2MZzB1/f2/PgpeLn9BhLlO3LOESJu8qorxh+s3ws6
	 QeCBstSVedAoFvyOrCDL4FwQJQG7xQD5SavxT9BM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 10:26:38 +0200
Subject: [PATCH v4 02/15] media: i2c: ds90ub960: Fix UB9702 refclk register
 access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-ub9xx-fixes-v4-2-466786eec7cc@ideasonboard.com>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
In-Reply-To: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=EvybpXzj4B6bnj4sfMr1dme2NoTO1hCmVx5yi/P/qAA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUrVcDz5ZpshCNCZylbMz6qPuhIREIJ70biLar
 wYsUN1QfrCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1K1XAAKCRD6PaqMvJYe
 9f/ZEACLnYE7GHNeAeqq00vE5Dmhgwg5GTlO72H/UoAOVZwtp6lJBYwCfzGMAkADT1BaOgKjnPe
 IHWyLds58CcWGYJaQ9+hZ0/fV/KxAJIAX2crRVNn7W5KXCOjwJwub+pNS0artEyCF8A4VB+5ci8
 /kXIPwIMAHJ8jaodMxhvFZsDQ0nEIKevKTQfZ0lx1U/mkeis/g7zkgjiU7/0uNTmUxPZ8CjMhSU
 MtTULZ9eXhq6he9DNI7jvs35IZwX1nGRsoUSv0DpTr7ROLWmUwYNWymyWrjAdtkdaXH2041lYD8
 7T0+CNYkIUGBEYIvjF9R/B+ZQ6n8MnrWpekD1TSg8fG6Lue1/88l8x0Jjek/akgIYnYTNm6Zft1
 UHv73K3/sXOrMEZ0dZNqu5+rKra7J+LoJMBf5JrJ3ztek/1CR4TyDABpiI8LiHW+195KrEbUS96
 X0aP8FOh044ATEOT4bW4asbUwFTE5Wwks4ovPJlD5ACUbR6wa3+VSjlxkFqDnq8+qCBxuvsyhs+
 OKtaFPUGLY7ZltlAzJ/BKcHK7lUlrFxkHFaZVCkKhz+cAy5zOSQfWwlaTuhDViIbaHupEFxw4VM
 1HQXoWQXvJJRmBcJU/i1efF8DHoQDGooXfnap/wmyVF53t2+AvX+txSY93tLz3BTElHmqeu+j+8
 2K+5WklxvqMX1wQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

UB9702 has the refclk freq register at a different offset than UB960,
but the code uses the UB960's offset for both chips. Fix this.

The refclk freq is only used for a debug print, so there's no functional
change here.

Cc: stable@vger.kernel.org
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ffe5f25f8647..b1e848678218 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -352,6 +352,8 @@
 
 #define UB960_SR_I2C_RX_ID(n)			(0xf8 + (n)) /* < UB960_FPD_RX_NPORTS */
 
+#define UB9702_SR_REFCLK_FREQ			0x3d
+
 /* Indirect register blocks */
 #define UB960_IND_TARGET_PAT_GEN		0x00
 #define UB960_IND_TARGET_RX_ANA(n)		(0x01 + (n))
@@ -3837,7 +3839,10 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (ret)
 		goto err_pd_gpio;
 
-	ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq);
+	if (priv->hw_data->is_ub9702)
+		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq);
+	else
+		ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq);
 	if (ret)
 		goto err_pd_gpio;
 

-- 
2.43.0


