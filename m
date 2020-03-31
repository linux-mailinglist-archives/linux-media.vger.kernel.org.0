Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF781996AD
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 14:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730799AbgCaMjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 08:39:53 -0400
Received: from gofer.mess.org ([88.97.38.141]:53517 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730437AbgCaMjx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 08:39:53 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 58B24C6383; Tue, 31 Mar 2020 13:39:52 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc: if kernel is built without an IR codec, don't advertise it
Date:   Tue, 31 Mar 2020 13:39:52 +0100
Message-Id: <20200331123952.21240-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the kernel is built without e.g. the imon IR decoder, the protocols
sysfs file still show the protocol as available. If user-space tries to
enable this decoder, the kernel will report an error:

$ echo +imon > /sys/class/rc/rc0/protocols
[   57.693033] rc_core: Loaded IR protocol module ir-imon-decoder, but protocol imon still not available

Ensuring that unavailable protocols are not advertised, ensures that
users space knows it is not available, and a BPF based IR decoder can be
loaded instead.

This supports the case when no kernel-based codec needs to be compiled in,
and every IR decoder can be BPF based.

Signed-off-by: Sean Young <sean@mess.org>
---
 include/media/rc-map.h | 103 ++++++++++++++++++++++++++++++-----------
 1 file changed, 76 insertions(+), 27 deletions(-)

diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index 0ce896f10202..7dbb91c601a7 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -41,36 +41,85 @@
 #define RC_PROTO_BIT_RCMM32		BIT_ULL(RC_PROTO_RCMM32)
 #define RC_PROTO_BIT_XBOX_DVD		BIT_ULL(RC_PROTO_XBOX_DVD)
 
-/* All rc protocols for which we have decoders */
+#if IS_ENABLED(CONFIG_IR_RC5_DECODER)
+#define __RC_PROTO_RC5_CODEC \
+	(RC_PROTO_BIT_RC5 | RC_PROTO_BIT_RC5X_20 |  RC_PROTO_BIT_RC5_SZ)
+#else
+#define __RC_PROTO_RC5_CODEC 0
+#endif
+
+#if IS_ENABLED(CONFIG_IR_JVC_DECODER)
+#define __RC_PROTO_JVC_CODEC RC_PROTO_BIT_JVC
+#else
+#define __RC_PROTO_JVC_CODEC 0
+#endif
+#if IS_ENABLED(CONFIG_IR_SONY_DECODER)
+#define __RC_PROTO_SONY_CODEC \
+	(RC_PROTO_BIT_SONY12 | RC_PROTO_BIT_SONY15 |  RC_PROTO_BIT_SONY20)
+#else
+#define __RC_PROTO_SONY_CODEC 0
+#endif
+#if IS_ENABLED(CONFIG_IR_NEC_DECODER)
+#define __RC_PROTO_NEC_CODEC \
+	(RC_PROTO_BIT_NEC | RC_PROTO_BIT_NECX | RC_PROTO_BIT_NEC32)
+#else
+#define __RC_PROTO_NEC_CODEC 0
+#endif
+#if IS_ENABLED(CONFIG_IR_SANYO_DECODER)
+#define __RC_PROTO_SANYO_CODEC RC_PROTO_BIT_SANYO
+#else
+#define __RC_PROTO_SANYO_CODEC 0
+#endif
+#if IS_ENABLED(CONFIG_IR_MCE_KBD_DECODER)
+#define __RC_PROTO_MCE_KBD_CODEC \
+	(RC_PROTO_BIT_MCIR2_KBD |  RC_PROTO_BIT_MCIR2_MSE)
+#else
+#define __RC_PROTO_MCE_KBD_CODEC 0
+#endif
+#if IS_ENABLED(CONFIG_IR_RC6_DECODER)
+#define __RC_PROTO_RC6_CODEC \
+	(RC_PROTO_BIT_RC6_0 | RC_PROTO_BIT_RC6_6A_20 | \
+	 RC_PROTO_BIT_RC6_6A_24 |  RC_PROTO_BIT_RC6_6A_32 | \
+	 RC_PROTO_BIT_RC6_MCE)
+#else
+#define __RC_PROTO_RC6_CODEC 0
+#endif
+#if IS_ENABLED(CONFIG_IR_SHARP_DECODER)
+#define __RC_PROTO_SHARP_CODEC RC_PROTO_BIT_SHARP
+#else
+#define __RC_PROTO_SHARP_CODEC 0
+#endif
+#if IS_ENABLED(CONFIG_IR_XMP_DECODER)
+#define __RC_PROTO_XMP_CODEC RC_PROTO_BIT_XMP
+#else
+#define __RC_PROTO_XMP_CODEC 0
+#endif
+#if IS_ENABLED(CONFIG_IR_IMON_DECODER)
+#define __RC_PROTO_IMON_CODEC RC_PROTO_BIT_IMON
+#else
+#define __RC_PROTO_IMON_CODEC 0
+#endif
+#if IS_ENABLED(CONFIG_IR_RCMM_DECODER)
+#define __RC_PROTO_RCMM_CODEC \
+	(RC_PROTO_BIT_RCMM12 | RC_PROTO_BIT_RCMM24 | RC_PROTO_BIT_RCMM32)
+#else
+#define __RC_PROTO_RCMM_CODEC 0
+#endif
+
+/* All kernel-based codecs have encoders and decoders */
 #define RC_PROTO_BIT_ALL_IR_DECODER \
-			(RC_PROTO_BIT_RC5 | RC_PROTO_BIT_RC5X_20 | \
-			 RC_PROTO_BIT_RC5_SZ | RC_PROTO_BIT_JVC | \
-			 RC_PROTO_BIT_SONY12 | RC_PROTO_BIT_SONY15 | \
-			 RC_PROTO_BIT_SONY20 | RC_PROTO_BIT_NEC | \
-			 RC_PROTO_BIT_NECX | RC_PROTO_BIT_NEC32 | \
-			 RC_PROTO_BIT_SANYO | RC_PROTO_BIT_MCIR2_KBD | \
-			 RC_PROTO_BIT_MCIR2_MSE | \
-			 RC_PROTO_BIT_RC6_0 | RC_PROTO_BIT_RC6_6A_20 | \
-			 RC_PROTO_BIT_RC6_6A_24 |  RC_PROTO_BIT_RC6_6A_32 | \
-			 RC_PROTO_BIT_RC6_MCE | RC_PROTO_BIT_SHARP | \
-			 RC_PROTO_BIT_XMP | RC_PROTO_BIT_IMON | \
-			 RC_PROTO_BIT_RCMM12 | RC_PROTO_BIT_RCMM24 | \
-			 RC_PROTO_BIT_RCMM32)
+	(__RC_PROTO_RC5_CODEC | __RC_PROTO_JVC_CODEC | __RC_PROTO_SONY_CODEC | \
+	 __RC_PROTO_NEC_CODEC | __RC_PROTO_SANYO_CODEC | \
+	 __RC_PROTO_MCE_KBD_CODEC | __RC_PROTO_RC6_CODEC | \
+	 __RC_PROTO_SHARP_CODEC | __RC_PROTO_XMP_CODEC | \
+	 __RC_PROTO_IMON_CODEC | __RC_PROTO_RCMM_CODEC)
 
 #define RC_PROTO_BIT_ALL_IR_ENCODER \
-			(RC_PROTO_BIT_RC5 | RC_PROTO_BIT_RC5X_20 | \
-			 RC_PROTO_BIT_RC5_SZ | RC_PROTO_BIT_JVC | \
-			 RC_PROTO_BIT_SONY12 | RC_PROTO_BIT_SONY15 | \
-			 RC_PROTO_BIT_SONY20 |  RC_PROTO_BIT_NEC | \
-			 RC_PROTO_BIT_NECX | RC_PROTO_BIT_NEC32 | \
-			 RC_PROTO_BIT_SANYO | RC_PROTO_BIT_MCIR2_KBD | \
-			 RC_PROTO_BIT_MCIR2_MSE | \
-			 RC_PROTO_BIT_RC6_0 | RC_PROTO_BIT_RC6_6A_20 | \
-			 RC_PROTO_BIT_RC6_6A_24 | \
-			 RC_PROTO_BIT_RC6_6A_32 | RC_PROTO_BIT_RC6_MCE | \
-			 RC_PROTO_BIT_SHARP | RC_PROTO_BIT_IMON | \
-			 RC_PROTO_BIT_RCMM12 | RC_PROTO_BIT_RCMM24 | \
-			 RC_PROTO_BIT_RCMM32)
+	(__RC_PROTO_RC5_CODEC | __RC_PROTO_JVC_CODEC | __RC_PROTO_SONY_CODEC | \
+	 __RC_PROTO_NEC_CODEC | __RC_PROTO_SANYO_CODEC | \
+	 __RC_PROTO_MCE_KBD_CODEC | __RC_PROTO_RC6_CODEC | \
+	 __RC_PROTO_SHARP_CODEC | __RC_PROTO_XMP_CODEC | \
+	 __RC_PROTO_IMON_CODEC | __RC_PROTO_RCMM_CODEC)
 
 #define RC_SCANCODE_UNKNOWN(x)			(x)
 #define RC_SCANCODE_OTHER(x)			(x)
-- 
2.25.1

