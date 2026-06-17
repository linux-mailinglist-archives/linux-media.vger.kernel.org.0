Return-Path: <linux-media+bounces-65075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xwHKJ1MEMmoWtwUAu9opvQ
	(envelope-from <linux-media+bounces-65075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:20:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AACB69615E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:20:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gHMKiX8G;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65075-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65075-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F697303014E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 02:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2007A3016FC;
	Wed, 17 Jun 2026 02:19:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F10F2FC01B
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:19:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662775; cv=none; b=rJaYu95LYxZUuHl2Oh3fx/i3R4rNegmQq5KzN8Dk9YTPYNcqQVtOFnuFaydaKwSS1Qt79HsmhGQlK5fMP05B2BNoezop5YSj16V9UA9E5jhkkuOeGNW+tOul1OQGV0A2ChyDj2rg3yEU79d7HrDCd5MR3Jt0+dwki7oo5kW9EHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662775; c=relaxed/simple;
	bh=9bH3dpZSriVFTYqMLJWcSw1MVcgMalOkzFQWBFWKCME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOI+sV/65aFWvlVYjGEHpJ++2DlCcyRQgxTya+MjyFuYjbAsYNFo8uXhJ+GsL+JFCaQRkMvlZZyboseMfU9Lj9WiSxhQrER1c6Qx447L/KljRr9yOAfCnRwX8HNzm0mPB5/pk5VeHUubOKyB+yRbRlwjmgq+4MqrFOG+FluyALA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHMKiX8G; arc=none smtp.client-ip=209.85.219.42
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ccf18ef922so75847716d6.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 19:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662773; x=1782267573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gsyD44v5d3JS7lai7ZiO/JkymT3Up+9z8qXjXKcYr8=;
        b=gHMKiX8GRzo+KZaiGBIgIQkDR8Glo8WGLY0FSTBmklPbPuY5fAQVo0LqIpGLkrN/XA
         X0228otUVpwlxI6jRDAd6GnIwhOnoHceFoEaH02pdsFVmATaS6calWbaQ8SQIQPT0Zo+
         pcY7DYmSU3gIqKs0X+lSBYEeoRPik26IE5b85+NT1TJq8RNUyCbQbO4moFBJ6DGs3UuE
         +FiRSdgWo209cFsn0bTSflctVfVF55CrSkf6v+C8mWnzUFf0nsNuEm+kepkMmVoR6jXq
         q0Jh6xDieIqvtvH04QVqbk+9QF6f4IpsVo2bShWp3DnK++WRGHvc/SD3xQENuNDrmDTG
         VRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662773; x=1782267573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6gsyD44v5d3JS7lai7ZiO/JkymT3Up+9z8qXjXKcYr8=;
        b=fzQv6qf4mad+KlMxkTlmUuUKzsk0X149oCtmLg1tp3+XmNAuv18nnfF491uucYBVu1
         iB9M+3CYL4KpvxIxkv5/e9m3WxGh80WwCSVTGCOVK2w4EAI1Mmxv8GgTUgbAsYbtWl4s
         tMHobLT6D9f41ZE7qDsIPRhWlTMj9ylFpmPwfXDKND935PIc5cIoPVJqYfXqofPfNmgi
         WwiWVmFx3HxpOFJRUgh8TfWklmg+SY4lpywBqhL7EiIKY0LjvS/hb9iEGTyUkHGZB2nz
         xPD0BaXSd/3izZpFLHFNcVodNuePuINOl2cs/qreSX52dRjWseUia/UlplSy94ygqFz8
         hz2A==
X-Forwarded-Encrypted: i=1; AFNElJ9K37YC/ywhbI7ZK7Ts3SbnQ3QULTjq6B9bnJ9WO50/cs7F1V9jC9q532xxifNtXgPDz2ShemmnWMDHBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAFuw34/gqSCK++vE3J7P2iY7j5qR7RVTjq3G7RJcTJdl0wM3X
	zH0YB4//cMpozyDOsmgagIvwQPU+aLRcipL344pYgsocb9GTw9VSdFvK
X-Gm-Gg: Acq92OF+aSArflZ3FEBuZhHEvfTMz+gKTN2O9urzOS6wn0feU7eRSuZzt/2fd4YXJik
	36bxyOYeshK/rHFpSfdF+h3f4SqxbxSSnknPXIKdmqVz4fPoT6p3IAgpBEF3hNu0qjBJt2MQIo1
	Vn5HY4/liKME5O06fuDuJIaUDWwnEr8IItsChrjHPetgVbLc9jrtKKi+kZjmncZiXVCcOCGLpZf
	KdPU0lG860Q/v4jFe2iKe1DPBHAdgfIapx8YPnb3OYpAEq0Qf0cXQ4z9MhXCrQNAFXW4B/ZkW1c
	HtaY2I4BqFgKRiXmYr5bXCa22mbGCXM5oLkRgo/JUujFL+DC3qZZcPmeAjc69U97qZCXauGq+y5
	5CPZXt1kXZX/onfvoJanX7akXMqL/HeboMnZcFeFWuY+9vsLyU741O2HEIE+eVhX3HEBoeCAJZA
	5MHtGe6wKWttR9Wytbw0iuhB27ufXTCH2F+0pztY0Q3x217B7HJgYYpIVV4i9xrcUO6Vl8LyB7Q
	HEgSBtIspJorhcvrXxqAqASdZ8jShxb
X-Received: by 2002:a05:620a:19a5:b0:915:c4de:7ab7 with SMTP id af79cd13be357-91d8acdc2eemr405909185a.35.1781662773045;
        Tue, 16 Jun 2026 19:19:33 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:32 -0700 (PDT)
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
Subject: [PATCH v3 4/9] media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
Date: Tue, 16 Jun 2026 22:19:01 -0400
Message-ID: <20260617021906.2746743-5-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65075-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,rock-chips.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AACB69615E

compute_tiles_uniform() and compute_tiles_non_uniform() loop over
num_tile_columns_minus1 + 1 / num_tile_rows_minus1 + 1 entries, and
assemble_hw_pps() writes one COLUMN_WIDTH / ROW_HEIGHT register per tile
and indexes priv_tbl->param_set[] by pic_parameter_set_id, all taken from
the untrusted PPS. Use the bounded v4l2_hevc_pps_num_tile_columns() /
v4l2_hevc_pps_num_tile_rows() helpers for the tile loops, and bail out of
assemble_hw_pps() before indexing priv_tbl->param_set[] with an
out-of-range pic_parameter_set_id, so the writes stay within the hardware
tables.

Fixes: 3595375c2301 ("media: rkvdec: Add HEVC backend")
Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  | 14 ++++++++++----
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  7 +++++--
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  2 ++
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3119f3bc9f98b..753aef3aee51e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/v4l2-common.h>
+#include <media/v4l2-hevc.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "rkvdec.h"
@@ -37,15 +38,17 @@ void compute_tiles_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
 			   s32 pic_in_cts_height, u16 *column_width, u16 *row_height)
 {
 	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	unsigned int num_cols = v4l2_hevc_pps_num_tile_columns(pps);
+	unsigned int num_rows = v4l2_hevc_pps_num_tile_rows(pps);
 	int i;
 
-	for (i = 0; i < pps->num_tile_columns_minus1 + 1; i++)
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
@@ -57,17 +60,20 @@ void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size
 			       s32 pic_in_cts_height, u16 *column_width, u16 *row_height)
 {
 	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	unsigned int num_cols = v4l2_hevc_pps_num_tile_columns(pps);
+	unsigned int num_rows = v4l2_hevc_pps_num_tile_rows(pps);
 	s32 sum = 0;
 	int i;
 
-	for (i = 0; i < pps->num_tile_columns_minus1; i++) {
+	/* The last tile entry is written after the loop, so iterate one less. */
+	for (i = 0; i < num_cols - 1; i++) {
 		column_width[i] = pps->column_width_minus1[i] + 1;
 		sum += column_width[i];
 	}
 	column_width[i] = pic_in_cts_width - sum;
 
 	sum = 0;
-	for (i = 0; i < pps->num_tile_rows_minus1; i++) {
+	for (i = 0; i < num_rows - 1; i++) {
 		row_height[i] = pps->row_height_minus1[i] + 1;
 		sum += row_height[i];
 	}
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index ac8b825d080a2..568746dae9a61 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -12,6 +12,7 @@
  *	Jeffy Chen <jeffy.chen@rock-chips.com>
  */
 
+#include <media/v4l2-hevc.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "rkvdec.h"
@@ -156,6 +157,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	 * packet unit). so the driver copy SPS/PPS information to the exact PPS
 	 * packet unit for HW accessing.
 	 */
+	if (pps->pic_parameter_set_id >= ARRAY_SIZE(priv_tbl->param_set))
+		return;
 	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
 	memset(hw_ps, 0, sizeof(*hw_ps));
 
@@ -274,9 +277,9 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 
 	if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) {
 		/* Userspace also provide column width and row height for uniform spacing */
-		for (i = 0; i <= pps->num_tile_columns_minus1; i++)
+		for (i = 0; i < v4l2_hevc_pps_num_tile_columns(pps); i++)
 			WRITE_PPS(pps->column_width_minus1[i], COLUMN_WIDTH(i));
-		for (i = 0; i <= pps->num_tile_rows_minus1; i++)
+		for (i = 0; i < v4l2_hevc_pps_num_tile_rows(pps); i++)
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


