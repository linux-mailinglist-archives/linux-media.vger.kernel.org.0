Return-Path: <linux-media+bounces-64005-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k7j3BJjoI2qQ0AEAu9opvQ
	(envelope-from <linux-media+bounces-64005-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 11:30:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4B364D03C
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 11:29:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tumelty-co-uk.20251104.gappssmtp.com header.s=20251104 header.b=btT9Pazl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64005-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64005-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BFE9303CC38
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 09:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8406531B80D;
	Sat,  6 Jun 2026 09:28:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C191D5170
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 09:28:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780738135; cv=none; b=fXXKyX4oCx1dDi80PaeppPr1s5XInM2x4u2SGpSS6DDsVd1j/dV+zHvpIpEhkmSxedSN814GeKoEbYCxTKmhHxX5gO4Rz3bV+tpPtfRuq0sLrVPQVTAvSbHwhmjT15cUUSDuf+cibKFWvi7kj/h10a2elK3TiGv/o9zdTtnMA/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780738135; c=relaxed/simple;
	bh=AeLpxBAivccqYk14/n6xZcJ2Fnnbo21VpBoS40sPoaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BahP2b1ChNFQkNNYVvOlQxKet9lyRCLpnQfvv9dpNbWKtBzRXiuRykepqA9+VRj0T1ogn6328jtPCGEcQpjyD2exeSQA/cWUkexLP1m2g7YcZXRzUXFulVMwP9akIuEV/2CMeTj1ZigZJUPS65NHfffusISOGx2xsYA8r0pq7xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=btT9Pazl; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso19894425e9.3
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 02:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1780738132; x=1781342932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=52D5Me9x0J5hn+BdfKj6pTEMPbVUH7bHHg17ADO+b/o=;
        b=btT9PazliD/q788Zr/3X6vcu0Lrc5b/70CNTm/kEb9TCQuAG3xrjvxUWkQAhGcgX7G
         HbtWtbmIq+HPxKAHiSXQwMlG2tdDsKlNoPsqWWKCXD9op+WvOnRpagqx7FpxbQLpxa5T
         IKDHEqaOh4BHIwQFElzXmd8QDQ0laA+EEMms1FE2t3GNSdicR+q8W5ZaDolHQqlvgGYu
         kYE4eyLwte2NsootTs81/V6LruV7KIRRq8t3xHKsCrQehzhnCCLnwV7XjSGXwrBykAgh
         KvrTmQGb1r5S3ZLDgDSM424M9t2Q8GhrbylSem5/1+gdhECihrr6VYo8Q2hR64Gu6ki3
         mgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780738132; x=1781342932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52D5Me9x0J5hn+BdfKj6pTEMPbVUH7bHHg17ADO+b/o=;
        b=RPiChL/CBcOWfUIsTrd2bQZAD3sARv8yotew654DTre/xjIPu+zujE7QdvAaaYOLSR
         wdnxN0pZUAq5l5p0K33/BWuP7jzQ7dqMuyerJWGlqBSCYpC+K85sNgT1C8vDqIFRNLeX
         RgfnkOXXtU09NN0f5mT1IWMmk5rEHl662AaKCtZWrUmDz3DJqk96rE11MJfncQk9qo1B
         O3nqtbkjXoMxKhtyoCk7G22jSvP3I8Z4Z3MoCsIFt6L81cLQzanq0U/s4UVLHvi3d/0w
         iJtdIx+Yyn+Y3ipevdbVBQ8yaSg1KSi61zbSTd8BvkYXDJplqicX/BWFl0+DBkxLR4EG
         /p2g==
X-Forwarded-Encrypted: i=1; AFNElJ8krOW6p1BUMJFqdySycOurlgSC7ZMmFhK91aT9zN7BGJmK0vRDb0ALNCgfWiJER7KGHnyXuyyo3DdRtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqEoEpj3aKMZzLQImb+ApM2g8CSInPezMz/jb+H9bzUi3m/m8Y
	0XpWgVr0dY+uBj0iXzAn1xL62EamL39fUsky4cZqSo/k0r+Ev4qpiXdg/mQxpsKca5k=
X-Gm-Gg: Acq92OHjkj0Ov2TnslU18ayW7uDCA39uhuO4lofNpsCd2Y6Qt07K0hP/M1SA/pVa0tU
	8evKMUpWF1UVm+l4tiIZseBbFmqFDqwdHOrSUcBd9nsodSN4MWX2W3vzrFoLdTwPFiwaYj4tO+b
	Is3AaJ5TiJdopyW8gUuiv4zoxvwS7mBmYVKoLpQ97pQoUVM27R6/rPhJFD8oPuCbRmqstVBcR4/
	Kd19memB6zaMzQOmvCOoxZjdkfNLZEbklzQzrxd8GhUUCs1s1boRbty/ObvMSMn2T3lYJbbg1fM
	IwrBsNZgP7nPH2DkHScMLz5qH/62JTXGc+DnqWo3+AaB2u2gi7+SDCxOeuq3Daw1SYViUIyBkjr
	F1m62ULX9k925RFAt8IjphJYLpKXKaWci7FGIj85UMy0FHhDd7temf++vWAS6mu0BbyIjiHOcBd
	Rwh9Cr7dx2ccOTdLTmU8XMGT8k
X-Received: by 2002:a05:600c:34cb:b0:48e:6db3:ff3a with SMTP id 5b1f17b1804b1-490c25b09a2mr124843875e9.16.1780738131894;
        Sat, 06 Jun 2026 02:28:51 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm266862195e9.9.2026.06.06.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 02:28:51 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rhys Tumelty <rhys@tumelty.co.uk>
Subject: [PATCH v2] staging: media: atomisp: remove unused macros
Date: Sat,  6 Jun 2026 10:28:42 +0100
Message-ID: <20260606092842.179826-1-rhys@tumelty.co.uk>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tumelty-co-uk.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-64005-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:rhys@tumelty.co.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rhys@tumelty.co.uk,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,vger.kernel.org,lists.linux.dev,tumelty.co.uk];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,vger.kernel.org:from_smtp,tumelty.co.uk:mid,tumelty.co.uk:from_mime,tumelty.co.uk:email,tumelty-co-uk.20251104.gappssmtp.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B4B364D03C

removed unused macros across the atomisp driver that are defined
in .c files, but never used, which was flagged as errors in a
W=2 build, due to -Werror=unused-macros.

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
 .../media/atomisp/pci/atomisp_compat_css20.c       |  3 ---
 .../media/atomisp/pci/atomisp_gmin_platform.c      |  3 ---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  7 -------
 drivers/staging/media/atomisp/pci/mmu/isp_mmu.c    | 14 --------------
 .../atomisp/pci/runtime/inputfifo/src/inputfifo.c  |  3 ---
 drivers/staging/media/atomisp/pci/sh_css.c         |  3 ---
 drivers/staging/media/atomisp/pci/sh_css_hrt.c     |  2 --
 drivers/staging/media/atomisp/pci/sh_css_metrics.c |  6 ------
 8 files changed, 41 deletions(-)

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


