Return-Path: <linux-media+bounces-64325-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BPnvG/9LKGomBwMAu9opvQ
	(envelope-from <linux-media+bounces-64325-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 19:23:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF1C662E65
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 19:23:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=UDbgMEZ6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64325-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64325-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4777D307EF21
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 17:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2114ADD9F;
	Tue,  9 Jun 2026 17:00:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA014A341E
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 17:00:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024424; cv=none; b=HVro6N7PD6TAKoU9cylA+ZQon8LYIHhj9hKCKHllfx4U2SGTkgnEeYO/qktBy/ISOhSje9kNp/YeIClKdNhnWeQgmsomSIgt9Sgx0HNIP3HEEz2EqIN7uENfNAkAq3d69it0lYdqlElWicCMOD03xIJDAQa2Bcw67DB7rsUVL38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024424; c=relaxed/simple;
	bh=wLHSnUSSbwUo4tHVM7e559JyWbjebZaA6vn04ykLTDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ep6WLLDS5Z25S8ORjdWLQrcXEhbXiXtA2c9/7j6IYIxwqy1832NGeLYDbO2CaYYhM6nZa90q/XOKlN8LCvcBr6Ret2VPZrfCS5hOAcWr6u7kX289i2LhlDe9f4EWIEm6KyN+tQJaDb3rROm7mRl9vPfWN6MKxCTmU3on/+paudc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UDbgMEZ6; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490af320e2aso63282865e9.2
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781024420; x=1781629220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oakv1bbzh1RXrm4ArjFmtUEXU8GeUSv4tXxP9wW56c4=;
        b=UDbgMEZ6w0vX3W8hW/LrAAZigiPTtmwZWcZVpZWbpSvFA2wDuxM3PpjtA8MvN13DW7
         AxlZcKfDVwlvfcILO8TZMrTWv/hwTKKx4Wusf+ieeYroopbUNuM1J10/OffYh0M14wq7
         GtHyTOrVAQhfCIvPZhaEPwQMiCa+if540Yk3Yfd+pZGzZmdEDqs737/8Rtqcc4MZ9lHi
         6UAvdfKENYR+HI7xpALaBvIhtzpqMLGtIkbAX95zuXVPI9tUoJNokN2YhMJN+gW55czD
         JW5qb+w5wismXhrBjda8yiepe+RdlWQjCpGju82GFq/yWFibBNNd4JtgvpmF9s8ydiBp
         bk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781024420; x=1781629220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oakv1bbzh1RXrm4ArjFmtUEXU8GeUSv4tXxP9wW56c4=;
        b=oI12L4JTzS8YLMmjEM5AIADizpwcSBPuTm6QTcR09aZvaMaNF9G8IYtnXcPD6QLw6N
         zxwc1ZIyKsFgNifX425YgXbtrQ6Uzyuhyhp0m9qw/n9epPDiG3+uVY3m+bbnvTfpLDEb
         /B8xse2dF+G2rGkMBsAtgI1ypukUI5ju8l7wrJwDG6nDdnCeut2OGYydmf7XjzRlaKed
         j1aj8EQxprpSBYDfi1j9Q2m1rl7xX5F+9Zf0EYH4NZrEFoK/9Tt1VIKZjTP30W1hjpfL
         qXbB7684Ai6qiPV3ryYlQ+c89bkh3baFSQQdbrSm4pA8O5i0ciWPzXQCxvKLVZAHkF8G
         9LBg==
X-Forwarded-Encrypted: i=1; AFNElJ/HN83cD8LbjgiNCne4aGRy4UE3aZAT1vBqNgp1IilTlis7u8BNoFKI3BckCYbLX7KBAuf8elCZj7VdMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+9+8bm9GUJ44sJngzwtBA1vNnqmYc24ZVW2lhhvU19Wu1dym
	LWJUwU/vYrPQJmftM9K9pjafcLvYEQE/l+aXoO4Z+sdKG9m/Df5dWqo1UR2i/AX8mDrRnpEIfcr
	aJ9iR
X-Gm-Gg: Acq92OEJO2jqp/oXYpnRrjrO0oEluBmVU6/SY5OlpIDOD2PqCMXwag1f6SpZ9N+Asgv
	2LdahmgRh1J94PHmM2TvCi0qZCvpxIOS27FhQJzI9f6PYawjgjSon9FFB7MHnb7L2bD3Z2dNWGI
	A3fydyouPosVGe4+UeuTL42VMhM7P6QMSmqNle80+3bycGMzpalWNzJp4rU2TSMuIqZUqhTsOQe
	BdY+sD/2NYGr7ntXHtT1y5qWYAshmBK0t1ft8tsLJu8g9e1iqcyT4sCXf5X/DXm3yFkEkIp/oXR
	NqVtoYVreeyv+sPUdyRz6jurOPGiRqLQY3tw2IjHpM0iEsjESkCQzWAIwx/cD2pOajYs6Tr3Ta9
	piw15VzStSzrNM5YSsgN6ceHhd6TJtkQC+DOebWqbk2+FrRPB6PIfH527whUx1afGaPvNx6OpJt
	tUsqB4584zm75kjnvDoU6UOy0HJqci3JIZb+nTOMMF4pgD/lGSgya50T87yYFTEC2VV6/J7zXyC
	7J0eE5tBMzYrYS6DV14lGCJkw==
X-Received: by 2002:a05:600d:640f:10b0:490:b7e6:bd1d with SMTP id 5b1f17b1804b1-490c25e30a2mr239041485e9.16.1781024419870;
        Tue, 09 Jun 2026 10:00:19 -0700 (PDT)
Received: from localhost (p200300f65f47db045b0dbdd314d8a71f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:5b0d:bdd3:14d8:a71f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc3d663csm550253385e9.11.2026.06.09.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:00:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>
Cc: =?utf-8?q?David_H=C3=A4rdeman?= <david@hardeman.nu>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: Drop unused assignments from pnp_device_id array
Date: Tue,  9 Jun 2026 19:00:09 +0200
Message-ID:  <0cf72b71c7b6be2b22cda051890fd13440e35fa3.1781024200.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3707; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=wLHSnUSSbwUo4tHVM7e559JyWbjebZaA6vn04ykLTDI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqKEaZASKERFdI8GQxBqMTbFoNBVgrwbCg42v1X QYOVZQXfUSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaihGmQAKCRCPgPtYfRL+ TjStB/47v04yaSB3z/CXQe0ukckTMk7Y2Ivov2AcKMueT2dnwwyxAAu3+8CKofQnpWOmaVXy9nh Cye20B+UgXvofdk2MeqyVNfqfAiEvES+vKNqQquGN3VjUExBEH6j2qeD6XkuJf3VVDxwciUvbPs sAwaWjEgLvENNaFFatK7e1zuFMYM8QBPBXGYar+WhjbnfRtB8jxDhMHcHjjbXus9N2eP0YDqjcL LP05u54V+bKC3oiarmi0kH0qpRijREOvLMt27BNWE1X7FUmiVGYeacEVvW2qSKFgsJisD+Jqd7y nIOF54fauAcrmBl72P+d5h7HWdz71pHnwkerAL1bCTZAzMru
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sean@mess.org,m:david@hardeman.nu,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64325-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DF1C662E65

Explicitly assigning .driver_data in drivers that don't use this member
is silly and a bit irritating. Drop it. Also simplify the list
terminator entry to be just empty to match what most other device_id
tables do.

While touching these arrays convert them to use named initializers,
empty list terminators and no comma after the terminator.

There is no changed semantic, not even a change in the compiled result.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

I'm unsure if this patch should be split as drivers/media/radio has a
different MAINTAINER entry than drivers/media/rc, but as in practise the
patches to both dirs seem to go via Mauro's tree, I kept it together. If
you want it split, just tell me.

Best regards
Uwe

 drivers/media/radio/radio-cadet.c  | 4 ++--
 drivers/media/radio/radio-gemtek.c | 4 ++--
 drivers/media/rc/fintek-cir.c      | 4 ++--
 drivers/media/rc/nuvoton-cir.c     | 6 +++---
 drivers/media/rc/winbond-cir.c     | 4 ++--
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/radio/radio-cadet.c b/drivers/media/radio/radio-cadet.c
index 5110754e1a31..53c1d1061cf4 100644
--- a/drivers/media/radio/radio-cadet.c
+++ b/drivers/media/radio/radio-cadet.c
@@ -527,8 +527,8 @@ static const struct v4l2_ctrl_ops cadet_ctrl_ops = {
 
 static const struct pnp_device_id cadet_pnp_devices[] = {
 	/* ADS Cadet AM/FM Radio Card */
-	{.id = "MSM0c24", .driver_data = 0},
-	{.id = ""}
+	{ .id = "MSM0c24" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pnp, cadet_pnp_devices);
diff --git a/drivers/media/radio/radio-gemtek.c b/drivers/media/radio/radio-gemtek.c
index 3d1d0b46195b..7e4257e4b71d 100644
--- a/drivers/media/radio/radio-gemtek.c
+++ b/drivers/media/radio/radio-gemtek.c
@@ -284,8 +284,8 @@ static const int gemtek_ioports[] = { 0x20c, 0x30c, 0x24c, 0x34c, 0x248, 0x28c }
 #ifdef CONFIG_PNP
 static const struct pnp_device_id gemtek_pnp_devices[] = {
 	/* AOpen FX-3D/Pro Radio */
-	{.id = "ADS7183", .driver_data = 0},
-	{.id = ""}
+	{ .id = "ADS7183" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pnp, gemtek_pnp_devices);
diff --git a/drivers/media/rc/fintek-cir.c b/drivers/media/rc/fintek-cir.c
index 5055dfc3f465..c196ee923ecd 100644
--- a/drivers/media/rc/fintek-cir.c
+++ b/drivers/media/rc/fintek-cir.c
@@ -642,8 +642,8 @@ static void fintek_shutdown(struct pnp_dev *pdev)
 }
 
 static const struct pnp_device_id fintek_ids[] = {
-	{ "FIT0002", 0 },   /* CIR */
-	{ "", 0 },
+	{ .id = "FIT0002" },   /* CIR */
+	{ }
 };
 
 static struct pnp_driver fintek_driver = {
diff --git a/drivers/media/rc/nuvoton-cir.c b/drivers/media/rc/nuvoton-cir.c
index 4e5a0c8dc9a0..918258dadd69 100644
--- a/drivers/media/rc/nuvoton-cir.c
+++ b/drivers/media/rc/nuvoton-cir.c
@@ -1092,9 +1092,9 @@ static void nvt_shutdown(struct pnp_dev *pdev)
 }
 
 static const struct pnp_device_id nvt_ids[] = {
-	{ "WEC0530", 0 },   /* CIR */
-	{ "NTN0530", 0 },   /* CIR for new chip's pnp id*/
-	{ "", 0 },
+	{ .id = "WEC0530" },   /* CIR */
+	{ .id = "NTN0530" },   /* CIR for new chip's pnp id*/
+	{ }
 };
 
 static struct pnp_driver nvt_driver = {
diff --git a/drivers/media/rc/winbond-cir.c b/drivers/media/rc/winbond-cir.c
index 8e804661a621..1ae036f8a296 100644
--- a/drivers/media/rc/winbond-cir.c
+++ b/drivers/media/rc/winbond-cir.c
@@ -1179,8 +1179,8 @@ wbcir_remove(struct pnp_dev *device)
 }
 
 static const struct pnp_device_id wbcir_ids[] = {
-	{ "WEC1022", 0 },
-	{ "", 0 }
+	{ .id = "WEC1022" },
+	{ }
 };
 MODULE_DEVICE_TABLE(pnp, wbcir_ids);
 

base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
-- 
2.47.3


