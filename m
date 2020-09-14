Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4068E2687D0
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 11:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgINJDi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 05:03:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:37646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbgINJDc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 05:03:32 -0400
Received: from mail.kernel.org (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57516207C3;
        Mon, 14 Sep 2020 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600074211;
        bh=tLXQIY2CoWuylaBPgsY3ScsMvwtWmDwYLS1/jrbi+s0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pmegek0J3pqaS1iXMTDrLDuog8OdqVbuibw/XykyM0jduY1lQ3FN42wEMJrSbO00h
         8ulDy/rR8yhpB5brFuMsxgDLEI6WZn1Id5FPtcvHCs94T2FELJqmk1BBbiXJs5bKEv
         MfU1Jloo8d5UnNn5unAJDOpRRFnyYyIkPNPE/zYM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kHkOW-002dzk-6E; Mon, 14 Sep 2020 11:03:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH RFC 09/11] media: vidtv: add basic support for DVBv5 stats
Date:   Mon, 14 Sep 2020 11:03:24 +0200
Message-Id: <8df003fd261a36929b606e07480c99f88a2a15ef.1600073975.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600073975.git.mchehab+huawei@kernel.org>
References: <cover.1600073975.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current stats code is broken on so many ways. It ends
reporting 0 for signal strengh, and the work queue doesn't
run. If it would run, the code would crash.

Fix such issues and add the minimum stuff for DVBv5 stats.

Right now, only strength and cnr and UCB are implemented.
pre/post BER stats will always return zero.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_demod.c    | 185 ++++++++++++------
 .../media/test-drivers/vidtv/vidtv_tuner.c    |   2 +-
 2 files changed, 122 insertions(+), 65 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index 6199a4e06ff9..bfe63d7160f2 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -122,6 +122,74 @@ static const struct vidtv_demod_cnr_to_qual_s
 	return NULL; /* not found */
 }
 
+static void vidtv_clean_stats(struct dvb_frontend *fe)
+{
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+
+	/* Fill the length of each status counter */
+
+	/* Signal is always available */
+	c->strength.len = 1;
+	c->strength.stat[0].scale = FE_SCALE_DECIBEL;
+	c->strength.stat[0].svalue = 0;
+
+	/* Usually available only after Viterbi lock */
+	c->cnr.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+	c->cnr.stat[0].svalue = 0;
+	c->cnr.len = 1;
+
+	/* Those depends on full lock */
+	c->pre_bit_error.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+	c->pre_bit_error.stat[0].uvalue = 0;
+	c->pre_bit_error.len = 1;
+	c->pre_bit_count.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+	c->pre_bit_count.stat[0].uvalue = 0;
+	c->pre_bit_count.len = 1;
+	c->post_bit_error.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+	c->post_bit_error.stat[0].uvalue = 0;
+	c->post_bit_error.len = 1;
+	c->post_bit_count.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+	c->post_bit_count.stat[0].uvalue = 0;
+	c->post_bit_count.len = 1;
+	c->block_error.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+	c->block_error.stat[0].uvalue = 0;
+	c->block_error.len = 1;
+	c->block_count.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
+	c->block_count.stat[0].uvalue = 0;
+	c->block_count.len = 1;
+}
+
+static void vidtv_demod_update_stats(struct dvb_frontend *fe)
+{
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	struct vidtv_demod_state *state = fe->demodulator_priv;
+	u32 scale;
+
+	if (state->status & FE_HAS_LOCK) {
+		scale = FE_SCALE_COUNTER;
+		c->cnr.stat[0].scale = FE_SCALE_DECIBEL;
+	} else {
+		scale = FE_SCALE_NOT_AVAILABLE;
+		c->cnr.stat[0].scale = scale;
+	}
+
+	c->pre_bit_error.stat[0].scale = scale;
+	c->pre_bit_count.stat[0].scale = scale;
+	c->post_bit_error.stat[0].scale = scale;
+	c->post_bit_count.stat[0].scale = scale;
+	c->block_error.stat[0].scale = scale;
+	c->block_count.stat[0].scale = scale;
+
+	/*
+	 * Add a 0.5% of randomness at the signal streangth and CNR,
+	 * and make them different, as we want to have something closer
+	 * to a real case scenario.
+	 */
+	c->strength.stat[0].svalue = state->tuner_cnr + prandom_u32_max(state->tuner_cnr / 50);
+	c->cnr.stat[0].svalue = state->tuner_cnr - prandom_u32_max(state->tuner_cnr / 50);
+
+}
+
 static void vidtv_demod_poll_snr_handler(struct work_struct *work)
 {
 	/*
@@ -133,33 +201,34 @@ static void vidtv_demod_poll_snr_handler(struct work_struct *work)
 	struct vidtv_demod_config *config;
 	u16 snr = 0;
 
-	state  = container_of(work, struct vidtv_demod_state, poll_snr.work);
+	state = container_of(work, struct vidtv_demod_state, poll_snr.work);
 	config = &state->config;
 
-	if (!state->frontend.ops.tuner_ops.get_rf_strength)
-		return;
-
-	state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend, &snr);
-
+	/* Simulate random lost of signal due to a bad-tuned channel */
 	cnr2qual = vidtv_match_cnr_s(&state->frontend);
-	if (!cnr2qual)
-		return;
 
-	if (snr < cnr2qual->cnr_ok) {
-		/* eventually lose the TS lock */
-		if (prandom_u32_max(100) < config->drop_tslock_prob_on_low_snr)
-			state->status = 0;
-	} else {
-		/* recover if the signal improves */
-		if (prandom_u32_max(100) <
-		    config->recover_tslock_prob_on_good_snr)
-			state->status = FE_HAS_SIGNAL  |
-					FE_HAS_CARRIER |
-					FE_HAS_VITERBI |
-					FE_HAS_SYNC    |
-					FE_HAS_LOCK;
+	if (cnr2qual && state->tuner_cnr < cnr2qual->cnr_good &&
+	    state->frontend.ops.tuner_ops.get_rf_strength) {
+		state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend, &snr);
+
+		if (snr < cnr2qual->cnr_ok) {
+			/* eventually lose the TS lock */
+			if (prandom_u32_max(100) < config->drop_tslock_prob_on_low_snr)
+				state->status = 0;
+		} else {
+			/* recover if the signal improves */
+			if (prandom_u32_max(100) <
+			    config->recover_tslock_prob_on_good_snr)
+				state->status = FE_HAS_SIGNAL  |
+						FE_HAS_CARRIER |
+						FE_HAS_VITERBI |
+						FE_HAS_SYNC    |
+						FE_HAS_LOCK;
+		}
 	}
 
+	vidtv_demod_update_stats(&state->frontend);
+
 	schedule_delayed_work(&state->poll_snr,
 			      msecs_to_jiffies(POLL_THRD_TIME));
 }
@@ -174,28 +243,13 @@ static int vidtv_demod_read_status(struct dvb_frontend *fe,
 	return 0;
 }
 
-static int vidtv_demod_read_ber(struct dvb_frontend *fe, u32 *ber)
-{
-	*ber = 0;
-	return 0;
-}
-
 static int vidtv_demod_read_signal_strength(struct dvb_frontend *fe,
 					    u16 *strength)
 {
-	*strength = 0;
-	return 0;
-}
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
 
-static int vidtv_demod_read_snr(struct dvb_frontend *fe, u16 *snr)
-{
-	*snr = 0;
-	return 0;
-}
+	*strength = c->strength.stat[0].uvalue;
 
-static int vidtv_demod_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
-{
-	*ucblocks = 0;
 	return 0;
 }
 
@@ -216,38 +270,42 @@ static int vidtv_demod_get_frontend(struct dvb_frontend *fe,
 
 static int vidtv_demod_set_frontend(struct dvb_frontend *fe)
 {
-	struct vidtv_demod_state *state            = fe->demodulator_priv;
 	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
-	u32 tuner_status                        = 0;
+	struct vidtv_demod_state *state = fe->demodulator_priv;
+	u32 tuner_status = 0;
+	int ret;
 
-	if (fe->ops.tuner_ops.set_params) {
-		fe->ops.tuner_ops.set_params(fe);
+	if (!fe->ops.tuner_ops.set_params)
+		return 0;
 
-		/* store the CNR returned by the tuner */
-		fe->ops.tuner_ops.get_rf_strength(fe, &state->tuner_cnr);
+	fe->ops.tuner_ops.set_params(fe);
 
-		fe->ops.tuner_ops.get_status(fe, &tuner_status);
-		state->status = (state->tuner_cnr > 0) ?  FE_HAS_SIGNAL  |
-							  FE_HAS_CARRIER |
-							  FE_HAS_VITERBI |
-							  FE_HAS_SYNC    |
-							  FE_HAS_LOCK	 :
-							  0;
-		cnr2qual = vidtv_match_cnr_s(fe);
+	/* store the CNR returned by the tuner */
+	ret = fe->ops.tuner_ops.get_rf_strength(fe, &state->tuner_cnr);
+	if (ret < 0)
+		return ret;
 
-		/* signal isn't good: might lose the lock eventually */
-		if (tuner_status == TUNER_STATUS_LOCKED &&
-		    state->tuner_cnr < cnr2qual->cnr_good) {
-			schedule_delayed_work(&state->poll_snr,
-					      msecs_to_jiffies(POLL_THRD_TIME));
+	fe->ops.tuner_ops.get_status(fe, &tuner_status);
+	state->status = (state->tuner_cnr > 0) ?  FE_HAS_SIGNAL  |
+						    FE_HAS_CARRIER |
+						    FE_HAS_VITERBI |
+						    FE_HAS_SYNC    |
+						    FE_HAS_LOCK	 :
+						    0;
+	cnr2qual = vidtv_match_cnr_s(fe);
 
-			state->poll_snr_thread_running = true;
-		}
+	vidtv_demod_update_stats(fe);
 
-		if (fe->ops.i2c_gate_ctrl)
-			fe->ops.i2c_gate_ctrl(fe, 0);
+	if (state->tuner_cnr > 0) {
+		schedule_delayed_work(&state->poll_snr,
+					msecs_to_jiffies(POLL_THRD_TIME));
+
+		state->poll_snr_thread_running = true;
 	}
 
+	if (fe->ops.i2c_gate_ctrl)
+		fe->ops.i2c_gate_ctrl(fe, 0);
+
 	return 0;
 }
 
@@ -372,10 +430,7 @@ static const struct dvb_frontend_ops vidtv_demod_ops = {
 	.get_frontend = vidtv_demod_get_frontend,
 
 	.read_status          = vidtv_demod_read_status,
-	.read_ber             = vidtv_demod_read_ber,
 	.read_signal_strength = vidtv_demod_read_signal_strength,
-	.read_snr             = vidtv_demod_read_snr,
-	.read_ucblocks        = vidtv_demod_read_ucblocks,
 
 	/* For DVB-S/S2 */
 	.set_voltage = vidtv_demod_set_voltage,
@@ -411,6 +466,8 @@ static int vidtv_demod_i2c_probe(struct i2c_client *client,
 	state->frontend.demodulator_priv = state;
 	i2c_set_clientdata(client, state);
 
+	vidtv_clean_stats(&state->frontend);
+
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index 0f397fe12989..2956e2339996 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -245,7 +245,7 @@ vidtv_tuner_get_signal_strength(struct dvb_frontend *fe, u16 *strength)
 	 * do a linear interpolation between 34dB and 10dB if we can't
 	 * match against the table
 	 */
-	*strength = 34 - 24 * shift / 100;
+	*strength = 34000 - 24000 * shift / 100;
 	return 0;
 }
 
-- 
2.26.2

