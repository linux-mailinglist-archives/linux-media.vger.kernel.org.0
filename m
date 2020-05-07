Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A881C8332
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 09:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbgEGHHB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 03:07:01 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:46630 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgEGHHB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 03:07:01 -0400
From:   Lars Wendler <polynomial-c@gentoo.org>
To:     linux-media@vger.kernel.org
Cc:     Lars Wendler <polynomial-c@gentoo.org>
Subject: [PATCH] v4l-utils: configure.ac: Avoid bashisms
Date:   Thu,  7 May 2020 09:05:48 +0200
Message-Id: <20200507070547.21954-1-polynomial-c@gentoo.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

as these cause possible misbehavior when running with non-bash shells

Gentoo-bug: https://bugs.gentoo.org/721374
Signed-off-by: Lars Wendler <polynomial-c@gentoo.org>
---
 configure.ac | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index c49f2c37..54459393 100644
--- a/configure.ac
+++ b/configure.ac
@@ -542,13 +542,13 @@ AM_CONDITIONAL([WITH_QVIDCAP],	    [test x${qt_desktop_opengl} = xyes -a x$enabl
 AM_CONDITIONAL([WITH_V4L_PLUGINS],  [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
 AM_CONDITIONAL([WITH_V4L_WRAPPERS], [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
 AM_CONDITIONAL([WITH_QTGL],	    [test x${qt_desktop_opengl} = xyes])
-AM_CONDITIONAL([WITH_GCONV],        [test x$enable_gconv = xyes -a x$enable_shared == xyes -a x$with_gconvdir != x -a -f $with_gconvdir/gconv-modules])
+AM_CONDITIONAL([WITH_GCONV],        [test x$enable_gconv = xyes -a x$enable_shared = xyes -a x$with_gconvdir != x -a -f $with_gconvdir/gconv-modules])
 AM_CONDITIONAL([WITH_V4L2_CTL_LIBV4L], [test x${enable_v4l2_ctl_libv4l} != xno])
 AM_CONDITIONAL([WITH_V4L2_CTL_STREAM_TO], [test x${enable_v4l2_ctl_stream_to} != xno])
-AM_CONDITIONAL([WITH_V4L2_CTL_32], [test x${enable_v4l2_ctl_32} == xyes])
+AM_CONDITIONAL([WITH_V4L2_CTL_32], [test x${enable_v4l2_ctl_32} = xyes])
 AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xyes])
 AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_libv4l} != xno])
-AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_32], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_32} == xyes])
+AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_32], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_32} = xyes])
 AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang])
 
 # append -static to libtool compile and link command to enforce static libs
-- 
2.26.2

