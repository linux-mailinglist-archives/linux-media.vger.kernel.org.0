Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09771464A0
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 10:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgAWJa4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 04:30:56 -0500
Received: from gofer.mess.org ([88.97.38.141]:33087 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbgAWJa4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 04:30:56 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id EC22111A001; Thu, 23 Jan 2020 09:30:54 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] rc_keymap.5: improve wording around using rc_keymaps for sending
Date:   Thu, 23 Jan 2020 09:30:54 +0000
Message-Id: <20200123093054.6754-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/rc_keymap.5.in | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/utils/keytable/rc_keymap.5.in b/utils/keytable/rc_keymap.5.in
index 1a3f00b5..4c3da834 100644
--- a/utils/keytable/rc_keymap.5.in
+++ b/utils/keytable/rc_keymap.5.in
@@ -3,7 +3,7 @@
 rc_keymap \- toml file describing remote control keymap
 .SH DESCRIPTION
 An rc_keymap describes a remote control. It list the protocols used, and the
-mapping from decoded IR to linux input events. This file is used by
+mapping from decoded IR to linux input keycodes. This file is used by
 ir\-keytable(1) for IR decoding, and by ir-ctl(1) for sending IR.
 .PP
 The file format is toml. Since a remote control can use multiple protocols,
@@ -15,8 +15,8 @@ For each protocol the remote uses, there should be one entry in the top level
 \fBprotocols\fR array.
 .SS Name Field
 Each protocols entry has a \fBname\fR field. The name is not used by
-ir\-keytable, but can be used to give the remote control a more descriptive
-name than the file name, e.g. the model number.
+ir\-keytable or ir\-ctl, but can be used to give the remote control a more
+descriptive name than the file name, e.g. the model number.
 .SS Protocol Field
 The \fBprotocol\fR field specifies the protocol. This can either be one of the
 linux kernel decoders, in which case it is \fBnec\fR, \fBrc\-5\fR, \fBrc\-6\fR,
@@ -34,8 +34,7 @@ for how to write your own.
 .SS Variant Field
 The \fBvariant\fR field specifies which variant a particular protocol uses.
 The \fBsony\fR, \fBrc-5\fR, \fBrc-6\fR protocols have different bit length
-variants, for example. This field is not currently used. However, this is
-needed should the keymap be used for sending IR, rather than decoding it.
+variants, for example. This field is used by ir\-ctl when sending IR.
 .PP
 The following variants are currently defined:
 .PP
@@ -52,20 +51,22 @@ Protocol \fBrc\-mm\fR has variants \fBrc-mm-12\fR, \fBrc-mm-24\fR, and
 \fBrc-mm-32\fR.
 .SS Scancodes field
 The \fBscancodes\fR table list the scancodes and the mapping to linux input
-key events. Multiple scancodes can map to the same key event. This field
+keycode. Multiple scancodes can map to the same keycode. The scancodes field
 is not present for \fBraw\fR protocols.
 .PP
 If the scancode start with 0x, it is interpreted as a hexadecimal number. If
 it starts with a 0, it is interpreted as an octal number.
 .PP
-The key events are listed in the \fBinput-event-codes.h\fR header file.
+Valid keycodes are listed in the \fBinput-event-codes.h\fR header file.
 Examples are \fBKEY_ENTER\fR, \fBKEY_ESC\fR or \fBBTN_LEFT\fR for the left
-mouse button.
+mouse button. Note that if the keymap is only used for sending IR, then
+the key does not have to be a valid linux keycode. It can be any string
+without whitespace.
 .SS Raw field
 If the protocol is \fBraw\fR, the \fBraw\fR field is an array of keycode
 to raw mapping. For each entry, there is a \fBkeycode\fR field and \fBraw\fR
-field. The \fBkeycode\fR is a linux input event, as explained the scancodes
-section.
+field. The \fBkeycode\fR is a linux input keycode, as explained in the
+scancodes field above.
 .PP
 The \fBraw\fR field is an string, which lists pulse and space values,
 separated by whitespace. The first is a pulse value microseconds, and
-- 
2.24.1

