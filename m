Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577B3267BD0
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 20:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbgILSv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 14:51:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:48344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbgILSv0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 14:51:26 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0213C21531;
        Sat, 12 Sep 2020 18:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599936685;
        bh=P66Txe5+VJdHdGDRo+c/qKU+eLrUox/ztsfTNqqL5yQ=;
        h=From:To:Cc:Subject:Date:From;
        b=BLN8VomcrIUFmm5X1nRt3rZzZ7RLSzo8BJ4ctwlGhCqhHlwOyVabGQzfNnHqNS1bN
         SoT18eja7TE+mYJRFtyF0HVwAhPqElNls4w0vAAlWQw14IE1GgO/aTGO/hVF/5U2iR
         C5ag45YkD9rBkhg3rA/UXhsCzBHGAfZQlW580Xnc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kHAcM-001il9-IM; Sat, 12 Sep 2020 20:51:22 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: vidtv: fix frequency tuning logic
Date:   Sat, 12 Sep 2020 20:51:20 +0200
Message-Id: <34e866e222b9827ecae40ea89a1e6958873fa2db.1599936678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
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
 drivers/media/test-drivers/vidtv/vidtv_tuner.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index 39e848ae5836..268f980c6de8 100644
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
+		return shift;
+	}
 
 	switch (c->delivery_system) {
 	case SYS_DVBT:
@@ -288,6 +295,7 @@ static int vidtv_tuner_set_params(struct dvb_frontend *fe)
 	struct vidtv_tuner_dev *tuner_dev = vidtv_tuner_get_dev(fe);
 	struct vidtv_tuner_config config  = tuner_dev->config;
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	s32 shift;
 
 	u32 min_freq = fe->ops.tuner_ops.info.frequency_min_hz;
 	u32 max_freq = fe->ops.tuner_ops.info.frequency_max_hz;
@@ -305,6 +313,13 @@ static int vidtv_tuner_set_params(struct dvb_frontend *fe)
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
 
@@ -395,6 +410,7 @@ static int vidtv_tuner_i2c_probe(struct i2c_client *client,
 	       &vidtv_tuner_ops,
 	       sizeof(struct dvb_tuner_ops));
 
+	memcpy(&tuner_dev->config, config, sizeof(tuner_dev->config));
 	fe->tuner_priv = client;
 
 	return 0;
-- 
2.26.2

