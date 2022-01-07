Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A7C4874D0
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 10:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346587AbiAGJfb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 04:35:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346548AbiAGJfY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 04:35:24 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E436C061201
        for <linux-media@vger.kernel.org>; Fri,  7 Jan 2022 01:35:24 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id 59-20020a17090a09c100b001b34a13745eso4083932pjo.5
        for <linux-media@vger.kernel.org>; Fri, 07 Jan 2022 01:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uPa2Y9r48Tr2TjgiZvIGBvNI/0pFs3VgGlpYuEIyE5A=;
        b=kyFrRWAXItsw/PhTpWsDKkqDCYcDPo/CSsPz1chXl/ng4d2iLDV1memUqL/OEl+92l
         jKGiMTZfVGLMq/WAxpbqkBA9h7hsvxOyy3iKpvjEEyM4xccxqp3tdTL9PIwyyUim/vQx
         bFvPiAgPzVA3vzOPwBiMo8GFUrN8g69RFQnTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uPa2Y9r48Tr2TjgiZvIGBvNI/0pFs3VgGlpYuEIyE5A=;
        b=RAfxYvo9/CYWTWTw1iHcSgmIb+Z0RPGfsoayf0a7tJvNKVZCPyDrJRC2IqQiIveQBL
         yw84XJGenfrHVNTLgtniON+A09PPABWgfW3P6E7YBPcMBtFF+N1BKE/8Gq0vN99wCqVM
         xlsFNYQYha5rN+H2bPS+l3tt+LFF71x+M0GNgaPZ4cJ4ZNX2NpA2kaZSJy3JAevsjH/A
         ve9jj7JrXD+g4PCRv8cYpcK3eByBpxLiZdtvxLEe+h3MQije59HpMk7hZx2vpG0XBudx
         2fGMWgjEOhN5wngsR5/9P+fPqBezOyOcFQfHXOZGU/cAVpHwa7EOk5aaLyACIpCgkVEI
         WYSw==
X-Gm-Message-State: AOAM530JJ215+aVxtTGeZH2DRTmOYnFLlAGikkWElDUbrC4c/6/tIHoD
        wI63zbr+omQ8y519awef5hsBfg==
X-Google-Smtp-Source: ABdhPJz1h5qNBJkMbnlr4tRBRegzKszr22xmYctO5J2KYeGk4idAT8zh0U05V3Xl73n4YwTJZIM3aA==
X-Received: by 2002:a17:902:7c05:b0:149:a3b4:934c with SMTP id x5-20020a1709027c0500b00149a3b4934cmr35858061pll.42.1641548123889;
        Fri, 07 Jan 2022 01:35:23 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8f6b:ee:64d8:ae81])
        by smtp.gmail.com with ESMTPSA id j17sm5269192pfu.77.2022.01.07.01.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:35:23 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 8/8] media: hantro: jpeg: Remove open-coded size in quantization table code
Date:   Fri,  7 Jan 2022 17:34:55 +0800
Message-Id: <20220107093455.73766-9-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220107093455.73766-1-wenst@chromium.org>
References: <20220107093455.73766-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The quantization tables used in the Hantro JPEG encoder driver are
implicitly sized by the data they contain, but the loop that scales
the tables based on the compression quality hard codes the size to
64. No code exists to check whether the two actually match.

Commit 85bdcb7eaae7 ("media: hantro: Write the quantization tables in
proper order") introduced two new tables, with sizes hardcoded to 64,
but still no checking if all the sizes are the same.

Commit 41479adb5e52 ("media: hantro: Avoid global variable for jpeg
quantization tables") added the macro JPEG_QUANT_SIZE, but only the
newly added fields used this.

This has resulted in code scattered with magic numbers and array sizes
that happen to match up, without any sort of sanity checking to enforce
it.

Drop the hard-coded array sizes, replace the magic loop count with
a proper JPEG_QUANT_SIZE macro, and add BUILD_BUG_ON()s to check
that all the table sizes match up.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/hantro/hantro_jpeg.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_jpeg.c b/drivers/staging/media/hantro/hantro_jpeg.c
index 84d3f0bfff00..d07b1b449b61 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.c
+++ b/drivers/staging/media/hantro/hantro_jpeg.c
@@ -49,7 +49,7 @@ static const unsigned char chroma_q_table[] = {
 	0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63
 };
 
-static const unsigned char zigzag[64] = {
+static const unsigned char zigzag[] = {
 	 0,  1,  8, 16,  9,  2,  3, 10,
 	17, 24, 32, 25, 18, 11,  4,  5,
 	12, 19, 26, 33, 40, 48, 41, 34,
@@ -60,7 +60,7 @@ static const unsigned char zigzag[64] = {
 	53, 60, 61, 54, 47, 55, 62, 63
 };
 
-static const u32 hw_reorder[64] = {
+static const u32 hw_reorder[] = {
 	 0,  8, 16, 24,  1,  9, 17, 25,
 	32, 40, 48, 56, 33, 41, 49, 57,
 	 2, 10, 18, 26,  3, 11, 19, 27,
@@ -292,7 +292,10 @@ jpeg_scale_quant_table(unsigned char *file_q_tab,
 {
 	int i;
 
-	for (i = 0; i < 64; i++) {
+	BUILD_BUG_ON(ARRAY_SIZE(zigzag) != JPEG_QUANT_SIZE);
+	BUILD_BUG_ON(ARRAY_SIZE(hw_reorder) != JPEG_QUANT_SIZE);
+
+	for (i = 0; i < JPEG_QUANT_SIZE; i++) {
 		file_q_tab[i] = jpeg_scale_qp(tab[zigzag[i]], scale);
 		reordered_q_tab[i] = jpeg_scale_qp(tab[hw_reorder[i]], scale);
 	}
@@ -311,6 +314,11 @@ static void jpeg_set_quality(struct hantro_jpeg_ctx *ctx)
 	else
 		scale = 200 - 2 * ctx->quality;
 
+	BUILD_BUG_ON(ARRAY_SIZE(luma_q_table) != JPEG_QUANT_SIZE);
+	BUILD_BUG_ON(ARRAY_SIZE(chroma_q_table) != JPEG_QUANT_SIZE);
+	BUILD_BUG_ON(ARRAY_SIZE(ctx->hw_luma_qtable) != JPEG_QUANT_SIZE);
+	BUILD_BUG_ON(ARRAY_SIZE(ctx->hw_chroma_qtable) != JPEG_QUANT_SIZE);
+
 	jpeg_scale_quant_table(ctx->buffer + LUMA_QUANT_OFF,
 			       ctx->hw_luma_qtable, luma_q_table, scale);
 	jpeg_scale_quant_table(ctx->buffer + CHROMA_QUANT_OFF,
-- 
2.34.1.575.g55b058a8bb-goog

