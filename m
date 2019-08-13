Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0528B9D2
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 15:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728719AbfHMNQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 09:16:45 -0400
Received: from gofer.mess.org ([88.97.38.141]:38037 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbfHMNQp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 09:16:45 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7F130603E8; Tue, 13 Aug 2019 14:16:44 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc: imon-rsc keymap has incorrect mappings
Date:   Tue, 13 Aug 2019 14:16:44 +0100
Message-Id: <20190813131644.15984-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

KEY_MAX is not a key but designates the highest value a linux keycode
can ever have.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/keymaps/rc-imon-rsc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/keymaps/rc-imon-rsc.c b/drivers/media/rc/keymaps/rc-imon-rsc.c
index 6f7ee4859682..38787dd0e4a0 100644
--- a/drivers/media/rc/keymaps/rc-imon-rsc.c
+++ b/drivers/media/rc/keymaps/rc-imon-rsc.c
@@ -7,7 +7,8 @@
 
 //
 // Note that this remote has a stick which its own IR protocol,
-// with 16 directions. This is not supported yet.
+// with 16 directions. This is supported by the imon_rsc BPF decoder
+// in v4l-utils.
 //
 static struct rc_map_table imon_rsc[] = {
 	{ 0x801010, KEY_EXIT },
@@ -25,7 +26,7 @@ static struct rc_map_table imon_rsc[] = {
 	{ 0x80105c, KEY_NUMERIC_9 },
 	{ 0x801081, KEY_SCREEN },	/* Desktop */
 	{ 0x80105d, KEY_NUMERIC_0 },
-	{ 0x801082, KEY_MAX },
+	{ 0x801082, KEY_ZOOM },		/* Maximise */
 	{ 0x801048, KEY_ESC },
 	{ 0x80104b, KEY_MEDIA },	/* Windows key */
 	{ 0x801083, KEY_MENU },
@@ -52,7 +53,7 @@ static struct rc_map_table imon_rsc[] = {
 	{ 0x80104e, KEY_STOP },
 	{ 0x801052, KEY_REWIND },
 	{ 0x801053, KEY_FASTFORWARD },
-	{ 0x801089, KEY_ZOOM }		/* full screen */
+	{ 0x801089, KEY_FULL_SCREEN }	/* full screen */
 };
 
 static struct rc_map_list imon_rsc_map = {
-- 
2.21.0

