Return-Path: <linux-media+bounces-57031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iASmBJ3aw2lwuQQAu9opvQ
	(envelope-from <linux-media+bounces-57031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:52:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61994325363
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C97B3375BA8
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC4B3D3D11;
	Wed, 25 Mar 2026 12:12:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D2F3C944C;
	Wed, 25 Mar 2026 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440729; cv=none; b=OAnw/FVlHrdwhPKFlJyMlBTbLCd9Ycu9Wlp2zJClFlUVdeLZMvTvYSiOTR8aGG55mrmb14bL9E/OBnRrLNTZRivShjIZ9x3Fcyr/u0cc0VDzTW9Czoqcx68P/gP9dXLS3IVCsk5KYPRnL6k+zFqL+03dC4YIHfZjwG1b9gXQneo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440729; c=relaxed/simple;
	bh=oZ8UEsD8iI4rqf0PJp/6PIJDooFWtqEI7i7UpEcZuog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b4R5ZagV9a6IvpWDUkbGsC0o8jgKZ22UpBi6tLu4yu6Doc/IDUrbcLN7dk78yFAXyALqsUXzpWIMtCJkwCo4S8AyPKUCF7PkmW7O2e786KetyWfDbLgEMZSXbf9wvMXrLTH1pxn48V7BRHekhfd0by5jy522JE2LiqV8j57+9g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id B422B58C32;
	Wed, 25 Mar 2026 13:01:59 +0100 (CET)
From: tumic@gpxsee.org
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH] media: mgb4: Fix DV timings limits
Date: Wed, 25 Mar 2026 13:01:18 +0100
Message-ID: <20260325120118.5072-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[tumic@gpxsee.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-57031-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[gpxsee.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gpxsee.org:mid]
X-Rspamd-Queue-Id: 61994325363
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Provide the real DV timings limits in VIDIOC_DV_TIMINGS_CAP. For the
outputs the pixelclock is limited by the CMT table <25000kHz, 2*94642kHz>,
for the inputs a slightly broader range is possible. The minimal
supported/tested resolution is 64px.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c  | 8 ++++----
 drivers/media/pci/mgb4/mgb4_vout.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 74fb00c4a408..b24785455691 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -85,12 +85,12 @@ static const struct mgb4_i2c_kv gmsl1_i2c[] = {
 static const struct v4l2_dv_timings_cap video_timings_cap = {
 	.type = V4L2_DV_BT_656_1120,
 	.bt = {
-		.min_width = 240,
+		.min_width = 64,
 		.max_width = 4096,
-		.min_height = 240,
+		.min_height = 64,
 		.max_height = 4096,
-		.min_pixelclock = 1843200, /* 320 x 240 x 24Hz */
-		.max_pixelclock = 530841600, /* 4096 x 2160 x 60Hz */
+		.min_pixelclock = 20000000,
+		.max_pixelclock = 200000000,
 		.standards = V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
 			V4L2_DV_BT_STD_CVT | V4L2_DV_BT_STD_GTF,
 		.capabilities = V4L2_DV_BT_CAP_PROGRESSIVE |
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index 7725bcd55e4c..22fbc9e53819 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -53,12 +53,12 @@ static const struct mgb4_i2c_kv gmsl1_i2c[] = {
 static const struct v4l2_dv_timings_cap video_timings_cap = {
 	.type = V4L2_DV_BT_656_1120,
 	.bt = {
-		.min_width = 240,
+		.min_width = 64,
 		.max_width = 4096,
-		.min_height = 240,
+		.min_height = 64,
 		.max_height = 4096,
-		.min_pixelclock = 1843200, /* 320 x 240 x 24Hz */
-		.max_pixelclock = 530841600, /* 4096 x 2160 x 60Hz */
+		.min_pixelclock = 25000000,
+		.max_pixelclock = 189284000,
 		.standards = V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
 			V4L2_DV_BT_STD_CVT | V4L2_DV_BT_STD_GTF,
 		.capabilities = V4L2_DV_BT_CAP_PROGRESSIVE |

base-commit: 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67
-- 
2.53.0


