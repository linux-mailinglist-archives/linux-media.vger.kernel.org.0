Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11AEA18F51D
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 13:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgCWM6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 08:58:32 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33022 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbgCWM6c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 08:58:32 -0400
Received: by mail-qk1-f195.google.com with SMTP id v7so5443617qkc.0
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2020 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GfZH3nIwWj00Sd7ZVGok9RvoBpDTdg7XTsl3mgCATU8=;
        b=GIsd8vMgiGh9ul5qBSmsYcO1qHjH8FI/dfwpZFuol7mkXM7+swQvJNPELatzMPbj09
         J9s/2dPeEr1C2tckjZiipoG9pHcR7YlFExcodB+RnxwcvJyDuUI7b5S1exWyZfO0uqoX
         f3OqWcUqsAHCaEaFTdVbdOTN4MT1Oqdu6vOyJuK+oJiD4u7K+3mJsyswFpTX04oDpGK9
         k633wmqK5d0lhIcQ41HjD7PnSR5VCuGDMqeud3gufcbg9ltZvpy4wULqUVGZMt+ydrSr
         bHRftnPSizAjPJSJyq/dcnUZX2bNHZtGn9tpRGehSfpbHLOWrdYflVBdgB8lSJWiymEg
         I4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GfZH3nIwWj00Sd7ZVGok9RvoBpDTdg7XTsl3mgCATU8=;
        b=o1mCtZhqfQo0hWeDxcHvGtJ+RLpDeIm9hXMoaZcJ3700hCHHr+IAP4tBs1ZsHv8UmO
         Jo6IlSzGE1XrFbPW+MeL+dXQiXJ5ogzqB3alSWXE2WuAwazsrXS/CRaSyxahqPhB8KHR
         /HmVop+2YA+/mI9mFBjHq3/b25SHRAGsusqIWfLcEiP1eCwo/js1URQcIqYxW5aVfmrD
         pBd/AiXMmfcQfGuiPMEfKLxEyaJP7I+WYBkM/feyD1Srh6ezv6PIEUgUK4d0eHq9U2k7
         meIulDhdyjsW++WLsmotz3PJQsOmTknOj+E4lSYWBMqkgYLQwTTnEWiN3expgxxGdUBv
         aVRw==
X-Gm-Message-State: ANhLgQ04DN0HAig7mubAcIjlKBYc7jBS3v5+rgAhWHKtF+fBKIiRVMUm
        E3wxp6/uVc1Oru1Qd3xj3fv+Peyzj+k=
X-Google-Smtp-Source: ADFU+vtphizTS1p42txZo1XuKxTJF3REykx8FdlFRfFz++jrskATYLvB/a/UNvDwZwI9vgIsCfIXQw==
X-Received: by 2002:a37:5044:: with SMTP id e65mr19584907qkb.294.1584968310706;
        Mon, 23 Mar 2020 05:58:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id 16sm11075800qkk.79.2020.03.23.05.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 05:58:30 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
        allison@lohutok.net, tglx@linutronix.de
Cc:     linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [RFC, WIP, v2 2/3] media: dvb_dummy_fe.c: lose TS lock on bad snr
Date:   Mon, 23 Mar 2020 09:57:31 -0300
Message-Id: <20200323125732.281976-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200323125732.281976-1-dwlsalmeida@gmail.com>
References: <20200323125732.281976-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Periodically check the signal quality and eventually lose the lock if
the quality is sub-par. A fake tuner can return a bad quality signal to
the demod if the frequency is too far off from a valid frequency.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 160 ++++++++++++++++++++-
 1 file changed, 155 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 9ff1ebaa5e04..14446f2bdcde 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -9,24 +9,166 @@
 #include <linux/init.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <linux/random.h>
 
 #include <media/dvb_frontend.h>
 #include "dvb_dummy_fe.h"
 
 
+struct dvb_dummy_fe_cnr_to_qual_s {
+	/* attempt to use the same values as libdvbv5 */
+	u32 modulation;
+	u32 fec;
+	u32 cnr_ok, cnr_good;
+};
+
+struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_c_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QAM_256, FEC_NONE,  34000, 38000},
+	{ QAM_64,  FEC_NONE,  30000, 34000},
+};
+
+struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_s_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QPSK, FEC_1_2,  7000, 10000},
+	{ QPSK, FEC_2_3,  9000, 12000},
+	{ QPSK, FEC_3_4, 10000, 13000},
+	{ QPSK, FEC_5_6, 11000, 14000},
+	{ QPSK, FEC_7_8, 12000, 15000},
+};
+
+struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_s2_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QPSK,  FEC_1_2,   9000,  12000},
+	{ QPSK,  FEC_2_3,  11000,  14000},
+	{ QPSK,  FEC_3_4,  12000,  15000},
+	{ QPSK,  FEC_5_6,  12000,  15000},
+	{ QPSK,  FEC_8_9,  13000,  16000},
+	{ QPSK,  FEC_9_10, 13500, 16500},
+	{ PSK_8, FEC_2_3,  14500, 17500},
+	{ PSK_8, FEC_3_4,  16000,  19000},
+	{ PSK_8, FEC_5_6,  17500, 20500},
+	{ PSK_8, FEC_8_9,  19000,  22000},
+};
+
+static struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_t_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db*/
+	{   QPSK, FEC_1_2,  4100,  5900},
+	{   QPSK, FEC_2_3,  6100,  9600},
+	{   QPSK, FEC_3_4,  7200, 12400},
+	{   QPSK, FEC_5_6,  8500, 15600},
+	{   QPSK, FEC_7_8,  9200, 17500},
+
+	{ QAM_16, FEC_1_2,  9800, 11800},
+	{ QAM_16, FEC_2_3, 12100, 15300},
+	{ QAM_16, FEC_3_4, 13400, 18100},
+	{ QAM_16, FEC_5_6, 14800, 21300},
+	{ QAM_16, FEC_7_8, 15700, 23600},
+
+	{ QAM_64, FEC_1_2, 14000, 16000},
+	{ QAM_64, FEC_2_3, 19900, 25400},
+	{ QAM_64, FEC_3_4, 24900, 27900},
+	{ QAM_64, FEC_5_6, 21300, 23300},
+	{ QAM_64, FEC_7_8, 22000, 24000},
+};
+
+struct dvb_dummy_fe_config {
+	/* probability of losing the lock due to low snr */
+	u8 drop_tslock_prob_on_low_snr;
+	u8 recover_tslock_prob_on_good_snr;
+};
+
 struct dvb_dummy_fe_state {
 	struct dvb_frontend frontend;
+	struct dvb_dummy_fe_config config;
+	struct delayed_work poll_snr;
+	enum fe_status status;
 };
 
+static void poll_snr_handler(struct work_struct *work)
+{
+	/*
+	 * periodically check the signal quality and eventually
+	 * lose the TS lock if it dips too low
+	 */
+	struct dvb_dummy_fe_state *state;
+	struct dtv_frontend_properties *c;
+	struct dvb_dummy_fe_cnr_to_qual_s *cnr2qual = NULL;
+	struct dvb_dummy_fe_config *config;
+	u32 array_size = 0;
+	u16 snr = 0;
+	u32 i;
+
+	state = container_of(work, struct dvb_dummy_fe_state, poll_snr.work);
+	c = &state->frontend.dtv_property_cache;
+	config = &state->config;
+
+	if (!state->frontend.ops.tuner_ops.get_rf_strength)
+		return;
+
+	state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend, &snr);
+
+	switch (c->delivery_system) {
+	case SYS_DVBT:
+	case SYS_DVBT2:
+		cnr2qual = dvb_dummy_fe_t_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_dummy_fe_t_cnr_2_qual);
+		break;
+
+	case SYS_DVBS:
+		cnr2qual = dvb_dummy_fe_s_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_dummy_fe_s_cnr_2_qual);
+		break;
+
+	case SYS_DVBS2:
+		cnr2qual = dvb_dummy_fe_s2_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_dummy_fe_s2_cnr_2_qual);
+		break;
+
+	case SYS_DVBC_ANNEX_A:
+		cnr2qual = dvb_dummy_fe_c_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_dummy_fe_c_cnr_2_qual);
+		break;
+
+	default:
+		pr_warn("%s: unsupported delivery system: %u\n",
+			__func__,
+			c->delivery_system);
+		break;
+	}
+
+	for (i = 0; i <= array_size; i++) {
+		if (cnr2qual[i].modulation == c->modulation &&
+		    cnr2qual[i].fec == c->fec_inner) {
+			if (snr < cnr2qual[i].cnr_ok) {
+				/* eventually lose the TS lock */
+				if (prandom_u32_max(100) <
+				    config->drop_tslock_prob_on_low_snr)
+					state->status = 0;
+			} else {
+				/* recover if the signal improves */
+				if (prandom_u32_max(100) <
+				    config->recover_tslock_prob_on_good_snr)
+					state->status = FE_HAS_SIGNAL  |
+							FE_HAS_CARRIER |
+							FE_HAS_VITERBI |
+							FE_HAS_SYNC    |
+							FE_HAS_LOCK;
+			}
+		}
+	}
+
+	schedule_delayed_work(&state->poll_snr, msecs_to_jiffies(2000));
+}
 
 static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 				    enum fe_status *status)
 {
-	*status = FE_HAS_SIGNAL
-		| FE_HAS_CARRIER
-		| FE_HAS_VITERBI
-		| FE_HAS_SYNC
-		| FE_HAS_LOCK;
+
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	*status = state->status;
 
 	return 0;
 }
@@ -80,11 +222,18 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
 
 static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
 {
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	cancel_delayed_work_sync(&state->poll_snr);
 	return 0;
 }
 
 static int dvb_dummy_fe_init(struct dvb_frontend *fe)
 {
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	INIT_DELAYED_WORK(&state->poll_snr, &poll_snr_handler);
+	schedule_delayed_work(&state->poll_snr, msecs_to_jiffies(2000));
 	return 0;
 }
 
@@ -104,6 +253,7 @@ static void dvb_dummy_fe_release(struct dvb_frontend *fe)
 {
 	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
 
+	cancel_delayed_work_sync(&state->poll_snr);
 	kfree(state);
 }
 
-- 
2.25.2

