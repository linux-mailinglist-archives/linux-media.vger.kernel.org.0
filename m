Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2F61B29FD
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 16:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgDUOeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 10:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbgDUOd7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 10:33:59 -0400
X-Greylist: delayed 94453 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 21 Apr 2020 07:33:59 PDT
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778B3C061A10
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 07:33:59 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5E535C63EA; Tue, 21 Apr 2020 15:33:57 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc: no need for decoder state if decoder not enabled
Date:   Tue, 21 Apr 2020 15:33:57 +0100
Message-Id: <20200421143357.13464-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One struct ir_raw_event_ctrl is allocated per raw IR device; reduce the
amount allocated if not all decoders are enabled.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-core-priv.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/rc/rc-core-priv.h b/drivers/media/rc/rc-core-priv.h
index 5f36244cc34f..1eeab277a08e 100644
--- a/drivers/media/rc/rc-core-priv.h
+++ b/drivers/media/rc/rc-core-priv.h
@@ -64,6 +64,7 @@ struct ir_raw_event_ctrl {
 	u32				bpf_sample;
 	struct bpf_prog_array __rcu	*progs;
 #endif
+#if IS_ENABLED(CONFIG_IR_NEC_DECODER)
 	struct nec_dec {
 		int state;
 		unsigned count;
@@ -71,12 +72,16 @@ struct ir_raw_event_ctrl {
 		bool is_nec_x;
 		bool necx_repeat;
 	} nec;
+#endif
+#if IS_ENABLED(CONFIG_IR_RC5_DECODER)
 	struct rc5_dec {
 		int state;
 		u32 bits;
 		unsigned count;
 		bool is_rc5x;
 	} rc5;
+#endif
+#if IS_ENABLED(CONFIG_IR_RC6_DECODER)
 	struct rc6_dec {
 		int state;
 		u8 header;
@@ -85,11 +90,15 @@ struct ir_raw_event_ctrl {
 		unsigned count;
 		unsigned wanted_bits;
 	} rc6;
+#endif
+#if IS_ENABLED(CONFIG_IR_SONY_DECODER)
 	struct sony_dec {
 		int state;
 		u32 bits;
 		unsigned count;
 	} sony;
+#endif
+#if IS_ENABLED(CONFIG_IR_JVC_DECODER)
 	struct jvc_dec {
 		int state;
 		u16 bits;
@@ -98,17 +107,23 @@ struct ir_raw_event_ctrl {
 		bool first;
 		bool toggle;
 	} jvc;
+#endif
+#if IS_ENABLED(CONFIG_IR_SANYO_DECODER)
 	struct sanyo_dec {
 		int state;
 		unsigned count;
 		u64 bits;
 	} sanyo;
+#endif
+#if IS_ENABLED(CONFIG_IR_SHARP_DECODER)
 	struct sharp_dec {
 		int state;
 		unsigned count;
 		u32 bits;
 		unsigned int pulse_len;
 	} sharp;
+#endif
+#if IS_ENABLED(CONFIG_IR_MCE_KBD_DECODER)
 	struct mce_kbd_dec {
 		/* locks key up timer */
 		spinlock_t keylock;
@@ -119,11 +134,15 @@ struct ir_raw_event_ctrl {
 		unsigned count;
 		unsigned wanted_bits;
 	} mce_kbd;
+#endif
+#if IS_ENABLED(CONFIG_IR_XMP_DECODER)
 	struct xmp_dec {
 		int state;
 		unsigned count;
 		u32 durations[16];
 	} xmp;
+#endif
+#if IS_ENABLED(CONFIG_IR_IMON_DECODER)
 	struct imon_dec {
 		int state;
 		int count;
@@ -131,11 +150,14 @@ struct ir_raw_event_ctrl {
 		unsigned int bits;
 		bool stick_keyboard;
 	} imon;
+#endif
+#if IS_ENABLED(CONFIG_IR_RCMM_DECODER)
 	struct rcmm_dec {
 		int state;
 		unsigned int count;
 		u32 bits;
 	} rcmm;
+#endif
 };
 
 /* Mutex for locking raw IR processing and handler change */
-- 
2.25.3

