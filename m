Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206AC26A858
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 17:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgIOPIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 11:08:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:33784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726985AbgIOPF4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 11:05:56 -0400
Received: from mail.kernel.org (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7B2E2067C;
        Tue, 15 Sep 2020 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600182355;
        bh=W/u5CunWTOege2SM3N7jcf/kRuv658onEHsDoV7/J7M=;
        h=From:To:Cc:Subject:Date:From;
        b=u2Hn17X3pXkLRZi6r/HSP9LrLzxx15VUcjoy0BXLybp8G8d3yu/n4K67HKZhyXamr
         yG6HiIQYmI9aK7VIqhKuBmmYvHHL0CPHjE5KChXRkl9N2CzUVVB+dfwjUf6hBITv4g
         B1ctIMUXET63apI3qcjeXISD19tufcOf4eblSusk=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kICWm-004lwM-Hk; Tue, 15 Sep 2020 17:05:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: vidtv: Add a music instead of playing a single tone
Date:   Tue, 15 Sep 2020 17:05:51 +0200
Message-Id: <597f2f6831dce6af83e9efbb473efd9e789d9f33.1600182349.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Keep playing a single tone is not too nice, and prevents
checking some weird things.

So, instead, implement a simple tone generator, changing
the code to play a public domain song (5th Symphony of
Beethoven), using sinusoidal waves.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_encoder.h  |  70 ++++++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.c    | 104 ++++++++++++++++--
 2 files changed, 165 insertions(+), 9 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_encoder.h b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
index 6da63abdddea..a7c99cafab4f 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_encoder.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
@@ -28,6 +28,73 @@ struct vidtv_access_unit {
 	struct vidtv_access_unit *next;
 };
 
+/* Some musical notes, used by a tone generator */
+enum musical_notes {
+	NOTE_SILENT = 0,
+
+	NOTE_C_2 = 65,
+	NOTE_CS_2 = 69,
+	NOTE_D_2 = 73,
+	NOTE_DS_2 = 78,
+	NOTE_E_2 = 82,
+	NOTE_F_2 = 87,
+	NOTE_FS_2 = 93,
+	NOTE_G_2 = 98,
+	NOTE_GS_2 = 104,
+	NOTE_A_2 = 110,
+	NOTE_AS_2 = 117,
+	NOTE_B_2 = 123,
+	NOTE_C_3 = 131,
+	NOTE_CS_3 = 139,
+	NOTE_D_3 = 147,
+	NOTE_DS_3 = 156,
+	NOTE_E_3 = 165,
+	NOTE_F_3 = 175,
+	NOTE_FS_3 = 185,
+	NOTE_G_3 = 196,
+	NOTE_GS_3 = 208,
+	NOTE_A_3 = 220,
+	NOTE_AS_3 = 233,
+	NOTE_B_3 = 247,
+	NOTE_C_4 = 262,
+	NOTE_CS_4 = 277,
+	NOTE_D_4 = 294,
+	NOTE_DS_4 = 311,
+	NOTE_E_4 = 330,
+	NOTE_F_4 = 349,
+	NOTE_FS_4 = 370,
+	NOTE_G_4 = 392,
+	NOTE_GS_4 = 415,
+	NOTE_A_4 = 440,
+	NOTE_AS_4 = 466,
+	NOTE_B_4 = 494,
+	NOTE_C_5 = 523,
+	NOTE_CS_5 = 554,
+	NOTE_D_5 = 587,
+	NOTE_DS_5 = 622,
+	NOTE_E_5 = 659,
+	NOTE_F_5 = 698,
+	NOTE_FS_5 = 740,
+	NOTE_G_5 = 784,
+	NOTE_GS_5 = 831,
+	NOTE_A_5 = 880,
+	NOTE_AS_5 = 932,
+	NOTE_B_5 = 988,
+	NOTE_C_6 = 1047,
+	NOTE_CS_6 = 1109,
+	NOTE_D_6 = 1175,
+	NOTE_DS_6 = 1245,
+	NOTE_E_6 = 1319,
+	NOTE_F_6 = 1397,
+	NOTE_FS_6 = 1480,
+	NOTE_G_6 = 1568,
+	NOTE_GS_6 = 1661,
+	NOTE_A_6 = 1760,
+	NOTE_AS_6 = 1865,
+	NOTE_B_6 = 1976,
+	NOTE_C_7 = 2093
+};
+
 /**
  * struct vidtv_encoder - A generic encoder type.
  * @id: So we can cast to a concrete implementation when needed.
@@ -64,6 +131,9 @@ struct vidtv_encoder {
 	u32 encoder_buf_offset;
 
 	u64 sample_count;
+	int last_duration;
+	int note_offset;
+	enum musical_notes last_tone;
 
 	struct vidtv_access_unit *access_units;
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 2a40ef15f715..122a450fb27c 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -40,6 +40,9 @@
 #define S302M_BLOCK_SZ 192
 #define S302M_SIN_LUT_NUM_ELEM 1024
 
+/* Used by the tone generator: number of samples for PI */
+#define PI		180
+
 static const u8 reverse[256] = {
 	/* from ffmpeg */
 	0x00, 0x80, 0x40, 0xC0, 0x20, 0xA0, 0x60, 0xE0, 0x10, 0x90, 0x50, 0xD0,
@@ -66,10 +69,74 @@ static const u8 reverse[256] = {
 	0x3F, 0xBF, 0x7F, 0xFF,
 };
 
-/* Used by the tone generator */
-#define SAMPLE_RATE	48000
-#define PI		180
-#define NOTE_A4		440
+struct tone_duration {
+	enum musical_notes note;
+	int duration;
+};
+
+#define COMPASS 120		/* beats per minute (Allegro) */
+const static struct tone_duration beethoven_5th_symphony[] = {
+	{ NOTE_E_6, 128},  { NOTE_DS_6, 128}, { NOTE_E_6, 128},
+	{ NOTE_DS_6, 128}, { NOTE_E_6, 128},  { NOTE_B_5, 128},
+	{ NOTE_D_6, 128},  { NOTE_C_6, 128},  { NOTE_A_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_A_4, 128},  { NOTE_C_5, 128},
+	{ NOTE_E_5, 128},  { NOTE_A_5, 128},  { NOTE_E_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_GS_4, 128}, { NOTE_E_5, 128},
+	{ NOTE_GS_5, 128}, { NOTE_B_5, 128},  { NOTE_A_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_A_4, 128},  { NOTE_E_5, 128},
+	{ NOTE_E_6, 128},  { NOTE_DS_6, 128}, { NOTE_E_6, 128},
+	{ NOTE_DS_6, 128}, { NOTE_E_6, 128},  { NOTE_B_5, 128},
+	{ NOTE_D_6, 128},  { NOTE_C_6, 128},  { NOTE_A_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_A_4, 128},  { NOTE_C_5, 128},
+	{ NOTE_E_5, 128},  { NOTE_A_5, 128},  { NOTE_E_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_GS_4, 128}, { NOTE_E_5, 128},
+	{ NOTE_C_6, 128},  { NOTE_B_5, 128},  { NOTE_A_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_A_4, 128},  { NOTE_SILENT, 128},
+
+	{ NOTE_E_6, 128},  { NOTE_DS_6, 128}, { NOTE_E_6, 128},
+	{ NOTE_DS_6, 128}, { NOTE_E_6, 128},  { NOTE_B_5, 128},
+	{ NOTE_D_6, 128},  { NOTE_C_6, 128},  { NOTE_A_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_A_4, 128},  { NOTE_C_5, 128},
+	{ NOTE_E_5, 128},  { NOTE_A_5, 128},  { NOTE_E_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_GS_4, 128}, { NOTE_E_5, 128},
+	{ NOTE_GS_5, 128}, { NOTE_B_5, 128},  { NOTE_A_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_A_4, 128},  { NOTE_E_5, 128},
+	{ NOTE_E_6, 128},  { NOTE_DS_6, 128}, { NOTE_E_6, 128},
+	{ NOTE_DS_6, 128}, { NOTE_E_6, 128},  { NOTE_B_5, 128},
+	{ NOTE_D_6, 128},  { NOTE_C_6, 128},  { NOTE_A_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_A_4, 128},  { NOTE_C_5, 128},
+	{ NOTE_E_5, 128},  { NOTE_A_5, 128},  { NOTE_E_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_GS_4, 128}, { NOTE_E_5, 128},
+	{ NOTE_C_6, 128},  { NOTE_B_5, 128},  { NOTE_A_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_A_4, 128},  { NOTE_B_4, 128},
+	{ NOTE_C_5, 128},  { NOTE_D_5, 128},  { NOTE_C_4, 128},
+	{ NOTE_G_4, 128},  { NOTE_C_5, 128},  { NOTE_G_4, 128},
+	{ NOTE_F_5, 128},  { NOTE_E_5, 128},  { NOTE_G_3, 128},
+	{ NOTE_G_4, 128},  { NOTE_B_3, 128},  { NOTE_F_4, 128},
+	{ NOTE_E_5, 128},  { NOTE_D_5, 128},  { NOTE_A_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_A_4, 128},  { NOTE_E_4, 128},
+	{ NOTE_D_5, 128},  { NOTE_C_5, 128},  { NOTE_E_3, 128},
+	{ NOTE_E_4, 128},  { NOTE_E_5, 255},  { NOTE_E_6, 128},
+	{ NOTE_E_5, 128},  { NOTE_E_6, 128},  { NOTE_E_5, 255},
+	{ NOTE_DS_5, 128}, { NOTE_E_5, 128},  { NOTE_DS_6, 128},
+	{ NOTE_E_6, 128},  { NOTE_DS_5, 128}, { NOTE_E_5, 128},
+	{ NOTE_DS_6, 128}, { NOTE_E_6, 128},  { NOTE_DS_6, 128},
+	{ NOTE_E_6, 128},  { NOTE_DS_6, 128}, { NOTE_E_6, 128},
+	{ NOTE_B_5, 128},  { NOTE_D_6, 128},  { NOTE_C_6, 128},
+	{ NOTE_A_3, 128},  { NOTE_E_4, 128},  { NOTE_A_4, 128},
+	{ NOTE_C_5, 128},  { NOTE_E_5, 128},  { NOTE_A_5, 128},
+	{ NOTE_E_3, 128},  { NOTE_E_4, 128},  { NOTE_GS_4, 128},
+	{ NOTE_E_5, 128},  { NOTE_GS_5, 128}, { NOTE_B_5, 128},
+	{ NOTE_A_3, 128},  { NOTE_E_4, 128},  { NOTE_A_4, 128},
+	{ NOTE_E_5, 128},  { NOTE_E_6, 128},  { NOTE_DS_6, 128},
+	{ NOTE_E_6, 128},  { NOTE_DS_6, 128}, { NOTE_E_6, 128},
+	{ NOTE_B_5, 128},  { NOTE_D_6, 128},  { NOTE_C_6, 128},
+	{ NOTE_A_3, 128},  { NOTE_E_4, 128},  { NOTE_A_4, 128},
+	{ NOTE_C_5, 128},  { NOTE_E_5, 128},  { NOTE_A_5, 128},
+	{ NOTE_E_3, 128},  { NOTE_E_4, 128},  { NOTE_GS_4, 128},
+	{ NOTE_E_5, 128},  { NOTE_C_6, 128},  { NOTE_B_5, 128},
+	{ NOTE_C_5, 255},  { NOTE_C_5, 255},  { NOTE_SILENT, 512},
+};
 
 static struct vidtv_access_unit *vidtv_s302m_access_unit_init(struct vidtv_access_unit *head)
 {
@@ -187,15 +254,33 @@ static u16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
 
 	if (!e->src_buf) {
 		/*
-		 * Simple tone generator. For now, just generates a 440 Hz
-		 * sinusoidal wave.
+		 * Simple tone generator: play the tones at the
+		 * beethoven_5th_symphony array.
 		 */
-		pos = (2 * PI * e->src_buf_offset * NOTE_A4 / SAMPLE_RATE);
+		if (e->last_duration <= 0) {
+			if (e->src_buf_offset >= ARRAY_SIZE(beethoven_5th_symphony))
+				e->src_buf_offset = 0;
 
-		if (pos == 360)
+			e->last_tone = beethoven_5th_symphony[e->src_buf_offset].note;
+			e->last_duration = beethoven_5th_symphony[e->src_buf_offset].duration * S302M_SAMPLING_RATE_HZ / COMPASS / 5;
+			e->src_buf_offset++;
+			e->note_offset = 0;
+		} else {
+			e->last_duration--;
+		}
+
+		/* Handle silent */
+		if (!e->last_tone) {
 			e->src_buf_offset = 0;
+			return 0x8000;
+		}
+
+		pos = (2 * PI * e->note_offset * e->last_tone / S302M_SAMPLING_RATE_HZ);
+
+		if (pos == 360)
+			e->note_offset = 0;
 		else
-			e->src_buf_offset++;
+			e->note_offset++;
 
 		return (fixp_sin32(pos % (2 * PI)) >> 16) + 0x8000;
 	}
@@ -388,6 +473,7 @@ struct vidtv_encoder
 	e->encoder_buf_offset = 0;
 
 	e->sample_count = 0;
+	e->last_duration = 0;
 
 	e->src_buf = (args.src_buf) ? args.src_buf : NULL;
 	e->src_buf_sz = (args.src_buf) ? args.src_buf_sz : 0;
-- 
2.26.2

