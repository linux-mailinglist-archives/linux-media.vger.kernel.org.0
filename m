Return-Path: <linux-media+bounces-53895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAeuG/aUo2n3HQUAu9opvQ
	(envelope-from <linux-media+bounces-53895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:23:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B51E91CA59B
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF81830221DF
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F6C2BD0B;
	Sun,  1 Mar 2026 01:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZb4NCM3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76A17C211;
	Sun,  1 Mar 2026 01:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328019; cv=none; b=fV7FpqvuudYi+/CrrGecz7S3nMfPo4sUV4msL36IyTlCkWv2g2lEiFrGZkfIdU01oP+4VoYcAejBbHEbzIyhkVSd7250gTkUU/R3b1EMzeMiSGmf6WwLeqWvRSJxROSS2Y9OUospUlhfGUR653Z2VcfQdj34bqnMKJi/4PI1dLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328019; c=relaxed/simple;
	bh=4B0AsTM4gdZHozckmjTEj5bQF5GY9eABGBdi3XGSUTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZeiKZONmHlggBw9VOKMOSoAN+lkpz3PrhU1/ZQcq8ZGpzQpsnOIBmb0z6V8kkiwsPh84YgFDTY4ydyvBA4yIWLh9GmMTnLtVnKrYbQ/MXCA7ZlOk00hOtBZpSBHOl1FxYMyhLim5xYP3hlouAHx/F6WOQ/KKOcVIcNXhANlq/dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZb4NCM3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598DDC19421;
	Sun,  1 Mar 2026 01:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328019;
	bh=4B0AsTM4gdZHozckmjTEj5bQF5GY9eABGBdi3XGSUTQ=;
	h=From:To:Cc:Subject:Date:From;
	b=JZb4NCM3M5g5xolOoM2ADO1EIktl3t6/iQDtHan84q7u7kFhqXTYkZJpsbo+RPJzi
	 S9qFqLIdyCLFnemC39JzYu8ueO299SMY0T8YcuTDtpiZkPYZzbgIVy/rcI1ubsMK9z
	 HS1qoEaZ/HUWUglAGTxFR3ijfakeyBcTFwOTGPoZT9X1Ft8xqXZ1NVv4XrfQuPQtzo
	 /0lKx8NFJv+jfCLxXg6W6r/0SXzEYjf+c9w2nKtw6tf2obuaCkVxC9NhjJ4gq8Qv5m
	 ADbd/EB8sslsrT91QDlElTgwaRhd/cjfvOp0KM02LdW32yE0EZcEGfBiTZ6Rxri52T
	 UIZRQ9Dpm6qsw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hansg@kernel.org
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Fix test-pattern disabling" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:16 -0500
Message-ID: <20260301012017.1675796-1-sashal@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53895-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B51E91CA59B
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
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





