Return-Path: <linux-media+bounces-28785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD4FA715D3
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 309823BA1CA
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414271DE4DD;
	Wed, 26 Mar 2025 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v4DLVg8D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8721DC993;
	Wed, 26 Mar 2025 11:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742988865; cv=none; b=Kv1x411ZC+zqKrz3RzRWYy5M8CUV2kbMFt29WXf6vgxiNNlCqdj3VjFQmeX0PBj1de0CykLHXVlf3PgxF5lP7X0xO0VHOXzYEnxmrF7UTNOAYOQBMFiITwzyJhDJy6E5zEAuH3FuHtfp4Kv+HnDoHh00L2l+LQknF3wfj6JWn28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742988865; c=relaxed/simple;
	bh=a/Yd+gEaYv/WgNgdWQMPcplGbdnBPIcRP/UqRxaXD3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUGsfuU/hfnofDFJE2udZp1KxlDnKjURWpJ4Exn5/nSn8roJkmhUUPJ0lgzhwQbJFjd3QVtgM2JjBioyPkgW5INVcUCNxnhHYws8l8LI3eoB1ryZih2MmaO8RKLk5xKjC3q3s7kQlGb4zy8oZAfUZb0WGq9H7hqvmwBIO1/gI7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v4DLVg8D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01ACD99F;
	Wed, 26 Mar 2025 12:32:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742988753;
	bh=a/Yd+gEaYv/WgNgdWQMPcplGbdnBPIcRP/UqRxaXD3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=v4DLVg8DHB1VK7/meKEJRm4b+xnK54TJW893iJjjzjzxpEpA9QuJBp4lLXyQ0oXjy
	 tCX2Ew5RpXNQcOhyx3aKRRqRtylhupOryNL/e4V6wJcZjjtSbsEJu3oKX3mmPz9vqk
	 RFUCqlrUc9qt/1Gb14RmAmLe4n95emDdUlgREsoo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:34:01 +0200
Subject: [PATCH v7 1/3] media: ti: cal: Use printk's fourcc formatting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-cal-streams-v7-1-659df87ad231@ideasonboard.com>
References: <20250326-cal-streams-v7-0-659df87ad231@ideasonboard.com>
In-Reply-To: <20250326-cal-streams-v7-0-659df87ad231@ideasonboard.com>
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benoit Parrot <bparrot@ti.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=a/Yd+gEaYv/WgNgdWQMPcplGbdnBPIcRP/UqRxaXD3s=;
 b=owEBbAKT/ZANAwAIAfo9qoy8lh71AcsmYgBn4+Y6mgOqwpg1vNIZII0ljy02MYFcweKKRZfVF
 QgehdBhGXiJAjIEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PmOgAKCRD6PaqMvJYe
 9Z1YD/Y5t1smIKTECa2uOfkUorr70FdN1zf6bg6j0A2cu4mLD/jr1iFzZd2/nJjSrAbM19X1uvl
 kANZKTIyRHZcRBT7gKs+0PorywQghQSdNej5TR+eLCPGplQIrfBOUtoHQrgv2U9S5VcGbUbRVFJ
 zYJKXgRgpbIxcEUnkqSuRnGLDpRALlvSHKQ7PwPvt4kNtgTejLnPAKhHmAmUM7otpBQerg9emxZ
 k9bNMujyLkn5xS1xEQV9rEFqs3tA5zcQdAqG7FMHyf7414ZG4p3WoWeTO8lg0+4Di+qpQUyDDdK
 g8Z9znkJKdpPnbUmnyt+4jSgs0VYPYwQspbWrhs605INaRu3z3Nqqwkn5OGJPpILDcARsd8g/rf
 1q1TmlpLOQoMXtl8EmXMLszIWH1jA2isATHRwy3Pcg9g64A7GfhGPrm5oxr2UWMc07WUZ3/+F8I
 oerykPY2tLEIIEQKagBanvMmYN1956tpbmNNdIhT4ZfjB0q0TBlh63uW51GeMKTG8vHke0sr8ZP
 To0BI96pa/iGms3ti1rkYTWeY5MGJ0c+W6/2to7GNzZT3QqlglOVYvZikX3ybr96BSs4h4is5zu
 W5WKv119P3sPiZIqRNFXIBVbovvPVnkdXFeYguyg/yJzKNE8A2kurvPbtpbHfbLslCBKOAWT1FK
 5cp3KKQBpdYR7
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use printk's fourcc formatting instead of a custom one.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
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


