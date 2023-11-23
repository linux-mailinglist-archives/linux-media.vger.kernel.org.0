Return-Path: <linux-media+bounces-942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A7E7F680D
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 21:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57D751C20E02
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 20:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114CF4D5B8;
	Thu, 23 Nov 2023 20:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PnFAo/jv"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCE2F9;
	Thu, 23 Nov 2023 12:04:51 -0800 (PST)
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AFDC660739A;
	Thu, 23 Nov 2023 20:04:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700769890;
	bh=MDZ5s7wYAgtfoPDbCDwHCx8aRgjhFb0VxGXGz6Xsrxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PnFAo/jveZwQF4QVlm0hO2ObePnKu7qgXPC49iYywOVG0OqUWLYUe0hfzyicnhum7
	 xi22QWKNhg/UmmKQhsTcfE/+Pg3O2LFSUmBNBkkBcO/aircL01whYky7NRltAt7WEF
	 +DMhTa8MGHmlhchk1tp/HwWschyzv7s/MiagENhpv8E2b/VyN2BNGI1ARgfPUuEwa8
	 SguA2gyFdJXXb2OBxrbHVagh350VSZTs2AP9r9KX7gpABNKB1Pbz6IixhndFTNFy/e
	 qQfPDCHDqihmgmRJlrN/M1L1CF3M1mVHbLH9KK75y/G/uU6xTuzG7ga3P7HIgrqyuK
	 +ecXvJ7Ke/FoQ==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 4/4] visl: Add codec specific variability on output frames
Date: Thu, 23 Nov 2023 14:57:47 -0500
Message-ID: <20231123200451.148097-5-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123200451.148097-1-detlev.casanova@collabora.com>
References: <20231123200451.148097-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running tests with different input data, the stable output frames
could be too similar and hide possible issues.

This commit adds variation by using some codec specific parameters.

Only HEVC and H.264 support this.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/test-drivers/visl/visl-dec.c | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
index a6c878f0813a..60fca1ddadcd 100644
--- a/drivers/media/test-drivers/visl/visl-dec.c
+++ b/drivers/media/test-drivers/visl/visl-dec.c
@@ -272,6 +272,35 @@ static void visl_tpg_fill_sequence(struct visl_ctx *ctx,
 	}
 }
 
+static bool visl_tpg_fill_codec_specific(struct visl_ctx *ctx,
+					 struct visl_run *run,
+					 char buf[], size_t bufsz)
+{
+	/*
+	 * To add variability, we need a value that is stable for a given
+	 * input but is different than already shown fields.
+	 * The pic order count value defines the display order of the frames
+	 * (which can be different than the decoding order that is shown with
+	 * the sequence number).
+	 * Therefore it is stable for a given input and will add a different
+	 * value that is more specific to the way the input is encoded.
+	 */
+	switch (ctx->current_codec) {
+	case VISL_CODEC_H264:
+		scnprintf(buf, bufsz,
+			  "H264: %u", run->h264.dpram->pic_order_cnt_lsb);
+		break;
+	case VISL_CODEC_HEVC:
+		scnprintf(buf, bufsz,
+			  "HEVC: %d", run->hevc.dpram->pic_order_cnt_val);
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
 static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
 {
 	u8 *basep[TPG_MAX_PLANES][2];
@@ -304,6 +333,13 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
 	frame_dprintk(ctx->dev, run->dst->sequence, "");
 	line++;
 
+	if (visl_tpg_fill_codec_specific(ctx, run, buf, TPG_STR_BUF_SZ)) {
+		tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, buf);
+		frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
+		frame_dprintk(ctx->dev, run->dst->sequence, "");
+		line++;
+	}
+
 	visl_get_ref_frames(ctx, buf, TPG_STR_BUF_SZ, run);
 
 	while ((line_str = strsep(&tmp, "\n")) && strlen(line_str)) {
-- 
2.41.0


