Return-Path: <linux-media+bounces-64788-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J1c7JMyoLmqp1gQAu9opvQ
	(envelope-from <linux-media+bounces-64788-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:12:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5816811B3
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:12:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=okXsZc+r;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64788-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64788-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6154301DCC9
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 13:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AA139DBFC;
	Sun, 14 Jun 2026 13:10:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08173A6B6C
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:10:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442613; cv=none; b=Kua1rguGEpsQWoOvlJJjsOV82fXMCNhy3l2cj/0vx2hsVpcBg3Ta+dRgbCxmYG7TQHxE/uXKnzPeLyHo12cGwqg9ipU45DSJBryIY6D0MwjY2tktKYtaHFuSb/V5Q+zogKDXQ3d0g5cBTkOV7I5hi7+CbP0w4ImFS71Ne3vjtUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442613; c=relaxed/simple;
	bh=Ybj0KYCzf4OIpSMi75CotvcIb1E81nyGc8zxOXwWSi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXNO0dv1Kn5tqLVvK3W/eRa6Bn4WLRa2ES9x7crmdJ7E4wD//2l9RItDfOSBj6r/Y/VSs+tD2jxj6l2pU6xfd8J4W26gxtSfngh5JK/V+4RzMN5QXYFYh7xTJKlgQ8SdeP7Yao1hKEuwSEBjDYo4gfXx0+zb4hKR6M4tL4gJXPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okXsZc+r; arc=none smtp.client-ip=209.85.222.176
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-915bf8800a2so266063485a.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442610; x=1782047410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viox6pD1QfsYaMbYifCSfXJ+WEadIZxjJ3+HuLOIzqg=;
        b=okXsZc+rWYU7ZAx6Gi3PHqpOUOG4ZgoJHHd0WqSnkZFgSzDcO9AeQ8Yw29hUtnHKPf
         EMmih9TrIGZGZvvHWH939uekYMiDih3M33XM37r8ACJKuk0jH6QTt7eMQsLIVt5daOB/
         YgYGe6jpWwASGCDIRlSbtcmO7409hGhPbt1WZJwVmDUDhHMhIEJ37tUSr0H9Cp3TMSYd
         pFqE4D3zBZIHKTWMJa6C9p+icm//Knd3qELiW4Qj73fWY2AO/6R52xOCwF197SE0gedp
         xkaqdbXOx8HxX5xkB0iEbQBXPDN6GSg9eyFCO4QY7CCOCqhtEMV/ZFQ9VuLtjt5nkVFA
         RpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442610; x=1782047410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=viox6pD1QfsYaMbYifCSfXJ+WEadIZxjJ3+HuLOIzqg=;
        b=i0o0xkgEIRf/RLLVf1TCu2ZtlRgdEP5CGl/EfoUa5mJRk5p7kK5icGT13hq1nPfrSu
         h5O8orMc3heMWYKR4TYqHbFzOlF6tsOiCftCYn1bJNSc9cFE6UL2PoHhecVSUUMPejpW
         Uv+hL0LOOzINq/2oBUKYBeyijEduGTNRZIK/Fhogkrjpy0+KiWNNAku3duCKPvaz8Bky
         KsBa0DM2Dog6hJSnCLkYEFqbo+rF8n/t49fS6oKJPoiOeIvZM3SK3wiYzQD4NG4n55do
         8QNzmkk5jd0gY2gtlEoIvFt9F9LqFOyIgXWPIMF+lhiyD8vs15tm2Nj2DNc3ajWT//is
         riXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VzqSU5X20FmxBB6xrUW1bfELjcHOre1PsOBWC4lC+/dsa3eWAz8vkL585la51X0wE/qAhH5x0AX8DSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt4FZUQLSIkW2HN61rfnhxINvsUVLgCPthTB7a0sEwsscedJ40
	kUBHq9HXHhAmBxOPsSObLFr1MwqFMCyzkg9q00pY/TgFUP45wKnJ7qsK
X-Gm-Gg: Acq92OFsGsIi+mL8DMFr0/M/YhzhDGmQQ70DQY/+T4lHwoV30mnPSAKmnuJALeyGV0g
	ehZROcXeHIGzv1fP1PPGmuWqpDn2MsQ/RmfbiLwBei2xDoBxUVwytP91733nOQJuLhoPWweDQ9Y
	wXCcCqpDwLWHMhlUDlmw0CKHBhSAiLRDm9X4fbugtL0JjGn6a5Xx0H9OjEywshjbuE/JOoMTGEU
	VaAkOdVhAWpbCYx++JDs0xQjPFZm2tOahLiztAkscLd8jSsvHV3lWpe9J7JcEJ3/gWnVe3zum1S
	u6H8Q7ubZcuh6fnT5DjMH+xaNSd6qS/P3bN0zHqzdqGU7mxdW+YIzusAtLO/CofCSF2MRqmTatl
	jhIzLIZNIFz1QPcs7SLSgryhV1Y1sM5HP21IxJQVqir8hcJsDJMW2Iej5ZeV3YHiutYgAMoZrFT
	lZtSKm44EXe7sI+xgi3e/eQ1/va+11HvaUWCMZPX0dfph+UpGdHP/Fj5QN2drhMdZnj9WPxsOHv
	v21YkDI4Bvj1oqxPYJ7kYqaxwAWX+51e7OHRoAGbus=
X-Received: by 2002:a05:620a:bc8:b0:915:a73e:3544 with SMTP id af79cd13be357-917f1c56720mr1256745485a.56.1781442610430;
        Sun, 14 Jun 2026 06:10:10 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:09 -0700 (PDT)
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
Subject: [PATCH 2/6] media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
Date: Sun, 14 Jun 2026 09:09:59 -0400
Message-ID: <20260614131003.2524025-3-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64788-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:sebastian.fricke@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD5816811B3

compute_tiles_uniform() / compute_tiles_non_uniform() and assemble_hw_pps()
loop over num_tile_columns_minus1 / num_tile_rows_minus1 to write the
per-tile column_width[] / row_height[] arrays, sized to the PPS uAPI arrays
column_width_minus1[20] / row_height_minus1[22]; bound the loops to that
capacity. assemble_hw_pps() also indexes the fixed param_set[] table by
pic_parameter_set_id, a driver-interpreted index the core does not reject;
bound it to the table size before the access.

Fixes: 3595375c2301 ("media: rkvdec: Add HEVC backend")
Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
The decoder is an ARM SoC block (Rockchip RK33xx/RK35xx) not reachable on
the x86 KUnit host, so the driver-side out-of-bounds write is not
reproduced here.

 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 22 +++++++++++++++----
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  8 +++++--
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3119f3b..d0f26f7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -37,15 +37,22 @@ void compute_tiles_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
 			   s32 pic_in_cts_height, u16 *column_width, u16 *row_height)
 {
 	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	unsigned int num_cols, num_rows;
 	int i;
 
-	for (i = 0; i < pps->num_tile_columns_minus1 + 1; i++)
+	/* Bound the loops to the column_width[]/row_height[] capacity. */
+	num_cols = min_t(unsigned int, pps->num_tile_columns_minus1 + 1,
+			 ARRAY_SIZE(pps->column_width_minus1));
+	num_rows = min_t(unsigned int, pps->num_tile_rows_minus1 + 1,
+			 ARRAY_SIZE(pps->row_height_minus1));
+
+	for (i = 0; i < num_cols; i++)
 		column_width[i] = ((i + 1) * pic_in_cts_width) /
 				  (pps->num_tile_columns_minus1 + 1) -
 				  (i * pic_in_cts_width) /
 				  (pps->num_tile_columns_minus1 + 1);
 
-	for (i = 0; i < pps->num_tile_rows_minus1 + 1; i++)
+	for (i = 0; i < num_rows; i++)
 		row_height[i] = ((i + 1) * pic_in_cts_height) /
 				(pps->num_tile_rows_minus1 + 1) -
 				(i * pic_in_cts_height) /
@@ -57,17 +64,24 @@ void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size
 			       s32 pic_in_cts_height, u16 *column_width, u16 *row_height)
 {
 	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	unsigned int num_cols, num_rows;
 	s32 sum = 0;
 	int i;
 
-	for (i = 0; i < pps->num_tile_columns_minus1; i++) {
+	/* Leave one slot for the trailing last-tile entry written below. */
+	num_cols = min_t(unsigned int, pps->num_tile_columns_minus1,
+			 ARRAY_SIZE(pps->column_width_minus1) - 1);
+	num_rows = min_t(unsigned int, pps->num_tile_rows_minus1,
+			 ARRAY_SIZE(pps->row_height_minus1) - 1);
+
+	for (i = 0; i < num_cols; i++) {
 		column_width[i] = pps->column_width_minus1[i] + 1;
 		sum += column_width[i];
 	}
 	column_width[i] = pic_in_cts_width - sum;
 
 	sum = 0;
-	for (i = 0; i < pps->num_tile_rows_minus1; i++) {
+	for (i = 0; i < num_rows; i++) {
 		row_height[i] = pps->row_height_minus1[i] + 1;
 		sum += row_height[i];
 	}
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index ac8b825..29b5adb 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -156,6 +156,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	 * packet unit). so the driver copy SPS/PPS information to the exact PPS
 	 * packet unit for HW accessing.
 	 */
+	if (pps->pic_parameter_set_id >= ARRAY_SIZE(priv_tbl->param_set))
+		return;
 	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
 	memset(hw_ps, 0, sizeof(*hw_ps));
 
@@ -274,9 +276,11 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 
 	if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) {
 		/* Userspace also provide column width and row height for uniform spacing */
-		for (i = 0; i <= pps->num_tile_columns_minus1; i++)
+		for (i = 0; i <= pps->num_tile_columns_minus1 &&
+		     i < ARRAY_SIZE(pps->column_width_minus1); i++)
 			WRITE_PPS(pps->column_width_minus1[i], COLUMN_WIDTH(i));
-		for (i = 0; i <= pps->num_tile_rows_minus1; i++)
+		for (i = 0; i <= pps->num_tile_rows_minus1 &&
+		     i < ARRAY_SIZE(pps->row_height_minus1); i++)
 			WRITE_PPS(pps->row_height_minus1[i], ROW_HEIGHT(i));
 	} else {
 		WRITE_PPS(((sps->pic_width_in_luma_samples + ctb_size_y - 1) / ctb_size_y) - 1,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index fe6414a..6dafa1d 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -145,6 +145,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	 * packet unit). so the driver copy SPS/PPS information to the exact PPS
 	 * packet unit for HW accessing.
 	 */
+	if (pps->pic_parameter_set_id >= ARRAY_SIZE(priv_tbl->param_set))
+		return;
 	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
 	memset(hw_ps, 0, sizeof(*hw_ps));
 
-- 
2.53.0


