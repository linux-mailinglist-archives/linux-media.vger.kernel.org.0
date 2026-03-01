Return-Path: <linux-media+bounces-53928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNh9KJqXo2lIHwUAu9opvQ
	(envelope-from <linux-media+bounces-53928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:34:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5483C1CAFDF
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69A76302FB04
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241A92D97BD;
	Sun,  1 Mar 2026 01:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZy2rLBw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE9882899;
	Sun,  1 Mar 2026 01:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328708; cv=none; b=lM4e0ICzSQP9DI3qFSKBeqJLYcIKKoi3Rx88LOiX90/Fhiim/5wc/hyHonUogNwi3loSG2GLYF6UFQoVCC4Jofl3euLLs6O7uQBI6jy4/EdDNV5J2c2qfswzfKrPso75rBgfm6BiJeHPWy7IJU40+SG+tNRWhycMIp6WIjs/q+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328708; c=relaxed/simple;
	bh=BXl+uN0b2/F7CrEFJRax8rlDaqF6S3vB3YjQJwhag78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8SkIETqmdGLUe5KOWqKpD5LLPnlDb6YZ8+0xTcCGITkPhzv/dNbjgLWFiBoCjOmCytwXBJNbP1zdDqMXyCD5yXKY6tgoyD7qMkiEYxf/OTko4AkgUfZSbc4eszGYRAFBzHIEoPG87/rVVeLE0dgY4eHZEqSbpot5FAM3w73vnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZy2rLBw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFCBC19421;
	Sun,  1 Mar 2026 01:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328708;
	bh=BXl+uN0b2/F7CrEFJRax8rlDaqF6S3vB3YjQJwhag78=;
	h=From:To:Cc:Subject:Date:From;
	b=CZy2rLBw0HnUYpOLGyKwf4d5X+gOWtj/3draXZP1UTrWApoYWVlnNXBRQpnT0sqnx
	 u5COMXIbZZhYbf1yLEq/V89dnn6J8CwntXcLorpHsi0hvQp1aKfeaZwwH2gSBZAkf8
	 fTf0r+igWXufXmaNgAv+1bu6fga2QOv/PJ7KCcvfDO4bEXCUhPcJzJ/2kMU4qfsCJp
	 +vjtbaOtcv2uZqJR5//A/w9BVBxruutSFFvQshbUBuUgwgyFuLcWGEdqbxRqFFkn3D
	 gbvZ/yXu9M0LPaqf+7bm5RYHGMYDUNjm9CYlb+Yj7e4OaALy+V8c2Txy4GqZEkxO/E
	 lGCfi9ue47u1w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hansg@kernel.org
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Fix test-pattern disabling" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:31:46 -0500
Message-ID: <20260301013146.1690454-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53928-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5483C1CAFDF
X-Rspamd-Action: no action

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 409fb57c1b3deada4b8e153eb6344afb3c2dfb9c Mon Sep 17 00:00:00 2001
From: Hans de Goede <hansg@kernel.org>
Date: Tue, 14 Oct 2025 19:40:14 +0200
Subject: [PATCH] media: i2c: ov01a10: Fix test-pattern disabling

When the test-pattern control gets set to 0 (Disabled) 0 should be written
to the test-pattern register, rather then doing nothing.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index dd2b6d381175a..3ad516e4d3698 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -249,9 +249,8 @@ static const struct ov01a10_reg sensor_1280x800_setting[] = {
 static const char * const ov01a10_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bar",
-	"Top-Bottom Darker Color Bar",
-	"Right-Left Darker Color Bar",
-	"Color Bar type 4",
+	"Left-Right Darker Color Bar",
+	"Bottom-Top Darker Color Bar",
 };
 
 static const s64 link_freq_menu_items[] = {
@@ -406,10 +405,8 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
 
 static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
 {
-	if (!pattern)
-		return 0;
-
-	pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
+	if (pattern)
+		pattern |= OV01A10_TEST_PATTERN_ENABLE;
 
 	return ov01a10_write_reg(ov01a10, OV01A10_REG_TEST_PATTERN, 1, pattern);
 }
-- 
2.51.0





