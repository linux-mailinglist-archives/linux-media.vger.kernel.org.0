Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B01548D602
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 11:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232947AbiAMKsC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 05:48:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiAMKsB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 05:48:01 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66153C06173F
        for <linux-media@vger.kernel.org>; Thu, 13 Jan 2022 02:48:01 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B0DE3101C2F; Thu, 13 Jan 2022 10:47:57 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: lirc: remove unused lirc features
Date:   Thu, 13 Jan 2022 10:47:57 +0000
Message-Id: <20220113104757.179130-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These features have never been implemented by any lirc driver, including
staging or out of tree drivers. The ioctls for these feaures were removed
in commit d55f09abe24b ("[media] lirc.h: remove several unused ioctls").

So, we can safely remove them.

Also ensure that the lirc.h files in tools directory is synced.

Signed-off-by: Sean Young <sean@mess.org>
---
 .../media/rc/lirc-get-features.rst             | 18 ------------------
 include/uapi/linux/lirc.h                      |  4 ----
 tools/include/uapi/linux/lirc.h                | 11 +++++------
 3 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/Documentation/userspace-api/media/rc/lirc-get-features.rst b/Documentation/userspace-api/media/rc/lirc-get-features.rst
index 4bf25860f932..545137620ead 100644
--- a/Documentation/userspace-api/media/rc/lirc-get-features.rst
+++ b/Documentation/userspace-api/media/rc/lirc-get-features.rst
@@ -102,12 +102,6 @@ LIRC features
     The driver supports setting the receive carrier frequency using
     :ref:`ioctl LIRC_SET_REC_CARRIER <LIRC_SET_REC_CARRIER>`.
 
-.. _LIRC-CAN-SET-REC-DUTY-CYCLE-RANGE:
-
-``LIRC_CAN_SET_REC_DUTY_CYCLE_RANGE``
-
-    Unused. Kept just to avoid breaking uAPI.
-
 .. _LIRC-CAN-SET-REC-CARRIER-RANGE:
 
 ``LIRC_CAN_SET_REC_CARRIER_RANGE``
@@ -129,12 +123,6 @@ LIRC features
     The driver supports
     :ref:`ioctl LIRC_SET_REC_TIMEOUT <LIRC_SET_REC_TIMEOUT>`.
 
-.. _LIRC-CAN-SET-REC-FILTER:
-
-``LIRC_CAN_SET_REC_FILTER``
-
-    Unused. Kept just to avoid breaking uAPI.
-
 .. _LIRC-CAN-MEASURE-CARRIER:
 
 ``LIRC_CAN_MEASURE_CARRIER``
@@ -149,12 +137,6 @@ LIRC features
     The driver supports learning mode using
     :ref:`ioctl LIRC_SET_WIDEBAND_RECEIVER <LIRC_SET_WIDEBAND_RECEIVER>`.
 
-.. _LIRC-CAN-NOTIFY-DECODE:
-
-``LIRC_CAN_NOTIFY_DECODE``
-
-    Unused. Kept just to avoid breaking uAPI.
-
 .. _LIRC-CAN-SEND-RAW:
 
 ``LIRC_CAN_SEND_RAW``
diff --git a/include/uapi/linux/lirc.h b/include/uapi/linux/lirc.h
index 9919f2062b14..a1f9c26ea537 100644
--- a/include/uapi/linux/lirc.h
+++ b/include/uapi/linux/lirc.h
@@ -72,11 +72,9 @@
 #define LIRC_CAN_SET_REC_CARRIER       (LIRC_CAN_SET_SEND_CARRIER << 16)
 #define LIRC_CAN_SET_REC_DUTY_CYCLE    (LIRC_CAN_SET_SEND_DUTY_CYCLE << 16)
 
-#define LIRC_CAN_SET_REC_DUTY_CYCLE_RANGE 0x40000000
 #define LIRC_CAN_SET_REC_CARRIER_RANGE    0x80000000
 #define LIRC_CAN_GET_REC_RESOLUTION       0x20000000
 #define LIRC_CAN_SET_REC_TIMEOUT          0x10000000
-#define LIRC_CAN_SET_REC_FILTER           0x08000000
 
 #define LIRC_CAN_MEASURE_CARRIER          0x02000000
 #define LIRC_CAN_USE_WIDEBAND_RECEIVER    0x04000000
@@ -84,8 +82,6 @@
 #define LIRC_CAN_SEND(x) ((x)&LIRC_CAN_SEND_MASK)
 #define LIRC_CAN_REC(x) ((x)&LIRC_CAN_REC_MASK)
 
-#define LIRC_CAN_NOTIFY_DECODE            0x01000000
-
 /*** IOCTL commands for lirc driver ***/
 
 #define LIRC_GET_FEATURES              _IOR('i', 0x00000000, __u32)
diff --git a/tools/include/uapi/linux/lirc.h b/tools/include/uapi/linux/lirc.h
index 45fcbf99d72e..a1f9c26ea537 100644
--- a/tools/include/uapi/linux/lirc.h
+++ b/tools/include/uapi/linux/lirc.h
@@ -1,7 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * lirc.h - linux infrared remote control header file
- * last modified 2010/07/13 by Jarod Wilson
  */
 
 #ifndef _LINUX_LIRC_H
@@ -73,11 +72,9 @@
 #define LIRC_CAN_SET_REC_CARRIER       (LIRC_CAN_SET_SEND_CARRIER << 16)
 #define LIRC_CAN_SET_REC_DUTY_CYCLE    (LIRC_CAN_SET_SEND_DUTY_CYCLE << 16)
 
-#define LIRC_CAN_SET_REC_DUTY_CYCLE_RANGE 0x40000000
 #define LIRC_CAN_SET_REC_CARRIER_RANGE    0x80000000
 #define LIRC_CAN_GET_REC_RESOLUTION       0x20000000
 #define LIRC_CAN_SET_REC_TIMEOUT          0x10000000
-#define LIRC_CAN_SET_REC_FILTER           0x08000000
 
 #define LIRC_CAN_MEASURE_CARRIER          0x02000000
 #define LIRC_CAN_USE_WIDEBAND_RECEIVER    0x04000000
@@ -85,8 +82,6 @@
 #define LIRC_CAN_SEND(x) ((x)&LIRC_CAN_SEND_MASK)
 #define LIRC_CAN_REC(x) ((x)&LIRC_CAN_REC_MASK)
 
-#define LIRC_CAN_NOTIFY_DECODE            0x01000000
-
 /*** IOCTL commands for lirc driver ***/
 
 #define LIRC_GET_FEATURES              _IOR('i', 0x00000000, __u32)
@@ -139,7 +134,7 @@
  */
 #define LIRC_GET_REC_TIMEOUT	       _IOR('i', 0x00000024, __u32)
 
-/*
+/**
  * struct lirc_scancode - decoded scancode with protocol for use with
  *	LIRC_MODE_SCANCODE
  *
@@ -195,6 +190,8 @@ struct lirc_scancode {
  * @RC_PROTO_RCMM12: RC-MM protocol 12 bits
  * @RC_PROTO_RCMM24: RC-MM protocol 24 bits
  * @RC_PROTO_RCMM32: RC-MM protocol 32 bits
+ * @RC_PROTO_XBOX_DVD: Xbox DVD Movie Playback Kit protocol
+ * @RC_PROTO_MAX: Maximum value of enum rc_proto
  */
 enum rc_proto {
 	RC_PROTO_UNKNOWN	= 0,
@@ -224,6 +221,8 @@ enum rc_proto {
 	RC_PROTO_RCMM12		= 24,
 	RC_PROTO_RCMM24		= 25,
 	RC_PROTO_RCMM32		= 26,
+	RC_PROTO_XBOX_DVD	= 27,
+	RC_PROTO_MAX		= RC_PROTO_XBOX_DVD,
 };
 
 #endif
-- 
2.34.1

