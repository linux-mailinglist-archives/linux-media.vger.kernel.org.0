Return-Path: <linux-media+bounces-23233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C00BF9EDC67
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 01:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 120291889873
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 00:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CF279FE;
	Thu, 12 Dec 2024 00:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1RB0iDZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122FD2594AF;
	Thu, 12 Dec 2024 00:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733962765; cv=none; b=VR7klZzge0JGtbwj/A0VrNczi1fTuAAlPiwH4FWxcpxCxnQhMti1728Kfq2xmUoCfjBpisNyeAdqTHe126+iihf7nqL3rF6+wsFpIWDA5yGQRTUaH99XKai5Dm/NPgubLNGWBqE/kyn6C5EshzLCCgYGlfGHgFV+CKhN+wY4q40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733962765; c=relaxed/simple;
	bh=2BjK7sTMogm7uyjtjoOaPa8oXC0k42R+bEB1rCldpN4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gYYJ6ddGJPUDx7R3zcLtRTg5Wgp3M6T8bTq10yk3sXDjH54YFjWK4+ydLpd3rl1H9nurslmTlXPjknomjpFQNuHnN7hMoMSFyefWzevu05NfI0m7XtrOk3cbIxbCWXOteAEQZKPvoM6uHWZ9PtFjd/tPNiYVr+Z/EOP/sPpiYeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1RB0iDZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD65C4CED2;
	Thu, 12 Dec 2024 00:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733962764;
	bh=2BjK7sTMogm7uyjtjoOaPa8oXC0k42R+bEB1rCldpN4=;
	h=From:To:Cc:Subject:Date:From;
	b=Z1RB0iDZYQuyJP67g0uDT1D/JBF1/82IZ6xE2Vap1+rzDkQPNqawERYId1+0YUnk1
	 +PSG8uImWBY0qZ9xGXgBPytcTTM+aOF2QgJjs2Rc4yMcYRdTm3m/9OyuQUAkLLk1gr
	 l5YC7R5yho33fyUwiESlbzse2GQ5YVIgyzomWtHM1Q2N9RPX+zN0wBCc2zthgYAJ8b
	 QITLD7oXSu32cQdNttwe8K/GlILYyuf1eoncMnJmw0zW44qUjZlFeM4CDag2i09UV4
	 z0xYquU6lHl6fBKKQcBw1lOBFRa5fyqBpdKKzvxgYHaoSoUCM1V5NFeDTssl/aZk5z
	 oz1xere4XjvhA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jens Ziller <zillerbaer@gmx.de>,
	Shuijing Li <shuijing.li@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
Date: Thu, 12 Dec 2024 00:19:08 +0000
Message-Id: <20241212001908.6056-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 417d8c47271d5cf1a705e997065873b2a9a36fd4.

With this patch the panel in the Tentacruel ASUS Chromebook CM14
(CM1402F) flickers. There are 1 or 2 times per second a black panel.
Stable Kernel 6.11.5 and mainline 6.12-rc4 works only when reverse
this patch.

Reported-by: Jens Ziller <zillerbaer@gmx.de>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 31 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 33ceeb8d6925..3907863579b9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -246,23 +246,22 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 	u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, HZ_PER_MHZ);
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 
-	timing->lpx = (80 * data_rate_mhz / (8 * 1000)) + 1;
-	timing->da_hs_prepare = (59 * data_rate_mhz + 4 * 1000) / 8000 + 1;
-	timing->da_hs_zero = (163 * data_rate_mhz + 11 * 1000) / 8000 + 1 -
+	timing->lpx = (60 * data_rate_mhz / (8 * 1000)) + 1;
+	timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
+	timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
 			     timing->da_hs_prepare;
-	timing->da_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
-
-	timing->ta_go = 4 * timing->lpx;
-	timing->ta_sure = 3 * timing->lpx / 2;
-	timing->ta_get = 5 * timing->lpx;
-	timing->da_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
-
-	timing->clk_hs_prepare = (57 * data_rate_mhz / (8 * 1000)) + 1;
-	timing->clk_hs_post = (65 * data_rate_mhz + 53 * 1000) / 8000 + 1;
-	timing->clk_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
-	timing->clk_hs_zero = (330 * data_rate_mhz / (8 * 1000)) + 1 -
-			      timing->clk_hs_prepare;
-	timing->clk_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
+	timing->da_hs_trail = timing->da_hs_prepare + 1;
+
+	timing->ta_go = 4 * timing->lpx - 2;
+	timing->ta_sure = timing->lpx + 2;
+	timing->ta_get = 4 * timing->lpx;
+	timing->da_hs_exit = 2 * timing->lpx + 1;
+
+	timing->clk_hs_prepare = 70 * data_rate_mhz / (8 * 1000);
+	timing->clk_hs_post = timing->clk_hs_prepare + 8;
+	timing->clk_hs_trail = timing->clk_hs_prepare;
+	timing->clk_hs_zero = timing->clk_hs_trail * 4;
+	timing->clk_hs_exit = 2 * timing->clk_hs_trail;
 
 	timcon0 = FIELD_PREP(LPX, timing->lpx) |
 		  FIELD_PREP(HS_PREP, timing->da_hs_prepare) |
-- 
2.34.1


