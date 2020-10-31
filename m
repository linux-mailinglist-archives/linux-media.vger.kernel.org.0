Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE642A186F
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 16:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgJaPGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 11:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgJaPGR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 11:06:17 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DFEC0617A6;
        Sat, 31 Oct 2020 08:06:17 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id m14so6250786qtc.12;
        Sat, 31 Oct 2020 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PCvO/PPPP7+nQ6uwQgtk8mFv9Z7qqn+sP+8PJKc6iJE=;
        b=iSChu41JRrmskRgcLjxKMag877VQynA9iS3oa/QPcNgb5YWsm697eH6QSkTS6sYe+n
         czJyDuGBVC0rde0XDthGO54sF374XndP6WbiX0pmFZbcBnzqWayv4bXSx3vBzU99I4JC
         5uvkgRrGlFdZzP94jcNNWGVUJ10x9HnB7idIqTBcfgMP1dZvjTK2uY0RfLIlD4xFa2zw
         OcPuZZEnAIRn4Jg3zMslYU3jj8hAbV2DPafkugDEm5YYuLG5pYGW0frL+sCtTXi4IeF5
         SVr01J+csH7LhOrgnvf6+fGqzjtZQ+784RksBz68eExZbe5TqdzZkbJL7y9+DGE6vP3D
         xXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PCvO/PPPP7+nQ6uwQgtk8mFv9Z7qqn+sP+8PJKc6iJE=;
        b=pm22SREMwzKlU31mrRitHKJ2n3bfvAr5AwJfjrVSNSGi+aqU/QMheTrnRlCX9Mf30U
         bSbr8TLWmp5P4I9OckqRdS3h0fcMWmd8mhdnwF/kkQtnFMITifwMo/dvGGCh03tU1+Gi
         yGKbe4iONhjizc/H07H4FCQU76p6/7OBzD71XPM0obwokCS1KVj1uS3fUD7fD77CGkXu
         nC0jnfGgTd6fY6qIXIz2xpq9A2yyGCl9wbqD/j0Nj0vO/YCY107+GGrJmk40reQpbhE1
         5B+zAIU+lzvLSjjArdX9KitT8tVyrFzw/1fvhGGPYy5fP7gO3SFHRp0PshOHBJ96BcH4
         cFbw==
X-Gm-Message-State: AOAM531tcm2dntpsDLPHcg42PGjwpriEq5gbsV9YopAgRnoQFQU1G3gE
        KfnA9UNGUfpoMm6XELFLc9e1lxxcM2SDTg==
X-Google-Smtp-Source: ABdhPJzFOj4nmGsPPa6pVjMDfBC5xphXVmxjJ6IlIYFHn2WAkWk7hH3BW25Nq8X0mtxgpSygo4EVSA==
X-Received: by 2002:aed:2982:: with SMTP id o2mr6958014qtd.73.1604156776831;
        Sat, 31 Oct 2020 08:06:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 08:06:16 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, r.verdejo@samsung.com,
        nicolas@ndufresne.ca
Cc:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] media: vidtv: Move s302m specific fields into encoder context
Date:   Sat, 31 Oct 2020 12:05:51 -0300
Message-Id: <20201031150552.663598-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201031150552.663598-1-dwlsalmeida@gmail.com>
References: <20201031150552.663598-1-dwlsalmeida@gmail.com>
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
 .../media/test-drivers/vidtv/vidtv_encoder.h  |  3 ---
 .../media/test-drivers/vidtv/vidtv_s302m.c    | 25 +++++++++++--------
 .../media/test-drivers/vidtv/vidtv_s302m.h    |  3 +++
 3 files changed, 17 insertions(+), 14 deletions(-)

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
index a447ccbd68d5..aacf8110d874 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -230,36 +230,38 @@ static u16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
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
@@ -442,6 +444,7 @@ struct vidtv_encoder
 {
 	struct vidtv_encoder *e = kzalloc(sizeof(*e), GFP_KERNEL);
 	u32 priv_sz = sizeof(struct vidtv_s302m_ctx);
+	struct vidtv_s302m_ctx *ctx = kzalloc(priv_sz, GFP_KERNEL);
 
 	e->id = S302M;
 
@@ -453,14 +456,14 @@ struct vidtv_encoder
 	e->encoder_buf_offset = 0;
 
 	e->sample_count = 0;
-	e->last_duration = 0;
 
 	e->src_buf = (args.src_buf) ? args.src_buf : NULL;
 	e->src_buf_sz = (args.src_buf) ? args.src_buf_sz : 0;
 	e->src_buf_offset = 0;
 
 	e->is_video_encoder = false;
-	e->ctx = kzalloc(priv_sz, GFP_KERNEL);
+	e->ctx = ctx;
+	ctx->last_duration = 0;
 
 	e->encode = vidtv_s302m_encode;
 	e->clear = vidtv_s302m_clear;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.h b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
index eca5e3150ede..b1bbe521e766 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
@@ -39,6 +39,9 @@ struct vidtv_s302m_ctx {
 	struct vidtv_encoder *enc;
 	u32 frame_index;
 	u32 au_count;
+	int last_duration;
+	int note_offset;
+	enum musical_notes last_tone;
 };
 
 /**
-- 
2.29.2

