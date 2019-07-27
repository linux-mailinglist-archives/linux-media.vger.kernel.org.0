Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A71377C6F
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2019 01:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfG0Xsm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 19:48:42 -0400
Received: from gofer.mess.org ([88.97.38.141]:44061 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbfG0Xsm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 19:48:42 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 18F6860474; Sun, 28 Jul 2019 00:48:40 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: lirc: document BPF IR decoding
Date:   Sun, 28 Jul 2019 00:48:39 +0100
Message-Id: <20190727234840.3357-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is just a start.

Signed-off-by: Sean Young <sean@mess.org>
---
 .../media/uapi/rc/lirc-dev-intro.rst          | 47 +++++++++++++++----
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/Documentation/media/uapi/rc/lirc-dev-intro.rst b/Documentation/media/uapi/rc/lirc-dev-intro.rst
index 1a901d8e1797..a8733c8df2e7 100644
--- a/Documentation/media/uapi/rc/lirc-dev-intro.rst
+++ b/Documentation/media/uapi/rc/lirc-dev-intro.rst
@@ -20,6 +20,9 @@ data between userspace and kernelspace. Fundamentally, it is just a chardev
 file_operations defined on it. With respect to transporting raw IR and
 decoded scancodes to and fro, the essential fops are read, write and ioctl.
 
+It is also possible to attach a BPF program to a LIRC device for decoding
+raw IR into scancodes.
+
 Example dmesg output upon a driver registering w/LIRC:
 
 .. code-block:: none
@@ -34,6 +37,16 @@ What you should see for a chardev:
     $ ls -l /dev/lirc*
     crw-rw---- 1 root root 248, 0 Jul 2 22:20 /dev/lirc0
 
+Note that the package `v4l-utils <https://git.linuxtv.org/v4l-utils.git/>`_
+contains tools for working with LIRC devices:
+
+ - ir-ctl: can receive raw IR and transmit IR, as well as query LIRC
+   device features.
+
+ - ir-keytable: can load keymaps; allows you to set IR kernel protocols; load
+   BPF IR decoders and test IR decoding. Some BPF IR decoders are also
+   provided.
+
 .. _lirc_modes:
 
 **********
@@ -129,12 +142,28 @@ on the following table.
 
     This mode is used only for IR send.
 
-
-**************************
-Remote Controller protocol
-**************************
-
-An enum :c:type:`rc_proto` in the :ref:`lirc_header` lists all the
-supported IR protocols:
-
-.. kernel-doc:: include/uapi/linux/lirc.h
+********************
+BPF based IR decoder
+********************
+
+The kernel has support for decoding the most common IR protocols, but there
+are many protocols which are not supported. To support these, it is possible
+to load an BPF program which does the decoding. This can only be done on
+LIRC devices which support reading raw IR.
+
+First, using the `bpf(2)`_ syscall with the ``BPF_LOAD_PROG`` argument,
+program must be loaded of type ``BPF_PROG_TYPE_LIRC_MODE2``. Once attached
+to the LIRC device, this program will be called for each pulse, space or
+timeout event on the LIRC device. The context for the BPF program is a
+pointer to a unsigned int, which is a :ref:`LIRC_MODE_MODE2 <lirc-mode-mode2>`
+value. When the program has decoded the scancode, it can be submitted using
+the BPF functions ``bpf_rc_keydown()`` or ``bpf_rc_repeat()``. Mouse or pointer
+movements can be reported using ``bpf_rc_pointer_rel()``.
+
+Once you have the file descriptor for the ``BPF_PROG_TYPE_LIRC_MODE2`` BPF
+program, it can be attached to the LIRC device using the `bpf(2)`_ syscall.
+The target must be the file descriptor for the LIRC device, and the
+attach type must be ``BPF_LIRC_MODE2``. No more than 64 BPF programs can be
+attached to a single LIRC device at a time.
+
+.. _bpf(2): http://man7.org/linux/man-pages/man2/bpf.2.html
-- 
2.21.0

