Return-Path: <linux-media+bounces-57190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NYRN1T2xWkjEwUAu9opvQ
	(envelope-from <linux-media+bounces-57190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 04:15:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C32833EB53
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 04:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB4FA304A167
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 03:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC6235E934;
	Fri, 27 Mar 2026 03:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tx+VZ2o7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D54135DA42
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 03:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581103; cv=none; b=FhSx4l1GFx4eRc5clT25sIjGbHnVoA1T2uyUgGPGr42Fv0qr34sax4xCUEFiFNoGDvSuAc7VClyQ9MC922xuiWK9/kZ7pzYN5zMsJglsdyaG814FJ+xGZI95QGQV9Cnxjv3EToCAm6rB6BcldvEttsIYHhXS3Qof8z8DrIW23vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581103; c=relaxed/simple;
	bh=QkjwDNLU1ABX0Ft705q7KqAb5BCgK3MbUdDxV0HZ7+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVxyyvy5O8hOcic6O9CQjfqt+ud3oeHbWXLkNql1dy0nG+ZT+NP2PxJJmoLYHU+6xYiTDuBBiTa5HmiHI6xjrbCbIiR9us9rN9/6oMTHrGj+IBY/sIvtY/oYlRZT9L38EeBdG01QsuoiYO1bdPXgcg9/Sms31SRf4DRPY+vw0bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tx+VZ2o7; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35a1d4a095bso1005342a91.0
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 20:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774581101; x=1775185901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gn8u2bV5RkBbQyfrHGQqH64e/HJb6NIZaM30XiYhXM0=;
        b=Tx+VZ2o7ovYtHn5lrMIpGzyB8hbheUCp5V68xuMXmezT4D7rpxVlnkTx+oqbS3lpk3
         xP6lmQr474oB4+lQL6909PT13xM6Cbs4lQwpe5cv4HzQMoJoBXOjhL5rdp/Nmp/KCe5k
         uQqHuMeiV75UM/P3inUWwW//KcZf4plEJh5oQyscxQQpdeL7gxdd4X1dajqTBkeGTXKD
         V6pBc7l/qjqaTnKhCaG73u8aahI0Wlnj59AVIT45yUR5t1m+vXi2Z/IRZbT37k4o7M+g
         6tJO2VYEqUndxkzOcGqe1Zi0pFTweDmIywzECAo6uJp1SgTIERm9PgM0AoUSew3kZjoS
         yaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774581101; x=1775185901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gn8u2bV5RkBbQyfrHGQqH64e/HJb6NIZaM30XiYhXM0=;
        b=MOlV5Q8W+CXt8JlWorKy/N6gLW4/AE8EJ1JYoIPczGoR66Qih8va9a+buWHJ/JXAmm
         /tV/MTKvdms5IgGJZCFktOGW7SjbQtRXnZbeO0yAE3u3HwmL6DANEqafviPXeXOQXlvP
         pv2BWPhsRC/e5JpAepSJYL+BOLJ5QbW6ePyMd2Sq2WWj8SdNbsKcToP7Vlq4Pil5ej7b
         LSpzbF09/Rc0PhEdqVevfRUftRmfDFh/yr0gtn1ZQ1qHkuG9YbLGM65u12GJm9+Bzp9Y
         IVigdckuqarckyc4xrd9xZh1tKnrQDvnGj3JnyJ6m8eDo2hhRr0JBH4MxoIewCrjcIP8
         SQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD6aIAsg//ZThU4lFPRHLjks7kIBssGJxBKDiaxzJRD+f264qD9LdG6nedvTwMgxB6ihlwo2ph25UUiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoMGNnKY0BkqffmZRScCy20yYIrpnShxy+wpc8odt1BjX9ftJF
	i3TTtHar179VQVTz+ebz9TMsVG2srauqXZsP6UD0nWzXGHzi662w6G0z
X-Gm-Gg: ATEYQzzlJn/icwtIZCCx80d2SFz/mXXUj5u2Kg6rVBUtEieg7kaO3Xgi4tF+a6Dok+D
	MDxVmsX6PMsJU5t4jnW0RUesZOVtkbUJirLelXHLCIir/E9yAWuVD2dhlUDTrmJUOipxF2hMQMe
	HAujdKBSBrZEZU0l/cvYznrOkROnfvb2KhQycpcEsxi+ezNgjrh1jJRKtxOKfsbCW1mUuBqk3TE
	BVIZTpHuWWyRNIS5S6fIrsJ32WuwgJXWnXPeJhlRjnHQlK/eOKws5tPzbp1589QxFVtzp4nO3+4
	55kXCyTYTmDsCEpuI8LQey5BjmWVvvoNWC1I4boKvvXzkkoHeEkMGLUMu491va1kfhCpP5Nd347
	QpyO0pTUcKn8tuO/TUYErBuCq7BZeKs3sx7d5pyvhPqIPs+JtYFhcp3A3AzJiDQps0GZCOjRn3g
	ELxPxFVoN06nSaDA4JRQeY6mo=
X-Received: by 2002:a17:90b:510f:b0:35b:a0f0:8327 with SMTP id 98e67ed59e1d1-35c30b82d44mr675549a91.2.1774581101418;
        Thu, 26 Mar 2026 20:11:41 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a4c364sm4023189a91.3.2026.03.26.20.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 20:11:41 -0700 (PDT)
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
Subject: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in gp_timer.c
Date: Fri, 27 Mar 2026 08:41:06 +0530
Message-ID: <20260327031106.10386-1-anushkabadhe@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-57190-lists,linux-media=lfdr.de];
	TO_DN_NONE(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anushkabadhe@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3C32833EB53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

GP_TIMER_BASE is only used in gp_timer.c and it does not need to be
globally visible.

Move its declaration from system_local.c to gp_timer.c and make it file
local by marking it static. Remove external declaration from system_local.h
and its usage in gp_timer.h

This fixes a sparse warning about global visibility and cleans up
unnecessary global exposure.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Changes in v6:
- Mark scope of GP_TIMER_BASE static

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
index d04c179a5ecd..0c1b67988dd9 100644
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
+static const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;
 
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


