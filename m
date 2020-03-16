Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B490C186E81
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 16:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731797AbgCPP0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 11:26:44 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42799 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731698AbgCPP0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 11:26:43 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdZ-0000lJ-OX; Mon, 16 Mar 2020 16:26:41 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdY-00055G-Mq; Mon, 16 Mar 2020 16:26:40 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 09/18] media: allegro: warn if response message has an unexpected size
Date:   Mon, 16 Mar 2020 16:26:29 +0100
Message-Id: <20200316152638.19457-10-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316152638.19457-1-m.tretter@pengutronix.de>
References: <20200316152638.19457-1-m.tretter@pengutronix.de>
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

The driver uses structs to parse the responses from the VCU and expects
a certain size of the responses. However, the size and format of the
mails is not stable across firmware versions. Therefore, print a warning
if the size does not match the expected size to warn the user that
strange things might happen.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v1 -> v2:
- Fix checkpatch warnings about lines over 80 characters
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 6c2237d4a674..2392867b4270 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -1711,6 +1711,12 @@ allegro_handle_create_channel(struct allegro_dev *dev,
 	struct allegro_channel *channel;
 	int err = 0;
 
+	if (msg->header.length != sizeof(*msg) - sizeof(msg->header))
+		v4l2_warn(&dev->v4l2_dev,
+			  "received message has %d bytes, but expected %zu\n",
+			  msg->header.length,
+			  sizeof(*msg) - sizeof(msg->header));
+
 	channel = allegro_find_channel_by_user_id(dev, msg->user_id);
 	if (IS_ERR(channel)) {
 		v4l2_warn(&dev->v4l2_dev,
@@ -1804,6 +1810,12 @@ allegro_handle_encode_frame(struct allegro_dev *dev,
 {
 	struct allegro_channel *channel;
 
+	if (msg->header.length != sizeof(*msg) - sizeof(msg->header))
+		v4l2_warn(&dev->v4l2_dev,
+			  "received message has %d bytes, but expected %zu\n",
+			  msg->header.length,
+			  sizeof(*msg) - sizeof(msg->header));
+
 	channel = allegro_find_channel_by_channel_id(dev, msg->channel_id);
 	if (IS_ERR(channel)) {
 		v4l2_err(&dev->v4l2_dev,
-- 
2.20.1

