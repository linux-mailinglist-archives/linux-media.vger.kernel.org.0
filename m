Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE82526CA8D
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 22:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgIPUH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 16:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgIPUFu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 16:05:50 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B386C06174A;
        Wed, 16 Sep 2020 13:05:50 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id k25so7215208qtu.4;
        Wed, 16 Sep 2020 13:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EJFw4uKW8e/iIEi8z8Ir0rldGUxpdMF9h1PXE42yizw=;
        b=HgfEPHZVnS86sF0lcmA5PP6+ri8SehwOknPCcG0mW3FyiWyjSycs2YGoSBd5ozzk87
         txiSSTMWYqL3/HdoKau+QeLq4yHFP/qJRjM/Lm50WoD+iUtYtKq1C6uiYqitWoxmo0w6
         AH/tXycpempNBciyQGQ8v8857oL4YJCel0NxD+fMoqzd45OC/3PwJgusD8cUBLJwAlc9
         gYGx/D8lTL+4spk/86iCp3UtSsb6cwwbF1Cxx1QYHVCZaflkxJjD1ACc08YadILIpZWH
         4aiCeiUa6mGHABezctp0GR8O4xAEFsiz1umCSctducY4kK6T8uz4LhuLd3/NQpmXIq1x
         Uamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EJFw4uKW8e/iIEi8z8Ir0rldGUxpdMF9h1PXE42yizw=;
        b=AW69rWw7rKHr6mh9jfSRshv3a7uFkqRI+ackZYlkPDIzMkuSoUUTTWaSmJOgoE890Y
         vhYsQgZNqUHRUIZ6mNL/MBODFUS+ur0QPEbmRBP6RzKsiUOUo2iEDsTq7FXuTF0jCBzy
         YDUuQ5hon+5mcY5x8rYHeXuk9RcyhAmDgDa6BxxfM8o+dFrtl8ULeLUfLrqEs6Xhn7Ol
         u/PWtg5UM7EOfIaKShRBxKKPiQknDMG7LYu7ShToUER/WFqjqi2YPVVi36GkzuH3MEHT
         HyW0pKlo8TkjKIWp/MGqdoTCAKOcNeY5u/3ctZ8jO9HMdT6ixq3wuAZEMKrOBrIabBWW
         ZLvA==
X-Gm-Message-State: AOAM5334VWzBqet9jvCd9TMxi50aIVFEWV3BNyuxVzKBqjBCR91FNVss
        DYBtximlAYmI73UsObzYYuM=
X-Google-Smtp-Source: ABdhPJwrGADt2AO+3SC2kJyZ6ICn6XmP/Qmi2pLma8AkSBY0Ur6ZUlxs6101sCv8XmFGzACUqlvvCA==
X-Received: by 2002:ac8:23a3:: with SMTP id q32mr24941972qtq.361.1600286749171;
        Wed, 16 Sep 2020 13:05:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id t11sm19242563qtp.32.2020.09.16.13.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 13:05:48 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        geert@linux-m68k.org, r.verdejo@samsung.com,
        linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org
Subject: [PATCH v2] media: vidtv: fix build on 32bit architectures
Date:   Wed, 16 Sep 2020 17:05:40 -0300
Message-Id: <20200916200540.3239378-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Fix the following error for builds on 32bit architectures:

ERROR: modpost: "__udivdi3"
[drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!

Which is due to 64bit divisions that did not go through the helpers
in linux/math64.h

As vidtv_mux_check_mux_rate was not operational in its current form,
drop the entire function while it is not fixed properly.

For now, call vidtv_mux_pad_with_nulls with a constant number of packets
to avoid warnings due to unused functions when building this driver.

The 64bit division used in the s302m is not needed, remove them and use
a fixed number of frames and a constant PTS increment instead.

Fixes: f90cf6079bf67988 ("media: vidtv: add a bridge driver")
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
Changes in v2:

Rework the s302m encoder so that a fixed number of frames and a constant
increment value for pts is used. This removes the 64bit division that
was making the build fail.

---

 .../media/test-drivers/vidtv/vidtv_encoder.h  |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_mux.c  | 42 +-------------
 .../media/test-drivers/vidtv/vidtv_s302m.c    | 56 ++++++-------------
 .../media/test-drivers/vidtv/vidtv_s302m.h    |  2 +
 4 files changed, 23 insertions(+), 79 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_encoder.h b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
index a7c99cafab4f..65d81daef4c3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_encoder.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
@@ -148,7 +148,7 @@ struct vidtv_encoder {
 
 	__be16 es_pid;
 
-	void *(*encode)(struct vidtv_encoder *e, u64 elapsed_time_usecs);
+	void *(*encode)(struct vidtv_encoder *e);
 
 	u32 (*clear)(struct vidtv_encoder *e);
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 26a742c95c76..43b13aa3a8bc 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -281,17 +281,11 @@ static u32 vidtv_mux_poll_encoders(struct vidtv_mux *m)
 	struct vidtv_channel *cur_chnl = m->channels;
 	struct vidtv_encoder *e = NULL;
 
-	u64 elapsed_time_usecs = jiffies_to_usecs(m->timing.current_jiffies -
-						  m->timing.past_jiffies);
-
-	elapsed_time_usecs = min_t(u64, elapsed_time_usecs, (u64)VIDTV_MAX_SLEEP_USECS);
-
 	while (cur_chnl) {
 		e = cur_chnl->encoders;
 
 		while (e) {
-			/* encode for 'elapsed_time_usecs' */
-			e->encode(e, elapsed_time_usecs);
+			e->encode(e);
 			/* get the TS packets into the mux buffer */
 			au_nbytes = vidtv_mux_packetize_access_units(m, e);
 			nbytes += au_nbytes;
@@ -337,38 +331,6 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
 	return nbytes;
 }
 
-static u32 vidtv_mux_check_mux_rate(struct vidtv_mux *m)
-{
-	/*
-	 * attempt to maintain a constant mux rate, padding with null packets
-	 * if needed
-	 */
-
-	u32 nbytes = 0;  /* the number of bytes written by this function */
-
-	u64 nbytes_expected; /* the number of bytes we should have written */
-	u64 nbytes_streamed; /* the number of bytes we actually wrote */
-	u32 num_null_pkts; /* number of null packets to bridge the gap */
-
-	u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
-						  m->timing.past_jiffies);
-
-	elapsed_time_msecs = min(elapsed_time_msecs, (u64)VIDTV_MAX_SLEEP_USECS / 1000);
-	nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
-	nbytes_expected *= elapsed_time_msecs;
-
-	nbytes_streamed = m->mux_buf_offset;
-
-	if (nbytes_streamed < nbytes_expected) {
-		/* can't write half a packet: roundup to a 188 multiple */
-		nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);
-		num_null_pkts    = nbytes_expected / TS_PACKET_LEN;
-		nbytes          += vidtv_mux_pad_with_nulls(m, num_null_pkts);
-	}
-
-	return nbytes;
-}
-
 static void vidtv_mux_clear(struct vidtv_mux *m)
 {
 	/* clear the packets currently in the mux */
@@ -400,7 +362,7 @@ static void vidtv_mux_tick(struct work_struct *work)
 			nbytes += vidtv_mux_push_si(m);
 
 		nbytes += vidtv_mux_poll_encoders(m);
-		nbytes += vidtv_mux_check_mux_rate(m);
+		nbytes += vidtv_mux_pad_with_nulls(m, 256);
 
 		npkts = nbytes / TS_PACKET_LEN;
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 122a450fb27c..ca42ad0a8a0a 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -40,6 +40,11 @@
 #define S302M_BLOCK_SZ 192
 #define S302M_SIN_LUT_NUM_ELEM 1024
 
+/* these are retrieved empirically from ffmpeg/libavcodec */
+#define FF_S302M_DEFAULT_NUM_FRAMES 1115
+#define FF_S302M_DEFAULT_PTS_INCREMENT 2090
+#define FF_S302M_DEFAULT_PTS_OFFSET 100000
+
 /* Used by the tone generator: number of samples for PI */
 #define PI		180
 
@@ -189,7 +194,7 @@ static void vidtv_s302m_alloc_au(struct vidtv_encoder *e)
 }
 
 static void
-vidtv_s302m_compute_sample_count_v(struct vidtv_encoder *e)
+vidtv_s302m_compute_sample_count_from_video(struct vidtv_encoder *e)
 {
 	struct vidtv_access_unit *au = e->access_units;
 	struct vidtv_access_unit *sync_au = e->sync->access_units;
@@ -208,33 +213,7 @@ vidtv_s302m_compute_sample_count_v(struct vidtv_encoder *e)
 	}
 }
 
-static void
-vidtv_s302m_compute_sample_count(struct vidtv_encoder *e,
-				 u64 elapsed_time_usecs)
-{
-	/* compute sample count for 'elapsed_time_usecs' */
-	u32 sample_duration_usecs = USEC_PER_SEC / e->sampling_rate_hz;
-	struct vidtv_access_unit *au = e->access_units;
-
-	au->num_samples = (u32)div64_u64(elapsed_time_usecs, sample_duration_usecs);
-}
-
-static void vidtv_s302m_compute_pts(struct vidtv_encoder *e)
-{
-	u64 count = e->sample_count;
-	struct vidtv_access_unit *au = e->access_units;
-
-	while (au) {
-		count += au->num_samples;
-
-		au->pts = count *
-			  CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
-
-		au = au->next;
-	}
-}
-
-static void vidtv_s302m_compute_pts_v(struct vidtv_encoder *e)
+static void vidtv_s302m_compute_pts_from_video(struct vidtv_encoder *e)
 {
 	struct vidtv_access_unit *au = e->access_units;
 	struct vidtv_access_unit *sync_au = e->sync->access_units;
@@ -366,6 +345,7 @@ static u32 vidtv_s302m_write_h(struct vidtv_encoder *e, u32 p_sz)
 static void vidtv_s302m_write_frames(struct vidtv_encoder *e)
 {
 	struct vidtv_access_unit *au = e->access_units;
+	struct vidtv_s302m_ctx *ctx = e->ctx;
 	u32 nbytes_per_unit = 0;
 	u32 nbytes = 0;
 	u32 au_sz = 0;
@@ -400,12 +380,13 @@ static void vidtv_s302m_write_frames(struct vidtv_encoder *e)
 		au->offset = nbytes - nbytes_per_unit;
 
 		nbytes_per_unit = 0;
+		ctx->au_count++;
 
 		au = au->next;
 	}
 }
 
-static void *vidtv_s302m_encode(struct vidtv_encoder *e, u64 elapsed_time)
+static void *vidtv_s302m_encode(struct vidtv_encoder *e)
 {
 	/*
 	 * According to SMPTE 302M, an audio access unit is specified as those
@@ -416,27 +397,26 @@ static void *vidtv_s302m_encode(struct vidtv_encoder *e, u64 elapsed_time)
 	 *
 	 * Assuming that it is also possible to send audio without any
 	 * associated video, as in a radio-like service, a single audio access unit
-	 * is created with enough audio data for 'elapsed_time'
-	 * The value of PTS is computed manually.
+	 * is created with values for 'num_samples' and 'pts' taken empirically from
+	 * ffmpeg
 	 */
 
-	if (!elapsed_time)
-		goto out;
+	struct vidtv_s302m_ctx *ctx = e->ctx;
 
 	vidtv_s302m_access_unit_destroy(e);
 	vidtv_s302m_alloc_au(e);
 
 	if (e->sync && e->sync->is_video_encoder) {
-		vidtv_s302m_compute_sample_count_v(e);
-		vidtv_s302m_compute_pts_v(e);
+		vidtv_s302m_compute_sample_count_from_video(e);
+		vidtv_s302m_compute_pts_from_video(e);
 	} else {
-		vidtv_s302m_compute_sample_count(e, elapsed_time);
-		vidtv_s302m_compute_pts(e);
+		e->access_units->num_samples = FF_S302M_DEFAULT_NUM_FRAMES;
+		e->access_units->pts = (ctx->au_count * FF_S302M_DEFAULT_PTS_INCREMENT) +
+				       FF_S302M_DEFAULT_PTS_OFFSET;
 	}
 
 	vidtv_s302m_write_frames(e);
 
-out:
 	return e->encoder_buf;
 }
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.h b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
index 01ef47a812c8..eca5e3150ede 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
@@ -33,10 +33,12 @@
  * struct vidtv_s302m_ctx - s302m encoder context.
  * @enc: A pointer to the containing encoder structure.
  * @frame_index: The current frame in a block
+ * @au_count: The total number of access units encoded up to now
  */
 struct vidtv_s302m_ctx {
 	struct vidtv_encoder *enc;
 	u32 frame_index;
+	u32 au_count;
 };
 
 /**
-- 
2.28.0

