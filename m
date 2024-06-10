Return-Path: <linux-media+bounces-12890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BD9902A83
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B3CB28249A
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 21:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AC953373;
	Mon, 10 Jun 2024 21:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqhGMLB1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C56210E7
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 21:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718054600; cv=none; b=QiHLUyvmWmh09EAaCgYFZsI5Khb/7QqRQLG91WlxU0CzoGXw+6tjmXvWoDH8F8C/b3iJ5PdB0VgRhMn4o3UDDGYY4Y3hTQdEK5UgEZQoT0KptliAxLT6ptyYNkYLtbZJP0Vs3a3U3B1ViBYMhtXLZuYDda5d4mV//moVxAqwgsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718054600; c=relaxed/simple;
	bh=5UDXtFStQi41hbqtZZsObVoCtFYCnz/YI5dqlTr57Vk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DzZMxC36kpUo9mRAhkpkTDVMoOY6HiQ61YPwaY1Wb2736Tz26t/Tlwqx61opyvmRHKwm+Snk+Mi7gCgawal782hnYrDC/8ePAelFOl+wEhLtF+fzkHtCCxOmc8JlFdmreLONxma7ZnVEHU/WkLXrOJjnnKFJ20S/1YbkvfqYkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqhGMLB1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f717b3f2d8so9081275ad.1
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 14:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718054598; x=1718659398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+7RZMIURBgRudq4TdRRqx+oEitMbfGllZdF5i0i7rU=;
        b=aqhGMLB1ETkXyMLcsinPhEfMw+T5bjsXRDzKUJ4YT7Kp3SoXiVAgzhogpSeUUAt6PR
         ka3nSupKwPEOTR/nxBmOgcfLrk5zuxB1MU1nesz1tZavrzWmfYb/vuiyt4o4qA66Azp1
         JPWVm6mK21p6EjsY71k+DPgUzUT8yNAKJFov5Z/o34E2FSMmn3nZamfOTSFYuBm7d9gT
         cSKkByUQJm6wLcRGL7VFz8JUEk6x69TcighNB/sUMFwHjLsGEKfolk7iEd18xR3uZmcN
         yqgAOnuodeukF5RKF5o+Sd/DmFAOoI3kjhHNY+gqXDKDLLIxhlSfZA8SNmsgySCsKo7s
         NeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718054598; x=1718659398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+7RZMIURBgRudq4TdRRqx+oEitMbfGllZdF5i0i7rU=;
        b=jDeTDxftJriEQLrrfgkIVpnISc+fd1FJCib6DvUhYsmsVJ4C54Yy8bSoYWm0pyQCKG
         J0YAzA2mdhy9Gi5ZQU0qMXxK6gJNKhZrcaQV4xSCrE7Ud1gP8L3k4rA0QSFC2Ew73S3O
         Yfz9FvCCVJIYk62IgBS27VRZu4hdOhcwWfwCRpu8fD3tHon9Rpi046vDKiAwZArNbFL9
         OPeOPpEch9VbCuNhFOS98BcW5guevR16mNapingka9IsfAHTTncSnyA0/eOj64EEdwN8
         ezYPAFB5/c42A0jESQjcRXnSgN8M78K8jKJBCviQq/R9dta3M0Ohqj+grCQNClRXlmmy
         PVcg==
X-Gm-Message-State: AOJu0YyyBMlmMkclNN2mjlDPGvbIhwGC7IYVoYOYBZ1C6HLu0Zugylbu
	l45z1C+N7ViRN7ioGhQOz/Vniq4ixkPHNGMK5IEPcma7PK/kjeyjOyDv0g==
X-Google-Smtp-Source: AGHT+IEQQUHhZr8tKURt4gA/cz/kKWkIzUcBybSFOI9ELoIwOjh5WwJZwBGNoOXCC3O7wAgb11rkqg==
X-Received: by 2002:a17:902:cf0e:b0:1f4:adcb:37c9 with SMTP id d9443c01a7336-1f72892f9d3mr11478815ad.25.1718054598104;
        Mon, 10 Jun 2024 14:23:18 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71ba3bad1sm17173935ad.218.2024.06.10.14.23.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 14:23:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/2] v4l-utils: fix formats under ppc/mips64
Date: Mon, 10 Jun 2024 14:23:08 -0700
Message-ID: <20240610212316.136612-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default, these platforms use long instead of long long for __u64.
__SANE_USERSPACE_TYPES__ fixes -Wformat warnings.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 contrib/xc3028-firmware/firmware-tool.c | 2 ++
 include/linux/compiler.h                | 1 +
 utils/cec-compliance/cec-compliance.h   | 2 ++
 utils/cec-ctl/cec-ctl.cpp               | 2 ++
 utils/cec-ctl/cec-ctl.h                 | 2 ++
 utils/cec-ctl/cec-pin.cpp               | 2 ++
 utils/cec-follower/cec-processing.cpp   | 2 ++
 utils/common/v4l2-info.h                | 2 ++
 utils/cx18-ctl/cx18-ctl.c               | 2 ++
 utils/ivtv-ctl/ivtv-ctl.c               | 2 ++
 utils/keytable/keytable.c               | 2 ++
 utils/media-ctl/media-ctl.c             | 2 ++
 utils/v4l2-compliance/v4l2-compliance.h | 2 ++
 utils/v4l2-ctl/v4l2-ctl-common.cpp      | 2 ++
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp   | 2 ++
 utils/v4l2-ctl/v4l2-ctl.cpp             | 2 ++
 utils/v4l2-ctl/v4l2-ctl.h               | 2 ++
 utils/v4l2-dbg/v4l2-dbg.cpp             | 2 ++
 18 files changed, 35 insertions(+)

diff --git a/contrib/xc3028-firmware/firmware-tool.c b/contrib/xc3028-firmware/firmware-tool.c
index 5dd205e0..6bcb3237 100644
--- a/contrib/xc3028-firmware/firmware-tool.c
+++ b/contrib/xc3028-firmware/firmware-tool.c
@@ -29,6 +29,8 @@
 #include <string.h>
 #include <unistd.h>
 
+#include "linux/compiler.h"
+
 #include <asm/byteorder.h>
 #include <asm/types.h>
 
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 379629be..5a6326f8 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -1,6 +1,7 @@
 #ifndef __linux_compiler_h
 #define __linux_compiler_h
 
+#define __SANE_USERSPACE_TYPES__
 #define __user
 
 #endif
diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index aae72842..d5bd1d0a 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -8,6 +8,8 @@
 #ifndef _CEC_COMPLIANCE_H_
 #define _CEC_COMPLIANCE_H_
 
+#include "linux/compiler.h"
+
 #include <linux/cec-funcs.h>
 #include "cec-htng-funcs.h"
 
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 8848a49d..69aeb8cd 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -20,6 +20,8 @@
 #include <sys/time.h>
 #include <unistd.h>
 
+#include "linux/compiler.h"
+
 #include <linux/cec-funcs.h>
 #include "cec-htng-funcs.h"
 #include "cec-log.h"
diff --git a/utils/cec-ctl/cec-ctl.h b/utils/cec-ctl/cec-ctl.h
index 2c82bedc..e0692c31 100644
--- a/utils/cec-ctl/cec-ctl.h
+++ b/utils/cec-ctl/cec-ctl.h
@@ -6,6 +6,8 @@
 #ifndef _CEC_CTL_H_
 #define _CEC_CTL_H_
 
+#include "linux/compiler.h"
+
 #include <cec-info.h>
 
 // cec-ctl.cpp
diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
index f3500555..0cdc19f7 100644
--- a/utils/cec-ctl/cec-pin.cpp
+++ b/utils/cec-ctl/cec-pin.cpp
@@ -3,6 +3,8 @@
  * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include "linux/compiler.h"
+
 #include <string>
 
 #include <linux/cec.h>
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 14ee211b..3b5c3ce5 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -3,6 +3,8 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include "linux/compiler.h"
+
 #include <cerrno>
 #include <ctime>
 #include <string>
diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
index ac227971..eeb7bc6b 100644
--- a/utils/common/v4l2-info.h
+++ b/utils/common/v4l2-info.h
@@ -8,6 +8,8 @@
 
 #include <string>
 
+#include "linux/compiler.h"
+
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
 
diff --git a/utils/cx18-ctl/cx18-ctl.c b/utils/cx18-ctl/cx18-ctl.c
index 8586f72d..7c13b1a3 100644
--- a/utils/cx18-ctl/cx18-ctl.c
+++ b/utils/cx18-ctl/cx18-ctl.c
@@ -34,6 +34,8 @@
 #include <sys/time.h>
 #include <math.h>
 
+#include "linux/compiler.h"
+
 #include <linux/videodev2.h>
 #include <v4l-getsubopt.h>
 
diff --git a/utils/ivtv-ctl/ivtv-ctl.c b/utils/ivtv-ctl/ivtv-ctl.c
index b42b3489..bf36f40b 100644
--- a/utils/ivtv-ctl/ivtv-ctl.c
+++ b/utils/ivtv-ctl/ivtv-ctl.c
@@ -34,6 +34,8 @@
 #include <sys/time.h>
 #include <math.h>
 
+#include "linux/compiler.h"
+
 #include <linux/videodev2.h>
 #include <v4l-getsubopt.h>
 
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index b6474d5c..a726921a 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -12,6 +12,8 @@
    GNU General Public License for more details.
  */
 
+#include "linux/compiler.h"
+
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 1a9e393a..b180185f 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -34,6 +34,8 @@
 #include <string.h>
 #include <unistd.h>
 
+#include "linux/compiler.h"
+
 #include <linux/media.h>
 #include <linux/types.h>
 #include <linux/v4l2-mediabus.h>
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 3517bd07..2c2b2158 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -26,6 +26,8 @@
 #include <string>
 #include <cstdint>
 
+#include "linux/compiler.h"
+
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
 #include <linux/media.h>
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 1f9cd0fb..ea120eb8 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -9,6 +9,8 @@
 #include <sys/stat.h>
 #include <sys/sysmacros.h>
 
+#include "linux/compiler.h"
+
 #include <linux/media.h>
 
 #include "v4l2-ctl.h"
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 13bc057d..7af62ec8 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -3,6 +3,8 @@
 #include <netdb.h>
 #include <sys/types.h>
 
+#include "linux/compiler.h"
+
 #include <linux/media.h>
 
 #include "compiler.h"
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index a64fa514..d8a6c617 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -27,6 +27,8 @@
 #include <getopt.h>
 #include <sys/epoll.h>
 
+#include "linux/compiler.h"
+
 #include <linux/media.h>
 
 #include "v4l2-ctl.h"
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index a1911e80..fd1bd24a 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -1,6 +1,8 @@
 #ifndef _V4L2_CTL_H
 #define _V4L2_CTL_H
 
+#include "linux/compiler.h"
+
 #include <cstdint>
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index bd08b4cf..1b0d278a 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -31,6 +31,8 @@
 #include <sys/klog.h>
 #endif
 
+#include "linux/compiler.h"
+
 #include <linux/videodev2.h>
 #include <v4l-getsubopt.h>
 
-- 
2.45.2


