Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B55EB14C9F4
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 12:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgA2LyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 06:54:24 -0500
Received: from gofer.mess.org ([88.97.38.141]:37937 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726604AbgA2LyV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 06:54:21 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9AC90C6460; Wed, 29 Jan 2020 11:54:19 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v4l-utils 3/4] Add keymap for Samsung AK59-00125A remote
Date:   Wed, 29 Jan 2020 11:54:18 +0000
Message-Id: <20200129115419.8456-4-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129115419.8456-1-sean@mess.org>
References: <20200129115419.8456-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 .../samsung_ak59_00125a.toml                  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 utils/keytable/rc_keymaps_userspace/samsung_ak59_00125a.toml

diff --git a/utils/keytable/rc_keymaps_userspace/samsung_ak59_00125a.toml b/utils/keytable/rc_keymaps_userspace/samsung_ak59_00125a.toml
new file mode 100644
index 00000000..5d068f7c
--- /dev/null
+++ b/utils/keytable/rc_keymaps_userspace/samsung_ak59_00125a.toml
@@ -0,0 +1,69 @@
+[[protocols]]
+name = 'Samsung AK59-00125A'
+protocol = 'pulse_distance'
+header_pulse = 4500
+header_space = 4500
+bit_pulse = 600
+bit_0_space = 500
+bit_1_space = 1600
+bits = 32
+margin = 300
+trailer_pulse = 600
+[protocols.scancodes]
+0xe0e040bf = "KEY_POWER2"
+# input
+0xe0e0807f = "KEY_VIDEO"
+0xe0e0e01f = "KEY_VOLUMEUP"
+0xe0e0d02f = "KEY_VOLUMEDOWN"
+0xe0e0f00f = "KEY_MUTE"
+0xe0e048b7 = "KEY_CHANNELUP"
+0xe0e008f7 = "KEY_CHANNELDOWN"
+[[protocols]]
+protocol = 'samsung36'
+[protocols.scancodes]
+0x400e00ff = "KEY_POWER"
+# bonus view
+0x400ecc33 = "KEY_VENDOR"
+0x400e807f = "KEY_EJECTCD"
+0x400e40bf = "KEY_NUMERIC_1"
+0x400ec03f = "KEY_NUMERIC_2"
+0x400e20df = "KEY_NUMERIC_3"
+0x400ea05f = "KEY_NUMERIC_4"
+0x400e609f = "KEY_NUMERIC_5"
+0x400ee01f = "KEY_NUMERIC_6"
+0x400e10ef = "KEY_NUMERIC_7"
+0x400e906f = "KEY_NUMERIC_8"
+0x400e50af = "KEY_NUMERIC_9"
+0x400ed02f = "KEY_NUMERIC_0"
+0x400ea45b = "KEY_AUDIO"
+0x400e649b = "KEY_SUBTITLE"
+0x400eb04f = "KEY_PREVIOUS"
+0x400e8877 = "KEY_NEXT"
+0x400e48b7 = "KEY_FASTREVERSE"
+0x400ea857 = "KEY_FASTFORWARD"
+0x400ec837 = "KEY_STOP"
+0x400e28d7 = "KEY_PLAY"
+0x400e4cb3 = "KEY_PAUSE"
+# disc menu
+0x400eb847 = "KEY_ROOT_MENU" 
+0x400e6897 = "KEY_MENU"
+# title menu/popup
+0x400e04fb = "KEY_TITLE"
+# tools
+0x400e5ca3 = "KEY_CONFIG"
+0x400e7887 = "KEY_INFO"
+0x400e18e7 = "KEY_UP"
+0x400ed827 = "KEY_LEFT"
+0x400e58a7 = "KEY_RIGHT"
+0x400e9867 = "KEY_DOWN"
+0x400e38c7 = "KEY_ENTER"
+0x400ee817 = "KEY_ESC"
+0x400ed42b = "KEY_EXIT"
+0x400e847b = "KEY_RED"
+0x400e44bb = "KEY_GREEN"
+0x400ec43b = "KEY_YELLOW"
+0x400e24db = "KEY_BLUE"
+# smart/hub
+0x400e1ce3 = "KEY_VENDOR"
+0x400ebc43 = "KEY_SEARCH"
+0x400ee41b = "KEY_MEDIA_REPEAT"
-- 
2.24.1

