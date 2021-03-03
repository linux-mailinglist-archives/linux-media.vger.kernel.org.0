Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F5A35173F
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 19:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352026AbhCDAdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391340AbhCCWfk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 17:35:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88897C0613DC
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 14:32:44 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <uol@pengutronix.de>)
        id 1lHa2t-000466-7u; Wed, 03 Mar 2021 23:32:43 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <uol@pengutronix.de>)
        id 1lHa2s-0006vH-Vn; Wed, 03 Mar 2021 23:32:42 +0100
From:   =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH v4l-utils 1/2] configure.ac: autodetect availability of systemd
Date:   Wed,  3 Mar 2021 23:32:33 +0100
Message-Id: <20210303223234.26567-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Import systemd's official suggestion [1] how this should be handled in packages
using autoconf.

[1] https://www.freedesktop.org/software/systemd/man/daemon.html#Installing%20systemd%20Service%20Files

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 configure.ac | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 727730c5ccf4..f62ad7cb25ae 100644
--- a/configure.ac
+++ b/configure.ac
@@ -388,7 +388,15 @@ AC_ARG_WITH(udevdir,
 AC_ARG_WITH(systemdsystemunitdir,
 	AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [set systemd system unit directory]),
 	[],
-	[with_systemdsystemunitdir=`$PKG_CONFIG --variable=systemdsystemunitdir systemd || echo /lib/systemd/system`])
+	[with_systemdsystemunitdir=auto])
+AS_IF([test "x$with_systemdsystemunitdir" = "xyes" -o "x$with_systemdsystemunitdir" = "xauto"],
+      [def_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)
+       AS_IF([test "x$def_systemdsystemunitdir" = "x"],
+             [AS_IF([test "x$with_systemdsystemunitdir" = "xyes" -o "x$with_systemdsystemunitdir" = "xauto"],
+                    [AC_MSG_ERROR([systemd support requested but pkg-config unable to query systemd package])])
+              with_systemdsystemunitdir=no],
+             [with_systemdsystemunitdir="$def_systemdsystemunitdir"])])
+AM_CONDITIONAL([HAVE_SYSTEMD], [test "x$with_systemdsystemunitdir" != "xno"])
 
 # Generic check: works with most distributions
 def_gconv_dir=`for i in /lib64 /usr/lib64 /usr/local/lib64 /lib /usr/lib /usr/local/lib; do if @<:@ -d \$i/gconv @:>@; then echo \$i/gconv; break; fi; done`
-- 
2.29.2

