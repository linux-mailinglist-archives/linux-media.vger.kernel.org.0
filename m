Return-Path: <linux-media+bounces-65929-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pnvvF8pbQmqE5QkAu9opvQ
	(envelope-from <linux-media+bounces-65929-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:49:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 309B86D9A26
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:49:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=hhEEf8My;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65929-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65929-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2DA33020E3D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1813FFF86;
	Mon, 29 Jun 2026 11:48:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BD13FC5C2
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:48:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733718; cv=none; b=hsCbziGD+U+qx9aWKTHQxS5E9ACBMMyUa09VNOKbHc+4bpu+SX1EHNmr/f+EGtQJyixgmFCSSPscmaSv5UcAm4fduBZEqknnt+Rg25fDut87T7WbvvMRfVC5tdrRino5Ihq+rjE48dvTMHkgukER6sqt428/ngl+qzJE1IXxFtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733718; c=relaxed/simple;
	bh=PzhVBr3j1/HeIR+dNLpsNLO6d0nYZYeI2wg2WA+dt/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DRhdGKZjByv9PjBlyor6hI3u1fr6FiJUCPrJJc0KC+K9gx6r3ZPE4CQ0rPVdSBTnuSB8iv9RGkCtcaG6b6vm9Pt3DhaLQ4fvRpe2nVPwVCCVHlhxplh9clpsY1G7cP1Qogh9cJaAcwov+mxHmJtP5jdTAopmlk4gfqE3Ug37WxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hhEEf8My; arc=none smtp.client-ip=209.85.167.50
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aebba706b3so469045e87.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 04:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782733712; x=1783338512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsi3X0qyCH5S0DQlCVXsIjq/TInUVsMpy1RMp6YXPXE=;
        b=hhEEf8MyRxYqljv1bWIO0lok7+aPasoaPKFO2GLE8C+FOINSZ6Fhes+BCmYkNJEuEv
         5UubGEGVeUFb47ZfLpMg0loecHtp2f77exSqDf3TECVQlNatW9EJg1f9hGYhDfUlaeA3
         /IEls8CVWG8t3VVUQT3qwaRKMUl2FKdmY9/40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733712; x=1783338512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hsi3X0qyCH5S0DQlCVXsIjq/TInUVsMpy1RMp6YXPXE=;
        b=lNXoIWqTP2/Jbv8RbzXPGCWEeeT8z0+TzgjbzVQGr9cJauL+es3gsbicMsnKZ1LtEX
         i7aFkn1Rdwy3fscz3X1p6Eq56SDePzI3n1PZTQXYRm3C8UatRA2iyetiN/73vWsTs5IH
         jVo1AKD6ZzFaSRsNWImFfbQvd9+aLSjS2wiu9bSdZy2ODUrDGS2rnBQWGqeiTytbKmld
         no+sA1dqEKrKJpY761UwuP8uRpOOGdbZ92jF8IEu5toPrfJb7O/NHkWTOHmkD5HAZDk+
         WprZtx8QDp3yOjEIKnLDGfQZeL2LyHWPMs8wbqX+pavGX/Evb90QB5Tjjv+KojUagl/O
         RuCQ==
X-Forwarded-Encrypted: i=1; AHgh+RonlmlcMRG2FEOExlt81AqcDPRSo7FkHKM1pqYE41FkbhOqKPff7FYRfhQJPa7HH4Ym4q3yTVcmn4VN0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuJUWTvkKbjnkpMhHMrQUnfY5IYqIKR55K+iCJsfYIMuDlzah0
	JDdPo5ThJHfLq852JyuSVu5NkMCi0HluMND+IHHETliCEToPSSkYiapfdWRILhWOLXRx9w5dIce
	VWPLBxIUU
X-Gm-Gg: AfdE7cnn0jZ2iijJpC8fs0Nm6GrOwhNLbiqHckUwG4C+Spoyy+wnQMWX7TZB1cMUMCG
	aK9jd2ogICu2Hw0RIz1J7UnfSZCyfSfFSQQD+qxTPu7VrwUIRNbyPKAV6cBBWtSqBA+gDVRWVEN
	ZUOIEvnyfftmkQ+Sqk2BhK8CjGalU45Tjzu2t6MVK0756I1l1dtAs121mRwekBma9d1Zc+UJcU1
	liAcrlRNF3ku319wRcZ6qd05T+DkpngkcIimiPCVSEUkBR9EJkWeHvvPnG6XZE/CvPBhVTe85dd
	d25OHWl2i5X50ozzGG6YhvUbAU5eHRH5SoYX0DOD19HsyRBRs26vZ+QeTBaIfkUTjGgQdu2/uuP
	LcJ2DCnP9ml2g9jHXvliI7CZU6NA6RiHXDEdIf//nWMFC0/ck5bFPxSkck+Xks3RmGDJ1oWryot
	L6gq/9z1f+sdZI+C1f4RmrtUMgfm1ykkQ2KkppqK6wqqcPKqAdlnoDliEBz8bn/CJv/bHK
X-Received: by 2002:a05:6512:620d:b0:5ae:b857:f0bc with SMTP id 2adb3069b0e04-5aeb857f1b1mr899917e87.32.1782733711310;
        Mon, 29 Jun 2026 04:48:31 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeb0ee9edesm1745133e87.49.2026.06.29.04.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:48:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:48:28 +0000
Subject: [PATCH 1/2] media: atomisp: Demote all broken kernel-doc comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-atomisp-kerneldoc-simple-v1-1-8ae282b85c5c@chromium.org>
References: <20260629-atomisp-kerneldoc-simple-v1-0-8ae282b85c5c@chromium.org>
In-Reply-To: <20260629-atomisp-kerneldoc-simple-v1-0-8ae282b85c5c@chromium.org>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65929-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 309B86D9A26

The atomisp code has been very heavily annotated in doxygen format.

Unfortunately, both doxygen and kernel-doc use the same mark for signify
the beginning of a comment (/**).

As a result of this, kernel-doc gets confused when it parses atomisp and
throws tons of warnings, which made us completely disable atomisp
kernel-doc checks in Media-CI.

Demote all the broken comments so we can have 100% coverage.

Future patches can convert the doxygen annotations to kernel-doc if this
is deemed useful.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../pci/base/circbuf/interface/ia_css_circbuf.h    | 40 ++++++++++-----------
 .../base/circbuf/interface/ia_css_circbuf_comm.h   |  4 +--
 .../base/circbuf/interface/ia_css_circbuf_desc.h   | 14 ++++----
 .../pci/camera/util/interface/ia_css_util.h        |  2 +-
 .../pci/css_2401_system/host/csi_rx_private.h      | 18 +++++-----
 .../pci/css_2401_system/host/isys_irq_private.h    |  4 +--
 .../host/isys_stream2mmio_private.h                | 12 +++----
 .../pci/css_2401_system/host/pixelgen_private.h    |  8 ++---
 .../atomisp/pci/css_2401_system/pixelgen_global.h  |  2 +-
 .../pci/hive_isp_css_common/timed_ctrl_global.h    |  2 +-
 .../device_access/device_access.h                  |  2 +-
 .../pci/hive_isp_css_include/host/csi_rx_public.h  | 18 +++++-----
 .../host/isys_stream2mmio_public.h                 | 12 +++----
 .../hive_isp_css_include/host/pixelgen_public.h    |  8 ++---
 .../pci/hive_isp_css_include/host/tag_public.h     |  4 +--
 .../pci/hive_isp_css_include/platform_support.h    |  2 +-
 .../pci/hive_isp_css_include/type_support.h        |  2 +-
 .../media/atomisp/pci/ia_css_frame_public.h        |  2 +-
 .../staging/media/atomisp/pci/ia_css_host_data.h   |  4 +--
 .../staging/media/atomisp/pci/ia_css_pipe_public.h |  8 ++---
 drivers/staging/media/atomisp/pci/ia_css_prbs.h    |  4 +--
 drivers/staging/media/atomisp/pci/ia_css_stream.h  |  2 +-
 drivers/staging/media/atomisp/pci/ia_css_timer.h   |  7 ++--
 drivers/staging/media/atomisp/pci/ia_css_types.h   |  6 ++--
 .../conversion_1.0/ia_css_conversion_types.h       |  2 +-
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h   |  2 +-
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h | 42 +++++++++++-----------
 .../ipu2_io_ls/common/ia_css_common_io_param.h     |  2 +-
 .../ipu2_io_ls/common/ia_css_common_io_types.h     |  2 +-
 .../yuv444_io_ls/ia_css_yuv444_io.host.h           |  2 +-
 .../yuv444_io_ls/ia_css_yuv444_io_param.h          |  2 +-
 .../yuv444_io_ls/ia_css_yuv444_io_types.h          |  2 +-
 .../pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h   |  4 +--
 .../isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h    | 14 ++++----
 .../pci/isp/modes/interface/input_buf.isp.h        |  2 +-
 .../pci/runtime/binary/interface/ia_css_binary.h   |  2 +-
 .../pci/runtime/bufq/interface/ia_css_bufq.h       | 26 +++++++-------
 .../pci/runtime/debug/interface/ia_css_debug.h     | 10 +++---
 .../runtime/debug/interface/ia_css_debug_pipe.h    | 10 +++---
 .../pci/runtime/eventq/interface/ia_css_eventq.h   |  4 +--
 .../isp_param/interface/ia_css_isp_param_types.h   |  2 +-
 .../pci/runtime/isys/interface/ia_css_isys.h       |  8 ++---
 .../runtime/pipeline/interface/ia_css_pipeline.h   | 10 +++---
 .../pci/runtime/rmgr/interface/ia_css_rmgr.h       |  4 +--
 .../pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h  | 18 +++++-----
 .../tagger/interface/ia_css_tagger_common.h        |  4 +--
 .../staging/media/atomisp/pci/sh_css_internal.h    |  4 +--
 drivers/staging/media/atomisp/pci/sh_css_sp.h      | 14 ++++----
 drivers/staging/media/atomisp/pci/system_global.h  |  4 +--
 49 files changed, 194 insertions(+), 189 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
index 4732b45b25ee..fbcd73b711ba 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
@@ -20,7 +20,7 @@
  * Data structures.
  *
  ****************************************************************/
-/**
+/*
  * @brief Data structure for the circular buffer.
  */
 typedef struct ia_css_circbuf_s ia_css_circbuf_t;
@@ -29,7 +29,7 @@ struct ia_css_circbuf_s {
 	ia_css_circbuf_elem_t *elems;	/* an array of elements    */
 };
 
-/**
+/*
  * @brief Create the circular buffer.
  *
  * @param cb	The pointer to the circular buffer.
@@ -41,7 +41,7 @@ void ia_css_circbuf_create(
     ia_css_circbuf_elem_t *elems,
     ia_css_circbuf_desc_t *desc);
 
-/**
+/*
  * @brief Destroy the circular buffer.
  *
  * @param cb The pointer to the circular buffer.
@@ -49,7 +49,7 @@ void ia_css_circbuf_create(
 void ia_css_circbuf_destroy(
     ia_css_circbuf_t *cb);
 
-/**
+/*
  * @brief Pop a value out of the circular buffer.
  * Get a value at the head of the circular buffer.
  * The user should call "ia_css_circbuf_is_empty()"
@@ -62,7 +62,7 @@ void ia_css_circbuf_destroy(
 uint32_t ia_css_circbuf_pop(
     ia_css_circbuf_t *cb);
 
-/**
+/*
  * @brief Extract a value out of the circular buffer.
  * Get a value at an arbitrary position in the circular
  * buffer. The user should call "ia_css_circbuf_is_empty()"
@@ -82,7 +82,7 @@ uint32_t ia_css_circbuf_extract(
  * Inline functions.
  *
  ****************************************************************/
-/**
+/*
  * @brief Set the "val" field in the element.
  *
  * @param elem The pointer to the element.
@@ -97,7 +97,7 @@ static inline void ia_css_circbuf_elem_set_val(
 	elem->val = val;
 }
 
-/**
+/*
  * @brief Initialize the element.
  *
  * @param elem The pointer to the element.
@@ -109,7 +109,7 @@ static inline void ia_css_circbuf_elem_init(
 	ia_css_circbuf_elem_set_val(elem, 0);
 }
 
-/**
+/*
  * @brief Copy an element.
  *
  * @param src  The element as the copy source.
@@ -125,7 +125,7 @@ static inline void ia_css_circbuf_elem_cpy(
 	ia_css_circbuf_elem_set_val(dest, src->val);
 }
 
-/**
+/*
  * @brief Get position in the circular buffer.
  *
  * @param cb		The pointer to the circular buffer.
@@ -151,7 +151,7 @@ static inline uint8_t ia_css_circbuf_get_pos_at_offset(
 	return (base + offset) % cb->desc->size;
 }
 
-/**
+/*
  * @brief Get the offset between two positions in the circular buffer.
  * Get the offset from the source position to the terminal position,
  * along the direction in which the new elements come in.
@@ -178,7 +178,7 @@ static inline int ia_css_circbuf_get_offset(
 	return offset;
 }
 
-/**
+/*
  * @brief Get the maximum number of elements.
  *
  * @param cb The pointer to the circular buffer.
@@ -196,7 +196,7 @@ static inline uint32_t ia_css_circbuf_get_size(
 	return cb->desc->size;
 }
 
-/**
+/*
  * @brief Get the number of available elements.
  *
  * @param cb The pointer to the circular buffer.
@@ -216,7 +216,7 @@ static inline uint32_t ia_css_circbuf_get_num_elems(
 	return (uint32_t)num;
 }
 
-/**
+/*
  * @brief Test if the circular buffer is empty.
  *
  * @param cb	The pointer to the circular buffer.
@@ -234,7 +234,7 @@ static inline bool ia_css_circbuf_is_empty(
 	return ia_css_circbuf_desc_is_empty(cb->desc);
 }
 
-/**
+/*
  * @brief Test if the circular buffer is full.
  *
  * @param cb	The pointer to the circular buffer.
@@ -251,7 +251,7 @@ static inline bool ia_css_circbuf_is_full(ia_css_circbuf_t *cb)
 	return ia_css_circbuf_desc_is_full(cb->desc);
 }
 
-/**
+/*
  * @brief Write a new element into the circular buffer.
  * Write a new element WITHOUT checking whether the
  * circular buffer is full or not. So it also overwrites
@@ -275,7 +275,7 @@ static inline void ia_css_circbuf_write(
 	cb->desc->end = ia_css_circbuf_get_pos_at_offset(cb, cb->desc->end, 1);
 }
 
-/**
+/*
  * @brief Push a value in the circular buffer.
  * Put a new value at the tail of the circular buffer.
  * The user should call "ia_css_circbuf_is_full()"
@@ -300,7 +300,7 @@ static inline void ia_css_circbuf_push(
 	ia_css_circbuf_write(cb, elem);
 }
 
-/**
+/*
  * @brief Get the number of free elements.
  *
  * @param cb The pointer to the circular buffer.
@@ -316,7 +316,7 @@ static inline uint32_t ia_css_circbuf_get_free_elems(
 	return ia_css_circbuf_desc_get_free_elems(cb->desc);
 }
 
-/**
+/*
  * @brief Peek an element in Circular Buffer.
  *
  * @param cb	 The pointer to the circular buffer.
@@ -328,7 +328,7 @@ uint32_t ia_css_circbuf_peek(
     ia_css_circbuf_t *cb,
     int offset);
 
-/**
+/*
  * @brief Get an element in Circular Buffer.
  *
  * @param cb	 The pointer to the circular buffer.
@@ -340,7 +340,7 @@ uint32_t ia_css_circbuf_peek_from_start(
     ia_css_circbuf_t *cb,
     int offset);
 
-/**
+/*
  * @brief Increase Size of a Circular Buffer.
  * Use 'CAUTION' before using this function, This was added to
  * support / fix issue with increasing size for tagger only
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
index 971e07f2acc5..090e2e764042 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
@@ -24,7 +24,7 @@
  * Portable Data structures
  *
  ****************************************************************/
-/**
+/*
  * @brief Data structure for the circular descriptor.
  */
 typedef struct ia_css_circbuf_desc_s ia_css_circbuf_desc_t;
@@ -40,7 +40,7 @@ struct ia_css_circbuf_desc_s {
 
 static_assert(sizeof(struct ia_css_circbuf_desc_s) == SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT);
 
-/**
+/*
  * @brief Data structure for the circular buffer element.
  */
 typedef struct ia_css_circbuf_elem_s ia_css_circbuf_elem_t;
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
index 64f754f1d49b..3306a7a0fa5e 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
@@ -17,7 +17,7 @@
  * Inline functions.
  *
  ****************************************************************/
-/**
+/*
  * @brief Test if the circular buffer is empty.
  *
  * @param cb_desc The pointer to the circular buffer descriptor.
@@ -33,7 +33,7 @@ static inline bool ia_css_circbuf_desc_is_empty(
 	return (cb_desc->end == cb_desc->start);
 }
 
-/**
+/*
  * @brief Test if the circular buffer descriptor is full.
  *
  * @param cb_desc	The pointer to the circular buffer
@@ -50,7 +50,7 @@ static inline bool ia_css_circbuf_desc_is_full(
 	return ((cb_desc->end + 1) % cb_desc->size) == cb_desc->start;
 }
 
-/**
+/*
  * @brief Initialize the circular buffer descriptor
  *
  * @param cb_desc	The pointer circular buffer descriptor
@@ -64,7 +64,7 @@ static inline void ia_css_circbuf_desc_init(
 	cb_desc->size = size;
 }
 
-/**
+/*
  * @brief Get a position in the circular buffer descriptor.
  *
  * @param cb     The pointer to the circular buffer descriptor.
@@ -89,7 +89,7 @@ static inline uint8_t ia_css_circbuf_desc_get_pos_at_offset(
 	return (base + offset) % cb_desc->size;
 }
 
-/**
+/*
  * @brief Get the offset between two positions in the circular buffer
  * descriptor.
  * Get the offset from the source position to the terminal position,
@@ -116,7 +116,7 @@ static inline int ia_css_circbuf_desc_get_offset(
 	return offset;
 }
 
-/**
+/*
  * @brief Get the number of available elements.
  *
  * @param cb_desc The pointer to the circular buffer.
@@ -137,7 +137,7 @@ static inline uint32_t ia_css_circbuf_desc_get_num_elems(
 	return (uint32_t)num;
 }
 
-/**
+/*
  * @brief Get the number of free elements.
  *
  * @param cb_desc The pointer to the circular buffer descriptor.
diff --git a/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h b/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h
index 24cd99a659ca..dce8dd23b47c 100644
--- a/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h
+++ b/drivers/staging/media/atomisp/pci/camera/util/interface/ia_css_util.h
@@ -81,7 +81,7 @@ bool ia_css_util_res_leq(
     struct ia_css_resolution b);
 
 /* ISP2401 */
-/**
+/*
  * @brief Check if resolution is zero
  *
  * @param[in] resolution The resolution to check
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
index 989f55bec519..43bb352a8e05 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
@@ -21,7 +21,7 @@
  * Device level interface (DLI).
  *
  *****************************************************/
-/**
+/*
  * @brief Load the register value.
  * Refer to "csi_rx_public.h" for details.
  */
@@ -35,7 +35,7 @@ static inline hrt_data csi_rx_fe_ctrl_reg_load(
 					     hrt_data));
 }
 
-/**
+/*
  * @brief Store a value to the register.
  * Refer to "ibuf_ctrl_public.h" for details.
  */
@@ -51,7 +51,7 @@ static inline void csi_rx_fe_ctrl_reg_store(
 				   value);
 }
 
-/**
+/*
  * @brief Load the register value.
  * Refer to "csi_rx_public.h" for details.
  */
@@ -65,7 +65,7 @@ static inline hrt_data csi_rx_be_ctrl_reg_load(
 					     hrt_data));
 }
 
-/**
+/*
  * @brief Store a value to the register.
  * Refer to "ibuf_ctrl_public.h" for details.
  */
@@ -88,7 +88,7 @@ static inline void csi_rx_be_ctrl_reg_store(
  * Native command interface (NCI).
  *
  *****************************************************/
-/**
+/*
  * @brief Get the state of the csi rx fe dlane process.
  * Refer to "csi_rx_public.h" for details.
  */
@@ -103,7 +103,7 @@ static inline void csi_rx_fe_ctrl_get_dlane_state(
 	    csi_rx_fe_ctrl_reg_load(ID, _HRT_CSI_RX_DLY_CNT_SETTLE_DLANE_REG_IDX(lane));
 }
 
-/**
+/*
  * @brief Get the csi rx fe state.
  * Refer to "csi_rx_public.h" for details.
  */
@@ -142,7 +142,7 @@ static inline void csi_rx_fe_ctrl_get_state(
 	}
 }
 
-/**
+/*
  * @brief dump the csi rx fe state.
  * Refer to "csi_rx_public.h" for details.
  */
@@ -180,7 +180,7 @@ static inline void csi_rx_fe_ctrl_dump_state(
 	}
 }
 
-/**
+/*
  * @brief Get the csi rx be state.
  * Refer to "csi_rx_public.h" for details.
  */
@@ -243,7 +243,7 @@ static inline void csi_rx_be_ctrl_get_state(
 	}
 }
 
-/**
+/*
  * @brief Dump the csi rx be state.
  * Refer to "csi_rx_public.h" for details.
  */
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
index 4bd8209aaa01..85439d561ba3 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
@@ -15,7 +15,7 @@
  |             Native command interface (NCI)             |
  + -------------------------------------------------------*/
 
-/**
+/*
 * @brief Get the isys irq status.
 * Refer to "isys_irq.h" for details.
 */
@@ -34,7 +34,7 @@ void isys_irqc_state_get(
 	*/
 }
 
-/**
+/*
 * @brief Dump the isys irq status.
 * Refer to "isys_irq.h" for details.
 */
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h
index 8e295cd78129..88a763365631 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_stream2mmio_private.h
@@ -27,7 +27,7 @@
  * Native command interface (NCI).
  *
  *****************************************************/
-/**
+/*
  * @brief Get the stream2mmio-controller state.
  * Refer to "stream2mmio_public.h" for details.
  */
@@ -45,7 +45,7 @@ STORAGE_CLASS_STREAM2MMIO_C void stream2mmio_get_state(
 		stream2mmio_get_sid_state(ID, i, &state->sid_state[i]);
 }
 
-/**
+/*
  * @brief Get the state of the stream2mmio-controller sidess.
  * Refer to "stream2mmio_public.h" for details.
  */
@@ -76,7 +76,7 @@ STORAGE_CLASS_STREAM2MMIO_C void stream2mmio_get_sid_state(
 	    stream2mmio_reg_load(ID, sid_id, STREAM2MMIO_BLOCK_WHEN_NO_CMD_REG_ID);
 }
 
-/**
+/*
  * @brief Dump the state of the stream2mmio-controller sidess.
  * Refer to "stream2mmio_public.h" for details.
  */
@@ -92,7 +92,7 @@ STORAGE_CLASS_STREAM2MMIO_C void stream2mmio_print_sid_state(
 	ia_css_print("\t \t block when no cmd 0x%x\n", state->block_when_no_cmd);
 }
 
-/**
+/*
  * @brief Dump the ibuf-controller state.
  * Refer to "stream2mmio_public.h" for details.
  */
@@ -119,7 +119,7 @@ STORAGE_CLASS_STREAM2MMIO_C void stream2mmio_dump_state(
  * Device level interface (DLI).
  *
  *****************************************************/
-/**
+/*
  * @brief Load the register value.
  * Refer to "stream2mmio_public.h" for details.
  */
@@ -137,7 +137,7 @@ STORAGE_CLASS_STREAM2MMIO_C hrt_data stream2mmio_reg_load(
 					 (reg_bank_offset + reg_idx) * sizeof(hrt_data));
 }
 
-/**
+/*
  * @brief Store a value to the register.
  * Refer to "stream2mmio_public.h" for details.
  */
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
index b8b98106bd31..0faf6ffdf55d 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
@@ -16,7 +16,7 @@
  * Device level interface (DLI).
  *
  *****************************************************/
-/**
+/*
  * @brief Load the register value.
  * Refer to "pixelgen_public.h" for details.
  */
@@ -30,7 +30,7 @@ STORAGE_CLASS_PIXELGEN_C hrt_data pixelgen_ctrl_reg_load(
 					     hrt_data));
 }
 
-/**
+/*
  * @brief Store a value to the register.
  * Refer to "pixelgen_ctrl_public.h" for details.
  */
@@ -53,7 +53,7 @@ STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_reg_store(
  * Native command interface (NCI).
  *
  *****************************************************/
-/**
+/*
  * @brief Get the pixelgen state.
  * Refer to "pixelgen_public.h" for details.
  */
@@ -117,7 +117,7 @@ STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_get_state(
 	    pixelgen_ctrl_reg_load(ID, _PXG_TPG_B2_REG_IDX);
 }
 
-/**
+/*
  * @brief Dump the pixelgen state.
  * Refer to "pixelgen_public.h" for details.
  */
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h b/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h
index 59e0b44bfdc3..b5a6a8f0c3d2 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/pixelgen_global.h
@@ -9,7 +9,7 @@
 
 #include <type_support.h>
 
-/**
+/*
  * Pixel-generator. ("pixelgen_global.h")
  */
 /*
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
index 2dc0fb88399f..e4c136660b1e 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/timed_ctrl_global.h
@@ -11,7 +11,7 @@
 
 #include "timed_controller_defs.h"
 
-/**
+/*
  * Order of the input bits for the timed controller taken from
  * ISP_CSS_2401 System Architecture Description valid for
  * 2400, 2401.
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h
index ca33a1e03d8d..f5b0ff414395 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/device_access/device_access.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
index 2002960f078e..e8ce556bfd6a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
@@ -12,7 +12,7 @@
  * Native command interface (NCI).
  *
  *****************************************************/
-/**
+/*
  * @brief Get the csi rx frontend state.
  * Get the state of the csi rx frontend regiester-set.
  *
@@ -22,7 +22,7 @@
 void csi_rx_fe_ctrl_get_state(
     const csi_rx_frontend_ID_t ID,
     csi_rx_fe_ctrl_state_t *state);
-/**
+/*
  * @brief Dump the csi rx frontend state.
  * Dump the state of the csi rx frontend regiester-set.
  *
@@ -32,7 +32,7 @@ void csi_rx_fe_ctrl_get_state(
 void csi_rx_fe_ctrl_dump_state(
     const csi_rx_frontend_ID_t ID,
     csi_rx_fe_ctrl_state_t *state);
-/**
+/*
  * @brief Get the state of the csi rx fe dlane.
  * Get the state of the register set per dlane process.
  *
@@ -44,7 +44,7 @@ void csi_rx_fe_ctrl_get_dlane_state(
     const csi_rx_frontend_ID_t ID,
     const u32 lane,
     csi_rx_fe_ctrl_lane_t *dlane_state);
-/**
+/*
  * @brief Get the csi rx backend state.
  * Get the state of the csi rx backend regiester-set.
  *
@@ -54,7 +54,7 @@ void csi_rx_fe_ctrl_get_dlane_state(
 void csi_rx_be_ctrl_get_state(
     const csi_rx_backend_ID_t ID,
     csi_rx_be_ctrl_state_t *state);
-/**
+/*
  * @brief Dump the csi rx backend state.
  * Dump the state of the csi rx backend regiester-set.
  *
@@ -71,7 +71,7 @@ void csi_rx_be_ctrl_dump_state(
  * Device level interface (DLI).
  *
  *****************************************************/
-/**
+/*
  * @brief Load the register value.
  * Load the value of the register of the csi rx fe.
  *
@@ -83,7 +83,7 @@ void csi_rx_be_ctrl_dump_state(
 hrt_data csi_rx_fe_ctrl_reg_load(
     const csi_rx_frontend_ID_t ID,
     const hrt_address reg);
-/**
+/*
  * @brief Store a value to the register.
  * Store a value to the register of the csi rx fe.
  *
@@ -96,7 +96,7 @@ void csi_rx_fe_ctrl_reg_store(
     const csi_rx_frontend_ID_t ID,
     const hrt_address reg,
     const hrt_data value);
-/**
+/*
  * @brief Load the register value.
  * Load the value of the register of the csirx be.
  *
@@ -108,7 +108,7 @@ void csi_rx_fe_ctrl_reg_store(
 hrt_data csi_rx_be_ctrl_reg_load(
     const csi_rx_backend_ID_t ID,
     const hrt_address reg);
-/**
+/*
  * @brief Store a value to the register.
  * Store a value to the register of the csi rx be.
  *
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h
index 7ed55d427cf6..e4f77e975f4e 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_stream2mmio_public.h
@@ -12,7 +12,7 @@
  * Native command interface (NCI).
  *
  *****************************************************/
-/**
+/*
  * @brief Get the stream2mmio-controller state.
  * Get the state of the stream2mmio-controller regiester-set.
  *
@@ -23,7 +23,7 @@ STORAGE_CLASS_STREAM2MMIO_H void stream2mmio_get_state(
     const stream2mmio_ID_t ID,
     stream2mmio_state_t *state);
 
-/**
+/*
  * @brief Get the state of the stream2mmio-controller sidess.
  * Get the state of the register set per buf-controller sidess.
  *
@@ -42,7 +42,7 @@ STORAGE_CLASS_STREAM2MMIO_H void stream2mmio_get_sid_state(
  * Device level interface (DLI).
  *
  *****************************************************/
-/**
+/*
  * @brief Load the register value.
  * Load the value of the register of the stream2mmio-controller.
  *
@@ -57,7 +57,7 @@ STORAGE_CLASS_STREAM2MMIO_H hrt_data stream2mmio_reg_load(
     const stream2mmio_sid_ID_t sid_id,
     const uint32_t reg_idx);
 
-/**
+/*
  * @brief Dump the SID processor state.
  * Dump the state of the sid regiester-set.
  *
@@ -65,7 +65,7 @@ STORAGE_CLASS_STREAM2MMIO_H hrt_data stream2mmio_reg_load(
  */
 STORAGE_CLASS_STREAM2MMIO_H void stream2mmio_print_sid_state(
     stream2mmio_sid_state_t	*state);
-/**
+/*
  * @brief Dump the stream2mmio state.
  * Dump the state of the ibuf-controller regiester-set.
  *
@@ -75,7 +75,7 @@ STORAGE_CLASS_STREAM2MMIO_H void stream2mmio_print_sid_state(
 STORAGE_CLASS_STREAM2MMIO_H void stream2mmio_dump_state(
     const stream2mmio_ID_t ID,
     stream2mmio_state_t *state);
-/**
+/*
  * @brief Store a value to the register.
  * Store a value to the registe of the stream2mmio-controller.
  *
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
index dc31ce3cd741..6aabf0b1995f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/pixelgen_public.h
@@ -12,7 +12,7 @@
  * Native command interface (NCI).
  *
  *****************************************************/
-/**
+/*
  * @brief Get the pixelgen state.
  * Get the state of the pixelgen regiester-set.
  *
@@ -22,7 +22,7 @@
 STORAGE_CLASS_PIXELGEN_H void pixelgen_ctrl_get_state(
     const pixelgen_ID_t ID,
     pixelgen_ctrl_state_t *state);
-/**
+/*
  * @brief Dump the pixelgen state.
  * Dump the state of the pixelgen regiester-set.
  *
@@ -39,7 +39,7 @@ STORAGE_CLASS_PIXELGEN_H void pixelgen_ctrl_dump_state(
  * Device level interface (DLI).
  *
  *****************************************************/
-/**
+/*
  * @brief Load the register value.
  * Load the value of the register of the pixelgen
  *
@@ -51,7 +51,7 @@ STORAGE_CLASS_PIXELGEN_H void pixelgen_ctrl_dump_state(
 STORAGE_CLASS_PIXELGEN_H hrt_data pixelgen_ctrl_reg_load(
     const pixelgen_ID_t ID,
     const hrt_address reg);
-/**
+/*
  * @brief Store a value to the register.
  * Store a value to the registe of the pixelgen
  *
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/tag_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/tag_public.h
index ad83ff97bbd6..1652c9f79349 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/tag_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/tag_public.h
@@ -7,7 +7,7 @@
 #ifndef __TAG_PUBLIC_H_INCLUDED__
 #define __TAG_PUBLIC_H_INCLUDED__
 
-/**
+/*
  * @brief	Creates the tag description from the given parameters.
  * @param[in]	num_captures
  * @param[in]	skip
@@ -21,7 +21,7 @@ sh_css_create_tag_descr(int num_captures,
 			unsigned int exp_id,
 			struct sh_css_tag_descr *tag_descr);
 
-/**
+/*
  * @brief	Encodes the members of tag description into a 32-bit value.
  * @param[in]	tag		Pointer to the tag description
  * @return	(unsigned int)	Encoded 32-bit tag-info
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
index 473d8d4fb9ba..20a5faad0716 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
@@ -7,7 +7,7 @@
 #ifndef __PLATFORM_SUPPORT_H_INCLUDED__
 #define __PLATFORM_SUPPORT_H_INCLUDED__
 
-/**
+/*
 * @file
 * Platform specific includes and functionality.
 */
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
index 097be6bd3cb5..cbd290121a28 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/type_support.h
@@ -7,7 +7,7 @@
 #ifndef __TYPE_SUPPORT_H_INCLUDED__
 #define __TYPE_SUPPORT_H_INCLUDED__
 
-/**
+/*
 * @file
 * Platform specific types.
 *
diff --git a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
index 7acfedb541d8..936b17950b3a 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_frame_public.h
@@ -119,7 +119,7 @@ struct ia_css_frame_info {
 	.raw_bayer_order	= IA_CSS_BAYER_ORDER_NUM, \
 }
 
-/**
+/*
  *  Specifies the DVS loop delay in "frame periods"
  */
 enum ia_css_frame_delay {
diff --git a/drivers/staging/media/atomisp/pci/ia_css_host_data.h b/drivers/staging/media/atomisp/pci/ia_css_host_data.h
index 0e45650cc1ab..547542577902 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_host_data.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_host_data.h
@@ -10,7 +10,7 @@
 
 #include <ia_css_types.h>	/* ia_css_pipe */
 
-/**
+/*
  * @brief Allocate structure ia_css_host_data.
  *
  * @param[in]	size		Size of the requested host data
@@ -22,7 +22,7 @@
 struct ia_css_host_data *
 ia_css_host_data_allocate(size_t size);
 
-/**
+/*
  * @brief Free structure ia_css_host_data.
  *
  * @param[in]	me	Pointer to structure, if a NULL is passed functions
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
index 2bb06b0ff5db..1d1b704b2bc6 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
@@ -44,7 +44,7 @@ enum ia_css_pipe_mode {
 /* Temporary define  */
 #define IA_CSS_PIPE_MODE_NUM (IA_CSS_PIPE_MODE_YUVPP + 1)
 
-/**
+/*
  * Enumeration of pipe versions.
  * the order should match with definition in sh_css_defs.h
  */
@@ -55,7 +55,7 @@ enum ia_css_pipe_version {
 	IA_CSS_PIPE_VERSION_2_7 = 4		/** ISP2.7 pipe */
 };
 
-/**
+/*
  * Pipe configuration structure.
  * Resolution properties are filled by Driver, kernel configurations are
  * set by AIC
@@ -123,7 +123,7 @@ struct ia_css_pipe_config {
 		   to retrieve shading gains which correspond to bayer data. */
 };
 
-/**
+/*
  * Default settings for newly created pipe configurations.
  */
 #define DEFAULT_PIPE_CONFIG { \
@@ -175,7 +175,7 @@ struct ia_css_pipe_info {
 	     output at the first valid frame. */
 };
 
-/**
+/*
  * Defaults for ia_css_pipe_info structs.
  */
 #define DEFAULT_PIPE_INFO {\
diff --git a/drivers/staging/media/atomisp/pci/ia_css_prbs.h b/drivers/staging/media/atomisp/pci/ia_css_prbs.h
index abdbcb8fda53..3bb1e5dbb4fc 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_prbs.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_prbs.h
@@ -19,7 +19,7 @@ enum ia_css_prbs_id {
 	IA_CSS_PRBS_ID2
 };
 
-/**
+/*
  * Maximum number of PRBS IDs.
  *
  * Make sure the value of this define gets changed to reflect the correct
@@ -27,7 +27,7 @@ enum ia_css_prbs_id {
  */
 #define N_CSS_PRBS_IDS (IA_CSS_PRBS_ID2 + 1)
 
-/**
+/*
  * PRBS configuration structure.
  *
  * Seed the for the Pseudo Random Bit Sequence.
diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream.h b/drivers/staging/media/atomisp/pci/ia_css_stream.h
index c8de632a8e12..578dc45785fc 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream.h
@@ -13,7 +13,7 @@
 #include "ia_css_types.h"
 #include "ia_css_stream_public.h"
 
-/**
+/*
  * structure to hold all internal stream related information
  */
 struct ia_css_stream {
diff --git a/drivers/staging/media/atomisp/pci/ia_css_timer.h b/drivers/staging/media/atomisp/pci/ia_css_timer.h
index da752834adf4..5c73e8c61588 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_timer.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_timer.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
@@ -42,7 +42,10 @@ struct ia_css_time_meas {
 	clock_value_t	end_timer_value;	/** measured time in ticks */
 };
 
-/**@brief SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT checks to ensure correct alignment for struct ia_css_clock_tick. */
+/*
+ * @brief SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT checks to ensure correct alignment
+ * for struct ia_css_clock_tick.
+ */
 #define SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT sizeof(clock_value_t)
 /* @brief checks to ensure correct alignment for ia_css_time_meas. */
 #define SIZE_OF_IA_CSS_TIME_MEAS_STRUCT (sizeof(clock_value_t) \
diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
index 2b7db9cda23a..7065eded7a33 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
@@ -53,7 +53,7 @@
 #include "isp/kernels/output/output_1.0/ia_css_output_types.h"
 
 #define IA_CSS_DVS_STAT_GRID_INFO_SUPPORTED
-/** Should be removed after Driver adaptation will be done */
+/* Should be removed after Driver adaptation will be done */
 
 #define IA_CSS_VERSION_MAJOR    2
 #define IA_CSS_VERSION_MINOR    0
@@ -421,7 +421,7 @@ struct ia_css_dvs_6axis_config {
 	u32 *ycoords_uv;
 };
 
-/**
+/*
  * This specifies the coordinates (x,y)
  */
 struct ia_css_point {
@@ -429,7 +429,7 @@ struct ia_css_point {
 	s32 y; /** y coordinate */
 };
 
-/**
+/*
  * Digital zoom:
  * This feature is currently available only for video, but will become
  * available for preview and capture as well.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h
index 374261d25520..ee2cf2877b7d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/conversion/conversion_1.0/ia_css_conversion_types.h
@@ -7,7 +7,7 @@
 #ifndef __IA_CSS_CONVERSION_TYPES_H
 #define __IA_CSS_CONVERSION_TYPES_H
 
-/**
+/*
  *  Conversion Kernel parameters.
  *  Deinterleave bayer quad into isys format
  *
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h
index 0b977eb7ad71..bbd97c71a6fd 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h
@@ -13,7 +13,7 @@
 
 #include "type_support.h"
 
-/**
+/*
  * \brief EED1_8 public parameters.
  * \details Struct with all parameters for the EED1.8 kernel that can be set
  * from the CSS API.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
index e32290d1c86b..d6785724fe97 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
@@ -10,44 +10,46 @@
 
 #define IA_CSS_HDR_MAX_NUM_INPUT_FRAMES         (3)
 
-/**
+/*
  * \brief HDR Irradiance Parameters
  * \detail Currently HDR parameters are used only for testing purposes
  */
 struct ia_css_hdr_irradiance_params {
-	int test_irr;                                          /** Test parameter */
-	int match_shift[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES -
-							1];  /** Histogram matching shift parameter */
-	int match_mul[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES -
-						      1];    /** Histogram matching multiplication parameter */
-	int thr_low[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES -
-						    1];      /** Weight map soft threshold low bound parameter */
-	int thr_high[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES -
-						     1];     /** Weight map soft threshold high bound parameter */
-	int thr_coeff[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES -
-						      1];    /** Soft threshold linear function coefficien */
-	int thr_shift[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES -
-						      1];    /** Soft threshold precision shift parameter */
-	int weight_bpp;                                        /** Weight map bits per pixel */
+	/* Test parameter */
+	int test_irr;
+	/* Histogram matching shift parameter */
+	int match_shift[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES - 1];
+	/* Histogram matching multiplication parameter */
+	int match_mul[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES - 1];
+	/* Weight map soft threshold low bound parameter */
+	int thr_low[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES - 1];
+	/* Weight map soft threshold high bound parameter */
+	int thr_high[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES - 1];
+	/* Soft threshold linear function coefficien */
+	int thr_coeff[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES - 1];
+	/* Soft threshold precision shift parameter */
+	int thr_shift[IA_CSS_HDR_MAX_NUM_INPUT_FRAMES - 1];
+	/* Weight map bits per pixel */
+	int weight_bpp;
 };
 
-/**
+/*
  * \brief HDR Deghosting Parameters
  * \detail Currently HDR parameters are used only for testing purposes
  */
 struct ia_css_hdr_deghost_params {
-	int test_deg; /** Test parameter */
+	int test_deg; /* Test parameter */
 };
 
-/**
+/*
  * \brief HDR Exclusion Parameters
  * \detail Currently HDR parameters are used only for testing purposes
  */
 struct ia_css_hdr_exclusion_params {
-	int test_excl; /** Test parameter */
+	int test_excl; /* Test parameter */
 };
 
-/**
+/*
  * \brief HDR public parameters.
  * \details Struct with all parameters for HDR that can be seet from
  * the CSS API. Currently, only test parameters are defined.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_param.h
index c9a3f7bfaa90..de535503b70e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_param.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_types.h
index c1c93b2245c5..69a40a15264b 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/common/ia_css_common_io_types.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h
index e6ce0cba44b9..72310781cf7e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_param.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_param.h
index 429fcdb73f60..9fabb8b2d3b8 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_param.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_param.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_types.h
index 485ad17cb29b..1daafd96a0cd 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io_types.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h
index 42b760ffac67..676a633336a2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
@@ -12,7 +12,7 @@ Copyright (c) 2010 - 2015, Intel Corporation.
 * CSS-API header file for Temporal Noise Reduction v3 (TNR3) kernel
 */
 
-/**
+/*
  * \brief Number of piecewise linear segments.
  * \details The parameters to TNR3 are specified as a piecewise linear segment.
  * The number of such segments is fixed at 3.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h
index c012c1865d1e..fc4b9033951c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h
@@ -11,25 +11,25 @@
 * CSS-API header file for Extra Noise Reduction (XNR) parameters.
 */
 
-/**
+/*
  * \brief Scale of the XNR sigma parameters.
  * \details The define specifies which fixed-point value represents 1.0.
  */
 #define IA_CSS_XNR3_SIGMA_SCALE  BIT(10)
 
-/**
+/*
  * \brief Scale of the XNR coring parameters.
  * \details The define specifies which fixed-point value represents 1.0.
  */
 #define IA_CSS_XNR3_CORING_SCALE BIT(15)
 
-/**
+/*
  * \brief Scale of the XNR blending parameter.
  * \details The define specifies which fixed-point value represents 1.0.
  */
 #define IA_CSS_XNR3_BLENDING_SCALE BIT(11)
 
-/**
+/*
  * \brief XNR3 Sigma Parameters.
  * \details Sigma parameters define the strength of the XNR filter.
  * A higher number means stronger filtering. There are two values for each of
@@ -46,7 +46,7 @@ struct ia_css_xnr3_sigma_params {
 	int v1;     /** Sigma for V range similarity in bright area */
 };
 
-/**
+/*
  * \brief XNR3 Coring Parameters
  * \details Coring parameters define the "coring" strength, which is a soft
  * thresholding technique to avoid false coloring. There are two values for
@@ -61,7 +61,7 @@ struct ia_css_xnr3_coring_params {
 	int v1;     /** Coring threshold of V channel in bright area */
 };
 
-/**
+/*
  * \brief XNR3 Blending Parameters
  * \details Blending parameters define the blending strength of filtered
  * output pixels with the original chroma pixels from before xnr3. The
@@ -75,7 +75,7 @@ struct ia_css_xnr3_blending_params {
 	int strength;   /** Blending strength */
 };
 
-/**
+/*
  * \brief XNR3 public parameters.
  * \details Struct with all parameters for the XNR3 kernel that can be set
  * from the CSS API.
diff --git a/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h b/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
index 6a0257359e69..d6ed1fbb0e8e 100644
--- a/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
+++ b/drivers/staging/media/atomisp/pci/isp/modes/interface/input_buf.isp.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
index 9c682f2ecbb2..5f768af9bc1d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq.h b/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq.h
index 3e7dadca6d70..618172f17b63 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq.h
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/interface/ia_css_bufq.h
@@ -13,7 +13,7 @@
 #include "ia_css_err.h"
 #define BUFQ_EVENT_SIZE 4
 
-/**
+/*
  * @brief Query the internal frame ID.
  *
  * @param[in]	key	The query key.
@@ -29,7 +29,7 @@ bool ia_css_query_internal_queue_id(
     enum sh_css_queue_id *val
 );
 
-/**
+/*
  * @brief  Map buffer type to a internal queue id.
  *
  * @param[in] thread id		Thread in which the buffer type has to be mapped or unmapped
@@ -43,13 +43,13 @@ void ia_css_queue_map(
     bool map
 );
 
-/**
+/*
  * @brief  Initialize buffer type to a queue id mapping
  * @return none
  */
 void ia_css_queue_map_init(void);
 
-/**
+/*
  * @brief initializes bufq module
  * It create instances of
  * -host to SP buffer queue  which is a list with predefined size,
@@ -62,7 +62,7 @@ void ia_css_queue_map_init(void);
  */
 void ia_css_bufq_init(void);
 
-/**
+/*
 * @brief Enqueues an item into host to SP buffer queue
  *
  * @param thread_index[in]	Thread in which the item to be enqueued
@@ -77,7 +77,7 @@ int ia_css_bufq_enqueue_buffer(
     int queue_id,
     uint32_t item);
 
-/**
+/*
 * @brief Dequeues an item from SP to host buffer queue.
  *
  * @param queue_id[in]		Specifies  the index of the queue in the list where
@@ -90,7 +90,7 @@ int ia_css_bufq_dequeue_buffer(
     int queue_id,
     uint32_t *item);
 
-/**
+/*
 * @brief  Enqueue an event item into host to SP communication event queue.
  *
  * @param[in]	evt_id		      The event ID.
@@ -107,7 +107,7 @@ int ia_css_bufq_enqueue_psys_event(
     uint8_t evt_payload_2
 );
 
-/**
+/*
  * @brief   Dequeue an item from  SP to host communication event queue.
  *
  * @param item	Object to be dequeued into this item.
@@ -119,7 +119,7 @@ int ia_css_bufq_dequeue_psys_event(
 
 );
 
-/**
+/*
  * @brief  Enqueue an event item into host to SP EOF event queue.
  *
  * @param[in]	evt_id		      The event ID.
@@ -129,7 +129,7 @@ int ia_css_bufq_dequeue_psys_event(
 int ia_css_bufq_enqueue_isys_event(
     uint8_t evt_id);
 
-/**
+/*
 * @brief   Dequeue an item from  SP to host communication EOF event queue.
 
  *
@@ -140,7 +140,7 @@ int ia_css_bufq_enqueue_isys_event(
 int ia_css_bufq_dequeue_isys_event(
     u8 item[BUFQ_EVENT_SIZE]);
 
-/**
+/*
 * @brief   Enqueue a tagger command item into tagger command queue..
  *
  * @param item	Object to be enqueue.
@@ -150,7 +150,7 @@ int ia_css_bufq_dequeue_isys_event(
 int ia_css_bufq_enqueue_tag_cmd(
     uint32_t item);
 
-/**
+/*
 * @brief  Uninitializes bufq module.
  *
  * @return	0 or error code upon error.
@@ -158,7 +158,7 @@ int ia_css_bufq_enqueue_tag_cmd(
 */
 int ia_css_bufq_deinit(void);
 
-/**
+/*
 * @brief  Dump queue states
  *
  * @return	None
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index 2d0e906530af..b7ff809eeeab 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -312,7 +312,7 @@ void ia_css_debug_dump_stream_config(
     const struct ia_css_stream_config *config,
     int num_pipes);
 
-/**
+/*
  * @brief Initialize the debug mode.
  *
  * WARNING:
@@ -324,7 +324,7 @@ void ia_css_debug_dump_stream_config(
  */
 bool ia_css_debug_mode_init(void);
 
-/**
+/*
  * @brief Disable the DMA channel.
  *
  * @param[in]	dma_ID		The ID of the target DMA.
@@ -344,7 +344,7 @@ bool ia_css_debug_mode_disable_dma_channel(
     int dma_ID,
     int channel_id,
     int request_type);
-/**
+/*
  * @brief Enable the DMA channel.
  *
  * @param[in]	dma_ID		The ID of the target DMA.
@@ -363,7 +363,7 @@ bool ia_css_debug_mode_enable_dma_channel(
     int channel_id,
     int request_type);
 
-/**
+/*
  * @brief Dump tracer data.
  * [Currently support is only for SKC]
  *
@@ -373,7 +373,7 @@ bool ia_css_debug_mode_enable_dma_channel(
 void ia_css_debug_dump_trace(void);
 
 /* ISP2401 */
-/**
+/*
  * @brief Program counter dumping (in loop)
  *
  * @param[in]	id		The ID of the SP
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_pipe.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_pipe.h
index 80c58cb934d5..6f6cd77ce91d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_pipe.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug_pipe.h
@@ -13,21 +13,21 @@
 #include <ia_css_stream_public.h>
 #include "ia_css_pipeline.h"
 
-/**
+/*
  * @brief Internal debug support for constructing a pipe graph.
  *
  * @return	None
  */
 void ia_css_debug_pipe_graph_dump_prologue(void);
 
-/**
+/*
  * @brief Internal debug support for constructing a pipe graph.
  *
  * @return	None
  */
 void ia_css_debug_pipe_graph_dump_epilogue(void);
 
-/**
+/*
  * @brief Internal debug support for constructing a pipe graph.
  * @param[in]	stage		Pipeline stage.
  * @param[in]	id		Pipe id.
@@ -38,7 +38,7 @@ void ia_css_debug_pipe_graph_dump_stage(
     struct ia_css_pipeline_stage *stage,
     enum ia_css_pipe_id id);
 
-/**
+/*
  * @brief Internal debug support for constructing a pipe graph.
  * @param[in]	out_frame	Output frame of SP raw copy.
  *
@@ -47,7 +47,7 @@ void ia_css_debug_pipe_graph_dump_stage(
 void ia_css_debug_pipe_graph_dump_sp_raw_copy(
     struct ia_css_frame *out_frame);
 
-/**
+/*
  * @brief Internal debug support for constructing a pipe graph.
  * @param[in]	stream_config	info about sensor and input formatter.
  *
diff --git a/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h b/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h
index 9b058e296c93..f8ce32e9b90d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h
+++ b/drivers/staging/media/atomisp/pci/runtime/eventq/interface/ia_css_eventq.h
@@ -9,7 +9,7 @@
 
 #include "ia_css_queue.h"	/* queue APIs */
 
-/**
+/*
  * @brief HOST receives event from SP.
  *
  * @param[in]	eventq_handle	eventq_handle.
@@ -22,7 +22,7 @@ int ia_css_eventq_recv(
     ia_css_queue_t *eventq_handle,
     uint8_t *payload);
 
-/**
+/*
  * @brief The Host sends the event to SP.
  * The caller of this API will be blocked until the event
  * is sent.
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
index d6d60508c1bf..095d1853670f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/interface/ia_css_isp_param_types.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/**
+/*
 Support for Intel Camera Imaging ISP subsystem.
 Copyright (c) 2010 - 2015, Intel Corporation.
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
index 29eebe8f9078..8870ff294c1e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
@@ -15,7 +15,7 @@
 #include <system_global.h>
 #include "ia_css_isys_comm.h"
 
-/**
+/*
  * Virtual Input System. (Input System 2401)
  */
 typedef isp2401_input_system_cfg_t	ia_css_isys_descr_t;
@@ -28,7 +28,7 @@ enum mipi_port_id ia_css_isys_port_to_mipi_port(
     enum mipi_port_id api_port);
 
 
-/**
+/*
  * @brief Register one (virtual) stream. This is used to track when all
  * virtual streams are configured inside the input system. The CSI RX is
  * only started when all registered streams are configured.
@@ -43,7 +43,7 @@ int ia_css_isys_csi_rx_register_stream(
     enum mipi_port_id port,
     uint32_t isys_stream_id);
 
-/**
+/*
  * @brief Unregister one (virtual) stream. This is used to track when all
  * virtual streams are configured inside the input system. The CSI RX is
  * only started when all registered streams are configured.
@@ -97,7 +97,7 @@ int ia_css_isys_convert_stream_format_to_mipi_format(
     mipi_predictor_t compression,
     unsigned int *fmt_type);
 
-/**
+/*
  * Virtual Input System. (Input System 2401)
  */
 ia_css_isys_error_t ia_css_isys_stream_create(
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
index 8b7cbf31a1a2..04d9f1fdb5b0 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
@@ -219,7 +219,7 @@ int ia_css_pipeline_get_output_stage(
  */
 bool ia_css_pipeline_uses_params(struct ia_css_pipeline *pipeline);
 
-/**
+/*
  * @brief get the SP thread ID.
  *
  * @param[in]	key	The query key, typical use is pipe_num.
@@ -231,7 +231,7 @@ bool ia_css_pipeline_uses_params(struct ia_css_pipeline *pipeline);
  */
 bool ia_css_pipeline_get_sp_thread_id(unsigned int key, unsigned int *val);
 
-/**
+/*
  * @brief Get the pipeline io status
  *
  * @param[in] None
@@ -240,7 +240,7 @@ bool ia_css_pipeline_get_sp_thread_id(unsigned int key, unsigned int *val);
  */
 struct sh_css_sp_pipeline_io_status *ia_css_pipeline_get_pipe_io_status(void);
 
-/**
+/*
  * @brief Map an SP thread to this pipeline
  *
  * @param[in]	pipe_num
@@ -249,7 +249,7 @@ struct sh_css_sp_pipeline_io_status *ia_css_pipeline_get_pipe_io_status(void);
  */
 void ia_css_pipeline_map(unsigned int pipe_num, bool map);
 
-/**
+/*
  * @brief Checks whether the pipeline is mapped to SP threads
  *
  * @param[in]	Query key, typical use is pipe_num
@@ -260,7 +260,7 @@ void ia_css_pipeline_map(unsigned int pipe_num, bool map);
  */
 bool ia_css_pipeline_is_mapped(unsigned int key);
 
-/**
+/*
  * @brief Print pipeline thread mapping
  *
  * @param[in]	none
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
index 00b903d950df..4c86c19811bb 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
@@ -17,12 +17,12 @@
 #define STORAGE_CLASS_RMGR_C static inline
 #endif				/* __INLINE_RMGR__ */
 
-/**
+/*
  * @brief Initialize resource manager (host/common)
  */
 int ia_css_rmgr_init(void);
 
-/**
+/*
  * @brief Uninitialize resource manager (host/common)
  */
 void ia_css_rmgr_uninit(void);
diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
index 6820bfc77432..68285334bc88 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h
@@ -12,7 +12,7 @@
 #include <ia_css_types.h>
 #include <system_local.h>
 
-/**
+/*
  * @brief Data structure for the resource handle (host, vbuf)
  */
 struct ia_css_rmgr_vbuf_handle {
@@ -21,7 +21,7 @@ struct ia_css_rmgr_vbuf_handle {
 	u32 size;
 };
 
-/**
+/*
  * @brief Data structure for the resource pool (host, vbuf)
  */
 struct ia_css_rmgr_vbuf_pool {
@@ -32,14 +32,14 @@ struct ia_css_rmgr_vbuf_pool {
 	struct ia_css_rmgr_vbuf_handle **handles;
 };
 
-/**
+/*
  * @brief VBUF resource pools
  */
 extern struct ia_css_rmgr_vbuf_pool *vbuf_ref;
 extern struct ia_css_rmgr_vbuf_pool *vbuf_write;
 extern struct ia_css_rmgr_vbuf_pool *hmm_buffer_pool;
 
-/**
+/*
  * @brief Initialize the resource pool (host, vbuf)
  *
  * @param pool	The pointer to the pool
@@ -47,7 +47,7 @@ extern struct ia_css_rmgr_vbuf_pool *hmm_buffer_pool;
 STORAGE_CLASS_RMGR_H int ia_css_rmgr_init_vbuf(
     struct ia_css_rmgr_vbuf_pool *pool);
 
-/**
+/*
  * @brief Uninitialize the resource pool (host, vbuf)
  *
  * @param pool	The pointer to the pool
@@ -55,7 +55,7 @@ STORAGE_CLASS_RMGR_H int ia_css_rmgr_init_vbuf(
 STORAGE_CLASS_RMGR_H void ia_css_rmgr_uninit_vbuf(
     struct ia_css_rmgr_vbuf_pool *pool);
 
-/**
+/*
  * @brief Acquire a handle from the pool (host, vbuf)
  *
  * @param pool		The pointer to the pool
@@ -65,7 +65,7 @@ STORAGE_CLASS_RMGR_H void ia_css_rmgr_acq_vbuf(
     struct ia_css_rmgr_vbuf_pool *pool,
     struct ia_css_rmgr_vbuf_handle **handle);
 
-/**
+/*
  * @brief Release a handle to the pool (host, vbuf)
  *
  * @param pool		The pointer to the pool
@@ -75,14 +75,14 @@ STORAGE_CLASS_RMGR_H void ia_css_rmgr_rel_vbuf(
     struct ia_css_rmgr_vbuf_pool *pool,
     struct ia_css_rmgr_vbuf_handle **handle);
 
-/**
+/*
  * @brief Retain the reference count for a handle (host, vbuf)
  *
  * @param handle	The pointer to the handle
  */
 void ia_css_rmgr_refcount_retain_vbuf(struct ia_css_rmgr_vbuf_handle **handle);
 
-/**
+/*
  * @brief Release the reference count for a handle (host, vbuf)
  *
  * @param handle	The pointer to the handle
diff --git a/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h b/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h
index 79006c325de6..9208c650fde7 100644
--- a/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h
+++ b/drivers/staging/media/atomisp/pci/runtime/tagger/interface/ia_css_tagger_common.h
@@ -10,14 +10,14 @@
 #include <system_local.h>
 #include <type_support.h>
 
-/**
+/*
  * @brief The tagger's circular buffer.
  *
  * Should be one less than NUM_CONTINUOUS_FRAMES in sh_css_internal.h
  */
 #define MAX_CB_ELEMS_FOR_TAGGER 14
 
-/**
+/*
  * @brief Data structure for the tagger buffer element.
  */
 typedef struct {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 9155a83fcc03..ec68c16d4272 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -80,7 +80,7 @@
 
 #define SH_CSS_MAX_SP_THREADS		5
 
-/**
+/*
  * The C99 standard does not specify the exact object representation of structs;
  * the representation is compiler dependent.
  *
@@ -638,7 +638,7 @@ struct sh_css_sp_output {
 	unsigned int		sw_interrupt_value[SH_CSS_NUM_SDW_IRQS];
 };
 
-/**
+/*
  * @brief Data structure for the circular buffer.
  * The circular buffer is empty if "start == end". The
  * circular buffer is full if "(end + 1) % size == start".
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.h b/drivers/staging/media/atomisp/pci/sh_css_sp.h
index 78aec5b7e8fa..6985ca200f09 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.h
@@ -68,7 +68,7 @@ sh_css_read_host2sp_command(void);
 void
 sh_css_init_host2sp_frame_data(void);
 
-/**
+/*
  * @brief Update the offline frame information in host_sp_communication.
  *
  * @param[in] frame_num The offline frame number.
@@ -80,7 +80,7 @@ sh_css_update_host2sp_offline_frame(
     struct ia_css_frame *frame,
     struct ia_css_metadata *metadata);
 
-/**
+/*
  * @brief Update the mipi frame information in host_sp_communication.
  *
  * @param[in] frame_num The mipi frame number.
@@ -91,7 +91,7 @@ sh_css_update_host2sp_mipi_frame(
     unsigned int frame_num,
     struct ia_css_frame *frame);
 
-/**
+/*
  * @brief Update the mipi metadata information in host_sp_communication.
  *
  * @param[in] frame_num The mipi frame number.
@@ -102,7 +102,7 @@ sh_css_update_host2sp_mipi_metadata(
     unsigned int frame_num,
     struct ia_css_metadata *metadata);
 
-/**
+/*
  * @brief Update the nr of mipi frames to use in host_sp_communication.
  *
  * @param[in] num_frames The number of mipi frames to use.
@@ -110,7 +110,7 @@ sh_css_update_host2sp_mipi_metadata(
 void
 sh_css_update_host2sp_num_mipi_frames(unsigned int num_frames);
 
-/**
+/*
  * @brief Update the nr of offline frames to use in host_sp_communication.
  *
  * @param[in] num_frames The number of raw frames to use.
@@ -170,7 +170,7 @@ sh_css_sp_set_disable_continuous_viewfinder(bool flag);
 void
 sh_css_sp_reset_global_vars(void);
 
-/**
+/*
  * @brief Initialize the DMA software-mask in the debug mode.
  * This API should be ONLY called in the debugging mode.
  * And it should be always called before the first call of
@@ -185,7 +185,7 @@ sh_css_sp_reset_global_vars(void);
 bool
 sh_css_sp_init_dma_sw_reg(int dma_id);
 
-/**
+/*
  * @brief Set the DMA software-mask in the debug mode.
  * This API should be ONLYL called in the debugging mode. Must
  * call "sh_css_set_dma_sw_reg(...)" before this
diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index e8a29f73d67a..ee1d9b66ccb1 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -293,7 +293,7 @@ typedef enum {
 } stream2mmio_sid_ID_t;
 /* end of Stream2MMIO */
 
-/**
+/*
  * Input System 2401: CSI-MIPI recevier.
  */
 typedef enum {
@@ -324,7 +324,7 @@ typedef enum {
 	N_ISYS2401_DMA_ID
 } isys2401_dma_ID_t;
 
-/**
+/*
  * Pixel-generator. ("system_global.h")
  */
 typedef enum {

-- 
2.55.0.rc0.799.gd6f94ed593-goog


