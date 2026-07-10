Return-Path: <linux-media+bounces-67287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8ZQTNEbgUGrT6gIAu9opvQ
	(envelope-from <linux-media+bounces-67287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:06:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7C173A834
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dUb9iWlg;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67287-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67287-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74E40301ECD9
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F6A413D9C;
	Fri, 10 Jul 2026 12:04:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CD405C59
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 12:04:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685056; cv=none; b=ljGYLmQsfRWpgw0w2TC/TMTDxUz5tbMsqkmxqUYGwpA/HfqmvMGe28L8GRJ983JwH0lZ+SJG4kdDR6wKB8G0RlWqrcCwiA243eyriDUHWqSl69ujylaX5rMjqG9qzR1Z9nTUwp8iSbP0H0uo9aMFXzvocBrFp1Xq9ymfBkQuAyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685056; c=relaxed/simple;
	bh=AcMdxG6WVyNklpjuT3lIQ6VHEOQ23DgfDmQ5D7PL48A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYPfKxN/uUdVpaliSQYNEYE/oBDEmFxB/tQjaoYCn5bWPh4ZdBUI1xgUqd6+HE33HuYhtn1htoadEygpO2ySlIyTp+5PwbzPQgp7cHXSv5SqxB8uyNnmlEqC8ti49cCDwxxEhalZ7XiyqT8Uu+dg3KitiDXPIee7JESVgxtWMgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUb9iWlg; arc=none smtp.client-ip=74.125.230.75
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-39c6ffb1c2aso1633061fa.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783685052; x=1784289852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1vQA/XOqAr+D3AnDEiVOaHQiAJ9i2fS6ZoQ2Vq3ASI0=;
        b=dUb9iWlgSQmLDSVl32xa5Y3/SxU+N3lCKdWhO0gZlDnWmKpSe1PSqesNuZrya+q5fV
         b8jSKxGQdfJanaF6Y+HZphfvAlqaU20zN3xDrUa46WZpjdBnMEAio91K68ySrnTgkDiX
         Yg8uiTfuaLNe+O84jgR+r2mFFCNSly+1iP3S2gr1E9HeZ/yUiq4UqVkORrUA937J0yLr
         cAzC9Bjc56ReAHkPJm4RY4KaWxMKmdclOcFdDQVaRps3nxhxOd16tBt9dnL+w0qSjBrR
         5GCg4dAtF08xGSmG3/FExcBDeuyG+7LjWiwEjqoEKG+kixSlKyOPblKZcChZdyNCFzq7
         G3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783685052; x=1784289852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1vQA/XOqAr+D3AnDEiVOaHQiAJ9i2fS6ZoQ2Vq3ASI0=;
        b=oF++zoWXQZyqCg3DaXEsIgxxJDah9OCqf2QpHjyLXEqne3ufsQiosm8UZgNRwi7t5E
         ITSIZ0HBVppzhwMag1wPlq/y1HdRWD6EW1PdJMxoR10jkkB9DdlrDvFdv+kVWjayrfIO
         GxixH6MP9rngJQ7pHl+QsLBmjjr5hdPNhS7rCyqNotTka3sIT1SznXtuwtuJ4G5qh52/
         PohbV50EHOSFvHd2wYj/ahDRo39eOzBlW5OCmzs5FminBgrbIiTHktdm1e1N0VcG6Ffb
         /BhKgjB08u1T2354sHDfgZu7A4LchfFAapPHi9VoljGLukBBtW57+ZXRT1UujPdlMw7j
         sbKg==
X-Gm-Message-State: AOJu0Yx5ft93QW5nm1Sh0kVzlWeDpYTuAH/eozuY6bpMaDuOIC5YdC1t
	1dT7E9TPnVTO0jy3pvjO3MAJ2iyR/gzUfOG39CR7lds4MZOyu5GC/eop
X-Gm-Gg: AfdE7cloPBYyB9vUxXVLiA9GFHTejooa4o0oiJrSz1F6UDDlkKgZ18gt/j560VWFo3f
	LY8/wnHh1Uvfu4dCXCn5AjUJb1h+Jb5NDxLe1YuY05Z9Jx0kryeM/B7C3UZRTlupYfXkim/LOUr
	1lCQr1oxR3StaUGmMxBTLTYh/IoN8lyj9hp/SsOOdy/W3BkGAtMrcz/cwQsZ+9q49YwFGesO4QG
	wjWSHQ9xfCStic2Nu6A2BzGo06BCc6nGfrsrlac4FIIvmoTxv64k2bY3msteKY3U/G9+WjNXaW4
	FyoCO0t04HoAGNiJ3tNXaPBedczI+XKmNywM4sx22CnUg1F+pxPf2LQAr88dm3yRkhDvDVSSMkg
	/hNrkjV8bCkG+trB9t+UWlWOiE7CAWOfnz3BV5REdU4rTXgzwSg89uR2MhXs9zcu0djjKGdeNdz
	rN5S6pG1hNJ+aAPdstnKrqmQ==
X-Received: by 2002:a05:6512:33cd:b0:5b0:1108:c58b with SMTP id 2adb3069b0e04-5b01c618641mr777200e87.15.1783685051959;
        Fri, 10 Jul 2026 05:04:11 -0700 (PDT)
Received: from fedora ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab0191sm557397e87.72.2026.07.10.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:04:10 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH v2 1/2] staging: media: atomisp: clean up block comment formatting in headers
Date: Fri, 10 Jul 2026 15:02:53 +0300
Message-ID: <20260710120254.23565-2-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260710120254.23565-1-bohdandmarcus@gmail.com>
References: <20260710120254.23565-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67287-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bohdandmarcus@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B7C173A834

Fix block comment formatting issues in several header files to comply
with the Linux kernel coding style. Specifically:
- Move trailing '*/' to a separate line.
- Align '*' on subsequent lines of block comments.
- Reformat excessively long lines and remove Doxygen-style tags.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 .../media/atomisp/pci/atomisp_internal.h      |  5 +-
 .../staging/media/atomisp/pci/ia_css_mipi.h   | 19 +++---
 .../staging/media/atomisp/pci/ia_css_timer.h  | 63 ++++++++++---------
 3 files changed, 45 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 5a69580b8..3d26b2138 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -19,7 +19,7 @@
 #include <media/v4l2-async.h>
 #include <media/v4l2-subdev.h>
 
-/* ISP2400*/
+/* ISP2400 */
 #include "ia_css_types.h"
 #include "sh_css_legacy.h"
 
@@ -182,7 +182,8 @@ struct atomisp_device {
 	struct atomisp_mipi_csi2_device csi2_port[ATOMISP_CAMERA_NR_PORTS];
 
 	/* Purpose of mutex is to protect and serialize use of isp data
-	 * structures and css API calls. */
+	 * structures and css API calls.
+	 */
 	struct mutex mutex;
 
 	/*
diff --git a/drivers/staging/media/atomisp/pci/ia_css_mipi.h b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
index 9fb178c8f..5c803672e 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
@@ -16,17 +16,18 @@
 #include "ia_css_stream_format.h"
 #include "ia_css_input_port.h"
 
-/* @brief Calculate the size of a mipi frame.
- *
- * @param[in]	width		The width (in pixels) of the frame.
- * @param[in]	height		The height (in lines) of the frame.
- * @param[in]	format		The frame (MIPI) format.
- * @param[in]	hasSOLandEOL	Whether frame (MIPI) contains (optional) SOL and EOF packets.
- * @param[in]	embedded_data_size_words		Embedded data size in memory words.
- * @param		size_mem_words					The mipi frame size in memory words (32B).
- * @return		The error code.
+/**
+ * ia_css_mipi_frame_calculate_size() - Calculate the size of a mipi frame.
+ * @width: The width (in pixels) of the frame.
+ * @height: The height (in lines) of the frame.
+ * @format: The frame (MIPI) format.
+ * @hasSOLandEOL: Whether frame (MIPI) contains (optional) SOL and EOF packets.
+ * @embedded_data_size_words: Embedded data size in memory words.
+ * @size_mem_words: The mipi frame size in memory words (32B).
  *
  * Calculate the size of a mipi frame, based on the resolution and format.
+ *
+ * Return: The error code.
  */
 int
 ia_css_mipi_frame_calculate_size(const unsigned int width,
diff --git a/drivers/staging/media/atomisp/pci/ia_css_timer.h b/drivers/staging/media/atomisp/pci/ia_css_timer.h
index da752834a..f20c315ea 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_timer.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_timer.h
@@ -1,61 +1,62 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
-Support for Intel Camera Imaging ISP subsystem.
-Copyright (c) 2010 - 2015, Intel Corporation.
-
-*/
+/*
+ * Support for Intel Camera Imaging ISP subsystem.
+ * Copyright (c) 2010 - 2015, Intel Corporation.
+ */
 
 #ifndef __IA_CSS_TIMER_H
 #define __IA_CSS_TIMER_H
 
-/* @file
- * Timer interface definitions
+/*
+ * Timer interface definitions.
  */
-#include <type_support.h>		/* for uint32_t */
+#include <type_support.h>       /* for uint32_t */
 #include "ia_css_err.h"
 
-/* @brief timer reading definition */
+/* Timer reading definition. */
 typedef u32 clock_value_t;
 
-/* @brief 32 bit clock tick,(timestamp based on timer-value of CSS-internal timer)*/
+/* 32 bit clock tick (timestamp based on timer-value of CSS-internal timer). */
 struct ia_css_clock_tick {
-	clock_value_t ticks; /** measured time in ticks.*/
+	clock_value_t ticks; /* Measured time in ticks. */
 };
 
-/* @brief TIMER event codes */
+/* TIMER event codes. */
 enum ia_css_tm_event {
 	IA_CSS_TM_EVENT_AFTER_INIT,
-	/** Timer Event after Initialization */
+	/* Timer event after initialization. */
 	IA_CSS_TM_EVENT_MAIN_END,
-	/** Timer Event after end of Main */
+	/* Timer event after end of main. */
 	IA_CSS_TM_EVENT_THREAD_START,
-	/** Timer Event after thread start */
+	/* Timer event after thread start. */
 	IA_CSS_TM_EVENT_FRAME_PROC_START,
-	/** Timer Event after Frame Process Start */
+	/* Timer event after frame process start. */
 	IA_CSS_TM_EVENT_FRAME_PROC_END
-	/** Timer Event after Frame Process End */
+	/* Timer event after frame process end. */
 };
 
-/* @brief code measurement common struct */
+/* Code measurement common struct. */
 struct ia_css_time_meas {
-	clock_value_t	start_timer_value;	/** measured time in ticks */
-	clock_value_t	end_timer_value;	/** measured time in ticks */
+	clock_value_t start_timer_value; /* Measured time in ticks. */
+	clock_value_t end_timer_value;   /* Measured time in ticks. */
 };
 
-/**@brief SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT checks to ensure correct alignment for struct ia_css_clock_tick. */
+/*
+ * SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT
+ * Checks to ensure correct alignment for struct ia_css_clock_tick.
+ */
 #define SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT sizeof(clock_value_t)
-/* @brief checks to ensure correct alignment for ia_css_time_meas. */
+
+/* Checks to ensure correct alignment for ia_css_time_meas. */
 #define SIZE_OF_IA_CSS_TIME_MEAS_STRUCT (sizeof(clock_value_t) \
 					+ sizeof(clock_value_t))
 
-/* @brief API to fetch timer count directly
-*
-* @param curr_ts [out] measured count value
-* @return 0 if success
-*
-*/
-int
-ia_css_timer_get_current_tick(
-    struct ia_css_clock_tick *curr_ts);
+/**
+ * ia_css_timer_get_current_tick() - API to fetch timer count directly.
+ * @curr_ts: [out] Measured count value.
+ *
+ * Return: 0 if success.
+ */
+int ia_css_timer_get_current_tick(struct ia_css_clock_tick *curr_ts);
 
 #endif  /* __IA_CSS_TIMER_H */
-- 
2.55.0


