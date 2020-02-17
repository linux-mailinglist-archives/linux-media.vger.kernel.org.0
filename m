Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 633091615CF
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgBQPOD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:14:03 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58969 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgBQPOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:14:02 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5x-0005W7-5Z; Mon, 17 Feb 2020 16:14:01 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5w-0001a0-8k; Mon, 17 Feb 2020 16:14:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 04/18] media: allegro: remove unknown39 field from create_channel
Date:   Mon, 17 Feb 2020 16:13:44 +0100
Message-Id: <20200217151358.5695-5-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200217151358.5695-1-m.tretter@pengutronix.de>
References: <20200217151358.5695-1-m.tretter@pengutronix.de>
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

The subframe_latency and lda_control_mode fields directly follow
freq_golden_ref field and there is no unknown field in between. The
unknown field it at the end of the message.

Reorder the fields accordingly. This further allows to drop the hard
coded value from the lda_control_mode field and set the mode to 0.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 1ff58683e782..c93b3ba39391 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -397,10 +397,9 @@ struct mcu_msg_create_channel {
 	u8 num_b;
 	u8 freq_golden_ref;
 
-	u32 unknown39;
-
 	u32 subframe_latency;
 	u32 lda_control_mode;
+	u32 unknown41;
 } __attribute__ ((__packed__));
 
 struct mcu_msg_create_channel_response {
@@ -1121,7 +1120,6 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 	msg.gdr_mode = 0x00000000;
 	msg.gop_length = channel->gop_size;
 	msg.subframe_latency = 0x00000000;
-	msg.lda_control_mode = 0x700d0000;
 
 	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
 	allegro_mcu_interrupt(dev);
-- 
2.20.1

