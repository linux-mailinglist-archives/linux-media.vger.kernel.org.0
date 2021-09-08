Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41039403A36
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhIHNEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235230AbhIHNE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:04:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B8EC061575
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxES-0004mI-LB; Wed, 08 Sep 2021 15:03:16 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-0004SA-ME; Wed, 08 Sep 2021 15:03:15 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-00DpG5-LO; Wed, 08 Sep 2021 15:03:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 2/6] media: allegro: fix module removal if initialization failed
Date:   Wed,  8 Sep 2021 15:03:11 +0200
Message-Id: <20210908130315.3295253-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908130315.3295253-1-m.tretter@pengutronix.de>
References: <20210908130315.3295253-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the module probe finished, but the firmware initialization failed,
removing the module must not revert the firmware initialization.

Add a field to track the status of the firmware initialization and only
roll it back, if the firmware was successfully initialized.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c   | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 14a119b43bca..89d6de6082f6 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -142,6 +142,7 @@ struct allegro_dev {
 	struct allegro_buffer suballocator;
 
 	struct completion init_complete;
+	bool initialized;
 
 	/* The mailbox interface */
 	struct allegro_mbox *mbox_command;
@@ -3632,6 +3633,8 @@ static void allegro_fw_callback(const struct firmware *fw, void *context)
 		 "allegro codec registered as /dev/video%d\n",
 		 dev->video_dev.num);
 
+	dev->initialized = true;
+
 	release_firmware(fw_codec);
 	release_firmware(fw);
 
@@ -3678,6 +3681,8 @@ static int allegro_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
+	dev->initialized = false;
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
 	if (!res) {
 		dev_err(&pdev->dev,
@@ -3748,11 +3753,13 @@ static int allegro_remove(struct platform_device *pdev)
 {
 	struct allegro_dev *dev = platform_get_drvdata(pdev);
 
-	video_unregister_device(&dev->video_dev);
-	if (dev->m2m_dev)
-		v4l2_m2m_release(dev->m2m_dev);
-	allegro_mcu_hw_deinit(dev);
-	allegro_free_fw_codec(dev);
+	if (dev->initialized) {
+		video_unregister_device(&dev->video_dev);
+		if (dev->m2m_dev)
+			v4l2_m2m_release(dev->m2m_dev);
+		allegro_mcu_hw_deinit(dev);
+		allegro_free_fw_codec(dev);
+	}
 
 	v4l2_device_unregister(&dev->v4l2_dev);
 
-- 
2.30.2

