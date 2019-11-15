Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26757FD381
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 04:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfKODuX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 22:50:23 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45405 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbfKODuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 22:50:22 -0500
Received: by mail-pl1-f193.google.com with SMTP id w7so3696759plz.12
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2019 19:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aoHM/+WaO5NdDyBd89fOija9I2bAkO5UR3LO1LNuzn0=;
        b=dUOQQA7I7azOiR9oYN73mh4AZ7L7cneL2H8q46OW5PvCuk7dl9oV65Fc+ofLVKwnIi
         Yy6JeJ10UHl7RfPgdOgzK+SwTxcBqZ8mj79n7+x/AWeshU0dUzIquTqScneSspZhEPoZ
         pMpJtQLv0TFtdrkZ4M479Zl0/TRTW1wrbrXPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aoHM/+WaO5NdDyBd89fOija9I2bAkO5UR3LO1LNuzn0=;
        b=TcPGRIsIuMtGpPm5FcfRQPii04KltedU1v5S0hMhNT/+vBP8kteMKWtLOW/PZ/ye6B
         Z42dZm1CfJbbsbqQl7x0KIezgOaREfuU/y31yQQ4Vue4hQ5uDFWUFH4viCQaQAWas+RC
         lc/YxX0MgVt7wS4qJyn9j8MYtOPwpSIdwV2YU/uvlfwt8CjwLuBhNL/S2Y8jyfdWglDI
         r/QM5X45oBSX7BMBIRGsWCdgUH8rc0+a3nrOlgyJbFAGFteKFoax+if/9Ykj+GHEZ+UC
         sjpbtYtou0MmxZP1QvYCmAcl6eSwDjAcnX6UsX9Ol+DREO1b02Zws309jjoFp24TwM0j
         njgw==
X-Gm-Message-State: APjAAAUyamXOXI8RuLChBiye/pbcc6cQ0Sir3a4wnHcQVC5AR2x56rMx
        tLzeOEIBX4PYR5piwluwm/r2JlPDilg=
X-Google-Smtp-Source: APXvYqx+X3ULKqDfunR2Ia4GXkAkz4kASd163UXphAsWQ45xDJIJVyxkDBfUOIorUFH8cV8xizrlWg==
X-Received: by 2002:a17:902:6a88:: with SMTP id n8mr452520plk.226.1573789820467;
        Thu, 14 Nov 2019 19:50:20 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id f7sm9900736pfa.150.2019.11.14.19.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 19:50:19 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH] media: hantro: make update_dpb() not leave holes in DPB
Date:   Fri, 15 Nov 2019 12:50:13 +0900
Message-Id: <20191115035013.145152-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

update_dpb() reorders the DPB entries such as the same frame in two
consecutive decoding requests always ends up in the same DPB slot.

It first clears all the active flags in the DPB, and then checks whether
the active flag is not set to decide whether an entry is a candidate for
matching or not.

However, this means that unused DPB entries are also candidates for
matching, and an unused entry will match if we are testing it against a
frame which (TopFieldOrderCount, BottomFieldOrderCount) is (0, 0).

As it turns out, this happens for the very first frame of a stream, but
it is not a problem as it would be copied to the first entry anyway.
More concerning is that after an IDR frame the Top/BottomFieldOrderCount
can be reset to 0, and this time update_dpb() will match the IDR frame
to the first unused entry of the DPB (and not the entry at index 0 as
would be expected) because the first slots will have different values.

The Hantro driver is ok with this, but when trying to use the same
function for another driver (MT8183) I noticed decoding artefacts caused
by this hole in the DPB.

Fix this by maintaining a list of DPB slots that are actually in use,
instead of relying on the absence of the active flag to do so. This also
allows us to optimize matching a bit.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/staging/media/hantro/hantro_h264.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 568640eab3a6..2357068b0f82 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -474,14 +474,19 @@ static void update_dpb(struct hantro_ctx *ctx)
 {
 	const struct v4l2_ctrl_h264_decode_params *dec_param;
 	DECLARE_BITMAP(new, ARRAY_SIZE(dec_param->dpb)) = { 0, };
+	DECLARE_BITMAP(in_use, ARRAY_SIZE(dec_param->dpb)) = { 0, };
 	DECLARE_BITMAP(used, ARRAY_SIZE(dec_param->dpb)) = { 0, };
 	unsigned int i, j;
 
 	dec_param = ctx->h264_dec.ctrls.decode;
 
-	/* Disable all entries by default. */
-	for (i = 0; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++)
+	/* Mark entries in use before disabling them. */
+	for (i = 0; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++) {
+		if (ctx->h264_dec.dpb[i].flags &
+		    V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
+			set_bit(i, in_use);
 		ctx->h264_dec.dpb[i].flags &= ~V4L2_H264_DPB_ENTRY_FLAG_ACTIVE;
+	}
 
 	/* Try to match new DPB entries with existing ones by their POCs. */
 	for (i = 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
@@ -492,18 +497,19 @@ static void update_dpb(struct hantro_ctx *ctx)
 
 		/*
 		 * To cut off some comparisons, iterate only on target DPB
-		 * entries which are not used yet.
+		 * entries which are already used.
 		 */
-		for_each_clear_bit(j, used, ARRAY_SIZE(ctx->h264_dec.dpb)) {
+		for_each_set_bit(j, in_use, ARRAY_SIZE(ctx->h264_dec.dpb)) {
 			struct v4l2_h264_dpb_entry *cdpb;
 
 			cdpb = &ctx->h264_dec.dpb[j];
-			if (cdpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE ||
-			    !dpb_entry_match(cdpb, ndpb))
+			if (!dpb_entry_match(cdpb, ndpb))
 				continue;
 
 			*cdpb = *ndpb;
 			set_bit(j, used);
+			/* Don't reiterate on this one. */
+			clear_bit(j, in_use);
 			break;
 		}
 
-- 
2.24.0.432.g9d3f5f5b63-goog

