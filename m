Return-Path: <linux-media+bounces-22593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACA09E3849
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4FA21642D6
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE9E1B21AE;
	Wed,  4 Dec 2024 11:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Robn0ufy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A49A1B4F15;
	Wed,  4 Dec 2024 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310351; cv=none; b=iM9bDDMmfeIipzo4N4jBHbfKdAn+UMMEApXWHnmoFpHT/IsyMNpp+o+MM0Eukufo2FAGIA+LqC+3TVgXnk3VX8lWJnU+mtVvCpFNTyuwB4m4KEe9v5Yjl0oqm2GepVoqTfzeyz5vzLdDblvwRlHeGhc+uwT/9qX9SZz15mYtPsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310351; c=relaxed/simple;
	bh=JiGQ0b5hfc6zIlLKLwEQZtJz1RrCwE+wHub95g3gf8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBli1TQoFBThbf8F43YraTDMyWxjne1uOXkwlUFPtxyMIpfdruzR2KFsB+ho3PjvxarYWuX59mti/jUBHc1HmmhMEuKc/7oDk0TS/HHs5ZxSmgNctfOhDiBjnoVrAfjKktY9gtvwocjUiJWU064dixSv0/YblK9bZcq3CzTDfb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Robn0ufy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27B25B2B;
	Wed,  4 Dec 2024 12:05:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310317;
	bh=JiGQ0b5hfc6zIlLKLwEQZtJz1RrCwE+wHub95g3gf8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Robn0ufyBOG+hqQdgKF/N4beJb1DNDm9RxsarXTM7NGftKcnjHYN+J6jrGmyMiQoX
	 BDRRmBRsDcTA9R4r7QbXHCNZNvMNNr4Q/b2i+jlR+7UTmyZQ/ofQHCBgo5WGW36UZv
	 KMk6lgZC8Nfd5oPQapZ6d+Wdt3g8GHrUkc+9njZM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:16 +0200
Subject: [PATCH v3 02/15] media: i2c: ds90ub960: Fix UB9702 refclk register
 access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-2-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=JiGQ0b5hfc6zIlLKLwEQZtJz1RrCwE+wHub95g3gf8Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeCRelz6rQj2edvFCi2rJaavv+P4syT8E82O
 bvOHkiM7p2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3ggAKCRD6PaqMvJYe
 9QP6EACZkXJIm8OWPDB5CPgg9sL7DBp6UbTF+C5UgJ64YDMgOM2gIg92Kk8p47qRwu8MzSqy5Qz
 dMvwwKzfkeYI6SreqhiSpIFNB1dF1TowOKcuEd1oQPRTKtAdmPkRhCgNjorPmLnLPFPmF/mpn8e
 sAm3HkmJ3Xwhx9qTmzs/oRNs1hm/iq4cKXbxTiW5tE5vUwOmNvTjDWFHKwDlBtDdn+wMkA6BfXg
 BSoSIkMxHrHY/fqWnwrovqaDeOcCg59ZlMBISXlyzPgLalOtWBnBu53wxl+GXOwv1Ic6ZlHEGB7
 iyxr1z6UbnSwR0H6VLrZbMrx41q4iQXgRpEsngyzg9fsW6hrpsexSMWWCaX/GDkGJ7sUIsW8Ye5
 QDnHXQlhAT2IKsxyXprugIM4HkFHbTqweMA+DOx0djlFKKhPgLkplfrX2OmEx8SlBnMXFkIyZ4Z
 YdpdUwST9TtA77PVecDk2e8S2+xRtcTlFjyU4XV8Q9QGY2lmR327dWdtnCMuoZuxHwnZNB8O6S6
 lzMIIQ0ChuWXzDjD6pUQKOTkWMykpJ0iZ8H6J/ILtmKCh8KUgXhYG9RIubjHQUXLcWxFKEyRHoy
 l1i5uPHNFZYxqTFFKnz0CCjxIgd8NXo94wAU7uhmQI8tcYzsLfTrc+tDrumg5c2PTLBvEZecLbg
 n/8nso7MkHoQtFQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

UB9702 has the refclk freq register at a different offset than UB960,
but the code uses the UB960's offset for both chips. Fix this.

The refclk freq is only used for a debug print, so there's no functional
change here.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: stable@vger.kernel.org
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


