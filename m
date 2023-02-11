Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42714692FEB
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 11:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjBKKND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 05:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBKKNC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 05:13:02 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FFBC1E5E0
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 02:13:00 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso7938386wmp.3
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 02:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqe3s5e3wt4DSHIGbrhfklUFbKKerT+A7ba6t19+OIA=;
        b=40j1ow/yT/+Vcqk9Bq3cr59FnSqC1WJqOLsnnpX6J9WZVWzkcb2/GGa4cBdVTr2Uv1
         bjUekv3NRGP2qiuSzPtHvm1BR/TM4EoSkMsZz2IxhiFgFYkn+pD0ZolfSbHLAQ2OiCL6
         aBThCwn62qdu/udtT2E7NBk00Mcjj9wB/z6ug549U4PZ9urk97Nd2WKDQaq95hzBqnrA
         DzV9yPWa21uGNnXzXYyHiDvnsG+fPPX/ycX9DmzP4QbpM77nyJab+yiAO6xMpoQWjqr5
         oAsUIJA7tblDPyj+YSxquJlQzaVn7H3trHy285BwblSBD4HrwEl9jPKgX7dd+CQqnwHF
         7faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqe3s5e3wt4DSHIGbrhfklUFbKKerT+A7ba6t19+OIA=;
        b=aEO7r3GmuUss21/6mXTX6/KS4V505WBSdw2P6GPKy8NwfjhiM+DVq3P3FW85FNRk97
         ws7nNByq164zEXmksnASQy+uHfc7Iuq3wqxMSjOigrETqLoidQrWrvbypuwogixkaJZN
         9uVrz2UsxVry2Ur/Mv32nst1RxLn5wnmyNcBWyrSccGT4tSUTxsqsNJ+S6DkAuLQIIyO
         fpsOe+EEUkmBA5/BPRbb7KTRToEtvKZ75APys08uW2mBULJ2fq60s6vwWtUrgd+ECQf5
         dmAmeUbfrXpSjYfQL2pE64MlUsP7XStQrRPoqaBdNtGH+FojpemHflZoUT7n5rLhA70I
         6W9w==
X-Gm-Message-State: AO0yUKUHhG9CO5m2NGRo71+4odLiMdsEUjFD769Zi6w9M6b/TXwywbnh
        dNYbG6KBtFlraX5bIBosVrNFnghgXmQKTbFC
X-Google-Smtp-Source: AK7set+AQZmGztz9WZtrt2GB6yP4aY9Q8iPyEnXDKxDFZwhKnBPGIvoSjZwg146vQVd6VUYbrFhjOQ==
X-Received: by 2002:a05:600c:4a9a:b0:3dc:f24:f2de with SMTP id b26-20020a05600c4a9a00b003dc0f24f2demr14730373wmp.12.1676110379108;
        Sat, 11 Feb 2023 02:12:59 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id a1-20020a05600c348100b003db0ee277b2sm11041841wmq.5.2023.02.11.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 02:12:58 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH] configure.ac: Add option to disable compilation of v4l2-tracer
Date:   Sat, 11 Feb 2023 11:12:31 +0100
Message-Id: <20230211101231.3060841-1-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a configuration time option to disable compilation of the
v4l2-tracer utility.

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---

Hi Hans,

The v4l2-tracer fails to build on arm32. While I'm sure that can be
fixed, this is an utility I don't use and building on target any thing I
can disable in the build saves me time.

From completes, the classes of errors I see are around v4l2_fourcc(),
_IOR() and _IOWR().

../../include/linux/videodev2.h:81:66: error: narrowing conversion of '3039908417' from '__u32' {aka 'unsigned int'} to 'long int' [-Wnarrowing]
   81 | #define v4l2_fourcc_be(a, b, c, d)      (v4l2_fourcc(a, b, c, d) | (1U << 31))

../../include/linux/videodev2.h:2528:34: error: narrowing conversion of '2154321408' from 'unsigned int' to 'long int' [-Wnarrowing]
 2528 | #define VIDIOC_QUERYCAP          _IOR('V',  0, struct v4l2_capability)

../../include/linux/videodev2.h:2529:33: error: narrowing conversion of '3225441794' from 'unsigned int' to 'long int' [-Wnarrowing]
 2529 | #define VIDIOC_ENUM_FMT         _IOWR('V',  2, struct v4l2_fmtdesc)

I'm building on target with gcc 12.1.0, nothing fancy,

    $ ./bootstrap.sh && ./configure && make

Kind Regards
Niklas
---
 configure.ac      | 11 +++++++++++
 utils/Makefile.am |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index dc9c4af71c45..46ddc7a8b404 100644
--- a/configure.ac
+++ b/configure.ac
@@ -497,6 +497,14 @@ AC_ARG_ENABLE(v4l2-compliance-32,
    esac]
 )
 
+AC_ARG_ENABLE(v4l2-tracer,
+  AS_HELP_STRING([--disable-v4l2-tracer], [disable v4l2-tracer compilation]),
+  [case "${enableval}" in
+     yes | no ) ;;
+     *) AC_MSG_ERROR(bad value ${enableval} for --disable-v4l2-tracer) ;;
+   esac]
+)
+
 AC_ARG_ENABLE(v4l2-ctl-libv4l,
   AS_HELP_STRING([--disable-v4l2-ctl-libv4l], [disable use of libv4l in v4l2-ctl]),
   [case "${enableval}" in
@@ -578,6 +586,7 @@ AM_CONDITIONAL([WITH_V4L2_CTL_32], [test x${enable_v4l2_ctl_32} = xyes])
 AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xyes])
 AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_libv4l} != xno])
 AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_32], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_32} = xyes])
+AM_CONDITIONAL([WITH_V4L2_TRACER], [test x$jsonc_pkgconfig = xyes -a x$enable_v4l2_tracer != xno])
 PKG_CHECK_MODULES([LIBBPF], [libbpf >= 0.7], [bpf_pc=yes], [bpf_pc=no])
 AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang -a x$bpf_pc = xyes])
 
@@ -628,6 +637,7 @@ AM_COND_IF([WITH_V4L2_CTL_32], [USE_V4L2_CTL_32="yes"], [USE_V4L2_CTL_32="no"])
 AM_COND_IF([WITH_V4L2_COMPLIANCE], [USE_V4L2_COMPLIANCE="yes"], [USE_V4L2_COMPLIANCE="no"])
 AM_COND_IF([WITH_V4L2_COMPLIANCE_LIBV4L], [USE_V4L2_COMPLIANCE_LIBV4L="yes"], [USE_V4L2_COMPLIANCE_LIBV4L="no"])
 AM_COND_IF([WITH_V4L2_COMPLIANCE_32], [USE_V4L2_COMPLIANCE_32="yes"], [USE_V4L2_COMPLIANCE_32="no"])
+AM_COND_IF([WITH_V4L2_TRACER], [USE_V4L2_TRACER="yes"], [USE_V4L2_TRACER="no"])
 AM_COND_IF([WITH_BPF],         [USE_BPF="yes"
                                 AC_DEFINE([HAVE_BPF], [1], [BPF IR decoder support enabled])],
 				[USE_BPF="no"])
@@ -679,5 +689,6 @@ compile time options summary
     v4l2-compliance            : $USE_V4L2_COMPLIANCE
     v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE_LIBV4L
     v4l2-compliance-32         : $USE_V4L2_COMPLIANCE_32
+    v4l2-tracer                : $USE_V4L2_TRACER
     BPF IR Decoders:           : $USE_BPF
 EOF
diff --git a/utils/Makefile.am b/utils/Makefile.am
index 6f59515ef29d..b2a6ac211473 100644
--- a/utils/Makefile.am
+++ b/utils/Makefile.am
@@ -15,7 +15,7 @@ SUBDIRS = \
 	cec-follower \
 	rds-ctl
 
-if HAVE_JSONC
+if WITH_V4L2_TRACER
 SUBDIRS += \
 	v4l2-tracer
 endif
-- 
2.39.1

