Return-Path: <linux-media+bounces-23225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 911169ED687
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 20:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E255A164227
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 19:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C39B1C5F0E;
	Wed, 11 Dec 2024 19:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U6FRIaKa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E13259483
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733945430; cv=none; b=tzkT7SgChwvRg4Cy1iUIGc7pLGmZ/Kgq50svmxJwh44lWepsoN+HUwCEFMCrLM6q17MyoyGMdS1FmLaFwnHMWp0dyrVu2ic/9E5MbBOpM4URZBDsOtKOygB/AtaRnru7fY1GSEvFRAXDOvPBOi0dI9qVcQGmzgSw4u3M9k5eepg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733945430; c=relaxed/simple;
	bh=NLbkVoBeNPUAkh0w/czo2/ud4fRP+tnndhTlLVDHIww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=snb/BrvxJZ3/nX7ecWlrIPr2Up7c1QtgmcN65bm4bT1Tcrx9sdA5R6yFMK4Ep4tyXFtXHUfgd6Q2J6RYWaxVzBtI01TTEWuTLBBH8Coqmti5WzfN0EM4BxRH+WJHD/LqmAzp+smsLTWkuXbAnkSp7wFTL/WGromzKrCmMYq3MsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U6FRIaKa; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6f1b54dc3so44904785a.1
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 11:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733945426; x=1734550226; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0k1G/qGBWIaLKoFnL6Ujw4Nm5IPzp6WS2ypI+KzLKqA=;
        b=U6FRIaKa4FP4a1qYe3dQQSJyLXZ/rmRj9qNHfv/x9OaN6gjMrlqOhZhpNxtrQ4qND3
         44uqeWDQKL+0aaORNdzlQGxcrKkfUbCu4rhWYld6XdFJYvaKzV6iuS8qn3dHRRNgdAr5
         UpqGbGVqaPa/VNmVOuMtFs/Jmc7lCLHbdPv7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733945426; x=1734550226;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0k1G/qGBWIaLKoFnL6Ujw4Nm5IPzp6WS2ypI+KzLKqA=;
        b=uZQtLO86SVCjIA8WZJNJ6evFe+lZTAF00rL4fs0WlivbaPu8UYOUIRlwvlaYweHTpf
         LnpHY2lD7qYfyWrA+2XkYYu+YdO/FFJJfZOyI04XgGUMV90IPeNR/rnJqRw6A1QEQaSB
         LtN9Q5dC/yrE8FV2zi2uAXIGeddVuYQIYbYRDul75Jn0zCRiEVJlgbIgiZ2WTBlEe4vN
         7p/y38omOxvEYk8kI0c7hDrSJRQCEixl2gWDEJoegUgcylJp9VfrAUwgpAPan0jmHCcd
         7riQHRAS1zliSM5zcMJ0QMT/6pbVemwNf+B7BjP5ZYHprJdG+0ohFfsQS4pV1eppysLq
         Jqjw==
X-Gm-Message-State: AOJu0Yx03ZvnAqhXANKDBpv5CdkiBB3LPjnaOW4OEmE++lDGw3pyM0k3
	Or7a2aUcjUJ3SZ51vMGNqFLqOexqBAXYcFam8qW/VPSvlE+7v9SJelS4Mv7QqWuhzaSfz6IHuKA
	=
X-Gm-Gg: ASbGncu4nhrd9taeRlwtAsJEkUeZsoh0uZ1+Y4jpsZISvtFQK+nFCQ7MNPYEo0obXFa
	g0rD6oYEVsbz7+bekB8B0CMIE1RJjCCiTcaO/r63E2jQ0mTTxpDkAFvWir3w8gnCxDi24VRAvSR
	t/F2yotR4BfnZof1rk+PAkwHLCFmAt66cKo7hsy3pSYKbvLDxS+zqaTVjGNvL0mYYLWt9Mvd0Kt
	T1jGtbtpQR8BSh2JAE4zfO1NBxvPD3GjhioMCcouJwz4U/2YUzDGQEs5kdoL4USvP2B2Kq118mo
	hEWbwEphEf8oD48RsjucPi6fPZs5
X-Google-Smtp-Source: AGHT+IGrC3wTbsnuwHCq1B+bgebPx0oPNMVtjafyo/v+gffFSs6JyrJ3+mQYUWITUvdQ4L4bfmmmCw==
X-Received: by 2002:a05:620a:470b:b0:7b6:d9f6:ec37 with SMTP id af79cd13be357-7b6f25c09eemr91404685a.61.1733945426535;
        Wed, 11 Dec 2024 11:30:26 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6eb340c61sm106138085a.114.2024.12.11.11.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 11:30:26 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 11 Dec 2024 19:30:25 +0000
Subject: [PATCH] android: Remove unused file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-android2-v1-1-3dc4ac91f6d2@chromium.org>
X-B4-Tracking: v=1; b=H4sIAFDoWWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0ND3cS8lKL8zBQj3dRUY5MUcwMDIDZSAiovKEpNy6wAGxUdW1sLAKh
 6L+5aAAAA
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This is a leftover from the previous Android build files. Remove it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 android-config.h | 120 -------------------------------------------------------
 1 file changed, 120 deletions(-)

diff --git a/android-config.h b/android-config.h
deleted file mode 100644
index bd4ef2fb..00000000
--- a/android-config.h
+++ /dev/null
@@ -1,120 +0,0 @@
-#ifndef __V4L_ANDROID_CONFIG_H__
-#define __V4L_ANDROID_CONFIG_H__
-/* config.h.  Generated from config.h.in by configure.  */
-/* config.h.in.  Generated from configure.ac by autoheader.  */
-
-/* alsa library is present */
-/* #undef HAVE_ALSA */
-
-/* Define to 1 if you have the <dlfcn.h> header file. */
-#define HAVE_DLFCN_H 1
-
-/* Define if you have the iconv() function and it works. */
-/* #undef HAVE_ICONV */
-
-/* Define to 1 if you have the <inttypes.h> header file. */
-#define HAVE_INTTYPES_H 1
-
-/* whether we use libjpeg */
-/* #undef HAVE_JPEG */
-
-/* Define to 1 if you have the `klogctl' function. */
-#define HAVE_KLOGCTL 1
-
-/* Define to 1 if you have the <memory.h> header file. */
-#define HAVE_MEMORY_H 1
-
-/* qt has opengl support */
-/* #undef HAVE_QTGL */
-
-/* Define to 1 if you have the <stdint.h> header file. */
-#define HAVE_STDINT_H 1
-
-/* Define to 1 if you have the <stdlib.h> header file. */
-#define HAVE_STDLIB_H 1
-
-/* Define to 1 if you have the <strings.h> header file. */
-#define HAVE_STRINGS_H 1
-
-/* Define to 1 if you have the <string.h> header file. */
-#define HAVE_STRING_H 1
-
-/* Define to 1 if you have the <sys/klog.h> header file. */
-#define HAVE_SYS_KLOG_H 1
-
-/* Define to 1 if you have the <sys/stat.h> header file. */
-#define HAVE_SYS_STAT_H 1
-
-/* Define to 1 if you have the <sys/types.h> header file. */
-#define HAVE_SYS_TYPES_H 1
-
-/* Define to 1 if you have the <unistd.h> header file. */
-#define HAVE_UNISTD_H 1
-
-/* Define to 1 or 0, depending whether the compiler supports simple visibility
-   declarations. */
-#define HAVE_VISIBILITY 1
-
-/* Define as const if the declaration of iconv() needs const. */
-/* #undef ICONV_CONST */
-
-/* ir-keytable preinstalled tables directory */
-#define IR_KEYTABLE_SYSTEM_DIR "/lib/udev/rc_keymaps"
-
-/* ir-keytable user defined tables directory */
-#define IR_KEYTABLE_USER_DIR "/system/etc/rc_keymaps"
-
-/* libv4l1 private lib directory */
-#define LIBV4L1_PRIV_DIR "/system/lib/libv4l"
-
-/* libv4l2 plugin directory */
-#define LIBV4L2_PLUGIN_DIR "/system/lib/libv4l/plugins"
-
-/* libv4l2 private lib directory */
-#define LIBV4L2_PRIV_DIR "/system/lib/libv4l"
-
-/* libv4lconvert private lib directory */
-#define LIBV4LCONVERT_PRIV_DIR "/system/lib/libv4l"
-
-/* Define to the sub-directory in which libtool stores uninstalled libraries.
-   */
-#define LT_OBJDIR ".libs/"
-
-/* Name of package */
-#define PACKAGE "v4l-utils"
-
-/* Define to the address where bug reports for this package should be sent. */
-#define PACKAGE_BUGREPORT ""
-
-/* Define to the full name of this package. */
-#define PACKAGE_NAME "v4l-utils"
-
-/* Define to the full name and version of this package. */
-#define PACKAGE_STRING "v4l-utils 1.1.0"
-
-/* Define to the one symbol short name of this package. */
-#define PACKAGE_TARNAME "v4l-utils"
-
-/* Define to the home page for this package. */
-#define PACKAGE_URL ""
-
-/* Define to the version of this package. */
-#define PACKAGE_VERSION "1.1.0"
-
-/* Define to the type that is the result of default argument promotions of
-   type mode_t. */
-#define PROMOTED_MODE_T int
-
-/* Define to 1 if you have the ANSI C header files. */
-#define STDC_HEADERS 1
-
-/* v4l-utils version string */
-#define V4L_UTILS_VERSION "1.1.0"
-
-/* Version number of package */
-#define VERSION "1.1.0"
-
-/* Define to `int' if <sys/types.h> does not define. */
-/* #undef mode_t */
-
-#endif

---
base-commit: c81300e18609d94fbbcf53a60aa639b4b983fe2e
change-id: 20241211-android2-ee34d700d702

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


