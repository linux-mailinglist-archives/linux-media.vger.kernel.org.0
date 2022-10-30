Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB007612A9D
	for <lists+linux-media@lfdr.de>; Sun, 30 Oct 2022 13:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiJ3MuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Oct 2022 08:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ3MuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Oct 2022 08:50:01 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04DC1B7DB
        for <linux-media@vger.kernel.org>; Sun, 30 Oct 2022 05:49:56 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9F21C100065; Sun, 30 Oct 2022 12:49:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1667134194; bh=KB/3gyd6viBgc8qqQ8YF7R0xS95IC492mOrHl6+fqy8=;
        h=Date:From:To:Subject:From;
        b=ik636/qOdeqG92Rd60O2mFgIg5XASaoBgyqRZSyr+KjuvVzRhjnt1H3F4TbCxbFyY
         P9B8jpTrUPjPuAe5TmLtOtVuKa9jgGedHW+kFoIgyOkL5XyLt69GpK3u664MyvJYfi
         pQJMbwph9FdrpN8AOmNDMBX/+oTwDWKOFO7oLdlf+Ucua3nUMxNM8pGRSZZcQcY9N2
         jKD9ejVdNUeZZpKzr0LhmAkIE0Wzb+O0wAo09uknilFicY+XCchqOGervijC4aGsEd
         Zu7XKc+I1WNQPcm4yFwxC4S/yJ+mJNhPjjg/2pXGPbIQMfp90OYntlAagwhWsq//5G
         NPrFcUyDygsdw==
Date:   Sun, 30 Oct 2022 12:49:54 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] keytable: do not use libbpf 1.0
Message-ID: <Y15y8k5Y9Cu6V/jq@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The source code is not compatible with libbpf 1.0.

Signed-off-by: Sean Young <sean@mess.org>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 05298981..3224bd61 100644
--- a/configure.ac
+++ b/configure.ac
@@ -564,7 +564,7 @@ AM_CONDITIONAL([WITH_V4L2_CTL_32], [test x${enable_v4l2_ctl_32} = xyes])
 AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xyes])
 AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_libv4l} != xno])
 AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_32], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_32} = xyes])
-PKG_CHECK_MODULES([LIBBPF], [libbpf], [bpf_pc=yes], [bpf_pc=no])
+PKG_CHECK_MODULES([LIBBPF], [libbpf < 1], [bpf_pc=yes], [bpf_pc=no])
 AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang -a x$bpf_pc = xyes])
 
 # append -static to libtool compile and link command to enforce static libs
-- 
2.38.1

