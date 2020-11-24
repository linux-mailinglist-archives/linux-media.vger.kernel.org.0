Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C447E2C239C
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732516AbgKXLGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:06:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:33782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732161AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1DE42083E;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=hD1Vhx1L0CW+jqKVmFJ1M40qK9KzgKonhEYNkY8EyPE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H6YEdQik/F0uNI0viTe0vuf/QMgjq+OXPjTO136KjH0UC2fOEG9b9Bvc/JCUNZq4S
         B2P8panH/U0VJW9f6CU1N6ejZfrcjvSFtwpUXFIadC2llxdtdi8WDT1iOF3+n8AxzA
         njOqadrNc8T5jVkIZhHd9x4OSIgSa2C3ukJoR1Gk=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZN-I2; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 01/31] media: vidtv: reorganize includes
Date:   Tue, 24 Nov 2020 12:05:57 +0100
Message-Id: <b000ad1c906581688f1d4d8ce18258400b0f3616.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Place the includes on alphabetical order;
- get rid of asm/byteorder.h;
- add bug.h at vidtv_s302m.c, as it is needed by
  inux/fixp-arith.h

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  8 +++----
 .../media/test-drivers/vidtv/vidtv_bridge.h   |  2 ++
 .../media/test-drivers/vidtv/vidtv_channel.c  |  8 +++----
 .../media/test-drivers/vidtv/vidtv_channel.h  |  3 ++-
 .../media/test-drivers/vidtv/vidtv_demod.c    |  1 +
 .../media/test-drivers/vidtv/vidtv_demod.h    |  1 +
 drivers/media/test-drivers/vidtv/vidtv_mux.c  | 18 ++++++++--------
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  3 ++-
 drivers/media/test-drivers/vidtv/vidtv_pes.c  |  1 -
 drivers/media/test-drivers/vidtv/vidtv_pes.h  |  1 -
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 11 +++++-----
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |  1 -
 .../media/test-drivers/vidtv/vidtv_s302m.c    | 21 +++++++++----------
 .../media/test-drivers/vidtv/vidtv_s302m.h    |  1 -
 drivers/media/test-drivers/vidtv/vidtv_ts.c   |  5 ++---
 drivers/media/test-drivers/vidtv/vidtv_ts.h   |  1 -
 .../media/test-drivers/vidtv/vidtv_tuner.c    |  5 +++--
 .../media/test-drivers/vidtv/vidtv_tuner.h    |  1 +
 18 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 2f97ecf423ed..068fb4e9fafe 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -9,20 +9,20 @@
  * Copyright (C) 2020 Daniel W. S. Almeida
  */
 
+#include <linux/dev_printk.h>
 #include <linux/moduleparam.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/dev_printk.h>
 #include <linux/time.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
 #include "vidtv_bridge.h"
+#include "vidtv_common.h"
 #include "vidtv_demod.h"
-#include "vidtv_tuner.h"
-#include "vidtv_ts.h"
 #include "vidtv_mux.h"
-#include "vidtv_common.h"
+#include "vidtv_ts.h"
+#include "vidtv_tuner.h"
 
 //#define MUX_BUF_MAX_SZ
 //#define MUX_BUF_MIN_SZ
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.h b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
index 78fe8472fa37..a85068bffd0f 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.h
@@ -20,9 +20,11 @@
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
+
 #include <media/dmxdev.h>
 #include <media/dvb_demux.h>
 #include <media/dvb_frontend.h>
+
 #include "vidtv_mux.h"
 
 /**
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index 13e56544bb1e..683da9014064 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -19,16 +19,16 @@
  * Copyright (C) 2020 Daniel W. S. Almeida
  */
 
-#include <linux/types.h>
-#include <linux/slab.h>
 #include <linux/dev_printk.h>
 #include <linux/ratelimit.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 
 #include "vidtv_channel.h"
-#include "vidtv_psi.h"
+#include "vidtv_common.h"
 #include "vidtv_encoder.h"
 #include "vidtv_mux.h"
-#include "vidtv_common.h"
+#include "vidtv_psi.h"
 #include "vidtv_s302m.h"
 
 static void vidtv_channel_encoder_destroy(struct vidtv_encoder *e)
diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.h b/drivers/media/test-drivers/vidtv/vidtv_channel.h
index 40ed7fcdc5a1..e1ba638ab77f 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.h
@@ -23,9 +23,10 @@
 #define VIDTV_CHANNEL_H
 
 #include <linux/types.h>
-#include "vidtv_psi.h"
+
 #include "vidtv_encoder.h"
 #include "vidtv_mux.h"
+#include "vidtv_psi.h"
 
 /**
  * struct vidtv_channel - A 'channel' abstraction
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index eba7fe1a1b48..63ac55b81f39 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/workqueue.h>
+
 #include <media/dvb_frontend.h>
 
 #include "vidtv_demod.h"
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.h b/drivers/media/test-drivers/vidtv/vidtv_demod.h
index 87651b0193e6..ab84044f33ba 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.h
@@ -12,6 +12,7 @@
 #define VIDTV_DEMOD_H
 
 #include <linux/dvb/frontend.h>
+
 #include <media/dvb_frontend.h>
 
 /**
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index c3646dd269dd..465c5a6a3bc8 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -12,23 +12,23 @@
  * Copyright (C) 2020 Daniel W. S. Almeida
  */
 
-#include <linux/types.h>
-#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
-#include <linux/dev_printk.h>
+#include <linux/math64.h>
 #include <linux/ratelimit.h>
-#include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 #include <linux/vmalloc.h>
-#include <linux/math64.h>
 
-#include "vidtv_mux.h"
-#include "vidtv_ts.h"
-#include "vidtv_pes.h"
-#include "vidtv_encoder.h"
 #include "vidtv_channel.h"
 #include "vidtv_common.h"
+#include "vidtv_encoder.h"
+#include "vidtv_mux.h"
+#include "vidtv_pes.h"
 #include "vidtv_psi.h"
+#include "vidtv_ts.h"
 
 static struct vidtv_mux_pid_ctx
 *vidtv_mux_get_pid_ctx(struct vidtv_mux *m, u16 pid)
diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.h b/drivers/media/test-drivers/vidtv/vidtv_mux.h
index 6eeb09fbfe4d..005b707f1445 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.h
@@ -15,9 +15,10 @@
 #ifndef VIDTV_MUX_H
 #define VIDTV_MUX_H
 
-#include <linux/types.h>
 #include <linux/hashtable.h>
+#include <linux/types.h>
 #include <linux/workqueue.h>
+
 #include <media/dvb_frontend.h>
 
 #include "vidtv_psi.h"
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.c b/drivers/media/test-drivers/vidtv/vidtv_pes.c
index 1c75f88070e9..102352d398ed 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.c
@@ -16,7 +16,6 @@
 #include <linux/types.h>
 #include <linux/printk.h>
 #include <linux/ratelimit.h>
-#include <asm/byteorder.h>
 
 #include "vidtv_pes.h"
 #include "vidtv_common.h"
diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.h b/drivers/media/test-drivers/vidtv/vidtv_pes.h
index 0ea9e863024d..a152693233a9 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.h
@@ -14,7 +14,6 @@
 #ifndef VIDTV_PES_H
 #define VIDTV_PES_H
 
-#include <asm/byteorder.h>
 #include <linux/types.h>
 
 #include "vidtv_common.h"
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 4dda5b0004a3..f4f6b90633db 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -11,18 +11,17 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
 
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/slab.h>
 #include <linux/crc32.h>
-#include <linux/string.h>
+#include <linux/kernel.h>
 #include <linux/printk.h>
 #include <linux/ratelimit.h>
+#include <linux/slab.h>
 #include <linux/string.h>
-#include <asm/byteorder.h>
+#include <linux/string.h>
+#include <linux/types.h>
 
-#include "vidtv_psi.h"
 #include "vidtv_common.h"
+#include "vidtv_psi.h"
 #include "vidtv_ts.h"
 
 #define CRC_SIZE_IN_BYTES 4
diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.h b/drivers/media/test-drivers/vidtv/vidtv_psi.h
index 118ba984f166..866fdf3d00e5 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.h
@@ -13,7 +13,6 @@
 #define VIDTV_PSI_H
 
 #include <linux/types.h>
-#include <asm/byteorder.h>
 
 /*
  * all section lengths start immediately after the 'section_length' field
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index aacf8110d874..ec88af63a74e 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -17,23 +17,22 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
 
-#include <linux/types.h>
-#include <linux/slab.h>
+#include <linux/bug.h>
 #include <linux/crc32.h>
-#include <linux/vmalloc.h>
-#include <linux/string.h>
-#include <linux/kernel.h>
+#include <linux/fixp-arith.h>
 #include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/printk.h>
 #include <linux/ratelimit.h>
-#include <linux/fixp-arith.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/vmalloc.h>
 
-#include <linux/math64.h>
-#include <asm/byteorder.h>
-
-#include "vidtv_s302m.h"
-#include "vidtv_encoder.h"
 #include "vidtv_common.h"
+#include "vidtv_encoder.h"
+#include "vidtv_s302m.h"
 
 #define S302M_SAMPLING_RATE_HZ 48000
 #define PES_PRIVATE_STREAM_1 0xbd  /* PES: private_stream_1 */
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.h b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
index b1bbe521e766..a0101734e758 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
@@ -19,7 +19,6 @@
 #define VIDTV_S302M_H
 
 #include <linux/types.h>
-#include <asm/byteorder.h>
 
 #include "vidtv_encoder.h"
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.c b/drivers/media/test-drivers/vidtv/vidtv_ts.c
index 190b9e4438dc..ca4bb9c40b78 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_ts.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.c
@@ -9,14 +9,13 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
 
+#include <linux/math64.h>
 #include <linux/printk.h>
 #include <linux/ratelimit.h>
 #include <linux/types.h>
-#include <linux/math64.h>
-#include <asm/byteorder.h>
 
-#include "vidtv_ts.h"
 #include "vidtv_common.h"
+#include "vidtv_ts.h"
 
 static u32 vidtv_ts_write_pcr_bits(u8 *to, u32 to_offset, u64 pcr)
 {
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
index 83dcc9183b45..6b989a2c1433 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_ts.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
@@ -11,7 +11,6 @@
 #define VIDTV_TS_H
 
 #include <linux/types.h>
-#include <asm/byteorder.h>
 
 #define TS_SYNC_BYTE 0x47
 #define TS_PACKET_LEN 188
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index 9bc49e099f65..14b6bc902ee1 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -13,11 +13,12 @@
 #include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+
 #include <media/dvb_frontend.h>
-#include <linux/printk.h>
-#include <linux/ratelimit.h>
 
 #include "vidtv_tuner.h"
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.h b/drivers/media/test-drivers/vidtv/vidtv_tuner.h
index 8455b2d564b3..fd55346a5c87 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.h
@@ -11,6 +11,7 @@
 #define VIDTV_TUNER_H
 
 #include <linux/types.h>
+
 #include <media/dvb_frontend.h>
 
 #define NUM_VALID_TUNER_FREQS 8
-- 
2.28.0

