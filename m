Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B8321D8C9
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 16:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730046AbgGMOml (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 10:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729881AbgGMOmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 10:42:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60698C08C5E0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 07:42:33 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf5-0001mS-D6; Mon, 13 Jul 2020 16:42:31 +0200
Received: from mtr by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf4-0007ra-L1; Mon, 13 Jul 2020 16:42:30 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 05/12] media: allegro: don't pack MCU messages
Date:   Mon, 13 Jul 2020 16:42:22 +0200
Message-Id: <20200713144229.30057-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713144229.30057-1-m.tretter@pengutronix.de>
References: <20200713144229.30057-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The messages are now explicitly converted from the struct to the binary
representation used by the firmware. Therefore, there is no need to keep
the structs packed anymore.

Drop the attribute and avoid confusion why the mails are packed.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-mail.h  | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
index 14b54eb52488..ae81e94a2f2c 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -25,7 +25,7 @@ const char *msg_type_name(enum mcu_msg_type type);
 struct mcu_msg_header {
 	u16 length;		/* length of the body in bytes */
 	u16 type;
-} __attribute__ ((__packed__));
+};
 
 struct mcu_msg_init_request {
 	struct mcu_msg_header header;
@@ -33,12 +33,12 @@ struct mcu_msg_init_request {
 	u32 suballoc_dma;
 	u32 suballoc_size;
 	s32 l2_cache[3];
-} __attribute__ ((__packed__));
+};
 
 struct mcu_msg_init_response {
 	struct mcu_msg_header header;
 	u32 reserved0;
-} __attribute__ ((__packed__));
+};
 
 struct create_channel_param {
 	u16 width;
@@ -127,13 +127,13 @@ struct create_channel_param {
 	u32 subframe_latency;
 	u32 lda_control_mode;
 	u32 unknown41;
-} __attribute__ ((__packed__));
+};
 
 struct mcu_msg_create_channel {
 	struct mcu_msg_header header;
 	u32 user_id;
 	struct create_channel_param param;
-} __attribute__ ((__packed__));
+};
 
 struct mcu_msg_create_channel_response {
 	struct mcu_msg_header header;
@@ -148,30 +148,30 @@ struct mcu_msg_create_channel_response {
 	u32 rec_buffers_size;
 	u32 reserved;
 	u32 error_code;
-} __attribute__ ((__packed__));
+};
 
 struct mcu_msg_destroy_channel {
 	struct mcu_msg_header header;
 	u32 channel_id;
-} __attribute__ ((__packed__));
+};
 
 struct mcu_msg_destroy_channel_response {
 	struct mcu_msg_header header;
 	u32 channel_id;
-} __attribute__ ((__packed__));
+};
 
 struct mcu_msg_push_buffers_internal_buffer {
 	u32 dma_addr;
 	u32 mcu_addr;
 	u32 size;
-} __attribute__ ((__packed__));
+};
 
 struct mcu_msg_push_buffers_internal {
 	struct mcu_msg_header header;
 	u32 channel_id;
 	size_t num_buffers;
 	struct mcu_msg_push_buffers_internal_buffer buffer[];
-} __attribute__ ((__packed__));
+};
 
 struct mcu_msg_put_stream_buffer {
 	struct mcu_msg_header header;
@@ -181,7 +181,7 @@ struct mcu_msg_put_stream_buffer {
 	u32 size;
 	u32 offset;
 	u64 stream_id;
-} __attribute__ ((__packed__));
+};
 
 struct mcu_msg_encode_frame {
 	struct mcu_msg_header header;
@@ -214,7 +214,7 @@ struct mcu_msg_encode_frame {
 	u32 stride;
 	u32 ep2;
 	u64 ep2_v;
-} __attribute__ ((__packed__));
+};
 
 struct mcu_msg_encode_frame_response {
 	struct mcu_msg_header header;
@@ -255,7 +255,7 @@ struct mcu_msg_encode_frame_response {
 	u16 pps_qp;
 	u16 reserved1;
 	u32 reserved2;
-} __attribute__ ((__packed__));
+};
 
 union mcu_msg_response {
 	struct mcu_msg_header header;
-- 
2.20.1

