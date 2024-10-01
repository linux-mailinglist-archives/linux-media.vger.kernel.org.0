Return-Path: <linux-media+bounces-18913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC1398BBD3
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DBD8284689
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 12:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6DC1C1ACA;
	Tue,  1 Oct 2024 12:10:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE5119DF53
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727784619; cv=none; b=f3ML7NnpQT6AeIGtJ0/lSmST40HfsFpVF72rDcqbVT/LteEjnEj7DioK+ltpV0rRxnvXkOyyBtskqCHAE5JKAzr/mxLnwwApsgOdfd2meeSnZaYkEf8TbUYxD1cj/quqV46LCAEepJ4px3XsPECa4f5Fpg5CwR/AiOS5vpf3khg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727784619; c=relaxed/simple;
	bh=bidhJOl1zvlUH5uc8glZgPxb/Pg/wI4LCo0oObNAgDk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=sSak5BsJeuW9U7Q/qAEIsr1q4icRIOug0VriiEwGrVEHxqDZnCD/fVoxdBlcY2UD+Pop3HiBAhYWTRWAqSfiQp6ATAps6FxagOiZgpvSBVJbh5vjk8s+I7T1txUPZMVaXwUWA3iV5BnATIF0dByg4UXSEA2RTYBCCyIaM4KwEh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B111BC4CEC6;
	Tue,  1 Oct 2024 12:10:18 +0000 (UTC)
Message-ID: <2f9b1beb-efb7-4390-9c64-b9cb4ec1bc15@xs4all.nl>
Date: Tue, 1 Oct 2024 14:10:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Chenyuan Yang <chenyuan0y@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: dvb-core: add missing buffer index check
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

dvb_vb2_expbuf() didn't check if the given buffer index was
for a valid buffer. Add this check.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 7dc866df4012 ("media: dvb-core: Use vb2_get_buffer() instead of directly access to buffers array")
Cc: <stable@vger.kernel.org>
---
 drivers/media/dvb-core/dvb_vb2.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 192a8230c4aa..29edaaff7a5c 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -366,9 +366,15 @@ int dvb_vb2_querybuf(struct dvb_vb2_ctx *ctx, struct dmx_buffer *b)
 int dvb_vb2_expbuf(struct dvb_vb2_ctx *ctx, struct dmx_exportbuffer *exp)
 {
 	struct vb2_queue *q = &ctx->vb_q;
+	struct vb2_buffer *vb2 = vb2_get_buffer(q, exp->index);
 	int ret;

-	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, q->type, q->bufs[exp->index],
+	if (!vb2) {
+		dprintk(1, "[%s] invalid buffer index\n", ctx->name);
+		return -EINVAL;
+	}
+
+	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, q->type, vb2,
 			      0, exp->flags);
 	if (ret) {
 		dprintk(1, "[%s] index=%d errno=%d\n", ctx->name,
-- 
2.34.1


