Return-Path: <linux-media+bounces-21254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C5D9C3FBD
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 14:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C92BC1C21882
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 13:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38D719E7F3;
	Mon, 11 Nov 2024 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bz8Kzokr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC8E14D70E;
	Mon, 11 Nov 2024 13:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731332640; cv=none; b=YZamZnDY/yKPKAnxyHDIk/WFvYxgVGRV7fE6q+G2+NSD2lhC60GOqtqLh8yC1cU3VeKakgVLPcjiSbEcWAjU61OzrvLtmrb/Fb7mgu/GTNZFoMcL8TJMHk0OGCWc41mrYj2xr0HAiiPrhPzGwN8JqMVkx7LWxYlMLVg7GZASL24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731332640; c=relaxed/simple;
	bh=8KBvcpOBN/X2BF/ZldtfXAsIa2zzQe8iYbB2KTJR1dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDFdHyDCks61UT9/kguXlwSifHliKhJGlU8P+NX1NDLS4bJoEiUCLCgPueRbuCus/qLZtdNnie+GECwEwQsh8O09kBrM7YeolmSmJkbyaJgEiCEEatZAhiaOwMV0mLyZk9+1gV7wJbMWbkeq3vr9s4JoJMQ21muQ5u794quXMfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bz8Kzokr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAEEC4CECF;
	Mon, 11 Nov 2024 13:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731332639;
	bh=8KBvcpOBN/X2BF/ZldtfXAsIa2zzQe8iYbB2KTJR1dc=;
	h=From:To:Cc:Subject:Date:From;
	b=bz8Kzokr11U86eIVk+YnVU+RXlmRHMdSc+/TwFSN5kKaVEv17Z//KEVwjfQ0KXQGT
	 ibMrDbTXc7km+yK4elJdYeY7+tG5ofN71kzuUWoOwJAV6I8QXiReJnrSqOwb0Jg7KV
	 XW/aqjpOhM8LfC51Rb3nBlXW2F2RRmJYnXffU8L1aOjbhMMHeL8GaWFYn+WIOBFRRX
	 bVMgCirhCL/EaLFbZLcmko9jWQNL21Ic/7ochUuYos49eqBfSRgIchFrBcrp3bov3G
	 OgwXEMvySgLcXG+u1li/iwbt7Xt/Wuo+BB7CnogecEYoNUHQxW7vqL5tZzykV6JDLE
	 1wCfuZtY0An5w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tAUhw-0000000CSax-0kdW;
	Mon, 11 Nov 2024 14:43:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Kevin Hao <haokexin@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Philipp Stanner <pstanner@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] media: dvb_frontend: cleanup zigzag drift/inversion logic
Date: Mon, 11 Nov 2024 14:43:54 +0100
Message-ID: <d24601442407717bed6f101d3186dac5b6de7fc4.1731332632.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Move the logic which sets LNB drift and inversion to a separate
function, to make the code cleaner.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 83 +++++++++++++++------------
 1 file changed, 45 insertions(+), 38 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index a05aa271a1ba..6ee46bf6e45a 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -375,32 +375,13 @@ static void dvb_frontend_swzigzag_update_delay(struct dvb_frontend_private *fepr
 	fepriv->delay = fepriv->min_delay + q2 * HZ / (128 * 128);
 }
 
-/**
- * dvb_frontend_swzigzag_autotune - Performs automatic twiddling of frontend
- *	parameters.
- *
- * @fe: The frontend concerned.
- * @check_wrapped: Checks if an iteration has completed.
- *		   DO NOT SET ON THE FIRST ATTEMPT.
- *
- * return: Number of complete iterations that have been performed.
- */
-static int dvb_frontend_swzigzag_autotune(struct dvb_frontend *fe, int check_wrapped)
+static void dvb_frontend_swzigzag_inversion_drift(struct dvb_frontend *fe,
+						  int autoinversion)
 {
-	int autoinversion;
-	int ready = 0;
-	int fe_set_err = 0;
 	struct dvb_frontend_private *fepriv = fe->frontend_priv;
-	struct dtv_frontend_properties *c = &fe->dtv_property_cache, tmp;
-	int original_inversion = c->inversion;
-	u32 original_frequency = c->frequency;
-
-	/* are we using autoinversion? */
-	autoinversion = ((!(fe->ops.info.caps & FE_CAN_INVERSION_AUTO)) &&
-			 (c->inversion == INVERSION_AUTO));
 
 	/* setup parameters correctly */
-	while (!ready) {
+	while (1) {
 		/* calculate the lnb_drift */
 		fepriv->lnb_drift = fepriv->auto_step * fepriv->step_size;
 
@@ -415,40 +396,66 @@ static int dvb_frontend_swzigzag_autotune(struct dvb_frontend *fe, int check_wra
 		switch (fepriv->auto_sub_step) {
 		case 0:
 			/* try with the current inversion and current drift setting */
-			ready = 1;
-			break;
+			return;
 
 		case 1:
-			if (!autoinversion) break;
+			if (!autoinversion)
+				return;
 
-			fepriv->inversion = (fepriv->inversion == INVERSION_OFF) ? INVERSION_ON : INVERSION_OFF;
-			ready = 1;
-			break;
+			fepriv->inversion = (fepriv->inversion == INVERSION_OFF) ?
+					    INVERSION_ON : INVERSION_OFF;
+			return;
 
 		case 2:
-			if (fepriv->lnb_drift == 0) break;
+			if (fepriv->lnb_drift == 0)
+				return;
 
 			fepriv->lnb_drift = -fepriv->lnb_drift;
-			ready = 1;
-			break;
+			return;
 
 		case 3:
-			if (fepriv->lnb_drift == 0) break;
-			if (!autoinversion) break;
+			if (fepriv->lnb_drift == 0)
+				return;
+			if (!autoinversion)
+				return;
 
-			fepriv->inversion = (fepriv->inversion == INVERSION_OFF) ? INVERSION_ON : INVERSION_OFF;
+			fepriv->inversion = (fepriv->inversion == INVERSION_OFF) ?
+					    INVERSION_ON : INVERSION_OFF;
 			fepriv->lnb_drift = -fepriv->lnb_drift;
-			ready = 1;
-			break;
+			return;
 
 		default:
 			fepriv->auto_step++;
 			fepriv->auto_sub_step = 0;
 			continue;
 		}
-
-		if (!ready) fepriv->auto_sub_step++;
 	}
+}
+/**
+ * dvb_frontend_swzigzag_autotune - Performs automatic twiddling of frontend
+ *	parameters.
+ *
+ * @fe: The frontend concerned.
+ * @check_wrapped: Checks if an iteration has completed.
+ *		   DO NOT SET ON THE FIRST ATTEMPT.
+ *
+ * return: Number of complete iterations that have been performed.
+ */
+static int dvb_frontend_swzigzag_autotune(struct dvb_frontend *fe, int check_wrapped)
+{
+	int fe_set_err = 0;
+	struct dvb_frontend_private *fepriv = fe->frontend_priv;
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache, tmp;
+	int original_inversion = c->inversion;
+	u32 original_frequency = c->frequency;
+	int autoinversion;
+
+	/* are we using autoinversion? */
+	autoinversion = ((!(fe->ops.info.caps & FE_CAN_INVERSION_AUTO)) &&
+			 (c->inversion == INVERSION_AUTO));
+
+	/* setup parameters correctly */
+	dvb_frontend_swzigzag_inversion_drift(fe, autoinversion);
 
 	/* if this attempt would hit where we started, indicate a complete
 	 * iteration has occurred */
-- 
2.47.0


