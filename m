Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10AE6269F87
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 09:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgIOHWT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 03:22:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:43468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726095AbgIOHWO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 03:22:14 -0400
Received: from mail.kernel.org (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 376AE214F1;
        Tue, 15 Sep 2020 07:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600154533;
        bh=ARokxIit2SBD43u/EAUdTODDBkn3+IlgUdzF83ie93U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W2i1j44ido9amN24hlsgG8QHhbLtzsluMOdZ9otIZtliZV1PlzMYYAVCUWHky7keo
         6rzKqBF2i0LeID66mmWq0zcJF7fFUr29hDUgNcW0DsfnES/PGj7ijNgJH/7C8/C8Qd
         LAnTLw7pU5EyO8DyxOOxaAW/P94zSHzL/YwZg2fQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kI5I2-004XJh-OR; Tue, 15 Sep 2020 09:22:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: vidtv: fix DVB-S/S2 tuning logic
Date:   Tue, 15 Sep 2020 09:22:08 +0200
Message-Id: <8769fd9a65989561340b33368fee7aed68e7929f.1600154449.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600154449.git.mchehab+huawei@kernel.org>
References: <cover.1600154449.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Satellite setups are different than terrestrial and cable ones,
as there is a device coupled at the antenna, called LNBf, which
converts the frequency from a GHz range at C-Band or Ku-Band
into an intermediate frequency at S-Band (ranging up to ~2GHz).

There are several different models of LNBf, with different
IF conversions, but the most common nowadays is called
Universal LNBf. Those got their frequency ranges extended in the
past, when Astra 19.2E sattellite was launched.

The universal LNBf has two local oscilators:

	- 9.75 GHz
	- 10.6 GHz

The first one is used when the frequency is between 10.7 GHz
up to 11.7 GHz. The second one is for frequencies between
11.7 GHz to 12.75 GHz.

With that, the IF signal will be at 950 MHz to 2,150 MHz range.

Add support for doing the above math, and make clear that
the frequencies expected by the driver should be at Ku-Band
range.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 35 +++++++++++++++----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 108e7937e9c1..fe4e496acc34 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -29,6 +29,12 @@
 #define TUNER_DEFAULT_ADDR 0x68
 #define DEMOD_DEFAULT_ADDR 0x60
 
+/* LNBf fake parameters: ranges used by an Universal (extended) European LNBf */
+#define LNB_CUT_FREQUENCY	11700000
+#define LNB_LOW_FREQ		9750000
+#define LNB_HIGH_FREQ		10600000
+
+
 static unsigned int drop_tslock_prob_on_low_snr;
 module_param(drop_tslock_prob_on_low_snr, uint, 0);
 MODULE_PARM_DESC(drop_tslock_prob_on_low_snr,
@@ -53,7 +59,7 @@ static unsigned int vidtv_valid_dvb_t_freqs[NUM_VALID_TUNER_FREQS] = {
 
 module_param_array(vidtv_valid_dvb_t_freqs, uint, NULL, 0);
 MODULE_PARM_DESC(vidtv_valid_dvb_t_freqs,
-		 "Valid DVB-T frequencies to simulate");
+		 "Valid DVB-T frequencies to simulate, in Hz");
 
 static unsigned int vidtv_valid_dvb_c_freqs[NUM_VALID_TUNER_FREQS] = {
 	474000000
@@ -61,14 +67,14 @@ static unsigned int vidtv_valid_dvb_c_freqs[NUM_VALID_TUNER_FREQS] = {
 
 module_param_array(vidtv_valid_dvb_c_freqs, uint, NULL, 0);
 MODULE_PARM_DESC(vidtv_valid_dvb_c_freqs,
-		 "Valid DVB-C frequencies to simulate");
+		 "Valid DVB-C frequencies to simulate, in Hz");
 
 static unsigned int vidtv_valid_dvb_s_freqs[NUM_VALID_TUNER_FREQS] = {
-	12551500
+	11362000
 };
 module_param_array(vidtv_valid_dvb_s_freqs, uint, NULL, 0);
 MODULE_PARM_DESC(vidtv_valid_dvb_s_freqs,
-		 "Valid DVB-C frequencies to simulate");
+		 "Valid DVB-S/S2 frequencies to simulate at Ku-Band, in kHz");
 
 static unsigned int max_frequency_shift_hz;
 module_param(max_frequency_shift_hz, uint, 0);
@@ -336,11 +342,15 @@ static int vidtv_bridge_probe_demod(struct vidtv_dvb *dvb, u32 n)
 static int vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
 {
 	struct vidtv_tuner_config cfg = {};
+	u32 freq;
+	int i;
 
 	cfg.fe                       = dvb->fe[n];
 	cfg.mock_power_up_delay_msec = mock_power_up_delay_msec;
 	cfg.mock_tune_delay_msec     = mock_tune_delay_msec;
 
+	/* TODO: check if the frequencies are at a valid range */
+
 	memcpy(cfg.vidtv_valid_dvb_t_freqs,
 	       vidtv_valid_dvb_t_freqs,
 	       sizeof(vidtv_valid_dvb_t_freqs));
@@ -349,9 +359,20 @@ static int vidtv_bridge_probe_tuner(struct vidtv_dvb *dvb, u32 n)
 	       vidtv_valid_dvb_c_freqs,
 	       sizeof(vidtv_valid_dvb_c_freqs));
 
-	memcpy(cfg.vidtv_valid_dvb_s_freqs,
-	       vidtv_valid_dvb_s_freqs,
-	       sizeof(vidtv_valid_dvb_s_freqs));
+	/*
+	 * Convert Satellite frequencies from Ku-band in kHZ into S-band
+	 * frequencies in Hz.
+	 */
+	for (i = 0; i < ARRAY_SIZE(vidtv_valid_dvb_s_freqs); i++) {
+		freq = vidtv_valid_dvb_s_freqs[i];
+		if (freq) {
+			if (freq < LNB_CUT_FREQUENCY)
+				freq = abs(freq - LNB_LOW_FREQ);
+			else
+				freq = abs(freq - LNB_HIGH_FREQ);
+		}
+		cfg.vidtv_valid_dvb_s_freqs[i] = freq;
+	}
 
 	cfg.max_frequency_shift_hz = max_frequency_shift_hz;
 
-- 
2.26.2

