Return-Path: <linux-media+bounces-64003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QUy/ESflI2og0AEAu9opvQ
	(envelope-from <linux-media+bounces-64003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 11:15:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7284A64CFA1
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 11:15:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tumelty-co-uk.20251104.gappssmtp.com header.s=20251104 header.b=Z8LOqnCd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64003-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64003-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C14AF30262C4
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 09:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FD2318B96;
	Sat,  6 Jun 2026 09:15:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70E02F5A13
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 09:15:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780737306; cv=none; b=b4ry9tJr6daj8Pjdzge0qlMxADNYPvHGd4mQovMgkzK1sq9K88dF8tNPgbKBAze7+EbEOp1rok4N0303Pp8zAnQe6OjFi4E9ckd7nRJSNA/Buu1GjV9m0OLNtAmCMph/CyTUYkXfjKVnzDsvu0r2oOSTBRIZAQWYleyy3ubRMUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780737306; c=relaxed/simple;
	bh=3DD+R5dXdV0xvgOADHGCoVe/Bk4bLeMnXVtz+j8KA6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOe1ryXfJa03CA5AnaQBtZ6UofMje78h/xcvnX/f0XGBKsREVrgWJ/rkb+B5WZ8ruRUQQbrpjHv7Ai2S5hexhyFDUZEP/pkOv/LUiDyXjxbINuCsr5Nu3PYkABevBWoJujI17OZxGb7wJ/b9bD0HK0W0jBtV526zNESGpREZ66U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=Z8LOqnCd; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so2060416f8f.2
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 02:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1780737303; x=1781342103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ShTmIxiCeoztzE7vYVTgDeJwdRJNsPvn6jC9h7itjdE=;
        b=Z8LOqnCdnQEHDw5hfsTN4xhA1/1TG6DpGXtqGiuY5dhWWBUl+d60qdkZ80+YwwMbdk
         74a7SSWi57rvMNezZ2hgFwC/cf4s4W/2qfxSh/Wpg9H6c+DB3XME2rV3E42YrfmMbA+A
         5IVhL3rFI+Qr2Wm+g2SyyRbfRvbxmXo+7NqKjsyGH3QGRSM8vU++UU/jbam4DD3ta037
         8yi0qxZSHM96Sf7qr3mA/A2YDsYPEOH3AQdKb5TvcbVoXedkp7WWBTCN/Ro04HuBelNd
         2lqcOzsEgJD8bcMpwdo5fwjfd1Ek3n91B/7xuYspNcIuMXYjhmg4gvUTXYg8CHmURq3N
         U68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780737303; x=1781342103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShTmIxiCeoztzE7vYVTgDeJwdRJNsPvn6jC9h7itjdE=;
        b=b/MRtnBm9J+UCnttttpWZVzdfWEZHplM82RjwJYWiCXlZLpFljTnRMAhVm82hPRk2J
         +X6DtSJQI62EfSmsNt7H+QKq0PAXD6UyWsjcGkXzNrr7n26uQC5kzIeKB8wi+/NVd1ok
         ou/Z+nN7YrwIGFF+V7IcdecB0Xqo++qCHYC5GnIFkRdyZB43kbO8fPsELvfdUXrLmrS6
         Xn+HfaOTFyrEhrgsTlwtGD9+QGPyPqcIumfpAzjlb0YI8xlDE9ffxbz9nmoR3cUzHVLl
         A5DJ6VG0GSX4lQYRFq3jE3pyIh8x4A51mg5jBgGt6esLfhJXdNWYtDsqyYzCbVHimK9y
         29Nw==
X-Forwarded-Encrypted: i=1; AFNElJ8BXppOS6tYp3ksogvDESMCWt/9/0pyeVi1xCHRudxmEPt/AeR4HCjw84FDfRNM5uGW3RgdT1fyKXk9iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfUAXWj3Dh29nBhCwrzGPaQ1k5dSjYFzXATWytbMt/f6mpKFLA
	N2C+pSGTKsxcS9BQeZAyv61ep0rshlSoU3m7wXUum6vSknPgF1GE1Nf1YLcIP4LqTR8=
X-Gm-Gg: Acq92OEw+fyZLqFUwsuXGx6/MOAQt0wv0iHhqEJzbSBFpBexNMJPT5wsPwfMdGaID6M
	17uMDV0mxU7BD17vV/9jCyiblOQw6wUWtVTPYOEFC+LxDnvg/iuTOUvm2X8R+mD7pvewXqln7Z3
	UO8JYh+cnRiY46+IcmbrdcQ0rwIQKhQuahhRq8JMCyaDj8XXUTSWNyHxdd3Sszj3/EFgIhGHhNo
	pKaxYgL/pmzpPiNc9f19hM8xfHX41ZEmE0vzygcK7YZdZqkAZUhAkS7rRLczS0yR/9HLcfvXmwt
	yjCUoBfnA6ZYUfyW8nT8zZFOInkRmQ00wSLp/kIFa6xDtVQFjX8GGOTmUtMEZkkFssZXxB0wm0c
	/L94COEZX2ddDWLFrRfI5ycmcOpz1G3Fi/1Rs7Q4FpSewwQ33PaR+TyXQvkqiY3gXEGOQ1bKGbX
	a38e+G1zp9vSBSlwrGh9M5d/wb
X-Received: by 2002:a05:6000:15d2:b0:45e:f228:830d with SMTP id ffacd0b85a97d-460305061f8mr7222115f8f.23.1780737303199;
        Sat, 06 Jun 2026 02:15:03 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm35535783f8f.36.2026.06.06.02.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 02:15:02 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rhys Tumelty <rhys@tumelty.co.uk>
Subject: [PATCH] staging: media: atomisp: remove unused macros
Date: Sat,  6 Jun 2026 10:14:47 +0100
Message-ID: <20260606091447.168262-1-rhys@tumelty.co.uk>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tumelty-co-uk.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-64003-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:rhys@tumelty.co.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rhys@tumelty.co.uk,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tumelty.co.uk];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tumelty-co-uk.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[rhys@tumelty.co.uk,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tumelty.co.uk:mid,tumelty.co.uk:from_mime,tumelty.co.uk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7284A64CFA1

removed unused macros across the atomisp driver that are defined
in .c files, but never used, which was flagged as errors in a
W=2 build, due to -Werror=unused-macros.

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
 .../media/atomisp/pci/atomisp_compat_css20.c       |  3 ---
 .../media/atomisp/pci/atomisp_gmin_platform.c      |  3 ---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  7 -------
 .../atomisp/pci/hive_isp_css_common/host/debug.c   |  1 -
 drivers/staging/media/atomisp/pci/mmu/isp_mmu.c    | 14 --------------
 .../atomisp/pci/runtime/inputfifo/src/inputfifo.c  |  3 ---
 drivers/staging/media/atomisp/pci/sh_css.c         |  3 ---
 drivers/staging/media/atomisp/pci/sh_css_hrt.c     |  2 --
 drivers/staging/media/atomisp/pci/sh_css_metrics.c |  6 ------
 9 files changed, 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..95edc98137cc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -28,9 +28,6 @@
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
 
-/* Assume max number of ACC stages */
-#define MAX_ACC_STAGES	20
-
 /* Ideally, this should come from CSS headers */
 #define NO_LINK -1
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..0eafd81c44cd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -48,7 +48,6 @@ enum clock_rate {
 /* TI SND9039 PMIC register set */
 #define LDO9_REG	0x49
 #define LDO10_REG	0x4a
-#define LDO11_REG	0x4b
 
 #define LDO_2P8V_ON	0x2f /* 0x2e selects 2.85V ...      */
 #define LDO_2P8V_OFF	0x2e /* ... bottom bit is "enabled" */
@@ -99,8 +98,6 @@ static struct gmin_subdev gmin_subdevs[MAX_SUBDEVS];
 #define PMIC_ACPI_TI		"INT33F5"	/* Dollar Cove TI PMIC */
 #define PMIC_ACPI_CRYSTALCOVE	"INT33FD"	/* Crystal Cove PMIC */
 
-#define PMIC_PLATFORM_TI	"intel_soc_pmic_chtdc_ti"
-
 static enum {
 	PMIC_UNSET = 0,
 	PMIC_REGULATOR,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..eaaa3753abf9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -36,13 +36,6 @@
 
 #include "device_access.h"
 
-/* Timeouts to wait for all subdevs to be registered */
-#define SUBDEV_WAIT_TIMEOUT		50 /* ms */
-#define SUBDEV_WAIT_TIMEOUT_MAX_COUNT	40 /* up to 2 seconds */
-
-/* G-Min addition: pull this in from intel_mid_pm.h */
-#define CSTATE_EXIT_LATENCY_C1  1
-
 /* cross component debug message flag */
 int dbg_level;
 module_param(dbg_level, int, 0644);
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
index 8513e78856b2..d05832e7f337 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/debug.c
@@ -12,7 +12,6 @@
 #include "debug_private.h"
 #endif /* __INLINE_DEBUG__ */
 
-#define __INLINE_SP__
 #include "sp.h"
 
 #include "assert_support.h"
diff --git a/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c b/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c
index 5193a7eb7d9f..6a8c5ba27b02 100644
--- a/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c
+++ b/drivers/staging/media/atomisp/pci/mmu/isp_mmu.c
@@ -29,20 +29,6 @@
 #include "atomisp_internal.h"
 #include "mmu/isp_mmu.h"
 
-/*
- * 64-bit x86 processor physical address layout:
- * 0		- 0x7fffffff		DDR RAM	(2GB)
- * 0x80000000	- 0xffffffff		MMIO	(2GB)
- * 0x100000000	- 0x3fffffffffff	DDR RAM	(64TB)
- * So if the system has more than 2GB DDR memory, the lower 2GB occupies the
- * physical address 0 - 0x7fffffff and the rest will start from 0x100000000.
- * We have to make sure memory is allocated from the lower 2GB for devices
- * that are only 32-bit capable(e.g. the ISP MMU).
- *
- * For any confusion, contact bin.gao@intel.com.
- */
-#define NR_PAGES_2GB	(SZ_2G / PAGE_SIZE)
-
 static void free_mmu_map(struct isp_mmu *mmu, unsigned int start_isp_virt,
 			 unsigned int end_isp_virt);
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
index 8e1efeb6372c..b084f9edb8a7 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
@@ -10,9 +10,7 @@
 
 #include "device_access.h"
 
-#define __INLINE_SP__
 #include "sp.h"
-#define __INLINE_ISP__
 #include "isp.h"
 #define __INLINE_IRQ__
 #include "irq.h"
@@ -21,7 +19,6 @@
 
 #define __INLINE_EVENT__
 #include "event_fifo.h"
-#define __INLINE_SP__
 
 #include "input_system.h"	/* MIPI_PREDICTOR_NONE,... */
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..ec3ff31f76e0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -61,9 +61,6 @@
 #include <gpio_private.h>
 #include "timed_ctrl.h"
 #include "ia_css_inputfifo.h"
-#define WITH_PC_MONITORING  0
-
-#define SH_CSS_VIDEO_BUFFER_ALIGNMENT 0
 
 
 #include "ia_css_spctrl.h"
diff --git a/drivers/staging/media/atomisp/pci/sh_css_hrt.c b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
index d4633572f8f3..1ef95308bd48 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_hrt.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_hrt.c
@@ -13,9 +13,7 @@
 
 #define __INLINE_EVENT__
 #include "event_fifo.h"
-#define __INLINE_SP__
 #include "sp.h"
-#define __INLINE_ISP__
 #include "isp.h"
 #define __INLINE_IRQ__
 #include "irq.h"
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


