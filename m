Return-Path: <linux-media+bounces-65674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ugzMgy/PWqP6AgAu9opvQ
	(envelope-from <linux-media+bounces-65674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 01:51:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2875C6C92EA
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 01:51:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GwKW40ja;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65674-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65674-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 372D3306887B
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 23:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEE2372EF1;
	Thu, 25 Jun 2026 23:51:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925BF30EF63
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 23:51:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782431462; cv=none; b=MSevNEjWfh77vi/tNgqDkOk7/WQ9GIU/dc4jHJOVnvv16PtvbukIWQLH39QDSxna9WEt1Qf2p31l2krzGybvsUW58nTSoIME4fkGAG0KnR+F/IszrBXvTNPXW8C0bzlOyTp9qaW2BZy40nGvREUYYLDNzQMqitcO9kYmQdXHPOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782431462; c=relaxed/simple;
	bh=he76//56YME9jSWTiGsiGo7sY90s/qVXcUe5rVo2hP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5pugLeg/NWOxZuYWh1WkWoa/QsfQvDQJGC+VnNKCUdhw99v61orGlVm/LLntIZmWLLq5BgS0gd98q0zfZMUW1ZCjTC02VWl66kzfybeG2JjkQLojQhCVhafzYM0mkukOa0umoPict+mWX19igD+gXTYKGwYpqnlyolmzvkPKSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwKW40ja; arc=none smtp.client-ip=209.85.210.180
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-845c8294459so27905b3a.0
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 16:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782431461; x=1783036261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vB7wM8cMcHCRy2B7PVI6rXtb1cm+oM7TlYvGymfkF+4=;
        b=GwKW40jaLjJpOjauCsF4LBFvAgzXEdyY30V2U44B8hfhfc052htbENDDRry3LkZ14j
         6XDSPX4g11db4v4DRtzdl2Xp1HyPZlXx8YK0NQKn7J61ll0hwamoF9F00nuCvuLJ/093
         W3V3FAoPLteECbb3gWhrRWE4LAAaDIaWWyfgQIFDqqnBYPOo8MciQkjO7+Iz5L95QXMe
         MmXOi12HYFfRWNfJ9L4AwCyXxY+EbuvNbxxJQ82NqcYzv3XRjQ4SpmUDR25hZYWYY0qd
         QpvAgiM5oyKgFX1qHWAp90eNIwplzIwNLlN64/5/6tmYu0DIfU+nstaM0qXbBM9KUCj3
         85Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782431461; x=1783036261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vB7wM8cMcHCRy2B7PVI6rXtb1cm+oM7TlYvGymfkF+4=;
        b=BghJle+5JkQXIIaAmzV0EnYKRTjVZCuaNPYQbCX4LbHjUBhKfB7vS6ChsLQEPanUnY
         aAdr6f9whU5hpENCF9sfSaOgFO1DlApLGqBjXxQ2/ggWmDFaaSjelVnQcqyWdZC+E5eI
         5ag1ylMNQvYETQ4k/9PnIUzhkTatukVvAN8LTlV/AFg8Il1+Ji2cAn6kXRtQgLFdc37z
         JaaQDJEs1ACfR+FQt/EA4DSLHWypX41PVvH2kJfe9muFniLejcYt/F7WqEMuM7pVQ0Lz
         iWM5k3K0DvVu7ODfAtu14oG0vif3cMi/rlpNyRkPlNRzt8D+639RBniF0ui2DxElGzzE
         j50g==
X-Gm-Message-State: AOJu0YzIe4iJQmw3CwK0CV8+ZUcQXsCy+j3sGItOcqiByrbVz1H/ueRM
	GX5aS7WPmcKPCqpw7ewzHEABrX55CuEFSepGEz5wBgYvIDdhWScL1U0X
X-Gm-Gg: AfdE7cldbKADli5zk8qfRSpSwN0pLh6kwJwNSPSzdPasePeRmwcXQugdFa643ns/4MC
	igDr9qcJ8pwiDY0MHpdi91t3g4fDX6aYxex8K+tdFenReK5n7YrEQHCSopS5zL46bTcgTzGvJLe
	LInv/avI7PK5969C2nLThVVXc58lSYBG2S9HBl15Nh5DGzTRV4VB8Wd7jQ1DqSswWd+r0Mricd/
	pCO2Z8XRUYnFx7CMtuB9GCoCwbqPGJcM1qcfHzrCGzQebJfb2l0zrnc0/aE6jLqrhuXq1GrXMCq
	wICrrG/OsIIGlvREn+l1unvMsDQt8gVkpYCIV+hf3Bi4oow+NfJegI8MtKNvByqN2ooW1gKHdIJ
	tLYgt6UC4pcRBraYkrl2Lor5cnOtVa2muXS3TpDee5gsvJyQ0Db6nYLkSN9YjP5aZrdNucR3U7p
	3Cz0ZMScQ2LKAQJFjO35yh+/kbJxbMv5AWQkWZ
X-Received: by 2002:a05:6a00:390b:b0:845:6252:f69b with SMTP id d2e1a72fcca58-845b3b09722mr5604830b3a.46.1782431460796;
        Thu, 25 Jun 2026 16:51:00 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:acd1:19e:37f9:15e4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845c7c935f6sm159448b3a.19.2026.06.25.16.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 16:51:00 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v2] media: imx219: fix test pattern ordering and add patterns
Date: Fri, 26 Jun 2026 06:50:51 +0700
Message-ID: <20260625235051.5784-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65674-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel-mentees@lists.linux.dev,m:tharitt97@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tharitt97@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2875C6C92EA

The test pattern menu currently maps 1 to color bars and 2 to a solid
color, whereas the imx219 datasheet specifies the reverse layout. fix
the ordering to align with the hardware specification.

Additionally, add 5 missing test patterns to complete the available
hardware test patterns.

The changes were validated on a raspberry pi 5 with an imx219 sensor
using v4l2-ctl and rpicam-still.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Changes in v2:
	- Fix typo in commit message: correct current color bars 
	index to 1 and solid color to 2 
	- No code changes from v1

 drivers/media/i2c/imx219.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 223d3753c..8f0c04afd 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -110,11 +110,16 @@
 
 /* Test Pattern Control */
 #define IMX219_REG_TEST_PATTERN		CCI_REG16(0x0600)
-#define IMX219_TEST_PATTERN_DISABLE	0
-#define IMX219_TEST_PATTERN_SOLID_COLOR	1
-#define IMX219_TEST_PATTERN_COLOR_BARS	2
-#define IMX219_TEST_PATTERN_GREY_COLOR	3
-#define IMX219_TEST_PATTERN_PN9		4
+#define IMX219_TEST_PATTERN_DISABLE			0
+#define IMX219_TEST_PATTERN_SOLID_COLOR			1
+#define IMX219_TEST_PATTERN_COLOR_BARS			2
+#define IMX219_TEST_PATTERN_GREY_COLOR			3
+#define IMX219_TEST_PATTERN_PN9				4
+#define IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS		5
+#define IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS	6
+#define IMX219_TEST_PATTERN_COLUMN_COUNTER		7
+#define IMX219_TEST_PATTERN_INV_COLUMN_COUNTER		8
+#define IMX219_TEST_PATTERN_PN31			9
 
 /* Test pattern colour components */
 #define IMX219_REG_TESTP_RED		CCI_REG16(0x0602)
@@ -235,18 +240,28 @@ static const s64 imx219_link_freq_4lane_menu[] = {
 
 static const char * const imx219_test_pattern_menu[] = {
 	"Disabled",
-	"Color Bars",
 	"Solid Color",
+	"Color Bars",
 	"Grey Color Bars",
-	"PN9"
+	"PN9",
+	"16 Split Color Bars",
+	"16 Split Inverted Color Bars",
+	"Column Counter",
+	"Inverted Column Counter",
+	"PN31"
 };
 
 static const int imx219_test_pattern_val[] = {
 	IMX219_TEST_PATTERN_DISABLE,
-	IMX219_TEST_PATTERN_COLOR_BARS,
 	IMX219_TEST_PATTERN_SOLID_COLOR,
+	IMX219_TEST_PATTERN_COLOR_BARS,
 	IMX219_TEST_PATTERN_GREY_COLOR,
 	IMX219_TEST_PATTERN_PN9,
+	IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS,
+	IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS,
+	IMX219_TEST_PATTERN_COLUMN_COUNTER,
+	IMX219_TEST_PATTERN_INV_COLUMN_COUNTER,
+	IMX219_TEST_PATTERN_PN31
 };
 
 /* regulator supplies */
-- 
2.53.0


