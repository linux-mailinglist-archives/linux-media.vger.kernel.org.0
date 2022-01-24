Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34BC497C7E
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 10:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236846AbiAXJ5Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 04:57:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232102AbiAXJ5P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 04:57:15 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75138C06173D
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 01:57:14 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C3E7D10008F; Mon, 24 Jan 2022 09:57:11 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2] media: lirc: remove unused lirc features
Date:   Mon, 24 Jan 2022 09:57:11 +0000
Message-Id: <20220124095711.387668-1-sean@mess.org>
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

Signed-off-by: Sean Young <sean@mess.org>
---
 .../media/rc/lirc-get-features.rst             | 18 ------------------
 include/uapi/linux/lirc.h                      |  4 ----
 2 files changed, 22 deletions(-)

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
-- 
2.34.1

