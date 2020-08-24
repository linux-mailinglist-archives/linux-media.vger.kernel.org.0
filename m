Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD6B250B25
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 23:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgHXVvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 17:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHXVvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 17:51:22 -0400
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728BAC061574
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 14:51:22 -0700 (PDT)
From:   James Le Cuirot <chewi@gentoo.org>
To:     linux-media@vger.kernel.org
Cc:     James Le Cuirot <chewi@gentoo.org>
Subject: [PATCH v2] configure.ac: Add --without-libudev option to avoid automagic dep
Date:   Mon, 24 Aug 2020 22:50:47 +0100
Message-Id: <20200824215047.20916-1-chewi@gentoo.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <79c5bdb0-4082-7a3b-d614-4f87bf61f01c@xs4all.nl>
References: <79c5bdb0-4082-7a3b-d614-4f87bf61f01c@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

configure currently checks for and links against libudev
unconditionally, If this was unwanted and the library is removed then
this can leave v4l-utils broken. This is a problem for distributions,
especially Gentoo Linux where it affects end users. libudev is
unlikely to be removed entirely but the 32-bit library may be removed
from a 64-bit system, breaking a 32-bit build of v4l-utils.

Signed-off-by: James Le Cuirot <chewi@gentoo.org>
---
 configure.ac | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/configure.ac b/configure.ac
index d9f43ab5..e6134d08 100644
--- a/configure.ac
+++ b/configure.ac
@@ -291,16 +291,23 @@ else
    AC_MSG_WARN(ALSA library not available)
 fi
 
-PKG_CHECK_MODULES(libudev, libudev, have_libudev=yes, have_libudev=no)
-if test "x$have_libudev" = "xyes"; then
-	AC_DEFINE([HAVE_LIBUDEV], [], [Use libudev])
-	LIBUDEV_CFLAGS="$libudev_CFLAGS"
-	LIBUDEV_LIBS="$libudev_LIBS"
-	AC_SUBST(LIBUDEV_CFLAGS)
-	AC_SUBST(LIBUDEV_LIBS)
-else
-   AC_MSG_WARN(udev library not available)
-fi
+AC_ARG_WITH([libudev],
+            AS_HELP_STRING([--without-libudev], [Do not use udev library]),
+            [],
+            [with_libudev=yes])
+
+have_libudev=no
+
+AS_IF([test "x$with_libudev" != xno -o "x$enable_libdvbv5" != xno],
+      [PKG_CHECK_MODULES(libudev, libudev, have_libudev=yes, [])
+       AS_IF([test "x$have_libudev" = xyes],
+             [AC_DEFINE([HAVE_LIBUDEV], [], [Use libudev])
+              LIBUDEV_CFLAGS="$libudev_CFLAGS"
+              LIBUDEV_LIBS="$libudev_LIBS"
+              AC_SUBST(LIBUDEV_CFLAGS)
+              AC_SUBST(LIBUDEV_LIBS)],
+             AC_MSG_WARN(udev library not available)
+            )])
 
 AC_SUBST([JPEG_LIBS])
 
-- 
2.26.2

