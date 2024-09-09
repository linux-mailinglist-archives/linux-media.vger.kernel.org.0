Return-Path: <linux-media+bounces-18025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D097228F
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 21:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EC6A1C21AC9
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 19:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB36818A6A6;
	Mon,  9 Sep 2024 19:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="NyPNIiIq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [207.246.76.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B838118A952
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.246.76.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725909966; cv=none; b=nnhnFghhAxYPHr4aJsagT/worwhlkAPUVwiA3qJKyjyxSsMHsrmqPnSYGnDVaIb5ian/NdgJ4DZLtCIfoo9n5MC8nWbQNZaa3xyQpVr9hv0dwP2ZkbetE5JHr1YYJbtUFGIItfGknYcdAAP0wg6r7XL3iEwuMnMLWxTWAbhecos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725909966; c=relaxed/simple;
	bh=40PWtHkm3lAWdPBxRclI58MPctQBA2CPhNT5ad9EirM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HiKIgGITM/bX473ALja+DuQg8YM6e2b6EC+x1KGChAJVewGRlj3sVqu3fJKeEq1j0LhwwwzkHLygdbUw/greU96aN9L64TntIJBVDijmv0Fyvyr4Wr/dtjTuvd8ZEy1rMdN/Izj1Xl5u7Y0oSMAQ1u9wQO8miuXSKJSf/n8MDqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=NyPNIiIq; arc=none smtp.client-ip=207.246.76.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725909950; bh=we3j17WQIW7n2HdjKlgLrR+OGSw0elTbOxzJrkOsglI=;
 b=NyPNIiIqKo98ZIwa2jwc5Yn4JC1uMXoBZkdNsQ/GoAS3lPEiGu93+YR4Km8USzY8NibHutwjD
 wJiSzER+jnGdfctixSu+wXJbyDzPqQlXflVx5+mtAyp9YsR+90h4Nsz3veTYmBWEtxasClKg8t1
 bMiTsr4qPigILOQfky+qtGsWaX6NdvkriAz2bjbipA4cwUApG0pqKPqVZNRN+U0knDZpbQhBHvD
 dFZWtbftnuUOrx2epZ+sptno7DPqnNCTBCBiipXIT4IwwWauKreGgffYFFYcj5NFOKpVODPvKYY
 Ob5pM6Fpkb2i0AlrnLYh3FGNEDkENf2oKdHMrZoJBqqA==
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
Subject: [PATCH v6 03/11] media: rkvdec: h264: Use bytesperline and buffer height as virstride
Date: Mon,  9 Sep 2024 19:25:01 +0000
Message-ID: <20240909192522.1076704-4-jonas@kwiboo.se>
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
X-ForwardEmail-ID: 66df4bbcc680cb8b7d2dc1ad

Use bytesperline and buffer height to calculate the strides configured.

This does not really change anything other than ensuring the
bytesperline that is signaled to userspace matches what is configured
in HW.

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
- Remove unnecessary yuv_virstride +=
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 4fc167b42cf0..7a1e76d423df 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -896,9 +896,9 @@ static void config_registers(struct rkvdec_ctx *ctx,
 	dma_addr_t rlc_addr;
 	dma_addr_t refer_addr;
 	u32 rlc_len;
-	u32 hor_virstride = 0;
-	u32 ver_virstride = 0;
-	u32 y_virstride = 0;
+	u32 hor_virstride;
+	u32 ver_virstride;
+	u32 y_virstride;
 	u32 yuv_virstride = 0;
 	u32 offset;
 	dma_addr_t dst_addr;
@@ -909,16 +909,16 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 	f = &ctx->decoded_fmt;
 	dst_fmt = &f->fmt.pix_mp;
-	hor_virstride = (sps->bit_depth_luma_minus8 + 8) * dst_fmt->width / 8;
-	ver_virstride = round_up(dst_fmt->height, 16);
+	hor_virstride = dst_fmt->plane_fmt[0].bytesperline;
+	ver_virstride = dst_fmt->height;
 	y_virstride = hor_virstride * ver_virstride;
 
 	if (sps->chroma_format_idc == 0)
 		yuv_virstride = y_virstride;
 	else if (sps->chroma_format_idc == 1)
-		yuv_virstride += y_virstride + y_virstride / 2;
+		yuv_virstride = y_virstride + y_virstride / 2;
 	else if (sps->chroma_format_idc == 2)
-		yuv_virstride += 2 * y_virstride;
+		yuv_virstride = 2 * y_virstride;
 
 	reg = RKVDEC_Y_HOR_VIRSTRIDE(hor_virstride / 16) |
 	      RKVDEC_UV_HOR_VIRSTRIDE(hor_virstride / 16) |
-- 
2.46.0


