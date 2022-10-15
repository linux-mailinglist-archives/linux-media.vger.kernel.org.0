Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51175FF7BA
	for <lists+linux-media@lfdr.de>; Sat, 15 Oct 2022 03:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiJOBGB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Oct 2022 21:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiJOBGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Oct 2022 21:06:00 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077D44E633
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 18:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1665795956;
  x=1697331956;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iVwK2GRtn92OPRcznEom/Q8WgotFiMHCirVyQ1JyFdM=;
  b=LHzci1vi5HfsvzCFwMefDIWa9NNiOXzfehP/CpKq3sVZYapJmCCdMsuv
   MLmkLPh01kLpqvj8idVvpjd0/rndVHo6O1FgETAe4F3isX/wrbWi04+dD
   any/c7CqYp594jzPFqzBlYKqcaGgQjIVUuFE7iPOk1DUgrl53e2wvyA7d
   AJK58srS0dhIsJiXZflhbaOPEj7wDI6W5i72TG2n+gmBVFSQ0GUFFEUzk
   xZlYPMxP6UnrYPgemINF3Y0xAzWanyW6udZCZl429h2AQ4CANrdJ3RpKC
   7sOVCzGCStQge1ALYLqaan8lrcYW1le45Bd2vcNgyVSfAUIOEhnDSJOjM
   w==;
From:   Peter Kjellerstedt <pkj@axis.com>
To:     <linux-media@vger.kernel.org>
CC:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH] configure.ac, Makefile.am: Support building without NLS
Date:   Sat, 15 Oct 2022 03:05:41 +0200
Message-ID: <20221015010541.688322-1-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoid entering the v4l-utils-po and libdvbv5-po directories if NLS
support is disabled, as the generated Makefiles in those directories are
empty then.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 Makefile.am  | 6 +++++-
 configure.ac | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile.am b/Makefile.am
index 7fb443ab..8e924af8 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -2,7 +2,11 @@ AUTOMAKE_OPTIONS = foreign
 ACLOCAL_AMFLAGS = -I m4
 AM_MAKEFLAGS = $(word 1, $(subst 1, -w, $(filter 1, $(V))) --no-print-directory)
 
-SUBDIRS = v4l-utils-po libdvbv5-po lib
+SUBDIRS = lib
+
+if USE_NLS
+SUBDIRS += v4l-utils-po libdvbv5-po
+endif
 
 if WITH_V4LUTILS
 SUBDIRS += utils contrib
diff --git a/configure.ac b/configure.ac
index 05298981..7c78467f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -99,6 +99,7 @@ DX_INIT_DOXYGEN($PACKAGE_NAME, doxygen_libdvbv5.cfg)
 ALL_LINGUAS=""
 m4_ifdef(AM_GNU_GETTEXT_REQUIRE_VERSION,[AM_GNU_GETTEXT_REQUIRE_VERSION([0.19.8])],[AM_GNU_GETTEXT_VERSION([0.19.8])])
 AM_GNU_GETTEXT([external])
+AM_CONDITIONAL([USE_NLS], [test "$USE_NLS" = "yes"])
 
 LIBDVBV5_DOMAIN="libdvbv5"
 AC_DEFINE([LIBDVBV5_DOMAIN], "libdvbv5", [libdvbv5 domain])
