Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE3CC157F1D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 16:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbgBJPqE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 10:46:04 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46045 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgBJPqE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 10:46:04 -0500
Received: by mail-qt1-f195.google.com with SMTP id d9so5410213qte.12;
        Mon, 10 Feb 2020 07:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qZzSV/Cejb8UpV/HQ8108YbaF0V/lqCH3FWdetQ8Pow=;
        b=bqERrv018aofLOYbac08392BfAcTQe7clJ9OzDV8jgahYWVeT/NaaOy4J0qiQoFYS8
         hWw56aB3drHyzueud0IF/eHl4IkoW9XF918irUpRxhd1D30SPtzQxR9QK//nu6JnuBTB
         bk7Q+tPz7ZXtddEnVtgut02cdTOrxfQ+7NqJcGgmlRas2y7v5a/iwnj8aimT3OSEHmRr
         vQK8jVUuUqrC3Ama2VrTA5wfu2gZ6SNCze3g80sl5vlvBqZ+kBE/hvn1Ulju1/Yt9nPY
         TzKKecjCD3TkF9Ak+v09esvykMrddDwMSh5Mp+Fx27mRYuOG7w8Gu8iKWvlr98WqgreF
         /PtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qZzSV/Cejb8UpV/HQ8108YbaF0V/lqCH3FWdetQ8Pow=;
        b=TKDAWIFOLBcPi4yGW7KQoD3p/BMbJ+5+RL0euRocxY0cE6cYwrietT/+9e0UBFOTn1
         yAZjNBnMpiTatXQko1+72sFDu/XndshCU6+jWPBIPSHxMOSZSqW+f05UhAANVirpSmMD
         zvH5VYQsdVf8Q0oaWXE4pOa5GWT4hHhBoKS2I46KswZc6aOentR2tt1lDb5zOgBVdXKG
         33ZDa+kPcpBQDMq3CiHZ386e4ie1cVejbZX5+ifiAe8Hnw3PFLiqCsnqRBHj/71BDDvr
         9EDPNp/lxyrkHTHrbtkKRrIsR4gRjwEVc4bAtUjKtVeHhIyBiUVdgKQB9NY+9CTRi6p1
         3XWg==
X-Gm-Message-State: APjAAAUA7MqA7U0W76pmFDeg4Tn1Rrr4Rvb02Qu1zsCFax5NZT/woRHH
        rcUtH/wRu8cjkGVrItqQw4M=
X-Google-Smtp-Source: APXvYqzPHFzNJtUhodxDnU6Bj7FldHbeHXQeKlnr9o6VdHUlF3LzXjc8bCXUcUrxDmM6665aYZqaNA==
X-Received: by 2002:ac8:33f8:: with SMTP id d53mr10423304qtb.86.1581349562868;
        Mon, 10 Feb 2020 07:46:02 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id c45sm350510qtd.43.2020.02.10.07.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 07:46:02 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
        gregkh@linuxfoundation.org
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] media: dvb_dummy_fe.c: lose TS lock on bad snr
Date:   Mon, 10 Feb 2020 12:45:55 -0300
Message-Id: <20200210154555.156283-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
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
2.25.0

