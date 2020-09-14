Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9A72687D7
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 11:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgINJEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 05:04:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:37868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbgINJDh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 05:03:37 -0400
Received: from mail.kernel.org (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 471ED2222C;
        Mon, 14 Sep 2020 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600074212;
        bh=SQ8BrVWT+pT9oqMRs+BcLSzHdUIIt5GLTT/iCSfSVEI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kruvN5mMh2pPPK59bTdQAFqAAhidhiL98Bv1+0ZIHsx4qgRyqtfYp6uNTIsVlRdhE
         f+ZMXHzlUVvPpcsnpnRzSizOGjqBODpmfXcyuLdb/PuAlgj2tEfKg+kyHXtFcT3TC6
         2fFOstFCMCoEtr3yATaXl3nSbQeb8lUZU7Pb5DCI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kHkOW-002dzX-1X; Mon, 14 Sep 2020 11:03:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH RFC 04/11] media: vidtv: fix frequency tuning logic
Date:   Mon, 14 Sep 2020 11:03:19 +0200
Message-Id: <ba42bd610f16cf34dadd7ba2b9444e8e8f106339.1600073975.git.mchehab+huawei@kernel.org>
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

Right now, there are some issues at the tuning logic:

1) the config struct is not copied at the tuner driver.
   so, it won't use any frequency table at all;
2) the code that checks for frequency shifts is called
   at set_params. So, lock_status will never be zeroed;
3) the signal strength will also report a strong
   signal, even if not tuned;
4) the logic is not excluding non-set frequencies.

Fix those issues.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_tuner.c    | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index 39e848ae5836..0f397fe12989 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -120,7 +120,7 @@ vidtv_tuner_get_dev(struct dvb_frontend *fe)
 	return i2c_get_clientdata(fe->tuner_priv);
 }
 
-static s32 vidtv_tuner_check_frequency_shift(struct dvb_frontend *fe)
+static int vidtv_tuner_check_frequency_shift(struct dvb_frontend *fe)
 {
 	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
@@ -156,6 +156,8 @@ static s32 vidtv_tuner_check_frequency_shift(struct dvb_frontend *fe)
 	}
 
 	for (i = 0; i < array_sz; i++) {
+		if (!valid_freqs[i])
+			break;
 		shift = abs(c->frequency - valid_freqs[i]);
 
 		if (!shift)
@@ -177,6 +179,7 @@ static int
 vidtv_tuner_get_signal_strength(struct dvb_frontend *fe, u16 *strength)
 {
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
 	const struct vidtv_tuner_cnr_to_qual_s *cnr2qual = NULL;
 	struct device *dev = fe->dvb->device;
 	u32 array_size = 0;
@@ -184,6 +187,10 @@ vidtv_tuner_get_signal_strength(struct dvb_frontend *fe, u16 *strength)
 	u32 i;
 
 	shift = vidtv_tuner_check_frequency_shift(fe);
+	if (shift < 0) {
+		tuner_dev->hw_state.lock_status = 0;
+		return 0;
+	}
 
 	switch (c->delivery_system) {
 	case SYS_DVBT:
@@ -224,10 +231,6 @@ vidtv_tuner_get_signal_strength(struct dvb_frontend *fe, u16 *strength)
 			*strength = cnr2qual[i].cnr_good;
 			return 0;
 		}
-		if (shift < 0) {	/* Channel not tuned */
-			*strength = 0;
-			return 0;
-		}
 		/*
 		 * Channel tuned at wrong frequency. Simulate that the
 		 * Carrier S/N ratio is not too good.
@@ -288,6 +291,7 @@ static int vidtv_tuner_set_params(struct dvb_frontend *fe)
 	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
 	struct vidtv_tuner_config config  = tuner_dev->config;
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	s32 shift;
 
 	u32 min_freq = fe->ops.tuner_ops.info.frequency_min_hz;
 	u32 max_freq = fe->ops.tuner_ops.info.frequency_max_hz;
@@ -305,6 +309,13 @@ static int vidtv_tuner_set_params(struct dvb_frontend *fe)
 	tuner_dev->hw_state.lock_status = TUNER_STATUS_LOCKED;
 
 	msleep_interruptible(config.mock_tune_delay_msec);
+
+	shift = vidtv_tuner_check_frequency_shift(fe);
+	if (shift < 0) {
+		tuner_dev->hw_state.lock_status = 0;
+		return shift;
+	}
+
 	return 0;
 }
 
@@ -395,6 +406,7 @@ static int vidtv_tuner_i2c_probe(struct i2c_client *client,
 	       &vidtv_tuner_ops,
 	       sizeof(struct dvb_tuner_ops));
 
+	memcpy(&tuner_dev->config, config, sizeof(tuner_dev->config));
 	fe->tuner_priv = client;
 
 	return 0;
-- 
2.26.2

