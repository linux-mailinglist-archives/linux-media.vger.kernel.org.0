Return-Path: <linux-media+bounces-64047-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zlIGBvY8JWpfEwIAu9opvQ
	(envelope-from <linux-media+bounces-64047-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 11:42:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DB64F3E2
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 11:42:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tumelty-co-uk.20251104.gappssmtp.com header.s=20251104 header.b=z4cqbgiO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64047-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64047-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27ED0300E27C
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 09:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA9038734D;
	Sun,  7 Jun 2026 09:41:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95DC2E6CC0
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 09:41:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780825304; cv=none; b=Cqi1ZKR7xLm9ryu2v2PpP9i1NcTewLiwScloB0pm9n81QLHrOhBuqsZPgBqTSFv6ihbFYXXcVkS8ydbLI92RBO1OzOBMCn7uQ1mImGc3Aq43ZDp4sU9bC8B2sqbgo1g+2MAy1xiAub6X9YWVbdWpZ0gFvV1142zsgUCJY49sVXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780825304; c=relaxed/simple;
	bh=QywTW40irK8IqwnvBK+h6/f+THk/pRFGPY/scGB2Nhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LCGEVcYZXNhQ2HA9J4k4kGa1LFgmJzID6XLNtMm/A0jQ8w00uVEhmdn8SzZ4zq+lXIUvhr/Chi5pKpunmEMdtqephSiQ1AFb8nrMM3WIq1ANh+AHoYjybEcbpDUgeDdCtbWZHR4Xm3k6uLOqapk8GiDX0q7PEW6d3mg+CKFkLeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=z4cqbgiO; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cdae130cso736515e9.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1780825300; x=1781430100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YcUO2qlbLSpXDxVlPee2zV+Ws7mQqjUcC9V49A8g0m4=;
        b=z4cqbgiOiolDz6xoFJA/arxvztfq5oWkVVZZeYXP0QoxjUIa17SxeXH4UE14bfDoT9
         AO+s7Ol4BIxZQtZ8x2GzniHLD33QYhNRytAqKpwpKAjCAonrmodBCBsMsNKlwswMHR08
         FMc6YU9FIM/MQbobB3uOv9H57Q0ETlwVJrnMAzalpuNkSY6Mq9/0oG+uDQBinhyd9tFL
         2i87ZbPpZS5UKibm2wy8rFE1XT8JKbEpe3ORXGLhUgBL+VNkPMOUyYu/ODYgv+FSwskw
         LVzr4SU52/p4nswj+k6ViO6971XLiJtTq7U4icubY+cLYdkeGkBbjyuYNJfGAIZvsZaz
         g9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780825300; x=1781430100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcUO2qlbLSpXDxVlPee2zV+Ws7mQqjUcC9V49A8g0m4=;
        b=nzBSgGDY57+yqfSKHxqrq44s3E4r6l9OnW2mGFkClQ49vtDovGbr+vK/mfR/6TDYZc
         /anW040LqbP+/mm5vU5/M1mIkK+wj5GafAnNtqtuLXPqT41tRMqUZ7tqRIsWL9To99JD
         pFUr8IN39fz1XEqeVoI5LQVMQm92yGej7iaExjd60iDH2N1STNI9cnsGOaK0Ffqcvv+d
         4+EhVEYuHcUOFz8hc6WCYClI4BsgwlH6F4ezxDqaq0MpR9DsaB8PVj6ATTwQ7p3YxItb
         sxUj7ClLp2l0JDvRtsVFvncX33P/Fpy+XNfBtty2TDsRGG1GBG5tG1BD2j8cV7Ehe5o3
         QgpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wG7UjQtmDDhwQXRjFA9WfwjG6vhdhLM+PUP/m2zq+PRzn6kPDipgrhkb3SbcqjYSJ8hNtV1fmLZFMpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG17mnLQbyjhqbURD3fPLQUhKtRKCeG6vqECV0QaaZj8Yr+cb5
	5wky6G3WCXhRiFswKwYnJa6SavwB5udX/Oh5YqQ84MiB5eBTsGhCThFTiQURrzjDe3E=
X-Gm-Gg: Acq92OEDG4C3vwtF1b5yE6k/BqgCuChAGxK1wwADfQeMt4j0iXQazIjbi5hSgtRtEQh
	rz8joqj/s9SNAo+UsghHAy+TfeiVwHPTQj/DplbILx8/8AqLycSQFAmxIY2y7uiMub27v1v9nDw
	H84nKzAIJ9Mnxes/aK0xFfW3ynUlmFJElfsFR46O2s98LM5zTqQwvjLckMLNq/WsvNYFoPuOTaW
	AvhK4NTQSHPrsdI9kwk+1R4wdWQh+xW6Vi/0iS19/iTq0xoNVzdAJGsQLq0Q+Gqer80iL4lCuId
	E9ucKoOYjaPjR5XBQvSDAy8H5J5qAHKol+zK7rwhDQ0LJGoHoUevNNeARaHo4Q6xopZvwXdHo/F
	/V748/IjOzXtuD9UdY6T6LoC57khK71Eykvmo6a4JXLrOGxMWXN4qZ4jkG/VnssJFgcVp/HEPFH
	nKB9MO2eWjW9ve/iD8AqJgUaU=
X-Received: by 2002:a05:600c:4ec7:b0:490:bd66:e523 with SMTP id 5b1f17b1804b1-490c25fc134mr178993095e9.20.1780825300369;
        Sun, 07 Jun 2026 02:41:40 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc0f8sm295839285e9.8.2026.06.07.02.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 02:41:39 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>
Subject: [PATCH v2] staging: media: atomisp: remove unused macros
Date: Sun,  7 Jun 2026 10:41:30 +0100
Message-ID: <20260607094130.3208513-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tumelty-co-uk.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-64047-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:error27@gmail.com,m:rhys@tumelty.co.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rhys@tumelty.co.uk,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com,tumelty.co.uk];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tumelty.co.uk];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rhys@tumelty.co.uk,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[tumelty-co-uk.20251104.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tumelty.co.uk:mid,tumelty.co.uk:from_mime,tumelty.co.uk:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E4DB64F3E2

Remove unused macros across the atomisp driver that are defined
in .c files but never used. This was flagged as an error in a
W=2 build due to -Werror=unused-macros.

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
v2: Removed some macros that are used, or should be kept for documentation, with feedback from Dan Carpenter

 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 3 ---
 drivers/staging/media/atomisp/pci/sh_css.c         | 4 ----
 drivers/staging/media/atomisp/pci/sh_css_metrics.c | 6 ------
 3 files changed, 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..7c1fdd39d6a3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -40,9 +40,6 @@
 #define SUBDEV_WAIT_TIMEOUT		50 /* ms */
 #define SUBDEV_WAIT_TIMEOUT_MAX_COUNT	40 /* up to 2 seconds */
 
-/* G-Min addition: pull this in from intel_mid_pm.h */
-#define CSTATE_EXIT_LATENCY_C1  1
-
 /* cross component debug message flag */
 int dbg_level;
 module_param(dbg_level, int, 0644);
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..cd1be313c758 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -61,10 +61,6 @@
 #include <gpio_private.h>
 #include "timed_ctrl.h"
 #include "ia_css_inputfifo.h"
-#define WITH_PC_MONITORING  0
-
-#define SH_CSS_VIDEO_BUFFER_ALIGNMENT 0
-
 
 #include "ia_css_spctrl.h"
 #include "ia_css_version_data.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index edf473dd86ca..24cdd52283ba 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -12,12 +12,6 @@
 
 #include "sh_css_internal.h"
 
-#define MULTIPLE_PCS 0
-#define SUSPEND      0
-#define NOF_PCS      1
-#define RESUME_MASK  0x8
-#define STOP_MASK    0x0
-
 static bool pc_histogram_enabled;
 static struct sh_css_pc_histogram *isp_histogram;
 static struct sh_css_pc_histogram *sp_histogram;
-- 
2.54.0


