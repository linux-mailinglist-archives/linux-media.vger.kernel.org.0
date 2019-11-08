Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702ECF3EAD
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 05:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbfKHEGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 23:06:15 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37825 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfKHEGP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 23:06:15 -0500
Received: by mail-qk1-f196.google.com with SMTP id e187so4127772qkf.4;
        Thu, 07 Nov 2019 20:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=931ECh17bKARPx5mSW3Xy5DYB6gHmUTSxaJ0cO1t1L8=;
        b=TtzrCjYIpR9sP/lnm9ytOl7kq1NU0eLidkTFn+1KyLicHBRVcvqxRMzyQI6qA/2Svs
         l/1uRghL2zghPMJHk46DFyDK2gHm69ANfEM0/S8XXWf7Ir8aiw5P3hlNwBy/5ovFwGFM
         G/th9Rv2IPhfFnhdE6B21sePuq3GFBDqr0o6iKbIgU/X0iT/clVGi8XpHfyyEe+ObO93
         0zB39+OhsC+7QXuzy8/r+5oNXw9ylt895fPHhzgRqlipi02l4oLT3AfO7ee43nPthBra
         bu8yWdiNWok0pM+oCNbxU9b+ihDz9BI7KM3jzorFrE8XbuIUqO7Rgrtm3CpqtvdaJ0Qr
         RSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=931ECh17bKARPx5mSW3Xy5DYB6gHmUTSxaJ0cO1t1L8=;
        b=k3uOqUYohMJ02AbtfuPuPQx25WgLZ9LCsZDipeq98BK808SMKNEYNpVdVkmEik29DI
         G10paw9CfELrTHLyVtw4SRgiMDCY9lRgdsFCzmklUL+gq1/ES/+sDh6z9+Hvchrj3b1Z
         n24ma9KC39jYeN4qge/FLCWNvk5YSb55e+wy1YdEizDL2VlrhoBopybVBuH70eFP0X9b
         EiQ9+qDSdNmcoK3vrnkQITb7NNT0o9KbuPsrnDubbcHF44veSYxUzeo1bOshGvxXR55l
         HXrzeKEDZxeTkVpXsBzeVJDe0zk/ZhqcASwrDTLjRHwIz3g4bD/zKkUiAjngjPAthfGW
         l9mA==
X-Gm-Message-State: APjAAAVRom+v8doobsaTu88vxTQwxCts2KUAJ8/nwYrJRpm+C/TQeZRP
        zInEhS+R6GQsAGF70LUJCXY=
X-Google-Smtp-Source: APXvYqyBACBnxxwvohkR7HscGHmaY/uUCuqV0UH8jzprxfuKaoZptvweNPlK7uhOGhy69+1tYAB9ZA==
X-Received: by 2002:a37:9d4b:: with SMTP id g72mr6779522qke.121.1573185973510;
        Thu, 07 Nov 2019 20:06:13 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id k6sm2219884qkd.38.2019.11.07.20.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 20:06:12 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de, allison@lohutok.net
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION
Date:   Fri,  8 Nov 2019 00:58:35 -0300
Message-Id: <20191108035835.7607-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Change foo* bar to foo *bar to avoid ERROR: POINTER_LOCATION in checkpatch.pl

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 24 +++++++++++-----------
 drivers/media/dvb-frontends/dvb_dummy_fe.h |  6 +++---
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 4db679cb70ad..8413038aa30b 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -31,25 +31,25 @@ static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 	return 0;
 }
 
-static int dvb_dummy_fe_read_ber(struct dvb_frontend* fe, u32* ber)
+static int dvb_dummy_fe_read_ber(struct dvb_frontend *fe, u32 *ber)
 {
 	*ber = 0;
 	return 0;
 }
 
-static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe, u16 *strength)
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
@@ -77,12 +77,12 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
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
@@ -99,17 +99,17 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
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
@@ -126,7 +126,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
 
 struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 {
-	struct dvb_dummy_fe_state* state = NULL;
+	struct dvb_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
@@ -143,7 +143,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
 
 struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 {
-	struct dvb_dummy_fe_state* state = NULL;
+	struct dvb_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.h b/drivers/media/dvb-frontends/dvb_dummy_fe.h
index 526fabd7751f..35efe2ce1a88 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.h
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.h
@@ -12,9 +12,9 @@
 #include <media/dvb_frontend.h>
 
 #if IS_REACHABLE(CONFIG_DVB_DUMMY_FE)
-extern struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void);
-extern struct dvb_frontend* dvb_dummy_fe_qpsk_attach(void);
-extern struct dvb_frontend* dvb_dummy_fe_qam_attach(void);
+extern struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
+extern struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
+extern struct dvb_frontend *dvb_dummy_fe_qam_attach(void);
 #else
 static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
 {
-- 
2.24.0

