Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC1E138B89
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 07:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgAMGAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 01:00:08 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42479 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbgAMGAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 01:00:07 -0500
Received: by mail-pl1-f193.google.com with SMTP id p9so3389412plk.9;
        Sun, 12 Jan 2020 22:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZudNU1j/GxZrYgiqrSmCxqZu+3g41iMiIQCkxkhVAY=;
        b=H1bh6tmx268zowtgeJ2z3BDM7/Dc5ajaVde9nFJzlNrrToUQMQlpj5eUkGdvyqavrd
         W8yhGyjgcqMWC8QgQRCI6m0vvZKwmIM8eMkgYJiGAtr0X2zPVrxCiKsUqXDrSTm4dPE+
         0lV0v2SiP0/KybQJudeecXv2MHIF0XXC8z+aIbzguaYst4nPTu3F9w58ou67Qc7KPQgh
         f0XbHjz+7KRET83fUAQTd8vV7JW9Sq7sy/7/pvXwN/N1CHEuLnsx4F58Am5xcbTU+Ssn
         /vHs0Xam5LNkVGvBJJ6Ky76/gBKYsVb64eM/aZRisX8DpYnLDY0j297x1D83wN4SDESH
         PqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZudNU1j/GxZrYgiqrSmCxqZu+3g41iMiIQCkxkhVAY=;
        b=VmA34HSBMXV8EaSddD9ni/J3vxAyBWxuK0RS2TNN0yij6v+/VCaYpN4H+X+ll5i9Ef
         P/N7n2QXhdk5affdlaZ15v2ZllU7sWONFggrbJWze1P5Dj0nKi+Ylb9CBZSnTDJYQOTY
         9O9pKeNX+KKhZwSs2AYP/ak9k+Y6MYPjuKujm/rjwLtcaTeqghFExWlnlJOHnxlac2r8
         Ib1XsorOXHPL5FY28rl/Sbi2P8gnyicHmzjfrgUEPl7cIFVjEjHkOf6i5odqkkGrj+ns
         vWmpCqOpyyuSr34JVg7L6yIsJezLmdS2C6h5hkm1LE0x/1QqxvDAUkVa9/RsRyrJ7F8u
         MdGw==
X-Gm-Message-State: APjAAAWPgmFxDjPjVzQg2Dfs8/bcyN7RFOxvbuP2HlP/F/pcDwg1gMkm
        rwQdcsUKnYG7Wwp8h4ysMVY=
X-Google-Smtp-Source: APXvYqyhCJDT2p9yUG+p4vnlHW0qO1CJmu0Rv1esgppxvSv5rAQVvQCAD+ZHU3mFnj6W8b1RIhPu7w==
X-Received: by 2002:a17:90a:330f:: with SMTP id m15mr20053801pjb.24.1578895206878;
        Sun, 12 Jan 2020 22:00:06 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id u23sm12182518pfm.29.2020.01.12.22.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 22:00:06 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v3] media: allegro: add missed checks in allegro_open()
Date:   Mon, 13 Jan 2020 13:59:51 +0800
Message-Id: <20200113055951.8718-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

allegro_open() misses checks for v4l2_m2m_ctx_init() and results of
v4l2_ctrl_new* calls.
Add checks and error handlers to fix the problems.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v3:
  - Make code cleaner.
  - Add a check for handler->error.

 .../staging/media/allegro-dvt/allegro-core.c  | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 6f0cd0784786..e86001e42963 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -2270,15 +2270,12 @@ static int allegro_open(struct file *file)
 	struct allegro_channel *channel = NULL;
 	struct v4l2_ctrl_handler *handler;
 	u64 mask;
+	int ret;
 
 	channel = kzalloc(sizeof(*channel), GFP_KERNEL);
 	if (!channel)
 		return -ENOMEM;
 
-	v4l2_fh_init(&channel->fh, vdev);
-	file->private_data = &channel->fh;
-	v4l2_fh_add(&channel->fh);
-
 	init_completion(&channel->completion);
 
 	channel->dev = dev;
@@ -2328,6 +2325,11 @@ static int allegro_open(struct file *file)
 			V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
 			1, 32,
 			1, 1);
+	if (handler->error != 0) {
+		ret = handler->error;
+		goto error;
+	}
+
 	channel->fh.ctrl_handler = handler;
 
 	channel->mcu_channel_id = -1;
@@ -2341,7 +2343,21 @@ static int allegro_open(struct file *file)
 	channel->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, channel,
 						allegro_queue_init);
 
+	if (IS_ERR(channel->fh.m2m_ctx)) {
+		ret = PTR_ERR(channel->fh.m2m_ctx);
+		goto error;
+	}
+
+	v4l2_fh_init(&channel->fh, vdev);
+	file->private_data = &channel->fh;
+	v4l2_fh_add(&channel->fh);
+
 	return 0;
+
+error:
+	v4l2_ctrl_handler_free(handler);
+	kfree(channel);
+	return ret;
 }
 
 static int allegro_release(struct file *file)
-- 
2.24.1

