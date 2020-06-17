Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9CCC1FD4E9
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 20:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgFQSwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 14:52:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:40486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727882AbgFQSwT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 14:52:19 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E49A21789;
        Wed, 17 Jun 2020 18:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592419938;
        bh=7AmvXJlxqBgNywJoaFgNk0iEDG8dIR6iFDwZ8EwfoO0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Tharhsq//t4bnpSd8pYTOc6IRfasjOcFycfvA+UEf2Z+SnYIFNXVSzSOb8Bvfl/We
         Sh28mLI9r5XKtzFb237KJJh3KVzNbxhu4LzpNWYR3KJ6ZfQgJB+fUsSi/wc1gVw5ru
         AvPKzhAaeBXAknTpseWyj0uzvZk32CO7DAFmfiOQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jldAW-00C8Ap-0U; Wed, 17 Jun 2020 20:52:16 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Brad Love <brad@nextdimension.cc>, Sean Young <sean@mess.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [RFC 3/4] media: dvb_frontend: move algo-specific settings to a function
Date:   Wed, 17 Jun 2020 20:52:13 +0200
Message-Id: <daa69edd80e7fcf979062273f3067cb7b5573d52.1592419750.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592419750.git.mchehab+huawei@kernel.org>
References: <cover.1592419750.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we're planning to call this code on a separate place, let's
fist move it to a different function.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 90 +++++++++++++++------------
 1 file changed, 49 insertions(+), 41 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 06ea30a689d7..ed85dc2a9183 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -1790,6 +1790,54 @@ static int dvbv3_set_delivery_system(struct dvb_frontend *fe)
 	return emulate_delivery_system(fe, delsys);
 }
 
+static void prepare_tuning_algo_parameters(struct dvb_frontend *fe)
+{
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	struct dvb_frontend_private *fepriv = fe->frontend_priv;
+	struct dvb_frontend_tune_settings fetunesettings;
+
+	/* get frontend-specific tuning settings */
+	memset(&fetunesettings, 0, sizeof(struct dvb_frontend_tune_settings));
+	if (fe->ops.get_tune_settings && (fe->ops.get_tune_settings(fe, &fetunesettings) == 0)) {
+		fepriv->min_delay = (fetunesettings.min_delay_ms * HZ) / 1000;
+		fepriv->max_drift = fetunesettings.max_drift;
+		fepriv->step_size = fetunesettings.step_size;
+	} else {
+		/* default values */
+		switch (c->delivery_system) {
+		case SYS_DVBS:
+		case SYS_DVBS2:
+		case SYS_ISDBS:
+		case SYS_TURBO:
+		case SYS_DVBC_ANNEX_A:
+		case SYS_DVBC_ANNEX_C:
+			fepriv->min_delay = HZ / 20;
+			fepriv->step_size = c->symbol_rate / 16000;
+			fepriv->max_drift = c->symbol_rate / 2000;
+			break;
+		case SYS_DVBT:
+		case SYS_DVBT2:
+		case SYS_ISDBT:
+		case SYS_DTMB:
+			fepriv->min_delay = HZ / 20;
+			fepriv->step_size = dvb_frontend_get_stepsize(fe) * 2;
+			fepriv->max_drift = (dvb_frontend_get_stepsize(fe) * 2) + 1;
+			break;
+		default:
+			/*
+			 * FIXME: This sounds wrong! if freqency_stepsize is
+			 * defined by the frontend, why not use it???
+			 */
+			fepriv->min_delay = HZ / 20;
+			fepriv->step_size = 0; /* no zigzag */
+			fepriv->max_drift = 0;
+			break;
+		}
+	}
+	if (dvb_override_tune_delay > 0)
+		fepriv->min_delay = (dvb_override_tune_delay * HZ) / 1000;
+}
+
 /**
  * dtv_property_process_set -  Sets a single DTV property
  * @fe:		Pointer to &struct dvb_frontend
@@ -2182,7 +2230,6 @@ static int dtv_set_frontend(struct dvb_frontend *fe)
 {
 	struct dvb_frontend_private *fepriv = fe->frontend_priv;
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
-	struct dvb_frontend_tune_settings fetunesettings;
 	u32 rolloff = 0;
 
 	if (dvb_frontend_check_parameters(fe) < 0)
@@ -2260,46 +2307,7 @@ static int dtv_set_frontend(struct dvb_frontend *fe)
 	if (c->hierarchy == HIERARCHY_NONE && c->code_rate_LP == FEC_NONE)
 		c->code_rate_LP = FEC_AUTO;
 
-	/* get frontend-specific tuning settings */
-	memset(&fetunesettings, 0, sizeof(struct dvb_frontend_tune_settings));
-	if (fe->ops.get_tune_settings && (fe->ops.get_tune_settings(fe, &fetunesettings) == 0)) {
-		fepriv->min_delay = (fetunesettings.min_delay_ms * HZ) / 1000;
-		fepriv->max_drift = fetunesettings.max_drift;
-		fepriv->step_size = fetunesettings.step_size;
-	} else {
-		/* default values */
-		switch (c->delivery_system) {
-		case SYS_DVBS:
-		case SYS_DVBS2:
-		case SYS_ISDBS:
-		case SYS_TURBO:
-		case SYS_DVBC_ANNEX_A:
-		case SYS_DVBC_ANNEX_C:
-			fepriv->min_delay = HZ / 20;
-			fepriv->step_size = c->symbol_rate / 16000;
-			fepriv->max_drift = c->symbol_rate / 2000;
-			break;
-		case SYS_DVBT:
-		case SYS_DVBT2:
-		case SYS_ISDBT:
-		case SYS_DTMB:
-			fepriv->min_delay = HZ / 20;
-			fepriv->step_size = dvb_frontend_get_stepsize(fe) * 2;
-			fepriv->max_drift = (dvb_frontend_get_stepsize(fe) * 2) + 1;
-			break;
-		default:
-			/*
-			 * FIXME: This sounds wrong! if freqency_stepsize is
-			 * defined by the frontend, why not use it???
-			 */
-			fepriv->min_delay = HZ / 20;
-			fepriv->step_size = 0; /* no zigzag */
-			fepriv->max_drift = 0;
-			break;
-		}
-	}
-	if (dvb_override_tune_delay > 0)
-		fepriv->min_delay = (dvb_override_tune_delay * HZ) / 1000;
+	prepare_tuning_algo_parameters(fe);
 
 	fepriv->state = FESTATE_RETUNE;
 
-- 
2.26.2

