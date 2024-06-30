Return-Path: <linux-media+bounces-14430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF5A91D4A6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 00:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 612BA281394
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 22:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66BD5B68F;
	Sun, 30 Jun 2024 22:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGvXJMDf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F478C84
	for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 22:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719787489; cv=none; b=mtk+/AQMu49aQbmNqOnbVMRtBDVRlH7tk8ba2pWgNPR14uDtlVbBbWN2Few3Taq3y6TIZzZKg73rBCkdEM7R+5RHgwtrGrsPFx6GVlE6rUaIn699xkO3wa+G5iC1hGJS9M7qlaBIhdszpfAFDf1OISfnWS/c2C3Hw+xTcvu3tZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719787489; c=relaxed/simple;
	bh=2xrYzj7s8C5imxL7vRhnBlI1iwVC7I2IZgQKTRlPlKg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlK1LM3fs4jgijUi2jVrugE5LPjIwlJWGW9PGOG7TEztEoMYRLGYss2OffURIp4FZwgJGsKDmhH5dRZmEaFPpm0i3G9AUoxbrO+mbx3FKRvQvWGxMav3LS2bqSRz3vX0aDwMhlrKU6sxTxB72aLaONgseaKeaS+265mcpdg6jRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGvXJMDf; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-36dd56cf5f5so10424175ab.3
        for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 15:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719787485; x=1720392285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pESUJ1u4mWewX4e2gGYV/uIFdWStLAz8jAqS6+xF00=;
        b=EGvXJMDfHViWAJf6O0ma4yJxaseQSpxsGPz9Yt47EIfOLAmiXKGwPrCVsF9dTAS1Cd
         5K+ez9Lfs0X0ErwVVDTlp59frM9cXbbDYttmhC4RARJOvOey9/EEG/Px2b2kf617XYO1
         YlU4yLXR7cBrspqYzoTNhXFrIQNFo5eSMZMU78bK+fnRXWkTUNaFL6XeD6E9ZdTEGhoB
         /iyUFLOGrMDlafynvIzbVgJmKQ6jNhrmiijWSHtzWDW7wbt+yFYK1E5119CJY93q8bI4
         YoRENaTuxUEQ4mpHOgEjIh9GqPTJcFqTvySA7Q0IcPJUFP5si80VPPLe/1gMWoObfa6l
         sUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719787485; x=1720392285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pESUJ1u4mWewX4e2gGYV/uIFdWStLAz8jAqS6+xF00=;
        b=wo/1GDkON2CpjN0gqLczZbbmJZE+W3PlZFAe3SsmgJeDKtUOLxDQ17YPW+yWpXHZ4/
         1LV3/cCjyKezqjYCA5wWoS1BKKyLKunsyvCwdEftKnkslsi+vAntPi5FCRUPgp18VmBy
         E+BizDtN8AuQFn+2pphHWlJjqNTYB3ophQsQ+rWJOmoFvcAbrvf9yq1cqY9i5CHu53iJ
         EPpCQzqEiNPvrmZWFLXLBGkRGYqF2G4SnLgRV0kz3qbROGyNUfKZx1A8hGy8KQFbUkWe
         RHs9VlsaXV/Fozc/YC7gLEacpi3zHSNpk8wIRhMDfv9NQvh+loWJZ7QsSY9sE7JcfyBV
         v0EA==
X-Gm-Message-State: AOJu0Yxz3nEJyUm/I6XTqrIu/6QnSiH8YFLensdKza90qIqhjwGf6sQK
	DzhgU+RPsCuQ8eWO/tXe+cL3ZPNoBMb0sWdnj4GlvsHOXagVtWxkbR0vyw==
X-Google-Smtp-Source: AGHT+IEQShyLO6G0z0X9mc6mCINiuvrfkr+BPzt5IJNS2C1SE+Sfhm8D95TBj6tbMe5NqyX+ADoStg==
X-Received: by 2002:a05:6e02:12ed:b0:376:4544:8282 with SMTP id e9e14a558f8ab-37cd31b7522mr51675725ab.28.1719787485311;
        Sun, 30 Jun 2024 15:44:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac15396casm51018995ad.175.2024.06.30.15.44.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 15:44:44 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 4/4] v4l-utils: fix formats under ppc/mips64
Date: Sun, 30 Jun 2024 15:44:40 -0700
Message-ID: <20240630224440.5912-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240630224440.5912-1-rosenp@gmail.com>
References: <20240630224440.5912-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike libc, kernel headers use long long for 64-bit types. The
exception is ppc64 and mips64, unless __SANE_USERSPACE_TYPES__ is
defined.

Define in compiler.h and include before kernel headers are included so
that wrong __u64 and __s64 definitions to not get used.

Fixes -Wformat warnings about llu being used instead of lu.

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
index fb38320d..a2ffcb2b 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -21,6 +21,8 @@
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
index 20c6165c..cc38f143 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -3,6 +3,8 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include "linux/compiler.h"
+
 #include <cerrno>
 #include <cinttypes>
 #include <ctime>
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
index 538f4ef3..ba7c7c4d 100644
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
index 33df0880..f91c1cfa 100644
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


