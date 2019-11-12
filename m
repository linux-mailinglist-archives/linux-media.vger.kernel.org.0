Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1515F900C
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 13:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfKLM57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 07:57:59 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:33146 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbfKLM57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 07:57:59 -0500
Received: by mail-qv1-f68.google.com with SMTP id x14so6305546qvu.0;
        Tue, 12 Nov 2019 04:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NjWk4TEYN8vBI+EZudhtgsQBzRXhxKSR/VvC8eztl2Q=;
        b=olrYlMOfGyc8ZLOn40CL3KqyOmUV5bZadSmnuHPqjQFMImWWYKDgqbTdEr5PxK/MqC
         +0rwCrarnoYYmYxEDZV/6IFf5rD7m5/R8hvdGIAlHlFoTr0KQfnY67oty8TtVjdZUgFl
         uERzayd/tyCjT9fWkXf1HI1j/b018Vse3bEL/QQL/2CmlJAEzPETM24ZzrcQrC3603Ta
         T2A+w8lFrlR8STUrgnVLoMvoU420KIWlGfhnCBAkkIlWkimnXoJlAz6UTUNYiCp8tY76
         TuRpRQCwyJFgzsqIYgWt5jHwpI6T2bXUh4i3i4AvLqWDLiiJTlxGblWGcQq8oxZ9HD41
         MV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NjWk4TEYN8vBI+EZudhtgsQBzRXhxKSR/VvC8eztl2Q=;
        b=Su3K0E5cDBtn9/JFzTtmUU5ebpqpjJ7+Uwnhw/6qfxqx+B+1HM7TsbCUW/FhNrpK0p
         Obvaj0f0KU7JFO/Nld5/k0WzbS1WrRUaRtqnC2wTN+sN7QgG4WIRcqpPdjYUDEFMLbXB
         UfCkHIv/szPD7zHW9H4fpTFNbWv3gfN1ePiY5wSyPqPIYTH64IAfBe7fz5hxi5evU7ru
         8WK17OnOrZOY0CyDFKdaIAA1uCzNn4DtZhLXjesI9yuNRDn++JvhOlpHD1xoOFA7tFZn
         I5loZ27Fzlg/Z60vIQi+w6UvUALRBNQgoiFXn7NnLUV0OTYoVv1gn+WUX3iEoFtKZmTK
         kNLQ==
X-Gm-Message-State: APjAAAUJk6sw6lICbXKrkPXYnMvVI5Wh87L804KQqffPzrCKASZ4EDM3
        C14Zun18iciwZNZo+1ZbQ0E=
X-Google-Smtp-Source: APXvYqzO55gCJ/uVMy0KkNfkBLsXnKAsyVWjq7p7P4ENoa5s6jvlMQs8jfmzBt5uc6UVFCv/QU24Qg==
X-Received: by 2002:ad4:50c6:: with SMTP id e6mr1963882qvq.220.1573563478120;
        Tue, 12 Nov 2019 04:57:58 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id q17sm12081804qtq.58.2019.11.12.04.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 04:57:57 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: dvb_dummy_fe: Fix ERROR: POINTER_LOCATION
Date:   Tue, 12 Nov 2019 09:50:14 -0300
Message-Id: <20191112125014.5604-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
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

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

------------------------------------------------------------
Changes in v2:

-Added checkpatch.pl previous output so it's more clear what
is being fixed by this patch.

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

