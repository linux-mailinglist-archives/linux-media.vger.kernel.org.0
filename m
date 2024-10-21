Return-Path: <linux-media+bounces-19996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B95B9A6EB4
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 17:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CF2A28138A
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 15:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB5A1CB50C;
	Mon, 21 Oct 2024 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gyS1Ki4i";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="T7zmybvz"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-46.smtp-out.eu-west-1.amazonses.com (a7-46.smtp-out.eu-west-1.amazonses.com [54.240.7.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2E91CB32B;
	Mon, 21 Oct 2024 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525778; cv=none; b=PYnRjqR++u0aQjlkaXKsTdFdOZDylAEAQWtUwQ6YSsHpIFjm9dR+pghqjpauKdgRTI5JDuOh2j+aVZ3jHHfbLKPsUSJv/WWReV0xycvmWbF/l5sD4N51nE/UpI77VE44PPfhx6Z69nshzqdza1ECnErrMN3+xLNmBbKMdsttNps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525778; c=relaxed/simple;
	bh=toAJwIKA7RZAQVARGMAi5K9VmZBIKCnLKPK9Q+kKBaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PKi65x4UCx1toV0JHH0adJUwVYxUCQRTJVsbceiLZ1tIS6Ng11GPcWsY0CGKtyVV0c1zL4vLjtQMzblH6mBS1SwbShdzGebWVcKJzJL8bqB2KixdUjIXAJGKjXfI8tB9/Q2q9ckDlaGYNwkfWdUrHlNsqXVg+EMdT79C8IqZ33M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gyS1Ki4i; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=T7zmybvz; arc=none smtp.client-ip=54.240.7.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1729525774;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=toAJwIKA7RZAQVARGMAi5K9VmZBIKCnLKPK9Q+kKBaw=;
	b=gyS1Ki4ijauyhKcafflRpXHM1GhGqmaWor73rdoLbCvX+sw2LITPQPSRKqfLHX9p
	I5x31z+sZNlGR1jxSUXGH4Yi5RSMUGC8F9Mq9+LMFoRE4ugu0gdQxhvjEyGhiv2KB4a
	EAGtEqq9P4OjPHZ5GuJnbN1fB8xYtNnbKmLlkFNKFBFn7iQ0X/NpZgFToEvKy0npf/s
	/hTF2Iei058gUnEpoUYuhI9hjhvucTSFDebqOvTAwYFuvDGovwB0Z/VrYLm98D1S3BV
	EvBjVt6/sY2fyZ4RJ9ZFcqTXYqQmYHjtGY+XbvB+4ojlaT0Z8ZwqiOsnSCKHQY7zLhi
	WAbLGzsPgA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1729525774;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=toAJwIKA7RZAQVARGMAi5K9VmZBIKCnLKPK9Q+kKBaw=;
	b=T7zmybvzpyTJMJ9kK3gT+3/usua8kp7itqACqLjRldsQ8pi0mka/iED/94CqEMcK
	gcUQi/M8pNMVT3dXVUVUd5RuZD6pCTTitLyZG/DNqzPhBQnDApVmOoBtZI5cDv2m/7z
	hGhDxkliIL3JDF74hFnPbiDb3LOYlUXe4uK8m7DY=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	mchehab@kernel.org, heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: av1: Store chroma and mv offsets
Date: Mon, 21 Oct 2024 15:49:34 +0000
Message-ID: <01020192afc4f87b-fd9b4515-9e30-41e7-8cf9-029cf5c0c7b6-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.10.21-54.240.7.46

Store chroma and motion vectors offsets for each frame so
they can be used later when resolution change.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h              | 7 +++++++
 .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c    | 9 +++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 811260dc3c77..6d36371c1d13 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -332,12 +332,19 @@ struct hantro_vp9_decoded_buffer_info {
 	u32 bit_depth : 4;
 };
 
+struct hantro_av1_decoded_buffer_info {
+	/* Info needed when the decoded frame serves as a reference frame. */
+	size_t chroma_offset;
+	size_t mv_offset;
+};
+
 struct hantro_decoded_buffer {
 	/* Must be the first field in this struct. */
 	struct v4l2_m2m_buffer base;
 
 	union {
 		struct hantro_vp9_decoded_buffer_info vp9;
+		struct hantro_av1_decoded_buffer_info av1;
 	};
 };
 
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e54f5fac325b..69b5d9e12926 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -686,8 +686,6 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_decoded_buffer *dst;
 	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
-	size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
-	size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
 	int cur_width = frame->frame_width_minus_1 + 1;
 	int cur_height = frame->frame_height_minus_1 + 1;
 	int scale_width =
@@ -744,8 +742,8 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
 
 	dst = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
 	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
-	chroma_addr = luma_addr + cr_offset;
-	mv_addr = luma_addr + mv_offset;
+	chroma_addr = luma_addr + dst->av1.chroma_offset;
+	mv_addr = luma_addr + dst->av1.mv_offset;
 
 	hantro_write_addr(vpu, AV1_REFERENCE_Y(ref), luma_addr);
 	hantro_write_addr(vpu, AV1_REFERENCE_CB(ref), chroma_addr);
@@ -2089,6 +2087,9 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
 	chroma_addr = luma_addr + cr_offset;
 	mv_addr = luma_addr + mv_offset;
 
+	dst->av1.chroma_offset = cr_offset;
+	dst->av1.mv_offset = mv_offset;
+
 	hantro_write_addr(vpu, AV1_TILE_OUT_LU, luma_addr);
 	hantro_write_addr(vpu, AV1_TILE_OUT_CH, chroma_addr);
 	hantro_write_addr(vpu, AV1_TILE_OUT_MV, mv_addr);
-- 
2.43.0


