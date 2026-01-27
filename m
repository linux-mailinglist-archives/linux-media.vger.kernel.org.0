Return-Path: <linux-media+bounces-51667-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKgZHgXPeGmNtQEAu9opvQ
	(envelope-from <linux-media+bounces-51667-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:43:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A995E70
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 084B1301C0E3
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 14:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDDE35E552;
	Tue, 27 Jan 2026 14:40:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDE435D61D
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524811; cv=none; b=PuMv0S96zpa3u9a4Fo9UqBjP76qH2Cy2kj3z3rY1Px0abI92j0cnpeXiJFxpVaUKPKIDXEf3eS0RnjqgVpDFIPEIYpSkVxd7xosbIU4qaSGar2RRUJN+cjpVX2IVw3Jqbb/3huFXSiOudncSKYu9jMNCfhuah9RBZUweqMvKops=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524811; c=relaxed/simple;
	bh=icoHQejuB1lcpJEjCkE7OSLt3mDLOGkfFIlSQq0Xr7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdRQXrOCVnEh2vMCwh2ACUaChs4PhZ9it6ezjUpZcZG1l/ZvyqCpdscEXtdtsSW+FV9ScoiUrcq4ovTFnvJzVmNcDUq71rUinAPQsopneV1i3HdNs0ZU+sJ240QCXTr7acGaqZePWIh0be0KUVIadRviZRWFn4ZWWQHCOINMPcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vkkEa-0007YT-3Q; Tue, 27 Jan 2026 15:40:00 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 27 Jan 2026 15:39:11 +0100
Subject: [PATCH v3 02/27] media: v4l2-common: sort RGB formats in
 v4l2_format_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-spu-rga3-v3-2-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
In-Reply-To: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51667-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 981A995E70
X-Rspamd-Action: no action

Sort the RGB formats in v4l2_format_info to match the format definitions
in include/uapi/linux/videodev2.h . Also introduce the same sections to
partition the list of formats and align the format info in each section.

The alignment of the 1 or 2 bytes RGB formats contains an additional
space in preparation of adding the missing formats to the list, as for
V4L2_PIX_FMT_ARGB555X an additional space is necessary.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/v4l2-core/v4l2-common.c | 54 +++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 554c591e11133..49c1ec08e2eb3 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -245,33 +245,39 @@ EXPORT_SYMBOL_GPL(v4l2_s_parm_cap);
 const struct v4l2_format_info *v4l2_format_info(u32 format)
 {
 	static const struct v4l2_format_info formats[] = {
-		/* RGB formats */
-		{ .format = V4L2_PIX_FMT_BGR24,   .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_RGB24,   .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_HSV24,   .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_BGR32,   .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_XBGR32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_BGRX32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_RGB32,   .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_XRGB32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_RGBX32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_HSV32,   .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_ARGB32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_RGBA32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_ABGR32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_BGRA32,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_RGB565,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_RGB565X, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_BGR48_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_BGR48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_RGB48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_ABGR64_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_RGBA1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		/* RGB formats (1 or 2 bytes per pixel) */
+		{ .format = V4L2_PIX_FMT_RGB555,   .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RGB565,   .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RGB565X,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+
+		/* RGB formats (3 or 4 bytes per pixel) */
+		{ .format = V4L2_PIX_FMT_BGR666,      .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_BGR24,       .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RGB24,       .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_BGR32,       .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_ABGR32,      .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_XBGR32,      .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_BGRA32,      .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_BGRX32,      .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RGB32,       .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RGBA32,      .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RGBX32,      .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_ARGB32,      .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_XRGB32,      .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_RGBX1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RGBA1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_ARGB2101010, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
+		/* RGB formats (6 or 8 bytes per pixel) */
+		{ .format = V4L2_PIX_FMT_BGR48_12,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_BGR48,     .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_RGB48,     .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_ABGR64_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+
+		/* HSV formats */
+		{ .format = V4L2_PIX_FMT_HSV24, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_HSV32, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+
 		/* YUV packed formats */
 		{ .format = V4L2_PIX_FMT_YUYV,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_YVYU,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },

-- 
2.52.0


