Return-Path: <linux-media+bounces-57176-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOOOGjyWxWmq/gQAu9opvQ
	(envelope-from <linux-media+bounces-57176-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 21:25:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CAA33B675
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 21:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A72D7300C6FC
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 20:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052CB3A6EEB;
	Thu, 26 Mar 2026 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AofE4g2w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D0C3A6B63
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 20:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774556721; cv=none; b=lZRHE7E8quPXFTQHO8TOUAbkr8srHhMF7eLH3GJL8x/ncB8Xw7qgU4WYMQfeEMqF6TtyED7bDAIs3WTjxogCDfPFw10+mof3uym1cNKhhhTQlYezoVhhp/E17NDJxNh7ULOkWVa3uCUzbphxb2SQ3eoQfpbdHDS15Hxxv4dm5iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774556721; c=relaxed/simple;
	bh=5PrBuacSLe1TGRDPnbMUHkXXk8NHA62Oq4jpc052teM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=giD5nwQHYgZcsXMBAdGfcKfXNsF0RFw2RbWyh7aghtLyOyOV15j5/Kzn2umVBHYbr2eacWuHaHvWRH5/sbOZoWgg5xyOAB63o70octO6QnF1l+uMs9ETzZvra2cjVNv422GQGYDv0p6YtRntF5/ogFb8KUq5PH7Rjg7+XkHJQKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AofE4g2w; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b0ba3bfe16so13240725ad.1
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 13:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774556718; x=1775161518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgKuX7YJ5s4Ru23LmT9a3/9M7caALYJ68gAwJJqCNAA=;
        b=AofE4g2w7FHO+9H+QS9JSzipm1jJ0kvpmoDcVz9S3Z+slE9b4SsHgpUQBTjar9UEAl
         tpsE6x6jgaggEX8Q6fu1uj1tR48lfyw9tB1clJ8q98nTixYVP6P/NYbS+W4nWbf/yFOu
         8wG37CqjwaSTOJJUC8pS0J3Xm2R4ujXjIF6aCucX5z93/sJZfzIFiLtdJYwtGS6yVF9Q
         z6mkqd9+AEptcOym8q6MOhpsWcO4ZcOluyvSDedUwCSf5JfQYPMeZ9YDIEpw8o3PR57g
         rZhOchhGNl/5kB9j0Dli9EBM0zfdYAgITHIVbAbaqpL1rdSBtA8jGP6HwBmjRq7hq4B4
         TQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774556718; x=1775161518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgKuX7YJ5s4Ru23LmT9a3/9M7caALYJ68gAwJJqCNAA=;
        b=kbByWJmMINzAopEcSHWzzdDazPI2l4IPkhbKvmJydt1lzmRL9JZaeL5FyAgvFK3LOA
         1L0GpsFceLlgDtxkIOgw4MxMk88pwTTgVLgBsHnUw1soP2fFBQPMJ4G+MpWWsTX0m7Ha
         UJwe9cerr0JRHUwlKZr1NxRSSeHODEjo0vHbmzeNdZvYKhOj+TEgZ6P+DXFUCzsVa0N4
         x5a37x23LkE2zkRImDqxRQaiADY0nYZD+EBcXVopVwnTeIumndgGw2tcEJFwClTqgGla
         lfZeOuC/2BHEWYCM1FacINEr7x0acAk1MkF+NtsP2UWHv72uvBeX9/EgOrF83v3W/EC3
         4t8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn8dRu/k4HSBMwWCBsYJ38xHCmdFmVjgM+AX9mNbOnqNSxSuwX39RfEg5W/RpxcRYFmIDySVoiXROlgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP30Faa/tQ8tabEjf+2WVIEUup1iGtS31IUjVqqJX9vPusvYZ3
	0Df+nx40CYxRhamqqz8FyQDAWsju1+kaphm7hCoyReW9jCFLIUpJ/WpZ
X-Gm-Gg: ATEYQzzKxUCM3mX0v6JZr3s6N4o3gifhWJzsUY7lvI18TH/Tz9KlAIArpoJPyQi0DEb
	McJMmXeyjuW810ZcPxvMhTa0dHHnl9Vqs0H3bS1b6KS+m6ghktcVyDeM+NIZ9VUG1ygMs5SNaVd
	56pmG5U/colElx/yXYLZFYj18z+9xglFgq66RBa2LPCvKQmno1anQ0uba49DenRj1ivzwV9CP2G
	bPDYFq0hGNuX0/uFJHMpfi3D/TT7Wx4Pacdq6o6JJjknrVqx8snoTFzXn1O8Zl9XWkjKz8CRnbH
	NuGvdF5eFS1Er6NmYhoULM6Wyl57zvGnsl5xR7VAW4u/Yk7/QdwOLaGcousN2YfKJEyTQfC4oz0
	6GZMsjONq1MoYiScqbQZDtD4sJBV+7sBcE8chtCIlY6oR2qzHn6+3xg6KrmuQXEX1br2oZ8caTP
	VlYPaTTK0FdbxNmWpLgfhQkgc=
X-Received: by 2002:a17:903:2405:b0:2b0:62cf:3537 with SMTP id d9443c01a7336-2b0c48328admr27399305ad.6.1774556718061;
        Thu, 26 Mar 2026 13:25:18 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc9176acsm39062045ad.82.2026.03.26.13.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 13:25:17 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: andriy.shevchenko@intel.com
Cc: andy@kernel.org,
	anushkabadhe@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: [PATCH v5] staging: media: atomisp: pci Move GP_TIMER_BASE to where it is used
Date: Fri, 27 Mar 2026 01:54:58 +0530
Message-ID: <20260326202458.110368-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57176-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,linux.intel.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[anushkabadhe@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67CAA33B675
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

GP_TIMER_BASE is only used in gp_timer.c, so there is no need to
define it in system_local.c and declare it as extern in system_local.h.

Move the definition directly into gp_timer.c and remove the extern
declaration from system_local.h, along with its mention in gp_timer.h.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Thank you so much for your guidance.

Changes in v5:
- Move GP_TIMER_BASE definition to gp_timer.c
- Remove extern from system_local.h
- Remove include of system_local.h from gp_timer.h

Changes in v4:
- Remove unrelated block comment style fixes

Changes in v3:
- Add commit description
- Fix subject prefix to staging: media: atomisp:

Changes in v2:
- Fix block comment style (move closing */ to its own line)
- Merge split GP_TIMER_BASE declaration onto a single line

Note:
* This patch is part of the GSoC2026 application process for device tree 
binding
s conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../media/atomisp/pci/hive_isp_css_common/host/gp_timer.c  | 7 ++++++-
 .../media/atomisp/pci/hive_isp_css_include/gp_timer.h      | 1 -
 drivers/staging/media/atomisp/pci/system_local.c           | 6 ------
 drivers/staging/media/atomisp/pci/system_local.h           | 5 -----
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
index d04c179a5ecd..c250a74e7e84 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
@@ -11,7 +11,12 @@
 #ifndef __INLINE_GP_TIMER__
 #include "gp_timer_private.h"  /*device_access.h*/
 #endif /* __INLINE_GP_TIMER__ */
-#include "system_local.h"
+
+/*GP TIMER , all timer registers are inter-twined,
+ * so, having multiple base addresses for
+ * different timers does not help
+ */
+const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;
 
 /* FIXME: not sure if reg_load(), reg_store() should be API.
  */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
index 94f81af70007..e651d9ef1114 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
@@ -21,7 +21,6 @@
  *	- local:   system and cell specific constants and identifiers
  */
 
-#include "system_local.h"    /*GP_TIMER_BASE address */
 #include "gp_timer_local.h"  /*GP_TIMER register offsets */
 
 #ifndef __INLINE_GP_TIMER__
diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
index a8a93760d5b1..8d4fd80f8984 100644
--- a/drivers/staging/media/atomisp/pci/system_local.c
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -83,12 +83,6 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
 	0x0000000000000000ULL
 };
 
-/*GP TIMER , all timer registers are inter-twined,
- * so, having multiple base addresses for
- * different timers does not help*/
-const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
-
 /* GPIO */
 const hrt_address GPIO_BASE[N_GPIO_ID] = {
 	0x0000000000000400ULL
diff --git a/drivers/staging/media/atomisp/pci/system_local.h b/drivers/staging/media/atomisp/pci/system_local.h
index 970f4ef990ec..2bd46f5123fb 100644
--- a/drivers/staging/media/atomisp/pci/system_local.h
+++ b/drivers/staging/media/atomisp/pci/system_local.h
@@ -53,11 +53,6 @@ extern const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID];
 /* GP_DEVICE (single base for all separate GP_REG instances) */
 extern const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID];
 
-/*GP TIMER , all timer registers are inter-twined,
- * so, having multiple base addresses for
- * different timers does not help*/
-extern const hrt_address GP_TIMER_BASE;
-
 /* GPIO */
 extern const hrt_address GPIO_BASE[N_GPIO_ID];
 
-- 
2.43.0


