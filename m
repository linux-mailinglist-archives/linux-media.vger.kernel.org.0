Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8DF2687D6
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 11:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgINJEB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 05:04:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgINJDh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 05:03:37 -0400
Received: from mail.kernel.org (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CDE122224;
        Mon, 14 Sep 2020 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600074212;
        bh=yM9N4NLqi4WGMy1CjkjYEiUQeXobHjZl0q9V8IJvvnw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W0ixixNjC6rmc3WHHWCUL/qUObi09L5Hk+Et5MpqrtogUcaAPRZkcC64OiWEfSQkF
         k9mkhFvvQ92LZynMuTCW0v2dbSOnukKel3yCySAS7gOILG1Rim5DBe60NhMlizn90S
         EezoHaOC+NZ9oXmMfpZbHTzB6QiwEBrkPMCPe0oU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kHkOW-002dzn-7X; Mon, 14 Sep 2020 11:03:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH RFC 10/11] media: vidtv: get rid of the work queue
Date:   Mon, 14 Sep 2020 11:03:25 +0200
Message-Id: <faaa816a1dea0b2ce983128a40a9867809e04381.1600073975.git.mchehab+huawei@kernel.org>
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

The dvb_frontend will already call status periodically, when
a channel is tuned. So, no need to have a work queue for
such purpose.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_demod.c    | 77 ++-----------------
 .../media/test-drivers/vidtv/vidtv_demod.h    |  3 -
 2 files changed, 6 insertions(+), 74 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index bfe63d7160f2..c54c88cac84f 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -190,26 +190,21 @@ static void vidtv_demod_update_stats(struct dvb_frontend *fe)
 
 }
 
-static void vidtv_demod_poll_snr_handler(struct work_struct *work)
+static int vidtv_demod_read_status(struct dvb_frontend *fe,
+				   enum fe_status *status)
 {
-	/*
-	 * periodically check the signal quality and eventually
-	 * lose the TS lock if it dips too low
-	 */
-	struct vidtv_demod_state *state;
+	struct vidtv_demod_state *state = fe->demodulator_priv;
 	const struct vidtv_demod_cnr_to_qual_s *cnr2qual = NULL;
-	struct vidtv_demod_config *config;
+	struct vidtv_demod_config *config = &state->config;
 	u16 snr = 0;
 
-	state = container_of(work, struct vidtv_demod_state, poll_snr.work);
-	config = &state->config;
-
 	/* Simulate random lost of signal due to a bad-tuned channel */
 	cnr2qual = vidtv_match_cnr_s(&state->frontend);
 
 	if (cnr2qual && state->tuner_cnr < cnr2qual->cnr_good &&
 	    state->frontend.ops.tuner_ops.get_rf_strength) {
-		state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend, &snr);
+		state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend,
+							      &snr);
 
 		if (snr < cnr2qual->cnr_ok) {
 			/* eventually lose the TS lock */
@@ -229,15 +224,6 @@ static void vidtv_demod_poll_snr_handler(struct work_struct *work)
 
 	vidtv_demod_update_stats(&state->frontend);
 
-	schedule_delayed_work(&state->poll_snr,
-			      msecs_to_jiffies(POLL_THRD_TIME));
-}
-
-static int vidtv_demod_read_status(struct dvb_frontend *fe,
-				   enum fe_status *status)
-{
-	struct vidtv_demod_state *state = fe->demodulator_priv;
-
 	*status = state->status;
 
 	return 0;
@@ -296,55 +282,12 @@ static int vidtv_demod_set_frontend(struct dvb_frontend *fe)
 
 	vidtv_demod_update_stats(fe);
 
-	if (state->tuner_cnr > 0) {
-		schedule_delayed_work(&state->poll_snr,
-					msecs_to_jiffies(POLL_THRD_TIME));
-
-		state->poll_snr_thread_running = true;
-	}
-
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 0);
 
 	return 0;
 }
 
-static int vidtv_demod_sleep(struct dvb_frontend *fe)
-{
-	struct vidtv_demod_state *state = fe->demodulator_priv;
-
-	if (state->poll_snr_thread_running) {
-		cancel_delayed_work_sync(&state->poll_snr);
-		state->poll_snr_thread_running = false;
-		state->poll_snr_thread_restart = true;
-	}
-	return 0;
-}
-
-static int vidtv_demod_init(struct dvb_frontend *fe)
-{
-	struct vidtv_demod_state *state = fe->demodulator_priv;
-	u32    tuner_status             = 0;
-
-	/*
-	 * At resume, start the snr poll thread only if it was suspended with
-	 * the thread running. Extra care should be taken here, as some tuner
-	 * status change might happen at resume time (for example, due to an
-	 * ioctl syscall to set_frontend, or due to a release syscall).
-	 */
-	fe->ops.tuner_ops.get_status(fe, &tuner_status);
-
-	if (tuner_status == TUNER_STATUS_LOCKED &&
-	    state->poll_snr_thread_restart) {
-		schedule_delayed_work(&state->poll_snr,
-				      msecs_to_jiffies(POLL_THRD_TIME));
-
-		state->poll_snr_thread_restart = false;
-	}
-
-	return 0;
-}
-
 /*
  * NOTE:
  * This is implemented here just to be used as an example for real
@@ -375,9 +318,6 @@ static void vidtv_demod_release(struct dvb_frontend *fe)
 {
 	struct vidtv_demod_state *state = fe->demodulator_priv;
 
-	if (state->poll_snr_thread_running)
-		cancel_delayed_work_sync(&state->poll_snr);
-
 	kfree(state);
 }
 
@@ -423,9 +363,6 @@ static const struct dvb_frontend_ops vidtv_demod_ops = {
 
 	.release = vidtv_demod_release,
 
-	.init  = vidtv_demod_init,
-	.sleep = vidtv_demod_sleep,
-
 	.set_frontend = vidtv_demod_set_frontend,
 	.get_frontend = vidtv_demod_get_frontend,
 
@@ -461,8 +398,6 @@ static int vidtv_demod_i2c_probe(struct i2c_client *client,
 
 	memcpy(&state->config, config, sizeof(state->config));
 
-	INIT_DELAYED_WORK(&state->poll_snr, &vidtv_demod_poll_snr_handler);
-
 	state->frontend.demodulator_priv = state;
 	i2c_set_clientdata(client, state);
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.h b/drivers/media/test-drivers/vidtv/vidtv_demod.h
index 7f52a537935b..87651b0193e6 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.h
@@ -63,10 +63,7 @@ struct vidtv_demod_config {
 struct vidtv_demod_state {
 	struct dvb_frontend frontend;
 	struct vidtv_demod_config config;
-	struct delayed_work poll_snr;
 	enum fe_status status;
 	u16 tuner_cnr;
-	bool poll_snr_thread_running;
-	bool poll_snr_thread_restart;
 };
 #endif // VIDTV_DEMOD_H
-- 
2.26.2

