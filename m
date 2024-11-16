Return-Path: <linux-media+bounces-21480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5FD9CFF6D
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 16:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A575B2451B
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 15:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABC726AFF;
	Sat, 16 Nov 2024 15:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="PG1GUrGD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7750FD529;
	Sat, 16 Nov 2024 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731770197; cv=none; b=HpCCV0yWJqcRgSLvX581JtOfosJnAObJwOI8A0q/4vQkKg/0bJD1mf/6T8/R8Z8XguH08jyl3ntX/Bm9qtFsh4MMf84GWhLwhIT7HzZTkgN4uvW/zFFhyGaIdm7wEWYxSLoVP4Mjby28Fboh1wfuxzxdxuqeOAFEAslOsaHl6xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731770197; c=relaxed/simple;
	bh=4Sp98N9ND06nJkApfuZCIBz6kUL+uhi6xNnPOzxjmHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aOzlpU6oI0JoTLTeaI2FrnqMYZ22IkO3IPSCFXj8kHYdBLNzD64wbyRpstLGTofRugqIZuTZECjOLvoDKgeANuitREzj+DJoHWvzVha/HBrP6f3mDdz8/la5s5Ms+8A2eTnhMdwvcCXGSPo0gozxoId+iSvIPGNaGzajwwu4Wu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=PG1GUrGD; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=vmy8Zwm7RquPC6fq5UvX7SA0vuYGz34tezpuupXSC4k=; b=PG1GUrGDHpUeGdx9
	Ru7TTA7309VyYzOMbZlE6i9IEB7ZDA2oZRmvkih6nG13RouDODbiKEUca9zV8LuPhbiUxmo9m82e/
	UQeLWq8MwXNS9nm6yid5sHhIL7W96d2Vq2JvvPZ+dsZ8I/lhG8INxM0kamI+wOAyyCdlTXBdi08MO
	nUPPvIN4WWbG+TpzTQKiVCLHMT5dDFaDJZFNXlIrfe3DerKmis1eWcyD4AFlkOmJ46F5N7g21PQ51
	RboyNJsKpMgytjhGMNiOk5n8XhwmrPhIqb6NU2rXle76ZrM7RJVK6A3D5P0N8zS/NeVg+Q0a7qUvF
	MX/SeBlSI2qamGCzVA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tCKXJ-000IOf-0l;
	Sat, 16 Nov 2024 15:16:33 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: tuners: fc0013 Remove unused functions
Date: Sat, 16 Nov 2024 15:16:31 +0000
Message-ID: <20241116151631.95706-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

fc0013_rc_cal_add() and fc0013_rc_cal_reset() were added in 2012's
commit e889adc91187 ("[media] fc001x: tuner driver for FC0013")
but haven't been used.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/tuners/fc0013.c | 64 -----------------------------------
 drivers/media/tuners/fc0013.h | 11 ------
 2 files changed, 75 deletions(-)

diff --git a/drivers/media/tuners/fc0013.c b/drivers/media/tuners/fc0013.c
index 1006a2798eef..90d2ef067594 100644
--- a/drivers/media/tuners/fc0013.c
+++ b/drivers/media/tuners/fc0013.c
@@ -112,70 +112,6 @@ static int fc0013_sleep(struct dvb_frontend *fe)
 	return 0;
 }
 
-int fc0013_rc_cal_add(struct dvb_frontend *fe, int rc_val)
-{
-	struct fc0013_priv *priv = fe->tuner_priv;
-	int ret;
-	u8 rc_cal;
-	int val;
-
-	if (fe->ops.i2c_gate_ctrl)
-		fe->ops.i2c_gate_ctrl(fe, 1); /* open I2C-gate */
-
-	/* push rc_cal value, get rc_cal value */
-	ret = fc0013_writereg(priv, 0x10, 0x00);
-	if (ret)
-		goto error_out;
-
-	/* get rc_cal value */
-	ret = fc0013_readreg(priv, 0x10, &rc_cal);
-	if (ret)
-		goto error_out;
-
-	rc_cal &= 0x0f;
-
-	val = (int)rc_cal + rc_val;
-
-	/* forcing rc_cal */
-	ret = fc0013_writereg(priv, 0x0d, 0x11);
-	if (ret)
-		goto error_out;
-
-	/* modify rc_cal value */
-	if (val > 15)
-		ret = fc0013_writereg(priv, 0x10, 0x0f);
-	else if (val < 0)
-		ret = fc0013_writereg(priv, 0x10, 0x00);
-	else
-		ret = fc0013_writereg(priv, 0x10, (u8)val);
-
-error_out:
-	if (fe->ops.i2c_gate_ctrl)
-		fe->ops.i2c_gate_ctrl(fe, 0); /* close I2C-gate */
-
-	return ret;
-}
-EXPORT_SYMBOL(fc0013_rc_cal_add);
-
-int fc0013_rc_cal_reset(struct dvb_frontend *fe)
-{
-	struct fc0013_priv *priv = fe->tuner_priv;
-	int ret;
-
-	if (fe->ops.i2c_gate_ctrl)
-		fe->ops.i2c_gate_ctrl(fe, 1); /* open I2C-gate */
-
-	ret = fc0013_writereg(priv, 0x0d, 0x01);
-	if (!ret)
-		ret = fc0013_writereg(priv, 0x10, 0x00);
-
-	if (fe->ops.i2c_gate_ctrl)
-		fe->ops.i2c_gate_ctrl(fe, 0); /* close I2C-gate */
-
-	return ret;
-}
-EXPORT_SYMBOL(fc0013_rc_cal_reset);
-
 static int fc0013_set_vhf_track(struct fc0013_priv *priv, u32 freq)
 {
 	int ret;
diff --git a/drivers/media/tuners/fc0013.h b/drivers/media/tuners/fc0013.h
index 74ce5903f199..47ab36342ee8 100644
--- a/drivers/media/tuners/fc0013.h
+++ b/drivers/media/tuners/fc0013.h
@@ -16,8 +16,6 @@ extern struct dvb_frontend *fc0013_attach(struct dvb_frontend *fe,
 					struct i2c_adapter *i2c,
 					u8 i2c_address, int dual_master,
 					enum fc001x_xtal_freq xtal_freq);
-extern int fc0013_rc_cal_add(struct dvb_frontend *fe, int rc_val);
-extern int fc0013_rc_cal_reset(struct dvb_frontend *fe);
 #else
 static inline struct dvb_frontend *fc0013_attach(struct dvb_frontend *fe,
 					struct i2c_adapter *i2c,
@@ -28,15 +26,6 @@ static inline struct dvb_frontend *fc0013_attach(struct dvb_frontend *fe,
 	return NULL;
 }
 
-static inline int fc0013_rc_cal_add(struct dvb_frontend *fe, int rc_val)
-{
-	return 0;
-}
-
-static inline int fc0013_rc_cal_reset(struct dvb_frontend *fe)
-{
-	return 0;
-}
 #endif
 
 #endif
-- 
2.47.0


