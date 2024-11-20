Return-Path: <linux-media+bounces-21689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7F09D4235
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 19:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 226ED1F22863
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 18:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3742027447;
	Wed, 20 Nov 2024 18:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dB2NvQBY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E399D13CFB6
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 18:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732128537; cv=none; b=DDr0j6UTeqaXy86SuLx/inHSWgsjY5rJoXyL037gMThsGdLDGyrIMe/sif8pN9w3s4Xr/1ExlV5MbEpKeFPO8JwsN0Ye/zCHqz1mTxbSeXTBZYU777T/1w26GSGcdMAKVyzZq2/T8tTZHR3FAqdyEjrP7R1lwNWI3d3U3xjcwOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732128537; c=relaxed/simple;
	bh=bpSwTH3VCFW286/EkgpggkVWsWi/MkeBa14ZNeDR5Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eCo18pZQdy2D3CeLXwQo1XFO1GhF5Zwxvj8Aa+5soNSdoj041t3REBYfJ0XAfgE2SxRa4gI3I1X9UADxfjMkVw8A54peZf0tNpAAwNHHA/l+ehvzEKqatEAWRD+zIe/zy4J+qGbdvRopjk+4qQ1h+GGsYgSc4FKvMuqor7VTv3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dB2NvQBY; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ee59ae27dfso39640687b3.2
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 10:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732128535; x=1732733335; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jyo9uHdsDRvO9JCUJf/cFAgsRiGbZJUiKDQ5eFP0vFQ=;
        b=dB2NvQBY+qWB3HHFZSZwbd98fpEtZI1di5+moohlw+AEEOT/E8nWmY99s9+Lza1Cqk
         uP33k9KBRCcu4xs38rFiRi84HrqSu4UJSMMyDexRW8b4S+9I4dAy6Ni+BWLE2l5Bbree
         zP886N39vxngt+tnRiKuoCLYYWyidH/IJcsvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732128535; x=1732733335;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jyo9uHdsDRvO9JCUJf/cFAgsRiGbZJUiKDQ5eFP0vFQ=;
        b=WWHJpax9jvBmj8kzeuSuaXw3LogghYiGi6itM/d6TcUMZURldDzrxoCSZ6/uugYYZJ
         c6Trx5mYn82gCc7X4dR8U31DxrNO/SOxgq2inN4A4K6QWLvdSO+SIxQX+OuNx1CpDn09
         bNKBxL+yYkjU4l6+hX7wQmxFZw3AoVje4aiN8ixU029aB2c+wEpdtdXG+ShOwcZk9mdy
         RqeDfVorF+SVyG6ogUhsIoc7TgXmmsJW9UzR6tnXGy6Oqp7XIaZK4MTMFmK4U3AWGSbB
         NdnNazlR206ZHoHPb9AlWozKfdeDV/XR6V7oNxsbh8iN9AmS72Fm70rcSm6KptasDmce
         XmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSLHZAlPHhO88CyLi8REO5r20XJpQbbh0f6aRJTGHDpkFcu4fivLcpQae/sGYkmqE03MzjNQ+yXFLSbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPiezezgz34POu9bjCVUcrFOmhn4okODpabFr5CHxZNtf2TAHT
	ZeYbQ0/ekqJpC7r1xZS0n8m0EfjMnKZ6bshz7sTlo+p3WYl1xWymXLBtoqT5LA==
X-Google-Smtp-Source: AGHT+IHGsq6NiruhFseMoVnF8wMbcsUf+T0AOOcgyYSqs2mT1rqSRRNZm9dcvH7mNcwpyUeIGWNQhA==
X-Received: by 2002:a05:690c:6286:b0:6dd:ce14:a245 with SMTP id 00721157ae682-6eebd0de2a6mr41565167b3.6.1732128534911;
        Wed, 20 Nov 2024 10:48:54 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d4380dc403sm13805276d6.52.2024.11.20.10.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 10:48:54 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 20 Nov 2024 18:48:50 +0000
Subject: [PATCH] Android.mk: Remove obsolete build files
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-removeabp-v1-1-cb34d2ca0d08@chromium.org>
X-B4-Tracking: v=1; b=H4sIABEvPmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMD3aLU3Pyy1MSkAl1jA/M0k2SLZLPENCMloPqCotS0zAqwWdGxtbU
 ARD3WiVsAAAA=
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Paramanand Singh <paramanand.singh@linaro.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Android.mk files are been obsoleted by Android.bp. Remove the Android.mk
files.
https://android.googlesource.com/platform/build/+/HEAD/Deprecation.md

I have no way to test them and I suspect that they do not work. Eg:
It does not seem to create the media-bus-format-codes.h file.

Cc: Paramanand Singh <paramanand.singh@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 lib/Android.mk                   |  4 ---
 lib/libv4l2/Android.mk           | 32 ------------------------
 lib/libv4lconvert/Android.mk     | 54 ----------------------------------------
 utils/v4l2-compliance/Android.mk | 27 --------------------
 utils/v4l2-ctl/Android.mk        | 27 --------------------
 utils/v4l2-dbg/Android.mk        | 20 ---------------
 6 files changed, 164 deletions(-)

diff --git a/lib/Android.mk b/lib/Android.mk
deleted file mode 100644
index 2e431205..00000000
--- a/lib/Android.mk
+++ /dev/null
@@ -1,4 +0,0 @@
-LOCAL_PATH:= $(call my-dir)
-include $(CLEAR_VARS)
-
-include $(call all-makefiles-under,$(LOCAL_PATH))
diff --git a/lib/libv4l2/Android.mk b/lib/libv4l2/Android.mk
deleted file mode 100644
index c57626cb..00000000
--- a/lib/libv4l2/Android.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-LOCAL_PATH:= $(call my-dir)
-
-include $(CLEAR_VARS)
-
-LOCAL_SRC_FILES := \
-    log.c \
-    libv4l2.c \
-    v4l2convert.c \
-    v4l2-plugin-android.c
-
-LOCAL_CFLAGS += -Wno-missing-field-initializers
-LOCAL_CFLAGS += -Wno-sign-compare
-LOCAL_CFLAGS += -include ../../android-config.h
-
-LOCAL_C_INCLUDES := \
-    $(LOCAL_PATH)/../include \
-    $(LOCAL_PATH)/../../include \
-    $(LOCAL_PATH)/../.. \
-	$(TOP)/bionic/libc/upstream-openbsd/lib/libc/gen
-
-LOCAL_SHARED_LIBRARIES := \
-    libutils \
-    libcutils \
-    libdl \
-    libssl \
-    libz
-
-LOCAL_STATIC_LIBRARIES := libv4l_convert
-LOCAL_MODULE := libv4l2
-LOCAL_MODULE_TAGS := optional
-
-include $(BUILD_SHARED_LIBRARY)
diff --git a/lib/libv4lconvert/Android.mk b/lib/libv4lconvert/Android.mk
deleted file mode 100644
index fc0d1aba..00000000
--- a/lib/libv4lconvert/Android.mk
+++ /dev/null
@@ -1,54 +0,0 @@
-LOCAL_PATH:= $(call my-dir)
-
-include $(CLEAR_VARS)
-
-LOCAL_SRC_FILES := \
-    bayer.c \
-    cpia1.c \
-    crop.c \
-    flip.c \
-    helper.c \
-    nv12_16l16.c \
-    jidctflt.c \
-    jl2005bcd.c \
-    jpeg.c \
-    jpeg_memsrcdest.c \
-    jpgl.c \
-    libv4lconvert.c \
-    mr97310a.c \
-    pac207.c \
-    rgbyuv.c \
-    se401.c \
-    sn9c10x.c \
-    sn9c2028-decomp.c \
-    sn9c20x.c \
-    spca501.c \
-    spca561-decompress.c \
-    sq905c.c \
-    stv0680.c \
-    tinyjpeg.c \
-    control/libv4lcontrol.c \
-    processing/autogain.c  \
-    processing/gamma.c \
-    processing/libv4lprocessing.c  \
-    processing/whitebalance.c \
-
-LOCAL_CFLAGS += -Wno-missing-field-initializers
-LOCAL_CFLAGS += -Wno-sign-compare
-LOCAL_CFLAGS += -include ../../android-config.h
-
-LOCAL_C_INCLUDES := \
-    $(LOCAL_PATH)/../include \
-    $(LOCAL_PATH)/../../include \
-    $(LOCAL_PATH)/../.. \
-
-LOCAL_SHARED_LIBRARIES := \
-    libutils \
-    libcutils \
-    libdl \
-    libz
-
-LOCAL_MODULE := libv4l_convert
-LOCAL_MODULE_TAGS := optional
-
-include $(BUILD_STATIC_LIBRARY)
diff --git a/utils/v4l2-compliance/Android.mk b/utils/v4l2-compliance/Android.mk
deleted file mode 100644
index a395ef9b..00000000
--- a/utils/v4l2-compliance/Android.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-LOCAL_PATH := $(call my-dir)
-
-include $(CLEAR_VARS)
-
-LOCAL_MODULE := v4l2-compliance
-LOCAL_MODULE_TAGS := optional
-
-LOCAL_CFLAGS += -DNO_LIBV4L2
-LOCAL_CFLAGS += -Wno-missing-braces
-LOCAL_CFLAGS += -Wno-missing-field-initializers
-LOCAL_CFLAGS += -include ../../android-config.h
-LOCAL_C_INCLUDES := \
-    $(LOCAL_PATH)/../.. \
-    $(LOCAL_PATH)/../../include \
-    $(LOCAL_PATH)/../common \
-    bionic \
-    external/stlport/stlport
-
-LOCAL_SHARED_LIBRARIES := libstlport
-
-LOCAL_SRC_FILES := \
-    v4l2-compliance.cpp v4l2-test-debug.cpp v4l2-test-input-output.cpp \
-    v4l2-test-controls.cpp v4l2-test-io-config.cpp v4l2-test-formats.cpp \
-    v4l2-test-buffers.cpp v4l2-test-codecs.cpp v4l2-test-colors.cpp \
-    v4l2-test-media.cpp v4l2-test-subdevs.cpp media-info.cpp v4l2-info.cpp
-
-include $(BUILD_EXECUTABLE)
diff --git a/utils/v4l2-ctl/Android.mk b/utils/v4l2-ctl/Android.mk
deleted file mode 100644
index 3078c629..00000000
--- a/utils/v4l2-ctl/Android.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-LOCAL_PATH := $(call my-dir)
-
-include $(CLEAR_VARS)
-
-LOCAL_MODULE := v4l2-ctl
-LOCAL_MODULE_TAGS := optional
-
-LOCAL_CFLAGS += -DNO_LIBV4L2
-LOCAL_CFLAGS += -Wno-missing-field-initializers
-LOCAL_CFLAGS += -include ../../android-config.h
-LOCAL_C_INCLUDES := \
-    $(LOCAL_PATH)/../.. \
-    $(LOCAL_PATH)/../../include \
-    $(LOCAL_PATH)/../common \
-    bionic \
-    external/stlport/stlport
-
-LOCAL_SHARED_LIBRARIES := libstlport
-
-LOCAL_SRC_FILES := \
-    v4l2-ctl.cpp v4l2-ctl.h v4l2-ctl-common.cpp v4l2-ctl-tuner.cpp \
-    v4l2-ctl-io.cpp v4l2-ctl-stds.cpp v4l2-ctl-vidcap.cpp v4l2-ctl-vidout.cpp \
-    v4l2-ctl-overlay.cpp v4l2-ctl-vbi.cpp v4l2-ctl-selection.cpp v4l2-ctl-misc.cpp \
-    v4l2-ctl-streaming.cpp v4l2-ctl-sdr.cpp v4l2-ctl-edid.cpp v4l2-ctl-modes.cpp \
-    v4l2-ctl-meta.cpp v4l2-ctl-subdev.cpp v4l2-info.cpp media-info.cpp \
-    v4l2-tpg-colors.c v4l2-tpg-core.c v4l-stream.c codec-fwht.c
-include $(BUILD_EXECUTABLE)
diff --git a/utils/v4l2-dbg/Android.mk b/utils/v4l2-dbg/Android.mk
deleted file mode 100644
index 4f424f65..00000000
--- a/utils/v4l2-dbg/Android.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-LOCAL_PATH := $(call my-dir)
-
-include $(CLEAR_VARS)
-
-LOCAL_MODULE := v4l2-dbg
-LOCAL_MODULE_TAGS := optional
-
-LOCAL_CFLAGS += -include ../../android-config.h
-
-LOCAL_C_INCLUDES := \
-    $(LOCAL_PATH)/../.. \
-    $(LOCAL_PATH)/../../include \
-    bionic \
-    external/stlport/stlport
-
-LOCAL_SHARED_LIBRARIES := libstlport
-
-LOCAL_SRC_FILES := v4l2-dbg.cpp
-
-include $(BUILD_EXECUTABLE)

---
base-commit: 625e604c48fa3c4e9737fa1ec8e1d473a378ca9c
change-id: 20241120-removeabp-307f4c8c6af2

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


