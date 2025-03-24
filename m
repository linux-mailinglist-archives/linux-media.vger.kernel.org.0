Return-Path: <linux-media+bounces-28616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1608DA6D75A
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 10:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C6D416E4DB
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659A225DCF1;
	Mon, 24 Mar 2025 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TF2ah4gM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B2025DAEF;
	Mon, 24 Mar 2025 09:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808586; cv=none; b=U2awZ5vYdwGM6TLfO0YSsl0nGMax9ELqfuQxl3BPB+tirvaqyQY5wHsAvamoVNpxbuSicuYJp/vNpQt8rOjcKt8fWzHoagEacWaydLAKz8f5yvxMqAn1vVfwxRQimmq+w8rnTrX3PRVM6h0px30HpJfDo3UjYL14Z/e+Sh1m4BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808586; c=relaxed/simple;
	bh=3KGY5OyKRmiFHGZoBEr7GBUgXJMtZdAyPKYD7ntDZjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZLKgJljNU/dqswIuPwbihqADAOqO/7IGMTP3v+pDwLFDts/+d0rWKN5dBQYJCC/DeuMfXJIR5FWaCzpiEJ1nE6koIBJTpNhxBPeaowUPevFVRolbb+xW1gBzdSGPlV+jiG8TS/hv5seEiFjess0yOxzSduePysOSTyATJdixVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TF2ah4gM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68007A8F;
	Mon, 24 Mar 2025 10:27:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742808475;
	bh=3KGY5OyKRmiFHGZoBEr7GBUgXJMtZdAyPKYD7ntDZjU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TF2ah4gMQMEwoQxcgIcoFsJDc3ms7zOYPvuKQv/1ABJW4ftEffu+mc26BlJlNMsXg
	 MitGTBtkgvKIHm72jv8p5+uL5JAh4AsXm2d1HgzZSdgXIqR3QjJuazgPMSfsXjATsT
	 9kkkHM/qFE4LIwVns51DGKO7O4awll4DUp50c9SY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 24 Mar 2025 11:29:17 +0200
Subject: [PATCH v6 1/3] media: ti: cal: Use printk's fourcc formatting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-cal-streams-v6-1-28c93fb8f0c9@ideasonboard.com>
References: <20250324-cal-streams-v6-0-28c93fb8f0c9@ideasonboard.com>
In-Reply-To: <20250324-cal-streams-v6-0-28c93fb8f0c9@ideasonboard.com>
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=3KGY5OyKRmiFHGZoBEr7GBUgXJMtZdAyPKYD7ntDZjU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4SYDCJPld3RK3CLaO3gWQPCm3s9H4IXbGrzMS
 55U+wL+JrWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+EmAwAKCRD6PaqMvJYe
 9e6FD/9wyefCWjiz8dlhrX246d+62KomQ9p2i2V6bseee6HDYDsoNjlK8PXCegmw2OOoc+vSS4Q
 60l2L9caueVSaTlsSF5VMK3ctO5+LgtRtRwI1LTeI7+vkFcPnP6qWnjvEsZV/kDsA+LZJy25TO6
 zcbEF9LA/STQstu0Hhs1NLiJ75W0YA96QZzEItNKRiJnEb148uyGt4/cnK5hzt7lxTo0AUKRHLp
 tws/ZnAnJR8EiBz1sNtwCaLq3YiY+v/T80LFi3YknlMnccFQT00M7V8r/WWvA47d2z09uhXFSeb
 JpFD1GPduHiQ2orausMvQqI7ipuG+5TLRXHUHhAbeLW1yaxhqQrzAXT9EsyLJCsMkYLFlEvv9wI
 cFXybe4d6WecU+6cp4v2oxE3E9f9GKTqjTvYoqMXs2FasCjhtsqKm4OtyZrFOcOoM68pAQ5ZeV0
 gGNTuSvRQbQ6sId79fQ3BnGg3TBscDmp3etbM1wQGb+V6NmDqJMoGxo1eCv2KyHpcLLjUro5jFf
 1H//OeKoo8K06VvMlBO+5462OA0QJwJ6n/HteWXd2yTvPqz0A2HXSK6SiPNpkkJEhpGb0euanPf
 2+/HtteDbOcFroYHZvN/LT5bzEqSV67fGoxBMFZpZi3opnSXKx4jPTfHzQuHo/aTPWWQoXBhPXi
 s1DXI+HKBlcJL6Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use printk's fourcc formatting instead of a custom one.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-video.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index e29743ae61e2..4eb77f46f030 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -25,20 +25,6 @@
 
 #include "cal.h"
 
-/*  Print Four-character-code (FOURCC) */
-static char *fourcc_to_str(u32 fmt)
-{
-	static char code[5];
-
-	code[0] = (unsigned char)(fmt & 0xff);
-	code[1] = (unsigned char)((fmt >> 8) & 0xff);
-	code[2] = (unsigned char)((fmt >> 16) & 0xff);
-	code[3] = (unsigned char)((fmt >> 24) & 0xff);
-	code[4] = '\0';
-
-	return code;
-}
-
 /* ------------------------------------------------------------------
  *	V4L2 Common IOCTLs
  * ------------------------------------------------------------------
@@ -180,8 +166,8 @@ static void cal_calc_format_size(struct cal_ctx *ctx,
 	f->fmt.pix.sizeimage = f->fmt.pix.height *
 			       f->fmt.pix.bytesperline;
 
-	ctx_dbg(3, ctx, "%s: fourcc: %s size: %dx%d bpl:%d img_size:%d\n",
-		__func__, fourcc_to_str(f->fmt.pix.pixelformat),
+	ctx_dbg(3, ctx, "%s: fourcc: %p4cc size: %dx%d bpl:%d img_size:%d\n",
+		__func__, &f->fmt.pix.pixelformat,
 		f->fmt.pix.width, f->fmt.pix.height,
 		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
 }
@@ -509,8 +495,8 @@ static void cal_mc_try_fmt(struct cal_ctx *ctx, struct v4l2_format *f,
 	if (info)
 		*info = fmtinfo;
 
-	ctx_dbg(3, ctx, "%s: %s %ux%u (bytesperline %u sizeimage %u)\n",
-		__func__, fourcc_to_str(format->pixelformat),
+	ctx_dbg(3, ctx, "%s: %p4cc %ux%u (bytesperline %u sizeimage %u)\n",
+		__func__, &format->pixelformat,
 		format->width, format->height,
 		format->bytesperline, format->sizeimage);
 }
@@ -866,8 +852,8 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 			if (mbus_code.code == fmtinfo->code) {
 				ctx->active_fmt[i] = fmtinfo;
 				ctx_dbg(2, ctx,
-					"matched fourcc: %s: code: %04x idx: %u\n",
-					fourcc_to_str(fmtinfo->fourcc),
+					"matched fourcc: %p4cc: code: %04x idx: %u\n",
+					&fmtinfo->fourcc,
 					fmtinfo->code, i);
 				ctx->num_active_fmt = ++i;
 			}

-- 
2.43.0


