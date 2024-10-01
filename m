Return-Path: <linux-media+bounces-18914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D6198BBDB
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 542D41C2294E
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 12:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4049E1C1AD0;
	Tue,  1 Oct 2024 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="g0CeF4L8"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BCF19DF53
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727784763; cv=none; b=NcN6pPF+fTOpRy6/XixhNLHUQ52u1S7WGDFogd8bvWnOPn4jPv4dxAN65v/OwygHD6XR5KjD0+9DC6noREg1kROgf1Hr38kVH6DylSvRMGY7fj0Rwt2+GVKHtxf+x5WGeBDSHXaFUZq0b11JhKcgsCOdYhQrsjVwZqOJkpz/A4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727784763; c=relaxed/simple;
	bh=7Xevu08pqOThmnsz9UZ+27UzrgUlZyKsiZruLo2MCyA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=OoqT55147DYwA3pzey+10+MPBdny6InD3fDx/I0OyPnjS+Y+mXq7ASB7mTVgRDpygk2XoGrW+5jzZJbf+q5vSRzLTKIPGoevekLmmq0kIgfRrfVb0qqiHIm7kgtZ77UD07OM5Z8q+/eccWuU1A5xwVLzjb8J6s4+IRsxcTqbpaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=g0CeF4L8; arc=none smtp.client-ip=195.121.94.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 4aab4777-7fee-11ef-87be-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 4aab4777-7fee-11ef-87be-005056abbe64;
	Tue, 01 Oct 2024 14:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:to:subject:from:mime-version:date:message-id;
	bh=Qc32fTUbz5LRgw32pVvxPkibhCwy9IJwH+YjqDuyTE8=;
	b=g0CeF4L8MIPxJ42v37q7lfRLgh2EyblM1a/C+ZU1y4fPMajAI7Jg5wDlcUik7KbTT6K7eRFtUMqGF
	 PCOB2EsRm/8uRmTmw6m4M7m/hYGuVGQfUxDugRODnQesZwle6WnK9rzDZ1s46uvKo+9FUQri0WeNMo
	 xFnH3B/TKWsPT7uMKepM5vjS8j2m0pkIWhwTEkeCMZRemuG4s8QikU/8ukMT5zSOVy4hen8rCRQK2C
	 3BXIy3J7wiR3CECwFnVpQk1q6cMjh6DBf76T5qr/M4tRhXtkgfKWNVMfj5PRHGCZYFHJQpVnLWgUo/
	 j0CYBRcr9RVDhY0i5OiTKXtKTpc6/tg==
X-KPN-MID: 33|c9bhoy2tAMVYPR3JD3o0ae/AKAYJjEgCqf8HnGPc4X+CwpUKU/GujCKY7dpSJPx
 5YX0TdDGgNatTMypYrfYJ2kfVTSBgsykDv8uUlo7tEM4=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|0TFWqXtoJ1o0YP0ITHbyrBD0GoeVzSuePvo+Drwv2uQ0hBe5YA865MJfoFgNqyy
 ePUu/B1dPPbUG9/0q7IaSQw==
Received: from [10.47.75.249] (unknown [173.38.220.48])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 4a7a3d18-7fee-11ef-9805-005056ab7447;
	Tue, 01 Oct 2024 14:11:30 +0200 (CEST)
Message-ID: <373c1bd7-8c1c-4cee-ae06-0b4dcaf78f9f@xs4all.nl>
Date: Tue, 1 Oct 2024 14:11:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v6.12] media: dvb-core: add missing buffer index check
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Chenyuan Yang <chenyuan0y@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

dvb_vb2_expbuf() didn't check if the given buffer index was
for a valid buffer. Add this check.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 7dc866df4012 ("media: dvb-core: Use vb2_get_buffer() instead of directly access to buffers array")
Cc: <stable@vger.kernel.org>
---
Resent, noting that it is a fix for 6.12.
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


