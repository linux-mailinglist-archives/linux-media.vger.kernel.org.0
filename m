Return-Path: <linux-media+bounces-16945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA34961842
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 21:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BCD31F240F9
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 19:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5921D3622;
	Tue, 27 Aug 2024 19:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="PpVID/3C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077DF3A1C4;
	Tue, 27 Aug 2024 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724788706; cv=none; b=fTKgdODczmT8xx8AfeeoseowqU+cun6KbCweznIrtxVubSpidyaDtCIPFeNwogvW6b5oQ4hd9xsg07MLoDGIFtdnjMnmztEnIg36LkRyjl9oQ83/Owzywy8kNZJTBXN2JY01qpgTWWVgCw+Bl4lcYrEvIaFBibrua1ghOUqk9HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724788706; c=relaxed/simple;
	bh=mvJec1NSOsM/8iLimIr/so0oauKVyxEUuCzd0luLc/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E1bus9GxyPuP/8umNHPhXLm2/Ss0abmN60Z1Wz1y9VgGXKkRcQVIIiRvkgl2ToAiVJK8TJfhKyceKaClKTdWJCvn6TLl8ERZWvAMbKocBJNJwZDNYcLb1oGn+i9jHCaEM2pJl5ZmJxiHOHkZpIZVs8m+ZO+i8lRhzYdwfOIU8G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=PpVID/3C; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id j2KSsPz6eS3tRj2KSsv7Nc; Tue, 27 Aug 2024 21:58:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724788693;
	bh=rLwuUZ9aIo4XlhwkWjIzTfBQKCvx/GPTvYy58RhSzAY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PpVID/3CW0vpxxF0IIVw+JJMr94PGXaxU3w0udfAe789eddHhT9VCJ+q83qDaF3Eg
	 5hbtI/zi75/8T9qsFj9kO8TGoyjOjD706NecZGXds1RklykGFtELUdzFwJBt/+8G8+
	 k0X2KuTgPEXwLvoAOU3zsWWEqa/wOAILbn3O3Wa6mOWOo6tl9EVINvU0/V9PuSK6/+
	 CLQUcHJiUAOSKf9N1LrIs/9Khq+ZtLHN7X+Flol0ncplox+7sg6HZ0FMlWwEHxf1qT
	 HmxZ/bRb9emsXPiilDdgRsmj3M2r6Z8sijXsKaXmRdUQK/qoJ/WJ7d665zgSC8tGD8
	 bOa1MHYLGeOCw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 27 Aug 2024 21:58:13 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: tuners: Constify struct tunertype, tuner_range and tuner_params
Date: Tue, 27 Aug 2024 21:57:58 +0200
Message-ID: <20bb702ca7c044947e929391036a6eb226e7a8fe.1724788650.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct tunertype', 'struct tuner_range' and 'struct tuner_params' are not
modified in this driver.

Constifying these structures moves some data to a read-only section, so
increase overall security.


On a x86_64, with allmodconfig:
Before:
======
   2877	   8554	      0	  11431	   2ca7	drivers/media/tuners/tuner-types.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  11421	     48	      0	  11469	   2ccd	drivers/media/tuners/tuner-types.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/media/tuners/tuner-simple.c |  20 +-
 drivers/media/tuners/tuner-types.c  | 296 ++++++++++++++--------------
 include/media/tuner-types.h         |   6 +-
 3 files changed, 161 insertions(+), 161 deletions(-)

diff --git a/drivers/media/tuners/tuner-simple.c b/drivers/media/tuners/tuner-simple.c
index 8fb186b25d6a..b52cd8bd07dd 100644
--- a/drivers/media/tuners/tuner-simple.c
+++ b/drivers/media/tuners/tuner-simple.c
@@ -112,7 +112,7 @@ struct tuner_simple_priv {
 	struct list_head hybrid_tuner_instance_list;
 
 	unsigned int type;
-	struct tunertype *tun;
+	const struct tunertype *tun;
 
 	u32 frequency;
 	u32 bandwidth;
@@ -232,11 +232,11 @@ static inline char *tuner_param_name(enum param_type type)
 	return name;
 }
 
-static struct tuner_params *simple_tuner_params(struct dvb_frontend *fe,
-						enum param_type desired_type)
+static const struct tuner_params *simple_tuner_params(struct dvb_frontend *fe,
+						      enum param_type desired_type)
 {
 	struct tuner_simple_priv *priv = fe->tuner_priv;
-	struct tunertype *tun = priv->tun;
+	const struct tunertype *tun = priv->tun;
 	int i;
 
 	for (i = 0; i < tun->count; i++)
@@ -257,7 +257,7 @@ static struct tuner_params *simple_tuner_params(struct dvb_frontend *fe,
 }
 
 static int simple_config_lookup(struct dvb_frontend *fe,
-				struct tuner_params *t_params,
+				const struct tuner_params *t_params,
 				unsigned *frequency, u8 *config, u8 *cb)
 {
 	struct tuner_simple_priv *priv = fe->tuner_priv;
@@ -549,7 +549,7 @@ static int simple_set_tv_freq(struct dvb_frontend *fe,
 	u8 buffer[4];
 	int rc, IFPCoff, i;
 	enum param_type desired_type;
-	struct tuner_params *t_params;
+	const struct tuner_params *t_params;
 
 	/* IFPCoff = Video Intermediate Frequency - Vif:
 		940  =16*58.75  NTSC/J (Japan)
@@ -664,12 +664,12 @@ static int simple_set_tv_freq(struct dvb_frontend *fe,
 static int simple_set_radio_freq(struct dvb_frontend *fe,
 				 struct analog_parameters *params)
 {
-	struct tunertype *tun;
+	const struct tunertype *tun;
 	struct tuner_simple_priv *priv = fe->tuner_priv;
 	u8 buffer[4];
 	u16 div;
 	int rc, j;
-	struct tuner_params *t_params;
+	const struct tuner_params *t_params;
 	unsigned int freq = params->frequency;
 	bool mono = params->audmode == V4L2_TUNER_MODE_MONO;
 
@@ -848,8 +848,8 @@ static u32 simple_dvb_configure(struct dvb_frontend *fe, u8 *buf,
 {
 	/* This function returns the tuned frequency on success, 0 on error */
 	struct tuner_simple_priv *priv = fe->tuner_priv;
-	struct tunertype *tun = priv->tun;
-	struct tuner_params *t_params;
+	const struct tunertype *tun = priv->tun;
+	const struct tuner_params *t_params;
 	u8 config, cb;
 	u32 div;
 	int ret;
diff --git a/drivers/media/tuners/tuner-types.c b/drivers/media/tuners/tuner-types.c
index c26f1296e18f..0716cc028212 100644
--- a/drivers/media/tuners/tuner-types.c
+++ b/drivers/media/tuners/tuner-types.c
@@ -61,13 +61,13 @@ static u8 tua603x_agc112[] = { 2, 0x80|0x40|0x18|0x04|0x01, 0x80|0x20 };
 /* 0-9 */
 /* ------------ TUNER_TEMIC_PAL - TEMIC PAL ------------ */
 
-static struct tuner_range tuner_temic_pal_ranges[] = {
+static const struct tuner_range tuner_temic_pal_ranges[] = {
 	{ 16 * 140.25 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 463.25 /*MHz*/, 0x8e, 0x04, },
 	{ 16 * 999.99        , 0x8e, 0x01, },
 };
 
-static struct tuner_params tuner_temic_pal_params[] = {
+static const struct tuner_params tuner_temic_pal_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_temic_pal_ranges,
@@ -77,13 +77,13 @@ static struct tuner_params tuner_temic_pal_params[] = {
 
 /* ------------ TUNER_PHILIPS_PAL_I - Philips PAL_I ------------ */
 
-static struct tuner_range tuner_philips_pal_i_ranges[] = {
+static const struct tuner_range tuner_philips_pal_i_ranges[] = {
 	{ 16 * 140.25 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 463.25 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_philips_pal_i_params[] = {
+static const struct tuner_params tuner_philips_pal_i_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_philips_pal_i_ranges,
@@ -93,13 +93,13 @@ static struct tuner_params tuner_philips_pal_i_params[] = {
 
 /* ------------ TUNER_PHILIPS_NTSC - Philips NTSC ------------ */
 
-static struct tuner_range tuner_philips_ntsc_ranges[] = {
+static const struct tuner_range tuner_philips_ntsc_ranges[] = {
 	{ 16 * 157.25 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 451.25 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_philips_ntsc_params[] = {
+static const struct tuner_params tuner_philips_ntsc_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_philips_ntsc_ranges,
@@ -110,13 +110,13 @@ static struct tuner_params tuner_philips_ntsc_params[] = {
 
 /* ------------ TUNER_PHILIPS_SECAM - Philips SECAM ------------ */
 
-static struct tuner_range tuner_philips_secam_ranges[] = {
+static const struct tuner_range tuner_philips_secam_ranges[] = {
 	{ 16 * 168.25 /*MHz*/, 0x8e, 0xa7, },
 	{ 16 * 447.25 /*MHz*/, 0x8e, 0x97, },
 	{ 16 * 999.99        , 0x8e, 0x37, },
 };
 
-static struct tuner_params tuner_philips_secam_params[] = {
+static const struct tuner_params tuner_philips_secam_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_SECAM,
 		.ranges = tuner_philips_secam_ranges,
@@ -127,13 +127,13 @@ static struct tuner_params tuner_philips_secam_params[] = {
 
 /* ------------ TUNER_PHILIPS_PAL - Philips PAL ------------ */
 
-static struct tuner_range tuner_philips_pal_ranges[] = {
+static const struct tuner_range tuner_philips_pal_ranges[] = {
 	{ 16 * 168.25 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 447.25 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_philips_pal_params[] = {
+static const struct tuner_params tuner_philips_pal_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_philips_pal_ranges,
@@ -144,13 +144,13 @@ static struct tuner_params tuner_philips_pal_params[] = {
 
 /* ------------ TUNER_TEMIC_NTSC - TEMIC NTSC ------------ */
 
-static struct tuner_range tuner_temic_ntsc_ranges[] = {
+static const struct tuner_range tuner_temic_ntsc_ranges[] = {
 	{ 16 * 157.25 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 463.25 /*MHz*/, 0x8e, 0x04, },
 	{ 16 * 999.99        , 0x8e, 0x01, },
 };
 
-static struct tuner_params tuner_temic_ntsc_params[] = {
+static const struct tuner_params tuner_temic_ntsc_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_temic_ntsc_ranges,
@@ -160,13 +160,13 @@ static struct tuner_params tuner_temic_ntsc_params[] = {
 
 /* ------------ TUNER_TEMIC_PAL_I - TEMIC PAL_I ------------ */
 
-static struct tuner_range tuner_temic_pal_i_ranges[] = {
+static const struct tuner_range tuner_temic_pal_i_ranges[] = {
 	{ 16 * 170.00 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 450.00 /*MHz*/, 0x8e, 0x04, },
 	{ 16 * 999.99        , 0x8e, 0x01, },
 };
 
-static struct tuner_params tuner_temic_pal_i_params[] = {
+static const struct tuner_params tuner_temic_pal_i_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_temic_pal_i_ranges,
@@ -176,13 +176,13 @@ static struct tuner_params tuner_temic_pal_i_params[] = {
 
 /* ------------ TUNER_TEMIC_4036FY5_NTSC - TEMIC NTSC ------------ */
 
-static struct tuner_range tuner_temic_4036fy5_ntsc_ranges[] = {
+static const struct tuner_range tuner_temic_4036fy5_ntsc_ranges[] = {
 	{ 16 * 157.25 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 463.25 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_temic_4036fy5_ntsc_params[] = {
+static const struct tuner_params tuner_temic_4036fy5_ntsc_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_temic_4036fy5_ntsc_ranges,
@@ -192,13 +192,13 @@ static struct tuner_params tuner_temic_4036fy5_ntsc_params[] = {
 
 /* ------------ TUNER_ALPS_TSBH1_NTSC - TEMIC NTSC ------------ */
 
-static struct tuner_range tuner_alps_tsb_1_ranges[] = {
+static const struct tuner_range tuner_alps_tsb_1_ranges[] = {
 	{ 16 * 137.25 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 385.25 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x08, },
 };
 
-static struct tuner_params tuner_alps_tsbh1_ntsc_params[] = {
+static const struct tuner_params tuner_alps_tsbh1_ntsc_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_alps_tsb_1_ranges,
@@ -209,7 +209,7 @@ static struct tuner_params tuner_alps_tsbh1_ntsc_params[] = {
 /* 10-19 */
 /* ------------ TUNER_ALPS_TSBE1_PAL - TEMIC PAL ------------ */
 
-static struct tuner_params tuner_alps_tsb_1_params[] = {
+static const struct tuner_params tuner_alps_tsb_1_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_alps_tsb_1_ranges,
@@ -219,13 +219,13 @@ static struct tuner_params tuner_alps_tsb_1_params[] = {
 
 /* ------------ TUNER_ALPS_TSBB5_PAL_I - Alps PAL_I ------------ */
 
-static struct tuner_range tuner_alps_tsb_5_pal_ranges[] = {
+static const struct tuner_range tuner_alps_tsb_5_pal_ranges[] = {
 	{ 16 * 133.25 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 351.25 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x08, },
 };
 
-static struct tuner_params tuner_alps_tsbb5_params[] = {
+static const struct tuner_params tuner_alps_tsbb5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_alps_tsb_5_pal_ranges,
@@ -235,7 +235,7 @@ static struct tuner_params tuner_alps_tsbb5_params[] = {
 
 /* ------------ TUNER_ALPS_TSBE5_PAL - Alps PAL ------------ */
 
-static struct tuner_params tuner_alps_tsbe5_params[] = {
+static const struct tuner_params tuner_alps_tsbe5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_alps_tsb_5_pal_ranges,
@@ -245,7 +245,7 @@ static struct tuner_params tuner_alps_tsbe5_params[] = {
 
 /* ------------ TUNER_ALPS_TSBC5_PAL - Alps PAL ------------ */
 
-static struct tuner_params tuner_alps_tsbc5_params[] = {
+static const struct tuner_params tuner_alps_tsbc5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_alps_tsb_5_pal_ranges,
@@ -255,13 +255,13 @@ static struct tuner_params tuner_alps_tsbc5_params[] = {
 
 /* ------------ TUNER_TEMIC_4006FH5_PAL - TEMIC PAL ------------ */
 
-static struct tuner_range tuner_lg_pal_ranges[] = {
+static const struct tuner_range tuner_lg_pal_ranges[] = {
 	{ 16 * 170.00 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 450.00 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_temic_4006fh5_params[] = {
+static const struct tuner_params tuner_temic_4006fh5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_lg_pal_ranges,
@@ -271,13 +271,13 @@ static struct tuner_params tuner_temic_4006fh5_params[] = {
 
 /* ------------ TUNER_ALPS_TSHC6_NTSC - Alps NTSC ------------ */
 
-static struct tuner_range tuner_alps_tshc6_ntsc_ranges[] = {
+static const struct tuner_range tuner_alps_tshc6_ntsc_ranges[] = {
 	{ 16 * 137.25 /*MHz*/, 0x8e, 0x14, },
 	{ 16 * 385.25 /*MHz*/, 0x8e, 0x12, },
 	{ 16 * 999.99        , 0x8e, 0x11, },
 };
 
-static struct tuner_params tuner_alps_tshc6_params[] = {
+static const struct tuner_params tuner_alps_tshc6_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_alps_tshc6_ntsc_ranges,
@@ -287,13 +287,13 @@ static struct tuner_params tuner_alps_tshc6_params[] = {
 
 /* ------------ TUNER_TEMIC_PAL_DK - TEMIC PAL ------------ */
 
-static struct tuner_range tuner_temic_pal_dk_ranges[] = {
+static const struct tuner_range tuner_temic_pal_dk_ranges[] = {
 	{ 16 * 168.25 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 456.25 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_temic_pal_dk_params[] = {
+static const struct tuner_params tuner_temic_pal_dk_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_temic_pal_dk_ranges,
@@ -303,13 +303,13 @@ static struct tuner_params tuner_temic_pal_dk_params[] = {
 
 /* ------------ TUNER_PHILIPS_NTSC_M - Philips NTSC ------------ */
 
-static struct tuner_range tuner_philips_ntsc_m_ranges[] = {
+static const struct tuner_range tuner_philips_ntsc_m_ranges[] = {
 	{ 16 * 160.00 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 454.00 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_philips_ntsc_m_params[] = {
+static const struct tuner_params tuner_philips_ntsc_m_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_philips_ntsc_m_ranges,
@@ -319,13 +319,13 @@ static struct tuner_params tuner_philips_ntsc_m_params[] = {
 
 /* ------------ TUNER_TEMIC_4066FY5_PAL_I - TEMIC PAL_I ------------ */
 
-static struct tuner_range tuner_temic_40x6f_5_pal_ranges[] = {
+static const struct tuner_range tuner_temic_40x6f_5_pal_ranges[] = {
 	{ 16 * 169.00 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 454.00 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_temic_4066fy5_pal_i_params[] = {
+static const struct tuner_params tuner_temic_4066fy5_pal_i_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_temic_40x6f_5_pal_ranges,
@@ -335,7 +335,7 @@ static struct tuner_params tuner_temic_4066fy5_pal_i_params[] = {
 
 /* ------------ TUNER_TEMIC_4006FN5_MULTI_PAL - TEMIC PAL ------------ */
 
-static struct tuner_params tuner_temic_4006fn5_multi_params[] = {
+static const struct tuner_params tuner_temic_4006fn5_multi_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_temic_40x6f_5_pal_ranges,
@@ -346,13 +346,13 @@ static struct tuner_params tuner_temic_4006fn5_multi_params[] = {
 /* 20-29 */
 /* ------------ TUNER_TEMIC_4009FR5_PAL - TEMIC PAL ------------ */
 
-static struct tuner_range tuner_temic_4009f_5_pal_ranges[] = {
+static const struct tuner_range tuner_temic_4009f_5_pal_ranges[] = {
 	{ 16 * 141.00 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 464.00 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_temic_4009f_5_params[] = {
+static const struct tuner_params tuner_temic_4009f_5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_temic_4009f_5_pal_ranges,
@@ -362,13 +362,13 @@ static struct tuner_params tuner_temic_4009f_5_params[] = {
 
 /* ------------ TUNER_TEMIC_4039FR5_NTSC - TEMIC NTSC ------------ */
 
-static struct tuner_range tuner_temic_4x3x_f_5_ntsc_ranges[] = {
+static const struct tuner_range tuner_temic_4x3x_f_5_ntsc_ranges[] = {
 	{ 16 * 158.00 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 453.00 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_temic_4039fr5_params[] = {
+static const struct tuner_params tuner_temic_4039fr5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_temic_4x3x_f_5_ntsc_ranges,
@@ -378,7 +378,7 @@ static struct tuner_params tuner_temic_4039fr5_params[] = {
 
 /* ------------ TUNER_TEMIC_4046FM5 - TEMIC PAL ------------ */
 
-static struct tuner_params tuner_temic_4046fm5_params[] = {
+static const struct tuner_params tuner_temic_4046fm5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_temic_40x6f_5_pal_ranges,
@@ -388,7 +388,7 @@ static struct tuner_params tuner_temic_4046fm5_params[] = {
 
 /* ------------ TUNER_PHILIPS_PAL_DK - Philips PAL ------------ */
 
-static struct tuner_params tuner_philips_pal_dk_params[] = {
+static const struct tuner_params tuner_philips_pal_dk_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_lg_pal_ranges,
@@ -398,7 +398,7 @@ static struct tuner_params tuner_philips_pal_dk_params[] = {
 
 /* ------------ TUNER_PHILIPS_FQ1216ME - Philips PAL ------------ */
 
-static struct tuner_params tuner_philips_fq1216me_params[] = {
+static const struct tuner_params tuner_philips_fq1216me_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_lg_pal_ranges,
@@ -412,7 +412,7 @@ static struct tuner_params tuner_philips_fq1216me_params[] = {
 
 /* ------------ TUNER_LG_PAL_I_FM - LGINNOTEK PAL_I ------------ */
 
-static struct tuner_params tuner_lg_pal_i_fm_params[] = {
+static const struct tuner_params tuner_lg_pal_i_fm_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_lg_pal_ranges,
@@ -422,7 +422,7 @@ static struct tuner_params tuner_lg_pal_i_fm_params[] = {
 
 /* ------------ TUNER_LG_PAL_I - LGINNOTEK PAL_I ------------ */
 
-static struct tuner_params tuner_lg_pal_i_params[] = {
+static const struct tuner_params tuner_lg_pal_i_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_lg_pal_ranges,
@@ -432,13 +432,13 @@ static struct tuner_params tuner_lg_pal_i_params[] = {
 
 /* ------------ TUNER_LG_NTSC_FM - LGINNOTEK NTSC ------------ */
 
-static struct tuner_range tuner_lg_ntsc_fm_ranges[] = {
+static const struct tuner_range tuner_lg_ntsc_fm_ranges[] = {
 	{ 16 * 210.00 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 497.00 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_lg_ntsc_fm_params[] = {
+static const struct tuner_params tuner_lg_ntsc_fm_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_lg_ntsc_fm_ranges,
@@ -448,7 +448,7 @@ static struct tuner_params tuner_lg_ntsc_fm_params[] = {
 
 /* ------------ TUNER_LG_PAL_FM - LGINNOTEK PAL ------------ */
 
-static struct tuner_params tuner_lg_pal_fm_params[] = {
+static const struct tuner_params tuner_lg_pal_fm_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_lg_pal_ranges,
@@ -458,7 +458,7 @@ static struct tuner_params tuner_lg_pal_fm_params[] = {
 
 /* ------------ TUNER_LG_PAL - LGINNOTEK PAL ------------ */
 
-static struct tuner_params tuner_lg_pal_params[] = {
+static const struct tuner_params tuner_lg_pal_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_lg_pal_ranges,
@@ -469,7 +469,7 @@ static struct tuner_params tuner_lg_pal_params[] = {
 /* 30-39 */
 /* ------------ TUNER_TEMIC_4009FN5_MULTI_PAL_FM - TEMIC PAL ------------ */
 
-static struct tuner_params tuner_temic_4009_fn5_multi_pal_fm_params[] = {
+static const struct tuner_params tuner_temic_4009_fn5_multi_pal_fm_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_temic_4009f_5_pal_ranges,
@@ -479,13 +479,13 @@ static struct tuner_params tuner_temic_4009_fn5_multi_pal_fm_params[] = {
 
 /* ------------ TUNER_SHARP_2U5JF5540_NTSC - SHARP NTSC ------------ */
 
-static struct tuner_range tuner_sharp_2u5jf5540_ntsc_ranges[] = {
+static const struct tuner_range tuner_sharp_2u5jf5540_ntsc_ranges[] = {
 	{ 16 * 137.25 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 317.25 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x08, },
 };
 
-static struct tuner_params tuner_sharp_2u5jf5540_params[] = {
+static const struct tuner_params tuner_sharp_2u5jf5540_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_sharp_2u5jf5540_ntsc_ranges,
@@ -495,13 +495,13 @@ static struct tuner_params tuner_sharp_2u5jf5540_params[] = {
 
 /* ------------ TUNER_Samsung_PAL_TCPM9091PD27 - Samsung PAL ------------ */
 
-static struct tuner_range tuner_samsung_pal_tcpm9091pd27_ranges[] = {
+static const struct tuner_range tuner_samsung_pal_tcpm9091pd27_ranges[] = {
 	{ 16 * 169 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 464 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99     , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_samsung_pal_tcpm9091pd27_params[] = {
+static const struct tuner_params tuner_samsung_pal_tcpm9091pd27_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_samsung_pal_tcpm9091pd27_ranges,
@@ -511,7 +511,7 @@ static struct tuner_params tuner_samsung_pal_tcpm9091pd27_params[] = {
 
 /* ------------ TUNER_TEMIC_4106FH5 - TEMIC PAL ------------ */
 
-static struct tuner_params tuner_temic_4106fh5_params[] = {
+static const struct tuner_params tuner_temic_4106fh5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_temic_4009f_5_pal_ranges,
@@ -521,7 +521,7 @@ static struct tuner_params tuner_temic_4106fh5_params[] = {
 
 /* ------------ TUNER_TEMIC_4012FY5 - TEMIC PAL ------------ */
 
-static struct tuner_params tuner_temic_4012fy5_params[] = {
+static const struct tuner_params tuner_temic_4012fy5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_temic_pal_ranges,
@@ -531,7 +531,7 @@ static struct tuner_params tuner_temic_4012fy5_params[] = {
 
 /* ------------ TUNER_TEMIC_4136FY5 - TEMIC NTSC ------------ */
 
-static struct tuner_params tuner_temic_4136_fy5_params[] = {
+static const struct tuner_params tuner_temic_4136_fy5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_temic_4x3x_f_5_ntsc_ranges,
@@ -541,13 +541,13 @@ static struct tuner_params tuner_temic_4136_fy5_params[] = {
 
 /* ------------ TUNER_LG_PAL_NEW_TAPC - LGINNOTEK PAL ------------ */
 
-static struct tuner_range tuner_lg_new_tapc_ranges[] = {
+static const struct tuner_range tuner_lg_new_tapc_ranges[] = {
 	{ 16 * 170.00 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 450.00 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x08, },
 };
 
-static struct tuner_params tuner_lg_pal_new_tapc_params[] = {
+static const struct tuner_params tuner_lg_pal_new_tapc_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_lg_new_tapc_ranges,
@@ -557,13 +557,13 @@ static struct tuner_params tuner_lg_pal_new_tapc_params[] = {
 
 /* ------------ TUNER_PHILIPS_FM1216ME_MK3 - Philips PAL ------------ */
 
-static struct tuner_range tuner_fm1216me_mk3_pal_ranges[] = {
+static const struct tuner_range tuner_fm1216me_mk3_pal_ranges[] = {
 	{ 16 * 158.00 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 442.00 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x04, },
 };
 
-static struct tuner_params tuner_fm1216me_mk3_params[] = {
+static const struct tuner_params tuner_fm1216me_mk3_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_fm1216me_mk3_pal_ranges,
@@ -582,13 +582,13 @@ static struct tuner_params tuner_fm1216me_mk3_params[] = {
 
 /* ------------ TUNER_PHILIPS_FM1216MK5 - Philips PAL ------------ */
 
-static struct tuner_range tuner_fm1216mk5_pal_ranges[] = {
+static const struct tuner_range tuner_fm1216mk5_pal_ranges[] = {
 	{ 16 * 158.00 /*MHz*/, 0xce, 0x01, },
 	{ 16 * 441.00 /*MHz*/, 0xce, 0x02, },
 	{ 16 * 864.00        , 0xce, 0x04, },
 };
 
-static struct tuner_params tuner_fm1216mk5_params[] = {
+static const struct tuner_params tuner_fm1216mk5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_fm1216mk5_pal_ranges,
@@ -607,7 +607,7 @@ static struct tuner_params tuner_fm1216mk5_params[] = {
 
 /* ------------ TUNER_LG_NTSC_NEW_TAPC - LGINNOTEK NTSC ------------ */
 
-static struct tuner_params tuner_lg_ntsc_new_tapc_params[] = {
+static const struct tuner_params tuner_lg_ntsc_new_tapc_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_lg_new_tapc_ranges,
@@ -618,7 +618,7 @@ static struct tuner_params tuner_lg_ntsc_new_tapc_params[] = {
 /* 40-49 */
 /* ------------ TUNER_HITACHI_NTSC - HITACHI NTSC ------------ */
 
-static struct tuner_params tuner_hitachi_ntsc_params[] = {
+static const struct tuner_params tuner_hitachi_ntsc_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_lg_new_tapc_ranges,
@@ -628,13 +628,13 @@ static struct tuner_params tuner_hitachi_ntsc_params[] = {
 
 /* ------------ TUNER_PHILIPS_PAL_MK - Philips PAL ------------ */
 
-static struct tuner_range tuner_philips_pal_mk_pal_ranges[] = {
+static const struct tuner_range tuner_philips_pal_mk_pal_ranges[] = {
 	{ 16 * 140.25 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 463.25 /*MHz*/, 0x8e, 0xc2, },
 	{ 16 * 999.99        , 0x8e, 0xcf, },
 };
 
-static struct tuner_params tuner_philips_pal_mk_params[] = {
+static const struct tuner_params tuner_philips_pal_mk_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_philips_pal_mk_pal_ranges,
@@ -644,19 +644,19 @@ static struct tuner_params tuner_philips_pal_mk_params[] = {
 
 /* ---- TUNER_PHILIPS_FCV1236D - Philips FCV1236D (ATSC/NTSC) ---- */
 
-static struct tuner_range tuner_philips_fcv1236d_ntsc_ranges[] = {
+static const struct tuner_range tuner_philips_fcv1236d_ntsc_ranges[] = {
 	{ 16 * 157.25 /*MHz*/, 0x8e, 0xa2, },
 	{ 16 * 451.25 /*MHz*/, 0x8e, 0x92, },
 	{ 16 * 999.99        , 0x8e, 0x32, },
 };
 
-static struct tuner_range tuner_philips_fcv1236d_atsc_ranges[] = {
+static const struct tuner_range tuner_philips_fcv1236d_atsc_ranges[] = {
 	{ 16 * 159.00 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 453.00 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_philips_fcv1236d_params[] = {
+static const struct tuner_params tuner_philips_fcv1236d_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_philips_fcv1236d_ntsc_ranges,
@@ -672,13 +672,13 @@ static struct tuner_params tuner_philips_fcv1236d_params[] = {
 
 /* ------------ TUNER_PHILIPS_FM1236_MK3 - Philips NTSC ------------ */
 
-static struct tuner_range tuner_fm1236_mk3_ntsc_ranges[] = {
+static const struct tuner_range tuner_fm1236_mk3_ntsc_ranges[] = {
 	{ 16 * 160.00 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 442.00 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x04, },
 };
 
-static struct tuner_params tuner_fm1236_mk3_params[] = {
+static const struct tuner_params tuner_fm1236_mk3_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_fm1236_mk3_ntsc_ranges,
@@ -693,7 +693,7 @@ static struct tuner_params tuner_fm1236_mk3_params[] = {
 
 /* ------------ TUNER_PHILIPS_4IN1 - Philips NTSC ------------ */
 
-static struct tuner_params tuner_philips_4in1_params[] = {
+static const struct tuner_params tuner_philips_4in1_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_fm1236_mk3_ntsc_ranges,
@@ -703,7 +703,7 @@ static struct tuner_params tuner_philips_4in1_params[] = {
 
 /* ------------ TUNER_MICROTUNE_4049FM5 - Microtune PAL ------------ */
 
-static struct tuner_params tuner_microtune_4049_fm5_params[] = {
+static const struct tuner_params tuner_microtune_4049_fm5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_temic_4009f_5_pal_ranges,
@@ -718,13 +718,13 @@ static struct tuner_params tuner_microtune_4049_fm5_params[] = {
 
 /* ------------ TUNER_PANASONIC_VP27 - Panasonic NTSC ------------ */
 
-static struct tuner_range tuner_panasonic_vp27_ntsc_ranges[] = {
+static const struct tuner_range tuner_panasonic_vp27_ntsc_ranges[] = {
 	{ 16 * 160.00 /*MHz*/, 0xce, 0x01, },
 	{ 16 * 454.00 /*MHz*/, 0xce, 0x02, },
 	{ 16 * 999.99        , 0xce, 0x08, },
 };
 
-static struct tuner_params tuner_panasonic_vp27_params[] = {
+static const struct tuner_params tuner_panasonic_vp27_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_panasonic_vp27_ntsc_ranges,
@@ -739,13 +739,13 @@ static struct tuner_params tuner_panasonic_vp27_params[] = {
 
 /* ------------ TUNER_TNF_8831BGFF - Philips PAL ------------ */
 
-static struct tuner_range tuner_tnf_8831bgff_pal_ranges[] = {
+static const struct tuner_range tuner_tnf_8831bgff_pal_ranges[] = {
 	{ 16 * 161.25 /*MHz*/, 0x8e, 0xa0, },
 	{ 16 * 463.25 /*MHz*/, 0x8e, 0x90, },
 	{ 16 * 999.99        , 0x8e, 0x30, },
 };
 
-static struct tuner_params tuner_tnf_8831bgff_params[] = {
+static const struct tuner_params tuner_tnf_8831bgff_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_tnf_8831bgff_pal_ranges,
@@ -755,19 +755,19 @@ static struct tuner_params tuner_tnf_8831bgff_params[] = {
 
 /* ------------ TUNER_MICROTUNE_4042FI5 - Microtune NTSC ------------ */
 
-static struct tuner_range tuner_microtune_4042fi5_ntsc_ranges[] = {
+static const struct tuner_range tuner_microtune_4042fi5_ntsc_ranges[] = {
 	{ 16 * 162.00 /*MHz*/, 0x8e, 0xa2, },
 	{ 16 * 457.00 /*MHz*/, 0x8e, 0x94, },
 	{ 16 * 999.99        , 0x8e, 0x31, },
 };
 
-static struct tuner_range tuner_microtune_4042fi5_atsc_ranges[] = {
+static const struct tuner_range tuner_microtune_4042fi5_atsc_ranges[] = {
 	{ 16 * 162.00 /*MHz*/, 0x8e, 0xa1, },
 	{ 16 * 457.00 /*MHz*/, 0x8e, 0x91, },
 	{ 16 * 999.99        , 0x8e, 0x31, },
 };
 
-static struct tuner_params tuner_microtune_4042fi5_params[] = {
+static const struct tuner_params tuner_microtune_4042fi5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_microtune_4042fi5_ntsc_ranges,
@@ -784,13 +784,13 @@ static struct tuner_params tuner_microtune_4042fi5_params[] = {
 /* 50-59 */
 /* ------------ TUNER_TCL_2002N - TCL NTSC ------------ */
 
-static struct tuner_range tuner_tcl_2002n_ntsc_ranges[] = {
+static const struct tuner_range tuner_tcl_2002n_ntsc_ranges[] = {
 	{ 16 * 172.00 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 448.00 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x08, },
 };
 
-static struct tuner_params tuner_tcl_2002n_params[] = {
+static const struct tuner_params tuner_tcl_2002n_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_tcl_2002n_ntsc_ranges,
@@ -801,7 +801,7 @@ static struct tuner_params tuner_tcl_2002n_params[] = {
 
 /* ------------ TUNER_PHILIPS_FM1256_IH3 - Philips PAL ------------ */
 
-static struct tuner_params tuner_philips_fm1256_ih3_params[] = {
+static const struct tuner_params tuner_philips_fm1256_ih3_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_fm1236_mk3_ntsc_ranges,
@@ -813,13 +813,13 @@ static struct tuner_params tuner_philips_fm1256_ih3_params[] = {
 /* ------------ TUNER_THOMSON_DTT7610 - THOMSON ATSC ------------ */
 
 /* single range used for both ntsc and atsc */
-static struct tuner_range tuner_thomson_dtt7610_ntsc_ranges[] = {
+static const struct tuner_range tuner_thomson_dtt7610_ntsc_ranges[] = {
 	{ 16 * 157.25 /*MHz*/, 0x8e, 0x39, },
 	{ 16 * 454.00 /*MHz*/, 0x8e, 0x3a, },
 	{ 16 * 999.99        , 0x8e, 0x3c, },
 };
 
-static struct tuner_params tuner_thomson_dtt7610_params[] = {
+static const struct tuner_params tuner_thomson_dtt7610_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_thomson_dtt7610_ntsc_ranges,
@@ -835,13 +835,13 @@ static struct tuner_params tuner_thomson_dtt7610_params[] = {
 
 /* ------------ TUNER_PHILIPS_FQ1286 - Philips NTSC ------------ */
 
-static struct tuner_range tuner_philips_fq1286_ntsc_ranges[] = {
+static const struct tuner_range tuner_philips_fq1286_ntsc_ranges[] = {
 	{ 16 * 160.00 /*MHz*/, 0x8e, 0x41, },
 	{ 16 * 454.00 /*MHz*/, 0x8e, 0x42, },
 	{ 16 * 999.99        , 0x8e, 0x04, },
 };
 
-static struct tuner_params tuner_philips_fq1286_params[] = {
+static const struct tuner_params tuner_philips_fq1286_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_philips_fq1286_ntsc_ranges,
@@ -851,13 +851,13 @@ static struct tuner_params tuner_philips_fq1286_params[] = {
 
 /* ------------ TUNER_TCL_2002MB - TCL PAL ------------ */
 
-static struct tuner_range tuner_tcl_2002mb_pal_ranges[] = {
+static const struct tuner_range tuner_tcl_2002mb_pal_ranges[] = {
 	{ 16 * 170.00 /*MHz*/, 0xce, 0x01, },
 	{ 16 * 450.00 /*MHz*/, 0xce, 0x02, },
 	{ 16 * 999.99        , 0xce, 0x08, },
 };
 
-static struct tuner_params tuner_tcl_2002mb_params[] = {
+static const struct tuner_params tuner_tcl_2002mb_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_tcl_2002mb_pal_ranges,
@@ -867,13 +867,13 @@ static struct tuner_params tuner_tcl_2002mb_params[] = {
 
 /* ------------ TUNER_PHILIPS_FQ1216AME_MK4 - Philips PAL ------------ */
 
-static struct tuner_range tuner_philips_fq12_6a___mk4_pal_ranges[] = {
+static const struct tuner_range tuner_philips_fq12_6a___mk4_pal_ranges[] = {
 	{ 16 * 160.00 /*MHz*/, 0xce, 0x01, },
 	{ 16 * 442.00 /*MHz*/, 0xce, 0x02, },
 	{ 16 * 999.99        , 0xce, 0x04, },
 };
 
-static struct tuner_params tuner_philips_fq1216ame_mk4_params[] = {
+static const struct tuner_params tuner_philips_fq1216ame_mk4_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_philips_fq12_6a___mk4_pal_ranges,
@@ -890,7 +890,7 @@ static struct tuner_params tuner_philips_fq1216ame_mk4_params[] = {
 
 /* ------------ TUNER_PHILIPS_FQ1236A_MK4 - Philips NTSC ------------ */
 
-static struct tuner_params tuner_philips_fq1236a_mk4_params[] = {
+static const struct tuner_params tuner_philips_fq1236a_mk4_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_fm1236_mk3_ntsc_ranges,
@@ -900,7 +900,7 @@ static struct tuner_params tuner_philips_fq1236a_mk4_params[] = {
 
 /* ------------ TUNER_YMEC_TVF_8531MF - Philips NTSC ------------ */
 
-static struct tuner_params tuner_ymec_tvf_8531mf_params[] = {
+static const struct tuner_params tuner_ymec_tvf_8531mf_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_philips_ntsc_m_ranges,
@@ -910,13 +910,13 @@ static struct tuner_params tuner_ymec_tvf_8531mf_params[] = {
 
 /* ------------ TUNER_YMEC_TVF_5533MF - Philips NTSC ------------ */
 
-static struct tuner_range tuner_ymec_tvf_5533mf_ntsc_ranges[] = {
+static const struct tuner_range tuner_ymec_tvf_5533mf_ntsc_ranges[] = {
 	{ 16 * 160.00 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 454.00 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x04, },
 };
 
-static struct tuner_params tuner_ymec_tvf_5533mf_params[] = {
+static const struct tuner_params tuner_ymec_tvf_5533mf_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_ymec_tvf_5533mf_ntsc_ranges,
@@ -928,19 +928,19 @@ static struct tuner_params tuner_ymec_tvf_5533mf_params[] = {
 /* ------------ TUNER_THOMSON_DTT761X - THOMSON ATSC ------------ */
 /* DTT 7611 7611A 7612 7613 7613A 7614 7615 7615A */
 
-static struct tuner_range tuner_thomson_dtt761x_ntsc_ranges[] = {
+static const struct tuner_range tuner_thomson_dtt761x_ntsc_ranges[] = {
 	{ 16 * 145.25 /*MHz*/, 0x8e, 0x39, },
 	{ 16 * 415.25 /*MHz*/, 0x8e, 0x3a, },
 	{ 16 * 999.99        , 0x8e, 0x3c, },
 };
 
-static struct tuner_range tuner_thomson_dtt761x_atsc_ranges[] = {
+static const struct tuner_range tuner_thomson_dtt761x_atsc_ranges[] = {
 	{ 16 * 147.00 /*MHz*/, 0x8e, 0x39, },
 	{ 16 * 417.00 /*MHz*/, 0x8e, 0x3a, },
 	{ 16 * 999.99        , 0x8e, 0x3c, },
 };
 
-static struct tuner_params tuner_thomson_dtt761x_params[] = {
+static const struct tuner_params tuner_thomson_dtt761x_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_thomson_dtt761x_ntsc_ranges,
@@ -959,13 +959,13 @@ static struct tuner_params tuner_thomson_dtt761x_params[] = {
 
 /* ------------ TUNER_TENA_9533_DI - Philips PAL ------------ */
 
-static struct tuner_range tuner_tena_9533_di_pal_ranges[] = {
+static const struct tuner_range tuner_tena_9533_di_pal_ranges[] = {
 	{ 16 * 160.25 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 464.25 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x04, },
 };
 
-static struct tuner_params tuner_tena_9533_di_params[] = {
+static const struct tuner_params tuner_tena_9533_di_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_tena_9533_di_pal_ranges,
@@ -975,13 +975,13 @@ static struct tuner_params tuner_tena_9533_di_params[] = {
 
 /* ------------ TUNER_TENA_TNF_5337 - Tena tnf5337MFD STD M/N ------------ */
 
-static struct tuner_range tuner_tena_tnf_5337_ntsc_ranges[] = {
+static const struct tuner_range tuner_tena_tnf_5337_ntsc_ranges[] = {
 	{ 16 * 166.25 /*MHz*/, 0x86, 0x01, },
 	{ 16 * 466.25 /*MHz*/, 0x86, 0x02, },
 	{ 16 * 999.99        , 0x86, 0x08, },
 };
 
-static struct tuner_params tuner_tena_tnf_5337_params[] = {
+static const struct tuner_params tuner_tena_tnf_5337_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_tena_tnf_5337_ntsc_ranges,
@@ -991,13 +991,13 @@ static struct tuner_params tuner_tena_tnf_5337_params[] = {
 
 /* ------------ TUNER_PHILIPS_FMD1216ME(X)_MK3 - Philips PAL ------------ */
 
-static struct tuner_range tuner_philips_fmd1216me_mk3_pal_ranges[] = {
+static const struct tuner_range tuner_philips_fmd1216me_mk3_pal_ranges[] = {
 	{ 16 * 160.00 /*MHz*/, 0x86, 0x51, },
 	{ 16 * 442.00 /*MHz*/, 0x86, 0x52, },
 	{ 16 * 999.99        , 0x86, 0x54, },
 };
 
-static struct tuner_range tuner_philips_fmd1216me_mk3_dvb_ranges[] = {
+static const struct tuner_range tuner_philips_fmd1216me_mk3_dvb_ranges[] = {
 	{ 16 * 143.87 /*MHz*/, 0xbc, 0x41 },
 	{ 16 * 158.87 /*MHz*/, 0xf4, 0x41 },
 	{ 16 * 329.87 /*MHz*/, 0xbc, 0x42 },
@@ -1007,7 +1007,7 @@ static struct tuner_range tuner_philips_fmd1216me_mk3_dvb_ranges[] = {
 	{ 16 * 999.99        , 0xfc, 0x44 },
 };
 
-static struct tuner_params tuner_philips_fmd1216me_mk3_params[] = {
+static const struct tuner_params tuner_philips_fmd1216me_mk3_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_philips_fmd1216me_mk3_pal_ranges,
@@ -1027,7 +1027,7 @@ static struct tuner_params tuner_philips_fmd1216me_mk3_params[] = {
 	},
 };
 
-static struct tuner_params tuner_philips_fmd1216mex_mk3_params[] = {
+static const struct tuner_params tuner_philips_fmd1216mex_mk3_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_philips_fmd1216me_mk3_pal_ranges,
@@ -1051,19 +1051,19 @@ static struct tuner_params tuner_philips_fmd1216mex_mk3_params[] = {
 
 /* ------ TUNER_LG_TDVS_H06XF - LG INNOTEK / INFINEON ATSC ----- */
 
-static struct tuner_range tuner_tua6034_ntsc_ranges[] = {
+static const struct tuner_range tuner_tua6034_ntsc_ranges[] = {
 	{ 16 * 165.00 /*MHz*/, 0x8e, 0x01 },
 	{ 16 * 450.00 /*MHz*/, 0x8e, 0x02 },
 	{ 16 * 999.99        , 0x8e, 0x04 },
 };
 
-static struct tuner_range tuner_tua6034_atsc_ranges[] = {
+static const struct tuner_range tuner_tua6034_atsc_ranges[] = {
 	{ 16 * 165.00 /*MHz*/, 0xce, 0x01 },
 	{ 16 * 450.00 /*MHz*/, 0xce, 0x02 },
 	{ 16 * 999.99        , 0xce, 0x04 },
 };
 
-static struct tuner_params tuner_lg_tdvs_h06xf_params[] = {
+static const struct tuner_params tuner_lg_tdvs_h06xf_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_tua6034_ntsc_ranges,
@@ -1079,13 +1079,13 @@ static struct tuner_params tuner_lg_tdvs_h06xf_params[] = {
 
 /* ------------ TUNER_YMEC_TVF66T5_B_DFF - Philips PAL ------------ */
 
-static struct tuner_range tuner_ymec_tvf66t5_b_dff_pal_ranges[] = {
+static const struct tuner_range tuner_ymec_tvf66t5_b_dff_pal_ranges[] = {
 	{ 16 * 160.25 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 464.25 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x08, },
 };
 
-static struct tuner_params tuner_ymec_tvf66t5_b_dff_params[] = {
+static const struct tuner_params tuner_ymec_tvf66t5_b_dff_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_ymec_tvf66t5_b_dff_pal_ranges,
@@ -1095,19 +1095,19 @@ static struct tuner_params tuner_ymec_tvf66t5_b_dff_params[] = {
 
 /* ------------ TUNER_LG_NTSC_TALN_MINI - LGINNOTEK NTSC ------------ */
 
-static struct tuner_range tuner_lg_taln_ntsc_ranges[] = {
+static const struct tuner_range tuner_lg_taln_ntsc_ranges[] = {
 	{ 16 * 137.25 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 373.25 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x08, },
 };
 
-static struct tuner_range tuner_lg_taln_pal_secam_ranges[] = {
+static const struct tuner_range tuner_lg_taln_pal_secam_ranges[] = {
 	{ 16 * 150.00 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 425.00 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x08, },
 };
 
-static struct tuner_params tuner_lg_taln_params[] = {
+static const struct tuner_params tuner_lg_taln_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_lg_taln_ntsc_ranges,
@@ -1121,13 +1121,13 @@ static struct tuner_params tuner_lg_taln_params[] = {
 
 /* ------------ TUNER_PHILIPS_TD1316 - Philips PAL ------------ */
 
-static struct tuner_range tuner_philips_td1316_pal_ranges[] = {
+static const struct tuner_range tuner_philips_td1316_pal_ranges[] = {
 	{ 16 * 160.00 /*MHz*/, 0xc8, 0xa1, },
 	{ 16 * 442.00 /*MHz*/, 0xc8, 0xa2, },
 	{ 16 * 999.99        , 0xc8, 0xa4, },
 };
 
-static struct tuner_range tuner_philips_td1316_dvb_ranges[] = {
+static const struct tuner_range tuner_philips_td1316_dvb_ranges[] = {
 	{ 16 *  93.834 /*MHz*/, 0xca, 0x60, },
 	{ 16 * 123.834 /*MHz*/, 0xca, 0xa0, },
 	{ 16 * 163.834 /*MHz*/, 0xca, 0xc0, },
@@ -1139,7 +1139,7 @@ static struct tuner_range tuner_philips_td1316_dvb_ranges[] = {
 	{ 16 * 999.999        , 0xca, 0xe0, },
 };
 
-static struct tuner_params tuner_philips_td1316_params[] = {
+static const struct tuner_params tuner_philips_td1316_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_philips_td1316_pal_ranges,
@@ -1155,19 +1155,19 @@ static struct tuner_params tuner_philips_td1316_params[] = {
 
 /* ------------ TUNER_PHILIPS_TUV1236D - Philips ATSC ------------ */
 
-static struct tuner_range tuner_tuv1236d_ntsc_ranges[] = {
+static const struct tuner_range tuner_tuv1236d_ntsc_ranges[] = {
 	{ 16 * 157.25 /*MHz*/, 0xce, 0x01, },
 	{ 16 * 454.00 /*MHz*/, 0xce, 0x02, },
 	{ 16 * 999.99        , 0xce, 0x04, },
 };
 
-static struct tuner_range tuner_tuv1236d_atsc_ranges[] = {
+static const struct tuner_range tuner_tuv1236d_atsc_ranges[] = {
 	{ 16 * 157.25 /*MHz*/, 0xc6, 0x41, },
 	{ 16 * 454.00 /*MHz*/, 0xc6, 0x42, },
 	{ 16 * 999.99        , 0xc6, 0x44, },
 };
 
-static struct tuner_params tuner_tuv1236d_params[] = {
+static const struct tuner_params tuner_tuv1236d_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_tuv1236d_ntsc_ranges,
@@ -1187,19 +1187,19 @@ static struct tuner_params tuner_tuv1236d_params[] = {
  *	models based on TI SN 761677 chip on both PAL and NTSC
  */
 
-static struct tuner_range tuner_tnf_5335_d_if_pal_ranges[] = {
+static const struct tuner_range tuner_tnf_5335_d_if_pal_ranges[] = {
 	{ 16 * 168.25 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 471.25 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x08, },
 };
 
-static struct tuner_range tuner_tnf_5335mf_ntsc_ranges[] = {
+static const struct tuner_range tuner_tnf_5335mf_ntsc_ranges[] = {
 	{ 16 * 169.25 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 469.25 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x08, },
 };
 
-static struct tuner_params tuner_tnf_5335mf_params[] = {
+static const struct tuner_params tuner_tnf_5335mf_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_tnf_5335mf_ntsc_ranges,
@@ -1216,13 +1216,13 @@ static struct tuner_params tuner_tnf_5335mf_params[] = {
 /* ------------ TUNER_SAMSUNG_TCPN_2121P30A - Samsung NTSC ------------ */
 
 /* '+ 4' turns on the Low Noise Amplifier */
-static struct tuner_range tuner_samsung_tcpn_2121p30a_ntsc_ranges[] = {
+static const struct tuner_range tuner_samsung_tcpn_2121p30a_ntsc_ranges[] = {
 	{ 16 * 130.00 /*MHz*/, 0xce, 0x01 + 4, },
 	{ 16 * 364.50 /*MHz*/, 0xce, 0x02 + 4, },
 	{ 16 * 999.99        , 0xce, 0x08 + 4, },
 };
 
-static struct tuner_params tuner_samsung_tcpn_2121p30a_params[] = {
+static const struct tuner_params tuner_samsung_tcpn_2121p30a_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_samsung_tcpn_2121p30a_ntsc_ranges,
@@ -1232,20 +1232,20 @@ static struct tuner_params tuner_samsung_tcpn_2121p30a_params[] = {
 
 /* ------------ TUNER_THOMSON_FE6600 - DViCO Hybrid PAL ------------ */
 
-static struct tuner_range tuner_thomson_fe6600_pal_ranges[] = {
+static const struct tuner_range tuner_thomson_fe6600_pal_ranges[] = {
 	{ 16 * 160.00 /*MHz*/, 0xfe, 0x11, },
 	{ 16 * 442.00 /*MHz*/, 0xf6, 0x12, },
 	{ 16 * 999.99        , 0xf6, 0x18, },
 };
 
-static struct tuner_range tuner_thomson_fe6600_dvb_ranges[] = {
+static const struct tuner_range tuner_thomson_fe6600_dvb_ranges[] = {
 	{ 16 * 250.00 /*MHz*/, 0xb4, 0x12, },
 	{ 16 * 455.00 /*MHz*/, 0xfe, 0x11, },
 	{ 16 * 775.50 /*MHz*/, 0xbc, 0x18, },
 	{ 16 * 999.99        , 0xf4, 0x18, },
 };
 
-static struct tuner_params tuner_thomson_fe6600_params[] = {
+static const struct tuner_params tuner_thomson_fe6600_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_thomson_fe6600_pal_ranges,
@@ -1262,13 +1262,13 @@ static struct tuner_params tuner_thomson_fe6600_params[] = {
 /* ------------ TUNER_SAMSUNG_TCPG_6121P30A - Samsung PAL ------------ */
 
 /* '+ 4' turns on the Low Noise Amplifier */
-static struct tuner_range tuner_samsung_tcpg_6121p30a_pal_ranges[] = {
+static const struct tuner_range tuner_samsung_tcpg_6121p30a_pal_ranges[] = {
 	{ 16 * 146.25 /*MHz*/, 0xce, 0x01 + 4, },
 	{ 16 * 428.50 /*MHz*/, 0xce, 0x02 + 4, },
 	{ 16 * 999.99        , 0xce, 0x08 + 4, },
 };
 
-static struct tuner_params tuner_samsung_tcpg_6121p30a_params[] = {
+static const struct tuner_params tuner_samsung_tcpg_6121p30a_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_samsung_tcpg_6121p30a_pal_ranges,
@@ -1282,13 +1282,13 @@ static struct tuner_params tuner_samsung_tcpg_6121p30a_params[] = {
 
 /* ------------ TUNER_TCL_MF02GIP-5N-E - TCL MF02GIP-5N ------------ */
 
-static struct tuner_range tuner_tcl_mf02gip_5n_ntsc_ranges[] = {
+static const struct tuner_range tuner_tcl_mf02gip_5n_ntsc_ranges[] = {
 	{ 16 * 172.00 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 448.00 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x04, },
 };
 
-static struct tuner_params tuner_tcl_mf02gip_5n_params[] = {
+static const struct tuner_params tuner_tcl_mf02gip_5n_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_tcl_mf02gip_5n_ntsc_ranges,
@@ -1300,7 +1300,7 @@ static struct tuner_params tuner_tcl_mf02gip_5n_params[] = {
 /* 80-89 */
 /* --------- TUNER_PHILIPS_FQ1216LME_MK3 -- active loopthrough, no FM ------- */
 
-static struct tuner_params tuner_fq1216lme_mk3_params[] = {
+static const struct tuner_params tuner_fq1216lme_mk3_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_fm1216me_mk3_pal_ranges,
@@ -1321,7 +1321,7 @@ static struct tuner_params tuner_fq1216lme_mk3_params[] = {
 
 /* ----- TUNER_PARTSNIC_PTI_5NF05 - Partsnic (Daewoo) PTI-5NF05 NTSC ----- */
 
-static struct tuner_range tuner_partsnic_pti_5nf05_ranges[] = {
+static const struct tuner_range tuner_partsnic_pti_5nf05_ranges[] = {
 	/* The datasheet specified channel ranges and the bandswitch byte */
 	/* The control byte value of 0x8e is just a guess */
 	{ 16 * 133.25 /*MHz*/, 0x8e, 0x01, }, /* Channels    2 -    B */
@@ -1329,7 +1329,7 @@ static struct tuner_range tuner_partsnic_pti_5nf05_ranges[] = {
 	{ 16 * 999.99        , 0x8e, 0x08, }, /* Channels W+12 -   69 */
 };
 
-static struct tuner_params tuner_partsnic_pti_5nf05_params[] = {
+static const struct tuner_params tuner_partsnic_pti_5nf05_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_partsnic_pti_5nf05_ranges,
@@ -1340,13 +1340,13 @@ static struct tuner_params tuner_partsnic_pti_5nf05_params[] = {
 
 /* --------- TUNER_PHILIPS_CU1216L - DVB-C NIM ------------------------- */
 
-static struct tuner_range tuner_cu1216l_ranges[] = {
+static const struct tuner_range tuner_cu1216l_ranges[] = {
 	{ 16 * 160.25 /*MHz*/, 0xce, 0x01 },
 	{ 16 * 444.25 /*MHz*/, 0xce, 0x02 },
 	{ 16 * 999.99        , 0xce, 0x04 },
 };
 
-static struct tuner_params tuner_philips_cu1216l_params[] = {
+static const struct tuner_params tuner_philips_cu1216l_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_DIGITAL,
 		.ranges = tuner_cu1216l_ranges,
@@ -1357,13 +1357,13 @@ static struct tuner_params tuner_philips_cu1216l_params[] = {
 
 /* ---------------------- TUNER_SONY_BTF_PXN01Z ------------------------ */
 
-static struct tuner_range tuner_sony_btf_pxn01z_ranges[] = {
+static const struct tuner_range tuner_sony_btf_pxn01z_ranges[] = {
 	{ 16 * 137.25 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 367.25 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x04, },
 };
 
-static struct tuner_params tuner_sony_btf_pxn01z_params[] = {
+static const struct tuner_params tuner_sony_btf_pxn01z_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_sony_btf_pxn01z_ranges,
@@ -1373,7 +1373,7 @@ static struct tuner_params tuner_sony_btf_pxn01z_params[] = {
 
 /* ------------ TUNER_PHILIPS_FQ1236_MK5 - Philips NTSC ------------ */
 
-static struct tuner_params tuner_philips_fq1236_mk5_params[] = {
+static const struct tuner_params tuner_philips_fq1236_mk5_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_fm1236_mk3_ntsc_ranges,
@@ -1384,13 +1384,13 @@ static struct tuner_params tuner_philips_fq1236_mk5_params[] = {
 
 /* --------- Sony BTF-PG472Z PAL/SECAM ------- */
 
-static struct tuner_range tuner_sony_btf_pg472z_ranges[] = {
+static const struct tuner_range tuner_sony_btf_pg472z_ranges[] = {
 	{ 16 * 144.25 /*MHz*/, 0xc6, 0x01, },
 	{ 16 * 427.25 /*MHz*/, 0xc6, 0x02, },
 	{ 16 * 999.99        , 0xc6, 0x04, },
 };
 
-static struct tuner_params tuner_sony_btf_pg472z_params[] = {
+static const struct tuner_params tuner_sony_btf_pg472z_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_sony_btf_pg472z_ranges,
@@ -1404,13 +1404,13 @@ static struct tuner_params tuner_sony_btf_pg472z_params[] = {
 /* 90-99 */
 /* --------- Sony BTF-PG467Z NTSC-M-JP ------- */
 
-static struct tuner_range tuner_sony_btf_pg467z_ranges[] = {
+static const struct tuner_range tuner_sony_btf_pg467z_ranges[] = {
 	{ 16 * 220.25 /*MHz*/, 0xc6, 0x01, },
 	{ 16 * 467.25 /*MHz*/, 0xc6, 0x02, },
 	{ 16 * 999.99        , 0xc6, 0x04, },
 };
 
-static struct tuner_params tuner_sony_btf_pg467z_params[] = {
+static const struct tuner_params tuner_sony_btf_pg467z_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_sony_btf_pg467z_ranges,
@@ -1420,13 +1420,13 @@ static struct tuner_params tuner_sony_btf_pg467z_params[] = {
 
 /* --------- Sony BTF-PG463Z NTSC-M ------- */
 
-static struct tuner_range tuner_sony_btf_pg463z_ranges[] = {
+static const struct tuner_range tuner_sony_btf_pg463z_ranges[] = {
 	{ 16 * 130.25 /*MHz*/, 0xc6, 0x01, },
 	{ 16 * 364.25 /*MHz*/, 0xc6, 0x02, },
 	{ 16 * 999.99        , 0xc6, 0x04, },
 };
 
-static struct tuner_params tuner_sony_btf_pg463z_params[] = {
+static const struct tuner_params tuner_sony_btf_pg463z_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_NTSC,
 		.ranges = tuner_sony_btf_pg463z_ranges,
@@ -1436,13 +1436,13 @@ static struct tuner_params tuner_sony_btf_pg463z_params[] = {
 
 /* ------------- TUNER_TENA_TNF_931D_DFDR1 - NXP TDA6509A ------------- */
 
-static struct tuner_range tuner_tena_tnf_931d_dfdr1_ranges[] = {
+static const struct tuner_range tuner_tena_tnf_931d_dfdr1_ranges[] = {
 	{ 16 * 161.15 /*MHz*/, 0x8e, 0x01, },
 	{ 16 * 463.15 /*MHz*/, 0x8e, 0x02, },
 	{ 16 * 999.99        , 0x8e, 0x08, },
 };
 
-static struct tuner_params tuner_tena_tnf_931d_dfdr1_params[] = {
+static const struct tuner_params tuner_tena_tnf_931d_dfdr1_params[] = {
 	{
 		.type   = TUNER_PARAM_TYPE_PAL,
 		.ranges = tuner_tena_tnf_931d_dfdr1_ranges,
@@ -1452,7 +1452,7 @@ static struct tuner_params tuner_tena_tnf_931d_dfdr1_params[] = {
 
 /* --------------------------------------------------------------------- */
 
-struct tunertype tuners[] = {
+const struct tunertype tuners[] = {
 	/* 0-9 */
 	[TUNER_TEMIC_PAL] = { /* TEMIC PAL */
 		.name   = "Temic PAL (4002 FH5)",
diff --git a/include/media/tuner-types.h b/include/media/tuner-types.h
index df76ac8e658c..c79b773f750c 100644
--- a/include/media/tuner-types.h
+++ b/include/media/tuner-types.h
@@ -168,7 +168,7 @@ struct tuner_params {
 	u16 iffreq;
 
 	unsigned int count;
-	struct tuner_range *ranges;
+	const struct tuner_range *ranges;
 };
 
 /**
@@ -189,7 +189,7 @@ struct tuner_params {
 struct tunertype {
 	char *name;
 	unsigned int count;
-	struct tuner_params *params;
+	const struct tuner_params *params;
 
 	u16 min;
 	u16 max;
@@ -199,7 +199,7 @@ struct tunertype {
 	u8 *sleepdata;
 };
 
-extern struct tunertype tuners[];
+extern const struct tunertype tuners[];
 extern unsigned const int tuner_count;
 
 #endif
-- 
2.46.0


