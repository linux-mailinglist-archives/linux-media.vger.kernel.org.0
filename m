Return-Path: <linux-media+bounces-57131-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM1BKA3sxGm+5AQAu9opvQ
	(envelope-from <linux-media+bounces-57131-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 09:19:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48977331291
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 09:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9507430C0735
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 08:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB993537CD;
	Thu, 26 Mar 2026 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrY4M9ko"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7715330D50
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512767; cv=none; b=fyzjkdmQfu8iSjjlaoN4ANqUrMdXb4Bc1VPQg6k/SMXaF7466Oy0DecoLOBmDpwXDX129MwKP8MTqnNhwhURMcgfVQ2dfq1UtaT6fo9Xsf+pRMoCgpl79/LEqJ1E/3JBma43ECDwRrpfRVwFLtQy9C4y8TNrK0MaVqZ5mK9kvlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512767; c=relaxed/simple;
	bh=SpQpr6QmT3/si3N4CbIJ4uIvZwvpj9k8YQ/VpLPgctk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgDMkoIohWNp3L/yhmioY19zVWrXLWFwLJEUiKJiT8bIbVhd5OMKQj9XvwBynXCQXe0sjbtxEPJFUU4VwnQJibg3ZgrN+XeYkJT78ObBf+gIxM4xOLLCQS84R/b8UJ0bqEsp5vMYAZNsS7S+HbIC1wQ48naNR60brL13/g5DfZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrY4M9ko; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b44e83c0cso22798f8f.3
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774512764; x=1775117564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zL7LTupav7s/MFVqImpzW6TZtqVIR7QZchoJ4qiar+s=;
        b=NrY4M9koJhsrgXLIpHMtBo/MJP67BRSd2Sy2np5qQD9Rd3fN4ZKNio7oAchyI3HsDZ
         nNEJs7XOydG7Eor3rLoQ/L3lIW7xbl9P8kdcMh6/55OIYfoKs23txfkqqtWS5JRlN0PU
         OUCUioFGoetXJaIO2j/EC2yTCy68dfD+/Aa1uosEOXMMKWxVlB8E3NmpEyVbGQ/WhqaY
         OdDbAW0sYZ10+pJ/GVRVLtr4w47o+vSGxAlGwMl3rp15J7OZhDYrjX/N67unWpQqgy24
         svN0zus3thaLqtFztaaAhPuzx6wB1IZPn2l+zQLaXuW9spyDhSoTs4bqdBfScPKcjJD6
         /LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512764; x=1775117564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zL7LTupav7s/MFVqImpzW6TZtqVIR7QZchoJ4qiar+s=;
        b=Zo7AySAp5c+Z0IrygPBRChx7cyGN4rabsQSGroxCf5mFJehadJO+wjjN0MmRVvdPMq
         mrSwOmc7X4JqdwDg6Y5UKaswHpb6XbjNFAtAxgQ5TnMV0zsoKKXIwuWOlU+o9Xov8xgd
         xM0oPPG+ryr4+NyxSlgF/EJ+O/PNyhpkMJmqQlPw6JOS360bNx3SZlmpljRPOh6pmEWd
         2ObYkIh8ybwISzbRQBpZtr7ATwLn7QDjkztRqdfzv4kZm0Kk3/Dx2I3CCVyPKZ9BZXXd
         CeNcqGSFCzq+TI+t8Y1qA1Iz3TtWCRTeBbbW9qtPUs0mOyVuPzIif+BqgjYKuOjqSZeU
         +e8w==
X-Gm-Message-State: AOJu0YyWc5RGcnxPYJlr8t3QxlPqnmOFJE4DJFVTILJ3RYmAN4FlKqiu
	xB+zTgaCW+nhOLBwocOTG9ODmzNDGgEFjjKx02jZwusaMvKH+vDEzcsFq1mKAA==
X-Gm-Gg: ATEYQzyDFeojBBpBifrv9TMtMrCsw325F5HcUbF3TSJAHcerwbabjUl2CPSdZaZ5/m3
	dbCTRxCaEaMYta20eB/EBOPqCSfY7ZpR06N4zPM/N5qDzOhS0QtBt7iAGs3BkA+Y46n7eeHFjxm
	ewNrwVQ4j8UzXSas4S9WRLAioF+smyRLMlMX8XGT4dqGhH3tB1Uxu7wx3LK0rRw4Gs9vQfQiVbJ
	PZdAlKYiOA2OwgAtHanlODZ3AMW3kNIXSgc6XEQvkNQvgexBzu+RHuKEhHdFT7t1Xc4FbgHkhUO
	ol/e1tvRy1o0rCxXYSinB2Zwyfhfv7jeP36HNIYOvQD05jo/kNy6ZbAJQAXKpSz/YU2oV9eCFqE
	9FfTgALwpqg2dw4VReDLcQT+sbJxM0nXS++ei48CBJmIqejDwHBx8HywxPOkycb1es0C+t1Jrs4
	rwVA4gfup1Rng5/0GCe2XQInOWVbT450yo8niOnzL+JQ6Xu5hHsJWrBA5Xl3UPgVfbD7RSiTc=
X-Received: by 2002:a05:6000:4601:b0:43b:935c:a8b5 with SMTP id ffacd0b85a97d-43b935ca9c2mr2025090f8f.1.1774512763358;
        Thu, 26 Mar 2026 01:12:43 -0700 (PDT)
Received: from rivka-VirtualBox.. ([213.137.65.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e352sm6382249f8f.3.2026.03.26.01.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:12:42 -0700 (PDT)
From: Rivka S <s0533160580@gmail.com>
To: linux-media@vger.kernel.org
Cc: Rivka S <s0533160580@gmail.com>
Subject: [PATCH] utils: fwht: support resolution changes
Date: Thu, 26 Mar 2026 10:12:12 +0200
Message-ID: <20260326081211.26562-2-s0533160580@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57131-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s0533160580@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 48977331291
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The FWHT decoder currently fails when the resolution changes
between frames.

Instead of returning -EINVAL, update the internal state to match
the new resolution.

When a resolution change is detected:
- Update visible width and height from the frame header
- Recalculate coded dimensions
- Update stride and reference stride
- Reset GOP-related state

Also recompute dependent values such as dst_chroma_stride,
ref_chroma_stride and dst_size after updating the state.

On the userspace side, ensure the destination buffer is large enough
for the updated frame size and reallocate it if needed.

This allows decoding streams with dynamic resolution changes.

Tested using a custom FWHT decoding script.

Signed-off-by: Rivka Sabo <s0533160580@gmail.com>
---
 utils/common/codec-v4l2-fwht.c | 29 ++++++++++++++++++++++-------
 utils/qvidcap/capture.cpp      | 15 ++++++++++++---
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/utils/common/codec-v4l2-fwht.c b/utils/common/codec-v4l2-fwht.c
index 0c83678f..f45b06c3 100644
--- a/utils/common/codec-v4l2-fwht.c
+++ b/utils/common/codec-v4l2-fwht.c
@@ -288,9 +288,9 @@ int v4l2_fwht_decode(struct v4l2_fwht_state *state, u8 *p_in, u8 *p_out)
 	const struct v4l2_fwht_pixfmt_info *info;
 	unsigned int hdr_width_div, hdr_height_div;
 	struct fwht_raw_frame dst_rf;
-	unsigned int dst_chroma_stride = state->stride;
-	unsigned int ref_chroma_stride = state->ref_stride;
-	unsigned int dst_size = state->stride * state->coded_height;
+	unsigned int dst_chroma_stride;
+	unsigned int ref_chroma_stride;
+	unsigned int dst_size;
 	unsigned int ref_size;
 
 	if (!state->info)
@@ -309,10 +309,25 @@ int v4l2_fwht_decode(struct v4l2_fwht_state *state, u8 *p_in, u8 *p_out)
 	    state->header.magic2 != FWHT_MAGIC2)
 		return -EINVAL;
 
-	/* TODO: support resolution changes */
-	if (ntohl(state->header.width)  != state->visible_width ||
-	    ntohl(state->header.height) != state->visible_height)
-		return -EINVAL;
+	if (ntohl(state->header.width) != state->visible_width ||
+	    ntohl(state->header.height) != state->visible_height) {
+		state->visible_width = ntohl(state->header.width);
+		state->visible_height = ntohl(state->header.height);
+		state->coded_width = vic_round_dim(
+			state->visible_width + (info->width_div - 1),
+			info->width_div);
+		state->coded_height = vic_round_dim(
+			state->visible_height + (info->height_div - 1),
+			info->height_div);
+		state->stride = state->coded_width * info->bytesperline_mult;
+		state->ref_stride = state->stride;
+		state->gop_cnt = 0;
+		state->ref_frame_ts = 0;
+	}
+
+	dst_chroma_stride = state->stride;
+	ref_chroma_stride = state->ref_stride;
+	dst_size = state->stride * state->coded_height;
 
 	flags = ntohl(state->header.flags);
 
diff --git a/utils/qvidcap/capture.cpp b/utils/qvidcap/capture.cpp
index 6b41933e..8fff20c8 100644
--- a/utils/qvidcap/capture.cpp
+++ b/utils/qvidcap/capture.cpp
@@ -1337,9 +1337,18 @@ void CaptureWin::sockReadEvent()
 			offset += n;
 			sz -= n;
 		}
-		if (is_fwht)
-			fwht_decompress(m_ctx, dst, data_size, m_curData[p], m_curSize[p]);
-		else
+		if (is_fwht) {
+			__u32 needed_out = m_v4l_fmt.g_sizeimage(p);
+
+			if (!m_curData[p] || m_curSize[p] < needed_out) {
+				delete[] m_curData[p];
+				m_curData[p] = new __u8[needed_out];
+				m_curSize[p] = needed_out;
+			}
+
+			fwht_decompress(m_ctx, dst, data_size, m_curData[p],
+					m_curSize[p]);
+		} else
 			rle_decompress(dst, size, data_size,
 				       rle_calc_bpl(m_v4l_fmt.g_bytesperline(p), m_v4l_fmt.g_pixelformat()));
 	}
-- 
2.43.0


