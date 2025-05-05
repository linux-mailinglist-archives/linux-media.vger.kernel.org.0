Return-Path: <linux-media+bounces-31754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84786AAA4D9
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4221C1B60B61
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE55305739;
	Mon,  5 May 2025 22:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7UipZfJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AEC305721;
	Mon,  5 May 2025 22:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484067; cv=none; b=uIJr8ReHensZzLZHb6cWUqjqHXEQSUUa/9+iDh3E0EsOJL+tjppPOUAvYt4GdI/8Xx2v19PIXlsDJb8Nh+Rnlx1Z0pHyEfulvFuYgC4etDC7/3z0DH7LS0lzh8rq6fURY0Glyy4eCOWBDcOOL+nDPLfhUehUGFO4UNhF8LGtVoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484067; c=relaxed/simple;
	bh=zSBuTCuV1sHVK1bFrmXNGcxIF6YPGZrSRYI/WDnvt08=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f93avLm3y+jiyCehyavOK+xZGVs9ZB/KUCtiaDM2JgrcUzyZP7wdgcuHq8dLMIP8stXRB9F1I/acdQtWMwR/Y50c3SNSnqgWKD7450yoVFJMjuGWL7IlkbCs7zQU4d67WNjQuh7NSRcQFSXCjH9UYpK/+3XbCle58uE1DYKXlRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7UipZfJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0884C4CEE4;
	Mon,  5 May 2025 22:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484067;
	bh=zSBuTCuV1sHVK1bFrmXNGcxIF6YPGZrSRYI/WDnvt08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k7UipZfJ2puBLD6f1OdzSyAaO8gWgIYAD+YS+s7ClYGAefKbJzgpnylj5R2CczR0M
	 L5i7Kc44zOAm7Z7IYez7pb/WwmbSl0glLQ9OCG+Vkcq41ZR2kxfRAVEJ2cF35ta2H9
	 6hEwt11/K/1lI7fEjWkLQZ0gWD0gyrj1OMWGNBiXG/tASv3mAbg5uj3ER6KqOxBAWV
	 fLq8VGtDyORfc7pHhZFfettbGC+YuwM8BtYF9fWxt/ZyJGHpTSexa/aD/sNMeN7PlG
	 0bKF94fNTCoN5VMnhRXBXzdlPBiJYfwtTVXztmQU9sp7CxZX5/qCGBBho40KHzUyfh
	 Jb21LJzciTJJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Matthias Fend <matthias.fend@emfend.at>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	naush@raspberrypi.com,
	ribalda@chromium.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 334/642] media: tc358746: improve calculation of the D-PHY timing registers
Date: Mon,  5 May 2025 18:09:10 -0400
Message-Id: <20250505221419.2672473-334-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Matthias Fend <matthias.fend@emfend.at>

[ Upstream commit 78d7265e2e1ce349e7f3c6a085f2b66d7b73f4ca ]

When calculating D-PHY registers, using data rates that are not multiples
of 16 can lead to precision loss in division operations. This can result in
register values that produce timing violations against the MIPI standard.

An example:
cfg->hs_clk_rate = 294MHz
hf_clk = 18

If the desired value in cfg->init is 100us, which is the minimum allowed
value, then the LINEINITCNT register is calculated as 1799. But since the
actual clock is 18.375MHz instead of 18MHz, this setting results in a time
that is shorter than 100us and thus violates the standard. The correct
value for LINEINITCNT would be 1837.

Improve the precision of calculations by using Hz instead of MHz as unit.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/tc358746.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 389582420ba78..048a1a381b333 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -460,24 +460,20 @@ static int tc358746_apply_misc_config(struct tc358746 *tc358746)
 	return err;
 }
 
-/* Use MHz as base so the div needs no u64 */
-static u32 tc358746_cfg_to_cnt(unsigned int cfg_val,
-			       unsigned int clk_mhz,
-			       unsigned int time_base)
+static u32 tc358746_cfg_to_cnt(unsigned long cfg_val, unsigned long clk_hz,
+			       unsigned long long time_base)
 {
-	return DIV_ROUND_UP(cfg_val * clk_mhz, time_base);
+	return div64_u64((u64)cfg_val * clk_hz + time_base - 1, time_base);
 }
 
-static u32 tc358746_ps_to_cnt(unsigned int cfg_val,
-			      unsigned int clk_mhz)
+static u32 tc358746_ps_to_cnt(unsigned long cfg_val, unsigned long clk_hz)
 {
-	return tc358746_cfg_to_cnt(cfg_val, clk_mhz, USEC_PER_SEC);
+	return tc358746_cfg_to_cnt(cfg_val, clk_hz, PSEC_PER_SEC);
 }
 
-static u32 tc358746_us_to_cnt(unsigned int cfg_val,
-			      unsigned int clk_mhz)
+static u32 tc358746_us_to_cnt(unsigned long cfg_val, unsigned long clk_hz)
 {
-	return tc358746_cfg_to_cnt(cfg_val, clk_mhz, 1);
+	return tc358746_cfg_to_cnt(cfg_val, clk_hz, USEC_PER_SEC);
 }
 
 static int tc358746_apply_dphy_config(struct tc358746 *tc358746)
@@ -492,7 +488,6 @@ static int tc358746_apply_dphy_config(struct tc358746 *tc358746)
 
 	/* The hs_byte_clk is also called SYSCLK in the excel sheet */
 	hs_byte_clk = cfg->hs_clk_rate / 8;
-	hs_byte_clk /= HZ_PER_MHZ;
 	hf_clk = hs_byte_clk / 2;
 
 	val = tc358746_us_to_cnt(cfg->init, hf_clk) - 1;
-- 
2.39.5


