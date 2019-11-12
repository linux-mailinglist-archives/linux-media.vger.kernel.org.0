Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B445F929A
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 15:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbfKLOcF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 09:32:05 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33453 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727667AbfKLOcE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 09:32:04 -0500
Received: by mail-qt1-f195.google.com with SMTP id y39so19975830qty.0;
        Tue, 12 Nov 2019 06:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5xYHsMtb8TdKkbG1pGsYDiYVpDA8pyjT2i5ZSSG8UYQ=;
        b=eHlfBAY+ZtVfdPfWBntgpJSs2CV5yaDPo6KyM2lRKcY6R4kfKybXfcWwkiBvkc4j09
         gqxHEnU/5PMAV7s3wbEEx76wEqfZyB3NbNDzO/hTpr1XNU7LT2SSRYK8e6P40Z63hsal
         xMBxmU5+e0fV+0ZamKreo/1j7+Tfq5Lr+8PCgohehoBpYDgUMHrSgkTXeZWBiww8NyQC
         DLRo5w7w1tGVoXSDdNDxgNx0HUcVK4UuboNdgNKqvCo3b1Z6+/Pmf0DBh6y0emeIsmoO
         gPZ6OAzzA1npbvqKjgdvXtGrz0X8FBxpMskwvjnUOHje2yscoZG4uuyb+4TGZUfiwP26
         QVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5xYHsMtb8TdKkbG1pGsYDiYVpDA8pyjT2i5ZSSG8UYQ=;
        b=HhQ4SBU880pei0yphMMSmY1924WaM2Eojr+vBg8+oK+mTlWcXJTXLixJ3VTOZjO3Tz
         FHjlNRtcCNSxn7rS2RDRv9q6zEwFL4ARqUKoCfbBTTpnFhl8Mq8f4+Wa5th2Zpu950HO
         p8Cu7sps2fT9jkdap5peb+78IQMd97XjKHat447PvK+ds7vufEWBJfPBlEA7Bu5+IwRw
         eHKmY4XQDqGrxZv1VczPiBYCFRdzX5j2/U2JBJ0p/g3yHFrpKdNycPmWKxmC6S2doqyr
         pkAQiM2hbgJU5qAnz/uPUcouGZntpUGfiviCBJWRWSYpnqhK3A2Pxkmy2hHo3fSi5P/p
         Ec2w==
X-Gm-Message-State: APjAAAU/zGoQwyBdZ1rkVch+D1LTe9o+rhW1ILo69aNEAALzSl/arz5x
        V4IrlteUMw45w+m8TptWhJ8=
X-Google-Smtp-Source: APXvYqyUWCeqRMSmhPQBv8T1kvY2fBUXii3IFinsfNGlbgWGcUwGOtdMgTDX9+3IsrpPkRifSyM2kQ==
X-Received: by 2002:ac8:1c5a:: with SMTP id j26mr30842971qtk.351.1573569122819;
        Tue, 12 Nov 2019 06:32:02 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id i14sm9408153qke.102.2019.11.12.06.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 06:32:02 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb_dummy_fe: Fix long lines
Date:   Tue, 12 Nov 2019 11:24:36 -0300
Message-Id: <20191112142436.1406-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
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
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 62 ++++++++++++++++------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 4db679cb70ad..f41c1e0dc8eb 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -37,7 +37,8 @@ static int dvb_dummy_fe_read_ber(struct dvb_frontend* fe, u32* ber)
 	return 0;
 }
 
-static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
+static int
+dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
 {
 	*strength = 0;
 	return 0;
@@ -102,6 +103,7 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
 static void dvb_dummy_fe_release(struct dvb_frontend* fe)
 {
 	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
+
 	kfree(state);
 }
 
@@ -117,7 +119,10 @@ struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
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
@@ -134,7 +139,10 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
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
@@ -151,7 +159,10 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
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
@@ -163,13 +174,21 @@ static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
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
@@ -194,11 +213,16 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops = {
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
@@ -227,8 +251,12 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops = {
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

