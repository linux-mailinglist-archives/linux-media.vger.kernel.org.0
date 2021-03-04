Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0981332D415
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 14:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236867AbhCDNYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 08:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241315AbhCDNYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 08:24:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00ADC061756
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 05:23:44 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <uol@pengutronix.de>)
        id 1lHnx9-00042g-Al; Thu, 04 Mar 2021 14:23:43 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <uol@pengutronix.de>)
        id 1lHnx9-0005I2-2J; Thu, 04 Mar 2021 14:23:43 +0100
From:   =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH v4l-utils v2 2/2] keytable: restrict installation of 50-rc_keymap.conf
Date:   Thu,  4 Mar 2021 14:23:40 +0100
Message-Id: <20210304132340.17069-2-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304132340.17069-1-u.oelmann@pengutronix.de>
References: <20210304132340.17069-1-u.oelmann@pengutronix.de>
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

It is only needed if BPF is effectively used and the package is compiled for a
systemd based target.

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 utils/keytable/Makefile.am | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
index c5eb414acf2f..eee61f0e0551 100644
--- a/utils/keytable/Makefile.am
+++ b/utils/keytable/Makefile.am
@@ -3,9 +3,13 @@ man_MANS = ir-keytable.1 rc_keymap.5
 sysconf_DATA = rc_maps.cfg
 keytablesystem_DATA = $(srcdir)/rc_keymaps/*
 udevrules_DATA = 70-infrared.rules
+if WITH_BPF
+if HAVE_SYSTEMD
 if HAVE_UDEVDSYSCALLFILTER
 systemdsystemunit_DATA = 50-rc_keymap.conf
 endif
+endif
+endif
 
 ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h
 
-- 
2.29.2

