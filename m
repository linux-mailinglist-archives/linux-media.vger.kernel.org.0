Return-Path: <linux-media+bounces-19093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 871589906BD
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50DCD282EF2
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF2C22080B;
	Fri,  4 Oct 2024 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JyyoEceV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C63220802;
	Fri,  4 Oct 2024 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053242; cv=none; b=MW4Bsq3vjY6GxlZg/IPNU/jycS/v0Ogch8U7VTyVawzdTu9h8l+0YtHvhy5C2lATg+4TCmvVGInZuyCikIB6Y72Q4rVAbBb/ts2LGI0+RG69zzAt6lKTvJWo4/FJz/s+W0hcVEZNwhBDkhP66yotMbs/lmd+FUooevqrv8y/5nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053242; c=relaxed/simple;
	bh=dW1qzALQAuTsR/DlBA4YNdLa29WamlEcXrtjr7uIUrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qz3K++a9089YVydam1Qbx7USqx5uhTlGhsvrXAGYq7xlf+qJWLNQ5CR7NXgfslpGX0eW/FVpehdJlpRC5VGaCl3bZMLMswh3eU02h8dwvhwk7ULlPiaJ+5plxhlZ/PNy2LRJtkaFIqUdAZwIXDL8bqgLlzrHlp7KBDYT8rLCfp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JyyoEceV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 993148A9;
	Fri,  4 Oct 2024 16:45:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053141;
	bh=dW1qzALQAuTsR/DlBA4YNdLa29WamlEcXrtjr7uIUrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JyyoEceVs4ENW6WGb/MF86Pah/nIpaUPeSujbC9NmbEDMwXtXVvIuWMhzzXXVqQSN
	 M0uCqSE5ApFz6UaSnRFqUC4DmI2J7gpc4jSL0qljq9i9FggLCFJhgoCn7PWgVAUyCe
	 lgqWibG3/EVpYeVriyPHWu/7BYpyzJ9F0Va7jV7c=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:33 +0300
Subject: [PATCH 02/13] media: i2c: ds90ub960: Fix UB9702 refclk register
 access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-2-e30a4633c786@ideasonboard.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
In-Reply-To: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dW1qzALQAuTsR/DlBA4YNdLa29WamlEcXrtjr7uIUrY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///sftMFUGqc0fsRuyEXu57S2uoxupJvMsgd5
 eA/8gAAWCOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//7AAKCRD6PaqMvJYe
 9U/GD/9E30mYm2kZUyfEPWdfT30DtuW0A/aTdCSVq0anCP8oCR1fLHI7XiaL+L4zlfJXHyTqHxj
 cF/uj6WQBobMw7QEfGt7XX48TCf00tkYAazzP45ulIkfw8TipO7bjCCS2AcasH4q5tbhfK5XhPZ
 EQnGqW+Vvq5UHiwxlRuh/ayNvulmiMkEmQKzc9SPJ4Lvw5NyfG85dX/ijkWBUP1Qm54FZ4iKUkL
 6G8pKHnHWJlvFo2oWabg3jGS3Ww/ItZfzXiX7VGK+/jk/9lGNlIez60mPXZBsCkZzibddLH1x1v
 VVaRTkVP74I2GHNbPS9OIeUa2euS24FIEG7Rd4fRqbWan5xP0KJRXKzvBo24h3DVddjkpyIueAA
 +K0j8atTJSjdKRBbno75gPOSC2ja/PKGlu1za0sniQZmAmbJO7RAh0dlqbchKLShhPqzil4DKbW
 npGaWdjSAosLNoAZzrNQdu1Mw5q3HTGHmzIdcBenfxaqcYGjloOje0duWpqom9+KCPCjMddwKMr
 GxI42QENIhhEdS+uYkQaq1uyfvdQobfUSKlt+AU0oIWPvmCGcf5yhRpP5MY4dRW4QDqoS7K08la
 ZKzR0pCapEdXPqX7awnWcWSnaTda/CQeyo/h2Lf3L15Jzx5SYfcrmY28bhAzViKvJO3rFfF2IAY
 wzbSDiW42ixMuMg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

UB9702 has the refclk freq register at a different offset than UB960,
but the code uses the UB960's offset for both chips. Fix this.

The refclk freq is only used for a debug print, so there's no functional
change here.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
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


