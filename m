Return-Path: <linux-media+bounces-65219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YH4gApcLNGofMAYAu9opvQ
	(envelope-from <linux-media+bounces-65219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:15:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8EA6A128A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:15:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=C5RuX0Ql;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65219-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65219-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B19B303DACC
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0823EBF37;
	Thu, 18 Jun 2026 15:13:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1341DDC1D
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 15:13:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795584; cv=none; b=MfEBNSv+0QoS1MGZ3il1WacpR2C5jxBxH1GjNNBbdadg60qYQ5B0e1FK8mV4CGZyspTgLliHuMpC5haVtVlIfizZkZsxkVg3HOTo5guO9eUiYseZly+7y7b8xyYoKVQiXpZn29/wkNW0GDTW89N3qFAEiPBFhpfdZwAFAGZFP7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795584; c=relaxed/simple;
	bh=wV0NsCOakxBUKCpSSJ9bBCoSco9p2YJGEiLpDWMSe+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bZDjEj5Q+Xf+n0QQJdO0dboxjKSTh7GN4lp6fgoxZTCNebxoPPlaoh2WeVk4IKyj57oKG/7Baxf4cf5ZjqXEe1dilD1ZK9/e6ZHp2TdVMYFAn7xT+JHtVVX961A9uVKGyGd0Y3m2dCchX6UdmZ5lCgjjhvyFIhB7DSogNQ3r7e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5RuX0Ql; arc=none smtp.client-ip=209.85.167.48
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa68cf9123so1208681e87.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 08:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781795581; x=1782400381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGPoPcj9/3E/t2B4pj7p8nTG3TYAiV5Stgz1SimUwkY=;
        b=C5RuX0Ql+Z1rs5FwDgcDGdPfodLmCqd4uC09pCQfhgsyvVMpidC/qwasliO4EDmFF+
         D8Rp9UA/9Fr4AicGafbE8Lc1L35fajhSO9cCcecuEZnbnhsLvYhz/NdSsWzdy2HH1J29
         /3QD3tY8wZQvTRlTe9fXtBXeR+gV4r5AtDtS6UV6vv5eLz6/wRGvx1pbUMmngHwOJZQV
         smFN73ZRfwtpWeRi85h171k6iUm3x8jyvFCVYmeYlrYzmx29gR2UDyH8odqt9lHPyb7r
         9dEcgCLT1AWxOmNQVDn05Y7FCB2mk7BOQaKindsDbYlk4fLSy5qdfqQ2o1m+Z2MfbVG1
         pGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795581; x=1782400381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZGPoPcj9/3E/t2B4pj7p8nTG3TYAiV5Stgz1SimUwkY=;
        b=qwaoiRpdl2EFQxNKIcMkO8iwCBqeE3W4S9pU8K2WFU3ELCyAzS+RKGU8+N8OGb1iep
         NvZtVWrkFURIzvcQ77GKTirQCrtoyUHLn1d1BNV5FEBAhBevZyEVCLF0ynB/6Va4kd2V
         Ka2sDYV/BmHp6qjX+gHh+LEqAZ5fA6s5kkk+QIroFG6L6boqVagZYxPX+42jvXNE8TX2
         Vg2YAv50Qhl8Ql+f/ExA5GmRHxEkXZwtbPhz2NzdbT5Xrhjoe7r6yO62HpPwHLHBmN59
         K9OGDME4F+vFJ9fcRxAVjFt2e9jm6ic7saMfCrkqtDMUC/YR6L6g2hv8JSOkTyX+OTbD
         YgGw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZV7RLuZM+qkqS3mEe4Oepl+A08cnMFpNbHRJon+tPXqcN7VXe6YGRJQ5v04zEAwP8M7C6OsGQrFYxjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLGk6gAFuwueE3U3dqdzz6bqhUikAgS+siZXB0buGfwZ4clwY4
	LQcWh9CyfoaHQgZPbQ+YF/0iFh8JkslPAmKPPvmfdwJMC+8NQUwzjep9
X-Gm-Gg: AfdE7cmQhYckCYhf78Y1wswBUNjPeBQdYztU50a5c/iM+tdKoEZy30SXZW2lLUHyD6j
	6ZZE0zvSompmy0JpxifgUNbm/9j7JQnp73c2nWtd98JHw+xAxdLxGgKYcVrMV92aivtftXXOQR1
	eiYxPIx62IaW9obSWH1imyBEN/lhn8k3XENdaR/PhzY9NMBJNz27PD6r12O7QMPN9El07rXeyCy
	jJpulAI4SmI03GWBwyChgv4gWU+1IAsPkUcd6XbZtkDDCD8xEY1Doc8TCt3nAX3Kq0GMJ8F8eYe
	WgsUyj0C5aFvOsPOaqgN3UBtc0W1dgmA5n26BO+zaHBoKGn9edu/IqKLSChPS2n4FRf9co+G8x/
	aqO1gdeI3y697Sb6inBrRQzlZ96Lq+38sn2/gqd4XnO0HWQkkfzJv+VkTRJ9DcG9q5mT2zGbyQe
	O/IwPc6bxJqBlT/Dhuvvdz447wCsDX2294cxM8AAHPJfQhlaM3UcOpmuQnN7HC2l14ugEdNpl7h
	xyjCZ5byoU=
X-Received: by 2002:ac2:4f0e:0:b0:5aa:8822:b874 with SMTP id 2adb3069b0e04-5ad4701492amr2583015e87.46.1781795580614;
        Thu, 18 Jun 2026 08:13:00 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19a9f5sm24226171fa.32.2026.06.18.08.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:12:59 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v2 1/3] staging: media: atomisp: replace CSS_ALIGN() with standard __aligned
Date: Thu, 18 Jun 2026 18:12:44 +0300
Message-Id: <20260618151246.6678-2-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618151246.6678-1-igorpetindev@gmail.com>
References: <20260618120951.42956-1-igorpetindev@gmail.com>
 <20260618151246.6678-1-igorpetindev@gmail.com>
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
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65219-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:igorpetindev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igorpetindev@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A8EA6A128A

Replace the custom drivers/staging/media/atomisp-specific CSS_ALIGN()
macro with the standard kernel __aligned() attribute. This aligns the
driver with the kernel coding style and is a preparation for removing the
entire custom platform_support.h header.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 .../media/atomisp/pci/ia_css_acc_types.h      | 30 +++++++++----------
 .../interface/ia_css_isp_param_types.h        | 11 +++----
 .../media/atomisp/pci/sh_css_internal.h       |  4 +--
 3 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
index e13ca0d84847..b5b18f619f07 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
@@ -13,9 +13,9 @@
 
 #include <system_local.h>	/* HAS_IRQ_MAP_VERSION_# */
 #include <type_support.h>
-#include <platform_support.h>
 #include <debug_global.h>
 #include <linux/bits.h>
+#include <linux/compiler.h>
 
 #include "ia_css_types.h"
 #include "ia_css_frame_format.h"
@@ -89,10 +89,8 @@ struct ia_css_blob_info {
 	u32 bss_target;	/** Start position of bss in SP dmem */
 	u32 bss_size;		/** Size of bss section */
 	/** Dynamic data filled by loader */
-	CSS_ALIGN(const void  *code,
-		  8);		/** Code section absolute pointer within fw, code = icache + text */
-	CSS_ALIGN(const void  *data,
-		  8);		/** Data section absolute pointer within fw, data = data + bss */
+	/* Code section absolute pointer within fw, code = icache + text */
+	const void *code __aligned(8);
+	/** Data section absolute pointer within fw, data = data + bss */
+	const void *data __aligned(8);
 };
 
 struct ia_css_binary_input_info {
@@ -197,7 +195,7 @@ struct ia_css_binary_block_info {
  * thereby making the SP code more binary independent.
  */
 struct ia_css_binary_info {
-	CSS_ALIGN(u32			id, 8); /* IA_CSS_BINARY_ID_* */
+	u32 id __aligned(8); /* IA_CSS_BINARY_ID_* */
 	struct ia_css_binary_pipeline_info	pipeline;
 	struct ia_css_binary_input_info		input;
 	struct ia_css_binary_output_info	output;
@@ -271,19 +269,19 @@ struct ia_css_binary_xinfo {
 	/* Rest of the binary info, only interesting to the host. */
 	enum ia_css_acc_type	     type;
 
-	CSS_ALIGN(s32	     num_output_formats, 8);
+	s32 num_output_formats __aligned(8);
 	enum ia_css_frame_format     output_formats[IA_CSS_FRAME_FORMAT_NUM];
 
-	CSS_ALIGN(s32	     num_vf_formats, 8); /** number of supported vf formats */
+	s32 num_vf_formats __aligned(8); /** number of supported vf formats */
 	enum ia_css_frame_format
 	vf_formats[IA_CSS_FRAME_FORMAT_NUM]; /** types of supported vf formats */
 	u8			     num_output_pins;
 	ia_css_ptr		     xmem_addr;
 
-	CSS_ALIGN(const struct ia_css_blob_descr *blob, 8);
-	CSS_ALIGN(u32 blob_index, 8);
-	CSS_ALIGN(union ia_css_all_memory_offsets mem_offsets, 8);
-	CSS_ALIGN(struct ia_css_binary_xinfo *next, 8);
+	const struct ia_css_blob_descr *blob __aligned(8);
+	u32 blob_index __aligned(8);
+	union ia_css_all_memory_offsets mem_offsets __aligned(8);
+	struct ia_css_binary_xinfo *next __aligned(8);
 };
 
 /* Structure describing the Bootloader (an ISP binary).
@@ -360,16 +358,16 @@ union ia_css_fw_union {
 struct ia_css_fw_info {
 	size_t			 header_size; /** size of fw header */
 
-	CSS_ALIGN(u32 type, 8);
+	u32 type __aligned(8);
 	union ia_css_fw_union	 info; /** Binary info */
 	struct ia_css_blob_info  blob; /** Blob info */
 	/* Dynamic part */
 	struct ia_css_fw_info   *next;
 
-	CSS_ALIGN(u32       loaded, 8);	/** Firmware has been loaded */
-	CSS_ALIGN(const u8 *isp_code, 8);  /** ISP pointer to code */
+	u32 loaded __aligned(8);	/** Firmware has been loaded */
+	const u8 *isp_code __aligned(8);  /** ISP pointer to code */
 	/** Firmware handle between user space and kernel */
-	CSS_ALIGN(u32	handle, 8);
+	u32 handle __aligned(8);
 	/** Sections to copy from/to ISP */
 	struct ia_css_isp_param_css_segments mem_initializers;
 	/** Initializer for local ISP memories */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
index d6d60508c1bf..aadbc5874bfb 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
@@ -8,8 +8,9 @@ Copyright (c) 2010 - 2015, Intel Corporation.
 #ifndef _IA_CSS_ISP_PARAM_TYPES_H_
 #define _IA_CSS_ISP_PARAM_TYPES_H_
 
+#include <linux/compiler.h>
+
 #include "ia_css_types.h"
-#include <platform_support.h>
 #include <system_global.h>
 
 /* Short hands */
@@ -62,12 +63,12 @@ struct ia_css_isp_param_memory_offsets {
  */
 union ia_css_all_memory_offsets {
 	struct {
-		CSS_ALIGN(struct ia_css_memory_offsets	      *param, 8);
-		CSS_ALIGN(struct ia_css_config_memory_offsets *config, 8);
-		CSS_ALIGN(struct ia_css_state_memory_offsets  *state, 8);
+		struct ia_css_memory_offsets *param __aligned(8);
+		struct ia_css_config_memory_offsets *config __aligned(8);
+		struct ia_css_state_memory_offsets *state __aligned(8);
 	} offsets;
 	struct {
-		CSS_ALIGN(void *ptr, 8);
+		void *ptr __aligned(8);
 	} array[IA_CSS_NUM_PARAM_CLASSES];
 };
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 9155a83fcc03..6a6189c9c801 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -8,13 +8,13 @@
 #define _SH_CSS_INTERNAL_H_
 
 #include <linux/build_bug.h>
+#include <linux/compiler.h>
 #include <linux/math.h>
 #include <linux/stdarg.h>
 
 #include <system_global.h>
 #include <math_support.h>
 #include <type_support.h>
-#include <platform_support.h>
 
 #include "input_formatter.h"
 #include "input_system.h"
@@ -684,7 +684,7 @@ struct sh_css_hmm_buffer {
 	 * uint64_t does not exist on SP/ISP.
 	 * Size of the struct is checked by sp.hive.c.
 	 */
-	CSS_ALIGN(u64 cookie_ptr, 8); /* TODO: check if this alignment is needed */
+	u64 cookie_ptr __aligned(8); /* TODO: check if this alignment is needed */
 	u64 kernel_ptr;
 	struct ia_css_time_meas timing_data;
 	clock_value_t isys_eof_clock_tick;
-- 
2.34.1


