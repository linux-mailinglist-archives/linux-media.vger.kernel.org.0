Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF4E30292F
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 18:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731141AbhAYRgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 12:36:53 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:42619 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731136AbhAYRga (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 12:36:30 -0500
X-Originating-IP: 82.255.60.242
Received: from localhost.localdomain (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id AB39540002;
        Mon, 25 Jan 2021 17:35:33 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 2/2] keytable: Add XBox 360 Universal Media Remote
Date:   Mon, 25 Jan 2021 18:35:31 +0100
Message-Id: <20210125173531.644122-2-hadess@hadess.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125173531.644122-1-hadess@hadess.net>
References: <20210125173531.644122-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 utils/keytable/rc_keymaps/xbox_360.toml | 52 +++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 utils/keytable/rc_keymaps/xbox_360.toml

diff --git a/utils/keytable/rc_keymaps/xbox_360.toml b/utils/keytable/rc_keymaps/xbox_360.toml
new file mode 100644
index 00000000..214ed6c3
--- /dev/null
+++ b/utils/keytable/rc_keymaps/xbox_360.toml
@@ -0,0 +1,52 @@
+[[protocols]]
+name = "xbox_360"
+protocol = "rc6"
+variant = "rc6_mce"
+[protocols.scancodes]
+# http://download.microsoft.com/download/b/c/e/bce76f3f-db51-4c98-b79d-b3d21e90ccc1/universalmediaremote_na_0609.pdf
+0x800f7428 = "KEY_EJECTCD"
+0x800f7464 = "KEY_HOMEPAGE"
+0x800f740c = "KEY_POWER"
+0x800f7419 = "KEY_STOP"
+0x800f7418 = "KEY_PAUSE"
+0x800f7415 = "KEY_REWIND"
+0x800f7414 = "KEY_FASTFORWARD"
+0x800f741b = "KEY_PREVIOUS"
+0x800f741a = "KEY_NEXT"
+0x800f7416 = "KEY_PLAY"
+0x800f744f = "KEY_PROPS" # Display
+0x800f7423 = "KEY_BACK"
+0x800f7424 = "KEY_MEDIA_TOP_MENU" # DVD Menu
+0x800f7451 = "KEY_ROOT_MENU" # Title
+0x800f740f = "KEY_INFO"
+0x800f741e = "KEY_UP"
+0x800f7420 = "KEY_LEFT"
+0x800f7421 = "KEY_RIGHT"
+0x800f741f = "KEY_DOWN"
+0x800f7422 = "KEY_OK"
+0x800f7426 = "KEY_YELLOW"
+0x800f7468 = "KEY_BLUE"
+0x800f7466 = "KEY_GREEN"
+0x800f7425 = "KEY_RED"
+0x800f7410 = "KEY_VOLUMEUP"
+0x800f7411 = "KEY_VOLUMEDOWN"
+# TV key doesn't light the IR LED
+0x800f740e = "KEY_MUTE"
+0x800f746c = "KEY_CHANNELUP"
+0x800f746d = "KEY_CHANNELDOWN"
+0x800f740d = "KEY_LEFTMETA"
+0x800f740b = "KEY_ENTER"
+0x800f7417 = "KEY_RECORD"
+0x800f740a = "KEY_CLEAR"
+0x800f7401 = "KEY_NUMERIC_1"
+0x800f7402 = "KEY_NUMERIC_2"
+0x800f7403 = "KEY_NUMERIC_3"
+0x800f7404 = "KEY_NUMERIC_4"
+0x800f7405 = "KEY_NUMERIC_5"
+0x800f7406 = "KEY_NUMERIC_6"
+0x800f7407 = "KEY_NUMERIC_7"
+0x800f7408 = "KEY_NUMERIC_8"
+0x800f7409 = "KEY_NUMERIC_9"
+0x800f7400 = "KEY_NUMERIC_0"
+0x800f741d = "KEY_102ND" # labeled 100
+0x800f741c = "KEY_CANCEL"
-- 
2.29.2

