Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 751BD18957E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 07:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgCRGAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 02:00:35 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46408 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgCRGAf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 02:00:35 -0400
Received: by mail-qk1-f193.google.com with SMTP id f28so36858884qkk.13
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 23:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uemfuSbJSeuyPiO5qdMryfJ0i4YpGXqhCtITGlXeXGA=;
        b=HSfiXcrctW1gMr3Bt0c/qjYg6z7vSC+yC6621cQc5Ak0OJuww2q9Q7f3ZS3PRjxMzM
         BeHBufIkbqGAwHqikqI8S+4/gEmWqRFU7wLfgtUVtb90XFMVs3p/mm3YhDZi6BqzHtrn
         oV3d+p9phc1OQNDx9zZ55AwDpcyQx3j5AonunFQB+hLYzA/jEx0BDCOS6NUCqYiUaZRC
         kse328ORUwqNHYXyl75BqT3vd5rIo80dc1J+A+b1V68pSwQzZuD+WuC9PVIVzY0L3Z4P
         sW6UkrBubJB+qtIES2hexvnpSVNGq5hmk2GTYGMBlTz9AZ5GdXjWacvfaK89Xsa6DsRe
         GWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uemfuSbJSeuyPiO5qdMryfJ0i4YpGXqhCtITGlXeXGA=;
        b=LdLO9jjGmCdDfJsSUdxbS2a/Ay3kFPxwLrrs/4nFOv42n87RVmLrcQSTU50YJ4aO9+
         r5TfXQ6pYwjhhvpdhNBPDLATH6+xI8zgYKfEj0Ehqx5W3vHQDBwNZA0EZVC+x0Dteo6L
         OfdEa++qVSPq6CxfVEWgB8/TVNWFBWDfF5QME4klHpxxUuPyrBElp3NNJo74i3gcjgjo
         oo/ZdyxUDKrsh/fkSTn/7AcJPl8QzL5CMhlcsn8iH/luxis2iabQbhrWhZ56SmmMOrG4
         7Z5RSHsr3vGexj2MQNoRxYOQ4uHsu6uOkXVb3Th7NqywNJcCzR0e4pj/vbFX5/GWeruw
         Wk7w==
X-Gm-Message-State: ANhLgQ1k9aemZtPOX4+SyjbDJRoIVqK0cGMzOlRs8X07Bl8uRHQdyDph
        390xHbWhf5kx5Dr7qvH5ejs=
X-Google-Smtp-Source: ADFU+vuqHgAWfgNiRxIGq8uEhvshANOFvftAoOjLXhmvk0AqlmDLpSStIJckLfzlTkEVjSn1tkyNbw==
X-Received: by 2002:a05:620a:1192:: with SMTP id b18mr2335616qkk.334.1584511233846;
        Tue, 17 Mar 2020 23:00:33 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id c10sm223303qtp.13.2020.03.17.23.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 23:00:33 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
        allison@lohutok.net, tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RFC 2/3] media: dvb_dummy_fe.c: lose TS lock on bad snr
Date:   Wed, 18 Mar 2020 03:00:17 -0300
Message-Id: <20200318060018.3437750-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318060018.3437750-1-dwlsalmeida@gmail.com>
References: <20200318060018.3437750-1-dwlsalmeida@gmail.com>
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
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 149 ++++++++++++++++++++-
 1 file changed, 144 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 9ff1ebaa5e04..726c964a523d 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -9,24 +9,155 @@
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
+struct dvb_dummy_fe_cnr_to_qual_s dvb_c_cnr_2_qual[] = {
+	/* from libdvbv5 source code */
+	{ QAM_256, FEC_NONE,  34., 38.},
+	{ QAM_64,  FEC_NONE,  30., 34.},
+};
+
+struct dvb_dummy_fe_cnr_to_qual_s dvb_s_cnr_2_qual[] = {
+	/* from libdvbv5 source code */
+	{ QPSK, FEC_1_2,  7., 10.},
+
+	{ QPSK, FEC_2_3,  9., 12.},
+	{ QPSK, FEC_3_4, 10., 13.},
+	{ QPSK, FEC_5_6, 11., 14.},
+
+	{ QPSK, FEC_7_8, 12., 15.},
+};
+
+struct dvb_dummy_fe_cnr_to_qual_s dvb_s2_cnr_2_qual[] = {
+	/* from libdvbv5 source code */
+	{ QPSK,  FEC_1_2,   9.,  12.},
+	{ QPSK,  FEC_2_3,  11.,  14.},
+	{ QPSK,  FEC_3_4,  12.,  15.},
+	{ QPSK,  FEC_5_6,  12.,  15.},
+	{ QPSK,  FEC_8_9,  13.,  16.},
+	{ QPSK,  FEC_9_10, 13.5, 16.5},
+	{ PSK_8, FEC_2_3,  14.5, 17.5},
+	{ PSK_8, FEC_3_4,  16.,  19.},
+	{ PSK_8, FEC_5_6,  17.5, 20.5},
+	{ PSK_8, FEC_8_9,  19.,  22.},
+};
+
+static struct dvb_dummy_fe_cnr_to_qual_s dvb_t_cnr_2_qual[] = {
+	/* from libdvbv5 source code */
+	{   QPSK, FEC_1_2,  4.1,  5.9},
+	{   QPSK, FEC_2_3,  6.1,  9.6},
+	{   QPSK, FEC_3_4,  7.2, 12.4},
+	{   QPSK, FEC_5_6,  8.5, 15.6},
+	{   QPSK, FEC_7_8,  9.2, 17.5},
+
+	{ QAM_16, FEC_1_2,  9.8, 11.8},
+	{ QAM_16, FEC_2_3, 12.1, 15.3},
+	{ QAM_16, FEC_3_4, 13.4, 18.1},
+	{ QAM_16, FEC_5_6, 14.8, 21.3},
+	{ QAM_16, FEC_7_8, 15.7, 23.6},
+
+	{ QAM_64, FEC_1_2, 14.0, 16.0},
+	{ QAM_64, FEC_2_3, 19.9, 25.4},
+	{ QAM_64, FEC_3_4, 24.9, 27.9},
+	{ QAM_64, FEC_5_6, 21.3, 23.3},
+	{ QAM_64, FEC_7_8, 22.0, 24.0},
+};
+
+struct dvb_dummy_fe_config {
+	/* probability of losing the lock due to low snr */
+	u8 drop_tslock_probability_on_low_snr;
+};
+
 struct dvb_dummy_fe_state {
 	struct dvb_frontend frontend;
+	struct dvb_dummy_fe_config config;
+	struct delayed_work poll_snr;
+	enum fe_status status;
 };
 
+void poll_snr_handler(struct work_struct *work)
+{
+	/* periodically check the signal quality and eventually
+	 * lose the TS lock if it dips too low
+	 */
+	struct dvb_dummy_fe_state *state =
+		container_of(work, struct dvb_dummy_fe_state, poll_snr.work);
+	struct dtv_frontend_properties *c = &state->frontend.dtv_property_cache;
+	struct dvb_dummy_fe_cnr_to_qual_s *cnr2qual = NULL;
+	struct dvb_dummy_fe_config *config = &state->config;
+	u32 array_size = 0;
+	u16 snr = 0;
+	u32 i;
+
+	if (!state->frontend.ops.tuner_ops.get_rf_strength)
+		return;
+
+	state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend, &snr);
+
+	switch (c->delivery_system) {
+	case SYS_DVBT:
+	case SYS_DVBT2:
+		cnr2qual = dvb_t_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_t_cnr_2_qual);
+		break;
+
+	case SYS_DVBS:
+		cnr2qual = dvb_s_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_s_cnr_2_qual);
+		break;
+
+	case SYS_DVBS2:
+		cnr2qual = dvb_s2_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_s2_cnr_2_qual);
+		break;
+
+	case SYS_DVBC_ANNEX_A:
+		cnr2qual = dvb_c_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_c_cnr_2_qual);
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
+
+			if (snr < cnr2qual[i].cnr_ok) {
+				/* eventually lose the TS lock */
+				if (prandom_u32_max(100) <
+				    config->drop_tslock_probability_on_low_snr)
+					state->status = 0;
+			}
+		}
+	}
+
+	schedule_delayed_work(&(state->poll_snr), msecs_to_jiffies(2000));
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
@@ -80,11 +211,18 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
 
 static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
 {
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	cancel_delayed_work_sync(&(state->poll_snr));
 	return 0;
 }
 
 static int dvb_dummy_fe_init(struct dvb_frontend *fe)
 {
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	INIT_DELAYED_WORK(&(state->poll_snr), &poll_snr_handler);
+	schedule_delayed_work(&(state->poll_snr), msecs_to_jiffies(2000));
 	return 0;
 }
 
@@ -104,6 +242,7 @@ static void dvb_dummy_fe_release(struct dvb_frontend *fe)
 {
 	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
 
+	cancel_delayed_work_sync(&(state->poll_snr));
 	kfree(state);
 }
 
-- 
2.25.1

