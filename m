Return-Path: <linux-media+bounces-18026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45276972291
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 21:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF1A41F23F7F
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 19:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1E218B492;
	Mon,  9 Sep 2024 19:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="TcdSqLwT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [207.246.76.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B052F18B477
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 19:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.246.76.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725909971; cv=none; b=nbhh6NFulRRzNH+vY4ljGhE1/ia/YeimX98lVb0Xx+7OcK8zccvK/ZX/dcNo50N1JmMsjFGQ612R/4UPP0myqCIP3A5sVkkRm9kNE7N3tZQwtvU+qhHB0HLDSj6f38tEeiY/mMPJcCC9cDr+pD41vBfuf+6e4LLK0DurryYbivg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725909971; c=relaxed/simple;
	bh=CDOUgRUU98SK+pRHzKrjt1lpI0bDnQjj6kYO4V9H4EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qV8owCXagiTYTWqpDX4dJ87B9bkQxjqMmekNwirmzhStXxI2Tz8er8XHf+YJB2ALMtwMySX9iZEz3k7wTnE46ahnoL6ZcbGUHcmDbczVe0Ak8TS+XM/HD+b18NXnefrmR5/6TngPTpfaLrjgcW2rdBOo0zm018qGWz4BavqzGrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=TcdSqLwT; arc=none smtp.client-ip=207.246.76.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725909955; bh=pr0eo3e/NwCdZFRkkb4COwnC9OJLFe9nFuPoiCEACVk=;
 b=TcdSqLwTZzjUquNI1T/xqLCFSr5vz6iQaaIvoXiRXfOblGj6DMrl2vnEYICoqGmDZwzsm1nk1
 0Y03zYDJ6Pd32HjBjnwdMnpKDjxJa8HdB5DTnyc8cXFrP/3hpJfrkPRqNGRrSHuws7WhUeoaDlS
 /UcBHTZS2jbHvUz9n2fFGMVr/CcZzUisoF4/d6VbboEZT1QPtCJcSfRB3L1XOG6DX5BGgUsRtWY
 CRaDkVlI2ZefldDU1bn40dzIowewl6OjHaBZCA1+Z/dErndKeQUkUiicm+JjzOFurZj7dc3Xr9X
 xctsOMDSAljYpbqD6Ot4MlnJlN5s7tQVkNTZMf5nHTNg==
From: Jonas Karlman <jonas@kwiboo.se>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Christopher Obbard <chris.obbard@collabora.com>
Subject: [PATCH v6 04/11] media: rkvdec: h264: Don't hardcode SPS/PPS parameters
Date: Mon,  9 Sep 2024 19:25:02 +0000
Message-ID: <20240909192522.1076704-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909192522.1076704-1-jonas@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 207.246.76.47
X-ForwardEmail-ID: 66df4bc1c680cb8b7d2dc1c2

From: Alex Bee <knaerzche@gmail.com>

Some SPS/PPS parameters are currently hardcoded in the driver even
though they exist in the stable uapi controls.

Use values from SPS/PPS controls instead of hardcoding them.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
[jonas@kwiboo.se: constraint_set_flags condition, commit message]
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
---
v6:
- No change

v5:
- Collect r-b and t-b tags

v4:
- No change

v3:
- New patch
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 7a1e76d423df..8bce8902b8dd 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -655,13 +655,14 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 
 #define WRITE_PPS(value, field) set_ps_field(hw_ps->info, field, value)
 	/* write sps */
-	WRITE_PPS(0xf, SEQ_PARAMETER_SET_ID);
-	WRITE_PPS(0xff, PROFILE_IDC);
-	WRITE_PPS(1, CONSTRAINT_SET3_FLAG);
+	WRITE_PPS(sps->seq_parameter_set_id, SEQ_PARAMETER_SET_ID);
+	WRITE_PPS(sps->profile_idc, PROFILE_IDC);
+	WRITE_PPS(!!(sps->constraint_set_flags & (1 << 3)), CONSTRAINT_SET3_FLAG);
 	WRITE_PPS(sps->chroma_format_idc, CHROMA_FORMAT_IDC);
 	WRITE_PPS(sps->bit_depth_luma_minus8, BIT_DEPTH_LUMA);
 	WRITE_PPS(sps->bit_depth_chroma_minus8, BIT_DEPTH_CHROMA);
-	WRITE_PPS(0, QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG);
+	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS),
+		  QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG);
 	WRITE_PPS(sps->log2_max_frame_num_minus4, LOG2_MAX_FRAME_NUM_MINUS4);
 	WRITE_PPS(sps->max_num_ref_frames, MAX_NUM_REF_FRAMES);
 	WRITE_PPS(sps->pic_order_cnt_type, PIC_ORDER_CNT_TYPE);
@@ -688,8 +689,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 		  DIRECT_8X8_INFERENCE_FLAG);
 
 	/* write pps */
-	WRITE_PPS(0xff, PIC_PARAMETER_SET_ID);
-	WRITE_PPS(0x1f, PPS_SEQ_PARAMETER_SET_ID);
+	WRITE_PPS(pps->pic_parameter_set_id, PIC_PARAMETER_SET_ID);
+	WRITE_PPS(pps->seq_parameter_set_id, PPS_SEQ_PARAMETER_SET_ID);
 	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE),
 		  ENTROPY_CODING_MODE_FLAG);
 	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT),
-- 
2.46.0


