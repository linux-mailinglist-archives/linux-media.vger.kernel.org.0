Return-Path: <linux-media+bounces-13612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C490DCCD
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 21:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A832B1F25EA7
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 19:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF65517A937;
	Tue, 18 Jun 2024 19:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="HenJYAdY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B48B176FAC
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718740061; cv=none; b=kXPaDSTHl8xJzqSbv8OIwkOxE+edbobyt8y87qZUH/SqM9QJ58v1NgjaZLjOd07Bmz3jd1vNZTkfuHPsg2kEm/eovmjWpu+NCn39QFIcrhikcovPbYeWSt3QgEdQSIfgCfzkBHwsrtedb11LoVUfXLqltMv3tSFjtPh7QBKugXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718740061; c=relaxed/simple;
	bh=f7MDqrTS9VA2w94f9+abC6s+OPf3kDOoiI4lylYuxJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDYSO1RcZQoh86USVniXY9Ql6IwNz7ndBHXgF5ri98dscT2vaWIrfHTSkLbDVAUSR5xSYprA+bW9jJ7/e+g8BARahAFIzMILOjA/xyxGz1c4CCeUgliCdBAlM1fPHm6iW21FUC/a3+Gr2zCTtfbfZONgK9LnwtcENEZ95Now+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=HenJYAdY; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1718740037; bh=KB45lJtSwQJs9wxJYwKUH/S/Frg3RhjQrCXHEaw5DeQ=;
 b=HenJYAdYjg+PRVnPJ0uai12GuMaqdaDEywRDETcDa2zsws1szChQvi3TGKyjVfISrGXl768Kr
 lycQDdzoCcuSMLsvRk6fP1QGinOqYGv35jbAkyWABOv8WVQcon4hSxiKFa+YXlLj5v4pCBesfhY
 1DQnHrz6ssolwYW+UplVfuC71MCz5IUme35Y8wU3ianW+wF+rxYfg1wj4pdE/JUBYInMJ11b9/x
 PyG5GTzWTMJyfDK8O4jiIGK4+WQU2bHsOFjJzZIs1h1JyiR4fNWvtjlzUXU82GO+9rdlkIIwDRm
 VCswyX4WbIQTMg4P9GESbB+cLtYep4w+TtvbAWNAYawA==
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: Alex Bee <knaerzche@gmail.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Christopher Obbard
 <chris.obbard@collabora.com>, Detlev Casanova
 <detlev.casanova@collabora.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v5 04/10] media: rkvdec: h264: Don't hardcode SPS/PPS parameters
Date: Tue, 18 Jun 2024 19:46:28 +0000
Message-ID: <20240618194647.742037-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618194647.742037-1-jonas@kwiboo.se>
References: <20240618194647.742037-1-jonas@kwiboo.se>
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
 149.28.215.223
X-ForwardEmail-ID: 6671e43f64ade33c90059fb7

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
v5:
- Collect r-b and t-b tags

v4:
- No change

v3:
- New patch

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
2.45.2


