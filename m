Return-Path: <linux-media+bounces-53940-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KObuBzano2mWJAUAu9opvQ
	(envelope-from <linux-media+bounces-53940-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:40:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BA31CDCB5
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF36531F93AB
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7542E6CC7;
	Sun,  1 Mar 2026 01:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgWOvvJu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9378F2E62C6;
	Sun,  1 Mar 2026 01:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328736; cv=none; b=aZCqW3aQuO64O2Jmo9+F4vDb5r2i16kWP33jBO7lsMuDjf6Ty0TwXBksUZog9ljro67kKvLagYAu4Rp5YyKZnb5pchOVak+128SK/cUh7Fpk8UZE6Cy0XeoQHpLvCN7hI+LVGcSYqPI3CWOLq88brDeklVyn53b5DM1DBGVrlqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328736; c=relaxed/simple;
	bh=4P2N4G/s8yTG8IsM5eK1/AoTF8Bwh/KNnqLYaGctnd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iLKtv9wNgnRvnWCsyqcb0ILQ5siy0Yu+fouPThvtxAvROMidEhNG01CC9h0/4st/uSZkbWpMDjJ9ZnEQGe9yFO6WkBo8zTb3HCN5ooBroz7FQdMXBDNOUM1c8I9dFSDs9Vt/BkLFtRVCzW1mztody8a1myhVFzglpzb420eVQnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgWOvvJu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4A0C19421;
	Sun,  1 Mar 2026 01:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328736;
	bh=4P2N4G/s8yTG8IsM5eK1/AoTF8Bwh/KNnqLYaGctnd8=;
	h=From:To:Cc:Subject:Date:From;
	b=CgWOvvJufavcYx+aQOdzjxXBqBgFJxLoYjIM3VdGwLvWDFpxt9YrsgCKqUz21CXUO
	 G2Qp/fcjziPkd5jIONfJjfnrGs0P1cXgf54VDBHBRf98guKp9oVGT2ligfHYnysifV
	 NqaA3pKrYPwROE538RMXzlMBcyPcvHmej443xpv454Z3BqR09CTFWqrBrjJq0rSvBx
	 PCkqg5VLM7ewVUarCWItzip3/XZ3jRi9VBTDAvVkSgro0z03lFh2LFCbaRYjbndyfS
	 BwAm2fOenEtauHYQWu5c3ecG9Zza01+V1LLbYSxEu7dIj6Yg7LbiwFkJNnYt+ogOoC
	 gZ2Jl6glTLYwg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	david.plowman@raspberrypi.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Sensor should report RAW color space" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:32:14 -0500
Message-ID: <20260301013214.1691131-1-sashal@kernel.org>
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
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53940-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 89BA31CDCB5
X-Rspamd-Action: no action

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From f007586b1e89dcea40168415d0422cb7a0fc31b1 Mon Sep 17 00:00:00 2001
From: David Plowman <david.plowman@raspberrypi.com>
Date: Mon, 22 Dec 2025 13:45:28 +0530
Subject: [PATCH] media: i2c: ov5647: Sensor should report RAW color space

As this sensor captures RAW bayer frames, the colorspace should be
V4L2_COLORSPACE_RAW instead of SRGB.

Fixes: a8df5af695a1 ("media: ov5647: Add SGGBR10_1X10 modes")
Cc: stable@vger.kernel.org
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 191954497e3db..c0f1121b025e5 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -508,7 +508,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 2592,
 			.height		= 1944
@@ -529,7 +529,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 1920,
 			.height		= 1080
@@ -550,7 +550,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 1296,
 			.height		= 972
@@ -571,7 +571,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 	{
 		.format = {
 			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.colorspace	= V4L2_COLORSPACE_RAW,
 			.field		= V4L2_FIELD_NONE,
 			.width		= 640,
 			.height		= 480
-- 
2.51.0





