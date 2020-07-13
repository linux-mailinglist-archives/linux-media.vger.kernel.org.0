Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CAA21D8C8
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 16:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730037AbgGMOmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 10:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729845AbgGMOmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 10:42:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E675C08C5DE
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 07:42:33 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf5-0001mR-IG; Mon, 13 Jul 2020 16:42:31 +0200
Received: from mtr by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf4-0007rW-Kd; Mon, 13 Jul 2020 16:42:30 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 04/12] media: allegro: add field for number of buffers
Date:   Mon, 13 Jul 2020 16:42:21 +0200
Message-Id: <20200713144229.30057-5-m.tretter@pengutronix.de>
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

When pushing the buffers for the intermediate and reference frames to
the MCU, the driver relied on the message size to calculate the number
of buffers. As it is not necessary anymore to keep the messages binary
compatible to the firmware, we can just explicitly write the number of
buffers into the message.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 1 +
 drivers/staging/media/allegro-dvt/allegro-mail.c | 2 +-
 drivers/staging/media/allegro-dvt/allegro-mail.h | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 6334b351ee3b..6745a5fa1167 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -1115,6 +1115,7 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 	msg->header.length = size - sizeof(msg->header);
 	msg->header.type = type;
 	msg->channel_id = channel->mcu_channel_id;
+	msg->num_buffers = num_buffers;
 
 	buffer = msg->buffer;
 	list_for_each_entry(al_buffer, list, head) {
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
index c78367d36e2e..ba1c3bc587c6 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.c
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -156,7 +156,7 @@ allegro_enc_push_buffers(u32 *dst, struct mcu_msg_push_buffers_internal *msg)
 {
 	unsigned int i = 0;
 	struct mcu_msg_push_buffers_internal_buffer *buffer;
-	unsigned int num_buffers = (msg->header.length - 4) / sizeof(*buffer);
+	unsigned int num_buffers = msg->num_buffers;
 	unsigned int j;
 
 	dst[i++] = msg->channel_id;
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
index 457caf50ebe6..14b54eb52488 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -169,6 +169,7 @@ struct mcu_msg_push_buffers_internal_buffer {
 struct mcu_msg_push_buffers_internal {
 	struct mcu_msg_header header;
 	u32 channel_id;
+	size_t num_buffers;
 	struct mcu_msg_push_buffers_internal_buffer buffer[];
 } __attribute__ ((__packed__));
 
-- 
2.20.1

