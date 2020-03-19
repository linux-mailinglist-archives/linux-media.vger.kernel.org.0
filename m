Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3BE18AF71
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 10:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbgCSJQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 05:16:35 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42191 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgCSJQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 05:16:34 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jErI1-0004S2-J2; Thu, 19 Mar 2020 10:16:33 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jErI0-0001pR-MS; Thu, 19 Mar 2020 10:16:32 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Chuhong Yuan <hslester96@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH] media: staging: allegro: fix broken registration of controls
Date:   Thu, 19 Mar 2020 10:16:30 +0100
Message-Id: <20200319091630.6981-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
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

Since commit cc62c74749a3 ("media: allegro: add missed checks in
allegro_open()") the allegro device does provide v4l2 controls to user
space anymore. The reason is that v4l2_fh_init() initializes
fh->ctrl_handler to vdev->ctrl_handler, which invalidates the previous
driver override of the ctrl_handler.

Therefore, v4l2_fh_init() must be called before the driver overrides the
fh->ctrl_handler with its own handler.

Move the initialization of the fh back to the top, as the initialization
does not does not need to be reverted on errors, but it is enough to
free the channel.

Fixes: cc62c74749a3 ("media: allegro: add missed checks in allegro_open()")
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/staging/media/allegro-dvt/allegro-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index cb6bdabaaff3..761f2c7ff8e7 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -2467,6 +2467,8 @@ static int allegro_open(struct file *file)
 	if (!channel)
 		return -ENOMEM;
 
+	v4l2_fh_init(&channel->fh, vdev);
+
 	init_completion(&channel->completion);
 	INIT_LIST_HEAD(&channel->source_shadow_list);
 	INIT_LIST_HEAD(&channel->stream_shadow_list);
@@ -2588,7 +2590,6 @@ static int allegro_open(struct file *file)
 		goto error;
 	}
 
-	v4l2_fh_init(&channel->fh, vdev);
 	file->private_data = &channel->fh;
 	v4l2_fh_add(&channel->fh);
 
-- 
2.20.1

