Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88D3477C70
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2019 01:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfG0Xsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 19:48:43 -0400
Received: from gofer.mess.org ([88.97.38.141]:48977 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726575AbfG0Xsm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 19:48:42 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 41442603FC; Sun, 28 Jul 2019 00:48:41 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: rc: describe rc protocols and their scancodes
Date:   Sun, 28 Jul 2019 00:48:40 +0100
Message-Id: <20190727234840.3357-2-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190727234840.3357-1-sean@mess.org>
References: <20190727234840.3357-1-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 .../media/uapi/rc/lirc-dev-intro.rst          |  10 +-
 Documentation/media/uapi/rc/lirc-read.rst     |   3 +-
 Documentation/media/uapi/rc/lirc-write.rst    |   3 +-
 Documentation/media/uapi/rc/rc-protos.rst     | 461 ++++++++++++++++++
 .../media/uapi/rc/remote_controllers.rst      |   1 +
 5 files changed, 472 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/media/uapi/rc/rc-protos.rst

diff --git a/Documentation/media/uapi/rc/lirc-dev-intro.rst b/Documentation/media/uapi/rc/lirc-dev-intro.rst
index a8733c8df2e7..95699a05f4a3 100644
--- a/Documentation/media/uapi/rc/lirc-dev-intro.rst
+++ b/Documentation/media/uapi/rc/lirc-dev-intro.rst
@@ -66,11 +66,12 @@ on the following table.
 
     For transmitting (aka sending), create a ``struct lirc_scancode`` with
     the desired scancode set in the ``scancode`` member, :c:type:`rc_proto`
-    set the IR protocol, and all other members set to 0. Write this struct to
-    the lirc device.
+    set the :ref:`IR protocol <Remote_controllers_Protocols>`, and all other
+    members set to 0. Write this struct to the lirc device.
 
     For receiving, you read ``struct lirc_scancode`` from the lirc device,
-    with ``scancode`` set to the received scancode and the IR protocol
+    with ``scancode`` set to the received scancode and the
+    :ref:`IR protocol <Remote_controllers_Protocols>` set in
     :c:type:`rc_proto`. If the scancode maps to a valid key code, this is set
     in the ``keycode`` field, else it is set to ``KEY_RESERVED``.
 
@@ -146,7 +147,8 @@ on the following table.
 BPF based IR decoder
 ********************
 
-The kernel has support for decoding the most common IR protocols, but there
+The kernel has support for decoding the most common
+:ref:`IR protocol <Remote_controllers_Protocols>`, but there
 are many protocols which are not supported. To support these, it is possible
 to load an BPF program which does the decoding. This can only be done on
 LIRC devices which support reading raw IR.
diff --git a/Documentation/media/uapi/rc/lirc-read.rst b/Documentation/media/uapi/rc/lirc-read.rst
index a8fedfaaf0ab..256e520bc27e 100644
--- a/Documentation/media/uapi/rc/lirc-read.rst
+++ b/Documentation/media/uapi/rc/lirc-read.rst
@@ -62,7 +62,8 @@ read from the chardev.
 Alternatively, :ref:`LIRC_MODE_SCANCODE <lirc-mode-scancode>` can be available,
 in this mode scancodes which are either decoded by software decoders, or
 by hardware decoders. The :c:type:`rc_proto` member is set to the
-protocol used for transmission, and ``scancode`` to the decoded scancode,
+:ref:`IR protocol <Remote_controllers_Protocols>`
+used for transmission, and ``scancode`` to the decoded scancode,
 and the ``keycode`` set to the keycode or ``KEY_RESERVED``.
 
 
diff --git a/Documentation/media/uapi/rc/lirc-write.rst b/Documentation/media/uapi/rc/lirc-write.rst
index 6adf5ddbac99..eafe13203ea3 100644
--- a/Documentation/media/uapi/rc/lirc-write.rst
+++ b/Documentation/media/uapi/rc/lirc-write.rst
@@ -64,7 +64,8 @@ driver returns ``EINVAL``.
 When in :ref:`LIRC_MODE_SCANCODE <lirc-mode-scancode>` mode, one
 ``struct lirc_scancode`` must be written to the chardev at a time, else
 ``EINVAL`` is returned. Set the desired scancode in the ``scancode`` member,
-and the protocol in the :c:type:`rc_proto`: member. All other members must be
+and the :ref:`IR protocol <Remote_controllers_Protocols>` in the
+:c:type:`rc_proto`: member. All other members must be
 set to 0, else ``EINVAL`` is returned. If there is no protocol encoder
 for the protocol or the scancode is not valid for the specified protocol,
 ``EINVAL`` is returned. The write function blocks until the scancode
diff --git a/Documentation/media/uapi/rc/rc-protos.rst b/Documentation/media/uapi/rc/rc-protos.rst
new file mode 100644
index 000000000000..8481342d6f62
--- /dev/null
+++ b/Documentation/media/uapi/rc/rc-protos.rst
@@ -0,0 +1,461 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/media/uapi/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _Remote_controllers_Protocols:
+
+*****************************************
+Remote Controller Protocols and Scancodes
+*****************************************
+
+IR is encoded as a series of pulses and spaces, using a protocol. These
+rotocols can encode e.g. an address (which device should respond) and a
+command: what it should do. The values for these are not always consistent
+across different devices for a given protocol.
+
+Therefore out the output of the IR decoder is a scancode; a single u32
+value. Using tables this can be mapped to linux key codes.
+
+Other things can be encoded too. Some IR protocols encode a toggle bit; this
+is to distinguish whether the same button is being held down, or has been
+released and pressed again. If has been released and pressed again, the
+toggle bit will invert from one IR message to the next.
+
+Some remotes have a pointer-type device which can used to control the
+mouse; some air conditioning systems can have their target temperature
+target set in IR.
+
+These are the protocols the kernel knows about and how scancodes are
+encoded.
+
+rc-5 (RC_PROTO_RC5)
+-------------------
+
+This IR protocol uses manchester encoding to encode 14 bits. There is a
+detailed description here https://www.sbprojects.net/knowledge/ir/rc5.php.
+
+The scancode encoding is *not* consistent with the lirc daemon (lircd) rc5
+protocol, or the manchester bpf decoder.
+
+.. flat-table:: rc5 bits scancode mapping
+   :widths:       1 1 2
+
+   * - rc-5 bits
+
+     - scancode bit
+
+     - description
+
+   * - 1
+
+     - none
+
+     - Start bit, always set
+
+   * - 1
+
+     - 6 (inverted)
+
+     - 2nd start bit in rc5,  re-used as 6th command bit
+
+   * - 1
+
+     - none
+
+     - Toggle bit
+
+   * - 5
+
+     - 8 to 13
+
+     - Address
+
+   * - 6
+
+     - 0 to 5
+
+     - Command
+
+There is a variant of rc5 called either rc5x or extended rc5
+where there the second stop bit is the 6th commmand bit, but inverted.
+This is done so it the scancodes and encoding is compatible with existing
+schemes. This bit is stored in bit 6 of the scancode, inverted. This is
+done to keep it compatible with plain rc-5 where there are two start bits.
+
+rc-5-sz (RC_PROTO_RC5_SZ)
+-------------------------
+This is much like rc-5 but one bit longer. The scancode is encoded
+differently.
+
+.. flat-table:: rc-5-sz bits scancode mapping
+   :widths:       1 1 2
+
+   * - rc-5-sz bits
+
+     - scancode bit
+
+     - description
+
+   * - 1
+
+     - none
+
+     - Start bit, always set
+
+   * - 1
+
+     - 13
+
+     - Address bit
+
+   * - 1
+
+     - none
+
+     - Toggle bit
+
+   * - 6
+
+     - 6 to 11
+
+     - Address
+
+   * - 6
+
+     - 0 to 5
+
+     - Command
+
+rc-5x-20 (RC_PROTO_RC5X_20)
+---------------------------
+
+This rc-5 extended to encoded 20 bits. The is a 3555 microseconds space
+after the 8th bit.
+
+.. flat-table:: rc-5x-20 bits scancode mapping
+   :widths:       1 1 2
+
+   * - rc-5-sz bits
+
+     - scancode bit
+
+     - description
+
+   * - 1
+
+     - none
+
+     - Start bit, always set
+
+   * - 1
+
+     - 14
+
+     - Address bit
+
+   * - 1
+
+     - none
+
+     - Toggle bit
+
+   * - 5
+
+     - 16 to 20
+
+     - Address
+
+   * - 6
+
+     - 8 to 13
+
+     - Address
+
+   * - 6
+
+     - 0 to 5
+
+     - Command
+
+
+jvc (RC_PROTO_JVC)
+------------------
+
+The jvc protocol is much like nec, without the inverted values. It is
+described here https://www.sbprojects.net/knowledge/ir/jvc.php.
+
+The scancode is a 16 bits value, where the address is the lower 8 bits
+and the command the higher 8 bits; this is reversed from IR order.
+
+sony-12 (RC_PROTO_SONY12)
+-------------------------
+
+The sony protocol is a pulse-width encoding. There are three variants,
+which just differ in number of bits and scancode encoding.
+
+.. flat-table:: sony-12 bits scancode mapping
+   :widths:       1 1 2
+
+   * - sony-12 bits
+
+     - scancode bit
+
+     - description
+
+   * - 5
+
+     - 16 to 20
+
+     - device
+
+   * - 7
+
+     - 0 to 6
+
+     - function
+
+sony-15 (RC_PROTO_SONY15)
+-------------------------
+
+The sony protocol is a pulse-width encoding. There are three variants,
+which just differ in number of bits and scancode encoding.
+
+.. flat-table:: sony-12 bits scancode mapping
+   :widths:       1 1 2
+
+   * - sony-12 bits
+
+     - scancode bit
+
+     - description
+
+   * - 8
+
+     - 16 to 23
+
+     - device
+
+   * - 7
+
+     - 0 to 6
+
+     - function
+
+sony-20 (RC_PROTO_SONY20)
+-------------------------
+
+The sony protocol is a pulse-width encoding. There are three variants,
+which just differ in number of bits and scancode encoding.
+
+.. flat-table:: sony-20 bits scancode mapping
+   :widths:       1 1 2
+
+   * - sony-20 bits
+
+     - scancode bit
+
+     - description
+
+   * - 5
+
+     - 16 to 20
+
+     - device
+
+   * - 7
+
+     - 0 to 7
+
+     - device
+
+   * - 8
+
+     - 8 to 15
+
+     - extended bits
+
+nec (RC_PROTO_NEC)
+------------------
+
+The nec protocol encodes an 8 bit address and an 8 bit command. It is
+described here https://www.sbprojects.net/knowledge/ir/nec.php. Note
+that the protocol sends least significant bit first.
+
+As a check, the nec protocol sends the address and command twice; the
+second time it is inverted. This is done for verification.
+
+A plain nec IR message has 16 bits; the high 8 bits are the address
+and the low 8 bits are the command.
+
+nec-x (RC_PROTO_NECX)
+---------------------
+
+Extended nec has a 16 bit address and a 8 bit command. This is encoded
+as a 24 bit value as you would expect, with the lower 8 bits the command
+and the upper 16 bits the address.
+
+nec-32 (RC_PROTO_NEC32)
+-----------------------
+
+nec-32 does not send an inverted address or an inverted command; the
+entire message, all 32 bits, are used.
+
+For this to be decoded correctly, the second 8 bits must not be the
+inverted value of the first, and also the last 8 bits must not be the
+inverted value of the third 8 bit value.
+
+The scancode has a somewhat unusual encoding.
+
+.. flat-table:: nec-32 bits scancode mapping
+
+   * - nec-32 bits
+
+     - scancode bit
+
+   * - First 8 bits
+
+     - 16 to 23
+
+   * - Second 8 bits
+
+     - 24 to 31
+
+   * - Third 8 bits
+
+     - 0 to 7
+
+   * - Fourth 8 bits
+
+     - 8 to 15
+
+sanyo (RC_PROTO_SANYO)
+----------------------
+
+The sanyo protocol is like the nec protocol, but with 13 bits address
+rather than 8 bits. Both the address and the command are followed by
+their inverted versions, but these are not present in the scancodes.
+
+Bis 8 to 20 of the scancode is the 13 bits address, and the lower 8
+bits are the command.
+
+mcir2-kbd (RC_PROTO_MCIR2_KBD)
+------------------------------
+
+This protocol is generated by the Microsoft MCE keyboard for keyboard
+events. Refer to the ir-mce_kbd-decoder.c to see how it is encoded.
+
+mcir2-mse (RC_PROTO_MCIR2_MSE)
+------------------------------
+
+This protocol is generated by the Microsoft MCE keyboard for pointer
+events. Refer to the ir-mce_kbd-decoder.c to see how it is encoded.
+
+rc-6-0 (RC_PROTO_RC6_0)
+-----------------------
+
+This is the rc-6 in mode 0. rc-6 is described here
+https://www.sbprojects.net/knowledge/ir/rc6.php.
+The scancode is the exact 16 bits as in the protocol. There is also a
+toggle bit.
+
+rc-6-6a-20 (RC_PROTO_RC6_6A_20)
+-------------------------------
+
+This is the rc-6 in mode 6a, 20 bits. rc-6 is described here
+https://www.sbprojects.net/knowledge/ir/rc6.php.
+The scancode is the exact 20 bits
+as in the protocol. There is also a toggle bit.
+
+rc-6-6a-24 (RC_PROTO_RC6_6A_24)
+-------------------------------
+
+This is the rc-6 in mode 6a, 24 bits. rc-6 is described here
+https://www.sbprojects.net/knowledge/ir/rc6.php.
+The scancode is the exact 24 bits
+as in the protocol. There is also a toggle bit.
+
+rc-6-6a-32 (RC_PROTO_RC6_6A_32)
+-------------------------------
+
+This is the rc-6 in mode 6a, 32 bits. rc-6 is described here
+https://www.sbprojects.net/knowledge/ir/rc6.php.
+The upper 16 bits are the vendor,
+and the lower 16 bits are the vendor-specific bits. This protocol is
+for the non-Microsoft MCE variant (vendor != 0x800f).
+
+
+rc-6-mce (RC_PROTO_RC6_MCE)
+---------------------------
+
+This is the rc-6 in mode 6a, 32 bits. The upper 16 bits are the vendor,
+and the lower 16 bits are the vendor-specific bits. This protocol is
+for the Microsoft MCE variant (vendor = 0x800f). The toggle bit in the
+protocol itself is ignored, and the 16th bit should be takes as the toggle
+bit.
+
+sharp (RC_PROTO_SHARP)
+----------------------
+
+This is a protocol used by Sharp VCRs, is described here
+https://www.sbprojects.net/knowledge/ir/sharp.php. There is a very long
+(40ms) space between the normal and inverted values, and some IR receivers
+cannot decode this.
+
+There is a 5 bit address and a 8 bit command. In the scancode the address is
+in bits 8 to 12, and the command in bits 0 to 7.
+
+xmp (RC_PROTO_XMP)
+------------------
+
+This protocol has several versions and only version 1 is supported. Refer
+to the decoder (ir-xmp-decoder.c) to see how it is encoded.
+
+
+cec (RC_PROTO_CEC)
+------------------
+
+This is not an IR protocol, this is a protocol over CEC. The CEC
+infrastructure uses rc-core for handling CEC commands, so that they
+can easily be remapped.
+
+imon (RC_PROTO_IMON)
+--------------------
+
+This protocol is used by Antec Veris/SoundGraph iMON remotes.
+
+The protocol
+describes both button presses and pointer movements. The protocol encodes
+31 bits, and the scancode is simply the 31 bits with the top bit always 0.
+
+rc-mm-12 (RC_PROTO_RCMM12)
+--------------------------
+
+The rc-mm protocol is described here
+https://www.sbprojects.net/knowledge/ir/rcmm.php. The scancode is simply
+the 12 bits.
+
+rc-mm-24 (RC_PROTO_RCMM24)
+--------------------------
+
+The rc-mm protocol is described here
+https://www.sbprojects.net/knowledge/ir/rcmm.php. The scancode is simply
+the 24 bits.
+
+rc-mm-32 (RC_PROTO_RCMM32)
+--------------------------
+
+The rc-mm protocol is described here
+https://www.sbprojects.net/knowledge/ir/rcmm.php. The scancode is simply
+the 32 bits.
+
+xbox-dvd (RC_PROTO_XBOX_DVD)
+----------------------------
+
+This protocol is used by XBox DVD Remote, which was made for the original
+XBox. There is no in-kernel decoder or encoder for this protocol. The usb
+device decodes the protocol. There is a BPF decoder available in v4l-utils.
diff --git a/Documentation/media/uapi/rc/remote_controllers.rst b/Documentation/media/uapi/rc/remote_controllers.rst
index 3051f7abe11d..20e0f986df49 100644
--- a/Documentation/media/uapi/rc/remote_controllers.rst
+++ b/Documentation/media/uapi/rc/remote_controllers.rst
@@ -27,6 +27,7 @@ Part III - Remote Controller API
 
     rc-intro
     rc-sysfs-nodes
+    rc-protos
     rc-tables
     rc-table-change
     lirc-dev
-- 
2.21.0

