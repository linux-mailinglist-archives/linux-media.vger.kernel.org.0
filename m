Return-Path: <linux-media+bounces-67384-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CmMvAPpBU2pjZQMAu9opvQ
	(envelope-from <linux-media+bounces-67384-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 09:27:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F37440F1
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 09:27:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WsoKncjq;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67384-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67384-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF1953018099
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 07:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25414372686;
	Sun, 12 Jul 2026 07:27:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3337186A
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 07:27:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783841262; cv=none; b=Jmh28G3O/MwH9MbdsKAmXTSLGi06DqLm+L0q5kaJczZu4/vYhW5144mRUe+xPQLPwS5L1PN9lRCCrYcGFH2CeoNAaxDLuFbM0zzxFjkmeX/UZ+KIvJjRCM7sghpncz9PvMWGzvS3rZitBzlNsN6e7LcsZ9RRN2sQbzwCGjnaq7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783841262; c=relaxed/simple;
	bh=KZ325htG7D3du2KvYDZqQU+T4fC8IBmIXkRpfE0DI38=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P4FNrWlL5mWnBOxa/m6i9GKQUysIDYR7+0di//GkAqEahYVyU+VhtFRNBjTzNrL9j5ZFMWIvBfTxxivGoOt5Gqs4FdQkqQWN+SD/9G1vSHYvvYbbyHWcV+ANZLaoK0DR3CdubuMSehlRLewWrwO7N3shvItDslieWS3UgX7HYF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsoKncjq; arc=none smtp.client-ip=209.85.210.174
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84a2c90e383so173384b3a.0
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783841261; x=1784446061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhgW2AIxRAsyir1bZV0tkAOlDMwlxqZpeTuaF9TQERo=;
        b=WsoKncjqLY28G1jxH0+C8N8TGEpisfPIp2CaK/TeJysMCDHKyrWsW6GFvJIOlfQKmi
         Fr9Qk0y9/YxFOfOd3jqIDUppzknwo+oGkPt/XXD+/STLwxNWknptkp3lU2BfX/yraOXc
         vVmYi3C4bKrBANdP0AHtoERoQIm0lqQTh68zYU7v8ds7N8lek5iHv9vsXOW7VURg5cdt
         gmQBe0tsLT8KSpFVW572ARESqRVyMpFAm4m6GZ5cExo1bLk7693e2uwXsLHfvlLQEJay
         cx2wZ/Lp9Pvx4Nd2klSr1ORPH9n24rwQgZUerZVGJzlTcRD2BbcdpDy3g95BfURv6Sel
         ISUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783841261; x=1784446061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhgW2AIxRAsyir1bZV0tkAOlDMwlxqZpeTuaF9TQERo=;
        b=bYCzGZUobahEbq+/ZvntpSx4UUA+WvGwCTmSx8zbNPFEbtXJwMT/+RARfyry/AbVPR
         pLVmVH5ZWZN9H85rnw+B3yFK5dhPL2iDQgqpD4tQ4HwWuakyDOdC1Rs3bTbDcFrtPZY+
         bzV3rlChZCF4nWyFSoC13OT7wt06//Q7ZstVRAE8a8nnHGm2ILiSUIhONU8K5DXG+O3V
         qYm7paVMgLGqBcaqLZXxX6ID0x++gTzQ+zzED9gfNooH7rDqK3qCwihRD1nz/cIIqvpK
         tMmkXQ9nn97qdUIlYkuKrLAp/R8DcJ0QajneZ8Txy7sNYqi7CxOokEzBNVXAoabaC/gY
         aTCg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6X1JkdLJ10IaDY4fqIXAHedwlCTCz4L4plpaKN3TBDkN8on0QrVHVFVsdcDScL17YKGs9vMEmgPnRNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiNm21O9lG0hLSiI39yIIxR4Ebp8BkPOINfhki/7iWOmvBWkq1
	WB3YqBOdZ++RUdElFnKQjaWYpkl0gao5bddChGWtkVcSMKDC3NyR4scn
X-Gm-Gg: AfdE7cnZg/H9w94JXKe2glvkBDgaaSOhkB7CAzpS016/daF2wVC3RLg5cJV39L+w/j+
	Mj7WiuL2lmeQhIhoL0EuHbIySzeTJABdonaBEFBFI3Vesd4OTnGf6pfkENBwmSss8wsZchTvXP4
	tjEZEtRTeNKBih7HKby3eY0E/jrvyk6XTobHscgsPdkMhqAFoPWvOV+id1N6hzTKGzYFDYNKlFT
	M2ZwpzW8DkGzAW4Dpr4jmtfdiCnsOf0ZxvcakG9vmKGmT8hfARR35UM+0BcpHRQNMmSxF6nva9C
	H67VviMs8rPhblTWX7bUn4ytDhb7P7lSqqCtmKOSgDTP3tShnul+H52A0FmjcPpwPNs+Pyc4TbD
	6WkkmPfKSAw4aFGAtwz30wDbOkCobVvWrILyuXlW5xwJgoLgrVSJwcr466NduCfs9fquRlTAKX/
	NmVhfR4xQj1Gobap2r8mOcgw9kNHUL0Rk461qvBw==
X-Received: by 2002:a05:6a00:1d09:b0:848:2f58:e1ec with SMTP id d2e1a72fcca58-84870798902mr7166904b3a.39.1783841260602;
        Sun, 12 Jul 2026 00:27:40 -0700 (PDT)
Received: from kurosuda.i.sslab.ics.keio.ac.jp ([131.113.100.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162d3csm6904706a12.18.2026.07.12.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 00:27:39 -0700 (PDT)
From: Hiroki Nakajima <3na7nanana@gmail.com>
To: detlev.casanova@collabora.com,
	ezequiel@vanguardiasur.com.ar
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiroki Nakajima <3na7nanana@gmail.com>
Subject: [PATCH] media: rkvdec: use DIV_ROUND_UP() for CTB counts
Date: Sun, 12 Jul 2026 16:26:52 +0900
Message-Id: <20260712072652.2881919-1-3na7nanana@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,sntech.de,vger.kernel.org,lists.infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67384-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:3na7nanana@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[3na7nanana@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[3na7nanana@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 456F37440F1

Use DIV_ROUND_UP() when computing HEVC coding tree block counts
instead of open-coding the same rounding expression. This keeps the
rounding intent explicit without changing behavior.

Found using a Coccinelle rule generated from the DIV_ROUND_UP() macro
definition.

Signed-off-by: Hiroki Nakajima <3na7nanana@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c      | 4 ++--
 .../media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c  | 8 ++++----
 .../media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c  | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index 87abf93dfd5e..ff3942f91c5d 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -258,9 +258,9 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 		for (i = 0; i <= pps->num_tile_rows_minus1; i++)
 			WRITE_PPS(pps->row_height_minus1[i], ROW_HEIGHT(i));
 	} else {
-		WRITE_PPS(((sps->pic_width_in_luma_samples + ctb_size_y - 1) / ctb_size_y) - 1,
+		WRITE_PPS(DIV_ROUND_UP(sps->pic_width_in_luma_samples, ctb_size_y) - 1,
 			  COLUMN_WIDTH(0));
-		WRITE_PPS(((sps->pic_height_in_luma_samples + ctb_size_y - 1) / ctb_size_y) - 1,
+		WRITE_PPS(DIV_ROUND_UP(sps->pic_height_in_luma_samples, ctb_size_y) - 1,
 			  ROW_HEIGHT(0));
 	}
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index fe6414a17551..d07c74679552 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -261,8 +261,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	memset(row_height, 0, sizeof(row_height));
 
 	max_cu_width = 1 << (sps->log2_diff_max_min_luma_coding_block_size + log2_min_cb_size);
-	pic_in_cts_width = (width + max_cu_width - 1) / max_cu_width;
-	pic_in_cts_height = (height + max_cu_width - 1) / max_cu_width;
+	pic_in_cts_width = DIV_ROUND_UP(width, max_cu_width);
+	pic_in_cts_height = DIV_ROUND_UP(height, max_cu_width);
 
 	if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) {
 		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
@@ -275,8 +275,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 						  column_width, row_height);
 		}
 	} else {
-		column_width[0] = (width + max_cu_width - 1) / max_cu_width;
-		row_height[0] = (height + max_cu_width - 1) / max_cu_width;
+		column_width[0] = DIV_ROUND_UP(width, max_cu_width);
+		row_height[0] = DIV_ROUND_UP(height, max_cu_width);
 	}
 
 	for (i = 0; i < 20; i++) {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 3575338a531a..3462d995d4cf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -287,8 +287,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	memset(row_height, 0, sizeof(row_height));
 
 	max_cu_width = 1 << (sps->log2_diff_max_min_luma_coding_block_size + log2_min_cb_size);
-	pic_in_cts_width = (width + max_cu_width - 1) / max_cu_width;
-	pic_in_cts_height = (height + max_cu_width - 1) / max_cu_width;
+	pic_in_cts_width = DIV_ROUND_UP(width, max_cu_width);
+	pic_in_cts_height = DIV_ROUND_UP(height, max_cu_width);
 
 	if (tiles_enabled) {
 		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
@@ -301,8 +301,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 						  column_width, row_height);
 		}
 	} else {
-		column_width[0] = (width + max_cu_width - 1) / max_cu_width;
-		row_height[0] = (height + max_cu_width - 1) / max_cu_width;
+		column_width[0] = DIV_ROUND_UP(width, max_cu_width);
+		row_height[0] = DIV_ROUND_UP(height, max_cu_width);
 	}
 
 	for (i = 0; i < 20; i++)
-- 
2.34.1


