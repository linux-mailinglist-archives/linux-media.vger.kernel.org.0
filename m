Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36A4210E288
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 17:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfLAQX4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Dec 2019 11:23:56 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43114 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfLAQX4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Dec 2019 11:23:56 -0500
Received: by mail-qk1-f196.google.com with SMTP id q28so11215046qkn.10;
        Sun, 01 Dec 2019 08:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mqweMa9Bqk/FYspWjif3MeC3E0h6tyWrHPvZlY2xTv8=;
        b=vNJDZz8XTL6bDdAW6XcIHUN3zsZpgrf+Qff1Sjy39xoXunxGyuXxCVJ5Y3FvVUR4+T
         tLuoX4WYZX6s94uX22gATiYiS/ymhgENEYbcrgu+2OCIOkzqdcVih6YsjAtQadvDhd4g
         rt+oo9YGU4sfTT3bnFWxfuwIGh/d+Y3HORGi5qbrPWjClY3MUvsyu6UwJ+pf4/URnUBO
         RRb7JlsIK5tOwah+BsvR4NoNGgrxug74PUNFVIesUS5GcADWvLsO99kQmfMEGxXZG9Jc
         YcortGIa8yBH4Yvw2c7V2kHpal1gbyD5pmb0hQ+2dS4vREyU2t+MwjmTGhi8aCT5WF+h
         6HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mqweMa9Bqk/FYspWjif3MeC3E0h6tyWrHPvZlY2xTv8=;
        b=BoNMed5ugg/NNB+nKfW+qBNqo0wfwzP9ZlwZ4W16kCOGeGkxPwb3J2mxLB9ZSqiP+X
         fX2Vi9Hwac2S7U4QjzGLBol/9Pf7m1z/L+HwbeD/TeIegzeOwPdej6ZQaWXAT2CPYV2q
         hOVMBTs/IUjp/7AqpxhhE3ruFIIL1zdIVq8TRc8AIe1vE5FdD0M+tqwhoTtCkuWAv9zd
         N3qYQi91NPKrxgXa5nPDDlZXPz53T496WICYCjxXfUZm6NUdTUYWNmpVaFbfXXYdwqOA
         kciZl2ALid8eQKX3SGgbnHjV33O4GHHjdwCEPeiNXgyI5YT6CKdNon+cjbSFG3jRpGU6
         EqHg==
X-Gm-Message-State: APjAAAVXSTJTgR+G2ZyH7Ol1liWDCksXKHZ/FzBxbGjq8w5MNY40IrmW
        4bFIwWF3k7CV4aUersXpy8M=
X-Google-Smtp-Source: APXvYqyEw4ORc3mQKnUC28POTzugn2rfgbIEZuZF5mhe1m1C3EXP/nnawxivI5ZKuP1hRAOHbtRugQ==
X-Received: by 2002:a05:620a:143b:: with SMTP id k27mr10353223qkj.262.1575217434869;
        Sun, 01 Dec 2019 08:23:54 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 08:23:54 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] media: dvb_dummy_fe: Fix long lines
Date:   Sun,  1 Dec 2019 13:15:40 -0300
Message-Id: <20191201161542.69535-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201161542.69535-1-dwlsalmeida@gmail.com>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

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
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 61 ++++++++++++++++------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 209e7ac0de33..67a6ed307c1f 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -37,7 +37,8 @@ static int dvb_dummy_fe_read_ber(struct dvb_frontend *fe, u32 *ber)
 	return 0;
 }
 
-static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe, u16 *strength)
+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe,
+					     u16 *strength)
 {
 	*strength = 0;
 	return 0;
@@ -117,7 +118,10 @@ struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
 		goto err;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_ofdm_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 
@@ -139,7 +143,10 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 		goto err;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_qpsk_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 
@@ -161,7 +168,10 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 		goto err;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_qam_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 
@@ -178,13 +188,21 @@ static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
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
@@ -209,11 +227,16 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops = {
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
@@ -242,8 +265,12 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops = {
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
 
-- 
2.24.0

