Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDFBB32BB0A
	for <lists+linux-media@lfdr.de>; Wed,  3 Mar 2021 22:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358609AbhCCMOP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 07:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbhCCKa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 05:30:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C071C06178A
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 02:30:16 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <uol@pengutronix.de>)
        id 1lHOli-0001WG-R1; Wed, 03 Mar 2021 11:30:14 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <uol@pengutronix.de>)
        id 1lHOli-0007uo-I2; Wed, 03 Mar 2021 11:30:14 +0100
From:   =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH v4l-utils] keytable: fix typo
Date:   Wed,  3 Mar 2021 11:30:12 +0100
Message-Id: <20210303103012.30366-1-u.oelmann@pengutronix.de>
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

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 utils/keytable/50-rc_keymap.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/keytable/50-rc_keymap.conf b/utils/keytable/50-rc_keymap.conf
index 6066c50c6476..dc871d739a39 100644
--- a/utils/keytable/50-rc_keymap.conf
+++ b/utils/keytable/50-rc_keymap.conf
@@ -1,3 +1,3 @@
-# ir-keytable needs access to bpf in order load BPF decoders
+# ir-keytable needs access to bpf in order to load BPF decoders
 [Service]
 SystemCallFilter=bpf
-- 
2.29.2

