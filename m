Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46DE012DB16
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2019 20:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfLaTLm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Dec 2019 14:11:42 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42082 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfLaTLl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Dec 2019 14:11:41 -0500
Received: by mail-pg1-f195.google.com with SMTP id s64so19840598pgb.9;
        Tue, 31 Dec 2019 11:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G9QI4PrbeWqroS6tAxBy0bK45gx6KDWGGHt4P5wamwM=;
        b=ttYTtR/iOEbRlwhR9N4JDNACG8n0csT8FfkuRfy+t66SHKNSbkiCppcgah9SnHctuJ
         khumpLXfONuAySvfnjYr36lRYZXaq4iqzzD+HBSjCLsOYtMJLEVEkO1V3c5qBVKDBT1z
         vPi5H031qhxh/gZo+pJzd15ftbxwCfZcB7DZWbAfuAHZodptgsAc0Pmh+Qo7ioVAvaND
         AlzSxrIU0WmiiXKLFBwcOtI8GAr1bpscWqNmmN0xIcRHMJbiCP5UaR2/l/VjlW4j+PyY
         jlLnHmcsqVxQlhGPO8NXlcjrvZGWNRQLt+hQ599gBKrt/zavxK7eob38bJbjmZKCKGpd
         hAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G9QI4PrbeWqroS6tAxBy0bK45gx6KDWGGHt4P5wamwM=;
        b=kPGjMV+ecDOvXFJqBh5AGMgkGhHABULjaiKBqCtnlEQ4NOFEVJm3CqKnLT7NsANnk1
         bADdsBVgkj7JaF1rb8HQhBkcu0bUB80cZ4TrFEG4nciIYcEh+CaMBe2ivfrMpnkM2aRd
         6GFKxfuA/QZJX+CdqViTVrD2jRZ8uog5fwE8i5hS7aSiGtkF13gVRVCVnJUYPp8dqU3/
         B3w7UjXA2q96XfnTLkP2mEpAdjNl9FEVl79D//ZKkGVHjoObRz4EDNLpmUz4DlAqABZZ
         yU4VWjTP0VxhnALQ7GvjtMpaEZdJUeaTgI1fzFBamynIsZBcIrXl1gH7o0qeP4af2CeP
         v/UQ==
X-Gm-Message-State: APjAAAXmzFApBHjPJgGYkF++gsD/hZC1HOBW1OZCaCyTLEUMHbNJ65yu
        IS27KjvXpkRWH3+r0xVNE8E=
X-Google-Smtp-Source: APXvYqwN/e3wUCIa2i8bgq3dmzMxgj4T2Z0Fae/ArNBL4psGpGe9ae3rgUKzfwv9zwkRkF+fEs7Y7A==
X-Received: by 2002:a63:f551:: with SMTP id e17mr78374246pgk.162.1577819500891;
        Tue, 31 Dec 2019 11:11:40 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id s24sm4366134pjp.17.2019.12.31.11.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 11:11:40 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION, AVOID_EXTERN and long lines
Date:   Tue, 31 Dec 2019 16:11:21 -0300
Message-Id: <d8118a478102be96b7b3f595f789583a25ba5845.1577819245.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577819245.git.dwlsalmeida@gmail.com>
References: <cover.1577819245.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Change foo* bar to foo *bar to avoid ERROR: POINTER_LOCATION in checkpatch.pl

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_init(struct dvb_frontend* fe)

ERROR: "foo* bar" should be "foo *bar"
+static void dvb_dummy_fe_release(struct dvb_frontend* fe)

ERROR: "foo* bar" should be "foo *bar"
+	struct dvb_dummy_fe_state* state = fe->demodulator_priv;

ERROR: "foo* bar" should be "foo *bar"
+struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)

ERROR: "foo* bar" should be "foo *bar"
+	struct dvb_dummy_fe_state* state = NULL;

ERROR: "foo* bar" should be "foo *bar"
+	struct dvb_dummy_fe_state* state = NULL;

ERROR: "foo* bar" should be "foo *bar"
+	struct dvb_dummy_fe_state* state = NULL;

remove 'extern' keyword from declaration

Fix CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
by removing it.

Fix long lines

Break long lines into smaller ones to improve readability.

WARNING: line over 80 characters
+	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));

WARNING: line over 80 characters
+	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
WARNING: line over 80 characters
+	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));

WARNING: line over 80 characters
+				FE_CAN_FEC_4_5 | FE_CAN_FEC_5_6 | FE_CAN_FEC_6_7 |

WARNING: line over 80 characters
+				FE_CAN_FEC_7_8 | FE_CAN_FEC_8_9 | FE_CAN_FEC_AUTO |

WARNING: line over 80 characters
+				FE_CAN_QAM_16 | FE_CAN_QAM_64 | FE_CAN_QAM_AUTO |

WARNING: line over 80 characters
+		.symbol_rate_min	= (57840000 / 2) / 6

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 83 ++++++++++++++--------
 drivers/media/dvb-frontends/dvb_dummy_fe.h |  6 +-
 2 files changed, 58 insertions(+), 31 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 909dac2345c4..e7f51d581d63 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -31,25 +31,26 @@ static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 	return 0;
 }
 
-static int dvb_dummy_fe_read_ber(struct dvb_frontend* fe, u32* ber)
+static int dvb_dummy_fe_read_ber(struct dvb_frontend *fe, u32 *ber)
 {
 	*ber = 0;
 	return 0;
 }
 
-static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe,
+					     u16 *strength)
 {
 	*strength = 0;
 	return 0;
 }
 
-static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)
+static int dvb_dummy_fe_read_snr(struct dvb_frontend *fe, u16 *snr)
 {
 	*snr = 0;
 	return 0;
 }
 
-static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)
+static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
 {
 	*ucblocks = 0;
 	return 0;
@@ -77,12 +78,12 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
 	return 0;
 }
 
-static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
+static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
 {
 	return 0;
 }
 
-static int dvb_dummy_fe_init(struct dvb_frontend* fe)
+static int dvb_dummy_fe_init(struct dvb_frontend *fe)
 {
 	return 0;
 }
@@ -99,17 +100,17 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
 	return 0;
 }
 
-static void dvb_dummy_fe_release(struct dvb_frontend* fe)
+static void dvb_dummy_fe_release(struct dvb_frontend *fe)
 {
-	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
 	kfree(state);
 }
 
 static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops;
 
-struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
+struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
 {
-	struct dvb_dummy_fe_state* state = NULL;
+	struct dvb_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
@@ -117,7 +118,10 @@ struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
 		return NULL;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_ofdm_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
@@ -127,7 +131,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
 
 struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 {
-	struct dvb_dummy_fe_state* state = NULL;
+	struct dvb_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
@@ -135,7 +139,10 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 		return NULL;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_qpsk_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
@@ -145,7 +152,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
 
 struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 {
-	struct dvb_dummy_fe_state* state = NULL;
+	struct dvb_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
@@ -153,7 +160,10 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 		return NULL;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_qam_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
@@ -166,13 +176,21 @@ static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
 		.frequency_min_hz	= 0,
 		.frequency_max_hz	= 863250 * kHz,
 		.frequency_stepsize_hz	= 62500,
-		.caps = FE_CAN_FEC_1_2 | FE_CAN_FEC_2_3 | FE_CAN_FEC_3_4 |
-				FE_CAN_FEC_4_5 | FE_CAN_FEC_5_6 | FE_CAN_FEC_6_7 |
-				FE_CAN_FEC_7_8 | FE_CAN_FEC_8_9 | FE_CAN_FEC_AUTO |
-				FE_CAN_QAM_16 | FE_CAN_QAM_64 | FE_CAN_QAM_AUTO |
-				FE_CAN_TRANSMISSION_MODE_AUTO |
-				FE_CAN_GUARD_INTERVAL_AUTO |
-				FE_CAN_HIERARCHY_AUTO,
+		.caps = FE_CAN_FEC_1_2 |
+			FE_CAN_FEC_2_3 |
+			FE_CAN_FEC_3_4 |
+			FE_CAN_FEC_4_5 |
+			FE_CAN_FEC_5_6 |
+			FE_CAN_FEC_6_7 |
+			FE_CAN_FEC_7_8 |
+			FE_CAN_FEC_8_9 |
+			FE_CAN_FEC_AUTO |
+			FE_CAN_QAM_16 |
+			FE_CAN_QAM_64 |
+			FE_CAN_QAM_AUTO |
+			FE_CAN_TRANSMISSION_MODE_AUTO |
+			FE_CAN_GUARD_INTERVAL_AUTO |
+			FE_CAN_HIERARCHY_AUTO,
 	},
 
 	.release = dvb_dummy_fe_release,
@@ -197,11 +215,16 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops = {
 		.frequency_min_hz	=  51 * MHz,
 		.frequency_max_hz	= 858 * MHz,
 		.frequency_stepsize_hz	= 62500,
-		.symbol_rate_min	= (57840000 / 2) / 64,  /* SACLK/64 == (XIN/2)/64 */
+		/* symbol_rate_min: SACLK/64 == (XIN/2)/64 */
+		.symbol_rate_min	= (57840000 / 2) / 64,
 		.symbol_rate_max	= (57840000 / 2) / 4,   /* SACLK/4 */
-		.caps = FE_CAN_QAM_16 | FE_CAN_QAM_32 | FE_CAN_QAM_64 |
-			FE_CAN_QAM_128 | FE_CAN_QAM_256 |
-			FE_CAN_FEC_AUTO | FE_CAN_INVERSION_AUTO
+		.caps = FE_CAN_QAM_16 |
+			FE_CAN_QAM_32 |
+			FE_CAN_QAM_64 |
+			FE_CAN_QAM_128 |
+			FE_CAN_QAM_256 |
+			FE_CAN_FEC_AUTO |
+			FE_CAN_INVERSION_AUTO
 	},
 
 	.release = dvb_dummy_fe_release,
@@ -230,8 +253,12 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops = {
 		.symbol_rate_min	= 1000000,
 		.symbol_rate_max	= 45000000,
 		.caps = FE_CAN_INVERSION_AUTO |
-			FE_CAN_FEC_1_2 | FE_CAN_FEC_2_3 | FE_CAN_FEC_3_4 |
-			FE_CAN_FEC_5_6 | FE_CAN_FEC_7_8 | FE_CAN_FEC_AUTO |
+			FE_CAN_FEC_1_2 |
+			FE_CAN_FEC_2_3 |
+			FE_CAN_FEC_3_4 |
+			FE_CAN_FEC_5_6 |
+			FE_CAN_FEC_7_8 |
+			FE_CAN_FEC_AUTO |
 			FE_CAN_QPSK
 	},
 
diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.h b/drivers/media/dvb-frontends/dvb_dummy_fe.h
index 526fabd7751f..1c82338e0c8a 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.h
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.h
@@ -12,9 +12,9 @@
 #include <media/dvb_frontend.h>
 
 #if IS_REACHABLE(CONFIG_DVB_DUMMY_FE)
-extern struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void);
-extern struct dvb_frontend* dvb_dummy_fe_qpsk_attach(void);
-extern struct dvb_frontend* dvb_dummy_fe_qam_attach(void);
+struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
+struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
+struct dvb_frontend *dvb_dummy_fe_qam_attach(void);
 #else
 static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
 {
-- 
2.24.1

