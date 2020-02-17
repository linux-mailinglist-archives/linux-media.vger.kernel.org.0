Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFD311615D4
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgBQPOD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:14:03 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60239 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgBQPOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:14:02 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5x-0005W8-46; Mon, 17 Feb 2020 16:14:01 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5w-0001a3-96; Mon, 17 Feb 2020 16:14:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 05/18] media: allegro: start a GOP with an IDR frame
Date:   Mon, 17 Feb 2020 16:13:45 +0100
Message-Id: <20200217151358.5695-6-m.tretter@pengutronix.de>
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

When creating a channel, freq_idr defines the number of frames between
IDR frames in the coded stream. In V4L2, the period between IDR frames
shall be taken from the GOP_SIZE control.

Set the IDR frame frequency equal to the GOP size and let every GOP
start with an IDR frame.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index c93b3ba39391..b04ded8ae06b 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -390,7 +390,7 @@ struct mcu_msg_create_channel {
 
 	/* gop param */
 	u32 gop_ctrl_mode;
-	u32 freq_ird;
+	u32 freq_idr;
 	u32 freq_lt;
 	u32 gdr_mode;
 	u16 gop_length;
@@ -1115,7 +1115,7 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 	msg.rate_control_option = 0x00000000;
 
 	msg.gop_ctrl_mode = 0x00000000;
-	msg.freq_ird = 0x7fffffff;
+	msg.freq_idr = channel->gop_size;
 	msg.freq_lt = 0;
 	msg.gdr_mode = 0x00000000;
 	msg.gop_length = channel->gop_size;
-- 
2.20.1

