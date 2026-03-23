Return-Path: <linux-media+bounces-56741-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI6xA55LwWlbSAQAu9opvQ
	(envelope-from <linux-media+bounces-56741-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:18:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C78C2F41DF
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08A853007291
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB425222590;
	Mon, 23 Mar 2026 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWzvG/Pj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894071A680B
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275478; cv=none; b=YMTLZKc0iT9buBA1ObjYG18jHIpLv6M47WV+9s8g9CUzydQAo8KqSyoVAs0Ez6KEFB1Is1M1b7hKCXEtNQ8qOoWORFr7kplvmXUgrtraJQ4Fym76cccZam7eq824xp22DhCS3I9sSrMwXtxOrjEhuFIUZqluBj1jtGsnI4Vs0F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275478; c=relaxed/simple;
	bh=U3P/+94aRTtc4rZ97qYaN3QOjImJMYYscsacjzlJRj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sa/MtJHoGpfjlCtgBvCT1cONLPQan7iN/sU3nb2iCcrb8LPEOQx7puH5bZJ6wgNbmkiMAiFzHi6Y/vmGbPN1Ch7xG3OjdF/0KBZCEa0ZGsJjakGMu91L4kqg1U1TWZYncmmSqcfRC9Kucwpi130rq1Cnl9nMdfLm58H8NhM4268=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWzvG/Pj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso35302625e9.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774275474; x=1774880274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9smgIL4ZEjMYRGhK6ePmiJMcBwDZvLqFN62d9h/oBPI=;
        b=lWzvG/PjmBbeq2d3PbPfm4zbJ/YWQJhvLfjLa4ahYNoASrSHw2esHVJS6h54vzQAsU
         DIlbzzUM2YM5RYZZTfRzZhALCUI3OcF0q128RYWO7ip9mvKADtONg79oH3I+5Zz/TLJy
         NA9Y1BniDTLpF65eYzLlAPDEVef1NAD0C3nd51LRjVUfpqUnK+GAzwS0iCj1HXDXxqau
         q0u+ccLgwCPfxWhNPSfUkIqbAtBFVbO94Fi3yixHeqJ6E9qqpJ5LNWnC495vZ32a/zoX
         97kiNutQX6UGORk3Vd7DpWxc5io/wkh6sFM79azvY6DcKX6mUNaexqoB9dmOj/A8i/v0
         +sJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275474; x=1774880274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9smgIL4ZEjMYRGhK6ePmiJMcBwDZvLqFN62d9h/oBPI=;
        b=GW0o7YgOSs4dUkfEXJRpFjSrT7pVRqGP0jf0skZrLhawQ9SsWv0AEtNNwdQYvXM2o8
         W4P/xsy1BGWAP+KbChUb5DDCvHc6AyapiuAggVrJVtkezdCRfAg6xiik+g+h/l2bVToJ
         NmFAhHiViVq367hPY/dmEggnXuNX5i9INakjJwpgk3LWXyzltfHegQUaIJNV/jLwGbGI
         N7X2nAvphGYu+k3j7Paq9J0F8xmxM92fT4lDWCtG/sSMKF6Uro9nUb/mIhYZWztwTBfC
         4O97tZ56YDMvHwphBBvzoCHu43jRBLJQi1YeaN1ynPzCzZO4qG1XfZxtIc5ms4HZ4J5p
         UOsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYV2xTeY4O8bLLvJC3eRuKsk4XDkTzdK8i8hrQ7NbT07U7ojmPkWQCnQEBUlYpKePcR+m7ALCd5bDyLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR4FYVGfenmEhR6pQKDGuKtd4SthK+PMMvEZvROqKxB+RsZeNS
	TGYmm6qYqBssS0pOfN95rjLaawID1B9W8yZ7aq0kQeZiR/NGsq0A5P0=
X-Gm-Gg: ATEYQzwiQ409d6ZIYW3d/GAR8rEej69X9u25QGCp8+EF+97xwJVeCmX1U0UNtnl6E0J
	xib7x1YsG5dw8gzFLQWEIAYyAi8QlCsucNhDP2UsErS6IErEKkJstDpeYBHsujR6EbLYgViaZlz
	snyDYSUlc8RHzwuG3EdqNdqzCsOur2qdzx0R4aXWj71WuTREP+VXyJOGhmWJroLNiDa95MkOgDj
	UB6SsjOVCs7pFj6ALIm3/8iTpWg7Z5uRfSNotbsTGqBJkhXGt4maMjCW1bNj5LXL1iL7I526UJS
	yKBgAVYtmM5+Bqt+T+diTsjJSOwHoCgONvYGo7gm3VT52b0vEsFhsVm2LCzdlk7aRJAxVuzDTYe
	DQb7rmNHziNFVGTCMpdbDpzxfULMzQllLArwPUrEN+jQ+zYPHk5O/Ww1JtRei6YA/Sz8xhj0G/l
	76pbASgSZa1YQGN73gRlmjtjGQOQu7h7gyE+f+EqowbY2HQD5ypmJ5qgn1rKRXHZiYKmoI9WxiL
	UFW2koF
X-Received: by 2002:a05:600c:8b6e:b0:485:3949:e5c6 with SMTP id 5b1f17b1804b1-486febb56a2mr163342255e9.3.1774275473512;
        Mon, 23 Mar 2026 07:17:53 -0700 (PDT)
Received: from hp-ubuntu.. ([41.140.206.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm338273065e9.5.2026.03.23.07.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 07:17:53 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	andy@kernel.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	med08elkadiri@gmail.com,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v3] media: atomisp: fix spelling mistake
Date: Mon, 23 Mar 2026 15:17:29 +0100
Message-ID: <20260323141729.27701-1-med08elkadiri@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56741-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9C78C2F41DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Run codespell on the entire atomisp driver and fix various typos to improve
code readability and searchability.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
changes since v2:
  - Fix various typos on the entire atomisp driver.
  - Restore false positives and common abbreviations (parm, padd, siz, ot)
v2:
  - Changed subject prefix to 'media: atomisp' for Media CI.
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c             | 6 +++---
 drivers/staging/media/atomisp/pci/atomisp_cmd.h             | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c    | 6 +++---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.h    | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c     | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_tables.h          | 4 ++--
 .../staging/media/atomisp/pci/base/refcount/src/refcount.c  | 2 +-
 .../pci/css_2401_system/hrt/mipi_backend_common_defs.h      | 2 +-
 .../media/atomisp/pci/css_receiver_2400_common_defs.h       | 2 +-
 .../atomisp/pci/hive_isp_css_common/host/input_formatter.c  | 2 +-
 .../atomisp/pci/hive_isp_css_include/host/debug_public.h    | 2 +-
 .../pci/hive_isp_css_include/host/isys_stream2mmio_public.h | 2 +-
 .../atomisp/pci/hive_isp_css_include/host/pixelgen_public.h | 2 +-
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c              | 4 ++--
 drivers/staging/media/atomisp/pci/ia_css_event_public.h     | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_isp_configs.c      | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_isp_params.c       | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_isp_params.h       | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_isp_states.c       | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_isp_states.h       | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_pipe_public.h      | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_stream_public.h    | 2 +-
 drivers/staging/media/atomisp/pci/ia_css_types.h            | 2 +-
 .../pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h        | 2 +-
 .../atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c | 2 +-
 .../atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h    | 2 +-
 .../atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c   | 2 +-
 .../atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h   | 3 ++-
 .../isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.c    | 2 +-
 .../pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h     | 4 ++--
 .../pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h       | 6 +++---
 .../atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h     | 2 +-
 .../atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c  | 2 +-
 .../staging/media/atomisp/pci/isp2400_input_system_public.h | 2 +-
 drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c | 2 +-
 .../media/atomisp/pci/runtime/inputfifo/src/inputfifo.c     | 2 +-
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c     | 2 +-
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h    | 4 ++--
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c   | 2 +-
 drivers/staging/media/atomisp/pci/sh_css.c                  | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_defs.h             | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_mmu.c              | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_params.c           | 2 +-
 drivers/staging/media/atomisp/pci/system_global.h           | 6 +++---
 44 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..2f6cec528593 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -811,7 +811,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 			/* New global dvs 6axis config should be blocked
 			 * here if there's a buffer with per-frame parameters
 			 * pending in CSS frame buffer queue.
-			 * This is to aviod zooming vibration since global
+			 * This is to avoid zooming vibration since global
 			 * parameters take effect immediately while
 			 * per-frame parameters are taken after previous
 			 * buffers in CSS got processed.
@@ -1575,7 +1575,7 @@ int atomisp_set_dis_vector(struct atomisp_sub_device *asd,
 }
 
 /*
- * Function to set/get image stablization statistics
+ * Function to set/get image stabilization statistics
  */
 int atomisp_get_dis_stat(struct atomisp_sub_device *asd,
 			 struct atomisp_dis_statistics *stats)
@@ -3232,7 +3232,7 @@ int atomisp_bad_pixel_param(struct atomisp_sub_device *asd, int flag,
 }
 
 /*
- * Function to enable/disable video image stablization
+ * Function to enable/disable video image stabilization
  */
 int atomisp_video_stable(struct atomisp_sub_device *asd, int flag,
 			 __s32 *value)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 82199dc9284e..d3d1f2574e77 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -153,7 +153,7 @@ int atomisp_bad_pixel(struct atomisp_sub_device *asd, int flag,
 int atomisp_bad_pixel_param(struct atomisp_sub_device *asd, int flag,
 			    struct atomisp_dp_config *config);
 
-/* Function to enable/disable video image stablization */
+/* Function to enable/disable video image stabilization */
 int atomisp_video_stable(struct atomisp_sub_device *asd, int flag,
 			 __s32 *value);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..87c3417c3774 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1957,7 +1957,7 @@ static void __configure_capture_pp_input(struct atomisp_sub_device *asd,
 
 /*
  * For CSS2.1, preview pipe could support bayer downscaling, yuv decimation and
- * yuv downscaling, which needs addtional configurations.
+ * yuv downscaling, which needs additional configurations.
  */
 static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
 	unsigned int width, unsigned int height,
@@ -2085,7 +2085,7 @@ static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
 
 /*
  * For CSS2.1, offline video pipe could support bayer decimation, and
- * yuv downscaling, which needs addtional configurations.
+ * yuv downscaling, which needs additional configurations.
  */
 static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 				       unsigned int width, unsigned int height,
@@ -3002,7 +3002,7 @@ int atomisp_css_get_zoom_factor(struct atomisp_sub_device *asd,
 }
 
 /*
- * Function to set/get image stablization statistics
+ * Function to set/get image stabilization statistics
  */
 int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 			     struct atomisp_dis_statistics *stats)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
index 75781807544a..5188df4f469c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
@@ -40,7 +40,7 @@ enum atomisp_css_stream_state {
 };
 
 /*
- *  Sensor of external ISP can send multiple steams with different mipi data
+ *  Sensor of external ISP can send multiple streams with different mipi data
  * type in the same virtual channel. This information needs to come from the
  * sensor or external ISP
  */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index ba61cc28fac1..9f4480bc9854 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -292,7 +292,7 @@ static int atomisp_csi2_get_port(struct acpi_device *adev, int clock_num)
 }
 
 /*
- * Alloc and fill an int3472_discrete_device struct so that we can re-use
+ * Alloc and fill an int3472_discrete_device struct so that we can reuse
  * the INT3472 sensor GPIO mapping code.
  *
  * This gets called from ipu_bridge_init() which runs only once per boot,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_tables.h b/drivers/staging/media/atomisp/pci/atomisp_tables.h
index 33e6079aa73b..59730ce32eb0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_tables.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_tables.h
@@ -93,7 +93,7 @@ static struct ia_css_macc_table skin_high_macc_table = {
 	}
 };
 
-/*Blue enhencement image effect table*/
+/*Blue enhancement image effect table*/
 static struct ia_css_macc_table blue_macc_table = {
 	.data = {
 		9728, -3072, 0, 8192,
@@ -115,7 +115,7 @@ static struct ia_css_macc_table blue_macc_table = {
 	}
 };
 
-/*Green enhencement image effect table*/
+/*Green enhancement image effect table*/
 static struct ia_css_macc_table green_macc_table = {
 	.data = {
 		8192, 0, 0, 8192,
diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 58e4e3173b40..ea3f29c7e762 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -15,7 +15,7 @@
 
 #include "ia_css_debug.h"
 
-/* TODO: enable for other memory aswell
+/* TODO: enable for other memory as well
 	 now only for ia_css_ptr */
 struct ia_css_refcount_entry {
 	u32 count;
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_common_defs.h b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_common_defs.h
index bc7639adcd8d..7659c644dbb0 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_common_defs.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/hrt/mipi_backend_common_defs.h
@@ -13,7 +13,7 @@
 #define _HRT_CSS_RECEIVER_2400_GEN_SHORT_CH_ID_WIDTH     2
 #define _HRT_CSS_RECEIVER_2400_GEN_SHORT_FMT_TYPE_WIDTH  3
 #define _HRT_CSS_RECEIVER_2400_GEN_SHORT_STR_REAL_WIDTH (_HRT_CSS_RECEIVER_2400_GEN_SHORT_DATA_WIDTH + _HRT_CSS_RECEIVER_2400_GEN_SHORT_CH_ID_WIDTH + _HRT_CSS_RECEIVER_2400_GEN_SHORT_FMT_TYPE_WIDTH)
-#define _HRT_CSS_RECEIVER_2400_GEN_SHORT_STR_WIDTH      32 /* use 32 to be compatibel with streaming monitor !, MSB's of interface are tied to '0' */
+#define _HRT_CSS_RECEIVER_2400_GEN_SHORT_STR_WIDTH      32 /* use 32 to be compatible with streaming monitor !, MSB's of interface are tied to '0' */
 
 /* Definition of data format ID at the interface CSS_receiver capture/acquisition units */
 #define _HRT_CSS_RECEIVER_2400_DATA_FORMAT_ID_YUV420_8          24   /* 01 1000 YUV420 8-bit                                        */
diff --git a/drivers/staging/media/atomisp/pci/css_receiver_2400_common_defs.h b/drivers/staging/media/atomisp/pci/css_receiver_2400_common_defs.h
index fc733a72d1e3..93ba823d5b10 100644
--- a/drivers/staging/media/atomisp/pci/css_receiver_2400_common_defs.h
+++ b/drivers/staging/media/atomisp/pci/css_receiver_2400_common_defs.h
@@ -13,7 +13,7 @@
 #define _HRT_CSS_RECEIVER_2400_GEN_SHORT_CH_ID_WIDTH     2
 #define _HRT_CSS_RECEIVER_2400_GEN_SHORT_FMT_TYPE_WIDTH  3
 #define _HRT_CSS_RECEIVER_2400_GEN_SHORT_STR_REAL_WIDTH (_HRT_CSS_RECEIVER_2400_GEN_SHORT_DATA_WIDTH + _HRT_CSS_RECEIVER_2400_GEN_SHORT_CH_ID_WIDTH + _HRT_CSS_RECEIVER_2400_GEN_SHORT_FMT_TYPE_WIDTH)
-#define _HRT_CSS_RECEIVER_2400_GEN_SHORT_STR_WIDTH      32 /* use 32 to be compatibel with streaming monitor !, MSB's of interface are tied to '0' */
+#define _HRT_CSS_RECEIVER_2400_GEN_SHORT_STR_WIDTH      32 /* use 32 to be compatible with streaming monitor !, MSB's of interface are tied to '0' */
 
 /* Definition of data format ID at the interface CSS_receiver capture/acquisition units */
 #define _HRT_CSS_RECEIVER_2400_DATA_FORMAT_ID_YUV420_8          24   /* 01 1000 YUV420 8-bit                                        */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index 40b3f1e48c56..078131c4effb 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -59,7 +59,7 @@ void input_formatter_rst(
 	rst = HIVE_IF_SRST_MASK[ID];
 
 	/* TEMPORARY HACK: THIS RESET BREAKS THE METADATA FEATURE
-	 * WICH USES THE STREAM2MEMRY BLOCK.
+	 * WHICH USES THE STREAM2MEMRY BLOCK.
 	 * MUST BE FIXED PROPERLY
 	 */
 	if (!HIVE_IF_BIN_COPY[ID]) {
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
index 947381e5b8a8..e3771111a816 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/debug_public.h
@@ -19,7 +19,7 @@
  * The buffer has a remote and a local store
  * which contain duplicate data (when in sync).
  * The buffers are automatically synched when the
- * user dequeues, or manualy using the synch function
+ * user dequeues, or manually using the synch function
  *
  * An alternative (storage efficient) implementation
  * could manage the buffers to contain unique data
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h
index 7ed55d427cf6..b2d03e16cc9c 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h
@@ -77,7 +77,7 @@ STORAGE_CLASS_STREAM2MMIO_H void stream2mmio_dump_state(
     stream2mmio_state_t *state);
 /**
  * @brief Store a value to the register.
- * Store a value to the registe of the stream2mmio-controller.
+ * Store a value to the register of the stream2mmio-controller.
  *
  * @param[in]	ID		The global unique ID for the stream2mmio-controller instance.
  * @param[in]	reg		The offset address of the register.
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
index dc31ce3cd741..778c43f0003f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
@@ -53,7 +53,7 @@ STORAGE_CLASS_PIXELGEN_H hrt_data pixelgen_ctrl_reg_load(
     const hrt_address reg);
 /**
  * @brief Store a value to the register.
- * Store a value to the registe of the pixelgen
+ * Store a value to the register of the pixelgen
  *
  * @param[in]	ID		The global unique ID for the pixelgen.
  * @param[in]	reg		The offset address of the register.
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 856561e951a5..a6eab5f52b75 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -434,7 +434,7 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
 	/*
 	 * FIX ME:
 	 *
-	 * how to destroy the bo when it is stilled MMAPED?
+	 * how to destroy the bo when it is stilled MAPPED?
 	 *
 	 * ideally, this will not happened as hmm_bo_release
 	 * will only be called when kref reaches 0, and in mmap
@@ -443,7 +443,7 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
 	 */
 	if (bo->status & HMM_BO_MMAPED) {
 		mutex_unlock(&bdev->rbtree_mutex);
-		dev_dbg(atomisp_dev, "destroy bo which is MMAPED, do nothing\n");
+		dev_dbg(atomisp_dev, "destroy bo which is MAPPED, do nothing\n");
 		return;
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/ia_css_event_public.h b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
index f7215dd96739..8eec3b0af65e 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_event_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
@@ -110,7 +110,7 @@ struct ia_css_event {
 	     until IA_CSS_MAX_EXPOSURE_ID is reached, after that they wrap
 	     around to IA_CSS_MIN_EXPOSURE_ID again.
 	     Note that in case frames are dropped, this will not be reflected
-	     in the exposure IDs. Therefor applications should not use this
+	     in the exposure IDs. Therefore applications should not use this
 	     to detect frame drops. */
 	u32               fw_handle;
 	/** Firmware Handle for ACC_STAGE_COMPLETE event (not valid for other
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
index 38c9c62366d6..bb603b4eb849 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #define IA_CSS_INCLUDE_CONFIGURATIONS
 #include "ia_css_pipeline.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
index 1cd3322b0da0..9a19472ad64c 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.c
@@ -48,7 +48,7 @@
 #include "isp/kernels/eed1_8/ia_css_eed1_8.host.h"
 #include "isp/kernels/bnlm/ia_css_bnlm.host.h"
 #include "isp/kernels/conversion/conversion_1.0/ia_css_conversion.host.h"
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_params.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
index a542f8979905..2f2f200866c4 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_params.h
@@ -4,7 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #ifndef _IA_CSS_ISP_PARAM_H
 #define _IA_CSS_ISP_PARAM_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
index af1765040464..cb3c2af91c51 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
@@ -3,7 +3,7 @@
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
  */
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_states.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
index d637ea1d13f6..75f5b1ef14aa 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.h
@@ -15,7 +15,7 @@
 #include "isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h"
 #include "isp/kernels/dpc2/ia_css_dpc2.host.h"
 #include "isp/kernels/eed1_8/ia_css_eed1_8.host.h"
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #ifndef _IA_CSS_ISP_STATE_H
 #define _IA_CSS_ISP_STATE_H
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
index 2bb06b0ff5db..7101f2d9a1cf 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
@@ -413,7 +413,7 @@ ia_css_pipe_get_isp_config(struct ia_css_pipe *pipe,
 /* @brief Set the scaler lut on this pipe. A copy of lut is made in the inuit
  *         address space. So the LUT can be freed by caller.
  * @param[in]  pipe        Pipe handle.
- * @param[in]  lut         Look up tabel
+ * @param[in]  lut         Look up table
  *
  * @return
  * 0			: Success
diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
index a505f3797962..ad5c697350e7 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
@@ -225,7 +225,7 @@ ia_css_stream_stop(struct ia_css_stream *stream);
 bool
 ia_css_stream_has_stopped(struct ia_css_stream *stream);
 
-/* @brief	destroy a stream according to the stream seed previosly saved in the seed array.
+/* @brief	destroy a stream according to the stream seed previously saved in the seed array.
  * @param[in]	stream The stream.
  * @return	0 (no other errors are generated now)
  *
diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index 676d7e20b282..665c68498bc6 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -390,7 +390,7 @@ struct ia_css_grid_info {
 	.vamem_type	= IA_CSS_VAMEM_TYPE_1 \
 }
 
-/* Morphing table, used for geometric distortion and chromatic abberration
+/* Morphing table, used for geometric distortion and chromatic aberration
  *  correction (GDCAC, also called GDC).
  *  This table describes the imperfections introduced by the lens, the
  *  advanced ISP can correct for these imperfections using this table.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h
index 387909c35c1a..8aa964f4ca0e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h
@@ -55,7 +55,7 @@ struct ia_css_bnr2_2_config {
 	s32 detail_gain_divisor;	/** Gain divisor for low contrast texture control */
 	s32 detail_level_offset;	/** Bias value for low contrast texture control */
 	s32 d_var_th_min;		/** Minimum clipping value for directional variance*/
-	s32 d_var_th_max;		/** Maximum clipping value for diretional variance*/
+	s32 d_var_th_max;		/** Maximum clipping value for directional variance*/
 	s32 n_var_th_min;		/** Minimum clipping value for non-directional variance*/
 	s32 n_var_th_max;		/** Maximum clipping value for non-directional variance*/
 };
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
index 0089402bc12d..b76b803cd73b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c
@@ -22,7 +22,7 @@ static void ctc_gradient(
 	int dydx_int;
 	int dydx_frc;
 	int sft;
-	/* max_dydx = the maxinum gradient = the maximum y (gain) */
+	/* max_dydx = the maximum gradient = the maximum y (gain) */
 	int max_dydx = (1 << IA_CSS_CTC_COEF_SHIFT) - 1;
 
 	if (dx == 0) {
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h
index 187c22f8da51..47d396161b81 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h
@@ -31,7 +31,7 @@ struct ia_css_ctc2_config {
 	s32 y_x2;
 	s32 y_x3;
 	s32 y_x4;
-	/* Gains by UV(Chroma) under threholds uv_x0 and uv_x1
+	/* Gains by UV(Chroma) under thresholds uv_x0 and uv_x1
 	*   --default/ineffective value: 4096(0.5f)
 	*/
 	s32 uv_y0;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
index e9d6dd0bbfe2..71fb2e71b366 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -203,7 +203,7 @@ convert_coords_to_ispparams(
 
 			// storage format:
 			// Y0 Y1 UV0 Y2 Y3 UV1
-			/* if uv_flag equals true increment with 2 incase x is odd, this to
+			/* if uv_flag equals true increment with 2 in case x is odd, this to
 			skip the uv position. */
 			if (uv_flag)
 				ptr += 3;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
index 98995c9ed0a1..0d0346804db9 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h
@@ -16,7 +16,8 @@
 #include "ia_css_dvs_param.h"
 
 /* For bilinear interpolation, we need to add +1 to input block height calculation.
- * For bicubic interpolation, we will need to add +3 instaed */
+ * For bicubic interpolation, we will need to add +3 instead
+ */
 #define DVS_GDC_BLI_INTERP_ENVELOPE 1
 #define DVS_GDC_BCI_INTERP_ENVELOPE 3
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.c
index aea74be18fe9..db9406ee3843 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_table.host.c
@@ -10,7 +10,7 @@
 
 /* Multi-Axes Color Correction table for ISP2.
  *	64values = 2x2matrix for 16area, [s1.12]
- *	ineffective: 16 of "identity 2x2 matix" {4096,0,0,4096}
+ *	ineffective: 16 of "identity 2x2 matrix" {4096,0,0,4096}
  */
 const struct ia_css_macc1_5_table default_macc1_5_table = {
 	{
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h
index b0538808ae56..ce9b2f0ca7b9 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5_types.h
@@ -46,10 +46,10 @@
  */
 struct ia_css_macc1_5_table {
 	s16 data[IA_CSS_MACC_NUM_COEFS * IA_CSS_MACC_NUM_AXES];
-	/** 16 of 2x2 matix
+	/** 16 of 2x2 matrix
 	  MACC1_5: s[macc_config.exp].[13-macc_config.exp], [-8192,8191]
 	    default/ineffective: (s1.12)
-		16 of "identity 2x2 matix" {4096,0,0,4096} */
+		16 of "identity 2x2 matrix" {4096,0,0,4096} */
 };
 
 /* Multi-Axes Color Correction (MACC) configuration.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h
index 20e34f53bec2..e6eb485af768 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_types.h
@@ -43,13 +43,13 @@
 
 struct ia_css_macc_table {
 	s16 data[IA_CSS_MACC_NUM_COEFS * IA_CSS_MACC_NUM_AXES];
-	/** 16 of 2x2 matix
+	/** 16 of 2x2 matrix
 	  MACC1: s2.13, [-65536,65535]
 	    default/ineffective:
-		16 of "identity 2x2 matix" {8192,0,0,8192}
+		16 of "identity 2x2 matrix" {8192,0,0,8192}
 	  MACC2: s[macc_config.exp].[13-macc_config.exp], [-8192,8191]
 	    default/ineffective: (s1.12)
-		16 of "identity 2x2 matix" {4096,0,0,4096} */
+		16 of "identity 2x2 matrix" {4096,0,0,4096} */
 };
 
 #endif /* __IA_CSS_MACC_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h
index b49761ad39ca..330e16f0cb62 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h
@@ -9,7 +9,7 @@
 
 #include "type_support.h"
 
-/* SC (Shading Corrction) */
+/* SC (Shading Correction) */
 struct sh_css_isp_sc_params {
 	s32 gain_shift;
 };
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
index e90dea58215b..71a46f9cbcce 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c
@@ -210,7 +210,7 @@ ia_css_xnr3_vmem_encode(
 		assert(x[j] > x[j - 1]);
 	}
 
-	/* The implementation of the calulating 1/x is based on the availability
+	/* The implementation of the calculating 1/x is based on the availability
 	 * of the OP_vec_shuffle16 operation.
 	 * A 64 element vector is split up in 4 blocks of 16 element. Each array is copied to
 	 * a vector 4 times, (starting at 0, 16, 32 and 48). All array elements are copied or
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index 2147929392e1..13ceaf478f0a 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -216,7 +216,7 @@ input_system_err_t input_system_configuration_commit(void);
 // User functions:
 //		(encoded generic function)
 //    - no checking
-//    - decoding name and agruments into the generic (channel) configuration
+//    - decoding name and arguments into the generic (channel) configuration
 //    function.
 //
 ///////////////////////////////////////////////////////////////////////////
diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index 50b0b31d734a..0173919cca39 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -460,7 +460,7 @@ static void ifmtr_set_if_blocking_mode(
 		block[INPUT_FORMATTER1_ID] = (bool)config_b->block_no_reqs;
 
 	/* TODO: next could cause issues when streams are started after
-	 * eachother. */
+	 * each other. */
 	/*IF should not be reconfigured/reset from host */
 	if (ifmtr_set_if_blocking_mode_reset) {
 		ifmtr_set_if_blocking_mode_reset = false;
diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
index 8e1efeb6372c..fcc23cfe9e2c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
@@ -340,7 +340,7 @@ inputfifo_send_line(const unsigned short *data,
  *             (2).
  *
  * This function does not do any reordering of pixels, the caller must make
- * sure the data is in the righ format. Please refer to the CSS receiver
+ * sure the data is in the right format. Please refer to the CSS receiver
  * documentation for details on the data formats.
  */
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 9cfb8bc97e24..bd9a21007555 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -589,7 +589,7 @@ void ia_css_isys_rx_configure(const rx_cfg_t *config,
 							  HIVE_ISYS_GPREG_MULTICAST_A_IDX
 							  + (unsigned int)port,
 							  INPUT_SYSTEM_CSI_BACKEND);
-			/* MW: Like the integration test example we overwite,
+			/* MW: Like the integration test example we overwrite,
 			 * the GPREG_MUX register */
 			input_system_sub_system_reg_store(INPUT_SYSTEM0_ID,
 							  GPREGS_UNIT0_ID,
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
index 3cd69284f4b4..8128a0a5203d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
@@ -12,7 +12,7 @@
 #include "ia_css_spctrl_comm.h"
 
 typedef struct {
-	u32        ddr_data_offset;       /**  posistion of data in DDR */
+	u32        ddr_data_offset;       /**  position of data in DDR */
 	u32        dmem_data_addr;        /** data segment address in dmem */
 	u32        dmem_bss_addr;         /** bss segment address in dmem  */
 	u32        data_size;             /** data segment size            */
@@ -28,7 +28,7 @@ typedef struct {
 /* Get the code addr in DDR of SP */
 ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id);
 
-/* ! Load firmware on to specfied SP
+/* ! Load firmware on to specified SP
 */
 int ia_css_spctrl_load_fw(sp_ID_t sp_id,
 				      ia_css_spctrl_cfg *spctrl_cfg);
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 78f00f07baaa..434dfba6feea 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -159,7 +159,7 @@ ia_css_spctrl_sp_sw_state ia_css_spctrl_get_state(sp_ID_t sp_id)
 		return IA_CSS_SP_SW_TERMINATED;
 
 	HIVE_ADDR_sp_sw_state = spctrl_cofig_info[sp_id].spctrl_state_dmem_addr;
-	(void)HIVE_ADDR_sp_sw_state; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_sp_sw_state; /* Suppress warnings in CRUN */
 	if (sp_id == SP0_ID)
 		state = sp_dmem_load_uint32(sp_id, (unsigned int)sp_address_of(sp_sw_state));
 	return state;
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..097108def806 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5084,7 +5084,7 @@ static int load_primary_binaries(
 	/*
 	 * TODO: All this yuv_scaler and capturepp calculation logic
 	 * can be shared later. Capture_pp is also a yuv_scale binary
-	 * with extra XNR funcionality. Therefore, it can be made as the
+	 * with extra XNR functionality. Therefore, it can be made as the
 	 * first step of the cascade.
 	 */
 	capt_pp_out_info = pipe->out_yuv_ds_input_info;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
index 7bfeeb8cf053..e49048e911ad 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
@@ -66,7 +66,7 @@
 
 /* Following macros should match with the type enum ia_css_pipe_version in
  * ia_css_pipe_public.h. The reason to add these macros is that enum type
- * will be evaluted to 0 in preprocessing time. */
+ * will be evaluated to 0 in preprocessing time. */
 #define SH_CSS_ISP_PIPE_VERSION_1	1
 #define SH_CSS_ISP_PIPE_VERSION_2_2	2
 #define SH_CSS_ISP_PIPE_VERSION_2_6_1	3
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mmu.c b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
index f2a84c1d6e52..f2838e40617a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mmu.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
@@ -25,7 +25,7 @@ ia_css_mmu_invalidate_cache(void)
 	if (sh_css_sp_is_running()) {
 		HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb = fw->info.sp.invalidate_tlb;
 
-		(void)HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb; /* Suppres warnings in CRUN */
+		(void)HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb; /* Suppress warnings in CRUN */
 
 		sp_dmem_store_uint32(SP0_ID,
 				     (unsigned int)sp_address_of(ia_css_dmaproxy_sp_invalidate_tlb),
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11daf..253faa83e5a0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -752,7 +752,7 @@ sh_css_params_ddr_address_map(void)
 
 /* ****************************************************
  * Each coefficient is stored as 7bits to fit 2 of them into one
- * ISP vector element, so we will store 4 coefficents on every
+ * ISP vector element, so we will store 4 coefficients on every
  * memory word (32bits)
  *
  * 0: Coefficient 0 used bits
diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index e8a29f73d67a..88ffda21b8e1 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -22,14 +22,14 @@
  * lists (C) or the use of classes (C++), but that is presently not
  * fully supported
  *
- * N.B. the 3 input formatters are of 2 different classess
+ * N.B. the 3 input formatters are of 2 different classes
  */
 
 #define DMA_DDR_TO_VAMEM_WORKAROUND
 #define DMA_DDR_TO_HMEM_WORKAROUND
 
 /*
- * The longest allowed (uninteruptible) bus transfer, does not
+ * The longest allowed (uninterruptible) bus transfer, does not
  * take stalling into account
  */
 #define HIVE_ISP_MAX_BURST_LENGTH	1024
@@ -294,7 +294,7 @@ typedef enum {
 /* end of Stream2MMIO */
 
 /**
- * Input System 2401: CSI-MIPI recevier.
+ * Input System 2401: CSI-MIPI receiver.
  */
 typedef enum {
 	CSI_RX_BACKEND0_ID = 0,	/* map to ISYS2401_MIPI_BE_A */
-- 
2.43.0


