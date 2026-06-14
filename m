Return-Path: <linux-media+bounces-64801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lncAHK3PLmrU3QQAu9opvQ
	(envelope-from <linux-media+bounces-64801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:58:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0258681751
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:58:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QTDsAoEy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64801-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64801-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 838AE301F9B6
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B9F3C8C69;
	Sun, 14 Jun 2026 15:56:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330723C819B
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 15:56:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781452578; cv=none; b=c4MUMTgdWDIZhFRQg59K+5/qT2tqiFM6LEf24G8YDtLaxBs7ILPGGQpipkurDLk+ZkuALHD9b6zOwuheKeMfkXUvWWyuvf/70AvVuKr349EQL2BNO4Uz69j+U/bACOyF3LKiiW3lnuaYD2Otmo4zifYVDuh0jPs1r27IF43eWCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781452578; c=relaxed/simple;
	bh=D6G0yKR2/rytcvr1WlW/71DhsLr0kJgYyxusnDEFlms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2lLQRT5YM/W/M/PBbEZMkRiurO8ROZN1AnFVui3Kxkyv+JaFDHRec1MRNVAmEOdqXZsM7OOveZ+ERGDIyPcsHCMc+lOhrvzQO43vKav5Hc1wujszYB+uN6p4HKNUINQQ7tOBI2z3mbRLQChHjLxC67QLDh8lbEZH/M6gPjPbzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTDsAoEy; arc=none smtp.client-ip=209.85.219.53
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccf887de87so28862146d6.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452576; x=1782057376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z35bHdhSh8a/Z8G1ETcqSJjtROGT6H3Pl9v+4lJ8nHY=;
        b=QTDsAoEy9IIZBVPiaev/b/AccdJKEDrmbUc4TdDA81kQbctZFTH3RXxuBg8aGqxs53
         24Ra8tnAurET4J0w/5Up7EHRLQaE10iTW2mZYxhU7fPGSHPG1n/FoNEc57tyH8lm/TD8
         r4U1X0qYdRhtCNNmcz4+h9eFOit3S4Gqs6kv8cAj82wf4bJvBQvLEa4hCspvvigqSAXQ
         x5fq25ildO4HptUi1/og5CPZsPCWSVE4tsKwh6EM1fNQepI6nAGQCj7iyn43fbgGQd0T
         6G/j/6E+APu9uTfMfXvRNeWKihJ5Lm1yFCzaW5ymbYxf+RDbxK7es6VJvw6E9bF6eV9x
         85Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452576; x=1782057376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z35bHdhSh8a/Z8G1ETcqSJjtROGT6H3Pl9v+4lJ8nHY=;
        b=Pf5yXLUBlhTMfwiSHQW/IzsNUIjjHzfK/yTvcAiyE8VB+RwRxdUThF0ooN6vtolsdX
         vYIDXXxesx9Yi04vmpLYNFlSJfayZk2HVUq21HVbKAPNBBozZFei5g3wnJp59KJWSAlR
         1bF/ldX/iSMeE2WNTiOVZs0m583hYt8zYVFl1VN0MXRV/HvaPbD0Me+6L/hzX6qpRIRW
         Qbz2AONkEA8+vNw63mkL0+/MecyVnLluX6MabeltmA0oFu9u9nuGbIMpHbeY2EZcmbgn
         SsAy4TTiD9G3ZWCwrb6nZz4IrxYzfKnVNC6yM+HpdpdwAn26k+d8NHlyGU7B4JZHurNq
         HpEg==
X-Forwarded-Encrypted: i=1; AFNElJ86VW5NNwGGk277fCJnrv6NUWid8Ui0f/AHOI9CjU7yhkU5qxkBXFH/riSHMidC/2Q6sR7/mB+1NYb3Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAcQ7HtUiPEb89+oTcIsL5DnJ5LZwTRpiXKXawy0tILIbS5N22
	prOVJRiCjxp5kWAkM2CPN7iZc8udSYCjUN/W04Hn1Kj4rWSYw+BNxf2d
X-Gm-Gg: Acq92OFcec0vh7EjcEE2OI6U0se1Wv7qcPrw2eT4sGzWP7XNZzO3y+i0rBl9HLNs9Q3
	LEKAhwVKqyixaznW4gFslfNEY08NgHXgOswhMIEA4klxnu2E49QksYMO10TDIVyA0vJxxsduKxn
	0agG6kaW7+TgwQDGMNRX2AEtP8iKCcmTq0bjVob86pZ0WghqlV50fxVsskEKzEVPPtGKolNqrCE
	1WebAHojkOw1/gbBISlHFkO2tm4TvBidvVJS4YdLnivHlxDPqEudBGUI0vcV37Zrx3B+9wlR7sP
	jxBQsFqL22zyuliOvyp5umzo6Bzbkq8gJ/gsD2kUg1+xLZTGJHH13BMBDUAEFVXJRLuF5DzR4oM
	2f6XSTVcrK/73jWcIFMDRjHglp7+DjKcz38NbUp6qj2iC29LCBNQI+6dGJ1swJ6zz62ijLiiu81
	VwhZiGJHCObSeMkWiGixYBuSjjCf1tGDj6PO3E5hMZIQFUFaNN2A6z9Hy7wqWUxKr1oiw4vdTSm
	vuLj/sY5GWQ0+hR5Tp6U2QpLibYAVgqbdLJvRnWtgE=
X-Received: by 2002:ad4:596a:0:b0:8cc:e8f4:1630 with SMTP id 6a1803df08f44-8d32e50112cmr179007736d6.30.1781452576150;
        Sun, 14 Jun 2026 08:56:16 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:15 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
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
Subject: [PATCH v2 2/6] media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
Date: Sun, 14 Jun 2026 11:56:04 -0400
Message-ID: <20260614155609.3107600-3-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155609.3107600-1-michael.bommarito@gmail.com>
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64801-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: C0258681751

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
 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 22 +++++++++++++++----
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  8 +++++--
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3119f3bc9f98b..d0f26f736a763 100644
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
index ac8b825d080a2..29b5adb509727 100644
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
index fe6414a175510..6dafa1dd28507 100644
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


