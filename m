Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9609C30290E
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 18:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731140AbhAYRhF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 12:37:05 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:51925 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730620AbhAYRgX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 12:36:23 -0500
X-Greylist: delayed 14529 seconds by postgrey-1.27 at vger.kernel.org; Mon, 25 Jan 2021 12:36:22 EST
X-Originating-IP: 82.255.60.242
Received: from localhost.localdomain (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 25E2C40003;
        Mon, 25 Jan 2021 17:35:32 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 1/2] keytable: Add Dell RC 260 keymap
Date:   Mon, 25 Jan 2021 18:35:30 +0100
Message-Id: <20210125173531.644122-1-hadess@hadess.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Apparently used in the Dell Inspiron Zino HD 410 desktop:
http://web.archive.org/web/20180805000711/http://www.dell.com/ba/p/desktops/inspiron-zino-hd-410/pd

Manual linked in the remote definition itself.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 utils/keytable/rc_keymaps/dell_rc260.toml | 49 +++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 utils/keytable/rc_keymaps/dell_rc260.toml

diff --git a/utils/keytable/rc_keymaps/dell_rc260.toml b/utils/keytable/rc_keymaps/dell_rc260.toml
new file mode 100644
index 00000000..603d3a18
--- /dev/null
+++ b/utils/keytable/rc_keymaps/dell_rc260.toml
@@ -0,0 +1,49 @@
+[[protocols]]
+name = "dell_rc260"
+protocol = "rc6"
+variant = "rc6_mce"
+# https://archive.org/details/manualsonline-id-b1c9aa7c-e060-40b0-816a-918536a02fac/
+[protocols.scancodes]
+0x803404a9 = "KEY_HOMEPAGE"
+0x8034040c = "KEY_POWER"
+0x80340437 = "KEY_RECORD"
+0x80340430 = "KEY_PAUSE"
+0x80340431 = "KEY_STOP"
+0x80340429 = "KEY_REWIND"
+0x8034042c = "KEY_PLAY"
+0x80340428 = "KEY_FASTFORWARD"
+0x80340421 = "KEY_PREVIOUS"
+0x80340420 = "KEY_NEXT"
+0x80340483 = "KEY_BACK"
+0x803404cb = "KEY_INFO"
+0x8034045d = "KEY_LEFTMETA"
+0x80340458 = "KEY_UP"
+0x8034045a = "KEY_LEFT"
+0x8034045b = "KEY_RIGHT"
+0x80340459 = "KEY_DOWN"
+0x8034045c = "KEY_OK"
+0x80340410 = "KEY_VOLUMEUP"
+0x80340411 = "KEY_VOLUMEDOWN"
+0x8034041e = "KEY_CHANNELUP"
+0x8034041f = "KEY_CHANNELDOWN"
+0x8034040d = "KEY_MUTE"
+0x80340401 = "KEY_NUMERIC_1"
+0x80340402 = "KEY_NUMERIC_2"
+0x80340403 = "KEY_NUMERIC_3"
+0x80340404 = "KEY_NUMERIC_4"
+0x80340405 = "KEY_NUMERIC_5"
+0x80340406 = "KEY_NUMERIC_6"
+0x80340407 = "KEY_NUMERIC_7"
+0x80340408 = "KEY_NUMERIC_8"
+0x80340409 = "KEY_NUMERIC_9"
+0x80340400 = "KEY_NUMERIC_0"
+0x80340433 = "KEY_NUMERIC_STAR"
+0x80340432 = "KEY_NUMERIC_POUND"
+0x8034043a = "KEY_CLEAR"
+# Teletext key doesn't light the IR LED
+0x8034043e = "KEY_EPG"
+0x80340434 = "KEY_ENTER" # labelled Enter
+0x8034046d = "KEY_RED"
+0x8034046e = "KEY_GREEN"
+0x8034046f = "KEY_YELLOW"
+0x80340470 = "KEY_BLUE"
-- 
2.29.2

