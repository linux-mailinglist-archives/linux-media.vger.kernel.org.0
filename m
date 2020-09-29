Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8BE27BB87
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 05:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbgI2D0v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 23:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgI2D0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 23:26:49 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D6CC061755;
        Mon, 28 Sep 2020 20:26:49 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id o21so2540987qtp.2;
        Mon, 28 Sep 2020 20:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1FVuww3IJdd2UIE1fj72kz5GKbYIyP+dhptpK1ApVa8=;
        b=AnOecMsxAMsOnhOnQJM5pCUBPq7uGBeSsYp605AF6kNReyi63O0zOIrh+SOl/ktSHA
         0g7MYOi0IGSFbhxxi49zhvEsyPl3iyOyN6v1Amn4wxptHvNP/bqWrmsqcBU8wPoly/Nr
         JIMbY3pIug4IQ2gaMYTFiWdq3IybL243TOPPe2YtUtxcsB3GaiHptxwAPcMHK9RUhmfA
         YjwyVaUAwN6WHFKKnjO76FBqQMooOaWzXn5vLcKjbh/r7d3wHyLmwBdtf9E2ODpk9S3A
         dyeHejZLv3NLbIJysA+WnDtfAwLJZwghuBA63IH0OfRYQHF/LhW7Uc9/0b/O2COcDOTy
         sx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1FVuww3IJdd2UIE1fj72kz5GKbYIyP+dhptpK1ApVa8=;
        b=V+RGxa7QEgbg2qmUhuH9uyrZ360QCSvpc+45M4Y9mKN5wxiEHqCPNqUXbV8Riwk9mR
         aqA4xkHvxlLn0HVU9O8LcvtfUG3yoc9i0KQZxG/uUrWLexJ7mxzS5JTI6f08ESdPSkbG
         YDOePcWAwE+mkAUWjisG+uy5Fc8WAVAwozDNFXDYx7cGRhho5TqTIDXpsWLlwCD/oSFJ
         q2Lml+qoOfmZLZqmO1hsYqiQAWvwcIuUiETNkGy4l8VbBRotXdQSD+19LIqd0md7pIHh
         IAwr6/wsju4rE8NmVWpv3bFgLcaRHRAaQmntnQ0x6qf70PFYA0OAzLOji2CHBeX8n0Hj
         Jivw==
X-Gm-Message-State: AOAM532dBThtw5Z7NLUP7rPtFK7YeOaIu1CJ/RAsMtbzO3MAlc36L30H
        deh0zBpoX8laZrjeG6GoO5k=
X-Google-Smtp-Source: ABdhPJwbilXRi5Vs/95F6hpaZRpvDfsndwWWDFehkLggNHUJE1lmVxCwXGw6UwdEWUjBtuA194fNBQ==
X-Received: by 2002:ac8:66da:: with SMTP id m26mr1369965qtp.111.1601350008501;
        Mon, 28 Sep 2020 20:26:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c40sm4010313qtb.72.2020.09.28.20.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 20:26:48 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH WIP 5/6] media: vidtv: Move s302m specific fields into encoder context
Date:   Tue, 29 Sep 2020 00:26:24 -0300
Message-Id: <20200929032625.1548909-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
References: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

A few fields used only by the tone generator in the s302m encoder
are stored in struct vidtv_encoder. Move them into
struct vidtv_s302m_ctx instead. While we are at it: fix a
checkpatch warning for long lines.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../media/test-drivers/vidtv/vidtv_encoder.h  |  3 --
 .../media/test-drivers/vidtv/vidtv_s302m.c    | 30 +++++++++++--------
 .../media/test-drivers/vidtv/vidtv_s302m.h    |  3 ++
 3 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_encoder.h b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
index 65d81daef4c3..f742d566fbcb 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_encoder.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
@@ -131,9 +131,6 @@ struct vidtv_encoder {
 	u32 encoder_buf_offset;
 
 	u64 sample_count;
-	int last_duration;
-	int note_offset;
-	enum musical_notes last_tone;
 
 	struct vidtv_access_unit *access_units;
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 6e5e72ce90d0..f7afbda6335d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -233,36 +233,38 @@ static u16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
 {
 	u16 sample;
 	int pos;
+	struct vidtv_s302m_ctx *ctx = e->ctx;
 
 	if (!e->src_buf) {
 		/*
 		 * Simple tone generator: play the tones at the
 		 * beethoven_5th_symphony array.
 		 */
-		if (e->last_duration <= 0) {
+		if (ctx->last_duration <= 0) {
 			if (e->src_buf_offset >= ARRAY_SIZE(beethoven_5th_symphony))
 				e->src_buf_offset = 0;
 
-			e->last_tone = beethoven_5th_symphony[e->src_buf_offset].note;
-			e->last_duration = beethoven_5th_symphony[e->src_buf_offset].duration * S302M_SAMPLING_RATE_HZ / COMPASS / 5;
+			ctx->last_tone = beethoven_5th_symphony[e->src_buf_offset].note;
+			ctx->last_duration = beethoven_5th_symphony[e->src_buf_offset].duration *
+					     S302M_SAMPLING_RATE_HZ / COMPASS / 5;
 			e->src_buf_offset++;
-			e->note_offset = 0;
+			ctx->note_offset = 0;
 		} else {
-			e->last_duration--;
+			ctx->last_duration--;
 		}
 
 		/* Handle silent */
-		if (!e->last_tone) {
+		if (!ctx->last_tone) {
 			e->src_buf_offset = 0;
 			return 0x8000;
 		}
 
-		pos = (2 * PI * e->note_offset * e->last_tone / S302M_SAMPLING_RATE_HZ);
+		pos = (2 * PI * ctx->note_offset * ctx->last_tone / S302M_SAMPLING_RATE_HZ);
 
 		if (pos == 360)
-			e->note_offset = 0;
+			ctx->note_offset = 0;
 		else
-			e->note_offset++;
+			ctx->note_offset++;
 
 		return (fixp_sin32(pos % (2 * PI)) >> 16) + 0x8000;
 	}
@@ -445,6 +447,10 @@ struct vidtv_encoder
 {
 	struct vidtv_encoder *e;
 	u32 priv_sz = sizeof(struct vidtv_s302m_ctx);
+	struct vidtv_s302m_ctx *ctx = kzalloc(priv_sz, GFP_KERNEL);
+
+	if (!ctx)
+		return NULL;
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
 	if (!e)
@@ -460,16 +466,14 @@ struct vidtv_encoder
 	e->encoder_buf_offset = 0;
 
 	e->sample_count = 0;
-	e->last_duration = 0;
 
 	e->src_buf = (args.src_buf) ? args.src_buf : NULL;
 	e->src_buf_sz = (args.src_buf) ? args.src_buf_sz : 0;
 	e->src_buf_offset = 0;
 
 	e->is_video_encoder = false;
-	e->ctx = kzalloc(priv_sz, GFP_KERNEL);
-	if (!e->ctx)
-		return NULL;
+	e->ctx = ctx;
+	ctx->last_duration = 0;
 
 	e->encode = vidtv_s302m_encode;
 	e->clear = vidtv_s302m_clear;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.h b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
index eafe457e761d..a0101734e758 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
@@ -38,6 +38,9 @@ struct vidtv_s302m_ctx {
 	struct vidtv_encoder *enc;
 	u32 frame_index;
 	u32 au_count;
+	int last_duration;
+	int note_offset;
+	enum musical_notes last_tone;
 };
 
 /**
-- 
2.28.0

