Return-Path: <linux-media+bounces-64790-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nryvFFeoLmqU1gQAu9opvQ
	(envelope-from <linux-media+bounces-64790-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:10:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B05D2681181
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:10:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bL+UN2JW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64790-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64790-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A705A3012CDA
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 13:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4695B3A59A7;
	Sun, 14 Jun 2026 13:10:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B010E3A6B6F
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:10:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442617; cv=none; b=FMHwNoLRXRerbsWbOmn5UDts58UglYxw+J0F5qQHgQ9epVHhkuxoEmWAOJAKiJL364IZ4eNzTretvk4pbNJojDAfSWKIJDlIVrwbaostZN/Sf8z0RcmukpAbJD2b0ItltJhYp/HuVvFJimk+p6gJyI7JrdgJiovgiCNbkK6qFnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442617; c=relaxed/simple;
	bh=/gK0otEQRDDJgFO4CGbacMlp+ViltBls5m/MIu+Y7hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7pOdY36X2TcRZ6BK3HIkPjGpRxsz5y2LXCnH2kKssX0Onv4Bue3UzTZbdojM3fSgY9ZnS934Rv7ISzdKi42QM+p+PzHS77r7SAjZrXmhHw+AgZB3hSg/QDvlNfRHx6VC9Mhi/7iPpVmVLOxZt0SYs5BMLYdgC8vvRA1KsmoLRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bL+UN2JW; arc=none smtp.client-ip=209.85.222.178
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-91588056619so176173585a.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442614; x=1782047414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVl0d1DZ0/rxF5BIn+S5uaENMoHy7Qrp86HW8O6zq18=;
        b=bL+UN2JWB8IMskHpfTRDJw+aovpyEOXc9Sgje45LUAv6fgtkhKUkBNPs525EYcn9CM
         seMTZa48UOoOKaUtQd+vKDl5SuBh210z8/aCn+Bd2QZa3JvVPjy1yG58V7JOIG83J58b
         kJj/lCXSRXrYLzJEXFFgYMaEFp1SISSUa2b7SXU5gEgjUpUZLUqkO4aKPlkeQtFAha/s
         si+9oTVDICzvnsQ4cM7AeJL1KAHs8/BK57mZaRpeBX4I8nrcCNfqGJBxBVCO8vOciEsk
         JHf0mLUYrs7HtPkjbAnyQbeRcrI8mTov7ExUNxtL30ptwhOiqbphCOPlB+rrLYUtepfo
         Iy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442614; x=1782047414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVl0d1DZ0/rxF5BIn+S5uaENMoHy7Qrp86HW8O6zq18=;
        b=agemfWEbYLrJOSPL7r1ziLulOJOeI65O5nveWfYEkqLRuUK+/kd87oGT4SY1zdEA30
         LqUwi0q5DCBVsM9Y/Z5s8YgtxwwNaSyHT6Ny3MIEiq/fiTFgr+sV1oYvyg7Udp7RbqcY
         DnOyS7pTZDlu0o07dtDJtNCMSBW5ZwIVCiSI+509oUPaTE+z8KF7EA3cjuja8npKL4dX
         YuU6hrXG3p7b64GBE+PXI0+EJyCsqkqHPP4SonV83g6sL3x6J/w1pQ1edHP2DASAXi+h
         bi1Dy5ugh+MDkFHJh1AK8w0juImeh904vXvw4V4DqFO00o3YNdFd48BOK/XwMV+wf2Y+
         UyeQ==
X-Forwarded-Encrypted: i=1; AFNElJ85BB7EV3nUcGd/tWUTQt7+c7zM8y3HpuYhRyV03OjUICUCzbfKXmwk44Y5VbJ3vwoh0Y/z0bExvX7Kpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/2IaU0vw4O1bc+7rmCwEhhVu+GQVU4IeNiCDrtK/YttI9z8IX
	84xHIkPhoV1gFWl0xlwGLfRCf0I33kIQNkseJCBOJk1xmeGvsWiFXg+B
X-Gm-Gg: Acq92OH3uYnKc6RxClVlm5qXVJ0TlxgIfgawnrN/gaeMiQFNUxO7zH5R/WDytCAiO3n
	auGJBIdVwFSz66bzeyl4ozFVeSdCzkSTS89W4F2xh/C/A5logJLmqKHt/KIakCoCOLNnN8i1YJm
	fBSVneQbVgp0O+P3dcVL5emNgoocwHTItuFTwXuhsnILK2XM2X68wn8/BIdkyInijt+n8yGQCyd
	86/LXTTRX7VBdMk1m4twOxX8eZgTfSsIGdWTn10VEF5TbcyFBTktluUj/MFuLph3jc5WI8X8wax
	k3ST0KK6iLl2DDlQt3LwMy9M/a+dzZNifrKrAmu7J3XotDqmfjelKV6BSGrXZ6DnR7CfKzrGEB/
	+frYH9FBILe6YPCB9p/ESwXridDMudTi2kWbkN3ZdYhUK+FiO65xoOHCANJlmHj2NlHr/23zdsI
	RXaSLy6X4YVSGd5BCDe3U83/dpsBs36DEK0d77aVo1zX3MxCuvFz/itTBCw17WLLijh/y6k/wcD
	bOXyHUeKvhd0LOcl6pyjvFmD1U8jkoVKFUZkOgsTrU=
X-Received: by 2002:a05:620a:26a1:b0:915:83fa:b3e0 with SMTP id af79cd13be357-9161bac7727mr1528176685a.5.1781442613683;
        Sun, 14 Jun 2026 06:10:13 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:12 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] media: verisilicon: rockchip: bound VPU981 AV1 tile loop and guard divisor
Date: Sun, 14 Jun 2026 09:10:01 -0400
Message-ID: <20260614131003.2524025-5-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614131003.2524025-1-michael.bommarito@gmail.com>
References: <20260614131003.2524025-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64790-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:sebastian.fricke@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B05D2681181

rockchip_vpu981_av1_dec_set_tile_info() divides context_update_tile_id by
tile_info->tile_cols and writes one descriptor per tile into the tile_info
DMA buffer, sized for AV1_MAX_TILES. tile_cols / tile_rows come straight
from the bitstream; reject a zero column or row count and bound the grid to
AV1_MAX_TILES so the division is safe and the writes stay in the buffer.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
This is a Rockchip RK35xx SoC block not reachable on the x86 KUnit host,
so the driver-side out-of-bounds write is not reproduced here.

 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4e21ad..71d2ef7 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -578,21 +578,32 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
 	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
 	    ctrls->tile_group_entry;
-	int context_update_y =
-	    tile_info->context_update_tile_id / tile_info->tile_cols;
-	int context_update_x =
-	    tile_info->context_update_tile_id % tile_info->tile_cols;
-	int context_update_tile_id =
-	    context_update_x * tile_info->tile_rows + context_update_y;
+	unsigned int tile_cols, tile_rows;
+	int context_update_y, context_update_x, context_update_tile_id;
 	u8 *dst = av1_dec->tile_info.cpu;
 	struct hantro_dev *vpu = ctx->dev;
 	int tile0, tile1;
 
+	/* Guard the divisor and bound the grid to the tile_info buffer. */
+	tile_cols = tile_info->tile_cols;
+	tile_rows = tile_info->tile_rows;
+	if (!tile_cols || !tile_rows)
+		return;
+	if (tile_cols * tile_rows > AV1_MAX_TILES) {
+		tile_cols = min_t(unsigned int, tile_cols, AV1_MAX_TILES);
+		tile_rows = min_t(unsigned int, tile_rows,
+				  AV1_MAX_TILES / tile_cols);
+	}
+
+	context_update_y = tile_info->context_update_tile_id / tile_cols;
+	context_update_x = tile_info->context_update_tile_id % tile_cols;
+	context_update_tile_id = context_update_x * tile_rows + context_update_y;
+
 	memset(dst, 0, av1_dec->tile_info.size);
 
-	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
-		for (tile1 = 0; tile1 < tile_info->tile_rows; tile1++) {
-			int tile_id = tile1 * tile_info->tile_cols + tile0;
+	for (tile0 = 0; tile0 < tile_cols; tile0++) {
+		for (tile1 = 0; tile1 < tile_rows; tile1++) {
+			int tile_id = tile1 * tile_cols + tile0;
 			u32 start, end;
 			u32 y0 =
 			    tile_info->height_in_sbs_minus_1[tile1] + 1;
-- 
2.53.0


